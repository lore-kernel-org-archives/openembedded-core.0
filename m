Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAB31CC6B03
	for <webhook@archiver.kernel.org>; Tue, 13 Oct 2026 10:49:59 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4062.1791888595851966565
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Oct 2026 03:49:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=q6zRAd3D;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a16c1608faso36366925e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 13 Oct 2026 03:49:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791888594; x=1792493394; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PQaPQGXMJ68Ym6L+LX3oDVCci+yREZ8PSjEVnbCV5I8=;
        b=q6zRAd3DlLIy/x5Bu9qHKbNAZibMmLEeCFk0dkZCudo2qTvLrwKVQ8fEM9DijeO4Q0
         J12MwabE23ovsi3uwfFsY9m8PktKr0nSA0aN4zILdxOhDlG698NeE5hJPcfhEMEumdPx
         hHma943auOC+tPv/lxgU6mUXxdqspmxYyZyqhSVuDJi1d4WC7huTYFFtymbExmbp5drf
         7Or6qvW4+V5wj3T5gnTooFKFNrruVMYb/NIC89VPWmKC+S2q9j46m7B0fmJ/sTZkR1yj
         xCMXfxgvutYjuM3jBMSSGbQsuM1kBiJ2dySui8bXU0y4nCYebnFHIpz05YYndhI6KZmt
         4mRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791888594; x=1792493394;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PQaPQGXMJ68Ym6L+LX3oDVCci+yREZ8PSjEVnbCV5I8=;
        b=PqZiLOrogAkG1Drl3k26a6H4r4n3C2CguKisSStWjrD0FalVNHfIKDg9FeAzyPSo/v
         Oa71baAP4yk5Ox4qalYhc86Mnw3zA5h82QIKD7/gF1+8sIunSWBFMBNaiUBOHsPOth4H
         BxTMAnQZhjV+ZjClYY/El9ZlUrk5sovQIFAoVUABORoP4GoPA6tE5bi7TV53wiJnRllw
         4RKx0oJBB17dz0YUpUClYw7veyBU1qq4SfltpvewkA5aMbfNQ8/Gn29MiSozMqc5lPLB
         apbH6rseGA7KfGDp/p/tae9UpyWSc4sGrWZCTtF3Yu9mgFDebDQoaZ0zlgjZ54zDr+Q9
         iukg==
X-Gm-Message-State: AFq9FYLCK4KAZkXHmeABPeoJFQjuCrP+rMdS8WYNBMH3ryhNrCX2hsAS
	pVEWfOCG60nuf7DQjNi2sUnW80lRIbdvuPoadsFd6ca6yZYFz3+pmgQoNz0urQ==
X-Gm-Gg: AYBFou3RKH90N8A7hXGEocH/hlK4ekmGKWcCyWN1BWPlfSo0nvlHuRmHYwuZanxxZkr
	GvtnuFSJ6cJErYxYvKYOJlfHfm2ucGg79k2qlQOznyQcQjdh5NQLrJ2Hw1jn22rLhkBsr+D01ks
	n7kE1esSYurcRGtDr825sbPy6pfK5GJvL/+Fp3EF7Fyn+Zs2E01QOCB+V+DOgLQMBMdglvFaE6A
	CdxZZJIHzNLAP7e+MaVduFqzvWMDXJuvyPDbHZ5IE5RGlLhYyscujKTtrlco0+B9JS5Ne0wheJ+
	7hZAifRNgNpP6Y4N8t05FEYt63M+PcpPTcIALLa99kfb6/GASrw2KawSt86kHZv0ZeaM2IRcTbj
	5EXM2W10K8YiWa9T0FmxERHeDc8G4cs8ofYARHW5jLzV1GD5HFYMInnA04ASPhUfwa9OBJQRwGQ
	Bj+B253fn/zygEmAnUA4Qs0JcbQrIuJe41CazIi9ly0vY5o2Q7uFKDMLfw1TG+eYdxZMy7UZkQi
	jeVOhe1TGBGdzyOfWhLdxA3jDw592VdVaw39/UQpFhIw6MTDw==
X-Received: by 2002:a05:600c:4e92:b0:49e:63cc:6324 with SMTP id 5b1f17b1804b1-4a18e4837e7mr237221165e9.6.1791888594054;
        Tue, 13 Oct 2026 03:49:54 -0700 (PDT)
