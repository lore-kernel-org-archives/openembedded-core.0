Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95B1DC0219B
	for <webhook@archiver.kernel.org>; Tue, 11 Feb 2025 20:09:37 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web10.3285.1739304567629977178
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Feb 2025 12:09:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=l6LqCMtp;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.172, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-21f48ebaadfso101819225ad.2
        for <openembedded-core@lists.openembedded.org>; Tue, 11 Feb 2025 12:09:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1739304567; x=1739909367; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L5/QPfSIOiAL4FxKrpGxqJmfRdZC7WEYpvnrtP4idsA=;
        b=l6LqCMtpwHywtRh0Gbh6syKOhqGbdRzrn/m2OOwdW/De/uw2D7KnDse9c/ZPhkYUrr
         hKnUtvdu2sgzHbaogduWUjZpUDDDETy+rdnOkINuBxT+Jz7wL0iD8WIndzWDkJAsQOhz
         4gAaC8MO24dgeeX8aK34bfbBRrUO8XVBBF1QDEQTD/sYeV6zY+1mSbmus30skxJdKh3w
         eYKTYsM6Wajasqvuf9Gv0tXIjs7UI4OgLpVruqA2pcuIIWMhfg8OwLR1LA3kvWpfmQ0L
         IYaT4w3TsCX0rpiOiN+JfMRK9UkTaz9cAeXqVa1iFfV3gdgV3sgfMvppBxB/lOZeZ0B1
         PY/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739304567; x=1739909367;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L5/QPfSIOiAL4FxKrpGxqJmfRdZC7WEYpvnrtP4idsA=;
        b=mpNRfrj/VQam4gIzCjSvRenBQuUBptgYFXfvo/wpbL35AujmVCHH7pSktYKRb5950K
         YR4FXSlf9C2hK9DtUXB/1mZ3mPfEPFDxLwMhHl/9YcmBICjHctVhjZ+h07HP2cauVEwJ
         hs/UYiuXDMblfJnADvFaiOyv3D3HS/BrA0FzVvUlf4Tgag06eRLC7NCS+eQ3PVhUTstY
         3QmnPOcmeH8CTM8LT0KMtuLgQ+6I54uoP+t1/G3oKg/muntm3lWUs9Yf2y9ap5jv3MLo
         Ytfb21NxGXoh+5x1IHYhLBb1mXSpRwrppcWs5M8eu0SkhE2bFWn+IXjAemh7x79C7uhI
         0TfQ==
X-Gm-Message-State: AOJu0Yy+8H3WFX19AYXHBjOtDm8Or32mrC91vOqysK472Z4CWfVS1cto
	H4sQGIbh5Wa5tDxEuGznFIzykfAHGtM3DAtZul63pg+XtLwxnuM5eG84FfnXGflgMTo/ASYy2bO
	P
X-Gm-Gg: ASbGnctLEYFtuXoLi5M1KVR7HHQKSjrDKhugceNmuVN11ex3ASCGvVVEmRfeaGWyXVr
	TXa2uZQsJ1g17qBvF7JoYo/HOtHaJb7BZMXSyjAOm/PA9c7TpLQBPFwrq8Gx/O6bmXn2v8AOF3Q
	1wG0ygES54u79z3OPoZ70U9xXUcj0JxnSMwHcPCWgShfedWXpbTcHu/4vNGBpFFOg4ppZt81oX1
	NI3wY/MIL2PP8SnGeQCtV4Yn9ZTb5o8BBx2gS6ySz4jDNB6yg70tx7cbplr1LsRvS70IuNQuMgb
	qJ+L
X-Google-Smtp-Source: AGHT+IGaUNAETWYMgFRc8IQtC5dyNv4UMmmHYV2f/W7g67HHEeffxz3e822s1RNYBLB/Wablh18vIw==
X-Received: by 2002:a17:902:ebcd:b0:21f:324:a2f1 with SMTP id d9443c01a7336-220bbafee2fmr8621735ad.23.1739304566932;
        Tue, 11 Feb 2025 12:09:26 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f3687e696sm100486485ad.209.2025.02.11.12.09.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 12:09:26 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 04/14] ffmpeg: fix CVE-2024-36617
Date: Tue, 11 Feb 2025 12:09:03 -0800
Message-ID: <8057ba630477a7aeedf057b7e1ce25ab0c445665.1739304425.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1739304425.git.steve@sakoman.com>
References: <cover.1739304425.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Feb 2025 20:09:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211173

From: Archana Polampalli <archana.polampalli@windriver.com>

FFmpeg n6.1.1 has an integer overflow vulnerability in the FFmpeg CAF decoder.

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../ffmpeg/ffmpeg/CVE-2024-36617.patch        | 36 +++++++++++++++++++
 .../recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb |  1 +
 2 files changed, 37 insertions(+)
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-36617.patch

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-36617.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-36617.patch
new file mode 100644
index 0000000000..5d751213e3
--- /dev/null
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-36617.patch
@@ -0,0 +1,36 @@
+From d973fcbcc2f944752ff10e6a76b0b2d9329937a7 Mon Sep 17 00:00:00 2001
+From: Michael Niedermayer <michael@niedermayer.cc>
+Date: Sat, 30 Sep 2023 00:38:17 +0200
+Subject: [PATCH] avformat/cafdec: dont seek beyond 64bit
+
+Fixes: signed integer overflow: 64 + 9223372036854775807 cannot be represented in type 'long long'
+Fixes: 51896/clusterfuzz-testcase-minimized-ffmpeg_dem_CAF_fuzzer-6418242730328064
+Fixes: 62276/clusterfuzz-testcase-minimized-ffmpeg_dem_CAF_fuzzer-6418242730328064
+
+Found-by: continuous fuzzing process https://github.com/google/oss-fuzz/tree/master/projects/ffmpeg
+Signed-off-by: Michael Niedermayer <michael@niedermayer.cc>
+
+CVE: CVE-2024-36617
+
+Upstream-Status: Backport [https://github.com/ffmpeg/ffmpeg/commit/d973fcbcc2f944752ff10e6a76b0b2d9329937a7]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ libavformat/cafdec.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libavformat/cafdec.c b/libavformat/cafdec.c
+index f5ba0f4..e92e327 100644
+--- a/libavformat/cafdec.c
++++ b/libavformat/cafdec.c
+@@ -271,7 +271,7 @@ static int read_pakt_chunk(AVFormatContext *s, int64_t size)
+         }
+     }
+
+-    if (avio_tell(pb) - ccount > size) {
++    if (avio_tell(pb) - ccount > size || size > INT64_MAX - ccount) {
+         av_log(s, AV_LOG_ERROR, "error reading packet table\n");
+         return AVERROR_INVALIDDATA;
+     }
+--
+2.40.0
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb
index 3a18580e51..3ef2d9099d 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb
@@ -43,6 +43,7 @@ SRC_URI = " \
     file://CVE-2024-35365.patch \
     file://CVE-2024-36613.patch \
     file://CVE-2024-36616.patch \
+    file://CVE-2024-36617.patch \
 "
 
 SRC_URI[sha256sum] = "8684f4b00f94b85461884c3719382f1261f0d9eb3d59640a1f4ac0873616f968"
-- 
2.43.0


