Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABA20C8303F
	for <webhook@archiver.kernel.org>; Thu, 28 Aug 2025 19:38:01 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web11.6215.1756409874342751719
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Aug 2025 12:37:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BuddGaG0;
 spf=pass (domain: gmail.com, ip: 209.85.210.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-7720f231174so1227863b3a.1
        for <openembedded-core@lists.openembedded.org>; Thu, 28 Aug 2025 12:37:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756409873; x=1757014673; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=P+X1KnLG52iqCAjIPCToYkJa6pHwqTbuEpVR+lvN0yY=;
        b=BuddGaG0nTvzstoDyd9R4sxFYGclVcSFaQkf4k/3PooBnDzwoOajlYFV9UMrJC2EUx
         dKPUlFu2ARwwdnrSUweNzzn2DnBJjE5xKdfmLwRf9cCCZd8LVApK1pDtHtufbdmbCP36
         zlyFlTFBpsBksb1ayW2k4aQQt6NCjLKqXI+fy+ccc3xqqyXU6of4HZ/rlx9SwcwsyyMH
         YR/7K7z/+euJPItrplV7VSlbCnsDQM6OXaCQ/OGPg7puhJpwYkJvZCQ1iqKbAgSLzbTK
         FhwJrL5C5PX89xtM4IAIzPX80NXEj4/xp8Yvbp7NFbhAhULdPX22Zv6GFIQLSkTmyUwd
         iiDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756409873; x=1757014673;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P+X1KnLG52iqCAjIPCToYkJa6pHwqTbuEpVR+lvN0yY=;
        b=FKI1kNoIDBT4c9Xp8wWEEx7MiWt5dhN8r3A75JktFX/MgQ900BzypcDHqi3W1iACFC
         JT9EiXtf/fop35bT7VIOsJs5TUBcrL3Y4ua8b4w/GKewKBC1bKnGzJhW96D6Va18EM5e
         Snu/cBvM9XxbB0hNZIj6LlIipVysZiXCfrAhzifWHfPxU97VTQPLevqLE14hGgh3NlLP
         m5HlhkVEcvTShQz0mewlhHoAh0AXy8QXcH1/LH3YIbcHs47F3dmQG7djVThJ68peEDlX
         +6cV5GkhYHertEXyl+nGS0nCERtv3yCayzaisoc0X3ZA6FVIM/K+dYLGtWNtwMCUVQ9X
         Mc0Q==
X-Gm-Message-State: AOJu0YzJhJHONSKee7c1lRtkuJqb4HN73BEBxyvrI3YxjtNUBGCn58xH
	GkrmJb472hhytFIyixY2A2Pv3DORnDy1YgRLiQfzPD45XP/sNYnuL1v7JHrpmJsx
X-Gm-Gg: ASbGncuYOV5i8Ugb7Wn/YTed2zTtRXwtT8U/T7Bb4cP2zYkrfA0tI00brD+eeRmsC+O
	QJq8KVyfrZMzs5eLKk8xa3XFsW6q3DVtbQQaC+Dwol6q0BnHSXl4L2SVa1LVxibEDhLLwX0cJDv
	rQP8eLBIvXSoYxF46fUp6Yid29AcpRruaVRzI5Q+sVyCrPmPM8kfMym3W94aUspzE1TFGxjIoEi
	XMh2jvg3mwiC/2b2hnuT8tHcYaKnROaOX0gUSem6dSB0QvJWNjYqE4ThhBh26dptuL7F2ma9wsg
	SbwAdQbFkQMlIGkALXDqy+6B3rI30KpzfvFosmhMxpSHdcw9PxGHVxWNch2hKiRm2T+SumvArYz
	EEfmZFcngYxfOzgKy3VJO/drCP/ucUPfJiVTfGuorAKsi6U1rw4/u4H3xYTcOGJ2gNGbnnbdXTZ
	aEMbExyWoxMAQ4iC0bBk9AaTpdJvfXuexZVtGRaOJ1
X-Google-Smtp-Source: AGHT+IHaPfqz+e4Xvry2/MmTUeJmEIp/74VILlriYQ65zZP4dkSGXKDdcBzzLijB+Oc6hDmM6LB54g==
X-Received: by 2002:a05:6a00:ad5:b0:76e:8e95:1382 with SMTP id d2e1a72fcca58-7702fa10651mr26238715b3a.5.1756409873058;
        Thu, 28 Aug 2025 12:37:53 -0700 (PDT)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::cfd6])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7722a4e1b21sm228495b3a.69.2025.08.28.12.37.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Aug 2025 12:37:52 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v2] babeltrace2: Disable ccache explicitly and inherit setuptools3-base
Date: Thu, 28 Aug 2025 12:37:50 -0700
Message-ID: <20250828193750.2607256-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 Aug 2025 19:38:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222595

ccache does not work with this package

python plugins use setuptools/distutils to build and it tries to compute
LDCXXSHARED as described in [1] in /src/bindings/python/bt2/setup.py.in
It gets confused and ends up specifying compiler twice and the result is
that linker fails with cryptic errors e.g.

| /mnt/b/yoe/master/sources/poky/build/tmp/work/x86-64-v3-poky-linux-musl/babeltrace2/2.1.1/recipe-sysroot-native/usr/bin/x86_64-poky-linux-musl/../../libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/ld: cannot find x86_64-poky-linux-musl-g++: No such file or directory
| collect2: error: ld returned 1 exit status
| error: command '/mnt/b/yoe/master/sources/poky/build/tmp/hosttools/ccache' failed with exit code 1
| make[3]: *** [Makefile:741: build-python-bindings.stamp] Error 1
| make[3]: Leaving directory '/mnt/b/yoe/master/sources/poky/build/tmp/work/x86-64-v3-poky-linux-musl/babeltrace2/2.1.1/build/src/bindings/python/bt2'

This is because first occurance of linker is encountering second linker on its
cmdline and tries to treat it as an input object to linker

It seems LDCXXSHARED computation gets confused when CXX contains ccache

[1] https://github.com/pypa/setuptools/commit/2c937116cc0dcd9b26b6070e89a3dc5dcbedc2ae

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Disable ccache instead of trying to tweak LDCXXSHARED

 meta/recipes-kernel/lttng/babeltrace2_2.1.1.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/lttng/babeltrace2_2.1.1.bb b/meta/recipes-kernel/lttng/babeltrace2_2.1.1.bb
index 1dc8cd8a498..945f82ef34a 100644
--- a/meta/recipes-kernel/lttng/babeltrace2_2.1.1.bb
+++ b/meta/recipes-kernel/lttng/babeltrace2_2.1.1.bb
@@ -19,10 +19,12 @@ SRC_URI = "git://git.efficios.com/babeltrace.git;branch=stable-2.1;protocol=http
 SRCREV = "7f2f8cd6dac497cbb466efb31219b531c62013f5"
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>2(\.\d+)+)$"
 
-inherit autotools pkgconfig ptest python3targetconfig
+inherit autotools pkgconfig ptest setuptools3-base
 
 EXTRA_OECONF = "--disable-debug-info --disable-Werror --enable-python-plugins --enable-python-bindings"
 
+CCACHE_DISABLE = "1"
+
 export DISTSETUPOPTS = " --install-lib=${PYTHON_SITEPACKAGES_DIR}"
 
 PACKAGECONFIG ??= "manpages"

