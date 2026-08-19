Return-Path: <roosesweb@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 240CBC5B572
	for <webhook@archiver.kernel.org>; Wed, 19 Aug 2026 06:22:22 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1266.1787120531608082757
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Aug 2026 23:22:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=IwiAcWgh;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: roosesweb@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4998590d392so5701605e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 18 Aug 2026 23:22:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787120530; x=1787725330; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ac8KTglZdM0C1WW1wBK5mp0ddJo/nW/GcLmSkp7+V30=;
        b=IwiAcWghCsY//Ep3kzTy/ViMqEpVImlM8yTLDbMAL3AhqDJK5SNYBqN4fb+PP7Nyef
         eQ/VS4HwXhwuZSv/Y/dq1N6rc41LWYowa2segvRZB82T8hntB6F8hhXR90tBj92o7/je
         j2XCHE+FkHKUAry8ZAi4tnG/66bdzg8SQEKhsQICzhpKfvYz488qabqDnPNoubKhoO8g
         UiEz2aPU4xC3gqqC+RlC98x+LRSmZVqrvqrxXY1OTYAEzOUdK32bD6kAC3166h4nRInr
         yvte8i87p9xRIUOHq1+4DD1SiF6AQMWX5zEqwKivcpG7CUdRe3Cva+2vss7aiPBh2qbv
         zykQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787120530; x=1787725330;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ac8KTglZdM0C1WW1wBK5mp0ddJo/nW/GcLmSkp7+V30=;
        b=NJaVHtU39OaQnjUBodE1g/wwwaEu61pBOCdasD3XhzntSh/H6nuJbOJSHD/dk9bspr
         R3BC+VLGJadxs0xct3AbVNBK1GeIAZAO+6+PdjUWoFCjz5G3XBz60cUFt7fijpp14Z4X
         X6IWHYWTIgWspLTdRU64gEnzpd1dwxeTFr4e94VXUbXM9P6aFeUuRnDaYk95261FbEut
         edLF/HsL8VQN30q9anK4foEL8OhQiSwxdpqi8XHZzBSPOx2WDW/KOqcdVAkniChbahdr
         +WmgszwvpjL3GP6iUnOYaPFQvSalfRPr1e3iDdo5RAJkONGeTFSQoY9HJ+4qIsc6AaU2
         XVCw==
X-Gm-Message-State: AOJu0YysQ1MGPSkGxB4xcH8sb6TtgWWpaYJlQrdJxKWgvxez0IqS37CX
	sZgwq1rNa8YhqXAYEoDlTd+wg6t9Z82NXJQb27ScWdR+Dh7PsgCCVIU+ACaDLlRo
X-Gm-Gg: AR+sD111NzRcBUM6dPut+TZTpsJ+/Lp3NImdlQxh5woyoPfSNAeL2ifBg0dzP5CLdqZ
	rJl0vyaMdLPF9wRmRAcZmOGOUKECKTdvbG8na+MVivSCw4srSRYB0s+8KZnqrnXTljTilGg/AmF
	zL/SG2YuBC2bqmpwQva5gAmFW5gZElVWrCm+mFlrXjmdO6FTEyFZWyoiMeyyLmU5AuzOcIICUiQ
	A+7HvziuSdEI+F/sAjRrai+L/1VgZqN0dWXn997ZjmTag1YOx57hDcfhs13YQNsBqz2ThRVJpps
	lD9GY4Mne5AmbY16ryXwbcq7o6g1Bsk0oqYFDrflxujds+o173/n3+iTsyBVIWUVk7Z5EOXRlx5
	CI2F/ya0Iju3nsLHTnW+DPaTSgHKjhcjJGYckjkElU6gLLwike0zTZPou0Pp0JlUufNYTwTnjX6
	7LJM5zFVnLLalfOFsOKNqraAriXuCp0nQNF+xOHs3DtetbEdh9AjEzq74jAVkB+7wEv+gYfGuBw
	oVNcpN7rJmiDeqkWx6e+pRK/bResNn88w==
X-Received: by 2002:a05:600c:4713:b0:499:83f1:398 with SMTP id 5b1f17b1804b1-499aa1e247emr30098855e9.9.1787120529520;
        Tue, 18 Aug 2026 23:22:09 -0700 (PDT)
Received: from thinkpad.fritz.box ([2a02:810d:ae08:d00:a23e:1b00:ebf4:5b37])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499aa17f202sm32900085e9.13.2026.08.18.23.22.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 23:22:09 -0700 (PDT)
From: Thomas Roos <roosesweb@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Paul Barker <paul@pbarker.dev>
Subject: [PATCH v2 0/5] Handle an empty IMAGE_LINK_NAME consistently
Date: Wed, 19 Aug 2026 08:22:03 +0200
Message-ID: <20260819062208.680468-1-roosesweb@gmail.com>
In-Reply-To: <483e1f11846c0941d287a3a9228bd759a1310bdd.camel@pbarker.dev>
References: <483e1f11846c0941d287a3a9228bd759a1310bdd.camel@pbarker.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Aug 2026 06:22:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243706

v1 fixed the sbom-cve-check input path. Paul noted that 2a80840a4fe0
("sbom-cve-check: Fix breakage with empty IMAGE_LINK_NAME") had already
touched this class, and that other classes make the same assumption. That
commit guarded the export symlinks; the input path is separate and still
built from IMAGE_NAME. Patch 1 now uses the shape Paul suggested, and
patches 2-4 fix the other sites found by auditing meta/classes*,
meta/lib/oe and meta/lib/oeqa.

Read and write sites need opposite handling of an empty value: read sites
fall back to IMAGE_NAME, write sites skip the link. A central default (pin
IMAGE_LINK_NAME to IMAGE_NAME when empty) does not work, as create_symlinks
and multiubi_mkfs have no link != target check and IMAGE_NAME is itself
derived from IMAGE_LINK_NAME.

Tested on qemux86-64, each fix confirmed in both directions. Patch 5 covers
patches 2-4 in one build; patch 1 was checked by hand, as a selftest would
need the sbom-cve-check databases (~8.7G of git).

AI-Generated: Uses Claude Opus 5

Thomas Roos (5):
  sbom-cve-check: read the image SBOM through the stable symlink
  vex: skip the VEX symlink when IMAGE_LINK_NAME is empty
  testexport: fall back to IMAGE_NAME when IMAGE_LINK_NAME is empty
  image_types: skip multiubi symlinks when IMAGE_LINK_NAME is empty
  oeqa/selftest/imagefeatures: test an empty IMAGE_LINK_NAME

 meta/classes-recipe/image_types.bbclass       |  2 +-
 meta/classes-recipe/sbom-cve-check.bbclass    |  3 +-
 meta/classes-recipe/testexport.bbclass        |  2 +-
 meta/classes/vex.bbclass                      |  3 +-
 meta/lib/oeqa/selftest/cases/imagefeatures.py | 42 +++++++++++++++++++
 5 files changed, 48 insertions(+), 4 deletions(-)

-- 
2.55.0


