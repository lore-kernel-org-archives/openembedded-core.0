Return-Path: <hiagofranco@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 182AAC83F1B
	for <webhook@archiver.kernel.org>; Wed, 16 Jul 2025 23:30:00 +0000 (UTC)
Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
 by mx.groups.io with SMTP id smtpd.web10.36327.1752708596203490070
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Jul 2025 16:29:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hmMoCtst;
 spf=pass (domain: gmail.com, ip: 209.85.161.52, mailfrom: hiagofranco@gmail.com)
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-6159e23a6dbso85093eaf.3
        for <openembedded-core@lists.openembedded.org>; Wed, 16 Jul 2025 16:29:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752708595; x=1753313395; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=i+BjKf4v3nTOB3NMkhdN/TAY44fL8c77i0M64l39cjI=;
        b=hmMoCtst6oBKdycucplXVouChZMit8wx0VI/Wzup76CFr8Z+8r7BH10Bu+3vQRguDF
         A186FVp7a9wN5VBC5w2ER6H+pE5Iqv2BNjKV48nPM9F2EMT5XHH6OTn/2omKtEftPnNk
         TpAyaU9l5W6bpFFVZJBSZDrt26eLgAmbhqWe0VNQKZHxbDcW52E+dvOhunG9zNvO4hFY
         /0QldpLZwvBgUaNdTR38DzBpmkrExk2KMip/MzgFDlOyFsV3WYGij4cuC3JiGnwtUr0W
         n9mhfPDpp6SgxoavKy1cqvDEc+zOh4v38oLcXtrsY6UC8ZYOIKXgqzrUmQJEs+zNIDME
         PL+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752708595; x=1753313395;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i+BjKf4v3nTOB3NMkhdN/TAY44fL8c77i0M64l39cjI=;
        b=qeGyYZo7CTIQiAJa2ootB3UCYzt5qAeanvzxSXIbAu0C7nIQbbMBqyPOHbP3mXi6DS
         xB+ZFmz5OBQqNlASKV1hiLMD/i+U3gpDWcADYG0j3vVrGTPjGMNXnZWIBek1V20Wniw4
         no67IAEYgFZ/JrAK0GHEirnfFcczgogShXBH4PkESNkDFXBuIDPUyraKmx3GsmJXa+TW
         apezqy7XmQ3jJCTo4oBfcDS9B94wevCbM9TlcJWqOFFg97URsAdzIK4JwvKYHker5r7T
         Fd+2w8N/+vC7rWWHNwZIEZ+LKiOMfCOlY7u6LRsYPVplvLtA8bkiFCLLJ97uhtDFBSfg
         cgmg==
X-Gm-Message-State: AOJu0Yx3UenskaCi37o9INLa9ql+FEaCs6xBQWpAucefcAUL8QpBVJlL
	4KflHJIw3KazEwf7RaXCwDUgdPIJJbaP4dAr+8J6lLT2Qv00VbHDG5+LYgqLPxKx
X-Gm-Gg: ASbGncsj2mCSKZjgMIP9/m2jKJKrL8LirYVNM0xy4U6FE+ctcYm0q+5M+Ei5YmeBD+O
	Ei7J8tqxAwMaBXiB7hDfrvF/IS0Kq7RLSRpxK8OC05Zj911dq2+1f829toz9KAbGkuQEfZENRPN
	0l7oje+KXw0zEf4eQmP/fczZF3YoFHc3fHPV9D0ws120lFjTBd9yL0kX5nNpZ57J2RZkNazGyHM
	xr1/ukTcgdWF3FqUimkFc/vMVBRmWtaMfNio1mn2sQVl/aPBOjXrMxYPiklNLyRHaT+WTRrXbSP
	HrXdV60BDZEV92DkCURN/xw5peNlWTNud1lk1581oYZ6U34yNIVwTFEsO6qqGHI8J75HupWDr09
	nNVDU9oozf0AlYq0Y01hx8a0a54EevP2jv5SnHIPlQSbjsWaW
X-Google-Smtp-Source: AGHT+IH2UJqwmmxBbfgXP0b/i1nsNnJZ8eKe1iO1ApAc7jLqMSsBZmNvaAbxwcqlhMBqb6jnN1eCTg==
X-Received: by 2002:a05:6808:1983:b0:40b:4957:23d3 with SMTP id 5614622812f47-41d049934dbmr3635279b6e.20.1752708594807;
        Wed, 16 Jul 2025 16:29:54 -0700 (PDT)
Received: from localhost.localdomain ([2804:1b3:a7c1:459e:e3dd:d2e:b1ee:b9ec])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-41bf05447fesm1441268b6e.36.2025.07.16.16.29.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 16:29:54 -0700 (PDT)
From: Hiago De Franco <hiagofranco@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Chen Qi <Qi.Chen@windriver.com>,
	Alexander Kanavin <alex.kanavin@gmail.com>,
	Hiago De Franco <hiago.franco@toradex.com>
Subject: [PATCH 0/2] systemd: drop libmount dependency and add blkid and fdisk PACKAGECONFIGs
Date: Wed, 16 Jul 2025 20:29:29 -0300
Message-Id: <20250716232931.127811-1-hiagofranco@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Jul 2025 23:30:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220475

From: Hiago De Franco <hiago.franco@toradex.com>

The libmount dependency in systemd was made optional upstream [2]. This
series backports that change, allowing us to drop util-linux as a build
dependency for systemd. This resolves a circular dependency between
util-linux and systemd when systemd PACKAGECONFIG is enabled in
util-linux. Without this fix, each recipe depends on the other,
triggering the circular dependency error.

Note that this alone does not fully resolve the circular dependency
on util-linux-fstrim/uuid. There is another one:

glib-2.0 -> util-linux -> systemd -> shared-mime-info -> glib-2.0

But the libmount PACKAGECONFIG can be removed from glib-2.0 to break its
dependency on util-linux.

In addition, according to systemd's README [2], the dependencies on
libblkid and libfdisk from util-linux are optional, so add them as new
PACKAGECONFIGs.

[1] https://github.com/systemd/systemd/commit/d1ee3889cf8e8a9edc82e41d306155fb4c531c8f
[2] https://github.com/systemd/systemd/blob/main/README#L216

Hiago De Franco (2):
  systemd: drop build dependency on util-linux
  systemd: add libblkid and libfdisk PACKAGECONFIG options

 .../0001-meson-Add-libmount-feature.patch     | 58 +++++++++++++++++++
 meta/recipes-core/systemd/systemd_257.6.bb    |  9 ++-
 2 files changed, 65 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-core/systemd/systemd/0001-meson-Add-libmount-feature.patch

-- 
2.39.5


