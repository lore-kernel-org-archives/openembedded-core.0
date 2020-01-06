Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
	[209.85.221.54])
	by mail.openembedded.org (Postfix) with ESMTP id 57D377F7B3
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Jan 2020 00:06:52 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id q6so47797498wro.9
	for <openembedded-core@lists.openembedded.org>;
	Sun, 05 Jan 2020 16:06:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=D2PXaA1XBwO//62AHUwUmhpUXO9tZ1dfsFg2mXb6s5o=;
	b=PS61F7Dp6/yimgQmS2o1UcwDWynrU6xL1tg8oE96/kc+znI/+lKQlRM4tDWqWtoClZ
	We9OMM5sjrwuh2wcHM77zJz1ZoKuMdcBVyLeNpNhADhgyb2aIfa4fvFI0Zhd6/HD9DDf
	hNNYBqPuumh2C0L2FTBt89VQSsc2qUmANtN4w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=D2PXaA1XBwO//62AHUwUmhpUXO9tZ1dfsFg2mXb6s5o=;
	b=Q2gTrYk1KO30GZZaoK2aEm4F197YS0eDmnx8/gpSuAUDaMurpY8mD1a5gyBZCvQKTi
	Wo9cP3XbzwVldVOA0gW9gTLnE2GMC4lQgbp0Mqcw21761ZaInJA8oB4Zs3j0gIKDBYiG
	fgwPzrOzUUt9w/dk4SgfF/53sz1p8me9TAKLtX4SaaAHJ2/CaNpgQ8Gk/k+DcXB1otHP
	FX1ZrmTPqxyoSZSrWv88ARxWgqJ/KA/EJxWT8ASsXwABpLQQhjyncoulhEJAPoT3JaGl
	i3d81KduTSEXTABGsx/OMJxwPRdynJzUdj1l2ps17dY+tmw4GkUppkIyVRTkV3q0AJKT
	eLOg==
X-Gm-Message-State: APjAAAWfS+r4TS9oU0elk3ByhNTFNyK3M46hNiDJmdz91zKMnxCgo5E8
	jt8S0ZrWwR6AxN12J43gZLEnfedcu4g=
X-Google-Smtp-Source: APXvYqysRbtMo+p3f73UBAbtnDqMP+R5WzJlGh2x4BkDs5OQwdguiDNRaojmmsezwsysuOujUvgQuQ==
X-Received: by 2002:adf:f501:: with SMTP id q1mr71531731wro.263.1578269212681; 
	Sun, 05 Jan 2020 16:06:52 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	n10sm69174229wrt.14.2020.01.05.16.06.51
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 05 Jan 2020 16:06:52 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Mon,  6 Jan 2020 00:06:47 +0000
Message-Id: <20200106000650.26105-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH 1/4] sstate: Add extra directory level
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
X-List-Received-Date: Mon, 06 Jan 2020 00:06:52 -0000
Content-Transfer-Encoding: 8bit

We're having speed issues on the autobuilder due to the numbers of files in sstate
directories. We previously split these by the first two characters of the hash.
This change extends this to split by the next two characters as well, creating
more layers of directories.

This should signifiantly speed up eSDK builds on the autobuilder as the current
sstate layout simply isn't scaling there but addresses a general complaint.

gen-lockedsig-cache needed to be updated for the new split level sstate.

Also update tests for new layout.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/sstate.bbclass             |  4 ++--
 meta/lib/oeqa/selftest/cases/signing.py |  4 ++--
 meta/lib/oeqa/selftest/cases/sstate.py  |  4 ++--
 scripts/gen-lockedsig-cache             | 13 ++++++++++---
 4 files changed, 16 insertions(+), 9 deletions(-)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index c0329cd5d18..7d2cb9eb840 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -6,7 +6,7 @@ SSTATE_MANFILEPREFIX = "${SSTATE_MANIFESTS}/manifest-${SSTATE_MANMACH}-${PN}"
 def generate_sstatefn(spec, hash, d):
     if not hash:
         hash = "INVALID"
-    return hash[:2] + "/" + spec + hash
+    return hash[:2] + "/" + hash[2:4] + "/" + spec + hash
 
 SSTATE_PKGARCH    = "${PACKAGE_ARCH}"
 SSTATE_PKGSPEC    = "sstate:${PN}:${PACKAGE_ARCH}${TARGET_VENDOR}-${TARGET_OS}:${PV}:${PR}:${SSTATE_PKGARCH}:${SSTATE_VERSION}:"
