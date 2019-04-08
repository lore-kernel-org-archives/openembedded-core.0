Return-Path: <just.another.mariano@gmail.com>
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
	[209.85.210.67])
	by mail.openembedded.org (Postfix) with ESMTP id 9E3037D48D
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Apr 2019 01:22:28 +0000 (UTC)
Received: by mail-ot1-f67.google.com with SMTP id k21so10540979otf.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 07 Apr 2019 18:22:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=0VeqvEeSq68qy+glX/ndZUhEIdqlWVm7J4dV2naECq0=;
	b=ZcAajI/vAxEwJdhCsLXYpX+mpqScFMbJ6KbLmUinZl5vRiND/H5XzF1ZwowWffCcpV
	A/5Dw3fPdn2Mk5hf3WDyPdTUMVfvbSAG195TaKwBK8WNDN9clUraqRoqrgt/IuNZ7fjk
	c+3SX33lJkFuTT6U3dxIVNFiEvosRfxzTHjJnf7ms2T1/CpEFOlWleff8GgdQjEeaL1g
	gd6YGE4l8P38L/eRHb2MFrh+HT/BNbYFv9Qu/7zLQFIUIAB/QkZUMdoZyIb58c8GCFNQ
	Oxmo9wXOCDbVR/4ei/WokTxX+xiceVCxbkndkEdcl80R3B8wLN4ovkFXKMiuzhJgq0OP
	HxOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=0VeqvEeSq68qy+glX/ndZUhEIdqlWVm7J4dV2naECq0=;
	b=Di5eOdTEJbEvBwp2tB0ypp9j/KeS1vjidNYHtFjTN3I22+KXgy0dOtr4OA7BmIti/S
	nXdEYHN9ydCEg8nJo05exKfn1k/9d2fTBRKGrPUuHVz1IdCsTmUG+PqIf1aNypweYpAJ
	o7zbMfqxvCSybcjGtrN28E0GM94msn1g/1tMv2gU8W2eRLvGryTLxMGH7GtSnN6ozCCV
	KtBiibnGpaMp3LYnLmWYHR4aMxLdAFQ1NQXfsPvEhpFmBBYz24mNMakNJ/bDSif0Xqd4
	Al2y6olZ9AxgrXXAw1bCW4DA9cZJN/fm5XgkVwuqABd6jlKZJd2cXEeURTFeBc4eY7Wp
	HkZA==
X-Gm-Message-State: APjAAAUHsN5ABa3/nGZWUTgaZgItT52oF8mWIxA6/ItW2FSvKSbBBhOT
	A5kI2siqvTj9SJ72EHzoviMya37C
X-Google-Smtp-Source: APXvYqzYZZT9mHZVNQzjvT4+aK6VZZx1TXNwc05zkSb/wg9wyjznSF4akCvQKZv3CxAbKJtevN34sw==
X-Received: by 2002:a9d:70d2:: with SMTP id w18mr17734138otj.127.1554686549468;
	Sun, 07 Apr 2019 18:22:29 -0700 (PDT)
Received: from ultima.ninicasiopea.net
	([2605:a601:43d5:f700:215:17ff:fe90:1065])
	by smtp.googlemail.com with ESMTPSA id
	z2sm16258206ota.56.2019.04.07.18.22.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 07 Apr 2019 18:22:29 -0700 (PDT)
From: Mariano Lopez <just.another.mariano@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  7 Apr 2019 20:21:56 -0500
Message-Id: <30894b1acf26338afdf3fc6f2ecdc7b322bd44c4.1554686123.git.just.another.mariano@gmail.com>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <cover.1554686123.git.just.another.mariano@gmail.com>
References: <cover.1554686123.git.just.another.mariano@gmail.com>
MIME-Version: 1.0
Subject: [PATCH v3 2/4] ptest.bbclass: Add feature to populate a binary directory
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
X-List-Received-Date: Mon, 08 Apr 2019 01:22:28 -0000
Content-Transfer-Encoding: 8bit

This adds the functionality to create a binary directory within
PTEST_PATH directory. This directory will be populated with
symlinks pointing to the binaries installed by the package and
then renamed by update-alternatives. This way the ptest only needs
to source this binary directory in order to use the expected
binaries.

To enable this feature just add PTEST_BINDIR = "1" to the recipe.

[YOCTO #12597]
[YOCTO #13238]

Signed-off-by: Mariano Lopez <just.another.mariano@gmail.com>
---
 meta/classes/ptest.bbclass | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/meta/classes/ptest.bbclass b/meta/classes/ptest.bbclass
index 97865c9338..0c37447881 100644
--- a/meta/classes/ptest.bbclass
+++ b/meta/classes/ptest.bbclass
@@ -65,6 +65,37 @@ do_install_ptest_base() {
     done
 }
 
+PTEST_BINDIR_PKGD_PATH = "${PKGD}${PTEST_PATH}/bin"
+
+# This function needs to run after apply_update_alternative_renames because the
+# aforementioned function will update the ALTERNATIVE_LINK_NAME flag. Append is
+# used here to make this function to run as late as possible.
+PACKAGE_PREPROCESS_FUNCS_append = "${@bb.utils.contains("PTEST_BINDIR", "1", " ptest_update_alternatives", "", d)}"
+
+python ptest_update_alternatives() {
+    """
+    This function will generate the symlinks in the PTEST_BINDIR_PKGD_PATH
+    to match the renamed binaries by update-alternatives.
+    """
+
+    if not bb.data.inherits_class('update-alternatives', d) \
+           or not update_alternatives_enabled(d):
+        return
+
+    bb.note("Generating symlinks for ptest")
+    bin_paths = { os.environ["bindir"], os.environ["base_bindir"],
+                  os.environ["sbindir"], os.environ["base_sbindir"] }
+    ptest_bindir = d.getVar("PTEST_BINDIR_PKGD_PATH")
+    os.mkdir(ptest_bindir)
+    for pkg in (d.getVar('PACKAGES') or "").split():
+        alternatives = update_alternatives_alt_targets(d, pkg)
+        for alt_name, alt_link, alt_target, _ in alternatives:
+            # Some alternatives are for man pages,
+            # check if the alternative is in PATH
+            if os.path.dirname(alt_link) in bin_paths:
+                os.symlink(alt_target, os.path.join(ptest_bindir, alt_name))
+}
+
 do_configure_ptest_base[dirs] = "${B}"
 do_compile_ptest_base[dirs] = "${B}"
 do_install_ptest_base[dirs] = "${B}"
-- 
2.19.2


