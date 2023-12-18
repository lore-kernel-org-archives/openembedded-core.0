Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F022C46CD8
	for <webhook@archiver.kernel.org>; Mon, 18 Dec 2023 08:44:24 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.web11.40232.1702889056913233718
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Dec 2023 00:44:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=glRgszOs;
 spf=pass (domain: gmail.com, ip: 209.85.208.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-550dd0e3304so3267963a12.1
        for <openembedded-core@lists.openembedded.org>; Mon, 18 Dec 2023 00:44:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702889055; x=1703493855; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FcSF4UtUs94nxHswCiwY5ym4j6x6+XsWShzrdjCHf4E=;
        b=glRgszOs47y5ZI4siXRJtWhLF+74um4TS0e6KRGFPGwfrqaafDtvWEFHPlzGk/mjr6
         UKGRyWeBLEBJwQ3uTyZlEGSA3EhFA17XL6vyqkpTIRG1gDK4V1rKYZVxrBJm5AHN0wI2
         b9q1vztBFdwRSEaSpAgnB4p+jvscFXWie+9NP5iqHLaeVLTIQ4p1yAyxIN20UwDqdXw9
         UNSOm8SKvXj7QCUR8rwwzgCAXZjJCGEv/Np6MqP/KayHAXaeAQfI4+pQgUYacmvXFvgU
         o7i1cJAKvoqduFRaC/VfE/IT2R3xJNmfeSDtrkOwbRnEOegrxocS72755MZCcGZTLFbk
         u4lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702889055; x=1703493855;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FcSF4UtUs94nxHswCiwY5ym4j6x6+XsWShzrdjCHf4E=;
        b=L4Agh1mUiJJvjy/0ABHXj9D9tLvX3hZ2VOShn1HNn5OaqePydhyQ0lw87LGHGNB0CJ
         fxx9wuCwm3RFhN2zyl5CTLQxy766Y+sj5gkXMIKUMt+Ao3CGWc1YjS9NQE0x38M6rh09
         42xsLlSMNp1Tp9BgCSNbE0/JUQ39fzN7tWMgewxwjcktuAfS7Z38WSZqgoinkJRl6Dry
         iIMNZI7mOkOrTuCGBvX/NfkoGa/6DaUDlWrm8TiHcMJflnh9bKvdY+FkIAXkFmq6ORW9
         Upe4HC4os8xjZtT3S4d7ARxIS8GaPdQRZxaMMJwFrMoZjBiy1UMyJO0LJ9fA0zdTGRLZ
         S7Fg==
X-Gm-Message-State: AOJu0YxbIu0InfVOEPBeToV1fvvcxyjRT04wMlQC9/HPIs8MT8BcZeLF
	Xf5rqW5VcFAP9wrs8mKDyAAc7t6z9jE=
X-Google-Smtp-Source: AGHT+IFyi/JkVk7uoQibtFw3I+cAmDUyMOfMFDOpUIkSYRbkV3NZKhIkhF9gZ/oeMft7DcZyCY8EoA==
X-Received: by 2002:a17:906:1799:b0:a18:ad93:460d with SMTP id t25-20020a170906179900b00a18ad93460dmr7937216eje.69.1702889054584;
        Mon, 18 Dec 2023 00:44:14 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id vt6-20020a170907a60600b00a1ce98016b6sm14016299ejc.97.2023.12.18.00.44.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Dec 2023 00:44:14 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 2/7] selftest/sstatetests: fix up printdiff test to match rework of printdiff logic
Date: Mon, 18 Dec 2023 09:43:58 +0100
Message-Id: <20231218084403.599015-2-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231218084403.599015-1-alex@linutronix.de>
References: <20231218084403.599015-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Dec 2023 08:44:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192613

Other than the formatting changes, there are two functional ones:

- use perlcross instead of quilt, as quilt is special in the sense
of being excluded from task hash calculcations. perlcross is a full
participant.

- run the full test (local + sstate) for gcc do_preconfiure change
as the necessary fix has been implemented
(sstatesig/find_siginfo: special-case gcc-source when looking in sstate caches)

