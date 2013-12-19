Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 4DC6860DED
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Dec 2013 09:39:48 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rBJ9dhJ4006127 for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Dec 2013 09:39:43 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id NaRAEMyod95k
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Dec 2013 09:39:43 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rBJ9de71006103
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Dec 2013 09:39:41 GMT
Message-ID: <1387445975.6402.64.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Thu, 19 Dec 2013 09:39:35 +0000
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Subject: [PATCH] sstatesig: Update for the removal of sstate-name
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
X-List-Received-Date: Thu, 19 Dec 2013 09:39:48 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

We've dropped sstate-name so we can remove this code. The fallback was
incorrect since we use taskname without the do_ prefix so this patch
updates to account for that too.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/lib/oe/sstatesig.py b/meta/lib/oe/sstatesig.py
index 836a148..835cee8 100644
--- a/meta/lib/oe/sstatesig.py
+++ b/meta/lib/oe/sstatesig.py
@@ -146,9 +146,7 @@ def find_siginfo(pn, taskname, taskhashlist, d, hashfn = None):
             localdata.setVar('BB_TASKHASH', hashval)
             if pn.endswith('-native') or pn.endswith('-crosssdk') or pn.endswith('-cross'):
                 localdata.setVar('SSTATE_EXTRAPATH', "${NATIVELSBSTRING}/")
-            sstatename = d.getVarFlag(taskname, "sstate-name")
-            if not sstatename:
-                sstatename = taskname
+            sstatename = taskname[3:]
             filespec = '%s_%s.*.siginfo' % (localdata.getVar('SSTATE_PKG', True), sstatename)
 
             if hashval != '*':



