Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id D4B58610DC
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Sep 2013 05:58:34 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r8P5waji026732
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Sep 2013 22:58:36 -0700 (PDT)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.168) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Tue, 24 Sep 2013 22:58:36 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 25 Sep 2013 13:58:36 +0800
Message-ID: <1380088716-12512-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [PATCH] makedevs: rectify the exit codes and handle the invalid parameter
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
X-List-Received-Date: Wed, 25 Sep 2013 05:58:38 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

It is correct behaviours to output help and version information,
and should return 0;
When input parameter is invalid, print help information and exit.

Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 meta/recipes-devtools/makedevs/makedevs-1.0.0/makedevs.c |    9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/makedevs/makedevs-1.0.0/makedevs.c b/meta/recipes-devtools/makedevs/makedevs-1.0.0/makedevs.c
index cc3707b..5d2c45b 100644
--- a/meta/recipes-devtools/makedevs/makedevs-1.0.0/makedevs.c
+++ b/meta/recipes-devtools/makedevs/makedevs-1.0.0/makedevs.c
@@ -465,8 +465,8 @@ int main(int argc, char **argv)
 				error_msg_and_die("%s: not a proper device table file", optarg);
 			break;
 		case 'h':
-			fprintf(stderr, helptext);
-			exit(1);
+			printf(helptext);
+			exit(0);
 		case 'r':
 		case 'd':				/* for compatibility with mkfs.jffs, genext2fs, etc... */
 			if (rootdir != default_rootdir) {
@@ -476,8 +476,11 @@ int main(int argc, char **argv)
 			break;
 
 		case 'v':
-			fprintf(stderr, "makedevs revision %.*s\n",
+			printf("makedevs revision %.*s\n",
 					(int) strlen(revtext) - 13, revtext + 11);
+			exit(0);
+		default:
+			fprintf(stderr, helptext);
 			exit(1);
 		}
 	}
-- 
1.7.10.4


