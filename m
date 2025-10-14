Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D779CCD194
	for <webhook@archiver.kernel.org>; Tue, 14 Oct 2025 18:03:58 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web10.2683.1760464410635552627
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Oct 2025 10:53:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HxDzNY0q;
 spf=pass (domain: gmail.com, ip: 209.85.214.176, mailfrom: phanirajkiran.a@gmail.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-27eceb38eb1so65223385ad.3
        for <openembedded-core@lists.openembedded.org>; Tue, 14 Oct 2025 10:53:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760464410; x=1761069210; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vqsMq5nDEkLZWnZMvGe8oKRybZknDQj1DEtLCouN6xQ=;
        b=HxDzNY0qBMjEaM3BLxJCYp+9dANfKL7uakah7qry9eNVnUfrickBpN7QXojnIdCZoF
         OdgChg63C7rt2cp8qnnhPHVvj8pCBt+vxibqt7Zwu7fDXQUAT4dIitt1X9TDz9vvHZUt
         sWYJUc58QucN88tbegSxOo2KwEHDuBWOVQaURR/RVQmGRyBeHMDbV9zsEOOeUW40IhY4
         TOlC9DSJMmmy0fk5NvS9UlLjAe6kW/i0/q5JPrCTRecM3CB3mZDJLAdlmyhrDcm9TwqM
         bXbdik+tft6MDpqaJXKUlw9jpI66TZEbcxkyY52NM1uiqfgbN0jRg4i8/u2MCKWCL5Xu
         eF4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760464410; x=1761069210;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vqsMq5nDEkLZWnZMvGe8oKRybZknDQj1DEtLCouN6xQ=;
        b=scdKX/dDQ5iHwLmIWG2Kz/XLRORTevaM4wF8mizxbvV4YWM5u7dMLrO4tZGtDoCq8F
         UEEhIrSgxyTvYnzrAJb584nPI0/qepg6WYFGa2s7wpPySK9t7fnfv8lR8dWWApoaeEbq
         F4+v5U1zRVGj4zUjwxK3Ycvbz4BnUFsJk05JdTQ9MJZuazp7Bf9I0MRtJvv0pTGdJz8d
         7KgvIRpY1BixT5UxhXpONm1m1uds/ZNl9AwvPmzQ11ZSXxJoZOpxZDfayO0WDevG3own
         pxOcsWXOPYgGpb/0tLE1VTC6D3sM2iicJiE4/qnBPj/epP3WFdfmAtYyYUXl4awbdIFo
         Wd8A==
X-Gm-Message-State: AOJu0YyPjW9GiBQxlKVbJvIT65sPRwocth02GMHz4D2EGz8KXK/lsUi/
	ZyCebEx5ifr8VH+9x3V8ollDldqMaD7vMvzfNVjJpHrvQMGpRj8GK4ISm5uEhg==
X-Gm-Gg: ASbGncu4lt6LXcFpylMYJXqzKzwSB7BZQp+xajX7k4aIp9eV5Y4G6+CMrgqEhqFA7SK
	xF8H8ACUt3Gje5n5K0PHQfos6U0JTSBctTELfjsUHpIbh7osNy/NcMwNHFAHdRsZc41w15BJXru
	Oim/cy9AYzgXsRANR2Sw1BxJPJV7vh0dbb9d3Cw1KVSlowQZAnjOjool1hwVjzjB8fIceK3aZYe
	VO2hRdvKj7G1ETL67hBMxNMILI5pg5BDUOm9lk9XYYcV6E1IAY97aaktRmFXY7THjY9MczVVwrx
	MYHWV5kBxhJBR2ngwDHefxVYwGrbdlzNQvgj/Voen1olADLEB2ELpI2K0RTR+BVPNzaH9xvCs/r
	mCQAn/+XjM5sI3ssL/ghL1ev1C5u1swQsEjv0GncCNfBYyOjRhk48
X-Google-Smtp-Source: AGHT+IF1uuyahOZzCzaesPUcX1bkmulMaRDQl3epdhmMCtpP8XKT43b813FLpPEmFsNjo+njRl7btw==
X-Received: by 2002:a17:903:1b44:b0:279:a5bb:54e2 with SMTP id d9443c01a7336-29027379a7dmr308195325ad.20.1760464409556;
        Tue, 14 Oct 2025 10:53:29 -0700 (PDT)
Received: from pop-os.. ([59.93.89.240])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034f93ea2sm169727135ad.126.2025.10.14.10.53.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 10:53:29 -0700 (PDT)
From: Mallapuram Phani raj kiran <phanirajkiran.a@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Mallapuram Phani raj kiran <phanirajkiran.a@gmail.com>,
	Gunda Swetha <swetha12g@gmail.com>
Subject: [[openembedded-core,scarthgap] musl: backport fix for CVE-2025-26519 to LTS branches 2/2] [openembedded-core,scarthgap] musl: backport fix for CVE-2025-26519 to LTS branches
Date: Tue, 14 Oct 2025 23:23:11 +0530
Message-Id: <20251014175311.4547-2-phanirajkiran.a@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251014175311.4547-1-phanirajkiran.a@gmail.com>
References: <20251014175311.4547-1-phanirajkiran.a@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Oct 2025 18:03:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224848

Fixes [YOCTO #15932]

The musl libc code in LTS (Scarthgap) is missing
the fix addressing CVE-2025-26519.  This patch backports the upstream
changes (or applies the required fix) so that LTS builds include it.

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2025-26519

Upstream-Status:
[https://git.musl-libc.org/cgit/musl/commit/src/locale/iconv.c?id=e5adcd97b5196e29991b524237381a0202a60659]
[https://git.musl-libc.org/cgit/musl/commit/src/locale/iconv.c?id=c47ad25ea3b484e10326f933e927c0bc8cded3da]

(From OE-Core rev: 7af6b75221d5703ba5bf43c7cd9f1e7a2e0ed20b)

Signed-off-by: Mallapuram Phani raj kiran <phanirajkiran.a@gmail.com>
Signed-off-by: Gunda Swetha <swetha12g@gmail.com>

Reported-by: Cristian Morales Vega
---
 ...ackport-fix-for-CVE-2025-26519-to-LT.patch | 52 +++++++++++++++++++
 1 file changed, 52 insertions(+)
 create mode 100644 meta/recipes-core/musl/musl/0001-scarthgap-musl-backport-fix-for-CVE-2025-26519-to-LT.patch

diff --git a/meta/recipes-core/musl/musl/0001-scarthgap-musl-backport-fix-for-CVE-2025-26519-to-LT.patch b/meta/recipes-core/musl/musl/0001-scarthgap-musl-backport-fix-for-CVE-2025-26519-to-LT.patch
new file mode 100644
index 0000000000..e40e8af83a
--- /dev/null
+++ b/meta/recipes-core/musl/musl/0001-scarthgap-musl-backport-fix-for-CVE-2025-26519-to-LT.patch
@@ -0,0 +1,52 @@
+From ae865075dc7e1acd0cb7ee9417758c8e060800ed Mon Sep 17 00:00:00 2001
+From: Mallapuram Phani raj kiran <phanirajkiran.a@gmail.com>
+Date: Tue, 14 Oct 2025 20:36:36 +0530
+Subject: [kirkstone] musl: backport fix for CVE-2025-26519 to LTS
+ branches
+
+Fixes [YOCTO #15932]
+
+The musl libc code in LTS (kirkstone) is missing
+the fix addressing CVE-2025-26519.  This patch backports the upstream
+changes (or applies the required fix) so that LTS builds include it.
+
+Reference:
+https://nvd.nist.gov/vuln/detail/CVE-2025-26519
+
+(From OE-Core rev: 7af6b75221d5703ba5bf43c7cd9f1e7a2e0ed20b)
+
+Signed-off-by: Mallapuram Phani raj kiran <phanirajkiran.a@gmail.com>
+Signed-off-by: Gunda Swetha <swetha12g@gmail.com>
+
+Reported-by: Cristian Morales Vega
+---
+ src/locale/iconv.c | 6 +++++-
+ 1 file changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/src/locale/iconv.c b/src/locale/iconv.c
+index 3047c27b..0729465e 100644
+--- a/src/locale/iconv.c
++++ b/src/locale/iconv.c
+@@ -495,7 +495,7 @@ size_t iconv(iconv_t cd, char **restrict in, size_t *restrict inb, char **restri
+ 			if (c >= 93 || d >= 94) {
+ 				c += (0xa1-0x81);
+ 				d += 0xa1;
+-				if (c >= 93 || c>=0xc6-0x81 && d>0x52)
++				if (c > 0xc6-0x81 || c>=0xc6-0x81 && d>0x52)
+ 					goto ilseq;
+ 				if (d-'A'<26) d = d-'A';
+ 				else if (d-'a'<26) d = d-'a'+26;
+@@ -538,6 +538,10 @@ size_t iconv(iconv_t cd, char **restrict in, size_t *restrict inb, char **restri
+ 				if (*outb < k) goto toobig;
+ 				memcpy(*out, tmp, k);
+ 			} else k = wctomb_utf8(*out, c);
++			/* This failure condition should be unreachable, but
++			 * is included to prevent decoder bugs from translating
++			 * into advancement outside the output buffer range. */
++			if (k>4) goto ilseq;
+ 			*out += k;
+ 			*outb -= k;
+ 			break;
+-- 
+2.34.1
+
-- 
2.34.1


