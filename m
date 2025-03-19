Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6DC3C36006
	for <webhook@archiver.kernel.org>; Wed, 19 Mar 2025 08:16:49 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web10.2934.1742372204068062897
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Mar 2025 01:16:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Snk7EUtv;
 spf=pass (domain: gmail.com, ip: 209.85.214.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2254e0b4b79so26489395ad.2
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Mar 2025 01:16:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742372203; x=1742977003; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ocz2n2UXaOZ6BnjXTcvm371VNByrrdlTG0TcWzLoIoA=;
        b=Snk7EUtv6cxlvDza/JtbTbT2062nbgnXRj5ScNaU5tyHaQieQZ5KUto0KwTAjpiShM
         kGZwR1hjw9F2mbRWEB3t9Hiv5vSASOQvtdg56/CiPpZkaq2A8KqHCKskMKHM45d4R7oB
         XRf41L7pvmRvb4DukdS2CIQWytgvsw4LpioiPLo3SIv5L5/DWc4QTNlpX0scq5zWca11
         9Zd1S6PHUstf7bbOuGsCwv/vORPX3VHh5YvLQmbDp7HFNNgaguZBx/nnuBd3XJZR5SrQ
         jAN1Z8dVD4DNC6Y0F08ggwTMXjMUYyo+zFFTqRuQAEOk6yqAxwTGpHTZV8R/4VKUUQ32
         SvKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742372203; x=1742977003;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ocz2n2UXaOZ6BnjXTcvm371VNByrrdlTG0TcWzLoIoA=;
        b=XeF4RWgGM3iDjjHUBRs/ltJPB+ioLFjN2BDSnmavFw3hLGzaW6RY8g6aVtRvuqaOQM
         fr6/BB6EdA+910bNsv0cfEcIW0G9p1XNz9C/7p469kRzceY1LFMtCJuIRdlRbAuYqIgl
         UBvM/gJ33OWwn2N16QvhLN6JXi+m30YOa66T/oVTnQkCQ/s4M0T5Bggl8u/jB00alXOl
         mgk7NCNHyL9ukmqRdzxZwEknolpiOceVE++F/I9/C1U9poXZg/mw3HpbZPRrvIfaXHG1
         GGeEElh7u0EZ0MhiVXn27UWxD/KWXkOi3dpY6YhOxGLHh2CcRnfGeH1XlWlePviKRZ2w
         5Jng==
X-Gm-Message-State: AOJu0YwW+dFcMMSsu1yRqc8x3jBhuVtgkdEcKfdL81RdDqpm1LpyCFJM
	+nL3NBejqsED5nmko2osYvtDct/Ty5eMpGxL8YBg4Q5Ma8JLrO12GMCi0V19
X-Gm-Gg: ASbGncsNqNchzXwKMNy1t2avkQB1l/9J/TBBd/7K/642qG/X3nzkFY0k+c92yY0+RGv
	Gwry44QPg1f1yUxYTHgusgJE7JF/uAu8vz/bgFlpE/do6G64DcETdi6uzgbbaysJfdwkWZpmOcO
	tGgnZLNPLmNWK8prczj8olIcCkJ4ggbGXo/y1AL6gcmayrCXaR3q/5dpcAL6O3d+w3Nta1L6MWq
	04VxctSgkg5rom2z1bFaZzHqrvfJUJE2GgegK8seNhRwpZuWgLB+TtpauZTATC9CYOm+C3/2Xqk
	aF9xieEd4i7SW0D45RQ9Ygp7SDG03zibwJg089t11x14oM8=
X-Google-Smtp-Source: AGHT+IGQisZdbTFF7sHR4ZSEMKxuY0wEx9Tju6lvuXTtfyyXiCIIgZEvEYHDlLK/qRKNaGNRCP8uPw==
X-Received: by 2002:a05:6a20:2d09:b0:1f5:6d00:ba03 with SMTP id adf61e73a8af0-1fbed125619mr3480508637.36.1742372203313;
        Wed, 19 Mar 2025 01:16:43 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::ac74])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af56e9c95c5sm8704323a12.4.2025.03.19.01.16.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 01:16:42 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v3 24/27] ncurses: Pin to C17 standard
Date: Wed, 19 Mar 2025 01:16:04 -0700
Message-ID: <20250319081610.3536475-36-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250319081610.3536475-1-raj.khem@gmail.com>
References: <20250319081610.3536475-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Mar 2025 08:16:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213301

Newer snapshots of ncurses have the fixes but they are many needed to get
C23 going. Until next release lets stick with C17 even while GCC 15 switches
to C23 defaults.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/ncurses/ncurses.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-core/ncurses/ncurses.inc b/meta/recipes-core/ncurses/ncurses.inc
index 3f93550cf99..1e9ec38ceac 100644
--- a/meta/recipes-core/ncurses/ncurses.inc
+++ b/meta/recipes-core/ncurses/ncurses.inc
@@ -28,6 +28,9 @@ ENABLE_WIDEC ?= "true"
 # _GNU_SOURCE is required for widec stuff and is not detected automatically
 CPPFLAGS += "-D_GNU_SOURCE"
 
+# Check if we still need it when next release (6.6) happens
+CFLAGS += "-std=gnu17"
+
 # natives don't generally look in base_libdir
 base_libdir:class-native = "${libdir}"
 

