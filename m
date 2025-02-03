Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9EEDC02199
	for <webhook@archiver.kernel.org>; Mon,  3 Feb 2025 16:41:40 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web11.92293.1738600899455688772
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Feb 2025 08:41:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=OD21MdxE;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-38633b5dbcfso4852433f8f.2
        for <openembedded-core@lists.openembedded.org>; Mon, 03 Feb 2025 08:41:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1738600897; x=1739205697; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XhqR/SPUFAVpM4cXPvh/n1F5u/pN8r2Y1TJPxxAxvyA=;
        b=OD21MdxE4W28pRlwdnASDzNOvDHdMibMNU7ESk5XDDkDuVctcHME61fBLjhRO9rH4X
         dwrhy65fVvf+71B+z3zBfaHPS7bNm2LRwAt8eu4RzfSF3I2F7WNVWwCYCHomSzSkSm14
         upq1qEW9RpR/WeIxgk905omYOcdyvhizXmLJo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738600897; x=1739205697;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XhqR/SPUFAVpM4cXPvh/n1F5u/pN8r2Y1TJPxxAxvyA=;
        b=NjISq8GfxHdO5wXk8zYh09wW7+7Y7j6Oe43m3aW2+XG0YYB5W4AnYfiLnLprpftKQ5
         qAllO6E+uRbBzQnq1accO/rM4SJmvkEGgvUyQq1U8ovGhV4SihaZu+8/E8GqnGrhwQKZ
         J+ae4PPGiHWh+nCczigvYQJCrLw9SVvKMBQuMpjMpLrEAqLALcV+M7KWVV38kWbhnLnt
         BCV45UK8cKt5HSoBSZ9+M1NEyfryNJ8tl3TsuWAmzFjipf10YPv20vqJW+WKSW0UEz3m
         1NzGUqsZQC6NtduDDJPmFXakDFCuPTW6UTT5/lb9JwPwr0N+EJGhI6y/T3vJPcYNoJvv
         EryQ==
X-Gm-Message-State: AOJu0Yy5i6Cq66FjS3t1jo/pdL3eQ3jd9Nb1zH2KMpeAx+s031wJB4DW
	Cyt5j5P3ov7IwI+0f1HOeXI2r0RV1+o38Zlqt/UoExbnB3HxNy+Ks4h0Lnr0q/DTgKZiD4d7ajg
	1
X-Gm-Gg: ASbGncv+zXpjDlcvPJKd3gq4YrtUMl3tLLn+tWDBvZhGP1Fvvuch80wvw2rKSs9u7rZ
	5Bd2eGSdRU7B0URrKXMom+CvbsfEV66OvkLHxZ8lIxV2urhNYiuzv8ngPfYWVuILiFOFHGl0yOp
	0vsiwJVpr/QDkOa83dst7Q8RJGKB+Bzl2sIyz+3yp439QnH+oHqYgYXahd5XXZwzH+mWJnQfa+/
	Q+COyJEt7ljgcNikW8OGSfcXvI6iMDTZkLVYTvpqOsKIODtKSUMybYO3hcM9a21QLxw77k718li
	8C1lX3DqZD8y+ofyGMtSbVhFI1IydKxntW/BI8hVGSqp
X-Google-Smtp-Source: AGHT+IHgwbJLZkaGqoDZwwOhTqDJQjt6sWakPTwGrQIjvxb9DqwRKy3ykGnprcQAM8fiyB6pFxyyfg==
X-Received: by 2002:a05:6000:18a9:b0:385:f66a:4271 with SMTP id ffacd0b85a97d-38c519399bfmr19013435f8f.4.1738600897431;
        Mon, 03 Feb 2025 08:41:37 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:41c1:3919:865f:692c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c0ec886sm13122395f8f.1.2025.02.03.08.41.36
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 08:41:36 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 07/46] gst-devtools: upgrade 1.24.10 -> 1.24.12
Date: Mon,  3 Feb 2025 16:40:51 +0000
Message-ID: <20250203164130.3403325-7-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250203164130.3403325-1-richard.purdie@linuxfoundation.org>
References: <20250203164130.3403325-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Feb 2025 16:41:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210680

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../0001-connect-has-a-different-signature-on-musl.patch        | 2 +-
 .../{gst-devtools_1.24.10.bb => gst-devtools_1.24.12.bb}        | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gst-devtools_1.24.10.bb => gst-devtools_1.24.12.bb} (95%)

diff --git a/meta/recipes-multimedia/gstreamer/gst-devtools/0001-connect-has-a-different-signature-on-musl.patch b/meta/recipes-multimedia/gstreamer/gst-devtools/0001-connect-has-a-different-signature-on-musl.patch
index 7423cebc39d..b596f2ef9c6 100644
--- a/meta/recipes-multimedia/gstreamer/gst-devtools/0001-connect-has-a-different-signature-on-musl.patch
+++ b/meta/recipes-multimedia/gstreamer/gst-devtools/0001-connect-has-a-different-signature-on-musl.patch
@@ -1,4 +1,4 @@
-From 9749abecad3ffcd497e216f813f935f0937e6453 Mon Sep 17 00:00:00 2001
+From 67809420230cd4fcc63069f78efdc90c7b4c4ee1 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sun, 9 Sep 2018 17:38:10 -0700
 Subject: [PATCH] connect has a different signature on musl
diff --git a/meta/recipes-multimedia/gstreamer/gst-devtools_1.24.10.bb b/meta/recipes-multimedia/gstreamer/gst-devtools_1.24.12.bb
similarity index 95%
rename from meta/recipes-multimedia/gstreamer/gst-devtools_1.24.10.bb
rename to meta/recipes-multimedia/gstreamer/gst-devtools_1.24.12.bb
index 7e46634ed05..157cdc6bbbd 100644
--- a/meta/recipes-multimedia/gstreamer/gst-devtools_1.24.10.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-devtools_1.24.12.bb
@@ -12,7 +12,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-devtools/gst-devtools-${PV}
            file://0001-connect-has-a-different-signature-on-musl.patch \
            "
 
-SRC_URI[sha256sum] = "2983537148b0a8d52bad2a3f4c9dcca808fd5aa12fccee25acc4a4277f0780ec"
+SRC_URI[sha256sum] = "4ef3dd12e5827068d6db7ad01876d1216a80717116c24a0d5b3b57fd7e3c3478"
 
 DEPENDS = "json-glib glib-2.0 glib-2.0-native gstreamer1.0 gstreamer1.0-plugins-base"
 RRECOMMENDS:${PN} = "git"

