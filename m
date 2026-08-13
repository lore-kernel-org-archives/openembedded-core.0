Return-Path: <fabien.thomas@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7893C5B572
	for <webhook@archiver.kernel.org>; Thu, 13 Aug 2026 15:22:23 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.21610.1786634542887866300
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Aug 2026 08:22:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=eY/bfKi8;
 spf=pass (domain: smile.fr, ip: 209.85.128.47, mailfrom: fabien.thomas@smile.fr)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4957eefd361so255745e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 13 Aug 2026 08:22:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1786634541; x=1787239341; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YR8b4+q4Kpapvbb5hg6iTJbaKHyu9Da4qAjv9Ox9IAg=;
        b=eY/bfKi8tJraS1zlImedRVoYLpuaThKtdw/2kvTmGJ3DOGTYMzuK3e92zGoV+9Bz1B
         PVo+P4RCo2wUbN0UUW174nzVvsUaGKcD9lhCIeG4MUwdb3+paVBbgyaJm6S4coIqhfLT
         Q0eSQyNwevhFPqZ7N0h8PfCEuRdkc5RU5ui/s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786634541; x=1787239341;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=YR8b4+q4Kpapvbb5hg6iTJbaKHyu9Da4qAjv9Ox9IAg=;
        b=S5dUYb1YbjZhiblPU2D6bVPaswtMqS8i8S85Q6bXFuTCewdwrJSdMQjd20GrAWC9pD
         CcxH+cms5QDjvuD1ECmagLMRiZjYuqvXdHBpTIDsDixO1wsZl08jyPXnTU7exjlqbgp2
         brqZqq9WDp5m9HvMPNJs2FgGLdUi3vZnC4FgaVJOXbUNII9twWFUj2PmCPOdSxd676QU
         KvVDwtW3AllHgAMjosNrG4oVXx8CNmIpmRDh6pXaZSFXLNCY+hliL585LChGnWjqda2J
         Z3ecO4CTUlD06ikYWmR9UbXhQPON4xsbq0WJJTn65athsoNVpNY2+bGZjkpr5yXViA1j
         T14Q==
X-Gm-Message-State: AOJu0YzSIDjt2NrCTQb/mNkfbgBjzgMObN8aA6naA15fa6UuiZP4flbA
	9+g2RuVl8b3rhX7SbaqOy1OTRJgktoZgQjww+dVzD/oUeapDYDb4ewz8DYVK8CmIP0StZMYLvph
	7ngefjnFr5g==
X-Gm-Gg: AR+sD13FxuDFne3hXUj2LTUb9Rl+8ieWpK2Pke85tGPrQvLTAVV/+t/1xdJ6NUxUG3g
	NVGSNCMMysSbWIXcqtLcFBHIK9D/N0bOTQgdQQ+NpI1i47mlDBZ6yMJnLOosznUPro9kYAQMIzr
	bmgBvMHj/vo4CVOQJzXsZjTSXYJGbV7SqQmvqT7CEKI3skzYveZvzUu9KvwkQ8d9J+Fxq+RIxrr
	qTRHR7W2rK6+gdNwBDJjo4/dyTb1Xdm00Y5//yCd7cjVlK7gdnhzBfaZ16SSAeOOLyq5Boc7Ke1
	oKyfnJBwwfNipbYVdOpBIaWYSF1912zzlwKHDO+zBVwyjJo4H3UaOefoUjyihFoF8VRkqQ/ZEEF
	n6QfsU9apeEAgE8qaNLlGkmMqhTOuKbkEXbsaz4q1Puje10Vsqy3ZADWh/ANM20AfA7EfkH638A
	eDbkMXxDOUTnMOslJlxHJbxBLgEOzYoxS2tzrDrn39D0an4tCB1HXtG6i0x1ArJ2pOeCCTueTfq
	icLgNgxRaswz69ffIcpZs/SGT1U+Vhr/ck9341iiH+JB94MO7kTACmNjGrbiEZY3hDQaPRqZxmH
	qRPNI2evb2JQVWVMHyzAe0PIvrF5Xs00nu3koKhm
X-Received: by 2002:a05:600d:8499:20b0:499:858f:2653 with SMTP id 5b1f17b1804b1-499858f2666mr29665725e9.2.1786634540922;
        Thu, 13 Aug 2026 08:22:20 -0700 (PDT)
