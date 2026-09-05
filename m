Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8111C79FA7
	for <webhook@archiver.kernel.org>; Sat,  5 Sep 2026 20:45:24 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2474.1788641112943504575
 for <openembedded-core@lists.openembedded.org>;
 Sat, 05 Sep 2026 13:45:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=HL0YZl7G;
 spf=pass (domain: smile.fr, ip: 209.85.221.43, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-485843aeab8so2346526f8f.1
        for <openembedded-core@lists.openembedded.org>; Sat, 05 Sep 2026 13:45:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1788641111; x=1789245911; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=FqONaJBdzg15J+Mpp/68+AN2zDtGIVVL5VvvS2h9s1w=;
        b=HL0YZl7GiQILxAwnX7vek3I3mnhbKCVgV7FiMw+/PZYq98TJHibyswSLQPGuSHF6Ff
         MUGa5VmLfdioR2wcFaCGJ3m+X7rB4NGFhVkpKsu9+GAFKrNG3M1KV9HA2tA00IiRB/zT
         qIkpVY33RnmcgaApVO2vC43H5pr/zoyA1YNkI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788641111; x=1789245911;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=FqONaJBdzg15J+Mpp/68+AN2zDtGIVVL5VvvS2h9s1w=;
        b=CGo5puxVGY7wMXQ2vM16epb7ChEFi841l/nfuMHp3fH2LIUez8xenUhm5SM8MPgD+o
         hhS2Kdn8nQcUd2TU0IKYw5GnFjCFxbhpc6XkA/AgxU0HtFOmNCfrVg4bX7+w3yp1Sc0A
         flVaiTt+pUXIOboOMVJwJMLj1mwDKlcCVtgew/4sxJZiv6vjhKm9CP3Gfn0jdJYbVoq2
         OYAuxi/ah40r4o+7Bj3xrmVA/hQ/pXbTnTaDSgZ2fwh4c8/T5e4t0y9Nkkuw7k9IufoQ
         sLa+9CDkZLjIeIjNG2/bG/58vlhkmmW4xQ0CRnnlkaLD7STEAGjMiFPw/YAhNVsFGXBK
         h+8g==
X-Gm-Message-State: AFuF++khbuLjdTH5vTtnSdTGBDfZVr9dypEuPQNbBdgHtJgy3EDfk8O1
	ZW1kCZ+FvXm2OdeYCqrQ9CrWrJ/DenAtOrl2ZFSUtTB5p53qspRMS7cedIqq3rg7hdV8R4RTtcN
	/Fa3jQR4=
X-Gm-Gg: AYBFou2AfpdRGONpj0FOFuhLCnDW8EAPtZayCMh31/jvZ5YwUuRsTO0GPTy9oMM8bKh
	99BUR7MK2MNyo9IWqIZLcTL6M4Z0aDtPdg4cxthwExyfY1cpwyYsCAtI/P0vjJEl715wJEWOYX+
	nmyaOmANmT6PvM/CrZEJcv9TzMG6RZfy0S2DBCf9DipIV+kSkvshNwKW5XmMlBuchMW6IOXxGFO
	5iSTNAkqaMDTE+0X0Lw7sjn96N8EbcpO1+iCXKMEuGzeO6ohwo8Ka54/33EBYR0/N60P54+n9bQ
	9LLceNZycyKSf5HtOyraslh4jJa4IgNAThwTa3qPROt/4sjsow6fmVaMF+6t4iRK7Mo+wGU8Yb1
	dYQhMz9h/g+jUFTZDrHk2wXHnAv2cdy/iNqI7IsNziz8w07O7KSwa9xR+z4evKTx8FW7clSscSq
	nGSCumjQwbzFeroP2y2YpqSDylnPEi3CNFky9Yb7EHUzYtfub9oUb8rYVYW7hjRmOhyIP4SHhlM
	Zd8l5wb6lhXtigUZeu1lV6xQNaKs0FnzFQT3QEWpS17ayuA48sESRanAjyCeUNoag==
X-Received: by 2002:a05:6000:605:b0:485:8b66:f5 with SMTP id ffacd0b85a97d-4858b660161mr23048423f8f.18.1788641111218;
        Sat, 05 Sep 2026 13:45:11 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa0048511f7ccf23d3ce.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:4851:1f7c:cf23:d3ce])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485885bfdf6sm17069098f8f.34.2026.09.05.13.45.10
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 13:45:10 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 02/40] expat: set CVE_STATUS for CVE-2026-72522
Date: Sat,  5 Sep 2026 22:44:03 +0200
Message-ID: <f76844064efd49938292c39d3b0203c23b8d6d31.1788629392.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1788629392.git.yoann.congal@smile.fr>
References: <cover.1788629392.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 05 Sep 2026 20:45:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245154

From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>

CVE-2026-72522 is an out-of-bounds read and infinite loop vulnerability in
Expat's *_toUtf16 functions caused by mis-classifying low surrogates as
high surrogates.

Our Yocto configuration is not affected by this vulnerability:
- Expat is compiled with EXPAT_CHAR_TYPE=char (8-bit character representation).
- Neither XML_UNICODE nor XML_UNICODE_WCHAR_T is defined.
- The vulnerable *_toUtf16 functions are only invoked when Expat's internal
  character type is 16-bit (ushort or wchar_t).
- In 8-bit mode, Expat handles conversion using *_toUtf8 functions even when
  parsing UTF-16 encoded XML inputs, rendering the vulnerable code path
  unreachable.

Reference:
[1] https://nvd.nist.gov/vuln/detail/CVE-2026-72522
[2] https://github.com/libexpat/libexpat/pull/1296/changes/8fbfb52fa88e040e8b0b7a9d39f260d6a9e8b6db

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
[YC: EXPAT_CHAR_TYPE=char is the default and we do not change it]
---
 meta/recipes-core/expat/expat_2.7.5.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-core/expat/expat_2.7.5.bb b/meta/recipes-core/expat/expat_2.7.5.bb
index 890ee5b7d34..da35b8f9ff5 100644
--- a/meta/recipes-core/expat/expat_2.7.5.bb
+++ b/meta/recipes-core/expat/expat_2.7.5.bb
@@ -57,3 +57,6 @@ do_install_ptest:class-target() {
 BBCLASSEXTEND += "native nativesdk"
 
 CVE_PRODUCT = "expat libexpat"
+
+CVE_STATUS[CVE-2026-72522] = "not-applicable-config: Needs Expat compiled with 16bit character support , Issue only affects firefox/Windows. \
+EXPAT_CHAR_TYPE:STRING=char is for Yocto builds"