@@ -15,7 +15,7 @@ SSTATE_PKGNAME    = "${SSTATE_EXTRAPATH}${@generate_sstatefn(d.getVar('SSTATE_PK
 SSTATE_PKG        = "${SSTATE_DIR}/${SSTATE_PKGNAME}"
 SSTATE_EXTRAPATH   = ""
 SSTATE_EXTRAPATHWILDCARD = ""
-SSTATE_PATHSPEC   = "${SSTATE_DIR}/${SSTATE_EXTRAPATHWILDCARD}*/${SSTATE_PKGSPEC}"
+SSTATE_PATHSPEC   = "${SSTATE_DIR}/${SSTATE_EXTRAPATHWILDCARD}*/*/${SSTATE_PKGSPEC}"
 
 # explicitly make PV to depend on evaluated value of PV variable
 PV[vardepvalue] = "${PV}"
diff --git a/meta/lib/oeqa/selftest/cases/signing.py b/meta/lib/oeqa/selftest/cases/signing.py
index b65f3de64c4..9ea31328eff 100644
--- a/meta/lib/oeqa/selftest/cases/signing.py
+++ b/meta/lib/oeqa/selftest/cases/signing.py
@@ -157,8 +157,8 @@ class Signing(OESelftestTestCase):
             bitbake('-c clean %s' % test_recipe)
             bitbake('-c populate_lic %s' % test_recipe)
 
-            recipe_sig = glob.glob(sstatedir + '/*/*:ed:*_populate_lic.tgz.sig')
-            recipe_tgz = glob.glob(sstatedir + '/*/*:ed:*_populate_lic.tgz')
+            recipe_sig = glob.glob(sstatedir + '/*/*/*:ed:*_populate_lic.tgz.sig')
+            recipe_tgz = glob.glob(sstatedir + '/*/*/*:ed:*_populate_lic.tgz')
 
             self.assertEqual(len(recipe_sig), 1, 'Failed to find .sig file.')
             self.assertEqual(len(recipe_tgz), 1, 'Failed to find .tgz file.')
diff --git a/meta/lib/oeqa/selftest/cases/sstate.py b/meta/lib/oeqa/selftest/cases/sstate.py
index 410dec64fcd..80ce9e353c0 100644
--- a/meta/lib/oeqa/selftest/cases/sstate.py
+++ b/meta/lib/oeqa/selftest/cases/sstate.py
@@ -56,11 +56,11 @@ class SStateBase(OESelftestTestCase):
     def search_sstate(self, filename_regex, distro_specific=True, distro_nonspecific=True):
         result = []
         for root, dirs, files in os.walk(self.sstate_path):
-            if distro_specific and re.search("%s/[a-z0-9]{2}$" % self.hostdistro, root):
+            if distro_specific and re.search(r"%s/%s/[a-z0-9]{2}/[a-z0-9]{2}$" % (self.sstate_path, self.hostdistro), root):
                 for f in files:
                     if re.search(filename_regex, f):
                         result.append(f)
-            if distro_nonspecific and re.search("%s/[a-z0-9]{2}$" % self.sstate_path, root):
+            if distro_nonspecific and re.search(r"%s/[a-z0-9]{2}/[a-z0-9]{2}$" % self.sstate_path, root):
                 for f in files:
                     if re.search(filename_regex, f):
                         result.append(f)
diff --git a/scripts/gen-lockedsig-cache b/scripts/gen-lockedsig-cache
index 9bfae9d8323..6a7d2859104 100755
--- a/scripts/gen-lockedsig-cache
+++ b/scripts/gen-lockedsig-cache
@@ -78,11 +78,18 @@ files = set()
 sstate_content_cache = {}
 for s in sigs:
     prefix = s[:2]
+    prefix2 = s[2:4]
     if prefix not in sstate_content_cache:
         sstate_content_cache[prefix] = build_sha_cache(prefix)
-
-    for f in sstate_content_cache[prefix][s]:
-        files.add(f)
+    if prefix2 not in sstate_content_cache[prefix]:
+        sstate_content_cache[prefix][prefix2] = build_sha_cache(prefix + "/" + prefix2)
+
+    if s in sstate_content_cache[prefix]:
+        for f in sstate_content_cache[prefix][s]:
+            files.add(f)
+    if s in sstate_content_cache[prefix][prefix2]:
+        for f in sstate_content_cache[prefix][prefix2][s]:
+            files.add(f)
 
 elapsed = time.perf_counter() - start_time
 print("Gathering file list took %.1fs" % elapsed)
-- 
2.20.1


