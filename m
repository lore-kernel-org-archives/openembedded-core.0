Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 917BACC6B08
	for <webhook@archiver.kernel.org>; Tue, 13 Oct 2026 10:49:59 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4137.1791888591419904389
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Oct 2026 03:49:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=lKwIHNmJ;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4980fe6b3beso25284865e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 13 Oct 2026 03:49:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791888589; x=1792493389; darn=lists.openembedded.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=rfqOUPanGVNFwrLC9y5fVKTcRuAiGy6ECEMJ+rogj9Y=;
        b=lKwIHNmJWwAGKmhkFb9wJEMWwUImzFnpEKQss1RMuo+kb8Xp/p7+Udvct4lBJj8oeT
         LlNAyjxOJnP9gam79htNCKFfaSFUwqE6bW/IarswfBUqfyzgEG5SI4ezfb3lvigS4zBB
         scSlhjKg4r+xaTcJr9IoSYGQnuhcCPb0t38AVmbPYDdgM2OtDU89auhK3YUTT3EbVI6w
         IRM0ma5L9nbYaq/pFSof4cM/KskHUiVnRcVLQmU4wUnWYdbJfOg6BcZqzY2ZMfwmxUHL
         fM7W3miCETp11fSw/nWR9vE2GE27ItJUNh/HL9ssG4Q80ZVmhAFGAjLXg3ZCerh9+FUN
         QdJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791888589; x=1792493389;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=rfqOUPanGVNFwrLC9y5fVKTcRuAiGy6ECEMJ+rogj9Y=;
        b=aAz/vZ81hUNpJ69lHXyvzejJdubrMG0+XmDnTrLgHqvfP7Q/3XUJSNPmGISSxw8oT/
         bgJotyR4vy3TCMLA/+nYvecf7ISJnjRA+B9IIHZR/xTom/XdMVsvtPwmgZjtl8cixYNm
         3tiWCdQf2SjhpPvJcGpj+dA3HePAJRHrtNqek+n6n9EHmVlP6EGNajGKLghkwkrMOT7M
         GVI2c/a5+VbeTgBmM47o7Za3nXSWBFewzzKPQ/pQtYoDQiwzrWPIzY3LbMnWB4jkpGO7
         IplcfbqKuOKX1M45nTtwBoBNkT/OCn1ucBW8HV2PrCSqF6ENV2R69ZfMVOHfwKwi/+Ws
         PLcQ==
X-Gm-Message-State: AFq9FYJJvH0paOD4TlBYbxFxtu23Uc1FvftgDGpx7sXsnvw5++GRhvTt
	n55c6zQS2EZH3bt03n9+Zw6JugfL2c1bH0HtdrM9m+FnhDvPSIA84R5KUNPczw==
X-Gm-Gg: AYBFou0YmRPgIt/W+FpRo8XM+hzRcTnHl69xi1qMy6at67DL2VkwBURjp6MeSsJ4WsM
	0HFrju2hKzVpIE/BNst2OfrYdNTCFJVY6xi6ghP5UrVLxDhDVOmfCNheyszvHtDgTRuVPU5N1gj
	1PcvZqmCfSBpEH67RP/ynuenzQy0hUtCBb3gYrh3HwLFxCUuPn5S9L8ulEotQWOOlI/vXM9K8iM
	CKeiKnnKzdH3jUIvx3PGgVXLc0BOXaNhYmYRrLbHNHJ7d8VVlaEiY1XESYVOGwKsnvLdxNWC3Jq
	CZAH0nw8pYLsu4tw2oAmb01flRfOm3HiZ6v+AJq6JE1teYAotgooygjXgWzgqqEv7GWtGcdb67M
	3MS2OdRA1Twt0CRB6gPpadRtK5ck6ljDfgGLq60zIhAimdxx5O83Fw9ZH2v3fpP1fHRzlIJHRp8
	cemx9CYZZKrskVGD7e6rSxhN8dVsuOlhLV5MOdCJ+JcF7SFiDCErLEWaXbvJUEwLHh5ggzdmWSM
	sR1XkaP09U23nCvy+I+l5JaDko19DMmvLynwlwHcZFiPLdeaQ==
