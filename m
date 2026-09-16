Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BD20C88E5C
	for <webhook@archiver.kernel.org>; Wed, 16 Sep 2026 08:48:50 +0000 (UTC)
Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10442.1789548528028903825
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Sep 2026 01:48:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=jZhDSbw+;
 spf=pass (domain: smile.fr, ip: 74.125.225.141, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49cd4ba9f68so8412315e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 16 Sep 2026 01:48:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1789548526; x=1790153326; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=htGWQ+OsSOgaiKjgO5Tgggo+lB4PpWdU4SoGfV7mFMI=;
        b=jZhDSbw+Tnc+P1pT/weWWuLHuNFYiX7wZAGEf4QfqnniORQcTbe4XE3SOkNP9J6Byn
         Yg0bCo4l9aF09GoeF/p90heBpL97lNWgrj9XD3+/IAwFmdiacKuh17qliyPpr4OsyqLn
         PZoiI8J9vot8XrBI4ELE02GM58exd12Sq9Jeo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789548526; x=1790153326;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=htGWQ+OsSOgaiKjgO5Tgggo+lB4PpWdU4SoGfV7mFMI=;
        b=n750U2qU2wOQLZNdJC8ag/3zEkwCec3GXfaDEKYupgA5WXQhBY7umJnF39FWCXW7kF
         HFP+M0mEyfk3nwpCL81PNxekKOZcVCLEeXM7wiDISMFgEZfzxVahZLuffQe/7jb0cbzG
         x5LPIfTG30ycBFSGrlsVQeEyv4GIZZo8yAD054Js1w9siwQEr5Cmx14hOA3Oc4Xo/MDR
         AVaSGxb7rQmLlhVztL5xe2FjP6C3qSMaLpmjyA4+1ics0+Drz4OuZtHl1NGcBeavMZ29
         TKq52Sti0SU8TZRCcFXfcNQtojkM8QYZZQKXZtzt2nSVk159WC+G6sgcBH17ninDPMMX
         BQVA==
X-Gm-Message-State: AFuF++llE2pyCo/Y+EYaanth0YfPteG6CsEi8xDYaaeO7dcHdhUtYvd2
	/Qk9+bP6Mt93hwaF8nHuW+kCa2K400TVq2MyofwEXQs5D4jLIaFz95ZBWRhYKbjAyLz7FzO1ssA
	wF+bJbkI=
X-Gm-Gg: AYBFou2KXA8+04PYaC5v3yl0G8BnDpGpDIznCugvENgBNvUfVptoZU9et0CqHC+GPFY
	qWn40QT6LSwsYXab8qd/cE/UqI9lx3FyFF+UtfQNnlJrgOGogYecSqu3WignL1732Lj7122dz5b
	Ehw/pfRWfQ9+IjEvKbWAanZWFhjw0GI0VsiBwPOSXl60e1X+igyKvCaxYCQFO84dTnOJ2Avu9qj
	TJ/XDneewE46q+1AyACtKIsru06M3frcLos3ZSvFfH2zYxbTGhbgfwzu2gT2EPpv/l8413XnLz/
	rV6yVN1IinIAOTOoAOKI82BvZTggFh5+MblGm5jBkQQKwZbJ4hcuaOKz0LKmIY/cDSztLKvO+BG
	xOMEZfWQlE7rx/O0SNlLYdRaJMYTyIzcYWebBN4vLvOQyhJA3coROSxZRZbZ8rUoI4coL9/RbPM
	x3Zi7qTeIfP2S3olFi9N7H63K3kOoQ765fTDanN3EOAZVHXlSP+1EoYQIdzAo1Mg/F8pXU5jwMJ
	xceSb1Xlqb05OoxkhMGeQIxiRRyZcsZcIYUcQhtU5xEDn1u1YvLixhBI7Rg/BYa6e7vdKPyBIx5
	o39MFA==
X-Received: by 2002:a05:600c:a14:b0:49d:433:c3b6 with SMTP id 5b1f17b1804b1-49ec053a640mr18282145e9.27.1789548525890;
        Wed, 16 Sep 2026 01:48:45 -0700 (PDT)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e83da071asm75707735e9.8.2026.09.16.01.48.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 01:48:45 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Paul Barker <paul@pbarker.dev>
Subject: [OE-core][scarthgap 00/13] Pull request (cover letter only)
Date: Wed, 16 Sep 2026 10:48:42 +0200
Message-ID: <cover.1789548398.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Sep 2026 08:48:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245942

Those are the patches from the last patch review:
https://lore.kernel.org/all/cover.1789163914.git.yoann.congal@smile.fr/
(No review, no change)

Passed a-full on autobuilder:
https://autobuilder.yoctoproject.org/valkyrie/?#/builders/29/builds/4718
* oe-selftest-fedora fails with 16415 – AB-INT: github infrastructure issues
  I still need to backport fixes from master to wrynose, and then,
  scarthgap.
* qemuarm64-ptest failed with 16267 – [scarthgap] AB-INT PTEST: python3 failure (test_wrong_cert_tls13)
  retried in https://autobuilder.yoctoproject.org/valkyrie/?#/builders/61/builds/4516
Note: this build was not rebased on the latest build-appliance update.

The following changes since commit bb166ac536daa43602ce8962cd3eb137783b8dc9:

  build-appliance-image: Update to scarthgap head revision (2026-09-11 14:32:15 +0100)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/scarthgap-next
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/scarthgap-next

for you to fetch changes up to e85367ebf673225c69694ee63679ea7620c4b420:

  u-boot, u-boot-tools: Fix CVE-2026-46728 (2026-09-11 17:32:37 +0200)

----------------------------------------------------------------

Daniel Turull (1):
  libarchive: mark CVE-2026-14164 as fixed-version

Darsh Kelaiya (1):
  python3-lxml: fix CVE-2026-41066

Deepak Rathore (2):
  binutils: fix CVE-2026-3441 and CVE-2026-3442
  binutils: fix CVE-2026-4647

Devansh Patel (1):
  u-boot: share CVE_PRODUCT with u-boot-tools

Gyorgy Sarvari (1):
  python3-py: set CVE_PRODUCT

Hetvi Thakar (4):
  python3-pip: Fix CVE-2026-8643
  go: Fix CVE-2026-33814
  go: Fix CVE-2026-39823
  u-boot, u-boot-tools: Fix CVE-2026-46728

Peter Marko (1):
  openssl: upgrade 3.5.7 -> 3.5.8

Vijay Anusuri (1):
  p11-kit: Fix CVE-2026-18938

Yoann Congal (1):
  linux-yocto/6.6: update CVE exclusions (6.6.151)

 .../u-boot/files/CVE-2026-46728.patch         |  379 ++
 meta/recipes-bsp/u-boot/u-boot-common.inc     |    2 +
 .../u-boot/u-boot-tools_2024.01.bb            |    2 +
 meta/recipes-bsp/u-boot/u-boot.inc            |    2 -
 meta/recipes-bsp/u-boot/u-boot_2024.01.bb     |    1 +
 .../{openssl_3.5.7.bb => openssl_3.5.8.bb}    |    2 +-
 .../binutils/binutils-2.42.inc                |    2 +
 .../CVE-2026-3441_CVE-2026-3442.patch         |   51 +
 .../binutils/binutils/CVE-2026-4647.patch     |  228 +
 meta/recipes-devtools/go/go-1.22.12.inc       |    2 +
 .../go/go/CVE-2026-33814.patch                |   44 +
 .../go/go/CVE-2026-39823.patch                |  100 +
 .../python/python3-lxml/CVE-2026-41066.patch  |  262 +
 .../python/python3-lxml_5.0.2.bb              |    4 +-
 .../CVE-2026-8643-regression_p1.patch         |   34 +
 .../CVE-2026-8643-regression_p2.patch         |   69 +
 .../python/python3-pip/CVE-2026-8643.patch    |   79 +
 .../python/python3-pip_24.0.bb                |    3 +
 .../python/python3-py_1.11.0.bb               |    2 +
 .../libarchive/libarchive_3.7.9.bb            |    5 +
 .../linux/cve-exclusion_6.6.inc               | 4540 ++++++++++++++++-
 .../p11-kit/files/CVE-2026-18938.patch        |   52 +
 .../recipes-support/p11-kit/p11-kit_0.25.3.bb |    1 +
 23 files changed, 5787 insertions(+), 79 deletions(-)
 create mode 100644 meta/recipes-bsp/u-boot/files/CVE-2026-46728.patch
 rename meta/recipes-connectivity/openssl/{openssl_3.5.7.bb => openssl_3.5.8.bb} (99%)
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2026-3441_CVE-2026-3442.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2026-4647.patch
 create mode 100644 meta/recipes-devtools/go/go/CVE-2026-33814.patch
 create mode 100644 meta/recipes-devtools/go/go/CVE-2026-39823.patch
 create mode 100644 meta/recipes-devtools/python/python3-lxml/CVE-2026-41066.patch
 create mode 100644 meta/recipes-devtools/python/python3-pip/CVE-2026-8643-regression_p1.patch
 create mode 100644 meta/recipes-devtools/python/python3-pip/CVE-2026-8643-regression_p2.patch
 create mode 100644 meta/recipes-devtools/python/python3-pip/CVE-2026-8643.patch
 create mode 100644 meta/recipes-support/p11-kit/files/CVE-2026-18938.patch


