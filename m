Return-Path: <Mingli.Yu@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id C649E7C377
	for <openembedded-core@lists.openembedded.org>;
	Sun, 19 Jan 2020 05:16:12 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 00J5FKnc004780
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL);
	Sat, 18 Jan 2020 21:15:30 -0800
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.468.0; Sat, 18 Jan 2020 21:15:09 -0800
From: <mingli.yu@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <seebs@seebs.net>
Date: Sun, 19 Jan 2020 13:15:08 +0800
Message-ID: <1579410908-342420-1-git-send-email-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1579405812-336202-1-git-send-email-mingli.yu@windriver.com>
References: <1579405812-336202-1-git-send-email-mingli.yu@windriver.com>
MIME-Version: 1.0
Cc: pavelmn@axis.com
Subject: [PATCH v3] pseudo_util.c: Open file with O_CLOEXEC to avoid fd leak
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
X-List-Received-Date: Sun, 19 Jan 2020 05:16:13 -0000
Content-Type: text/plain

From: Pavel Modilaynen <pavelmn@axis.com>

Use close-on-exec (O_CLOEXEC) flag when open log file to
make sure its file descriptor is not leaked to parent
process on fork/exec.

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 pseudo_util.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/pseudo_util.c b/pseudo_util.c
index c867ed6..0ec527b 100644
--- a/pseudo_util.c
+++ b/pseudo_util.c
@@ -1594,7 +1594,7 @@ pseudo_logfile(char *filename, char *defname, int prefer_fd) {
 		}
 		free(filename);
 	}	
-	fd = open(pseudo_path, O_WRONLY | O_APPEND | O_CREAT, 0644);
+	fd = open(pseudo_path, O_WRONLY | O_APPEND | O_CREAT | O_CLOEXEC, 0644);
 	if (fd == -1) {
 		pseudo_diag("help: can't open log file %s: %s\n", pseudo_path, strerror(errno));
 	} else {
-- 
2.7.4


