Return-Path: <fabien.thomas@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E66DC5DF88
	for <webhook@archiver.kernel.org>; Wed, 19 Aug 2026 15:57:51 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10323.1787155067757188962
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Aug 2026 08:57:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=hHkx4EIh;
 spf=pass (domain: smile.fr, ip: 209.85.128.50, mailfrom: fabien.thomas@smile.fr)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4921eed3fa2so11476075e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Aug 2026 08:57:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1787155066; x=1787759866; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=vIe6pZi3fS9IHz9dvVIs0CW4+PMenaxJD5QtqiYbTLA=;
        b=hHkx4EIh+UvWEVXwAuPlPlZ6IjMJ7Gr4f+OjTbbWg/dRHR2SeBER1jqWx+AS1A+ETG
         P9ksR4OPCzNN7tIWlyXJSFETAC7QbZVhBQsKwTWXldN5nEui4QzZQsG7lfetzXnCwTL3
         c6YGnq2ldtApGXXtFbQ1VD1c69SP071UpBreI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787155066; x=1787759866;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=vIe6pZi3fS9IHz9dvVIs0CW4+PMenaxJD5QtqiYbTLA=;
        b=dlsBkDgTpZu5hkBzvcYruDbhxtoXE91318wVQanZFls9vKCwoLO5xHumcXpDmW/ka6
         730NBBicSpooNVkE10mWHPm83mqNjT+TdSYC3PW086kO8eru2pck8ae45G9LOK/8lSkF
         xIDzZX1dMUi9fgpfWrV8wSsMEZp8vjIOBatVEoFgatHBJ9X4PYI7mwPyRRhqrwikPtLF
         uMRHVzJ7fgQKSiKXak6y4M2qigQT4e8tQpx+bUUHrjAgZkSEJa7B+c4RRYmwoxhq4qMQ
         LuOScjLzlpOvraiPRLCxWrl2Fb8v1RHTeGfSyIErea74PcwXutoq9FPYAnM09y5tydpu
         J0Cg==
X-Gm-Message-State: AOJu0Yw+kSPAK9/vdnEtlwAvBFeGbZAIfKbOyI1KomD8D2XMI0yOvbuq
	E4B5i0JsEkEhslVS6Bxhd4A9JjZNgAnF+/TxoZ7FNAb57/2BZ3L895bsAhN6QpE6jhQKis4D48J
	H6jNtgYY=
X-Gm-Gg: AR+sD137iwXZ0HpP2Q75QY56Wo+R/mvAT1MFOvbIoCR25E+I9EjKpKkREnnZ17hoR30
	8waO3hxFWAEuO00iCBnGl5OwVyH5T9U8B+sYAK3ecmLGXUsZijCbuLFhwWD74Zvxg7hsYorh5RI
	EbSEffc8V8SUZV/Bbd6QTbgzlrGSnL+IgEs8gbRTc813hgZ+8VPyeJJSu5ermSFTtaJH8pmr1vV
	NiZZjbk506pCdgcQVFuOU3xatI6Mc/BEgLR/CQXLKq6VGbsB9juHjMIytTRW+bJrGgzi4FvP39/
	mPx5oocPP5d/3F2vQc+R7nVzVdcY4Cb+oX22qJ19EuexDy38GUD7DCf5Bc+vpqxBIjvAtdSkcWY
	S5Ak03Msa1YqprczW0Hrd/MwHEyd08YC7AXauLjhtZrMpc+hXW5/DOg/5JU7bdjPTy0BQ9WI8qb
	Tt4hdQJilEuzzTKGvQ2gfc/EK02HEgIRh+hI+ORAccBDt/0SNcDxpu8BN8fc+qXxk7r9alyFZ/3
	K0JAtg+QX9NAf10TYNZzr4qw61e2CqvMRUKoGxxl6DYwmXdiZQkArBZ2LMhYdvZqmv0aNWGsKvx
	UUQdxiy/a4TKBbVRAytRx2lLs02u1jtxPbg5LqLr
X-Received: by 2002:a05:600c:468c:b0:495:6a50:3fb8 with SMTP id 5b1f17b1804b1-499aa180578mr93149625e9.1.1787155066057;
        Wed, 19 Aug 2026 08:57:46 -0700 (PDT)
