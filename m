Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F9A2F4642F
	for <webhook@archiver.kernel.org>; Mon, 16 Mar 2026 09:30:09 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.46887.1773653403604728323
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Mar 2026 02:30:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=dUxgCY1M;
 spf=pass (domain: smile.fr, ip: 209.85.221.52, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-439b9cf8cb5so4938084f8f.0
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Mar 2026 02:30:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1773653402; x=1774258202; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Na0Xjx/jQIJqC1vBkJBVQeo2gPipS4XjPxpNTJNzI6M=;
        b=dUxgCY1MigYN2CHp3SJ1r90P2vhQgoXGumyDvJSTrHchmWZNbMQVFPZvsDTLuMtx+P
         JPi9Fpebea/AUsBvL/tImkaGQK1kY+Q+NxmDqKSue7bhctN2W3rR0SVTyAEXDIq4ZVat
         4dwCvF2ASdYe7YLf+h/nqYH2K1AkZUV4Qfers=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773653402; x=1774258202;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Na0Xjx/jQIJqC1vBkJBVQeo2gPipS4XjPxpNTJNzI6M=;
        b=FUNHC/Gh588MMURvJWLDu6KxCvRWV3wtu57CAVYxwzDVudoc3ZnQg6XBycAzeS212J
         6w/jxlOmaVEx6ra1dhZdP+TZiPAT/Zs/Z1djBfLIufylNhWnesniDKCjMJcRPS06m/4H
         6EeuUU5EHYcqqSJ/5+YWZbNSjsf63+SQTQ2bQUKAO/cuw3rAmfa/IaSfpjZ53VurSGAs
         i91cbqPkPfwIgOQLlAtq96hLhJIOST8ojWs5IajliyqUKrVKs77PRLRp/xTrsfxxpI89
         6NrN7sqedlgcvKjpItxb7mh4fU0XT3TyIXk+WbTIJyPplV7stmfCFDfLy/TCMhTVf1Lk
         lgJw==
X-Gm-Message-State: AOJu0Yz6hLMZ1EbhmJt/MhkdNtBPsU6e6MqMKwXTlHzLJZ6td3LLsMM+
	RyTZzMlZcyS1yyBK8d1hd5BLtpc3U0eEauhYA0CCMN1dux8WD4MXfCqy6OxA7BvQYfynxHUNzS6
	++Gkx
X-Gm-Gg: ATEYQzwgkTLc0pxiTzc+kj3v3XAOQPX8pljrtW0F1QXmSYdGOh4gly92+f1AnDciJbj
	tLSGL0hUGSAsjt4GdzVg3tXKXYYzCoPFEfwudQtHW1Rj8YoY+KLJBYtcmF96j40YIdS2XOEtOyE
	c3MOnIbTai8KYorusEhbVXZuL9sXDibOCYd5soGp5D0/R44/1eQ1rAr73kZw5B85MIZWvQ4dpjT
	ZMudpcZyrCLMdo8oeQB6EWqoHAZcrcH7OtxY2Mm8QrJdIxrm6fkxmh7owj57Aj8nXSSvq0Vzv+b
	BwG1bPOGv3UUvKTZ0TFUHjGdUNPLK7mPXHqP3/PM1VwlKPeXxj/f7e5Q6fw4A14QN8rRIpSBzct
	EnDiMaEp9O+ZeTpagoLI6TiNXcaEQIQT/Dt9qabIgFni6YqQguli7hw6tR5dx0OTKZsQ/l9svVr
	W0Z9nYs98SbPnxA9I5EWk6ymJaB1V/gPI/MrUnMhuNdNNN1KOzxG3XrqpjQRKIB9/UHKRr//rB5
	enwwVwT39AdjQhNqpAXsr9Jy0jsy+8lIQ==
X-Received: by 2002:a05:600c:548f:b0:477:b642:9dc1 with SMTP id 5b1f17b1804b1-4855670514dmr197645155e9.20.1773653401250;
        Mon, 16 Mar 2026 02:30:01 -0700 (PDT)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48557a732cesm91138265e9.12.2026.03.16.02.30.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 02:30:00 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 00/17] Patch review
Date: Mon, 16 Mar 2026 10:28:19 +0100
Message-ID: <cover.1773652940.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Mar 2026 09:30:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233222

Please review this set of changes for kirkstone and have comments back by
end of day Wednesday, March 18.

Passed a-full on autobuilder:
https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/3429
This build was impacted by:
* 16185 – AB-INT: failed connections to git.yoctoproject.org https://bugzilla.yoctoproject.org/show_bug.cgi?id=16185
  * https://autobuilder.yoctoproject.org/valkyrie/#/builders/6/builds/3403
     * rebuilt successfully as https://autobuilder.yoctoproject.org/valkyrie/#/builders/6/builds/3404
  * https://autobuilder.yoctoproject.org/valkyrie/#/builders/78/builds/3404
     * rebuilt successfully as https://autobuilder.yoctoproject.org/valkyrie/#/builders/78/builds/3405
* A random network glitch on github:
  * https://autobuilder.yoctoproject.org/valkyrie/#/builders/30/builds/3357
    * rebuilt successfully as https://autobuilder.yoctoproject.org/valkyrie/#/builders/30/builds/3360 