Received: from FRSMI25-GIGUE (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4815f21a068sm110450f8f.12.2026.08.13.08.22.20
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 08:22:20 -0700 (PDT)
From: Fabien Thomas <fabien.thomas@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 00/17] Patch review
Date: Thu, 13 Aug 2026 17:21:50 +0200
Message-ID: <cover.1786633048.git.fabien.thomas@smile.fr>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Aug 2026 15:22:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243357

Please review this set of changes for wrynose and have comments back by
end of day Monday, August 17.

Passed a-full on autobuilder:
https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/4467
* meta-qcom has a known issue: https://github.com/qualcomm-linux/meta-qcom/issues/2457

The following changes since commit f09a0f28aeb54ddd90415dd458338e1565bb5a49:

  build-appliance-image: Update to wrynose head revisions (2026-07-30 13:29:32 +0100)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/wrynose-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/wrynose-nut

for you to fetch changes up to d75e9cc17035bcd403b101298be1503697a6f929:

  oe-selftest: fitimage: Add tests for KERNEL_DTBVENDORED (2026-08-13 12:14:52 +0200)

----------------------------------------------------------------

Adarsh Jagadish Kamini (1):
  glibc: CVE-2026-5358 add CVE_STATUS

Adrian Freihofer (1):
  oe-selftest: fitimage: Do not expect kernel property in DTBO config
    subnodes

Daniel Turull (1):
  libarchive: fix CVE-2026-14164

Himanshu Jadon (1):
  python3-pip: set CVE_PRODUCT

Jaipaul Cheernam (1):
  bind: upgrade 9.20.23 -> 9.20.26

Marek Vasut (2):
  kernel-fit-image.bbclass: Do not include kernel property in DTBO
    config subnodes
  kernel-fit-image.bbclass: Fix operation with KERNEL_DTBVENDORED = "1"

Peter Marko (1):
  gstreamer1.0: set status for CVE-2026-5056

Ryan Eatmon (2):
  kernel-fit-image: Add KERNEL_DTBVENDORED support for
    FIT_CONF_DEFAULT_DTB
  oe-selftest: fitimage: Add tests for KERNEL_DTBVENDORED

Wes Malone (1):
  cpan_build: disable .packlist and html doc

Yoann Congal (1):
  selftest: uboot: remove duplicated KVM presence test

mark.yang (5):
  python3-pyopenssl: set CVE_PRODUCT
  python3-pyyaml: set CVE_PRODUCT
  python3-xmltodict: set CVE_PRODUCT
  python3-certifi: set CVE_PRODUCT
  python3-idna: set CVE_PRODUCT

 meta/classes-recipe/cpan_build.bbclass        |  7 +++
 meta/classes-recipe/kernel-fit-image.bbclass  | 22 ++++++-
 meta/lib/oe/fitimage.py                       |  7 ++-
 meta/lib/oeqa/selftest/cases/fitimage.py      | 59 ++++++++++++++++++-
 meta/lib/oeqa/selftest/cases/uboot.py         |  6 +-
 ...1-avoid-start-failure-with-bind-user.patch |  2 +-
 ...kport-ax_prog_cc_for_build.m4-macros.patch |  2 +-
 ...d-V-and-start-log-hide-build-options.patch |  4 +-
 ...ching-for-json-headers-searches-sysr.patch |  6 +-
 .../recipes-connectivity/bind/bind/conf.patch |  2 +-
 ...t.d-add-support-for-read-only-rootfs.patch |  2 +-
 .../bind/make-etc-initd-bind-stop-work.patch  |  2 +-
 .../bind/{bind_9.20.23.bb => bind_9.20.26.bb} |  2 +-
 meta/recipes-core/glibc/glibc_2.43.bb         |  2 +-
 .../perl/libmodule-build-perl_0.4234.bb       |  2 -
 .../python/python3-certifi_2026.2.25.bb       |  2 +
 .../python/python3-idna_3.11.bb               |  2 +
 .../python/python3-pip_26.0.1.bb              |  2 +
 .../python/python3-pyopenssl_26.0.0.bb        |  2 +
 .../python/python3-pyyaml_6.0.3.bb            |  2 +
 .../python/python3-xmltodict_1.0.4.bb         |  2 +
 .../libarchive/CVE-2026-14164.patch           | 53 +++++++++++++++++
 .../libarchive/libarchive_3.8.7.bb            |  1 +
 .../gstreamer/gstreamer1.0_1.28.2.bb          |  2 +
 24 files changed, 171 insertions(+), 24 deletions(-)
 rename meta/recipes-connectivity/bind/{bind_9.20.23.bb => bind_9.20.26.bb} (97%)
 create mode 100644 meta/recipes-extended/libarchive/libarchive/CVE-2026-14164.patch


