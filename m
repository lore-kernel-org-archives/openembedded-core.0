Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 5A7D0607A5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Jul 2015 22:49:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t6GMn5Bs021942 for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Jul 2015 23:49:05 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id ux7ITNBtOavd
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Jul 2015 23:49:05 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t6GMmpb9021934
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Jul 2015 23:49:02 +0100
Message-ID: <1437086931.3310.176.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Thu, 16 Jul 2015 23:48:51 +0100
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Subject: [PATCH] debian: Add versions to RPROVIDES
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
X-List-Received-Date: Thu, 16 Jul 2015 22:49:05 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Recently, libspeexdsp-dev added RCONFLICTS = "speex-dev < 1.2rc2". where
libspeexdsp is 1.2rc3. That all seems reasonable, except there is a problem.

debian.bbclass renames speex-dev to libspeex-dev and adds a "Provides: speex-dev"
which the packaging backends duly note. The trouble is rpm sees that as having no
version at all. This means that "speex-dev < 1.2rc2" conflicts with "speex-dev"
and the -dev package simply cannot be installed.

We can't simply version all Provides for rpm since some dependencies clearly
shouldn't be versioned (e.g. the locale ones).

The solution that seems to work best is to add the versions in debian.bbclass.
If the backend doesn't like these, the backend can then strip them off 
(separate patch does this).

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/classes/debian.bbclass b/meta/classes/debian.bbclass
index 7a04318..04d3b01 100644
--- a/meta/classes/debian.bbclass
+++ b/meta/classes/debian.bbclass
@@ -58,7 +58,7 @@ python debian_package_name_hook () {
         if newpkg and newpkg != pkg:
             provs = (d.getVar('RPROVIDES_' + pkg, True) or "").split()
             if pkg not in provs:
-                d.appendVar('RPROVIDES_' + pkg, " " + pkg)
+                d.appendVar('RPROVIDES_' + pkg, " " + pkg + " (=" + d.getVar("PKGV", True) + ")")
 
     def auto_libname(packages, orig_pkg):
         sonames = []