X-Received: by 2002:a05:600c:3e88:b0:4a1:a7f8:c124 with SMTP id 5b1f17b1804b1-4a1a7f8c1c1mr41952745e9.7.1791888589310;
        Tue, 13 Oct 2026 03:49:49 -0700 (PDT)
Received: from [192.168.5.15] (cust18-dsl93-89-130.idnet.net. [93.89.130.18])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a19303d4a9sm31623155e9.2.2026.10.13.03.49.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 03:49:46 -0700 (PDT)
From: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [PATCH 0/4] fontcache: make the caches built into an image valid
Date: Tue, 13 Oct 2026 11:49:34 +0100
Message-Id: <20261013-fontcache-reproducible-mtime-v1-0-950f07b80f0f@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAL4MzmoC/yXMQQ7CIBAF0Ks0s3YSKKkLr2JcUPjYMRYaoI1J0
 7tLdfk2b6eCLCh063bK2KRIig360pGbbHyCxTdTr/qrVtpwSLE66yZwxpKTX52Mb/BcZQYHZaw
 12gwegVqxZAT5/Pr74++yji+4ep50HF+Q611SgAAAAA==
X-Change-ID: 20261013-fontcache-reproducible-mtime-f03aa3135def
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
X-Mailer: b4 0.16.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Oct 2026 10:49:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247716

The fontconfig caches update_font_cache builds into an image are never
used on the target. fontconfig accepts a cache only while the directory
mtime it recorded matches the directory, and three things disagree about
that mtime:

- fc-cache records min(directory mtime, SOURCE_DATE_EPOCH). When the
  intercept runs, the font directories still carry their packages'
  mtimes and SOURCE_DATE_EPOCH is the image's fallback value.
- reproducible_final_image_task then sets every mtime in the rootfs to
  REPRODUCIBLE_TIMESTAMP_ROOTFS.
- mke2fs clamps every inode time to the SOURCE_DATE_EPOCH in its
  environment, so an ext image ends up with a different time again from
  a tar or squashfs image of the same rootfs.

So every process using fonts rescans and writes a cache of its own, or
fails to on a read-only rootfs. fc-cache also deletes a cache it has
just written for a directory newer than SOURCE_DATE_EPOCH, so with the
default values some caches are missing from the image entirely.

Patches 1-2 run fc-cache under REPRODUCIBLE_TIMESTAMP_ROOTFS, with the
font directories' mtimes already set to it. Patch 3 keeps that time in ext
images, as oe_mksquashfs already does for squashfs. That moves every
inode and superblock time in an ext image from
SOURCE_DATE_EPOCH_FALLBACK to REPRODUCIBLE_TIMESTAMP_ROOTFS, which with
the bitbake.conf defaults is from 2011-04-05 to 2018-03-09. Patch 4
adds a selftest that boots an image carrying a font and checks that
fontconfig accepts every cache and writes none. On qemuarm64 it fails
without patches 1-3 and passes with them.

---
Alex Kiernan (4):
      package_manager: pass REPRODUCIBLE_TIMESTAMP_ROOTFS to intercepts
      update_font_cache: write caches that are valid in the final image
      image_types: keep the rootfs mtimes in ext2/3/4 images
      oeqa/selftest: check the font caches an image ships are used

 meta/classes-recipe/fontcache.bbclass         |  1 +
 meta/classes-recipe/image_types.bbclass       |  6 ++++
 meta/lib/oe/package_manager/__init__.py       |  6 ++++
 meta/lib/oeqa/selftest/cases/fontcache.py     | 42 +++++++++++++++++++++++++++
 scripts/postinst-intercepts/update_font_cache | 12 +++++++-
 5 files changed, 66 insertions(+), 1 deletion(-)
---
base-commit: 6b2dcfdbe16055edc88f72dabf07e33f8163d8eb
change-id: 20261013-fontcache-reproducible-mtime-f03aa3135def

Best regards,
--  
Alex Kiernan <alex.kiernan@gmail.com>


