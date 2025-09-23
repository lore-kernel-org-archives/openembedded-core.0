Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD05ECAC5AC
	for <webhook@archiver.kernel.org>; Tue, 23 Sep 2025 14:39:03 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web10.18679.1758638338108219733
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Sep 2025 07:38:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=kM8yaJes;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.181, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-77f1f8a114bso2468488b3a.0
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Sep 2025 07:38:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1758638337; x=1759243137; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=JYBhbZWapITb1PX0je//On0ucWYuhEkT6YozzfWUxNg=;
        b=kM8yaJesVJm9AhHSJpmYb6Gwx/P1g+Po0WmEMMvFqUdbgHoKfi51ceQJFpFyVyLNGZ
         1wdDAGOLgDZ9sG8RIkFVhZHPA+46Pluv+UP59axQjt9MWE16fF3fKuctxFHvXZYv7rBG
         JVxV0E5M4JCkbz5szIHc6aL+Zkx4oo6wWZLgLq++3I3hr6He7eJk1s+ELJCkI7JbkIOd
         Nqxdxjvvn1kcWS91dZoqG0RUdjVxRgXT2t/x9SrKZra8dO+CzxjhwyWIiw2Guc9u7Zrj
         w4DOXYq0ETV/G1zS7Nc4tfo3abbWccsYdt/Dg4ep0Yx9iKHh5FJAIhz11c03Mpfk3toN
         ELsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758638337; x=1759243137;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JYBhbZWapITb1PX0je//On0ucWYuhEkT6YozzfWUxNg=;
        b=g1KKZCT5/Vg/aktmDQr0LTlWb72QFv9Hcs2/mLQRiSxxGSnpECWoOC8d482XwlQKyl
         m3yuAj4NQFM6BWgUgBGMyY0Tk3ulOqRTO1RsUpWOjT4yKLm3IQFrPvY76S9f0EMS6bAi
         TMfKVzp0RcJvFTeT/gVS0tM43YgqGc5Od8UMNIOO+ip7zdWK5R9fPYHzEuYm95fmjVWP
         vSzNiTu+yjbq+a/SOhe5ir7Vh5KyoHdVrOWlTvH5nAZVal7IkGE8/rkZwgYi9NRWsY9Y
         SWW0CxQTJUmp7N2VvL0c6oRAy6yDjgEcFD9PYbr9KFOqBTn+MgL6wR3ZpOGE74I5qcOV
         yjuA==
X-Gm-Message-State: AOJu0YxZfqc25xVcfFjmwTD8PhvBPQqh1hf+G5nP94qI7IpxW7w12MNn
	yW2fbMLMkAoWdKUa1QnXEVicoXMz+2+bdTRAAbMvXXzRrn4r6v8z1hV0vQGMaebxWhXn/a1Qb4i
	rtGXUyMI=
X-Gm-Gg: ASbGncue49xFBm1Cm32eSc4ohdWaNs6cyCit7dwM/8ZB85fAyX64xscGpBO1MWTmKg/
	v82668kJWrgeulrctDnr9Jkf+nDf174oOXJMw3ummOJxQLonJY81IDbXPzmhE9/4mOGwC+i0h7a
	fAufEnXk0EkOIIAplK7jsPjep7Wk5MqsRJojwe/ds2EljO/k2ZEILLHOW3A2qVDcrQDrpubMA6M
	sRHHi/smm2zmxs3GQvu21iwI4g+ZcdcNIubhQlwWlGfeuaRcCM2XkztNnL8QJn5kgfuFGdOFWCv
	UQUi/iqw0l9t/FhwE5BkF/P0JpWILIDHqK9nH16GoKAIt5fSS+D8n7YW49V3TbH3ZRcUUeEvG+X
	v7lnDMdAOsvcS
X-Google-Smtp-Source: AGHT+IHhGPpFKpAsNV/hgkO+qntzClLcywHSM1oQ0eQGOkBLF9+Xuw6qkpT3YhmE7rQINfkb+hxeEw==
X-Received: by 2002:a05:6a20:a111:b0:240:1e4a:64cc with SMTP id adf61e73a8af0-2d10f57e829mr3723757637.12.1758638337240;
        Tue, 23 Sep 2025 07:38:57 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:3f58:7e15:309f:29c])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b55100df86bsm13428368a12.23.2025.09.23.07.38.56
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Sep 2025 07:38:56 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar 0/7] Patch review
Date: Tue, 23 Sep 2025 07:38:35 -0700
Message-ID: <cover.1758638188.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Sep 2025 14:39:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223883

Please review this set of changes for walnascar and have comments back by
end of day Thursday, September 25

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/2423

The following changes since commit 3d161e94ad532f660d4a0259a32e26a32ea0c75d:

  buildtools-tarball: fix unbound variable issues under 'set -u' (2025-09-17 09:51:15 -0700)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/walnascar-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/walnascar-nut

Archana Polampalli (1):
  ffmpeg: upgrade 7.1.1 -> 7.1.2

Bruce Ashfield (2):
  linux-yocto/6.12: update to v6.12.47
  linux-yocto/6.12: update CVE exclusions (6.12.47)

Martin Jansa (2):
  sanity.conf: Update minimum bitbake version to 2.12.1
  lib/oe/utils: use multiprocessing from bb

Ross Burton (1):
  grub2: fix CVE-2024-56738

Yi Zhao (1):
  python3-setuptools: restore build_scripts.executable support

 meta/conf/sanity.conf                         |   2 +-
 meta/lib/oe/utils.py                          |   3 +-
 .../grub/files/CVE-2024-56738.patch           |  74 ++++
 meta/recipes-bsp/grub/grub2.inc               |   1 +
 ...l-request-pypa-distutils-332-from-py.patch |  63 +++
 ...or-special-executable-under-a-Python.patch |  59 +++
 .../python/python3-setuptools_76.0.0.bb       |   2 +
 .../linux/cve-exclusion_6.12.inc              | 396 +++++++++++++++++-
 .../linux/linux-yocto-rt_6.12.bb              |   6 +-
 .../linux/linux-yocto-tiny_6.12.bb            |   6 +-
 meta/recipes-kernel/linux/linux-yocto_6.12.bb |  28 +-
 .../{ffmpeg_7.1.1.bb => ffmpeg_7.1.2.bb}      |   2 +-
 12 files changed, 600 insertions(+), 42 deletions(-)
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2024-56738.patch
 create mode 100644 meta/recipes-devtools/python/python3-setuptools/0001-Revert-Merge-pull-request-pypa-distutils-332-from-py.patch
 create mode 100644 meta/recipes-devtools/python/python3-setuptools/0002-Remove-support-for-special-executable-under-a-Python.patch
 rename meta/recipes-multimedia/ffmpeg/{ffmpeg_7.1.1.bb => ffmpeg_7.1.2.bb} (99%)

-- 
2.43.0


