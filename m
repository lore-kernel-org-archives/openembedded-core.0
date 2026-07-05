Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31EB3C4450B
	for <webhook@archiver.kernel.org>; Sun,  5 Jul 2026 22:43:20 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.139231.1783291390727393351
 for <openembedded-core@lists.openembedded.org>;
 Sun, 05 Jul 2026 15:43:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=ZOjKEgHs;
 spf=pass (domain: smile.fr, ip: 209.85.221.54, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-47d6c634f45so507001f8f.3
        for <openembedded-core@lists.openembedded.org>; Sun, 05 Jul 2026 15:43:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1783291389; x=1783896189; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kPQmYeo4Fq9GvwlU1L+c0b/cB23TyuG1Qh+nRRk14jM=;
        b=ZOjKEgHs5oQUmmWqtm1k60N91ENOadAo//OGG32pBCXyeNO0JU6/o4Hts+leV7g/pA
         GpWArG4rt4vRWbjJumsD718DDeuLlbrskVGHVLDy7Bych0Jnu7JaauNf+KZF3iAyU8Ss
         YIuIw7tDZbTBbgpDTEijv1aJhA1d+CIn/sxcU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783291389; x=1783896189;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kPQmYeo4Fq9GvwlU1L+c0b/cB23TyuG1Qh+nRRk14jM=;
        b=ZxlEe0ErN+DOvtisHu8q7lxjXrNO4O3EjQfTKbrEHUzd2OD05EMD+1gmVMf2N2VTiz
         b+WqcerXfxLhtl7zcF7ud05tf98RyTPw6kPEY/a+4OBrRZYLUQ4KdhCBeZr5wLaHASyu
         I2ozhSCi2V2jQDytKGh8dWlJc4FLOC5lwXOTAj/RPgflvOhRrPQNrgJyq+C0l9wWxxfB
         T94UOgGDtWd6ukWqR1Uny0VMwA/rj+vz1j4EnoPamjBMnv5g36POfoGw11lFC2cyIZiP
         b03FEnXN7khoLOby3z2JvsDywrgHjmUwK33Q33HUh9OcHawsNJ0hHEo6SviwCFRB3h7X
         XlYQ==
X-Gm-Message-State: AOJu0Yz9+yM0hGxhnUMrXUWeSbXMybHxqi82q4mwVA7q9uml1OQt36k/
	fwblHC1Hu47zwpnG3P8mSvMtjvcEo5oF378V6o7voDQLC/svW5cO2im1IZuItdrPK30FKFB+OcN
	jQEIPpm4=
X-Gm-Gg: AfdE7ckDu1nwp3LdKol/Kho17pCvvny1w/DxLQVAowMT5+uPicBtzNGivrBs0vhH8i2
	6xNcmZVJsVUUTtSarftgnD5fIPvpEaPqU1cnZB4RDfnRxebTs+E42wFP6N7Vh8c2xp7XHHmTp0A
	TYq/P6OVT2EaGZelmeuPJosI7VFdcda0SdiFJneUaYOm7sWNSHRaJ57Xtv8nL0V+/XCSURznPh4
	DcToM8hV6+QYRztyb1EdudPiS5Od/idQFmosgE1SnJvMxs0mHfTH2DAbQTTS8r9zqtNMYN0wcOk
	M36k4BMyzzgOiZJvTTnQG4jPFs8ds+Z9GsxAXeDmdd0gtXeDy95aAm6DSGhQeHEqbwjaBmZpGaV
	e955xBisg531IqaYKDd0moY+Wibmxn1ojTs7zp0DHLtDgdfxsqu0jZ/s+wWcd2Zp5h9ZdcxbDm0
	L3Sp87sx0VNIKVRle3lH2ccGzacgxjdD6DUjYd
X-Received: by 2002:a5d:64e3:0:b0:462:e086:35f with SMTP id ffacd0b85a97d-47aab1a5bbamr9656620f8f.21.1783291388629;
        Sun, 05 Jul 2026 15:43:08 -0700 (PDT)
Received: from FRSMI25-LASER.lan ([2001:861:8010:5750:6d3a:72ff:5857:d2a8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0960af0sm17943606f8f.30.2026.07.05.15.43.08
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 15:43:08 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 43/55] devtool: provide explicit error for missing "script" command
Date: Mon,  6 Jul 2026 00:41:33 +0200
Message-ID: <c8e73562a93ae7eedab78ac165ab2f9a22703fc6.1783289522.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1783289522.git.yoann.congal@smile.fr>
References: <cover.1783289522.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 05 Jul 2026 22:43:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240197

From: Walter Werner Schneider <contact@schnwalter.eu>

Without this "script" command, the "devtool build" provides a very
ambigous error: `/bin/sh: line 1: script: command not found`. With this
patch we provide a more detailed error.

On Fedora 43 the "script" command is not present by default, one needs
to install the "util-linux-script" package. On other systems it's in a
different package.

Signed-off-by: Walter Werner Schneider <contact@schnwalter.eu>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
(cherry picked from commit e9103c0ed24b0f3a50b878c626879748d8260ad0)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 scripts/lib/devtool/__init__.py | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/scripts/lib/devtool/__init__.py b/scripts/lib/devtool/__init__.py
index f47f57c465d..58b02eb4604 100644
--- a/scripts/lib/devtool/__init__.py
+++ b/scripts/lib/devtool/__init__.py
@@ -42,6 +42,9 @@ def exec_build_env_command(init_path, builddir, cmd, watch=False, **options):
         init_prefix = ''
     if watch:
         if sys.stdout.isatty():
+            import shutil
+            if not shutil.which('script'):
+                raise DevtoolError('The util-linux "script" command was not found')
             # Fool bitbake into thinking it's outputting to a terminal (because it is, indirectly)
             cmd = 'script -e -q -c "%s" /dev/null' % cmd
         return exec_watch('%s%s' % (init_prefix, cmd), **options)

