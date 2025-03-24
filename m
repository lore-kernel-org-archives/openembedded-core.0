Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0784C36010
	for <webhook@archiver.kernel.org>; Mon, 24 Mar 2025 16:34:03 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web10.44233.1742834043377005592
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Mar 2025 09:34:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LLcLnFEB;
 spf=pass (domain: gmail.com, ip: 209.85.214.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-227b650504fso29497175ad.0
        for <openembedded-core@lists.openembedded.org>; Mon, 24 Mar 2025 09:34:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742834043; x=1743438843; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sibmAil0mDBbSN/Lj7jus5YWa34ERRk6oW0275slzzY=;
        b=LLcLnFEB9P3rOWoywAr55kyvK3KzO50aMr8T4deJwLKhvH25aujCz4/L+e+58AATa7
         ugXJiX3SLuNgCeML8Ta2L6EvRODlE1XBQAgbj1GnjVS+KUn5aR0WI8CjHRrsWVz7NeiY
         Y8DS+JjYi67qihh0j/lX2SxQYhww7cNh32WXOMDwgNtaDLnpJBrZ6TfI8cICVrDlhFAA
         RgRVKB/Q+HAxMqbsuFCR8m7YqvXEkVw1sqjpG4tcIQkiuUiutTTb5TyQ33tcS4oftrpX
         sd5wILZjxj1PTxlqHm00j3zFAq7Mw9cF7R2oxOf3ME7mvshbOQNeyI2Rts3Nl/F0aoxy
         tzrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742834043; x=1743438843;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sibmAil0mDBbSN/Lj7jus5YWa34ERRk6oW0275slzzY=;
        b=LVatnfV9bjcZFFcLVdmnJLAX+w5jZyrRlcreorvLF27QVQmG5JS8o8WlgXSlFDgYFI
         BKqdooPRSj/mGN1owwxXl2JZCeu5PuMIybXfmIlYOc0rwgGXJd6Xpo8Cfte5aZSmPYS4
         gmwifcX+VoC8x1x4zDk304WvCqDJn8xmf6U96ZIrdyStKkKJ/RqwI+BVgjhCh9/uujqP
         HOhyxK65d8npI/QD6WYA0x2GYFL7dHT0cl7bmvr7e8sc0PpI6pEEmT0AOtBpjYqnsiXt
         kTDmJz9OJDSkWi/CDBS5FEG5zMroeSOOlExZ1Uwx1CVrpD2DGuKN3Fulf9OoD3RS6byL
         E/aw==
X-Gm-Message-State: AOJu0YxpJMlBFmJnc9PNNaamyQ7AjELDRFocmEeY29199uhCwSPi3a1I
	JJ+6+WLy+0jIUnahwl5YpkvRsPhl2XF9K7K3urBQT0tRue8Fnhd8yVGw5FI5
X-Gm-Gg: ASbGncsxuOkgCh8yUS5JrNWNiP3HY1TInCidrz0ObvYdQhwPs0tgRy790Nv+vmJlVBx
	MM6A0HEmqeDlgCMX/y3EY79lTBpTLPcLPKE1aDLi6AspThDMoZGhh44fr680Aae7aSPOqZ76Fru
	hAOeZ9GhsqI9kMBoW9nFt1miGcdkAxCNtDTCDfdwnRlqtXA2W0GlSP7X42zmkUUX8xj/e+LHOB+
	HdTXx/TMY+8WcLDMlsDXPk72FFcJP2JH5dE9rYpZ3alh2aehmDijigMFjNCSdYZQfgAyChJMatL
	M3QpUQsFZt2bbSfTUU3gedzDparPQAbmdCdWUW0g0cu//4I=
X-Google-Smtp-Source: AGHT+IFyNw8UH4s1o0hxMvtNJqI+E/h+cGiFltv/fDtSUL+PzSIbkkCojkTrmNw0synq7ct2zbFd/w==
X-Received: by 2002:a05:6a21:910c:b0:1f3:37c4:5005 with SMTP id adf61e73a8af0-1fe4300d705mr21648490637.33.1742834042622;
        Mon, 24 Mar 2025 09:34:02 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::b570])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af8a2803d8csm7372192a12.26.2025.03.24.09.34.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Mar 2025 09:34:02 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 24 Mar 2025 09:33:41 -0700
Subject: [PATCH 20/21] syslinux: Use -idirafter to add back path for system
 stdarg.h
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250324-b4-musl-gcc15-v1-20-ca68c03c5b01@gmail.com>
References: <20250324-b4-musl-gcc15-v1-0-ca68c03c5b01@gmail.com>
In-Reply-To: <20250324-b4-musl-gcc15-v1-0-ca68c03c5b01@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
X-Mailer: b4 0.14.2
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Mar 2025 16:34:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213552

syslinux uses -nostdinc to build freestanding, which makes sense, however
it also tried to latch its own copy of stdarg.h to include system stdarg.h
via "include_next" compiler magic, so it poses to provide own stdarg.h but
then secretly include system version behind the scenes :)

It uses -nostdinc -iwithprefix include

hoping that gcc is uses and gcc has its include-fixed abstraction which
also contains stdarg.h so in the end it will find a version of stdarg.h
from system (even though it is from the compiler install ) and things will
work.

On musl, include-fixed is not expected and system includes are simplified
so that everyone can look into <sysroot>/usr/include to find them. This
can throw syslinux compilation into problems as now it does not find
the header from -iprefix and ends up with errors like

/mnt/b/yoe/master/sources/poky/build/tmp/work/core2-32-poky-linux-musl/syslinux/6.04-pre2/syslinux-6.04-pre2/com32/lib/../include/stdarg.h:9:15: fatal error: stdarg.h: No such file or directory
    9 | #include_next <stdarg.h>
      |               ^~~~~~~~~~
compilation terminated.

Therefore, we use -idirafter to point it into target sysroot as fallback
for system headers if it needs them, its added at the very last in search
order. It also keeps working with glibc based toolchains as usual and
also works with musl toolchains.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/syslinux/syslinux_6.04-pre2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/syslinux/syslinux_6.04-pre2.bb b/meta/recipes-devtools/syslinux/syslinux_6.04-pre2.bb
index fa7054bc54ffdc5d7249cc7904b7458695b3c4bb..7cf737170c3656a26f2d3f52ee15671c03558b1c 100644
--- a/meta/recipes-devtools/syslinux/syslinux_6.04-pre2.bb
+++ b/meta/recipes-devtools/syslinux/syslinux_6.04-pre2.bb
@@ -49,7 +49,7 @@ TARGET_LDFLAGS = ""
 SECURITY_LDFLAGS = ""
 LDFLAGS_SECTION_REMOVAL = ""
 
-CFLAGS += "-DNO_INLINE_FUNCS -Wno-error=implicit-function-declaration"
+CFLAGS += "-DNO_INLINE_FUNCS -Wno-error=implicit-function-declaration -idirafter ${STAGING_INCDIR}"
 
 EXTRA_OEMAKE = " \
 	BINDIR=${bindir} SBINDIR=${sbindir} LIBDIR=${libdir} \

-- 
2.49.0


