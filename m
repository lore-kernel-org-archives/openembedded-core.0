Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C03C7C54FCF
	for <webhook@archiver.kernel.org>; Tue, 28 Jul 2026 22:22:16 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2696.1785277325053406591
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Jul 2026 15:22:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=w7RnRGTF;
 spf=pass (domain: smile.fr, ip: 209.85.128.46, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-493f6de72faso2284885e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 28 Jul 2026 15:22:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1785277323; x=1785882123; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8VxWdELG8PoFjZ2v9sJdQyy4iTf74fhe7C0+urHZeYE=;
        b=w7RnRGTFZDSRd8eThxd/3tMsXW7SY82yNmTOzkWSVVSie5j//SNknQ/qwNzLOkYefs
         mtZg3X7L9/CNpvg61sa+QP9R2r2VQREup9U+f0GH4tYpUTfg/E2G36d68uF2c8kVVBje
         fV4BSUCP+A+YNg+H/rp77O0SROIqZS0tRmj5o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785277323; x=1785882123;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8VxWdELG8PoFjZ2v9sJdQyy4iTf74fhe7C0+urHZeYE=;
        b=nTkhptNw7IhyxKkzRU8ZBL5E3RTlPj/YnHgWvrtWUvy35LlaeJReCWAZQ8amqck9Nj
         E3bv+pBc38MEcdvrzpkKUOrXn0/vl5AoRK0sXqRMl0bK4eQNApo5hk4E2sZ/YD2Gx4tV
         9i4Tcj6mcv/uuj3llRw8BH/cSPHOHV29ZWtvVb3kiJWTiIpKFGcyYpuvuPexg+FYuTPF
         omJsgzzcZXo4kfXnHWGB8EqpOl/KxTDmv1LxvXVsxKDkwuDNWC6poc06jR8gdkJoe2wT
         kR0lQcUtBFwGswf/w+EkrrQRigp0QWyJaz8eSuxBB14NEUhvXovZDyFCH8uK+Cau907t
         JCQQ==
X-Gm-Message-State: AOJu0YzEXgrQfgT2/7qfMU8esUtOlRKvROqLe9P9bhsy7wCwKFHdRzQq
	oIXEe5jUWvqpCkXmI0pcerLMeN1I+ESukJhmLLyIy1ihNq3u8gKv+JEIU1/hle2swa/l7zUoXpc
	Vk1yIHRE=
X-Gm-Gg: AR+sD12yQKlAoOGkvfmyZknTNEIjRxwopo0+z8XTJNRPXn1hj/VOcydLnY9lAbWUGnL
	A7IcYC9g7SVhQrsB4IslyVa4Suuq9/JJ4C/dFIrHjtJMYkCeiipAlINq3BgoocD3H3ggV0fToCJ
	zRXuZBpTahCY7dv/MJqMJr564NaujR8fMlPTZTbwEqRO0N5ySYi5x7XojiC5RxjXNv993sA46r3
	+vEUW7tR2WWypnG0vVRQzEAp0IHhuKhrlmF+pOtZXuhYhpAIe74Z/DZkzpjVTulXyo/sen0JxbT
	g1HTkLa1OWjrLLO1taxzpR41nzGxMoc+7KWjaw4CuTXEmKUnLa76wh+BWnQKvivBC6GH+TaycVQ
	/eP1aqFNK/OoQaNljT2bbz9HjjX0cQbBAapC+Vm1OChdzDM2rWrZbDkjPOCOAPsussvbvXPVg3K
	WPBJxX6BJzxEhetO+QQTtqn0C6pUQTONJ4JrK+aJIGEX1Z/AKc13FyrnlV/dDB72+mEXbUG0IGm
	WXYznGBW1f+zaRhQ4En3cFfrATrQVVaprpEhf/VJgRTkDOzqah9yf4Edyhu3yGL
X-Received: by 2002:a05:600c:8b74:b0:493:f478:4c71 with SMTP id 5b1f17b1804b1-496c6431fd9mr44681305e9.7.1785277322942;
        Tue, 28 Jul 2026 15:22:02 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4976bd6da4asm7669405e9.1.2026.07.28.15.22.02
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 15:22:02 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 00/19] Patch review
Date: Wed, 29 Jul 2026 00:21:35 +0200
Message-ID: <cover.1785277157.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Jul 2026 22:22:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242203

Please review this set of changes for scarthgap and have comments back by
end of day Thursday, July 30.

Passed a-full on autobuilder:
https://autobuilder.yoctoproject.org/valkyrie/?#/builders/29/builds/4312

