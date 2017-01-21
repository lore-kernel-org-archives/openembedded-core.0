Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 2077C71A17
	for <openembedded-core@lists.openembedded.org>;
	Sat, 21 Jan 2017 14:35:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v0LEZqKn001021; Sat, 21 Jan 2017 14:35:52 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id BtVYlS0hm5rS; Sat, 21 Jan 2017 14:35:52 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v0LEZlim001006
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Sat, 21 Jan 2017 14:35:48 GMT
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1cUwlf-0000yE-I3; Sat, 21 Jan 2017 14:35:47 +0000
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Sat, 21 Jan 2017 14:35:42 +0000
Message-Id: <1485009344-3664-5-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1485009344-3664-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1485009344-3664-1-git-send-email-richard.purdie@linuxfoundation.org>
Subject: [PATCH 5/7] package_ipk: Improve failure debug output
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
X-List-Received-Date: Sat, 21 Jan 2017 14:35:54 -0000

Currently if the dpkg-deb command fails you see an error message like this:

ERROR: nss-3.27.1-r0 do_package_write_ipk: opkg-build execution failed
ERROR: nss-3.27.1-r0 do_package_write_ipk: Function failed: do_package_ipk

which is pretty much useless. If we use subprocess.check_output, we see a
traceback and then:

Exception: subprocess.CalledProcessError: Command '<cmd>' returned non-zero exit status 1

Subprocess output:
<output>

which is much easier to debug from.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/package_ipk.bbclass | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/meta/classes/package_ipk.bbclass b/meta/classes/package_ipk.bbclass
index 039b6ab..9fb128b 100644
--- a/meta/classes/package_ipk.bbclass
+++ b/meta/classes/package_ipk.bbclass
@@ -244,11 +244,8 @@ python do_package_ipk () {
             conffiles.close()
 
         os.chdir(basedir)
-        ret = subprocess.call("PATH=\"%s\" %s %s %s" % (localdata.getVar("PATH"),
+        subprocess.check_output("PATH=\"%s\" %s %s %s" % (localdata.getVar("PATH"),
                                                           d.getVar("OPKGBUILDCMD"), pkg, pkgoutdir), shell=True)
-        if ret != 0:
-            bb.utils.unlockfile(lf)
-            bb.fatal("opkg-build execution failed")
 
         if d.getVar('IPK_SIGN_PACKAGES') == '1':
             ipkver = "%s-%s" % (d.getVar('PKGV'), d.getVar('PKGR'))
-- 
2.7.4


