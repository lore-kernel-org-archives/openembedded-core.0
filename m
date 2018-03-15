Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 8D8CD78824
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Mar 2018 13:40:21 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w2FDeIr2015918
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Thu, 15 Mar 2018 13:40:21 GMT
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1ewT7B-0002Ob-HM; Thu, 15 Mar 2018 06:40:17 -0700
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 15 Mar 2018 06:40:14 -0700
Message-Id: <1521121214-9149-5-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1521121214-9149-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1521121214-9149-1-git-send-email-richard.purdie@linuxfoundation.org>
X-Virus-Scanned: clamav-milter 0.99.3 at dan
X-Virus-Status: Clean
Subject: [rocko][PATCH 5/5] uninative: Add compatiblity version check
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
X-List-Received-Date: Thu, 15 Mar 2018 13:40:23 -0000

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
index 670efa9..1723364 100644
--- a/meta/classes/uninative.bbclass
+++ b/meta/classes/uninative.bbclass
@@ -77,6 +77,11 @@ python uninative_event_fetchloader() {
                 except FileExistsError:
                     pass
 
+        # ldd output is "ldd (Ubuntu GLIBC 2.23-0ubuntu10) 2.23", extract last option from first line
+        glibcver = subprocess.check_output(["ldd", "--version"]).decode('utf-8').split('\n')[0].split()[-1]
+        if bb.utils.vercmp_string(d.getVar("UNINATIVE_MAXGLIBCVERSION"), glibcver) < 0:
+            raise RuntimeError("Your host glibc verson (%s) is newer than that in uninative (%s). Disabling uninative so that sstate is not corrupted." % (glibcver, d.getVar("UNINATIVE_MAXGLIBCVERSION")))
+
         cmd = d.expand("\
 mkdir -p ${UNINATIVE_STAGING_DIR}-uninative; \
 cd ${UNINATIVE_STAGING_DIR}-uninative; \
@@ -94,6 +99,8 @@ ${UNINATIVE_STAGING_DIR}-uninative/relocate_sdk.py \
 
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


