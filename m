Return-Path: <just.another.mariano@gmail.com>
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com
	[209.85.210.65])
	by mail.openembedded.org (Postfix) with ESMTP id 17B657D540
	for <openembedded-core@lists.openembedded.org>;
	Sun,  7 Apr 2019 17:16:19 +0000 (UTC)
Received: by mail-ot1-f65.google.com with SMTP id e5so9890765otk.12
	for <openembedded-core@lists.openembedded.org>;
	Sun, 07 Apr 2019 10:16:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=0VeqvEeSq68qy+glX/ndZUhEIdqlWVm7J4dV2naECq0=;
	b=fJjFwijCKsurooL8b7PqkFmYwal3WiSWgMFl1SGo2V7r8WYlzzKzQaDpoXCklFII8A
	A9hBbBMuQWxDA1N1o2v78iebdKHPt7P7ijUvsAJOz59ShogmOBEPZQ1LnyBP8RLXLmN0
	5r4bbuyydze/ZyFABbZdGb5R6BreSAxAsc1NmiDrJAAxIj5PELNj5OT8JNVLdFoMvRXc
	BxQYRCNz+ooVS5ktoIL87d2MKmMwhspw9nw9Oo6NyjRwIm/8qmzizZnyuibF8lBbfz/+
	qHejyqcGntS6ma3uF4NT3bduqTGnt54UT7TRzA4H5E917fp79/QnRAioqd8SPq/3AsEO
	5A3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=0VeqvEeSq68qy+glX/ndZUhEIdqlWVm7J4dV2naECq0=;
	b=BG7ZQvr48UgLwCZk6W1h1ZytLHIRysDV6FirlGsiLGMiLV6dTUOfXdBeyn0d0+W1YS
	2Fu653XG/xDpDDowlJ/ZmloxJmENzFYC3WoKyjRHiaZyYSK0qFXxafqeRzEl2aqNikJj
	RIIAcEaV0++OhYIFxmWJzbJjgrwL+e3Y1FBa7TQZXxD2fPwekN9ovgSREXOCzF9j2kew
	TIV78Ul9pFFk8NGsZc63VWH483xGnKO5JYGDpCNsZw09p68K3jHrYp+7aj59RItW2NSf
	bx5oInpWwJm0JJyq0EpykwKiVnOBP5KITpScE7X+vwNh3rlqR/QhyUjj/CpcHtelKji5
	gfyQ==
X-Gm-Message-State: APjAAAUpAGw1MSIfJEoinHR6VQUfWcyOtyMMfpq7/heJ/6oRvTfOmHNF
	Mq3EALabZ9CxI901vLhG8/QcLWyc
X-Google-Smtp-Source: APXvYqzdeOVJ0OnMouPuUR6Bd3qhqeiFBGVCzUGNrHEc/BAWbWVucknMBU0fAUFIJzltfLuD868P0Q==
X-Received: by 2002:a9d:51d2:: with SMTP id d18mr15250079oth.61.1554657381045; 
	Sun, 07 Apr 2019 10:16:21 -0700 (PDT)
Received: from ultima.ninicasiopea.net
	([2605:a601:43d5:f700:215:17ff:fe90:1065])
	by smtp.googlemail.com with ESMTPSA id
	d70sm14952535oih.18.2019.04.07.10.16.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 07 Apr 2019 10:16:20 -0700 (PDT)
From: Mariano Lopez <just.another.mariano@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  7 Apr 2019 12:15:58 -0500
Message-Id: <c738d94204a42f05ddc30fb75f429fc9003224b2.1554656203.git.just.another.mariano@gmail.com>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <cover.1554656203.git.just.another.mariano@gmail.com>
References: <cover.1554656203.git.just.another.mariano@gmail.com>
MIME-Version: 1.0
Subject: [PATCH v2 2/4] ptest.bbclass: Add feature to populate a binary directory
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
X-List-Received-Date: Sun, 07 Apr 2019 17:16:20 -0000
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