Received: from [192.168.5.15] (cust18-dsl93-89-130.idnet.net. [93.89.130.18])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a19303d4a9sm31623155e9.2.2026.10.13.03.49.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 03:49:51 -0700 (PDT)
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Tue, 13 Oct 2026 11:49:36 +0100
Subject: [PATCH 2/4] update_font_cache: write caches that are valid in the
 final image
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261013-fontcache-reproducible-mtime-v1-2-950f07b80f0f@gmail.com>
References: <20261013-fontcache-reproducible-mtime-v1-0-950f07b80f0f@gmail.com>
In-Reply-To: <20261013-fontcache-reproducible-mtime-v1-0-950f07b80f0f@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
X-Mailer: b4 0.16.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Oct 2026 10:49:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247718

fontconfig accepts a directory's cache only while the mtime recorded in
it matches the directory, and fc-cache records the mtime clamped to
SOURCE_DATE_EPOCH. The intercept runs with the image's
SOURCE_DATE_EPOCH, against font directories that still carry their
packages' mtimes, and reproducible_final_image_task later sets every
mtime in the image to REPRODUCIBLE_TIMESTAMP_ROOTFS. The recorded and
final mtimes never match, so on the target every cache the image ships
is rejected and each process using fontconfig rescans the fonts and
writes a cache of its own.

When REPRODUCIBLE_TIMESTAMP_ROOTFS is set, set the mtime of every
directory under ${datadir}/fonts to it before running fc-cache, and run
fc-cache with it as SOURCE_DATE_EPOCH, so the caches record the mtimes
the image ships with.

AI-Generated: Claude Opus 5.5 (Claude Code)
Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---
 meta/classes-recipe/fontcache.bbclass         |  1 +
 scripts/postinst-intercepts/update_font_cache | 12 +++++++++++-
 2 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/meta/classes-recipe/fontcache.bbclass b/meta/classes-recipe/fontcache.bbclass
index deadcd2fbbeb..37ff7d7cbc7e 100644
--- a/meta/classes-recipe/fontcache.bbclass
+++ b/meta/classes-recipe/fontcache.bbclass
@@ -28,6 +28,7 @@ if [ -n "$D" ] ; then
 		'libdir="${libdir}"' \
 		'libexecdir="${libexecdir}"' \
 		'base_libdir="${base_libdir}"' \
+		'datadir="${datadir}"' \
 		'fontconfigcachedir="${FONTCONFIG_CACHE_DIR}"' \
 		'fontconfigcacheparams="${FONTCONFIG_CACHE_PARAMS}"' \
 		'fontconfigcacheenv="${FONTCONFIG_CACHE_ENV}"'
diff --git a/scripts/postinst-intercepts/update_font_cache b/scripts/postinst-intercepts/update_font_cache
index 900db042d64e..5098b2890cc8 100644
--- a/scripts/postinst-intercepts/update_font_cache
+++ b/scripts/postinst-intercepts/update_font_cache
@@ -7,7 +7,17 @@ set -e
 
 rm -f $D${fontconfigcachedir}/CACHEDIR.TAG
 
-PSEUDO_UNLOAD=1 ${binprefix}qemuwrapper -L $D -E ${fontconfigcacheenv} $D${libexecdir}/${binprefix}fc-cache --sysroot=$D --system-only ${fontconfigcacheparams}
+# fontconfig only uses a cache while the mtime it recorded for a font
+# directory, clamped to SOURCE_DATE_EPOCH, matches the directory. Every
+# mtime in the image is set to REPRODUCIBLE_TIMESTAMP_ROOTFS later, so set
+# the font directories' mtimes to it now and have fc-cache record that.
+sde=
+if [ -n "$REPRODUCIBLE_TIMESTAMP_ROOTFS" ] && [ -d $D${datadir}/fonts ]; then
+	find $D${datadir}/fonts -type d -exec touch -h --date=@$REPRODUCIBLE_TIMESTAMP_ROOTFS '{}' +
+	sde="-E SOURCE_DATE_EPOCH=$REPRODUCIBLE_TIMESTAMP_ROOTFS"
+fi
+
+PSEUDO_UNLOAD=1 ${binprefix}qemuwrapper -L $D -E ${fontconfigcacheenv} $sde $D${libexecdir}/${binprefix}fc-cache --sysroot=$D --system-only ${fontconfigcacheparams}
 
 chown -R root:root $D${fontconfigcachedir}
 find $D -type f -name .uuid -exec chown root:root '{}' +

-- 
2.43.0


