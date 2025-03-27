Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A86FDC36013
	for <webhook@archiver.kernel.org>; Thu, 27 Mar 2025 19:44:28 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web10.5270.1743104662459533610
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Mar 2025 12:44:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=qh6MT2kV;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.170, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-224100e9a5cso29738805ad.2
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Mar 2025 12:44:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1743104662; x=1743709462; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=ttLpmQ4ulsN7mkxAeIAjJclF08NuzvP3L8E0tOauKkE=;
        b=qh6MT2kVqbWq1vBcTW+BSO/7HCjk9iKjpUkLjDdIkt8seYgid9IyuQ/B0cSoglVSSY
         9qBYN0k2zwtlXOYnnOaatJ8vv3KjTs75KwPOnh1AuoRs87B0gCVKwVpJWoggG6TFMRc8
         C5NWFWYQcq/D0S/uFtV7g1yDDze3RYbBtxQBHoP3VmU0dB5ILa7Ukfsp8mO1LdhP84/P
         OSrue4NK8sN+pN9mp6fk5tO+KAM0E4jscIkkt1ZrzzXRftgaBdBlfWfkefQ1Ptuml8CU
         3PuPEMKjAZjQ+dbSpX48ImOyoijdB9tthhfqOpxnVAhKSXR/DTsXoqEJIn+No1ofqNjj
         9MaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743104662; x=1743709462;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ttLpmQ4ulsN7mkxAeIAjJclF08NuzvP3L8E0tOauKkE=;
        b=L8S5/PoXJ6k6hvxFJKTMW2SlBz5ksv0dv3Kw6emrqHwR4d8U2tc4mJPYFmpqbr9TYi
         fG2lzuwWU57Jm5qEip2/aFzGq4mbusPP6t9Lul5qlMIKdy4qUDTQ+pCa7ydGShV+ED6y
         3Ag/M89KqvPFs+JYUeORsKqKr/oINdYv6DRINvkNtyR4kbphrJnpNeyMT7oNhBXO81Jk
         xTjB0rM1vkCFYY6iUfC3cdSDY95QpZ5g32CsCPRHyqMCZCcOsFFz6TP+ep9baYSCE+3V
         wOMN9QjRJY/aK7Xk7Jc1jsH3DadtD+8MmgFpMs6IDwzsh07GzF7qz0zqVgtLiC9oRzvC
         DKLQ==
X-Gm-Message-State: AOJu0YzkzVgFyFK2+SL1a8BxF8b3p3oraoucc9Fcyp1MiXZC3X4RmUEh
	s+1bH3zxxWhRkPDrcq9qB+r6Sqef44ZX30SJn1bHSi9Xj64RZW7PUqBFlPEB1/rxkj9ooGywIM/
	j
X-Gm-Gg: ASbGncvwQhc97MCZRX9qsVhbzP4tNDvXEadnY6Xix7rwvlSJRYupHv67dCqKmke4kQ9
	zwqaNB6mNGZvHff2hFZk4ri5a9diqBo75E1UynbZAZ8ImdO5tQb/qHif3xgaGE3o8twgiL1VyDn
	tX0MK3hiOWL/E+DIzI/U5XcYqwExjwBgSvH4g2e7NiL6DGraNlVxEI/wOh0lgFXcKNSzCxoKZrX
	aIOuvzy+9KJ6g4vnY+bNc6V8vRxkHPku3arIZmx3fYINLQiJ1hWRfGY+MNRymuVm8F3Ym18FhxZ
	4nM6CpZMryWfaRsCb2rUiooGB3i7hfb4xvc=
X-Google-Smtp-Source: AGHT+IHKwdqnsvQjzXSAq7Ma/VR+FngD9Lxk7d06+H4JkA3hh4/bDvPxVKx5pB09R+2KBIMLt2hUjw==
X-Received: by 2002:a17:902:f64e:b0:224:2a6d:55ae with SMTP id d9443c01a7336-2280491c3e7mr83384885ad.48.1743104661359;
        Thu, 27 Mar 2025 12:44:21 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:811c:968e:2c1:6363])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2291eee0882sm3865875ad.75.2025.03.27.12.44.20
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 12:44:21 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 00/10] Patch review
Date: Thu, 27 Mar 2025 12:44:05 -0700
Message-ID: <cover.1743104524.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Mar 2025 19:44:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213776

Please review this set of changes for scarthgap and have comments back by
end of day Monday, March 31

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/1283

The following changes since commit a720df7ad77af1f8b1c00a211c88537e5f23edbc:

  nativesdk-libtool: sanitize the script, remove buildpaths (2025-03-20 12:51:41 -0700)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/scarthgap-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/scarthgap-nut

Bruce Ashfield (6):
  linux-yocto/6.6: update to v6.6.77
  linux-yocto/6.6: update to v6.6.78
  linux-yocto/6.6: update to v6.6.80
  linux-yocto/6.6: update to v6.6.82
  linux-yocto/6.6: update to v6.6.83
  linux-yocto/6.6: update to v6.6.84

Divya Chellam (1):
  ruby: fix CVE-2025-27220

Madhu Marri (1):
  qemu 8.2.7: ignore CVE-2023-1386

Stefan Mueller-Klieser (1):
  kernel-arch: add macro-prefix-map in KERNEL_CC

Vijay Anusuri (1):
  vim: Upgrade 9.1.1115 -> 9.1.1198

 meta/classes-recipe/kernel-arch.bbclass       |  8 +-
 meta/recipes-devtools/qemu/qemu.inc           |  2 +
 .../ruby/ruby/CVE-2025-27220.patch            | 78 +++++++++++++++++++
 meta/recipes-devtools/ruby/ruby_3.3.5.bb      |  1 +
 .../linux/linux-yocto-rt_6.6.bb               |  6 +-
 .../linux/linux-yocto-tiny_6.6.bb             |  6 +-
 meta/recipes-kernel/linux/linux-yocto_6.6.bb  | 28 +++----
 meta/recipes-support/vim/vim.inc              |  4 +-
 8 files changed, 110 insertions(+), 23 deletions(-)
 create mode 100644 meta/recipes-devtools/ruby/ruby/CVE-2025-27220.patch

-- 
2.43.0


