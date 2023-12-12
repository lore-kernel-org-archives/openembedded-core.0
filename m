Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7383C4167D
	for <webhook@archiver.kernel.org>; Tue, 12 Dec 2023 14:27:51 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web10.2904.1702391263427498183
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Dec 2023 06:27:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=ZkmRDu1/;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.177, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-6cea2a38b48so4934699b3a.3
        for <openembedded-core@lists.openembedded.org>; Tue, 12 Dec 2023 06:27:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1702391262; x=1702996062; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=sssJQmz6WHbt1DsS/H7nECtg7PJKgBYdLMW3K6JKdIg=;
        b=ZkmRDu1/lTuUXX2vhJo+5c/CyhqOpcaUxvtaJ4hZ7Fu8U37qtAzoJRtcSIpfKI9gF6
         kCClVMNaHXu74GU6RvqF1BKXhrX4hJ84W63BM51FeECWwUReJXfhxWjR1Uwt5QR9ZXdF
         kRLM1/zWvajCToX2NZFdTosS9+XXpNVTrOBSzvF2KoxeHAfgqnz9CJw7M8VLxEJNyFjx
         u+o7rPEYIff++EzLaKeFOXeVHt6H0KfmNlpL846TY53OCllcD1kMlXfQyxT//Qq2Qlay
         guY8G9RAemnyFtjgQC3x6JNzZ/i1ACQ+N85XrlbCzvgd+Kcu3zmfmFnjdqPfdkFIDBSY
         OKlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702391262; x=1702996062;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sssJQmz6WHbt1DsS/H7nECtg7PJKgBYdLMW3K6JKdIg=;
        b=cQLtBJX+iY0tLeE2G3LTzjW/m0f2kGYJFg8Pk0TpTflaraInW/zy2Bo4PRjetgsEpv
         2adsUHK7vp7CL02QKp1+acDLpe+/g1XJGN5/aHnvuCil3/rbKOdS6ZMtiL2w3qz2L56t
         mzBo7e63eLhvO7emmwdy1VwitSeWUqdVyLoL0DsAJC1cJXJRqB4VTvzVExCqLDNZB8P4
         IcwGWZ3QFEORCn/E8xlKc978mmjobKdzao8Nyaiz746YlQh3Bw2yh9zGV/eKZKQ6h29K
         OogagypP9XwFesZm5UH9qe46esuHiFPlPJ87etUqb2X7S05hU6Tclg5uWnImxRDYUduh
         /xfw==
X-Gm-Message-State: AOJu0YxFCBeq6hoqUtk4jDZ1ECy+woiEXqNbGkIaHzgXX69ICspVrir8
	vjqccMzeNJEX00XLMbsyV0xoONeeABH1Cun5XOE=
X-Google-Smtp-Source: AGHT+IFw5nig11DqyTZ1F7xH7sbuTOEdgXZq/7abLMfUqJszY+R3NelNi9vFZb/23GElZrUTlM/4+A==
X-Received: by 2002:a05:6a00:8802:b0:6ce:5637:787b with SMTP id ho2-20020a056a00880200b006ce5637787bmr5177924pfb.51.1702391261969;
        Tue, 12 Dec 2023 06:27:41 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id n23-20020a056a000d5700b006cbb40669b1sm8188928pfv.23.2023.12.12.06.27.40
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Dec 2023 06:27:41 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][nanbield 00/29] Patch review
Date: Tue, 12 Dec 2023 04:27:06 -1000
Message-Id: <cover.1702391115.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Dec 2023 14:27:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192204

Please review this set of changes for nanbield and have comments back by
end of day Thursday, December 14

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/6305