The following changes since commit 7b6c9faa301a6d058ca34e230586f6a81ffa3ffb:

  build-appliance-image: Update to kirkstone head revision (2026-02-27 15:59:49 +0000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/kirkstone-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/kirkstone-nut

for you to fetch changes up to ec995339f1f4143616f1b13814899acaf137b0b5:

  createrepo-c: Fix createrepo-c-native build on GCC14 hosts (e.g. Fedora 41) (2026-03-15 23:59:54 +0100)

----------------------------------------------------------------

Aleksandar Nikolic (1):
  scripts/install-buildtools: Update to 4.0.33

Hitendra Prajapati (1):
  libpam: fix CVE-2024-10963

Ken Kurematsu (1):
  libtheora: set CVE_PRODUCT

Martin Jansa (2):
  libpam: re-add missing libgen include
  lsb.py: strip ' from os-release file

Peter Marko (7):
  alsa-lib: patch CVE-2026-25068
  ffmpeg: patch CVE-2025-10256
  inetutils: patch CVE-2026-28372
  busybox: patch CVE-2025-60876
  tiff: patch CVE-2025-61143
  tiff: patch CVE-2025-61144
  tiff: set status of CVE-2025-61145 as fixed by patch for CVE-2025-8961

Shaik Moin (1):
  gdk-pixbuf: Fix CVE-2025-6199

Vijay Anusuri (1):
  python3-pip: Fix CVE-2026-1703

Yoann Congal (3):
  gtk+3: fix incompatible-pointer-types errors for native build on
    Fedora 41
  libcomps: Fix libcomps-native build on GCC14 hosts (e.g. Fedora 41)
  createrepo-c: Fix createrepo-c-native build on GCC14 hosts (e.g.
    Fedora 41)

 meta/lib/oe/lsb.py                            |   2 +-
 .../inetutils/inetutils/CVE-2026-28372.patch  |  86 +++++++
 .../inetutils/inetutils_2.2.bb                |   1 +
 .../busybox/busybox/CVE-2025-60876.patch      |  38 +++
 meta/recipes-core/busybox/busybox_1.35.0.bb   |   1 +
 ...-proper-cast-for-PyMethodDef.ml_meth.patch |  41 ++++
 .../createrepo-c/createrepo-c_0.19.0.bb       |   1 +
 ...orrect-variable-for-category-and-env.patch |  48 ++++
 .../libcomps/libcomps_0.1.18.bb               |   1 +
 .../python/python3-pip/CVE-2026-1703.patch    |  37 +++
 .../python/python3-pip_22.0.3.bb              |   1 +
 .../pam/libpam/CVE-2024-10963.patch           | 229 ++++++++++++++++++
 .../pam/libpam/CVE-2025-6020-01.patch         |   4 +-
 meta/recipes-extended/pam/libpam_1.5.2.bb     |   1 +
 .../gdk-pixbuf/gdk-pixbuf/CVE-2025-6199.patch |  36 +++
 .../gdk-pixbuf/gdk-pixbuf_2.42.10.bb          |   1 +
 ...-type-when-calling-GtkWidget-methods.patch |  28 +++
 ...ests-Add-GdkEvent-casts-in-testinput.patch |  48 ++++
 meta/recipes-gnome/gtk+/gtk+3_3.24.34.bb      |   2 +
 .../alsa/alsa-lib/CVE-2026-25068.patch        |  34 +++
 .../alsa/alsa-lib_1.2.6.1.bb                  |   1 +
 .../ffmpeg/ffmpeg/CVE-2025-10256.patch        |  31 +++
 .../recipes-multimedia/ffmpeg/ffmpeg_5.0.3.bb |   1 +
 .../libtheora/libtheora_1.1.1.bb              |   2 +
 .../libtiff/tiff/CVE-2025-61143.patch         |  44 ++++
 .../libtiff/tiff/CVE-2025-61144.patch         |  27 +++
 .../libtiff/tiff/CVE-2025-8961.patch          |   1 +
 meta/recipes-multimedia/libtiff/tiff_4.3.0.bb |   2 +
 scripts/install-buildtools                    |   4 +-
 29 files changed, 748 insertions(+), 5 deletions(-)
 create mode 100644 meta/recipes-connectivity/inetutils/inetutils/CVE-2026-28372.patch
 create mode 100644 meta/recipes-core/busybox/busybox/CVE-2025-60876.patch
 create mode 100644 meta/recipes-devtools/createrepo-c/createrepo-c/0001-Use-proper-cast-for-PyMethodDef.ml_meth.patch
 create mode 100644 meta/recipes-devtools/libcomps/libcomps/0001-Fix-build-use-correct-variable-for-category-and-env.patch
 create mode 100644 meta/recipes-devtools/python/python3-pip/CVE-2026-1703.patch
 create mode 100644 meta/recipes-extended/pam/libpam/CVE-2024-10963.patch
 create mode 100644 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/CVE-2025-6199.patch
 create mode 100644 meta/recipes-gnome/gtk+/gtk+3/0001-Use-the-right-type-when-calling-GtkWidget-methods.patch
 create mode 100644 meta/recipes-gnome/gtk+/gtk+3/0002-tests-Add-GdkEvent-casts-in-testinput.patch
 create mode 100644 meta/recipes-multimedia/alsa/alsa-lib/CVE-2026-25068.patch
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2025-10256.patch
 create mode 100644 meta/recipes-multimedia/libtiff/tiff/CVE-2025-61143.patch
 create mode 100644 meta/recipes-multimedia/libtiff/tiff/CVE-2025-61144.patch


