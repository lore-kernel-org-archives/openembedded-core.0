Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 2ABFC716CE
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Apr 2015 10:49:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t3SAnh4M028775 for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Apr 2015 11:49:43 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id MumWODE_3i-u
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Apr 2015 11:49:43 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t3SAnWLK028753
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Apr 2015 11:49:43 +0100
Message-ID: <1430218158.13022.158.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Tue, 28 Apr 2015 11:49:18 +0100
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Subject: [PATCH] oeqa/targetbuild: Use DL_DIR for downloads if present
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
X-List-Received-Date: Tue, 28 Apr 2015 10:49:43 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

This isn't a test of wget so if the files we need are present in DL_DIR,
use them from there and save a bit of speed/bandwidth and skip the wget.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/lib/oeqa/utils/targetbuild.py b/meta/lib/oeqa/utils/targetbuild.py
index eeb08ba..d499bb1 100644
--- a/meta/lib/oeqa/utils/targetbuild.py
+++ b/meta/lib/oeqa/utils/targetbuild.py
@@ -26,6 +26,11 @@ class BuildProject():
     # Download self.archive to self.localarchive
     def _download_archive(self):
 
+        dl_dir = self.d.getVar("DL_DIR", True)
+        if dl_dir and os.path.exists(os.path.join(dl_dir, self.archive)):
+            bb.utils.copyfile(os.path.join(dl_dir, self.archive), self.localarchive)
+            return
+
         exportvars = ['HTTP_PROXY', 'http_proxy',
                       'HTTPS_PROXY', 'https_proxy',
                       'FTP_PROXY', 'ftp_proxy',