The following changes since commit 762321beb0260b1411c7f98f13458ec99a118280:

  bzip2: fix 'bzip2 --version > /tmp/aaa 2>&1' hang (2026-07-25 23:57:45 +0200)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/scarthgap-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/scarthgap-nut

for you to fetch changes up to 543550522f831479f07d332a40ba343c53ae1065:

  openssh: set status for CVE-2026-59998 (2026-07-28 15:30:13 +0200)

----------------------------------------------------------------

AshishKumar Mishra (1):
  package.bbclass: hardcode emit_pkgdata to run last

Darsh Kelaiya (5):
  gawk: Fix CVE-2026-40467
  gawk: Fix CVE-2026-40468
  gawk: Fix CVE-2026-40469
  gawk: Fix CVE-2026-40553
  python3-setuptools: Fix CVE-2026-59890

Deepak Rathore (1):
  sqlite3: fix CVE-2026-11822 and CVE-2026-11824

Devansh Patel (1):
  openssh: set status for CVE-2026-59998

João Marcos Costa (1):
  curl: add annotation for CVE-2026-10536

Martin Schwan (1):
  cargo-update-recipe-crates: Don't fail for partially empty Cargo.lock

Shubham Pushpkar (1):
  libsolv: Fix CVE-2026-9149

Siddharth Doshi (5):
  vim: Security Fix for CVE-2026-28422
  vim: Security Fix for CVE-2026-42307
  vim: Security Fix for CVE-2026-43961
  vim: Security Fix for CVE-2026-47162
  vim: Security Fix for CVE-2026-47167

mark.yang (3):
  python3-cryptography: set CVE_PRODUCT
  python3-ply: set CVE_PRODUCT
  python3-pyasn1: set CVE_PRODUCT

 meta/classes-global/package.bbclass           |   7 +-
 .../cargo-update-recipe-crates.bbclass        |  16 +-
 .../openssh/openssh_9.6p1.bb                  |   1 +
 .../python/python3-cryptography_42.0.5.bb     |   2 +
 .../python/python3-ply_3.11.bb                |   2 +
 .../python/python3-pyasn1_0.5.1.bb            |   1 +
 .../python3-setuptools/CVE-2026-59890.patch   | 194 ++++++++++++++++++
 .../python/python3-setuptools_69.1.1.bb       |   1 +
 .../gawk/gawk/CVE-2026-40467.patch            |  63 ++++++
 .../gawk/gawk/CVE-2026-40468.patch            |  65 ++++++
 .../gawk/gawk/CVE-2026-40469.patch            |  90 ++++++++
 .../gawk/gawk/CVE-2026-40553_p1.patch         |  50 +++++
 .../gawk/gawk/CVE-2026-40553_p2.patch         |  44 ++++
 meta/recipes-extended/gawk/gawk_5.3.0.bb      |   5 +
 .../libsolv/libsolv/CVE-2026-9149.patch       | 152 ++++++++++++++
 .../libsolv/libsolv_0.7.28.bb                 |   1 +
 meta/recipes-support/curl/curl_8.7.1.bb       |   1 +
 .../CVE-2026-11822_CVE-2026-11824.patch       |  41 ++++
 meta/recipes-support/sqlite/sqlite3_3.45.3.bb |   1 +
 .../vim/files/CVE-2026-28422.patch            |  44 ++++
 .../vim/files/CVE-2026-42307.patch            | 121 +++++++++++
 .../vim/files/CVE-2026-43961.patch            |  65 ++++++
 .../vim/files/CVE-2026-47162.patch            |  39 ++++
 .../vim/files/CVE-2026-47167.patch            |  39 ++++
 meta/recipes-support/vim/vim.inc              |   5 +
 25 files changed, 1039 insertions(+), 11 deletions(-)
 create mode 100644 meta/recipes-devtools/python/python3-setuptools/CVE-2026-59890.patch
 create mode 100644 meta/recipes-extended/gawk/gawk/CVE-2026-40467.patch
 create mode 100644 meta/recipes-extended/gawk/gawk/CVE-2026-40468.patch
 create mode 100644 meta/recipes-extended/gawk/gawk/CVE-2026-40469.patch
 create mode 100644 meta/recipes-extended/gawk/gawk/CVE-2026-40553_p1.patch
 create mode 100644 meta/recipes-extended/gawk/gawk/CVE-2026-40553_p2.patch
 create mode 100644 meta/recipes-extended/libsolv/libsolv/CVE-2026-9149.patch
 create mode 100644 meta/recipes-support/sqlite/sqlite3/CVE-2026-11822_CVE-2026-11824.patch
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-28422.patch
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-42307.patch
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-43961.patch
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-47162.patch
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-47167.patch


