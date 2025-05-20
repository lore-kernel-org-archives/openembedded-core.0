Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4566AC54E71
	for <webhook@archiver.kernel.org>; Tue, 20 May 2025 19:48:24 +0000 (UTC)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.web11.412.1747770502231182878
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 May 2025 12:48:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=TuAwNaTz;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.180, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-b26ef4791a5so4589860a12.1
        for <openembedded-core@lists.openembedded.org>; Tue, 20 May 2025 12:48:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1747770501; x=1748375301; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=/fJfmGZCL80JxNNMA++binZbEmaXknk64Cj7AQ7Lt+o=;
        b=TuAwNaTzM976+YrKLg6TjJEVpenss6TZJ6DaKuMbvzwR7LDmQLwa+ZYcE/CNL2q0yO
         gMBKDupdjkBZYB20UB1GDl/bQLN+WIkl0oO9ByzMxOk7Yd2AfC6ga/iJufnhFhbyasUI
         +3GRINS11caTahOTxxCfZjBDMLuMu8ocZ2YqVZgo9rUY4AeKEz/VWDgu1hW9LCqXwEjO
         mc+Dc7sc1T7XYWdFq11yRIQGEek2jyR0+lyXFucBxZvsM2ef6IBanZQozlOmA7Wmqbfj
         tY3MfakiMCY9PalQGtX9BnKhY23iu3aU5sUohaEzRu1ra4gKsVSWzh5pwx8UH28puiO9
         4XwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747770501; x=1748375301;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/fJfmGZCL80JxNNMA++binZbEmaXknk64Cj7AQ7Lt+o=;
        b=Lznaj8HFkjSq8YrJcS5FSlOst+EmUOIFXOKOVu0wrQRCLwvK4QXSl7Oa4Jl6ISutuv
         WlVK8lUe5BYMJPetB7Ma7zzIY4WJxsWPXuhICmU4RFTKDq+/ABac/gPR+otWs1xARKx8
         3NaDYFMUam79UGeOj4Mr+aCN45tewZ416q6nNYrjx1Nhf/y6wBnB7JtkgrbNVSZMlrJq
         tIwByPASkofdEUGgZ1GW7S9BMmbyfGAMsOWhEajzC3GXD4ADOrHkefyK3F330AKH6PeA
         zGRKbx3hM+xmt9MMTdmMl3IgiOfT8nHi+VRLtDQisL4CswpB5XDnbY+fxKz0oMJU4Agk
         hUrQ==
X-Gm-Message-State: AOJu0YzSRB3hxjJMlwdvBJWs24vcq5RYYh+8uYMI8M/9Thce5uSfJ8KP
	dIIyBfT62Q5dt5yys/3pINkXzLlnUqNyZfRRn5G+SsrsDMjO9KiHAOsUe0hmHjWyy3lA1dFl/t8
	1qgw7
X-Gm-Gg: ASbGncsTMydMjTEC1R+ZhbOE1px7DLoTtN7z9gDPNhK+XI6IcPMqDm3obtGYdk5tl6h
	NUNnAJzEwdO0dE2JH7qJ6KWKDr/EfnXjLRMPkaU0aZqnhf07SFoUTCyCqK7p6mae3QPpAyPYAQd
	IlrlFBWq7VCtA0bstooPnu6XvwJGJPmGejgOep7vPIaO5t4gJjztV0Yl7KuJZ0IC68VxCo4m8Dy
	t5qVvat+/+mpBaDsCZPQkFSRmA6QNvilkbps2ydVW/rUHT2luzcjG8JJBVnJ6bYV90xGwXo2umV
	HuqXUGCyJhFQansKPy3HNacDTaGLJYPXois70a0IFA==
X-Google-Smtp-Source: AGHT+IHOYQeRIRG+Do7nSSL3e0I7R2iBecw1AF6yJnqPzdtmNrPPka1f8XHYt6GGIH+yb2I2MsK+Pw==
X-Received: by 2002:a17:90b:4fcd:b0:30e:9349:2d7f with SMTP id 98e67ed59e1d1-30e9349309dmr22572161a91.4.1747770501151;
        Tue, 20 May 2025 12:48:21 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:48df:296e:5350:93e])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30f36386944sm2120772a91.14.2025.05.20.12.48.20
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 12:48:20 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar 0/8] Patch review
Date: Tue, 20 May 2025 12:48:07 -0700
Message-ID: <cover.1747770224.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 May 2025 19:48:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216933

Please review this set of changes for walnascar and have comments back by
end of day Thursday, May 22

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/1623

The following changes since commit dea859e904d9eacede147a627f4c176433ac9efc:

  glibc-y2038-tests: remove glibc-y2038-tests_2.41.bb recipe (2025-05-13 09:05:03 -0700)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/walnascar-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/walnascar-nut

Deepesh Varatharajan (1):
  glibc: stable 2.41 branch update

Divya Chellam (2):
  ruby: upgrade 3.4.2 -> 3.4.3
  libxml2: upgrade 2.13.6 -> 2.13.8

Khem Raj (1):
  gcc: Fix LDRD register overlap in register-indexed mode

Praveen Kumar (1):
  connman :fix CVE-2025-32366

Richard Purdie (1):
  openssh: Upgrade 9.9p2 -> 10.0p1

Yi Zhao (2):
  iputils: Security fix for CVE-2025-47268
  makedumpfile: upgrade 1.7.6 -> 1.7.7

 .../connman/connman/CVE-2025-32366.patch      |  41 +++++
 .../connman/connman_1.43.bb                   |   1 +
 ...c-use-the-absolute-path-in-the-SSH-e.patch |   6 +-
 .../{openssh_9.9p2.bb => openssh_10.0p1.bb}   |   4 +-
 meta/recipes-core/glibc/glibc-version.inc     |   2 +-
 .../{libxml2_2.13.6.bb => libxml2_2.13.8.bb}  |   2 +-
 meta/recipes-devtools/gcc/gcc-14.2.inc        |   1 +
 ...m-Fix-LDRD-register-overlap-PR117675.patch | 148 ++++++++++++++++++
 .../ruby/{ruby_3.4.2.bb => ruby_3.4.3.bb}     |   2 +-
 .../iputils/iputils/CVE-2025-47268.patch      | 143 +++++++++++++++++
 .../iputils/iputils_20240905.bb               |   4 +-
 ...-compiling-error-too-many-arguments-.patch |  43 -----
 ...umpfile_1.7.6.bb => makedumpfile_1.7.7.bb} |   3 +-
 13 files changed, 346 insertions(+), 54 deletions(-)
 create mode 100644 meta/recipes-connectivity/connman/connman/CVE-2025-32366.patch
 rename meta/recipes-connectivity/openssh/{openssh_9.9p2.bb => openssh_10.0p1.bb} (98%)
 rename meta/recipes-core/libxml/{libxml2_2.13.6.bb => libxml2_2.13.8.bb} (97%)
 create mode 100644 meta/recipes-devtools/gcc/gcc/0001-arm-Fix-LDRD-register-overlap-PR117675.patch
 rename meta/recipes-devtools/ruby/{ruby_3.4.2.bb => ruby_3.4.3.bb} (98%)
 create mode 100644 meta/recipes-extended/iputils/iputils/CVE-2025-47268.patch
 delete mode 100644 meta/recipes-kernel/makedumpfile/makedumpfile/0001-PATCH-fix-gcc-15-compiling-error-too-many-arguments-.patch
 rename meta/recipes-kernel/makedumpfile/{makedumpfile_1.7.6.bb => makedumpfile_1.7.7.bb} (92%)

-- 
2.43.0


