Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC030C7619A
	for <webhook@archiver.kernel.org>; Sun,  9 Apr 2023 02:39:40 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web10.12259.1681007977394141740
 for <openembedded-core@lists.openembedded.org>;
 Sat, 08 Apr 2023 19:39:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=oEvmxy2n;
 spf=pass (domain: gmail.com, ip: 209.85.216.46, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f46.google.com with SMTP id c3so2272662pjg.1
        for <openembedded-core@lists.openembedded.org>; Sat, 08 Apr 2023 19:39:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1681007976;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5SRgC3jGGlWIY6qAHO8PwT5bgTIGqve7AyJ3w1OyImk=;
        b=oEvmxy2nTRyTUPK6XAudraeo6rHoFT6joxYehUaJiDhx2jebM+kKjRQm89aN+Vd4QM
         6sXKgt/6g94AEroOBrqmcYAb0iG7UiMgr/Nqu/cpNG2olUTeLb2Wq6dLrqIBIktjGaHs
         YvUzimsaa2nixZ6XZ5khXsyMo4XplkPb4z9J2LC1VpbHrftzSyNGH8YxKJCe1TBAnqqR
         HpXAwleAVW+nVdBfCz5/cgqEi6yh4cMGLXHJxfgKQs8xxg5cMxbdlmPEY+BuiXjIJLOa
         7FmjOOohT6SW+qrumwYf7RPs5GMWSiQNjvMtKD1EsNgJfTy63xCzNIC1HoSK6jNaJG7O
         iiXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681007976;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5SRgC3jGGlWIY6qAHO8PwT5bgTIGqve7AyJ3w1OyImk=;
        b=4Va/ZKNjF4OblRzhohr9AVzv4do57IqxdL6jTZHBEMlnEUM8QQmOxF07Htf8MyJ7yf
         gaZk6vYrySGfe74qhpnuJYWQB8mG4XgnkJVryvLWdtj6/qslTEiDvSl085wT+J1ra7qq
         uhZinJAePq7LJcR9VFkRgnQlV6tVE+nkZAMwnrVluBBNb355AOe82M3O8xjkedbpwcRo
         8L9NiIGgGoGHsLVE692J/7PR8rQbZHh96+cb6L/EjO2NBCwcTfw7Cb9xe8jtuLgK+Ydu
         73Q2T7UcPg1kvEBqLz4TY5W2Qt86aYO1PPfFXuHKPpr6kQVr7lOwjkgg2CBqKiKuS9xy
         WQYw==
X-Gm-Message-State: AAQBX9cP7kkyy03jtBtNkPryqonR9DtxVKlGelNxkt39Wa+3shu5wDbH
	sJEGjaecXoEWYFe0yYxwBup0iJsSQUE67w==
X-Google-Smtp-Source: AKy350YQT5pVZQG79npS50upq1sJ40jfTfRJwohXqy6tCexTbolagNKZ62YdKjpucs7Nu6scXDNY0w==
X-Received: by 2002:a17:90b:38c7:b0:240:b21d:41e0 with SMTP id nn7-20020a17090b38c700b00240b21d41e0mr8502685pjb.34.1681007976151;
        Sat, 08 Apr 2023 19:39:36 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::26f8])
        by smtp.gmail.com with ESMTPSA id bi2-20020a170902bf0200b001a19d4592e1sm2250178plb.282.2023.04.08.19.39.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Apr 2023 19:39:35 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] musl: Update to latest trunk
Date: Sat,  8 Apr 2023 19:39:33 -0700
Message-Id: <20230409023933.429449-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 09 Apr 2023 02:39:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179834

Brings these changes

* 1d5750b9 fix swprintf handling of nul character in output
* 0e523480 in printf, use ferror macro rather than directly inspecting flags bit
* 868c9643 remove wide printf dependency on ugly hack in vfprintf
* 3a051769 fix (normal, narrow) printf erroneously processing %n after output errors
* 0440ed69 fix wide printf continuation after output or encoding errors
* d055e6a4 fix wide printf forms ignoring width for %lc format specifier
* b6811019 poll: fix misuse of timespec type on 32-bit archs without poll syscall
* 8949da7a select: fix 64-bit timeout truncation on pre-time64 kernels
* 3281047c dup3: don't set FD_CLOEXEC on failure on kernels without dup3 syscall
* c99b7daa fix dup3 ignoring all flags but O_CLOEXEC on archs with SYS_dup2 syscall
* fb7fb5e4 fix pipe2 silently ignoring unknown flags on old kernels
* b1dfb734 getservbyport_r: fix wrong result if getnameinfo fails with EAI_OVERFLOW
* 595416b1 getservbyport_r: fix out-of-bounds buffer read
* 1a708ece getifaddrs: fix UB via taking address of null pointer union dereference
* c499c108 accept4: don't fall back to accept if we got unknown flags
* 523d9b96 fix potential read past end of buffer in getnameinfo host name lookup
* d0b7f976 dns: fix workaround for systems defaulting to ipv6-only sockets
* bec42ef3 dns: handle early eof in tcp fallback
* 9b132e55 prevent CNAME/PTR parsing from reading data past the response end
* 12590c8b fix out-of-bounds reads in __dns_parse
* bc695a5a fix incorrect unit for CPU_SETSIZE macro

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/musl/musl_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/musl_git.bb
index 39f6dd8219..531f337e82 100644
--- a/meta/recipes-core/musl/musl_git.bb
+++ b/meta/recipes-core/musl/musl_git.bb
@@ -4,7 +4,7 @@
 require musl.inc
 inherit linuxloader
 
-SRCREV = "7d756e1c04de6eb3f2b3d3e1141a218bb329fcfb"
+SRCREV = "1d5750b95c06913a1f18a995481276d698d20fae"
 
 BASEVER = "1.2.3"
 
-- 
2.40.0


