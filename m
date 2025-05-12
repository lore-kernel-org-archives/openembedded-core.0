Return-Path: <peter@meraki.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E54DFC3ABC3
	for <webhook@archiver.kernel.org>; Mon, 12 May 2025 21:38:07 +0000 (UTC)
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
 by mx.groups.io with SMTP id smtpd.web11.62172.1747085885871005666
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 May 2025 14:38:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@meraki.com header.s=google header.b=o/EKdQsH;
 spf=pass (domain: meraki.net, ip: 209.85.219.53, mailfrom: peter.hurley@meraki.net)
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-6f535b11824so48942026d6.2
        for <openembedded-core@lists.openembedded.org>; Mon, 12 May 2025 14:38:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=meraki.com; s=google; t=1747085885; x=1747690685; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9ohFa160knlo+XOR6zsNqHCJCB2bh38bHBlviH7ad0Q=;
        b=o/EKdQsHiue1UXK5zlM1AqBouGc1pkD8uBJ8fCib7lilmhdBPzZvahlWDDdvla/ZGb
         /QNRoHv/PBIJG4XXg8cyO6BnQ/Kslk9+sBG2tt0yYeKb2NKu5MYXO+wH51UgR+Cu6Kki
         uzfs5ka+55u53QxANe9cOfDubaWhK0HWuPOYI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747085885; x=1747690685;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9ohFa160knlo+XOR6zsNqHCJCB2bh38bHBlviH7ad0Q=;
        b=Q9Fr1gz5vOZTftfQ2DsjtG6Z8DofJ/PwAtQcOxVw/BSCYUWVDQU1AI0WmFjE/LBf1O
         p69sIIyKPdNlpRKxRe7ZYZS3MdMe6lto2tKEX4lqMer5bBEmxYVacHp1p+E0FdmMFpXj
         +aANWTUyWBq+fDay1mY9UHtj+jRQ7qmfPMw+CwEsHpy8NR1MqV1jnQErY+9s3HK1Kk0W
         1p8wsFRDJwx4Mg8HLSRHWY/XIcsOSFXSbRiy1Gkqa+jCCnq6jWrsBZ96g/yDgCcziJxJ
         pIzAnR9BIvlKSOqqieoxeTEoMpRxsZMS/Ob7JQNBYdwVkC5dcTLTPyzAAm84duDrh5Au
         mc/w==
X-Forwarded-Encrypted: i=1; AJvYcCVcy8ykFiIKCMBM/hDiaY6RHx2ROhkUP//6kZjWSdJJ93vOdn7R5PPgTItNejkICDuQXgxjjaXESq/05jxO8FsPJg==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yxhg/N910YRwjSAonCMkls2oi+mdAe8B2sZ7ZFjSUf4GSc0SqUh
	3JI4I1ua3jkBehnWkNHZDhu+VG6g2CE424O9YvJBYPAGpDV+5/SB/o7to47NRQ==
X-Gm-Gg: ASbGncuRmJqt2VFU7GlJuuXkLtnEUO1oOG+chSSVXAKLixlOELc6oG9nW+BgCDezz7Q
	4H1ibHfrebYJ44tVS5NjPTaKDftURqCXpfsqfmxwgd7JmkMmS6UGWzAr6Loh5jp6fvV4W0Hyu0n
	Yn++xeeB/XTSO84vuKIlCbW4UHi0F7esvH7CEs5h6M2hidZ8YXEMnr/QHaBHdP9hD6F7xQ6iJ6/
	M5eI9MWZO7l/2ODI3l1L/b8a58M46Sv2vZzALZB8FVR9KbZiSY5RdMgjD3z2xRKTZDDmhLwZQUD
	FazVX1yNrFOO6gccoaDDqJjVjEI01jegeJqLTYwUXg5u1Epo93AXL5xKktvMffnBraWBz7AMgaD
	Ze2CtxSj0U5eVWwRFDfZGWA==
X-Google-Smtp-Source: AGHT+IEupBxvr6xFNScl+rQK22aY0GqaKgum7TiJXQMDCYThu+w2jG4N5jKr3oDwGfg98yqFT+uOFQ==
X-Received: by 2002:ad4:5fca:0:b0:6d8:a8e1:b57b with SMTP id 6a1803df08f44-6f6e4814d2dmr262102756d6.36.1747085884798;
        Mon, 12 May 2025 14:38:04 -0700 (PDT)
Received: from sf117.meraki.com (199-116-75-201.public.monkeybrains.net. [199.116.75.201])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f6e39e0716sm58194896d6.23.2025.05.12.14.38.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 14:38:03 -0700 (PDT)
From: peter@meraki.com
To: Steve Sakoman <steve@sakoman.com>,
	openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>,
	Alexander Kanavin <alex@linutronix.de>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Peter Hurley <peter@meraki.com>
Subject: [kirkstone][PATCH] perl: enable _GNU_SOURCE define via d_gnulibc
Date: Mon, 12 May 2025 14:37:54 -0700
Message-ID: <20250512213754.14087-1-peter@meraki.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 May 2025 21:38:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216388

From: Alexander Kanavin <alex.kanavin@gmail.com>

This is needed to properly support memmem() and friends under musl
as musl guards the declarations with _GNU_SOURCE define, and if the
declarations are not present, gcc will issue warnings and generate
assembly that assumes the functions return int (instead of e.g.
void*), with catastrophic consequences at runtime.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 6422e62fbc5c65a2165a72c97c880cfa9a80e957)
Signed-off-by: Peter Hurley <peter@meraki.com>
---
 meta/recipes-devtools/perl/perl_5.34.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/perl/perl_5.34.1.bb b/meta/recipes-devtools/perl/perl_5.34.1.bb
index 42bcb8b1bc68..619152256110 100644
--- a/meta/recipes-devtools/perl/perl_5.34.1.bb
+++ b/meta/recipes-devtools/perl/perl_5.34.1.bb
@@ -61,6 +61,7 @@ do_configure:class-target() {
     -Dlibpth='${libdir} ${base_libdir}' \
     -Dglibpth='${libdir} ${base_libdir}' \
     -Alddlflags=' ${LDFLAGS}' \
+    -Dd_gnulibc=define \
     ${PACKAGECONFIG_CONFARGS}
 
     #perl.c uses an ARCHLIB_EXP define to generate compile-time code that
-- 
2.49.0


