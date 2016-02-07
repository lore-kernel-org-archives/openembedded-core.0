Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 218A6760AD
	for <openembedded-core@lists.openembedded.org>;
	Sun,  7 Feb 2016 17:08:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u17H8fFM000341 for <openembedded-core@lists.openembedded.org>;
	Sun, 7 Feb 2016 17:08:41 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id Kw-RSF-sz0qN
	for <openembedded-core@lists.openembedded.org>;
	Sun,  7 Feb 2016 17:08:41 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u17H8dDb000331
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 7 Feb 2016 17:08:40 GMT
Message-ID: <1454864919.27087.317.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Sun, 07 Feb 2016 17:08:39 +0000
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: [PATCH] base: Make do_cleansstate nostamp
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
X-List-Received-Date: Sun, 07 Feb 2016 17:08:42 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

We always want the cleansstate task to run so it should be
'nostamp' like the other clean tasks.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index 82ec0c9..8ce9dd4 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -651,8 +651,9 @@ addtask cleansstate after do_clean
 python do_cleansstate() {
         sstate_clean_cachefiles(d)
 }
-
 addtask cleanall after do_cleansstate
+do_cleansstate[nostamp] = "1"
+
 python do_cleanall() {
     src_uri = (d.getVar('SRC_URI', True) or "").split()
     if len(src_uri) == 0:



