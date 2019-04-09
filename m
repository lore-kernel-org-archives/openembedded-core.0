Return-Path: <just.another.mariano@gmail.com>
Received: from mail-oi1-f196.google.com (mail-oi1-f196.google.com
	[209.85.167.196])
	by mail.openembedded.org (Postfix) with ESMTP id 860077D52B
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Apr 2019 05:44:29 +0000 (UTC)
Received: by mail-oi1-f196.google.com with SMTP id v84so12540754oif.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 Apr 2019 22:44:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=l356ZyO+ZkJalr+dKa48vgIs8gBvq0H2UqKHroJQei8=;
	b=PfygPOdTTyzlKZy24rwEpihp8pAjVZtJJX6TU9vmJljcChexbtFkMQvNfpE7h9SDW/
	S+O6bEpANRF6Ipf3XakR+RsbrhwFNxg4nfBxSWom40sRLRB2j/fs7vFUsZADPRXlqkWQ
	ejTKqDFNa+S0Co162X51mt10K53O0lrQuuIqQ5BvBpc9Nj96jejCU4pPaftSIwfUezxq
	UwjZ+D3tBSi1TJP3jowApaaaYAz6DmAkTf4PvHvz/8ug5d2SBLTHTz0eGa+KjXPEySmC
	u2MYxNwPEb6NCYLydLFP0m8wHJl/irwZAkyoQX3audJF+sv66psKsnxq9TIqmlObh6ZK
	bGSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=l356ZyO+ZkJalr+dKa48vgIs8gBvq0H2UqKHroJQei8=;
	b=D2uwCJmeVf+/TQTWaIUWZtiO5X+2NWIkMVOl05s1GKDPho6PrPu7BBrnQ3ZuTH4p7a
	N1sC6DBd5acB6mBFWgnL490HvQbEOZC5H2mIIGmh6bL0IlMr4Dk1wW30HObkBJzHuroG
	/rG064QRuv66lpZGghK1/mEPje+qw7jKHt1kE1MjK1kQ+/ZN1DOUfsL4LdUfoYu4smlb
	RDC5ZiG0S1HzNpZNz44+OO5EtfGVfP32jJfoA3Yiwfytf+S/GojBGT4KJHVTj3KHFJV3
	IJQO/ItLqXcxVTJ2P3L1AXsoyCbA1tq/eE5jYT2QuN0TEG738UFu/00cGKZO+pL7AS+M
	Id3g==
X-Gm-Message-State: APjAAAVXujvjrdKY1Sft0dm7rdSg1OZfUoCPWtaRu4PUQ+Cz+RVVxgLd
	OLzFoouwUENL+3YsZgvdW/fgdUEY
X-Google-Smtp-Source: APXvYqzUpr/9LNnbcTAOIP9grjcXlHQw3peoB6kwH6Dyj0bdLcnHYFI5X/7yKv1DRZufeWDtBxVKbA==
X-Received: by 2002:aca:1303:: with SMTP id e3mr17406941oii.140.1554788670456; 
	Mon, 08 Apr 2019 22:44:30 -0700 (PDT)
Received: from ultima.ninicasiopea.net
	([2605:a601:43d5:f700:215:17ff:fe90:1065])
	by smtp.googlemail.com with ESMTPSA id
	n16sm11787705oic.7.2019.04.08.22.44.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 08 Apr 2019 22:44:30 -0700 (PDT)
From: Mariano Lopez <just.another.mariano@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  9 Apr 2019 00:44:13 -0500
Message-Id: <102ba655188d6b90411171468c0c354602e3e549.1554787765.git.just.another.mariano@gmail.com>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <cover.1554787765.git.just.another.mariano@gmail.com>
References: <cover.1554787765.git.just.another.mariano@gmail.com>
MIME-Version: 1.0
Subject: [PATCH v4 2/4] ptest.bbclass: Add feature to populate a binary directory
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
X-List-Received-Date: Tue, 09 Apr 2019 05:44:29 -0000
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
 meta/classes/ptest.bbclass | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/meta/classes/ptest.bbclass b/meta/classes/ptest.bbclass
index 97865c9338..e87a9659cb 100644
--- a/meta/classes/ptest.bbclass
+++ b/meta/classes/ptest.bbclass
@@ -65,6 +65,38 @@ do_install_ptest_base() {
     done
 }
 
+PTEST_BINDIR_PKGD_PATH = "${PKGD}${PTEST_PATH}/bin"
+
+# This function needs to run after apply_update_alternative_renames because the
+# aforementioned function will update the ALTERNATIVE_LINK_NAME flag. Append is
+# used here to make this function to run as late as possible.
+PACKAGE_PREPROCESS_FUNCS_append = "${@bb.utils.contains('PTEST_BINDIR', '1', \
+                                    bb.utils.contains('PTEST_ENABLED', '1', ' ptest_update_alternatives', '', d), '', d)}"
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


