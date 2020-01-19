Return-Path: <akuster808@gmail.com>
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com
	[209.85.216.50])
	by mail.openembedded.org (Postfix) with ESMTP id A580F7FBEB
	for <openembedded-core@openembedded.org>;
	Sun, 19 Jan 2020 21:37:27 +0000 (UTC)
Received: by mail-pj1-f50.google.com with SMTP id bg7so6090163pjb.5
	for <openembedded-core@openembedded.org>;
	Sun, 19 Jan 2020 13:37:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=VKTwpnv4frnlofX5Da8rF+/n+OTwRkliYxLxtbolgCU=;
	b=Tm4s7iPWzes37jeDGk40IcxLjw/IS5TrUWx4SKzVdWtY2vjjdj19ciQ6+GjUJUJ9qd
	DSx2K7fOZhxDpsM6/a2pCaVbajit9D2fes0CNE3+30CYAyFT/6KEqCH/D9dcZvezrM8O
	s8xi6FryvfEuwIaVVz5P/RALQG5gS75sxt8xD8T+PlcbqM9JEoLNOiE4rOviCUMbbppP
	YkVvRfKNYU8XxKgYB0a6GffASOC+ks+/fJyu7U9ToAS0RIku7Qe6aHCmIf38yFx3qXDQ
	I1ZY8BwWQA6KGDfcpVCOvJ/YIFWdq4E8EZQn1IxwVLDWy0Kc+Nk1V6GBulCGV0/IvE9+
	zpZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=VKTwpnv4frnlofX5Da8rF+/n+OTwRkliYxLxtbolgCU=;
	b=ZJy9A/9ajOnL63Y3CS3YDVDyd8XRgB0vvKer4Vrwj+KBSs24mSflcKtbfKouKP59of
	zNMGrWu4nlgejIPH3R/dEnv/Lm6LT8jO4STJi1Ogi6X0NKHY/4DRvBeaw9iwc4M2Yn02
	ux1a0lUAEcPCh9qeAduOSV2TX5oqJmpEsZ5xMcs+wL8RP2zs6XfiWcHtEfKYipqU3Y/h
	fuf2V20hDJ/o/rr1j2T72DDcpSfMch8Rv/LhREzo/OQKl1NE5vZEbVxrHG09wpERsbSX
	EnkaABswEa4Fru6ru4StcEOG/+fDLul4DVrW9aEYj5KwPj0jlkRZvQDg8iCUp6Or/LCe
	FNrA==
X-Gm-Message-State: APjAAAW9XEuH/3swyJYR1HhwevcSFrqK8Vvbl+4nwcJ2yJmxU9NRkBJU
	fXaqNc2/6Jgn+qOT73eLRU2HLRei
X-Google-Smtp-Source: APXvYqyhCXpR4+yYTAZ8NrlmSEcn9VMDJmgCzHt8lsJ1dpryofOJEol0xtwmNqKxivWTz3MKKc+Vhg==
X-Received: by 2002:a17:902:bf03:: with SMTP id
	bi3mr11059848plb.119.1579469848605; 
	Sun, 19 Jan 2020 13:37:28 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:450d:e003:9142:f492])
	by smtp.gmail.com with ESMTPSA id
	q15sm34912518pgi.55.2020.01.19.13.37.27
	for <openembedded-core@openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 19 Jan 2020 13:37:28 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@openembedded.org
Date: Sun, 19 Jan 2020 13:37:20 -0800
Message-Id: <c3e957409bf68e7b310e27781ac91d24cf4452bf.1579469619.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1579469619.git.akuster808@gmail.com>
References: <cover.1579469619.git.akuster808@gmail.com>
Subject: [zeus 2/6] multilib.conf: Ensure that RECIPE_SYSROOT is unchanged for native
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
X-List-Received-Date: Sun, 19 Jan 2020 21:37:27 -0000

From: Mike Crowe <mac@mcrowe.com>

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
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit aa05f1ded71366b86eda7fce24d8b5395e85ada2)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
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
2.17.1


