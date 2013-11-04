Return-Path: <Chong.Lu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id B1B036CEF1
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Nov 2013 08:41:20 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id rA48fMOc028385
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 4 Nov 2013 00:41:22 -0800 (PST)
Received: from PKE-CLU1-D1.wrs.com (128.224.162.203) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.347.0; Mon, 4 Nov 2013 00:41:21 -0800
From: <Chong.Lu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 4 Nov 2013 16:41:15 +0800
Message-ID: <1383554475-20223-1-git-send-email-Chong.Lu@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH] makedevs: fix return error value when input invalid arguments
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
X-List-Received-Date: Mon, 04 Nov 2013 08:41:20 -0000
Content-Type: text/plain

From: Lu Chong <Chong.Lu@windriver.com>

Remove "-q" and "--squash" options of help information.
Print help information and return non-zero value when makedevs has none option.
If rootdir is not exist, there would be print error messages.

Signed-off-by: Lu Chong <Chong.Lu@windriver.com>
---
 .../makedevs/makedevs-1.0.0/makedevs.c             |   15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/makedevs/makedevs-1.0.0/makedevs.c b/meta/recipes-devtools/makedevs/makedevs-1.0.0/makedevs.c
index 53700c6..96362a5 100644
--- a/meta/recipes-devtools/makedevs/makedevs-1.0.0/makedevs.c
+++ b/meta/recipes-devtools/makedevs/makedevs-1.0.0/makedevs.c
@@ -434,7 +434,6 @@ static int parse_devtable(FILE * devtable)
 static struct option long_options[] = {
 	{"root", 1, NULL, 'r'},
 	{"help", 0, NULL, 'h'},
-	{"squash", 0, NULL, 'q'},
 	{"version", 0, NULL, 'v'},
 	{"devtable", 1, NULL, 'D'},
 	{NULL, 0, NULL, 0}
@@ -446,7 +445,6 @@ static char *helptext =
 	"Options:\n"
 	"  -r, -d, --root=DIR     Build filesystem from directory DIR (default: cwd)\n"
 	"  -D, --devtable=FILE    Use the named FILE as a device table file\n"
-	"  -q, --squash           Squash permissions and owners making all files be owned by root\n"
 	"  -h, --help             Display this help text\n"
 	"  -v, --version          Display version information\n\n";
 
@@ -466,6 +464,11 @@ int main(int argc, char **argv)
 
 	umask (0);
 
+	if (argc==1) {
+		fprintf(stderr, helptext);
+		exit(1);
+	}
+
 	while ((opt = getopt_long(argc, argv, "D:d:r:qhv", 
 			long_options, &c)) >= 0) {
 		switch (opt) {
@@ -484,6 +487,9 @@ int main(int argc, char **argv)
 			if (rootdir != default_rootdir) {
 				error_msg_and_die("root directory specified more than once");
 			}
+			if (NULL==opendir(optarg)) {
+				perror_msg_and_die(optarg);
+			}
 			rootdir = xstrdup(optarg);
 			break;
 
@@ -497,6 +503,11 @@ int main(int argc, char **argv)
 		}
 	}
 
+	if (argv[optind] != NULL) {
+		fprintf(stderr, helptext);
+		exit(1);
+	}
+
 	// Get name-id mapping
 	sprintf(passwd_path, "%s/etc/passwd", rootdir);
 	sprintf(group_path, "%s/etc/group", rootdir);
-- 
1.7.9.5


