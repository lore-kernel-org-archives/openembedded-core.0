Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 56A28788D0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Mar 2018 14:06:17 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w2FE6Eru018546
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Thu, 15 Mar 2018 14:06:17 GMT
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1ewT7w-0002RE-JB; Thu, 15 Mar 2018 06:41:04 -0700
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 15 Mar 2018 06:41:01 -0700
Message-Id: <1521121262-9269-12-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1521121262-9269-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1521121262-9269-1-git-send-email-richard.purdie@linuxfoundation.org>
X-Virus-Scanned: clamav-milter 0.99.3 at dan
X-Virus-Status: Clean
Subject: [pyro][PATCH 12/13] uninative: Add compatiblity version check
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
X-List-Received-Date: Thu, 15 Mar 2018 14:06:17 -0000

If glibc is newer on the host than in uninative, the failure mode is
pretty nasty for clusters where the sstate is shared, including the Yocto
Project autobuilder.

This check aborts the use of uninative in such scenarios where a newer
glibc version appears and avoids corruption of sstate caches.

We use ldd to check the glibc version since that is included in libc-bin
(or equivalent) which locales use so it should always be present.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/uninative.bbclass               | 7 +++++++
 meta/conf/distro/include/yocto-uninative.inc | 2 ++
 2 files changed, 9 insertions(+)

diff --git a/meta/classes/uninative.bbclass b/meta/classes/uninative.bbclass
index 8f34483..682c627 100644
--- a/meta/classes/uninative.bbclass
+++ b/meta/classes/uninative.bbclass
@@ -59,6 +59,11 @@ python uninative_event_fetchloader() {
             if localpath != tarballpath and os.path.exists(localpath) and not os.path.exists(tarballpath):
                     os.symlink(localpath, tarballpath)
 
+        # ldd output is "ldd (Ubuntu GLIBC 2.23-0ubuntu10) 2.23", extract last option from first line
+        glibcver = subprocess.check_output(["ldd", "--version"]).decode('utf-8').split('\n')[0].split()[-1]
+        if bb.utils.vercmp_string(d.getVar("UNINATIVE_MAXGLIBCVERSION"), glibcver) < 0:
+            raise RuntimeError("Your host glibc verson (%s) is newer than that in uninative (%s). Disabling uninative so that sstate is not corrupted." % (glibcver, d.getVar("UNINATIVE_MAXGLIBCVERSION")))
+
         cmd = d.expand("\
 mkdir -p ${UNINATIVE_STAGING_DIR}-uninative; \
 cd ${UNINATIVE_STAGING_DIR}-uninative; \
@@ -76,6 +81,8 @@ ${UNINATIVE_STAGING_DIR}-uninative/relocate_sdk.py \
 
         enable_uninative(d)
 
+    except RuntimeError as e:
+        bb.warn(str(e))
     except bb.fetch2.BBFetchException as exc:
         bb.warn("Disabling uninative as unable to fetch uninative tarball: %s" % str(exc))
         bb.warn("To build your own uninative loader, please bitbake uninative-tarball and set UNINATIVE_TARBALL appropriately.")
diff --git a/meta/conf/distro/include/yocto-uninative.inc b/meta/conf/distro/include/yocto-uninative.inc
index b3f8c24..cd5fc0b 100644
--- a/meta/conf/distro/include/yocto-uninative.inc
+++ b/meta/conf/distro/include/yocto-uninative.inc
@@ -6,6 +6,8 @@
 # to the distro running on the build machine.
 #
 
+UNINATIVE_MAXGLIBCVERSION = "2.27"
+
 UNINATIVE_URL ?= "http://downloads.yoctoproject.org/releases/uninative/1.8/"
 UNINATIVE_CHECKSUM[i686] ?= "427ce522ec97f65c75fd89587d90ef789e8cbca4a617abc4b5822abb01c2d0ae"
 UNINATIVE_CHECKSUM[x86_64] ?= "de4947e98e09e1432d069311cc2093974ecb9138a714fd5466f73524de66a693"
-- 
2.7.4


