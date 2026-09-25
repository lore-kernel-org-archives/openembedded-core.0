Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA8FBC9830D
	for <webhook@archiver.kernel.org>; Fri, 25 Sep 2026 05:35:57 +0000 (UTC)
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13407.1790300428697703401
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Sep 2026 18:40:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=IXqtuhU0;
 spf=pass (domain: gmail.com, ip: 209.85.160.179, mailfrom: triet.hoang.dev@gmail.com)
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-52ff0eea420so3856141cf.0
        for <openembedded-core@lists.openembedded.org>; Thu, 24 Sep 2026 18:40:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790300427; x=1790905227; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tXL3QbIrVuobDoqqkh2jyyixwI6hKSc3WVtHUskb38U=;
        b=IXqtuhU0lNkXdwsE2i8yT4KUkQcauWxTR2BFqx0gk/wGxO2RuUaEhFDqSClqFFRs/V
         YL166c2yuSnneVKcoh5hQJo7qlPhO8AvaomioulcV7Qv2mmVFm3LOaniZDGsbPWVbsao
         gJgZorpbV7ZK4SqedmcbGi8Wq3us+/ErZUX3tbEmjP3gjPOnr9lsx+sNHlysMhs7vTpM
         OOWzG/16u2mHA20MAWxrej9gzxVmHeED2W7yoj7vbNlYYv5I65JWS3SEapJCapn12APZ
         iCRBrIO1vm5ZxaxT+Rk/7nHeXLF6ifZm6staSjk2yYYKYjFxrRf86ogSapYHuoCY9QNN
         Ytfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790300427; x=1790905227;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tXL3QbIrVuobDoqqkh2jyyixwI6hKSc3WVtHUskb38U=;
        b=P8QoTlCVg8tYNHx/vkonaeFExpOnTsOyAJ/6yrInGGvhJCPQZ989NEHQjS5SDvDT6Y
         cv+2ElisqI73iOOYpHxlyYk6FNU3s8sXORkOoCH033Ti/AUZdSJskw4xHmSDs2VI3We0
         i4xQqSW+1Et8oS6QoySWarMUI/Glv7kuoXNRf1A2QVyXsnONRLJUTaTnn0u+pK3r7GJO
         /R9vHvwt11USEKhd6so2ppvLRwg4fzxmgjOHEUjL2DdBaqMU/K5Sn5L5pMMhXWlYYz62
         STwuo+uSnB0TyPGEbZ+51oZF9nCcz0x9vgIFNI11ojRg1hR/DDm4RiWZQbVsjIOqzzws
         A5cQ==
X-Gm-Message-State: AFuF++m1MApdvAaasO42mZfKP2cUCJoj3SH0PJl24BBet7ff32cXX1+l
	BjmvHf8pUbjWyIoDLugN9ZP0XVYS7hl7MJTCv68l1CSnYHPIXh/x9sKbig4A
X-Gm-Gg: AYBFou2NibeI8vuXXsyPr8rRVGXzroxApnv5bROr4SP/10RSoeLrZSXc5TZAOWQ6BTP
	dIMFYTCa5AhQpSYzL6gw8GOZusl2la9ynhGg48E326NJr2wwtADR4VlolyLGktwzBXSf4GGs2yT
	RWjojdnoI5QfyKMibJ+yk1kktjci6kFx6zejd2yTjQ1UwBkT0HesYge49iHQeTccELcYQpQMHDo
	Q0cMtofnk2jnvba6sSLs7avlTNMIrhDvmhqdq+MnbGaiHmoz7P93PmSdNAP9VW2XdXhE3lddKsj
	IthgGab0MGrtJu8Y1ktyYHPptYho7RYV+6j4uRg5Nk4fTCvkk8XVVux7zZIM5X9ba6fv7J2+/7G
	Ea877WvoMjF9QjsWByZogShicjjhKj/8CxQ0p7Phg8Yc0/fIyLM5O6ZR48GULSvCHga4Fk5sqIv
	j/SVIm2RynN6KPP+/Uq5qLfoGBPQ/M4cwJLDaf1qBbdzhNFAJWhKhrVUmOrVsSG2FVYVbTDg4wF
	XygT7ON8KxuUrGIsisLPQ==
X-Received: by 2002:a05:6a00:ae10:b0:87e:dbe6:8966 with SMTP id d2e1a72fcca58-87edbe6905cmr1697722b3a.12.1790300114912;
        Thu, 24 Sep 2026 18:35:14 -0700 (PDT)
Received: from DL2XHKPB4.dl.net ([103.63.104.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87feba8003bsm319803b3a.58.2026.09.24.18.35.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 18:35:14 -0700 (PDT)
From: Triet Hoang <triet.hoang.dev@gmail.com>
To: sdoshi@mvista.com
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core][scarthgap][PATCH 5/6] libxml2: Security Fix for CVE-2026-86141
Date: Fri, 25 Sep 2026 08:34:59 +0700
Message-ID: <20260925013459.3957614-1-triet.hoang.dev@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260910200329.842463-5-sdoshi@mvista.com>
References: <20260910200329.842463-5-sdoshi@mvista.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Sep 2026 05:35:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246597

On Fri, 11 Sep 2026 01:33:28 +0530 Siddharth Doshi wrote:

> +---
> + xmlregexp.c | 8 ++++++--
> + 1 file changed, 6 insertions(+), 2 deletions(-)
> +
> +diff --git a/xmlregexp.c b/xmlregexp.c
> +index 5e15311..1c1b25e 100644
> +--- a/xmlregexp.c
> ++++ b/xmlregexp.c
> +@@ -702,8 +702,12 @@ xmlRegNewParserCtxt(const xmlChar *string) {
> + 	return(NULL);
> +     memset(ret, 0, sizeof(xmlRegParserCtxt));
> +     if (string != NULL)
> +-	ret->string = xmlStrdup(string);
> +-	ret->len = strlen((const char *) ret->string);
> ++         ret->string = xmlStrdup(string);
> ++         if (ret->string == NULL) {
> ++             xmlFree(ret);
> ++             return(NULL);
> ++         }
> ++        ret->len = strlen((const char *) ret->string);
> +     ret->cur = ret->string;
> +     ret->neg = 0;
> +     ret->negs = 0;
> +-- 

The hunk keeps the brace-less if (string != NULL), so only ret->string = xmlStrdup(string);
is conditional. The NULL check below it always runs, and xmlRegNewParserCtxt() returns NULL
for every caller that passes string == NULL.

I think we need to backport [1] first before applying this patch.

[1] https://gitlab.gnome.org/GNOME/libxml2/-/commit/1a354d5b3072feaf64b5f6ea4b35e1bef35b7f65

BR,
Triet Hoang

