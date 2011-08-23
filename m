Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QveXn-0002oW-OB
	for openembedded-core@lists.openembedded.org;
	Tue, 23 Aug 2011 02:08:40 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 22 Aug 2011 17:03:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,266,1312182000"; 
   d="scan'208";a="9949030"
Received: from unknown (HELO [10.255.13.234]) ([10.255.13.234])
	by AZSMGA002.ch.intel.com with ESMTP; 22 Aug 2011 17:03:53 -0700
Message-ID: <4E52EE68.7080207@linux.intel.com>
Date: Mon, 22 Aug 2011 17:03:52 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:5.0) Gecko/20110707 Thunderbird/5.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1313579973-10983-1-git-send-email-noor_ahsan@mentor.com>
In-Reply-To: <1313579973-10983-1-git-send-email-noor_ahsan@mentor.com>
Subject: Re: [PATCH] mtd-utils: Added recipe of newer version 1.4.4.
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 23 Aug 2011 00:08:40 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/17/2011 04:19 AM, Noor, Ahsan wrote:
> From: Noor Ahsan<noor_ahsan@mentor.com>
>
> * Added recipe of version 1.4.4 and removed 1.4.1 recipe and its patch files.
>
> Signed-off-by: Noor Ahsan<noor_ahsan@mentor.com>
> ---
>   .../add-exclusion-to-mkfs-jffs2-git-2.patch        |  103 --------------------
>   .../add-exclusion-to-mkfs-jffs2-git-2.patch        |  103 ++++++++++++++++++++
>   meta/recipes-devtools/mtd/mtd-utils_1.4.1.bb       |   31 ------
>   meta/recipes-devtools/mtd/mtd-utils_1.4.4.bb       |   32 ++++++
>   4 files changed, 135 insertions(+), 134 deletions(-)
>

