Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7496774F00
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 May 2018 08:44:13 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w4V8hnTx008325
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 May 2018 01:44:04 -0700
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.218) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Thu, 31 May 2018 01:43:38 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 31 May 2018 16:45:29 +0800
Message-ID: <96f9256cdcb2926792efa4562c68768f2666ff76.1527755435.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1527755434.git.Qi.Chen@windriver.com>
References: <cover.1527755434.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 14/14] oeqa/core/target/ssh.py: increase maximum read bytes from 1024 to 4096
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
X-List-Received-Date: Thu, 31 May 2018 08:44:13 -0000
Content-Type: text/plain

When running testimage task for core-image-sato-sdk, the following
error appeared.

  UnicodeDecodeError: 'utf-8' codec can't decode byte 0x82 at position 0: invalid start byte

Checking the codes, I found it's caused by setting a 1024 limit for the
read method of the StreamReader object.

Comments from the manual:
"""
The chars argument indicates the number of decoded code points or bytes to
return. The read() method will never return more data than requested, but
it might return less, if there is not enough available.
"""

When running `systemctl status --full' on target, this error occurs.

This patch increase the bytes limit to 4096 to fix the error.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/lib/oeqa/core/target/ssh.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/core/target/ssh.py b/meta/lib/oeqa/core/target/ssh.py
index 151b99a..8ff1f6c 100644
--- a/meta/lib/oeqa/core/target/ssh.py
+++ b/meta/lib/oeqa/core/target/ssh.py
@@ -208,7 +208,7 @@ def SSHCall(command, logger, timeout=None, **opts):
                 try:
                     if select.select([process.stdout], [], [], 5)[0] != []:
                         reader = codecs.getreader('utf-8')(process.stdout)
-                        data = reader.read(1024, 1024)
+                        data = reader.read(1024, 4096)
                         if not data:
                             process.stdout.close()
                             eof = True
-- 
1.9.1


