Return-Path: <joshua.g.lock@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id CDA6D77228
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Feb 2016 14:52:35 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga104.fm.intel.com with ESMTP; 24 Feb 2016 06:52:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,494,1449561600"; d="scan'208";a="893685959"
Received: from jlock-mobl1.gar.corp.intel.com ([10.252.7.109])
	by orsmga001.jf.intel.com with ESMTP; 24 Feb 2016 06:52:34 -0800
From: Joshua Lock <joshua.g.lock@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 24 Feb 2016 14:52:06 +0000
Message-Id: <971c0d25fa2239884b0f99fa1fa1423305d14896.1456325292.git.joshua.g.lock@intel.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1456325292.git.joshua.g.lock@intel.com>
References: <cover.1456325292.git.joshua.g.lock@intel.com>
In-Reply-To: <cover.1456325292.git.joshua.g.lock@intel.com>
References: <cover.1456325292.git.joshua.g.lock@intel.com>
Subject: [PATCH 02/10] swupd-server: initial recipe 2.53
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 24 Feb 2016 14:52:36 -0000

Include some patches to remove hard-coded state directory and backport some
fixes.

Signed-off-by: Joshua Lock <joshua.g.lock@intel.com>
---
 ...S-to-take-the-state-data-dir-as-an-argume.patch | 782 +++++++++++++++++++++
 ...argv-helper-for-safer-calls-to-system-uti.patch | 133 ++++
 ...re-option-to-re-enable-config-files-in-ma.patch |  66 ++
 ...ression-that-introduced-a-directory-named.patch |  29 +
 meta/recipes-devtools/swupd/swupd-server_2.53.bb   |  33 +
 5 files changed, 1043 insertions(+)
 create mode 100644 meta/recipes-devtools/swupd/swupd-server/0001-Add-option-S-to-take-the-state-data-dir-as-an-argume.patch
 create mode 100644 meta/recipes-devtools/swupd/swupd-server/0001-Add-system_argv-helper-for-safer-calls-to-system-uti.patch
 create mode 100644 meta/recipes-devtools/swupd/swupd-server/0002-Add-configure-option-to-re-enable-config-files-in-ma.patch
 create mode 100644 meta/recipes-devtools/swupd/swupd-server/0002-Fix-regression-that-introduced-a-directory-named.patch
 create mode 100644 meta/recipes-devtools/swupd/swupd-server_2.53.bb

