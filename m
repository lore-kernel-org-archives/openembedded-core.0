Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8BFAC41513
	for <webhook@archiver.kernel.org>; Sun, 14 Jul 2024 12:39:08 +0000 (UTC)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.web10.15454.1720960744742400177
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Jul 2024 05:39:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=bUH0/V9w;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.175, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-78cc22902dcso588012a12.0
        for <openembedded-core@lists.openembedded.org>; Sun, 14 Jul 2024 05:39:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1720960744; x=1721565544; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UNEbyuzzl/EakDLOETBk8kExbBupxzGLVigz4ZNDL7M=;
        b=bUH0/V9wF9vbIyevm724P4S7YncLq3rl0yqKrFDBD7PsUYt/Jx+BncWFPIFBdOFtz7
         oers6yxpWM6ar2jeGbl1uwJ3wTnisAiJ7PB88m68zhFj0fM5AL4qjjAryG6O90XUfTqB
         CZf9BQ0p97c4LSuickFPsMw/E4AWCSdwAiGI9lxIxONxyrFjw1vZ/nF4+X/qxhn1PJU4
         Zhh2iDzHTBsfHJeak/WVqNI+bNQ0qIoATlxMw5i8N6YWdyFHkK/ITCEdNTGiyRIe6dch
         S6sMc1HqQwX9fXZrALAqa5TCYCPaKwvT770pQkd3da/ZbtaT9L517hgug+5uVuyt1G5S
         eOJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720960744; x=1721565544;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UNEbyuzzl/EakDLOETBk8kExbBupxzGLVigz4ZNDL7M=;
        b=hJg28ZXeoP4Wumg9Bu5Q0qfLUm0GZkesYyupYHTx6IQQvztw/3CPxYKQIaiIj1tFQS
         sgtcWHesYkb2+lQP3kLM5mBir/aEUuJjq9kCL5Q0wAz+MpWwP9IU8B/kWBc3lrx9YuGk
         CTpL4HMsRxW495YdleThZ5fuvVbveQ+k6E/KEsS5vnsvUfDOuuIROx8+UEIaYgZbmrHd
         xiZotuVj4W6BopVkZX7qOA3jJzXnOwIQIRmWpKhKGRtt5CRrJ+TgGiRNaJUKP5Oyaa7w
         9iHklOSfWWyuZdDzhRbYGNffgn7X4UDKjlVjAbpuSGsS66eO8bSeNcp5a47SdPy70T5M
         OsXQ==
X-Gm-Message-State: AOJu0Yz7bEOznRrzWbNVGf4wZEBk/s7ClRjyeitYkV6vlAV74Qt38rp2
	SkFKNBBwT/+JQnwDH9a7yAEAelh0yqTF1BhPYyZ2/JHF1up4xCK70X7FGFjVEXtXmyg+ItOkbMO
	iIUE=
X-Google-Smtp-Source: AGHT+IFiUP7Kc+tDatesz3gfB+S0HHoiOyWoEibwgFjmdt6Bd6L176sFBDDLKPv/mE0HWMIbpmSHmA==
X-Received: by 2002:a05:6a20:9147:b0:1c2:8cf4:766c with SMTP id adf61e73a8af0-1c29824d000mr16863052637.33.1720960743782;
        Sun, 14 Jul 2024 05:39:03 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fc0bb7006bsm23245245ad.41.2024.07.14.05.39.02
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jul 2024 05:39:03 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 01/27] cpio: mark CVE-2023-7216 as disputed
Date: Sun, 14 Jul 2024 05:38:30 -0700
Message-Id: <0f2cd2bbaddba3b8c80d71db274bbcd941d0e60e.1720960579.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1720960579.git.steve@sakoman.com>
References: <cover.1720960579.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 14 Jul 2024 12:39:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201860

From: Ross Burton <ross.burton@arm.com>

Upstream consider the behaviour described in this CVE as intentional,
and provide an option to stop it.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 6c99147037ba8ca424ee42520183bd2bd55c7056)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-extended/cpio/cpio_2.15.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-extended/cpio/cpio_2.15.bb b/meta/recipes-extended/cpio/cpio_2.15.bb
index 52070f59a2..95f82cdf3a 100644
--- a/meta/recipes-extended/cpio/cpio_2.15.bb
+++ b/meta/recipes-extended/cpio/cpio_2.15.bb
@@ -16,6 +16,7 @@ SRC_URI[sha256sum] = "efa50ef983137eefc0a02fdb51509d624b5e3295c980aa127ceee41834
 inherit autotools gettext texinfo ptest
 
 CVE_STATUS[CVE-2010-4226] = "not-applicable-platform: Issue applies to use of cpio in SUSE/OBS"
+CVE_STATUS[CVE-2023-7216] = "disputed: intended behaviour, see https://lists.gnu.org/archive/html/bug-cpio/2024-03/msg00000.html"
 
 EXTRA_OECONF += "DEFAULT_RMT_DIR=${sbindir}"
 
-- 
2.34.1


