Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73EC0C44506
	for <webhook@archiver.kernel.org>; Tue, 30 Jun 2026 21:04:32 +0000 (UTC)
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.31378.1782853471675836450
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Jun 2026 14:04:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=qByM/Pt9;
 spf=pass (domain: gmail.com, ip: 209.85.210.51, mailfrom: jpewhacker@gmail.com)
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-7ea9c6ea7deso18703a34.3
        for <openembedded-core@lists.openembedded.org>; Tue, 30 Jun 2026 14:04:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782853471; x=1783458271; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qIKaNOy6vGLZFDcs5slzOtgn6LQKjBERxIgnII7+GsA=;
        b=qByM/Pt9uCaU9uJMuZVw5WcU+BhrJ1P8nhPso/ewj227jh+VWh9QFI5p8HVbwpUDnz
         ccwXVTwIHG6CxCJNLY10F5Jp9sivTwmTFT68482KqUk+aR0eZ7onhkKs1BAlCkjHNeBs
         R8ecv6DFhcdq/7Hq02NUoLDtcXmsAKu81SHm4JfUznCPGKQmQ4YVRd82osmzLdjARUnk
         mgnZgOL677HCxwWNNSHunI0i9RiclVNqHCDi3pFmL4PkAeZY3fvH5tSrIYrtGj1SvOnK
         3g4pBcM7gwBjjDxX7UZz0L3VLGHElu4pZkWeYK18l8HYo2LcnQwNTygsFt8RPDmWug0a
         8JwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782853471; x=1783458271;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qIKaNOy6vGLZFDcs5slzOtgn6LQKjBERxIgnII7+GsA=;
        b=cIcBmvv7+BIXonKl6rodVkqhBAAVnEbcECRA3hF0LD4Hg2qfGmMEp0HggGsjctJ3aZ
         N+9Av0J/DMM7G3b6CVt9kwqvA+qS71U7B8huAMfd428/hjt8SCbtuWGPH6bWatWBIR1E
         4vV9mpAaN7/9/EJ1XUqMgpthVOIFILqPm5OLx8TRlA0fb9hY/MsgCv/S8/qNFKDN+KwE
         il9WJuZc0B9uwHJQUTQfSX3yqwreWLMOgqsrqg+i22t5Ctfh/zYQ7O7H7qVDGFvI4gB5
         2Mkjmm/PSWWlpIgyeTazTnGdQF/U89KJlBaXdPU6OAsXZ6/a0ADMIlnqU3zdkVhx2Gzq
         ebXg==
X-Gm-Message-State: AOJu0YyVx4z9JyOE7fYN6NcIFJSPGZlULmxCFYFjzMn3dUdDW6fQ1PFm
	OsitgVpAHxUFb4BeuwpRbmko3AhDS5oCzai0E7HVoNgm352XmgXVA0CMvlCz7g==
X-Gm-Gg: AfdE7cld0nXjEp7gOkcYSbE0HrcsP69jMDVe0UJJEARfrW8iubc46D+sKNSGaOBnNtW
	NQmk/6+6cVx+t6t4jVs0jNX8921BSemNd9UXrtoQ+zh+BUs0KsapX6Y7YDcww+s9ttuDzC/s9cL
	AX2XTU6vA5U/1qKGncLNOWjPU8UDWAygWeBu95tGtYlkWWEsJpdIczRokSv0DHYZJXUY5piATAY
	P9LsjHQ9rWCqsa3YjR3J7OPJqrw/V6UWc9m9tgDM4dCQmsFLKlHMcHSUSx3zcmJyjWB++NCK7ep
	DX3e54eGYYNxSJmQXVeA1y5M8LLRLtRgr6KDaBKd/NKTk5T3hRUfUPqj5fQBaqiv9KUfTith1MC
	LPPLPOVX0j0gdtAGu+II6n5Fe5tQ6xB1Al/IBI5/HM+LKU5vOdvwqAB5VANagoEILY1eEDEeBpQ
	/SENmCuN+ub0cYMlJ8ZlIw
X-Received: by 2002:a05:6830:6af3:b0:7dd:9b19:a875 with SMTP id 46e09a7af769-7e9ec59b06dmr4596350a34.2.1782853470823;
        Tue, 30 Jun 2026 14:04:30 -0700 (PDT)
Received: from localhost.localdomain ([2601:283:4b02:22d0::3cfc])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7e9ebfd01cdsm3248143a34.8.2026.06.30.14.04.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 14:04:30 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH v4 09/10] multilib: Add systemd-boot to NON_MULTILIB_RECIPES
Date: Tue, 30 Jun 2026 15:01:43 -0600
Message-ID: <20260630210422.1903245-10-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260630210422.1903245-1-JPEWhacker@gmail.com>
References: <20260624141706.2164567-1-JPEWhacker@gmail.com>
 <20260630210422.1903245-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Jun 2026 21:04:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239924

systemd-boot is EFI firmware (like grub-efi) and doesn't make sense to
be multilib

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/conf/multilib.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/multilib.conf b/meta/conf/multilib.conf
index 6163405be4..aff55c1e9d 100644
--- a/meta/conf/multilib.conf
+++ b/meta/conf/multilib.conf
@@ -23,4 +23,4 @@ APT_ARGS:append = " -o Dpkg::Options::=--force-confnew -o Dpkg::Options::=--forc
 
 # These recipes don't need multilib variants, the ${BPN} PROVIDES/RPROVIDES
 # ${MLPREFIX}${BPN}
-NON_MULTILIB_RECIPES = "grub grub-efi make-mod-scripts ovmf u-boot gcc-source llvm-project-source"
+NON_MULTILIB_RECIPES = "grub grub-efi make-mod-scripts ovmf u-boot gcc-source llvm-project-source systemd-boot"
-- 
2.54.0


