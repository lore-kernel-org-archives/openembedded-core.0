Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com [209.85.221.67])
 by mx.groups.io with SMTP id smtpd.web10.20670.1599740599406231355
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Sep 2020 05:23:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=aTfz6CP8;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.67, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f67.google.com with SMTP id j2so6476481wrx.7
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Sep 2020 05:23:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=LwwKTRgeKiTHmphXvEAiAAtDqzyR0gDSnEVQGefK3LY=;
        b=aTfz6CP8gA6q0SWFDX8msX97WmLRH0mwe/iYHxcRr9OvR6+VoFg3N/SYWefbDAORRo
         n7Xp1am/ko9zYt3diZeJT4Ym8FOBqCuzoDsxSPOm9eq267l299nDuw0j9ixovpleUoXY
         ARTGgzAtlXkNJOp6L3FJVloOvhJUi2oUMyhm4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LwwKTRgeKiTHmphXvEAiAAtDqzyR0gDSnEVQGefK3LY=;
        b=YOBh1uT7L573H7TOPvcknoX8r/HrqGfwJTeZ9ay40rTZn1XTxzEEuuc0UBucT2xSp/
         ZVeRVQCywCuNqfbx/ujlr0DkrTZXwgRh/7Tokk50vkBWCm/k7VjfnQJUlGLQYfJwtL76
         qj20SzwK0ZgpRn3de87rZENcO2QIensm2fNz/AE170vxQGtl+oD0kFannfv0AoL1ltQP
         5hDE7vhDzGSUkbAAJKLwfWuEPJWr4azO3ICekmZ4ikh5zZ6Z/96tHlJ3GNhIGs8MQ+hC
         OqjGyzWzp6rV0cTLswguxh3iBsEpIUheV6ir6ogT/m7SYMzDPW6poJAP7Uj6VFKdgzIZ
         5OfA==
X-Gm-Message-State: AOAM53160iNg2wwzvCfZuQz/Pphu+S2jZrHOeuWtno/VImL2AB/HvF51
	PEkFMfdzVlM5UONtXu6AL9sNksO5ksD7Lg==
X-Google-Smtp-Source: ABdhPJz/AnNg894xiquo0mqS015O6TZezxXWhbtlFW3WSHEdR9Cp5gWtT9hcVq6yt/kr0W5TKaYBgg==
X-Received: by 2002:adf:f552:: with SMTP id j18mr9500136wrp.128.1599740597547;
        Thu, 10 Sep 2020 05:23:17 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net (2.f.a.6.5.4.b.4.5.7.2.f.a.5.0.6.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:605a:f275:4b45:6af2])
        by smtp.gmail.com with ESMTPSA id v17sm8810794wrr.60.2020.09.10.05.23.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2020 05:23:17 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH][warrior 12/22] glibc: Update nativesdk locale relocation patch
Date: Thu, 10 Sep 2020 13:22:56 +0100
Message-Id: <20200910122306.2040194-12-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200910122306.2040194-1-richard.purdie@linuxfoundation.org>
References: <20200910122306.2040194-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The locale binary reported incorrect locale lists in relocated toolchains
as some path references were not relocated by this patch. Fix this missing
relocations so the locale binary correctly reports the locales.

(From OE-Core rev: f7a6a72880009380ae81bc7fc863921a26811c8c)

(From OE-Core rev: e4c4337e642f565e9988a4a2c50a995090d1f49e)

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...Make-relocatable-install-for-locales.patch | 34 +++++++++++++++++--
 1 file changed, 32 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/glibc/glibc/0005-nativesdk-glibc-Make-relocatable-install-for-locales.patch b/meta/recipes-core/glibc/glibc/0005-nativesdk-glibc-Make-relocatable-install-for-locales.patch
index 9f9f503a1e2..6e5085b9c90 100644
--- a/meta/recipes-core/glibc/glibc/0005-nativesdk-glibc-Make-relocatable-install-for-locales.patch
+++ b/meta/recipes-core/glibc/glibc/0005-nativesdk-glibc-Make-relocatable-install-for-locales.patch
@@ -65,6 +65,36 @@ index 7c1cc3eecb..53cb8bfc59 100644
  
  /* Load the locale data for CATEGORY from the file specified by *NAME.
     If *NAME is "", use environment variables as specified by POSIX, and
--- 
-2.20.1
+Index: git/locale/programs/locale.c
+===================================================================
+--- git.orig/locale/programs/locale.c
++++ git/locale/programs/locale.c
+@@ -632,6 +632,7 @@ nameentcmp (const void *a, const void *b
+ 		  ((const struct nameent *) b)->name);
+ }
+ 
++static char _write_archive_locales_path[4096] attribute_hidden __attribute__ ((section (".gccrelocprefix"))) = ARCHIVE_NAME;
+ 
+ static int
+ write_archive_locales (void **all_datap, char *linebuf)
+@@ -645,7 +646,7 @@ write_archive_locales (void **all_datap,
+   int fd, ret = 0;
+   uint32_t cnt;
+ 
+-  fd = open64 (ARCHIVE_NAME, O_RDONLY);
++  fd = open64 (_write_archive_locales_path, O_RDONLY);
+   if (fd < 0)
+     return 0;
+ 
+@@ -700,8 +701,8 @@ write_archive_locales (void **all_datap,
+ 	  if (cnt)
+ 	    putchar_unlocked ('\n');
+ 
+-	  printf ("locale: %-15.15s archive: " ARCHIVE_NAME "\n%s\n",
+-		  names[cnt].name, linebuf);
++	  printf ("locale: %-15.15s archive: %s\n%s\n",
++		  names[cnt].name, _write_archive_locales_path, linebuf);
+ 
+ 	  locrec = (struct locrecent *) (addr + names[cnt].locrec_offset);
+ 
 
-- 
2.25.1