> diff --git a/meta/recipes-devtools/mtd/mtd-utils-1.4.1/add-exclusion-to-mkfs-jffs2-git-2.patch b/meta/recipes-devtools/mtd/mtd-utils-1.4.1/add-exclusion-to-mkfs-jffs2-git-2.patch
> deleted file mode 100644
> index 57d6a30..0000000
> --- a/meta/recipes-devtools/mtd/mtd-utils-1.4.1/add-exclusion-to-mkfs-jffs2-git-2.patch
> +++ /dev/null
> @@ -1,103 +0,0 @@
> -Upstream-Status: Pending
> -
> ---- /tmp/mkfs.jffs2.c	2009-01-11 15:28:41.000000000 +0100
> -+++ git/mkfs.jffs2.c	2009-01-11 15:59:29.000000000 +0100
> -@@ -100,6 +100,11 @@
> - 	struct rb_node hardlink_rb;
> - };
> -
> -+struct ignorepath_entry {
> -+	struct ignorepath_entry* next;  /* Points to the next ignorepath element */
> -+	char name[PATH_MAX];        /* Name of the entry */
> -+};
> -+static struct ignorepath_entry* ignorepath = 0;
> - struct rb_root hardlinks;
> - static int out_fd = -1;
> - static int in_fd = -1;
> -@@ -408,7 +413,7 @@
> - 	char *hpath, *tpath;
> - 	struct dirent *dp, **namelist;
> - 	struct filesystem_entry *entry;
> --
> -+	struct ignorepath_entry* element = ignorepath;
> -
> - 	if (lstat(hostpath,&sb)) {
> - 		perror_msg_and_die("%s", hostpath);
> -@@ -417,6 +422,15 @@
> - 	entry = add_host_filesystem_entry(targetpath, hostpath,
> - 			sb.st_uid, sb.st_gid, sb.st_mode, 0, parent);
> -
> -+	while ( element ) {
> -+		if ( strcmp( element->name, targetpath ) == 0 ) {
> -+			printf( "Note: ignoring directories below '%s'\n", targetpath );
> -+			return entry;
> -+			break;
> -+		}
> -+		element = element->next;
> -+	}
> -+
> - 	n = scandir(hostpath,&namelist, 0, alphasort);
> - 	if (n<  0) {
> - 		perror_msg_and_die("opening directory %s", hostpath);
> -@@ -1453,6 +1467,7 @@
> - 	{"root", 1, NULL, 'r'},
> - 	{"pagesize", 1, NULL, 's'},
> - 	{"eraseblock", 1, NULL, 'e'},
> -+	{"ignore", 1, NULL, 'I'},
> - 	{"output", 1, NULL, 'o'},
> - 	{"help", 0, NULL, 'h'},
> - 	{"verbose", 0, NULL, 'v'},
> -@@ -1500,6 +1515,7 @@
> - "  -L, --list-compressors  Show the list of the avaiable compressors\n"
> - "  -t, --test-compression  Call decompress and compare with the original (for test)\n"
> - "  -n, --no-cleanmarkers   Don't add a cleanmarker to every eraseblock\n"
> -+"  -I, --ignore=PATH       Ignore sub directory and file tree below PATH when recursing over the file system\n"
> - "  -o, --output=FILE       Output to FILE (default: stdout)\n"
> - "  -l, --little-endian     Create a little-endian filesystem\n"
> - "  -b, --big-endian        Create a big-endian filesystem\n"
> -@@ -1666,6 +1682,7 @@
> - 	char *compr_name = NULL;
> - 	int compr_prior  = -1;
> - 	int warn_page_size = 0;
> -+	struct ignorepath_entry* element = ignorepath;
> -
> - 	page_size = sysconf(_SC_PAGESIZE);
> - 	if (page_size<  0) /* System doesn't know so ... */
> -@@ -1676,7 +1693,7 @@
> - 	jffs2_compressors_init();
> -
> - 	while ((opt = getopt_long(argc, argv,
> --					"D:d:r:s:o:qUPfh?vVe:lbp::nc:m:x:X:Lty:i:", long_options,&c))>= 0)
> -+					"D:d:r:s:I:o:qUPfh?vVe:lbp::nc:m:x:X:Lty:i:", long_options,&c))>= 0)
> - 	{
> - 		switch (opt) {
> - 			case 'D':
> -@@ -1700,6 +1717,28 @@
> - 				warn_page_size = 0; /* set by user, so don't need to warn */
> - 				break;
> -
> -+			case 'I':
> -+				printf( "Note: Adding '%s' to ignore Path\n", optarg );
> -+				element = ignorepath;
> -+				if ( !ignorepath ) {
> -+					ignorepath = xmalloc( sizeof( struct ignorepath_entry ) );
> -+					ignorepath->next = 0;
> -+					strcpy(&ignorepath->name[0], optarg );
> -+				} else {
> -+					while ( element->next ) element = element->next;
> -+					element->next = xmalloc( sizeof( struct ignorepath_entry ) );
> -+ 					element->next->next = 0;
> -+					strcpy(&element->next->name[0], optarg );
> -+				}
> -+				printf( "--------- Dumping ignore path list ----------------\n" );
> -+				element = ignorepath;
> -+				while ( element ) {
> -+					printf( "  * '%s'\n",&element->name[0] );
> -+					element = element->next;
> -+				}
> -+				printf( "---------------------------------------------------\n" );
> -+				break;
> -+
> - 			case 'o':
> - 				if (out_fd != -1) {
> - 					error_msg_and_die("output filename specified more than once");
> diff --git a/meta/recipes-devtools/mtd/mtd-utils-1.4.4/add-exclusion-to-mkfs-jffs2-git-2.patch b/meta/recipes-devtools/mtd/mtd-utils-1.4.4/add-exclusion-to-mkfs-jffs2-git-2.patch
> new file mode 100644
> index 0000000..57d6a30
> --- /dev/null
> +++ b/meta/recipes-devtools/mtd/mtd-utils-1.4.4/add-exclusion-to-mkfs-jffs2-git-2.patch
> @@ -0,0 +1,103 @@
> +Upstream-Status: Pending
> +

This is missing a signed-off-by, can you either sign-off or validate 
where it came from?

> +--- /tmp/mkfs.jffs2.c	2009-01-11 15:28:41.000000000 +0100
> ++++ git/mkfs.jffs2.c	2009-01-11 15:59:29.000000000 +0100
> +@@ -100,6 +100,11 @@
> + 	struct rb_node hardlink_rb;
> + };
> +
> ++struct ignorepath_entry {
> ++	struct ignorepath_entry* next;  /* Points to the next ignorepath element */
> ++	char name[PATH_MAX];        /* Name of the entry */
> ++};
> ++static struct ignorepath_entry* ignorepath = 0;
> + struct rb_root hardlinks;
> + static int out_fd = -1;
> + static int in_fd = -1;
> +@@ -408,7 +413,7 @@
> + 	char *hpath, *tpath;
> + 	struct dirent *dp, **namelist;
> + 	struct filesystem_entry *entry;
> +-
> ++	struct ignorepath_entry* element = ignorepath;
> +
> + 	if (lstat(hostpath,&sb)) {
> + 		perror_msg_and_die("%s", hostpath);
> +@@ -417,6 +422,15 @@
> + 	entry = add_host_filesystem_entry(targetpath, hostpath,
> + 			sb.st_uid, sb.st_gid, sb.st_mode, 0, parent);
> +
> ++	while ( element ) {
> ++		if ( strcmp( element->name, targetpath ) == 0 ) {
> ++			printf( "Note: ignoring directories below '%s'\n", targetpath );
> ++			return entry;
> ++			break;
> ++		}
> ++		element = element->next;
> ++	}
> ++
> + 	n = scandir(hostpath,&namelist, 0, alphasort);
> + 	if (n<  0) {
> + 		perror_msg_and_die("opening directory %s", hostpath);
> +@@ -1453,6 +1467,7 @@
> + 	{"root", 1, NULL, 'r'},
> + 	{"pagesize", 1, NULL, 's'},
> + 	{"eraseblock", 1, NULL, 'e'},
> ++	{"ignore", 1, NULL, 'I'},
> + 	{"output", 1, NULL, 'o'},
> + 	{"help", 0, NULL, 'h'},
> + 	{"verbose", 0, NULL, 'v'},
> +@@ -1500,6 +1515,7 @@
> + "  -L, --list-compressors  Show the list of the avaiable compressors\n"
> + "  -t, --test-compression  Call decompress and compare with the original (for test)\n"
> + "  -n, --no-cleanmarkers   Don't add a cleanmarker to every eraseblock\n"
> ++"  -I, --ignore=PATH       Ignore sub directory and file tree below PATH when recursing over the file system\n"
> + "  -o, --output=FILE       Output to FILE (default: stdout)\n"
> + "  -l, --little-endian     Create a little-endian filesystem\n"
> + "  -b, --big-endian        Create a big-endian filesystem\n"
> +@@ -1666,6 +1682,7 @@
> + 	char *compr_name = NULL;
> + 	int compr_prior  = -1;
> + 	int warn_page_size = 0;
> ++	struct ignorepath_entry* element = ignorepath;
> +
> + 	page_size = sysconf(_SC_PAGESIZE);
> + 	if (page_size<  0) /* System doesn't know so ... */
> +@@ -1676,7 +1693,7 @@
> + 	jffs2_compressors_init();
> +
> + 	while ((opt = getopt_long(argc, argv,
> +-					"D:d:r:s:o:qUPfh?vVe:lbp::nc:m:x:X:Lty:i:", long_options,&c))>= 0)
> ++					"D:d:r:s:I:o:qUPfh?vVe:lbp::nc:m:x:X:Lty:i:", long_options,&c))>= 0)
> + 	{
> + 		switch (opt) {
> + 			case 'D':
> +@@ -1700,6 +1717,28 @@
> + 				warn_page_size = 0; /* set by user, so don't need to warn */
> + 				break;
> +
> ++			case 'I':
> ++				printf( "Note: Adding '%s' to ignore Path\n", optarg );
> ++				element = ignorepath;
> ++				if ( !ignorepath ) {
> ++					ignorepath = xmalloc( sizeof( struct ignorepath_entry ) );
> ++					ignorepath->next = 0;
> ++					strcpy(&ignorepath->name[0], optarg );
> ++				} else {
> ++					while ( element->next ) element = element->next;
> ++					element->next = xmalloc( sizeof( struct ignorepath_entry ) );
> ++ 					element->next->next = 0;
> ++					strcpy(&element->next->name[0], optarg );
> ++				}
> ++				printf( "--------- Dumping ignore path list ----------------\n" );
> ++				element = ignorepath;
> ++				while ( element ) {
> ++					printf( "  * '%s'\n",&element->name[0] );
> ++					element = element->next;
> ++				}
> ++				printf( "---------------------------------------------------\n" );
> ++				break;
> ++
> + 			case 'o':
> + 				if (out_fd != -1) {
> + 					error_msg_and_die("output filename specified more than once");
> diff --git a/meta/recipes-devtools/mtd/mtd-utils_1.4.1.bb b/meta/recipes-devtools/mtd/mtd-utils_1.4.1.bb
> deleted file mode 100644
> index f2de74d..0000000
> --- a/meta/recipes-devtools/mtd/mtd-utils_1.4.1.bb
> +++ /dev/null
> @@ -1,31 +0,0 @@
> -DESCRIPTION = "Tools for managing memory technology devices."
> -SECTION = "base"
> -DEPENDS = "zlib lzo e2fsprogs util-linux"
> -HOMEPAGE = "http://www.linux-mtd.infradead.org/"
> -LICENSE = "GPLv2+"
> -LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3 \
> -                    file://include/common.h;beginline=1;endline=17;md5=ba05b07912a44ea2bf81ce409380049c"
> -
> -SRC_URI = "git://git.infradead.org/mtd-utils.git;protocol=git;tag=3c3674a6e1d3f59554b0ff68ca59be2fd4134e0c \
> -		file://add-exclusion-to-mkfs-jffs2-git-2.patch;patch=1"
> -
> -S = "${WORKDIR}/git/"
> -
> -PR = "r1"
> -
> -EXTRA_OEMAKE = "'CC=${CC}' 'CFLAGS=${CFLAGS} -I${S}/include -DWITHOUT_XATTR' 'BUILDDIR=${S}'"
> -
> -do_install () {
> -	oe_runmake install DESTDIR=${D} SBINDIR=${sbindir} MANDIR=${mandir} INCLUDEDIR=${includedir}
> -	install -d ${D}${includedir}/mtd/
> -	for f in ${S}/include/mtd/*.h; do
> -		install -m 0644 $f ${D}${includedir}/mtd/
> -	done
> -}
> -
> -PARALLEL_MAKE = ""
> -
> -BBCLASSEXTEND = "native"
> -
> -SRC_URI[md5sum] = "645519b753b364d52c4b941dcee3dd7e"
> -SRC_URI[sha256sum] = "51d6a77c7e673219bb89c4b119f336d9f2f5a5e065a12ecf9636c5348d099a0e"
> diff --git a/meta/recipes-devtools/mtd/mtd-utils_1.4.4.bb b/meta/recipes-devtools/mtd/mtd-utils_1.4.4.bb
> new file mode 100644
> index 0000000..ac9316d
> --- /dev/null
> +++ b/meta/recipes-devtools/mtd/mtd-utils_1.4.4.bb
> @@ -0,0 +1,32 @@
> +DESCRIPTION = "Tools for managing memory technology devices."
> +SECTION = "base"
> +DEPENDS = "zlib lzo e2fsprogs util-linux"
> +HOMEPAGE = "http://www.linux-mtd.infradead.org/"
> +LICENSE = "GPLv2+"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3 \
> +                    file://include/common.h;beginline=1;endline=17;md5=ba05b07912a44ea2bf81ce409380049c"
> +
> +TAG = "v${PV}"
> +
Richard mentioned about this already, regarding using the git hash directly.

Please resubmit this with the actaul git hash of the tag.

Thanks
	Sau!

> +SRC_URI = "git://git.infradead.org/mtd-utils.git;protocol=git;tag=${TAG} \
> +           file://add-exclusion-to-mkfs-jffs2-git-2.patch;patch=1"
> +
> +
> +S = "${WORKDIR}/git/"
> +
> +PR = "r0"
> +
> +EXTRA_OEMAKE = "'CC=${CC}' 'CFLAGS=${CFLAGS} -I${S}/include -DWITHOUT_XATTR' 'BUILDDIR=${S}'"
> +
> +do_install () {
> +	oe_runmake install DESTDIR=${D} SBINDIR=${sbindir} MANDIR=${mandir} INCLUDEDIR=${includedir}
> +	install -d ${D}${includedir}/mtd/
> +	for f in ${S}/include/mtd/*.h; do
> +		install -m 0644 $f ${D}${includedir}/mtd/
> +	done
> +}
> +
> +PARALLEL_MAKE = ""
> +
> +BBCLASSEXTEND = "native"
> +