The following changes since commit c45f3e00189e034157996b88103a83efec3e0cf6:

  lib/oe/path: Deploy files can start only with a dot (2023-11-30 04:21:04 -1000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/nanbield-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/nanbield-nut

Bruce Ashfield (18):
  linux-yocto/6.1: update to v6.1.59
  linux-yocto/6.1: update to v6.1.60
  linux-yocto/6.5: update to v6.5.8
  linux-yocto/6.5: update to v6.5.9
  kern-tools: make lower context patches reproducible
  kern-tools: bump SRCREV for queue processing changes
  kern-tools: update SRCREV to include SECURITY.md file
  kernel-yocto: improve metadata patching
  linux-yocto/6.1: cfg: restore CONFIG_DEVMEM
  linux-yocto/6.1: update to v6.1.61
  linux-yocto/6.1: update to v6.1.62
  linux-yocto/6.1: update to v6.1.65
  linux-yocto/6.5: cfg: restore CONFIG_DEVMEM
  linux-yocto/6.5: update to v6.5.10
  linux-yocto/6.5: cfg: split runtime and symbol debug
  linux-yocto/6.5: update to v6.5.11
  linux-yocto/6.5: update to v6.5.12
  linux-yocto/6.5: update to v6.5.13

Dmitry Baryshkov (1):
  meson: use correct targets for rust binaries

Peter Kjellerstedt (1):
  oeqa/selftest/tinfoil: Add tests that parse virtual recipes

Richard Purdie (1):
  sstate: Ensure sstate searches update file mtime

Ross Burton (1):
  linux-yocto: update CVE exclusions

Tim Orling (1):
  vim: upgrade 9.0.2068 -> 9.0.2130

Wang Mingyu (5):
  libnewt: upgrade 0.52.23 -> 0.52.24
  libnsl2: upgrade 2.0.0 -> 2.0.1
  msmtp: upgrade 1.8.24 -> 1.8.25
  glib-2.0: upgrade 2.78.0 -> 2.78.1
  xserver-xorg: upgrade 21.1.8 -> 21.1.9

Zoltán Böszörményi (1):
  update_gtk_icon_cache: Fix for GTK4-only builds

 meta/classes-global/sstate.bbclass            | 12 ++------
 meta/classes-recipe/kernel-yocto.bbclass      | 30 +++++++++++++++----
 meta/classes-recipe/meson.bbclass             |  4 +--
 meta/lib/oe/utils.py                          | 12 ++++++++
 meta/lib/oeqa/selftest/cases/tinfoil.py       | 25 +++++++++++++++-
 ...{glib-2.0_2.78.0.bb => glib-2.0_2.78.1.bb} |  2 +-
 meta/recipes-extended/libnsl/libnsl2_git.bb   |  4 +--
 .../{msmtp_1.8.24.bb => msmtp_1.8.25.bb}      |  2 +-
 ...{libnewt_0.52.23.bb => libnewt_0.52.24.bb} |  2 +-
 ...-xorg_21.1.8.bb => xserver-xorg_21.1.9.bb} |  2 +-
 .../kern-tools/kern-tools-native_git.bb       |  2 +-
 .../linux/cve-exclusion_6.1.inc               | 26 ++++++++++++----
 .../linux/cve-exclusion_6.5.inc               | 22 ++++++++++++--
 .../linux/linux-yocto-rt_6.1.bb               |  6 ++--
 .../linux/linux-yocto-rt_6.5.bb               |  6 ++--
 .../linux/linux-yocto-tiny_6.1.bb             |  6 ++--
 .../linux/linux-yocto-tiny_6.5.bb             |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_6.1.bb  | 28 ++++++++---------
 meta/recipes-kernel/linux/linux-yocto_6.5.bb  | 28 ++++++++---------
 meta/recipes-support/vim/vim.inc              |  4 +--
 .../postinst-intercepts/update_gtk_icon_cache |  6 +++-
 21 files changed, 159 insertions(+), 76 deletions(-)
 rename meta/recipes-core/glib-2.0/{glib-2.0_2.78.0.bb => glib-2.0_2.78.1.bb} (96%)
 rename meta/recipes-extended/msmtp/{msmtp_1.8.24.bb => msmtp_1.8.25.bb} (91%)
 rename meta/recipes-extended/newt/{libnewt_0.52.23.bb => libnewt_0.52.24.bb} (94%)
 rename meta/recipes-graphics/xorg-xserver/{xserver-xorg_21.1.8.bb => xserver-xorg_21.1.9.bb} (92%)

-- 
2.34.1