diff --git a/meta/recipes-devtools/swupd/swupd-server/0001-Add-option-S-to-take-the-state-data-dir-as-an-argume.patch b/meta/recipes-devtools/swupd/swupd-server/0001-Add-option-S-to-take-the-state-data-dir-as-an-argume.patch
new file mode 100644
index 0000000..b771e0a
--- /dev/null
+++ b/meta/recipes-devtools/swupd/swupd-server/0001-Add-option-S-to-take-the-state-data-dir-as-an-argume.patch
@@ -0,0 +1,782 @@
+From 83fbb8a78594cf9047e37ed0aa1e931b9d691f2a Mon Sep 17 00:00:00 2001
+From: Joshua Lock <joshua.g.lock@intel.com>
+Date: Thu, 28 Jan 2016 10:24:56 +0000
+Subject: [PATCH 1/2] Add option -S to take the state data dir as an argument
+
+The optional -S option expects a full path to a directory
+swupd-server should use instead of the default /var/lib/update.
+
+Signed-off-by: Joshua Lock <joshua.g.lock@intel.com>
+
+Upstream-Status: Accepted (v3.0+)
+
+---
+ include/swupd.h      | 11 ++++++---
+ src/analyze_fs.c     |  4 ++--
+ src/chroot.c         | 13 ++++++-----
+ src/globals.c        | 53 +++++++++++++++++++++++++++++++++++++++++
+ src/main.c           | 50 ++++++++++++++++++++++++++++++---------
+ src/make_fullfiles.c | 63 +++++++++++++++++++++++++++++++++++++++++++++----
+ src/make_packs.c     | 66 ++++++++++++++++++++++++++++++++++++++++++++--------
+ src/pack.c           | 65 +++++++++++++++++++++++++++------------------------
+ src/rename.c         |  6 ++---
+ src/versions.c       |  6 ++---
+ 10 files changed, 264 insertions(+), 73 deletions(-)
+
+diff --git a/include/swupd.h b/include/swupd.h
+index 775c28e..58307d9 100644
+--- a/include/swupd.h
++++ b/include/swupd.h
+@@ -16,9 +16,6 @@
+ #define SWUPD_DEFAULT_FORMAT	3
+ 
+ #define SWUPD_SERVER_STATE_DIR "/var/lib/update"
+-#define PACKSTAGE_DIR SWUPD_SERVER_STATE_DIR "/packstage"
+-#define IMAGE_DIR SWUPD_SERVER_STATE_DIR "/image"
+-#define STAGING_DIR SWUPD_SERVER_STATE_DIR "/www"
+ 
+ #if SWUPD_WITH_SELINUX
+ #define TAR_PERM_ATTR_ARGS "--preserve-permissions --xattrs --xattrs-include='*' --selinux"
+@@ -123,9 +120,17 @@ extern int newversion;
+ extern int minversion;
+ extern char *format_string;
+ 
++extern char *state_dir;
++extern char *packstage_dir;
++extern char *image_dir;
++extern char *staging_dir;
++
+ extern bool init_globals(void);
+ extern void free_globals(void);
+ extern bool set_format_string(char *);
++extern bool set_state_dir(char *);
++extern bool init_state_globals(void);
++extern void free_state_globals(void);
+ 
+ extern int file_sort_hash(gconstpointer a, gconstpointer b);
+ extern int file_sort_filename(gconstpointer a, gconstpointer b);
+diff --git a/src/analyze_fs.c b/src/analyze_fs.c
+index 2326237..fdc359a 100644
+--- a/src/analyze_fs.c
++++ b/src/analyze_fs.c
+@@ -389,7 +389,7 @@ struct manifest *full_manifest_from_directory(int version)
+ 
+ 	manifest = alloc_manifest(version, "full");
+ 
+-	string_or_die(&dir, "%s/%i/full", IMAGE_DIR, version);
++	string_or_die(&dir, "%s/%i/full", image_dir, version);
+ 
+ 	threadpool = g_thread_pool_new(get_hash, dir, 12, FALSE, NULL);
+ 
+@@ -413,7 +413,7 @@ struct manifest *sub_manifest_from_directory(char *component, int version)
+ 
+ 	manifest = alloc_manifest(version, component);
+ 
+-	string_or_die(&dir, "%s/%i/%s", IMAGE_DIR, version, component);
++	string_or_die(&dir, "%s/%i/%s", image_dir, version, component);
+ 
+ 	iterate_directory(manifest, dir, "", false);
+ 
+diff --git a/src/chroot.c b/src/chroot.c
+index 1d7df95..c5bb942 100644
+--- a/src/chroot.c
++++ b/src/chroot.c
+@@ -40,14 +40,15 @@ void chroot_create_full(int newversion)
+ 	char * command;
+ 	char *full_dir;
+ 
+-	string_or_die(&full_dir, "%s/%i/full/", IMAGE_DIR, newversion);
++	string_or_die(&full_dir, "%s/%i/full/ ", image_dir, newversion);
+ 
+ 	g_mkdir_with_parents(full_dir, S_IRWXU);
+ 
+ 
+ 	/* start with base */
+ 	LOG(NULL, "Copying chroot os-core to full", "");
+-	string_or_die(&command, "rsync -aAX " IMAGE_DIR "/%i/os-core/ %s", newversion, full_dir);
++	string_or_die(&command, "rsync -aAX %s/%i/os-core/ %s",
++	              image_dir, newversion, full_dir);
+ 	ret = system(command);
+ 	assert(ret==0);
+ 	free(command);
+@@ -60,8 +61,8 @@ void chroot_create_full(int newversion)
+ 		}
+ 
+ 		LOG(NULL, "Overlaying bundle chroot onto full", "%s", group);
+-		string_or_die(&command, "rsync -aAX --ignore-existing " IMAGE_DIR "/%i/%s/ %s",
+-		             newversion, group, full_dir);
++		string_or_die(&command, "rsync -aAX --ignore-existing %s/%i/%s/ %s",
++		             image_dir, newversion, group, full_dir);
+ 		ret = system(command);
+ 		assert(ret==0);
+ 		free(command);
+@@ -80,8 +81,8 @@ void chroot_create_full(int newversion)
+ 		}
+ 
+ 		LOG(NULL, "Recopy bundle chroot out of full", "%s", group);
+-		string_or_die(&command, "rsync -aAX --existing %s " IMAGE_DIR "/%i/%s",
+-		             full_dir, newversion, group);
++		string_or_die(&command, "rsync -aAX --existing %s %s/%i/%s",
++		             full_dir, image_dir, newversion, group);
+ 		ret = system(command);
+ 		assert(ret==0);
+ 		free(command);
+diff --git a/src/globals.c b/src/globals.c
+index 32dc793..ff6a3fa 100644
+--- a/src/globals.c
++++ b/src/globals.c
+@@ -34,6 +34,11 @@ int newversion = -1;
+ int minversion = 0;
+ char *format_string = NULL;
+ 
++char *state_dir = NULL;
++char *packstage_dir = NULL;
++char *image_dir = NULL;
++char *staging_dir = NULL;
++
+ bool set_format_string(char *userinput)
+ {
+ 	int version;
+@@ -52,12 +57,36 @@ bool set_format_string(char *userinput)
+ 	return true;
+ }
+ 
++bool set_state_dir(char *dir)
++{
++	if (dir == NULL || dir[0] == '\0') {
++		return false;
++	}
++
++	/* TODO: more validation of input? */
++	if (dir[0] != '/') {
++		printf("statedir must be a full path starting with '/', not '%c'\n", dir[0]);
++		return false;
++	}
++
++	if (state_dir) {
++		free(state_dir);
++	}
++	string_or_die(&state_dir, "%s", dir);
++
++	return true;
++}
++
+ bool init_globals(void)
+ {
+ 	if (format_string == NULL) {
+ 		string_or_die(&format_string, "%d", SWUPD_DEFAULT_FORMAT);
+ 	}
+ 
++	if (!init_state_globals()) {
++		return false;
++	}
++
+ 	if (newversion == -1) {
+ 		printf("Missing version parameter: No new version number specified\n");
+ 		return false;
+@@ -71,4 +100,28 @@ bool init_globals(void)
+ void free_globals(void)
+ {
+ 	free(format_string);
++	free(state_dir);
++	free(packstage_dir);
++	free(image_dir);
++	free(staging_dir);
++}
++
++bool init_state_globals(void)
++{
++	if (state_dir == NULL) {
++		string_or_die(&state_dir, "%s", SWUPD_SERVER_STATE_DIR);
++	}
++	string_or_die(&packstage_dir, "%s/%s", state_dir, "packstage");
++	string_or_die(&image_dir, "%s/%s", state_dir, "image");
++	string_or_die(&staging_dir, "%s/%s", state_dir, "www");
++
++	return true;
++}
++
++void free_state_globals(void)
++{
++	free(state_dir);
++	free(packstage_dir);
++	free(image_dir);
++	free(staging_dir);
+ }
+diff --git a/src/main.c b/src/main.c
+index 7ed71d5..3d5f24a 100644
+--- a/src/main.c
++++ b/src/main.c
+@@ -55,6 +55,7 @@ static const struct option prog_opts[] = {
+ 	{"minversion", required_argument, 0, 'm'},
+ 	{"format", required_argument, 0, 'F'},
+ 	{"getformat", no_argument, 0, 'g'},
++	{"statedir", required_argument, 0, 'S'},
+ 	{0, 0, 0, 0}
+ };
+ 
+@@ -70,6 +71,7 @@ static void print_help(const char *name) {
+ 	printf("   -m, --minversion        Optional minimum file version to write into manifests per file\n");
+ 	printf("   -F, --format            Optional format string [ default:=%d ]\n", SWUPD_DEFAULT_FORMAT);
+ 	printf("   -g, --getformat         Print current format string and exit\n");
++	printf("   -S, --statedir          Optional directory to use for state [ default:=%s ]\n", SWUPD_SERVER_STATE_DIR);
+ 	printf("\n");
+ }
+ 
+@@ -77,7 +79,7 @@ static bool parse_options(int argc, char **argv)
+ {
+ 	int opt;
+ 
+-	while ((opt = getopt_long(argc, argv, "hvo:m:F:g", prog_opts, NULL)) != -1) {
++	while ((opt = getopt_long(argc, argv, "hvo:m:F:g:S:", prog_opts, NULL)) != -1) {
+ 		switch (opt) {
+ 		case '?':
+ 		case 'h':
+@@ -107,6 +109,12 @@ static bool parse_options(int argc, char **argv)
+ 				return false;
+ 			}
+ 			break;
++		case 'S':
++			if (!optarg || !set_state_dir(optarg)) {
++				printf("Invalid --statedir argument ''%s'\n\n", optarg);
++				return false;
++			}
++			break;
+ 		case 'g':
+ 			if (format_string == NULL) {
+ 				printf("%d\n", SWUPD_DEFAULT_FORMAT);
+@@ -138,9 +146,14 @@ static void check_root(void)
+ static void populate_dirs(int version)
+ {
+ 	char *newversiondir;
+-	string_or_die(&newversiondir, "%s/%d", IMAGE_DIR, version);
++
++	string_or_die(&newversiondir, "%s/%d", image_dir, version);
+ 
+ 	if ((access(newversiondir, F_OK | R_OK) != 0) && (version == 0)) {
++		char *latestpath = NULL;
++
++		string_or_die(&latestpath, "%s/latest.version", image_dir);
++
+ 		printf("** %s does not exist... creating and populating\n", newversiondir);
+ 		if (mkdir(newversiondir, 0755) != 0) {
+ 			printf("Failed to create directory\n");
+@@ -151,14 +164,17 @@ static void populate_dirs(int version)
+ 		}
+ 
+ 		FILE *latestver;
+-		latestver = fopen_exclusive(IMAGE_DIR "/latest.version");
++		latestver = fopen_exclusive(latestpath);
+ 		if (latestver == NULL) {
+-			printf("Failed to create %s/latest.version\n", IMAGE_DIR);
++			printf("Failed to create %s\n", latestpath);
++			free(latestpath);
+ 			return;
+ 		}
+ 		if (fwrite("0\n", 2, 1, latestver) != 1) {
+ 			LOG(NULL, "Failed to write latestver", "errno: %d", errno);
+ 		}
++
++		free(latestpath);
+ 		fclose(latestver);
+ 	}
+ 	/* groups don't exist in version 0 */
+@@ -170,7 +186,7 @@ static void populate_dirs(int version)
+ 				break;
+ 			}
+ 
+-			string_or_die(&newversiondir, "%s/%d/%s", IMAGE_DIR, version, group);
++			string_or_die(&newversiondir, "%s/%d/%s", image_dir, version, group);
+ 
+ 			/* Create the bundle directory(s) as needed */
+ 			if (access(newversiondir, F_OK | R_OK) != 0) {
+@@ -186,13 +202,18 @@ static void populate_dirs(int version)
+ 
+ static int check_build_env(void)
+ {
+-	if (access(SWUPD_SERVER_STATE_DIR "/temp", F_OK | R_OK) != 0) {
+-		LOG(NULL, "/var/lib/update/temp does not exist...creating directory", "");
+-		if (mkdir(SWUPD_SERVER_STATE_DIR "/temp", 0755) != 0) {
++	char *temp_dir = NULL;
++	string_or_die(&temp_dir, "%s/%s", state_dir, "/temp");
++
++	if (access(temp_dir, F_OK | R_OK) != 0) {
++		LOG(NULL, "%s", "does not exist...creating directory", temp_dir);
++		if (mkdir(temp_dir, 0755) != 0) {
+ 			printf("Failed to create build directory, EXITING\n");
++			free(temp_dir);
+ 			return -errno;
+ 		}
+ 	}
++	free(temp_dir);
+ 
+ 	return 0;
+ }
+@@ -217,6 +238,8 @@ int main(int argc, char **argv)
+ 	int exit_status = EXIT_FAILURE;
+ 	int ret;
+ 
++	char *file_path = NULL;
++
+ 	/* keep valgrind working well */
+ 	setenv("G_SLICE", "always-malloc", 0);
+ 
+@@ -240,12 +263,17 @@ int main(int argc, char **argv)
+ 	}
+ 
+ 
+-	if (!read_configuration_file(SWUPD_SERVER_STATE_DIR "/server.ini")) {
+-		printf("Failed to read " SWUPD_SERVER_STATE_DIR "/server.ini configuration file!\n");
++	string_or_die(&file_path, "%s/server.ini", state_dir);
++	if (!read_configuration_file(file_path)) {
++		printf("Failed to read %s configuration file!\n", state_dir);
++		free(file_path);
+ 		goto exit;
+ 	}
++	free(file_path);
+ 
+-	read_group_file(SWUPD_SERVER_STATE_DIR "/groups.ini");
++	string_or_die(&file_path, "%s/groups.ini", state_dir);
++	read_group_file(file_path);
++	free(file_path);
+ 
+ 	read_current_version("latest.version");
+ 	printf("Last processed version is %i\n", current_version);
+diff --git a/src/make_fullfiles.c b/src/make_fullfiles.c
+index e755a33..bf97a1c 100644
+--- a/src/make_fullfiles.c
++++ b/src/make_fullfiles.c
+@@ -27,8 +27,52 @@
+ #include <string.h>
+ #include <assert.h>
+ 
++#include <getopt.h>
++
+ #include <swupd.h>
+ 
++static const struct option prog_opts[] = {
++	{"help", no_argument, 0, 'h'},
++	{"statedir", required_argument, 0, 'S'},
++	{0, 0, 0, 0}
++};
++
++static void usage(const char *name)
++{
++	printf("usage:\n");
++	printf("   %s <version>\n\n", name);
++	printf("Help options:\n");
++	printf("   -h, --help              Show help options\n");
++	printf("   -S, --statedir          Optional directory to use for state [ default:=%s ]\n", SWUPD_SERVER_STATE_DIR);
++	printf("\n");
++}
++
++static bool parse_options(int argc, char **argv)
++{
++	int opt;
++
++	while ((opt = getopt_long(argc, argv, "hS:", prog_opts, NULL)) != -1) {
++		switch (opt) {
++			case '?':
++			case 'h':
++				usage(argv[0]);
++				return false;
++			case 'S':
++				if (!optarg || !set_state_dir(optarg)) {
++					printf("Invalid --statedir argument '%s'\n\n", optarg);
++					return false;
++				}
++				break;
++		}
++	}
++
++	if (!init_state_globals()) {
++		return false;
++	}
++
++	return true;
++}
++
+ static void banner(void)
+ {
+ 	printf(PACKAGE_NAME " update creator -- fullfiles -- version " PACKAGE_VERSION "\n");
+@@ -51,20 +95,29 @@ int main(int argc, char **argv)
+ {
+ 	struct manifest *manifest;
+ 	int version;
++	char *file_path = NULL;
+ 
+ 	/* keep valgrind working well */
+ 	setenv("G_SLICE", "always-malloc", 0);
+ 
++	if (!parse_options(argc, argv)) {
++		free_state_globals();
++		return EXIT_FAILURE;
++	}
+ 	banner();
+ 	check_root();
+ 
+-	read_configuration_file(SWUPD_SERVER_STATE_DIR "/server.ini");
++	string_or_die(&file_path, "%s/server.ini", state_dir);
++	read_configuration_file(file_path);
++	free(file_path);
+ 
+-	if (argc < 1) {
+-		printf("Usage:\n\tswupd_make_fullfiles <version>\n\n");
++	if (argc - optind < 1) {
++		usage(argv[0]);
++		free_state_globals();
+ 		exit(EXIT_FAILURE);
+ 	}
+-	version = strtoull(argv[1], NULL, 10);
++
++	version = strtoull(argv[optind++], NULL, 10);
+ 	if (version < 0) {
+ 		printf("Usage:\n\tswupd_make_fullfiles <version>\n\n");
+ 		exit(EXIT_FAILURE);
+@@ -73,5 +126,7 @@ int main(int argc, char **argv)
+ 	manifest = manifest_from_file(version, "full");
+ 	create_fullfiles(manifest);
+ 
++	free_state_globals();
++
+ 	return EXIT_SUCCESS;
+ }
+diff --git a/src/make_packs.c b/src/make_packs.c
+index 20fbd67..2b62b8a 100644
+--- a/src/make_packs.c
++++ b/src/make_packs.c
+@@ -33,6 +33,8 @@
+ 
+ #include <glib.h>
+ 
++#include <getopt.h>
++
+ #include <swupd.h>
+ 
+ static void banner(void)
+@@ -43,12 +45,47 @@ static void banner(void)
+ 	printf("\n");
+ }
+ 
+-static void usage(void)
++static const struct option prog_opts[] = {
++	{"help", no_argument, 0, 'h'},
++	{"statedir", required_argument, 0, 'S'},
++	{0, 0, 0, 0}
++};
++
++static void usage(const char *name)
+ {
+ 	printf("usage:\n");
+-	printf("   swupd_make_pack <start version> <latest version> <bundle>\n");
++	printf("   %s <start version> <latest version> <bundle>\n\n", name);
++	printf("Help options:\n");
++	printf("   -h, --help              Show help options\n");
++	printf("   -S, --statedir          Optional directory to use for state [ default:=%s ]\n", SWUPD_SERVER_STATE_DIR);
+ 	printf("\n");
+-	exit(EXIT_FAILURE);
++}
++
++static bool parse_options(int argc, char **argv)
++{
++	int opt;
++
++	while ((opt = getopt_long(argc, argv, "hS:", prog_opts, NULL)) != -1) {
++		switch (opt) {
++		case '?':
++		case 'h':
++			usage(argv[0]);
++			return false;
++		case 'S':
++			if (!optarg || !set_state_dir(optarg)) {
++				printf("Invalid --statedir argument ''%s'\n\n", optarg);
++				return false;
++			}
++			break;
++		}
++	}
++
++	/* FIXME: *_state_globals() are ugly hacks */
++	if (!init_state_globals()) {
++		return false;
++	}
++
++	return true;
+ }
+ 
+ int main(int argc, char **argv)
+@@ -59,11 +96,17 @@ int main(int argc, char **argv)
+ 	char *module;
+ 	struct packdata *pack;
+ 	int exit_status = EXIT_FAILURE;
++	char *file_path = NULL;
+ 
++	if (!parse_options(argc, argv)) {
++		free_state_globals();
++		return EXIT_FAILURE;
++	}
+ 	banner();
+ 
+-	if (argc != 4) {
+-		usage();
++	if (argc - optind != 3) {
++		usage(argv[0]);
++		exit(EXIT_FAILURE);
+ 	}
+ 
+ 	/* FIXME: should use "end_version" not "0" and a unique filename
+@@ -76,12 +119,13 @@ int main(int argc, char **argv)
+ 		return exit_status;
+ 	}
+ 
+-	read_configuration_file(SWUPD_SERVER_STATE_DIR "/server.ini");
+-
++	string_or_die(&file_path, "%s/server.ini", state_dir);
++	read_configuration_file(file_path);
++	free(file_path);
+ 
+-	start_version = strtoull(argv[1], NULL, 10);
+-	end_version = strtoull(argv[2], NULL, 10);
+-	module = argv[3];
++	start_version = strtoull(argv[optind++], NULL, 10);
++	end_version = strtoull(argv[optind++], NULL, 10);
++	module = argv[optind++];
+ 
+ 	if ((start_version < 0) ||
+ 	    (end_version == 0) ||
+@@ -108,5 +152,7 @@ int main(int argc, char **argv)
+ 	printf("Pack creation %s (pack-%s %i to %li)\n",
+ 		exit_status == EXIT_SUCCESS ? "complete" : "failed",
+ 		module, start_version, end_version);
++
++	free_state_globals();
+ 	return exit_status;
+ }
+diff --git a/src/pack.c b/src/pack.c
+index e96e9a4..036853f 100644
+--- a/src/pack.c
++++ b/src/pack.c
+@@ -46,21 +46,21 @@ static void empty_pack_stage(int full, int version, char *module)
+ 	int ret;
+ 
+ 	// clean any stale data (eg: re-run after a failure)
+-	string_or_die(&cmd, "rm -rf " PACKSTAGE_DIR "/%s/%i/", module, version);
++	string_or_die(&cmd, "rm -rf %s/%s/%i/", packstage_dir, module, version);
+ 	ret = system(cmd);
+ 	if (ret) {
+-		fprintf(stderr, "Failed to clean " PACKSTAGE_DIR "/%s/%i\n",
+-			module, version);
++		fprintf(stderr, "Failed to clean %s/%s/%i\n",
++			packstage_dir, module, version);
+ 		exit(EXIT_FAILURE);
+ 	}
+ 	free(cmd);
+ 
+ 	if (!full) {
+ 		// (re)create module/version/{delta,staged}
+-		string_or_die(&path, PACKSTAGE_DIR "/%s/%i/delta", module, version);
++		string_or_die(&path, "%s/%s/%i/delta", packstage_dir, module, version);
+ 		g_mkdir_with_parents(path, S_IRWXU | S_IRWXG);
+ 		free(path);
+-		string_or_die(&path, PACKSTAGE_DIR "/%s/%i/staged", module, version);
++		string_or_die(&path, "%s/%s/%i/staged", packstage_dir, module, version);
+ 		g_mkdir_with_parents(path, S_IRWXU | S_IRWXG);
+ 		free(path);
+ 	}
+@@ -76,7 +76,7 @@ static void explode_pack_stage(int version, char *module)
+ 	struct stat buf;
+ 	char *path;
+ 
+-	string_or_die(&path, PACKSTAGE_DIR "/%s/%i/staged", module, version);
++	string_or_die(&path, "%s/%s/%i/staged", packstage_dir, module, version);
+ 	g_mkdir_with_parents(path, S_IRWXU | S_IRWXG);
+ 	dir = opendir(path);
+ 	if (!dir) {
+@@ -99,7 +99,8 @@ static void explode_pack_stage(int version, char *module)
+ 			continue;
+ 		}
+ 
+-		string_or_die(&path, PACKSTAGE_DIR "/%s/%i/staged/%s", module, version, entry->d_name);
++		string_or_die(&path, "%s/%s/%i/staged/%s",
++		              packstage_dir, module, version, entry->d_name);
+ 		ret = stat(path, &buf);
+ 		if (ret) {
+ 			free(path);
+@@ -112,8 +113,8 @@ static void explode_pack_stage(int version, char *module)
+ 		 * the resulting pack is slightly smaller, and in addition, we're saving CPU
+ 		 * time on the client...
+ 		 */
+-		string_or_die(&tar, "tar --directory=" PACKSTAGE_DIR "/%s/%i/staged --warning=no-timestamp "
+-				TAR_PERM_ATTR_ARGS " -axf %s", module, version, path);
++		string_or_die(&tar, "tar --directory=%s/%s/%i/staged --warning=no-timestamp "
++				TAR_PERM_ATTR_ARGS " -axf %s", packstage_dir, module, version, path);
+ 		ret = system(tar);
+ 		if (!ret) {
+ 			unlink(path);
+@@ -162,8 +163,8 @@ static void make_pack_full_files(struct packdata *pack)
+ 		if ((!file->peer || file->peer->is_deleted) && !file->is_deleted && !file->rename_peer) {
+ 			char *from, *to;
+ 			/* hardlink each file that is in <end> but not in <X> */
+-			string_or_die(&from, STAGING_DIR "/%i/files/%s.tar", file->last_change, file->hash);
+-			string_or_die(&to, PACKSTAGE_DIR "/%s/%i/staged/%s.tar", pack->module, pack->from, file->hash);
++			string_or_die(&from, "%s/%i/files/%s.tar", staging_dir, file->last_change, file->hash);
++			string_or_die(&to, "%s/%s/%i/staged/%s.tar", packstage_dir, pack->module, pack->from, file->hash);
+ 			ret = link(from, to);
+ 			if (ret) {
+ 				if (errno != EEXIST) {
+@@ -228,8 +229,8 @@ static GList *consolidate_packs_delta_files(GList *files, struct packdata *pack)
+ 			continue;
+ 		}
+ 
+-		string_or_die(&from, STAGING_DIR "/%i/delta/%i-%i-%s", file->last_change,
+-				file->peer->last_change, file->last_change, file->hash);
++		string_or_die(&from, "%s/%i/delta/%i-%i-%s", staging_dir, file->last_change,
++		              file->peer->last_change, file->last_change, file->hash);
+ 
+ 		ret = stat(from, &stat_delta);
+ 		if (ret && !find_file_in_list(files, file)) {
+@@ -284,8 +285,8 @@ static int write_pack_signature(struct packdata *pack)
+ 	char *filename = NULL;
+ 	int ret = -1;
+ 
+-	string_or_die(&filename, STAGING_DIR "/%i/pack-%s-from-%i.tar",
+-			pack->to, pack->module, pack->from);
++	string_or_die(&filename, "%s/%i/pack-%s-from-%i.tar",
++			staging_dir, pack->to, pack->module, pack->from);
+ 	if (!signature_sign(filename)) {
+ 		fprintf(stderr, "Creating signature for '%s' failed\n", filename);
+ 		goto exit;
+@@ -324,12 +325,14 @@ static int make_final_pack(struct packdata *pack)
+ 
+ 		/* for each file changed since <X> */
+ 		/* locate delta, check if the diff it's from is >= <X> */
+-		string_or_die(&from, STAGING_DIR "/%i/delta/%i-%i-%s", file->last_change,
+-				file->peer->last_change, file->last_change, file->hash);
+-		string_or_die(&to, PACKSTAGE_DIR "/%s/%i/delta/%i-%i-%s", pack->module, pack->from,
++		string_or_die(&from, "%s/%i/delta/%i-%i-%s", staging_dir, file->last_change,
+ 				file->peer->last_change, file->last_change, file->hash);
+-		string_or_die(&tarfrom, STAGING_DIR "/%i/files/%s.tar", file->last_change, file->hash);
+-		string_or_die(&tarto, PACKSTAGE_DIR "/%s/%i/staged/%s.tar", pack->module, pack->from, file->hash);
++		string_or_die(&to, "%s/%s/%i/delta/%i-%i-%s", packstage_dir, pack->module,
++				pack->from, file->peer->last_change, file->last_change, file->hash);
++		string_or_die(&tarfrom, "%s/%i/files/%s.tar", staging_dir,
++				file->last_change, file->hash);
++		string_or_die(&tarto, "%s/%s/%i/staged/%s.tar", packstage_dir, pack->module,
++				pack->from, file->hash);
+ 
+ 		ret = stat(from, &stat_delta);
+ 		if (ret) {
+@@ -388,8 +391,8 @@ static int make_final_pack(struct packdata *pack)
+ 		char *from, *to;
+ 		struct stat st;
+ 
+-		string_or_die(&from, STAGING_DIR "/%i/Manifest-%s-delta-from-%i",
+-				pack->to, pack->module, pack->from);
++		string_or_die(&from, "%s/%i/Manifest-%s-delta-from-%i",
++				staging_dir, pack->to, pack->module, pack->from);
+ 
+ 		ret = stat(from, &st);
+ 		if (ret) {
+@@ -398,8 +401,8 @@ static int make_final_pack(struct packdata *pack)
+ 		}
+ 
+ 
+-		string_or_die(&to, PACKSTAGE_DIR "/%s/%i/Manifest-%s-delta-from-%i",
+-				pack->module, pack->from, pack->module, pack->from);
++		string_or_die(&to, "%s/%s/%i/Manifest-%s-delta-from-%i",
++				packstage_dir, pack->module, pack->from, pack->module, pack->from);
+ 
+ 		ret = link(from, to);
+ 		if (ret) {
+@@ -416,16 +419,16 @@ static int make_final_pack(struct packdata *pack)
+ 		char *from, *to;
+ 		struct stat st;
+ 
+-		string_or_die(&from, STAGING_DIR "/%i/Manifest-%s-delta-from-%i",
+-				pack->to, "MoM", pack->from);
++		string_or_die(&from, "%s/%i/Manifest-%s-delta-from-%i",
++				staging_dir, pack->to, "MoM", pack->from);
+ 		ret = stat(from, &st);
+ 		if (ret) {
+ 			LOG(NULL, "Making extra manifest delta", "MoM: %i->%i", pack->from, pack->to);
+ 			create_manifest_delta(pack->from, pack->to, "MoM");
+ 		}
+ 
+-		string_or_die(&to, PACKSTAGE_DIR "/%s/%i/Manifest-%s-delta-from-%i",
+-				pack->module, pack->from, "MoM", pack->from);
++		string_or_die(&to, "%s/%s/%i/Manifest-%s-delta-from-%i",
++				packstage_dir, pack->module, pack->from, "MoM", pack->from);
+ 
+ 		ret = link(from, to);
+ 		if (ret) {
+@@ -439,9 +442,9 @@ static int make_final_pack(struct packdata *pack)
+ 
+ 	/* tar the staging directory up */
+ 	LOG(NULL, "starting tar for pack", "%s: %i to %i", pack->module, pack->from, pack->to);
+-	string_or_die(&tar, "tar " TAR_PERM_ATTR_ARGS " --directory=" PACKSTAGE_DIR "/%s/%i/ "
+-			"--numeric-owner -Jcf " STAGING_DIR "/%i/pack-%s-from-%i.tar delta staged",
+-			pack->module, pack->from, pack->to, pack->module, pack->from);
++	string_or_die(&tar, "tar " TAR_PERM_ATTR_ARGS " --directory=%s/%s/%i/ "
++			"--numeric-owner -Jcf %s/%i/pack-%s-from-%i.tar delta staged",
++			packstage_dir, pack->module, pack->from, staging_dir, pack->to, pack->module, pack->from);
+ 	ret = system(tar);
+ 	free(tar);
+ 	LOG(NULL, "finished tar for pack", "%s: %i to %i", pack->module, pack->from, pack->to);
+diff --git a/src/rename.c b/src/rename.c
+index 70f9006..5ea979c 100644
+--- a/src/rename.c
++++ b/src/rename.c
+@@ -153,7 +153,7 @@ static void precompute_file_data(struct manifest *manifest, struct file *file, i
+ 	}
+ 
+ 	if (manifest)  {
+-		string_or_die(&filename, "%s/%i/%s/%s", IMAGE_DIR, manifest->version, manifest->component, file->filename);
++		string_or_die(&filename, "%s/%i/%s/%s", image_dir, manifest->version, manifest->component, file->filename);
+ 	} else if (old_rename) {
+ 		item = g_list_first(last_versions_list);
+ 		while (item) {
+@@ -161,13 +161,13 @@ static void precompute_file_data(struct manifest *manifest, struct file *file, i
+ 			item = g_list_next(item);
+ 
+ 			free(filename);
+-			string_or_die(&filename, "%s/%i/full/%s", IMAGE_DIR, last_change, file->filename);
++			string_or_die(&filename, "%s/%i/full/%s", image_dir, last_change, file->filename);
+ 			if (!lstat(filename, &buf)) {
+ 				break;
+ 			}
+ 		}
+ 	} else {
+-		string_or_die(&filename, "%s/%i/full/%s", IMAGE_DIR, file->last_change, file->filename);
++		string_or_die(&filename, "%s/%i/full/%s", image_dir, file->last_change, file->filename);
+ 	}
+ 
+ 	/* make sure file->stat.st_size is valid */
+diff --git a/src/versions.c b/src/versions.c
+index 6860160..0fb729a 100644
+--- a/src/versions.c
++++ b/src/versions.c
+@@ -215,10 +215,10 @@ GList *get_last_versions_list(int next_version, int max_versions)
+ 	int idx, build_num, build_type, jump_point;
+ 	int jump_point_found;
+ 
+-	dir = opendir(STAGING_DIR);
++	dir = opendir(staging_dir);
+ 	if (dir == NULL) {
+ 		LOG(NULL, "Cannot open directory", "dir_path= %s, strerror= %s",
+-				STAGING_DIR, strerror(errno));
++				staging_dir, strerror(errno));
+ 		return NULL;
+ 	}
+ 
+@@ -228,7 +228,7 @@ GList *get_last_versions_list(int next_version, int max_versions)
+ 		}
+ 
+ 		free(filename);
+-		string_or_die(&filename, STAGING_DIR "/%s", entry.d_name);
++		string_or_die(&filename, "%s/%s", staging_dir, entry.d_name);
+ 
+ 		if (lstat(filename, &stat)) {
+ 			LOG(NULL, "lstat failed", "path= %s, strerror= %s",
+-- 
+2.5.0
+
diff --git a/meta/recipes-devtools/swupd/swupd-server/0001-Add-system_argv-helper-for-safer-calls-to-system-uti.patch b/meta/recipes-devtools/swupd/swupd-server/0001-Add-system_argv-helper-for-safer-calls-to-system-uti.patch
new file mode 100644
index 0000000..f94305e
--- /dev/null
+++ b/meta/recipes-devtools/swupd/swupd-server/0001-Add-system_argv-helper-for-safer-calls-to-system-uti.patch
@@ -0,0 +1,133 @@
+From 8f24ef7f857c9d2c2eb2601a2a1e06123c086001 Mon Sep 17 00:00:00 2001
+From: Dmitry Rozhkov <dmitry.rozhkov@intel.com>
+Date: Fri, 29 Jan 2016 17:48:46 +0200
+Subject: [PATCH swupd-server 1/2] Add system_argv() helper for safer calls to
+ system utilities
+
+Often file names contain special characters like hashes or
+whitespaces and that makes escaping a difficult task when using
+system(). Thus add a new helper system_argv() that is based
+on execvp() syscall and doesn't require escaping.
+
+Signed-off-by: Dmitry Rozhkov <dmitry.rozhkov@intel.com>
+
+Upstream-Status: Backport (v2.54+)
+
+---
+ include/swupd.h |  1 +
+ src/fullfiles.c |  6 ++----
+ src/helpers.c   | 63 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++
+ 3 files changed, 66 insertions(+), 4 deletions(-)
+
+diff --git a/include/swupd.h b/include/swupd.h
+index 00b88d4..2805186 100644
+--- a/include/swupd.h
++++ b/include/swupd.h
+@@ -223,6 +223,7 @@ extern FILE * fopen_exclusive(const char *filename); /* no mode, opens for write
+ extern void dump_file_info(struct file *file);
+ extern void string_or_die(char **strp, const char *fmt, ...);
+ extern void print_elapsed_time(struct timeval *previous_time, struct timeval *current_time);
++extern int system_argv(char *const argv[]);
+ 
+ extern bool signature_initialize(void);
+ extern void signature_terminate(void);
+diff --git a/src/fullfiles.c b/src/fullfiles.c
+index 1bb581e..fa78293 100644
+--- a/src/fullfiles.c
++++ b/src/fullfiles.c
+@@ -138,12 +138,10 @@ static void create_fullfile(struct file *file)
+ 		string_or_die(&tempfile, "%s/%s", empty, file->hash);
+ 		if (link(origin, tempfile) < 0) {
+ 			LOG(NULL, "hardlink failed", "%s due to %s (%s -> %s)", file->filename, strerror(errno), origin, tempfile);
+-			string_or_die(&tarcommand, "cp -a %s %s", origin, tempfile);
+-			if (system(tarcommand) != 0) {
+-				LOG(NULL, "Failed to run command:", "%s", tarcommand);
++			char *const argv[] = {"cp", "-a", origin, tempfile, NULL};
++			if (system_argv(argv) != 0) {
+ 				assert(0);
+ 			}
+-			free(tarcommand);
+ 		}
+ 
+ 		/* step 2a: tar it with each compression type  */
+diff --git a/src/helpers.c b/src/helpers.c
+index 65acffd..5884b51 100644
+--- a/src/helpers.c
++++ b/src/helpers.c
+@@ -29,6 +29,7 @@
+ #include <sys/types.h>
+ #include <sys/stat.h>
+ #include <sys/time.h>
++#include <sys/wait.h>
+ #include <fcntl.h>
+ #include <errno.h>
+ 
+@@ -124,3 +125,65 @@ void print_elapsed_time(struct timeval *previous_time, struct timeval *current_t
+ 
+ 	free(elapsed);
+ }
++
++void concat_str_array(char **output, char *const argv[])
++{
++	int size = 0;
++
++	for (int i = 0; argv[i]; i++) {
++		size += strlen(argv[i]) + 1;
++	}
++
++	*output = malloc(size + 1);
++	if (!*output) {
++		LOG(NULL, "Failed to allocate", "%i bytes", size);
++		assert(0);
++	}
++	strcpy(*output, "");
++	for (int i = 0; argv[i]; i++) {
++		strcat(*output, argv[i]);
++		strcat(*output, " ");
++	}
++}
++
++int system_argv(char *const argv[])
++{
++	int child_exit_status;
++	pid_t pid;
++	int status;
++
++	pid = fork();
++
++	if (pid == 0) { /* child */
++		execvp(*argv, argv);
++		LOG(NULL, "This line must not be reached", "");
++		assert(0);
++	} else if (pid < 0) {
++		LOG(NULL, "Failed to fork a child process", "");
++		assert(0);
++	} else {
++		pid_t ws = waitpid(pid, &child_exit_status, 0);
++
++		if (ws == -1) {
++			LOG(NULL, "Failed to wait for child process", "");
++			assert(0);
++		}
++
++		if (WIFEXITED(child_exit_status)) {
++			status = WEXITSTATUS(child_exit_status);
++		} else {
++			LOG(NULL, "Child process didn't exit", "");
++			assert(0);
++		}
++
++		if (status != 0) {
++			char* cmdline = NULL;
++
++			concat_str_array(&cmdline, argv);
++			LOG(NULL, "Failed to run command:", "%s", cmdline);
++			free(cmdline);
++		}
++
++		return status;
++	}
++}
+-- 
+2.5.0
+
diff --git a/meta/recipes-devtools/swupd/swupd-server/0002-Add-configure-option-to-re-enable-config-files-in-ma.patch b/meta/recipes-devtools/swupd/swupd-server/0002-Add-configure-option-to-re-enable-config-files-in-ma.patch
new file mode 100644
index 0000000..a5ab7af
--- /dev/null
+++ b/meta/recipes-devtools/swupd/swupd-server/0002-Add-configure-option-to-re-enable-config-files-in-ma.patch
@@ -0,0 +1,66 @@
+From e209255d8985eb4eb4c43f5e773ee1a0a16eb297 Mon Sep 17 00:00:00 2001
+From: Joshua Lock <joshua.g.lock@intel.com>
+Date: Fri, 12 Feb 2016 16:02:58 +0000
+Subject: [PATCH 2/2] Add configure option to re-enable config files in
+ manifests
+
+Signed-off-by: Joshua Lock <joshua.g.lock@intel.com>
+
+Upstream-Status: Accepted (v3.0+)
+
+---
+ configure.ac    | 6 ++++++
+ include/swupd.h | 6 ++++++
+ src/manifest.c  | 2 +-
+ 3 files changed, 13 insertions(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 8bb6e3b..afffad5 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -28,6 +28,12 @@ AC_ARG_ENABLE(
+     AC_DEFINE(SWUPD_WITH_LZMA,1,[Use lzma compression])
+ 	[enable_lzma=check]
+ )
++AC_ARG_ENABLE(
++    [stateless],
++    AS_HELP_STRING([--disable-stateless],[OS is not stateless, do not ignore configuration files (stateless by default)]),
++    AC_DEFINE(SWUPD_WITH_STATELESS,0,[OS is not stateless]),
++		AC_DEFINE(SWUPD_WITH_STATELESS,1,[OS is stateless])
++)
+ 
+ AS_IF([test "$enable_lzma" = "check"],
+ 	[PKG_CHECK_MODULES([lzma],
+diff --git a/include/swupd.h b/include/swupd.h
+index 58307d9..7cce735 100644
+--- a/include/swupd.h
++++ b/include/swupd.h
+@@ -23,6 +23,12 @@
+ #define TAR_PERM_ATTR_ARGS "--preserve-permissions --xattrs --xattrs-include='*'"
+ #endif
+ 
++#if SWUPD_WITH_STATELESS
++#define OS_IS_STATELESS 1
++#else
++#define OS_IS_STATELESS 0
++#endif
++
+ /* Build types */
+ #define REGULAR_BUILD 0
+ #define FIX_BUILD     1
+diff --git a/src/manifest.c b/src/manifest.c
+index 69a8fb9..58d0be1 100644
+--- a/src/manifest.c
++++ b/src/manifest.c
+@@ -830,7 +830,7 @@ int prune_manifest(struct manifest *manifest)
+ 		next = g_list_next(list);
+ 		file = list->data;
+ 
+-		if ((!file->is_deleted) && (file->is_config)) {
++		if (OS_IS_STATELESS && (!file->is_deleted) && (file->is_config)) {
+ 			// toward being a stateless OS
+ 			LOG(file, "Skipping config file in manifest write", "component %s", manifest->component);
+ 			manifest->files = g_list_delete_link(manifest->files, list);
+-- 
+2.5.0
+
diff --git a/meta/recipes-devtools/swupd/swupd-server/0002-Fix-regression-that-introduced-a-directory-named.patch b/meta/recipes-devtools/swupd/swupd-server/0002-Fix-regression-that-introduced-a-directory-named.patch
new file mode 100644
index 0000000..9c1d8fa
--- /dev/null
+++ b/meta/recipes-devtools/swupd/swupd-server/0002-Fix-regression-that-introduced-a-directory-named.patch
@@ -0,0 +1,29 @@
+From aba4418696ef31ab5afc9811903a044366619dc4 Mon Sep 17 00:00:00 2001
+From: Patrick McCarty <patrick.mccarty@intel.com>
+Date: Mon, 22 Feb 2016 22:07:08 -0800
+Subject: [PATCH 2/4] Fix regression that introduced a directory named '/ '
+
+Signed-off-by: Patrick McCarty <patrick.mccarty@intel.com>
+
+Upstream-Status: Backport (v3.0+)
+
+---
+ src/chroot.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/chroot.c b/src/chroot.c
+index f961d58..2878496 100644
+--- a/src/chroot.c
++++ b/src/chroot.c
+@@ -40,7 +40,7 @@ void chroot_create_full(int newversion)
+ 	char * command;
+ 	char *full_dir;
+ 
+-	string_or_die(&full_dir, "%s/%i/full/ ", image_dir, newversion);
++	string_or_die(&full_dir, "%s/%i/full/", image_dir, newversion);
+ 
+ 	g_mkdir_with_parents(full_dir, S_IRWXU);
+ 
+-- 
+2.5.0
+
diff --git a/meta/recipes-devtools/swupd/swupd-server_2.53.bb b/meta/recipes-devtools/swupd/swupd-server_2.53.bb
new file mode 100644
index 0000000..fdbd39b
--- /dev/null
+++ b/meta/recipes-devtools/swupd/swupd-server_2.53.bb
@@ -0,0 +1,33 @@
+SUMMARY = "swupd sofware update from Clear Linux - server component"
+LICENSE = "GPL-2.0"
+LIC_FILES_CHKSUM = "file://COPYING;md5=04d0b48662817042d80393e7511fa41b \
+                    file://bsdiff/LICENSE;md5=0dbe7a50f028269750631fcbded3846a"
+
+DEPENDS = "file xz glib-2.0 zlib bzip2 tar rsync openssl"
+
+SRC_URI = "\
+    https://download.clearlinux.org/releases/5940/clear/source/SRPMS/${BPN}-${PV}-4.src.rpm;extract=${BP}.tar.gz \
+    file://0001-Add-option-S-to-take-the-state-data-dir-as-an-argume.patch \
+    file://0001-Add-system_argv-helper-for-safer-calls-to-system-uti.patch \
+    file://0002-Add-configure-option-to-re-enable-config-files-in-ma.patch \
+    file://0002-Fix-regression-that-introduced-a-directory-named.patch \
+"
+
+SRC_URI[md5sum] = "14f25677b5a4f0b33785910b03860939"
+SRC_URI[sha256sum] = "c2d0e595444fe198c4092dd83d20a929fd1402a13b66b410b76677ed3a993d99"
+
+inherit autotools
+
+EXTRA_OECONF = "--enable-bzip2 --enable-lzma --disable-stateless"
+
+# safer-calls-to-system-utilities.patch uses for loop initial declaration
+CFLAGS_append = " -std=c99"
+
+do_install_append () {
+    mkdir -p ${D}${sysconfdir}/swupd-certs
+    install -m 0755 ${S}/test/signature/* ${D}${sysconfdir}/swupd-certs/
+}
+
+RDEPENDS_${PN} = "tar rsync"
+
+BBCLASSEXTEND = "native"
-- 
2.5.0


