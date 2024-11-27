Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4E9ED6D221
	for <webhook@archiver.kernel.org>; Wed, 27 Nov 2024 18:50:21 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web11.79043.1732733413575275983
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Nov 2024 10:50:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=lZ4JjxBN;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.175, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-724d23df764so103944b3a.1
        for <openembedded-core@lists.openembedded.org>; Wed, 27 Nov 2024 10:50:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1732733413; x=1733338213; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cSIK5jpwpMDWv2Y6LShrZtrxBaoWOfT5QXYtaGzLr+U=;
        b=lZ4JjxBNOQWm6/by1oHdvb+uyuB02ble09K0jha6QaGNPQCBRPk4yQOnbcCCVl1RLm
         F410aIp3JRNH6i9Eg11AGeK1i0CBu0xwqHmL35PEp92nSl71eZgaFE/dDdLoepHdY+SL
         JDB7WZrPljmXrx7JFuuiwL4Lynf9TradrtJ6Cm05DpTW/cJnHXVnt25VAafix53RGcyn
         MqKOqNNjO+GCjzayCOhWY4ly/4b4W/3ZQ+bowoUWbO62qlZQJBkIYP28YNY6wd5xkFNt
         VT2XS/kZ/5n7BUs/LbxWC85SaPrbw2LOElYZmJ/S84ccAaXHw1VVJyBLydWU60KlGdmt
         tndw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732733413; x=1733338213;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cSIK5jpwpMDWv2Y6LShrZtrxBaoWOfT5QXYtaGzLr+U=;
        b=DwWFE+0hjlxidnhm5TsktgTkcWokmEdApit9n8x91DA5miP0It0JrjSBZr+47xdTW2
         FzF8VCsxUQyz1C0nhbvPCF50oSNR66Dz3L32xRb2G4L1hIBtZ2K37/bz5Lsp1EWmIY18
         Z4PC3cyF7g38DydGun5ozl+FJC+UICdG0agAqqq1J7XemoUfL+0GOeOiGWUbSnzntW4a
         sKvllLCSTni6DUhrHXjEF5bKS2HEYhnKBf70tf6Qi0o0qZHiTxPGI/WSNElz6HOWiUSZ
         LBf9QDYE/YsB/8hWT1e5rEerpA/VgCNPUweBRzW5Piu8/1UgyQTNEZDCPy+Z5QSa4RcS
         MOhg==
X-Gm-Message-State: AOJu0Yw8RdAMY1pYzvhLy2V3KChNEHE7xorSG0BNTDtV6LBDSZbpibLO
	P/rcxaeb9QRCQLU4zHURffFfhp2PAOUrOEMcATq6Tk4zBpZo1Pkk3wFIaByLGZ9omWebzBwJtMJ
	t
X-Gm-Gg: ASbGncuOhLtSBiLNEwwhXDonX/3TellHSlbodqRBfGnafFOi007xt0OewQ+X1fFKRd5
	MnwHomH6AlXloL6kbKnmVHzX8lz1uFktqwv4oT+P/4bnr6IzPzLBJTmVVNefGN5u8AnGYFfM4CG
	Oz80kNFN7wbkFFmpIz3oHsUfQ7MARTYJR91QaSP6jxbBYMFG8i+jKqTpYTrijkRIHpyW9PVGCX8
	C1N4z8A5shVfwHOT3NZmH8PFwYOro61dJj3w8M=
X-Google-Smtp-Source: AGHT+IGp1I4vq6eNTn9eZFcedMEYeOyi60ccEjkraomiFZqRpLt6sC6NvrUFX+NrYSIriX9T5Scu6Q==
X-Received: by 2002:a05:6a00:3d0c:b0:71e:6ef2:6c11 with SMTP id d2e1a72fcca58-72530045bd6mr4968411b3a.9.1732733412654;
        Wed, 27 Nov 2024 10:50:12 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72522e0375asm3403519b3a.94.2024.11.27.10.50.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Nov 2024 10:50:12 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 01/14] python3-pip: fix CVE-2023-5752
