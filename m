Return-Path: <mac@mcrowe.com>
X-Greylist: delayed 450 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 17 Dec 2019 08:10:06 UTC
Received: from avasout04.plus.net (avasout04.plus.net [212.159.14.19])
	by mail.openembedded.org (Postfix) with ESMTP id 3CBA77FE3F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Dec 2019 08:10:06 +0000 (UTC)
Received: from deneb ([80.229.24.9]) by smtp with ESMTP
	id h7oQiYxsN4Al0h7oRiG8Ho; Tue, 17 Dec 2019 08:02:36 +0000
X-Clacks-Overhead: "GNU Terry Pratchett"
X-CM-Score: 0.00
X-CNFS-Analysis: v=2.3 cv=GY1pYjfL c=1 sm=1 tr=0
	a=E/9URZZQ5L3bK/voZ0g0HQ==:117 a=E/9URZZQ5L3bK/voZ0g0HQ==:17
	a=pxVhFHJ0LMsA:10 a=Q4-j1AaZAAAA:8 a=-An2I_7KAAAA:8
	a=OrnB6H8c38Rv8jb_wfAA:9
	a=YiJXXBSSIdIA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=Sq34B_EcNBM9_nrAYB9S:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mcrowe.com; 
	s=20191005;
	h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject
	:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	In-Reply-To:References; bh=2dtnczYTFLcn9/1JC0u65s+fU7zoyx5sLvnGApEUoZM=;
	b=RA
	IaMNe3Qcgp5Yaox6xOPlsnihjwlMDt8MxS2iNNTIQwu5FnfvCRkV8j0dbiC8+t1KDmlNIM1PklkmM
	jXYHYBNM53uTfZs6mDyEw5NR22sq/NfWlS2TCLV7L6o2OCl/KTzBq8EBtAw9ZO4f1R43mgXUgweQS
	xmIPmgYe1Ix4q/YQx7CRXxB3p7oAdQebISSMj722aINE1wRd+iO5JTpKPMZY170j0Xvt8HSSe/ftZ
	r0tE6CepofDXYesjYOIIfnL3ZvpwFeA/PI70MM37U3H/jPiQz+f4GEqHJItLiNRvxGqY/+xMnMwpi
	EuRzCN+TaVKhoCLV+47Py/t3gAFuvYjw==;
Received: from mac by deneb with local (Exim 4.92)
	(envelope-from <mac@mcrowe.com>)
	id 1ih7oO-00051K-OS; Tue, 17 Dec 2019 08:02:32 +0000
From: Mike Crowe <mac@mcrowe.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Dec 2019 08:02:25 +0000
Message-Id: <20191217080225.897186-1-mac@mcrowe.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfGLUATPXCOYJpQuQy198a33RlJDad5a271DTAcmVHP2em0wX7ZMQ8d6JFzoGQ4BmN4DObN9og7IOiaZJD7L8RsaXF2WZv1tE1xoFLAmYQdhQa83pSli2
	9iSrxk1ty9AEvWuVBlcEqOWxqlcN7QVF4fmk09/vNjmlQZa0Qdz6O2sq
Cc: Mike Crowe <mac@mcrowe.com>
Subject: [PATCH] multilib.conf: Ensure that RECIPE_SYSROOT is unchanged for native
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
X-List-Received-Date: Tue, 17 Dec 2019 08:10:06 -0000
Content-Transfer-Encoding: 8bit

Ensure that RECIPE_SYSROOT is the same for -native recipes whether
multilib.conf is included or not.

Without this change task signatures for -native recipes change when
switching between MACHINEs that require multilib.conf and those that
don't.

This fix was one of the ones suggested by Khem Raj in
http://lists.openembedded.org/pipermail/openembedded-core/2019-December/290303.html

Add test_sstate_multilib_or_not_native_samesigs test case to
sstatetests.py to ensure that this stays fixed.

Signed-off-by: Mike Crowe <mac@mcrowe.com>
---
 meta/conf/multilib.conf                     |  1 +
 meta/lib/oeqa/selftest/cases/sstatetests.py | 40 +++++++++++++++++++++
 2 files changed, 41 insertions(+)

diff --git a/meta/conf/multilib.conf b/meta/conf/multilib.conf
index cfed3fbbd0..58f2ac5c86 100644
--- a/meta/conf/multilib.conf
+++ b/meta/conf/multilib.conf
@@ -9,6 +9,7 @@ MULTILIBS ??= "multilib:lib32"
 STAGING_DIR_HOST = "${WORKDIR}/${MLPREFIX}recipe-sysroot"
 STAGING_DIR_TARGET = "${WORKDIR}/${MLPREFIX}recipe-sysroot"
 RECIPE_SYSROOT = "${WORKDIR}/${MLPREFIX}recipe-sysroot"
+RECIPE_SYSROOT_class-native = "${WORKDIR}/recipe-sysroot"
 
 INHERIT += "multilib_global"
 
diff --git a/meta/lib/oeqa/selftest/cases/sstatetests.py b/meta/lib/oeqa/selftest/cases/sstatetests.py
index 6757a0ec68..9adb511960 100644
--- a/meta/lib/oeqa/selftest/cases/sstatetests.py
+++ b/meta/lib/oeqa/selftest/cases/sstatetests.py
@@ -446,6 +446,46 @@ BB_SIGNATURE_HANDLER = "OEBasicHash"
         self.assertCountEqual(files1, files2)
 
 
+    def test_sstate_multilib_or_not_native_samesigs(self):
+        """The sstate checksums of two native recipes (and their dependencies)
+        where the target is using multilib in one but not the other
+        should be the same. We use the qemux86copy machine to test
+        this.
+        """
+
+        self.write_config("""
+TMPDIR = \"${TOPDIR}/tmp-sstatesamehash\"
+TCLIBCAPPEND = \"\"
+MACHINE = \"qemux86\"
+require conf/multilib.conf
+MULTILIBS = "multilib:lib32"
+DEFAULTTUNE_virtclass-multilib-lib32 = "x86"
+BB_SIGNATURE_HANDLER = "OEBasicHash"
+""")
+        self.track_for_cleanup(self.topdir + "/tmp-sstatesamehash")
+        bitbake("binutils-native  -S none")
+        self.write_config("""
+TMPDIR = \"${TOPDIR}/tmp-sstatesamehash2\"
+TCLIBCAPPEND = \"\"
+MACHINE = \"qemux86copy\"
+BB_SIGNATURE_HANDLER = "OEBasicHash"
+""")
+        self.track_for_cleanup(self.topdir + "/tmp-sstatesamehash2")
+        bitbake("binutils-native -S none")
+
+        def get_files(d):
+            f = []
+            for root, dirs, files in os.walk(d):
+                for name in files:
+                    f.append(os.path.join(root, name))
+            return f
+        files1 = get_files(self.topdir + "/tmp-sstatesamehash/stamps")
+        files2 = get_files(self.topdir + "/tmp-sstatesamehash2/stamps")
+        files2 = [x.replace("tmp-sstatesamehash2", "tmp-sstatesamehash") for x in files2]
+        self.maxDiff = None
+        self.assertCountEqual(files1, files2)
+
+
     def test_sstate_noop_samesigs(self):
         """
         The sstate checksums of two builds with these variables changed or
-- 
2.24.0