Note that when several tasks are found to have changed (as is the case
when base do_configure is adjusted), find_siginfo() runs
glob.glob("*/*/*taskname*") against autobuilder sstate cache for each
of those tasks (six or seven times). This is an expensive operation
taking several minutes. I left it in for now, but if it's proven too slow
the test would have to be reduced to checking a specific base recipe
(e.g. zstd-native) rather than a distant image target.

[YOCTO #15289]

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../perlcross_%.bbappend}                     |  0
 meta/lib/oeqa/selftest/cases/sstatetests.py   | 22 +++++++++++--------
 2 files changed, 13 insertions(+), 9 deletions(-)
 rename meta-selftest/recipes-test/{quilt-native/quilt-native_%.bbappend => perlcross/perlcross_%.bbappend} (100%)

diff --git a/meta-selftest/recipes-test/quilt-native/quilt-native_%.bbappend b/meta-selftest/recipes-test/perlcross/perlcross_%.bbappend
similarity index 100%
rename from meta-selftest/recipes-test/quilt-native/quilt-native_%.bbappend
rename to meta-selftest/recipes-test/perlcross/perlcross_%.bbappend
diff --git a/meta/lib/oeqa/selftest/cases/sstatetests.py b/meta/lib/oeqa/selftest/cases/sstatetests.py
index f827615ba1b..6af3c8f2178 100644
--- a/meta/lib/oeqa/selftest/cases/sstatetests.py
+++ b/meta/lib/oeqa/selftest/cases/sstatetests.py
@@ -824,14 +824,16 @@ TMPDIR = "${{TOPDIR}}/tmp-sstateprintdiff-difftmp-{}"
 
 
     # Check if printdiff walks the full dependency chain from the image target to where the change is in a specific recipe
-    def test_image_minimal_vs_quilt(self):
-        expected_output = ("Task quilt-native:do_install couldn't be used from the cache because:",
+    def test_image_minimal_vs_perlcross(self):
+        expected_output = ("Task perlcross-native:do_install couldn't be used from the cache because:",
 "We need hash",
 "most recent matching task was")
-        expected_sametmp_output = expected_output + ("Variable do_install value changed",'+    echo "this changes the task signature"')
+        expected_sametmp_output = expected_output + (
+"Variable do_install value changed",
+'+    echo "this changes the task signature"')
         expected_difftmp_output = expected_output
 
-        self.run_test_printdiff_changerecipe("core-image-minimal", "quilt-native", "-c do_install quilt-native",
+        self.run_test_printdiff_changerecipe("core-image-minimal", "perlcross", "-c do_install perlcross-native",
 """
 do_install:append() {
     echo "this changes the task signature"
@@ -846,10 +848,10 @@ expected_sametmp_output, expected_difftmp_output)
         expected_output = ("Task {}:do_preconfigure couldn't be used from the cache because:".format(gcc_source_pn),
 "We need hash",
 "most recent matching task was")
-        expected_sametmp_output = expected_output + ("Variable do_preconfigure value changed",'+    print("this changes the task signature")')
-        #FIXME: printdiff is supposed to find at least one preconfigure task signature in the sstate cache, but isn't able to
-        #expected_difftmp_output = expected_output
-        expected_difftmp_output = ()
+        expected_sametmp_output = expected_output + (
+"Variable do_preconfigure value changed",
+'+    print("this changes the task signature")')
+        expected_difftmp_output = expected_output
 
         self.run_test_printdiff_changerecipe("gcc-runtime", "gcc-source", "-c do_preconfigure {}".format(gcc_source_pn),
 """
@@ -873,7 +875,9 @@ expected_sametmp_output, expected_difftmp_output)
 "Task gnu-config-native:do_configure couldn't be used from the cache because:",
 "We need hash",
 "most recent matching task was")
-        expected_sametmp_output = expected_output + ("Variable base_do_configure value changed",'+	echo "this changes base_do_configure() definiton "')
+        expected_sametmp_output = expected_output + (
+"Variable base_do_configure value changed",
+'+	echo "this changes base_do_configure() definiton "')
         expected_difftmp_output = expected_output
 
         self.run_test_printdiff_changeconfig("core-image-minimal",
-- 
2.39.2


