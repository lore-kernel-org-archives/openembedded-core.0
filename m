Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 892A4C43458
	for <webhook@archiver.kernel.org>; Tue, 30 Jun 2026 14:14:23 +0000 (UTC)
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.22442.1782828859213038244
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Jun 2026 07:14:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=GtYGD3P9;
 spf=pass (domain: gmail.com, ip: 209.85.221.169, mailfrom: twoerner@gmail.com)
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-59e8ededf4dso2889939e0c.2
        for <openembedded-core@lists.openembedded.org>; Tue, 30 Jun 2026 07:14:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782828858; x=1783433658; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=CWyQCybhqHgJDAmXEpWu1/rxdSpWjc0H1BzZW/r/N9w=;
        b=GtYGD3P9ohWhMwPvR5eQe5OLT1yr3GyUgrZWH2jLVVnRBFFtLBJcf5SvD2x02UdGpe
         RwNGBIHO+7yt2qSfwsffqc4dVv1U89lMsGW9Nh3Fd9oyc8vk5z7hTDRFh+xSgNTUYYXs
         yaVAk/IZ82LhONTsFKtTmQOfWvaL7DWfOtbMVuJ07DvCUmqV7axtaE62+F9OkunW2CaZ
         Z6Z58m87+PbzODRiJjOfTkVETfsSDyO4aWMb4qBy3gf8vwsX+JteMU0gCXSpx/F0O/KD
         qbfqmm3uA+RbrYKd3MucWGw+Zawad3tc/FEyGyRJhGnkgdEUFk3Dij4dQ7hXGQ8H64Ut
         Fa1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782828858; x=1783433658;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CWyQCybhqHgJDAmXEpWu1/rxdSpWjc0H1BzZW/r/N9w=;
        b=A0cU5dKj8XZvoA7M0H+oRf5hU7rV53hwfS/MWDQbTTzkE3cx0yAPY1IdGa5F8aTdk/
         iyBjdwwGubhNFtyON0qu9IVkH5LePf2XqWc6v8fUEyZLyHsTHelrIFPoenERTEQdaa4L
         BZwMRHTxlOhFZUrtF+DudG8qbw9DYnW7WXWfe9xmSxfPg5/a4kXKSAVXIoXuOXTTa0d1
         HKjBxBDFHGEgIaksfEz85l4Bw8ZpSpG8lUCFrbi0v2+/B8G6RBxfVF3ouKfBV8yLtM5D
         owRiIi6sfeScuNH6GdKLsaPHS71Dr1+VKwOB3Xrrx5/jo1ik0AwdX3jmqJKGE3da2sF+
         XJIA==
X-Gm-Message-State: AOJu0YwGc2EoP2pP7rnrzHpXJOBsf1+CYhP3AnPw/Ijx430twIfi4NKD
	kO/arVzwTdnU2B9/3VnkBKtGUmhyq/KR9cyPGhmB/s2cQlnXWUn1nTuyjW6LWw==
X-Gm-Gg: AfdE7clIu0SauE+FTiYjFSiBPUquewGwiK1TlG13o8VuJOUkHpHHhpSTm0agzm/oPoF
	WwsbKOtnJn20eQ4IvR8mQvOmChjtf4rLkYE3si1KW4zHMatgfVu2yFGKCOMeo6MJn2anFEnsmK3
	HIla3t9AzDj4YWLqOkpjP/IIabAjUhTzvVVR9RuQMd11J1hMvdhCelVzXGq+gpvTYtzQrtfJA7p
	KUyUcwViqSoQdOrlYWpNgLp/XzjarPX3VkOYexIb6UqF5uqqD6KodhGp+VUfvuEGMVVMcQ8/wcS
	nbMhAadg0KU30IzleAmVoR3k1SmyHp1+QmXQwRcaU5dRkcijKHPLQvEyhpFydF/7PMXMq70B9DB
	OIKriPtapwTeDpfkW/NM0digJXFZkFjgQJeMYpV3dGBawD+UsF5ubS2aNx4gRpJ64k4Ob7JdMsA
	g7ZTDSwHRbJfnz7/ZWAAttCYWrGSzLaSMChhJPb+S6HiEe+ThOOrCWpio=
X-Received: by 2002:a05:6122:2398:b0:5ab:26f:4a42 with SMTP id 71dfb90a1353d-5bdbe9c155emr1681501e0c.0.1782828857832;
        Tue, 30 Jun 2026 07:14:17 -0700 (PDT)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5bdc1498b15sm1581443e0c.0.2026.06.30.07.14.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 07:14:16 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2] wic: upgrade 0.3.0 -> 0.3.1
Date: Tue, 30 Jun 2026 10:14:12 -0400
Message-ID: <20260630141412.993588-1-twoerner@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Jun 2026 14:14:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239903

Pick up ten commits since the v0.3.0 tagged release.

git log --oneline 5974ade11032f218841d9f449ef0efeee3f9a2ca..6c66da65bf2aac618092811c13792dcbd453d140
6c66da65bf2a bump version: 0.3.0 -> 0.3.1
5137f70fb431 wic: Update after plugin name changes once again
bb768b12b733 bootimg_pcbios: fix typo in comment
85067dd89492 README.md: literal cleanups
9c75ddc60d06 README.md: add Trevor (the maintainer)'s mail as Cc recipients
0cbe5b9d2934 README.md: add example instruction for sending patches
1f9e8c77c049 add basic b4 config file
0a8ddac66dc1 wic/plugins: gate root= with rootdev check for efi, pcbios and partition
f20cda73b495 wic: Fix updating fstab for nvme devices
bc0a8d88f6cd src: rename top-level bb imports to avoid oe-core/bitbake collision

AI-Generated: codex/claude-sonnet 4.6 (high)
Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
Changes in v2:
- updated SRCREV to include the version bump commit
---

 meta/recipes-support/wic/{wic_0.3.0.bb => wic_0.3.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/wic/{wic_0.3.0.bb => wic_0.3.1.bb} (90%)

diff --git a/meta/recipes-support/wic/wic_0.3.0.bb b/meta/recipes-support/wic/wic_0.3.1.bb
similarity index 90%
rename from meta/recipes-support/wic/wic_0.3.0.bb
rename to meta/recipes-support/wic/wic_0.3.1.bb
index 7dbf84b039a6..d9b4cc05c4bd 100644
--- a/meta/recipes-support/wic/wic_0.3.0.bb
+++ b/meta/recipes-support/wic/wic_0.3.1.bb
@@ -4,7 +4,7 @@ LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=4ee23c52855c222cba72583d301d2338"
 
 SRC_URI = "git://git.yoctoproject.org/wic.git;branch=master;protocol=https;tag=v${PV}"
-SRCREV = "5974ade11032f218841d9f449ef0efeee3f9a2ca"
+SRCREV = "6c66da65bf2aac618092811c13792dcbd453d140"
 
 CVE_PRODUCT = "yoctoproject:wic"
 
-- 
2.50.0.173.g8b6f19ccfc3a


