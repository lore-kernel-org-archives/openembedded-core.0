Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 4EB076FE5B
	for <openembedded-core@lists.openembedded.org>;
	Sat,  2 Aug 2014 08:48:11 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s728mBKU004747 for <openembedded-core@lists.openembedded.org>;
	Sat, 2 Aug 2014 09:48:11 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 8ohdratIQFqM
	for <openembedded-core@lists.openembedded.org>;
	Sat,  2 Aug 2014 09:48:11 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s728m6l2004458
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Sat, 2 Aug 2014 09:48:07 +0100
Message-ID: <1406969286.6981.15.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Sat, 02 Aug 2014 09:48:06 +0100
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Subject: [PATCH] package: Fix pkgdest for darwin shlibs code
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
X-List-Received-Date: Sat, 02 Aug 2014 08:48:11 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

When the code was rewritten we forgot to strip the pkg that is present
in the pkgdest path. This was fixed in the linux version of the code
but not the darwin one, this matches the fix.

Without this, the provider paths are broken.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 26a20d1..fbdccfb 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -1434,7 +1434,7 @@ python package_do_shlibs() {
     def darwin_so(file, needed, sonames, renames, pkgver):
         if not os.path.exists(file):
             return
-        ldir = os.path.dirname(file).replace(pkgdest, '')
+        ldir = os.path.dirname(file).replace(pkgdest + "/" + pkg, '')
 
         def get_combinations(base):
             #