Date: Wed, 27 Nov 2024 10:49:54 -0800
Message-Id: <862c0338fba06077a26c775b49f993eac63762c9.1732733274.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1732733274.git.steve@sakoman.com>
References: <cover.1732733274.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Nov 2024 18:50:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207943

From: Jiaying Song <jiaying.song.cn@windriver.com>

When installing a package from a Mercurial VCS URL (ie "pip install
hg+...") with pip prior to v23.3, the specified Mercurial revision could
be used to inject arbitrary configuration options to the "hg clone" call
(ie "--config"). Controlling the Mercurial configuration can modify how
and which repository is installed. This vulnerability does not affect
users who aren't installing from Mercurial.

References:
https://nvd.nist.gov/vuln/detail/CVE-2023-5752

Upstream patches:
https://github.com/pypa/pip/pull/12306/commits/389cb799d0da9a840749fcd14878928467ed49b4

Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../python/python3-pip/CVE-2023-5752.patch    | 34 +++++++++++++++++++
 .../python/python3-pip_22.0.3.bb              |  8 +++--
 2 files changed, 39 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-devtools/python/python3-pip/CVE-2023-5752.patch

diff --git a/meta/recipes-devtools/python/python3-pip/CVE-2023-5752.patch b/meta/recipes-devtools/python/python3-pip/CVE-2023-5752.patch
new file mode 100644
index 0000000000..ef66a59021
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-pip/CVE-2023-5752.patch
@@ -0,0 +1,34 @@
+From b16dd80c50deaa4753045d93ed281d348509293f Mon Sep 17 00:00:00 2001
+From: Pradyun Gedam <pradyunsg@users.noreply.github.com>
+Date: Sun, 1 Oct 2023 14:10:25 +0100
+Subject: [PATCH] Use `-r=...` instead of `-r ...` for hg
+
+This ensures that the resulting revision can not be misinterpreted as an
+option.
+
+Upstream-Status: Backport
+[https://github.com/pypa/pip/pull/12306/commits/389cb799d0da9a840749fcd14878928467ed49b4]
+
+CVE: CVE-2023-5752
+
+Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
+---
+ src/pip/_internal/vcs/mercurial.py | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/pip/_internal/vcs/mercurial.py b/src/pip/_internal/vcs/mercurial.py
+index 2a005e0..e440c12 100644
+--- a/src/pip/_internal/vcs/mercurial.py
++++ b/src/pip/_internal/vcs/mercurial.py
+@@ -31,7 +31,7 @@ class Mercurial(VersionControl):
+ 
+     @staticmethod
+     def get_base_rev_args(rev: str) -> List[str]:
+-        return [rev]
++        return [f"-r={rev}"]
+ 
+     def fetch_new(
+         self, dest: str, url: HiddenText, rev_options: RevOptions, verbosity: int
+-- 
+2.25.1
+
diff --git a/meta/recipes-devtools/python/python3-pip_22.0.3.bb b/meta/recipes-devtools/python/python3-pip_22.0.3.bb
index 6e28b87ba3..28eab9c3de 100644
--- a/meta/recipes-devtools/python/python3-pip_22.0.3.bb
+++ b/meta/recipes-devtools/python/python3-pip_22.0.3.bb
@@ -34,9 +34,11 @@ LIC_FILES_CHKSUM = "\
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI += "file://0001-change-shebang-to-python3.patch"
-SRC_URI += "file://no_shebang_mangling.patch"
-SRC_URI += "file://reproducible.patch"
+SRC_URI += "file://0001-change-shebang-to-python3.patch \
+            file://no_shebang_mangling.patch \
+            file://reproducible.patch \
+            file://CVE-2023-5752.patch \
+           "
 
 SRC_URI[sha256sum] = "f29d589df8c8ab99c060e68ad294c4a9ed896624f6368c5349d70aa581b333d0"
 
-- 
2.34.1