Received: from FRSMI25-GIGUE (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482b14d05a6sm7215698f8f.35.2026.08.19.08.57.45
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 08:57:45 -0700 (PDT)
From: Fabien Thomas <fabien.thomas@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 15/37] expat: fix CVE-2026-56407
Date: Wed, 19 Aug 2026 17:56:46 +0200
Message-ID: <594ad6e8edf8185dbed03a5346ef34e9a012b88f.1787154074.git.fabien.thomas@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1787154074.git.fabien.thomas@smile.fr>
References: <cover.1787154074.git.fabien.thomas@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Aug 2026 15:57:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243751

From: Deepak Rathore <deeratho@cisco.com>

This patch applies the upstream fix shown in [1] as referenced by [2].

[1] https://github.com/libexpat/libexpat/commit/30c2fc179ce5d2b1b1bae30bbe0dfddeac894e13
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-56407

(From OE-Core rev: 9e565187ad989856ed274feecb343744a4d0d290)

Signed-off-by: Deepak Rathore <deeratho@cisco.com>
Signed-off-by: Fabien Thomas <fabien.thomas@smile.fr>
---
 .../expat/expat/CVE-2026-56407.patch          | 41 +++++++++++++++++++
 meta/recipes-core/expat/expat_2.6.4.bb        |  1 +
 2 files changed, 42 insertions(+)
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-56407.patch

diff --git a/meta/recipes-core/expat/expat/CVE-2026-56407.patch b/meta/recipes-core/expat/expat/CVE-2026-56407.patch
new file mode 100644
index 00000000000..498f93d5b93
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-56407.patch
@@ -0,0 +1,41 @@
+From d1cd2bd7da8ed830e9432660616e9b4831df959a Mon Sep 17 00:00:00 2001
+From: netliomax25-code <netliomax25@gmail.com>
+Date: Tue, 2 Jun 2026 11:59:01 +0530
+Subject: [PATCH 12/17] cap entity textLen against signed integer overflow
+
+CVE: CVE-2026-56407
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/commit/30c2fc179ce5d2b1b1bae30bbe0dfddeac894e13]
+
+(cherry picked from commit 30c2fc179ce5d2b1b1bae30bbe0dfddeac894e13)
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
+---
+ expat/lib/xmlparse.c | 9 +++++++++
+ 1 file changed, 9 insertions(+)
+
+diff --git a/expat/lib/xmlparse.c b/expat/lib/xmlparse.c
+index 9f07b860..8439dc0e 100644
+--- a/expat/lib/xmlparse.c
++++ b/expat/lib/xmlparse.c
+@@ -5655,6 +5655,10 @@ doProlog(XML_Parser parser, const ENCODING *enc, const char *s, const char *end,
+             parser, enc, s + enc->minBytesPerChar, next - enc->minBytesPerChar,
+             XML_ACCOUNT_NONE);
+         if (parser->m_declEntity) {
++          /* Detect and prevent signed integer overflow */
++          if ((size_t)poolLength(&dtd->entityValuePool) > (size_t)INT_MAX) {
++            return XML_ERROR_NO_MEMORY;
++          }
+           parser->m_declEntity->textPtr = poolStart(&dtd->entityValuePool);
+           parser->m_declEntity->textLen
+               = (int)(poolLength(&dtd->entityValuePool));
+@@ -7076,6 +7080,11 @@ storeSelfEntityValue(XML_Parser parser, ENTITY *entity) {
+     return XML_ERROR_NO_MEMORY;
+   }
+ 
++  /* Detect and prevent signed integer overflow */
++  if ((size_t)poolLength(pool) > (size_t)INT_MAX) {
++    poolDiscard(pool);
++    return XML_ERROR_NO_MEMORY;
++  }
+   entity->textPtr = poolStart(pool);
+   entity->textLen = (int)(poolLength(pool));
+   poolFinish(pool);
diff --git a/meta/recipes-core/expat/expat_2.6.4.bb b/meta/recipes-core/expat/expat_2.6.4.bb
index fb36108eafa..2851c752977 100644
--- a/meta/recipes-core/expat/expat_2.6.4.bb
+++ b/meta/recipes-core/expat/expat_2.6.4.bb
@@ -72,6 +72,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/R_${VERSION_TAG}/expat-${PV}.tar.bz2  \
            file://CVE-2026-56406.patch;striplevel=2 \
            file://CVE-2026-56409.patch;striplevel=2 \
            file://CVE-2026-56411.patch;striplevel=2 \
+           file://CVE-2026-56407.patch;striplevel=2 \
            "
 
 GITHUB_BASE_URI = "https://github.com/libexpat/libexpat/releases/"

