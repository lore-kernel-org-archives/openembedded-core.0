Return-Path: <Mingli.Yu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 25DD87ED5C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jan 2020 03:27:37 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 00K3RWFD003653
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL);
	Sun, 19 Jan 2020 19:27:33 -0800 (PST)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.468.0; Sun, 19 Jan 2020 19:27:32 -0800
From: <mingli.yu@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <peter.kjellerstedt@axis.com>, 
	<seebs@seebs.net>
Date: Mon, 20 Jan 2020 11:27:30 +0800
Message-ID: <20200120032730.139058-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <f8005a9c8aae479db77809bb1132e04c@XBOX03.axis.com>
References: <f8005a9c8aae479db77809bb1132e04c@XBOX03.axis.com>
MIME-Version: 1.0
Subject: [pseudo v4] pseudo_util.c: Open file with O_CLOEXEC to avoid fd leak
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
X-List-Received-Date: Mon, 20 Jan 2020 03:27:38 -0000
Content-Transfer-Encoding: 8bit
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


