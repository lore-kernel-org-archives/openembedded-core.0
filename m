Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A8C6C982EA
	for <webhook@archiver.kernel.org>; Wed, 23 Sep 2026 09:12:26 +0000 (UTC)
Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2845.1790154743754618547
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Sep 2026 02:12:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=DJO0MbVN;
 spf=pass (domain: smile.fr, ip: 74.125.225.141, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49b965f447cso4941645e9.3
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Sep 2026 02:12:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1790154742; x=1790759542; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=gO6T6To7ScCHifdr+P3FY9+1kOCOBdbzf0CsbNLJv/4=;
        b=DJO0MbVNaW6S8f5WD+bDhiDNOQnw6b82bOVqaev/7N7n7DSgZPCu8ihYjKe780kRI/
         43wXYdo5kP28R2opR48XNGRR6sV0fCcyRmi3DyzlpWhArl3S7/lDaP0N6T/lZ0q5nPG6
         YjkTcB8SCfORCn65BkZN89flObRSBPOTZuaPg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790154742; x=1790759542;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=gO6T6To7ScCHifdr+P3FY9+1kOCOBdbzf0CsbNLJv/4=;
        b=tDyHtOXHTKQOBJ/xrKMDJyjhdxB/ky8jkBJ9h1owQWdaJV870sCGMMuf2j0QWLaMuJ
         XMHjnYK3nSGvvurf9UI+qUiODLzClbKbKC/wxKXzUBYT2WIK66MM//3NRc6hn2aW/U9s
         LCgWMa4pWG9U+v4U45mUMo/c7Lu3aOxpesoTZvKpdIHFELtEj9jrxIPGKGaBNAKxVXq2
         PuCvarVWh5BCBKO1oc+S3GeBuRzaLJn0+9lxQOAm4ROijUJWlcR+C4HlX8n65MzzWu9j
         S/m2dsbqLJYHU/zEW/635S9VPtwzdNe5x0msL6ZFdrXFHN469xUcTrUbKuO28xNTGLBx
         OzpQ==
X-Gm-Message-State: AFuF++nY61epAaY4zNHsGuT/oRQKM9DI1ZZMKeKOUce1fsHsV8+1kzT+
	G/gjloY4eFdO4ytxmhl9Yn7S3Ym9G8SCw9i8Ev+DMBAT/hh9NF7M6FY1ZjaUmpBP2NZ3raJYFAQ
	Z6HLJ1D8=
X-Gm-Gg: AYBFou0GLBUG8rlI2ofY9MCpQusGX7cYMCgZV8mmYMwcVJ67BbOE/NpwtfRufBpXHPw
	Mp49G6kDMuYmqb11szI/BOxAoAaiWG3yef+3w9Lppp5DUKNSbgux8Rfr7CDMu1FR9BFuAiTKb9D
	suU1KwbRopWZ7hkdoLcBV2yga6+oJf2Kw0a9DMLWeRdOZuWiOKt0C4ZV7fngwS9SQePbJWVD/mg
	QgO2dAnicDBeYZqy31AuNdazLOUhnPHMIHCdvmiMZLl3gyOxCxVKJ26lgnvLefidwNNt3z7NdIW
	PTIOp3OnjbMX5tHRrd63jD5WJ6xAEuVnFJhgVcM3JgVpczpmDLDKQRUx2gc8pJRPp/k3hqoeaAD
	SCumTuCCm8ogqZfApUXRvlQREJFIDYTIv/oRctHcSkiTf+eZYJFm6wOjkpHhHVlHWOAEUdYozdJ
	VoN70mobIm+6NxECm9r3Jjf/x03EW0KWZEPQ6QMgUGHzsMJY6t99GK6rpABHjLg3H+/AKpIggFi
	YSaQ9PBGvr97gvJ1inhobqhFCpRJZlyOPNL3HiaPULXO5kS8tzDkGUqRrXseooinjlTWLGs
X-Received: by 2002:a05:600c:6091:b0:49d:39:90ba with SMTP id 5b1f17b1804b1-49fdee0bb6fmr25209965e9.3.1790154742000;
        Wed, 23 Sep 2026 02:12:22 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a02-8440-b519-f416-8bed-8817-19fd-ccf7.rev.sfr.net. [2a02:8440:b519:f416:8bed:8817:19fd:ccf7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe2730da9sm14251525e9.4.2026.09.23.02.12.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 02:12:21 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 47/48] curl: set CVE_STATUS for CVE-2026-82209
Date: Wed, 23 Sep 2026 11:10:49 +0200
Message-ID: <9468a21bb23307f8d1b5cb35bf9410fdd34b10c3.1790154074.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1790154074.git.yoann.congal@smile.fr>
References: <cover.1790154074.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Sep 2026 09:12:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246509

From: Siddharth Doshi <sdoshi@mvista.com>

Analysis:
- The problem only exists when curl is built with libpsl support enabled.[1]
- The recipe is built with "--without-libpsl" option.
- Hence, ignoring the CVE for this recipe.

Reference:
[1] https://curl.se/docs/CVE-2026-82209.html

Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-support/curl/curl_8.7.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/curl/curl_8.7.1.bb b/meta/recipes-support/curl/curl_8.7.1.bb
index 905d0b47335..34bdd21b77b 100644
--- a/meta/recipes-support/curl/curl_8.7.1.bb
+++ b/meta/recipes-support/curl/curl_8.7.1.bb
@@ -60,7 +60,7 @@ CVE_STATUS[CVE-2025-5025] = "${@bb.utils.contains('PACKAGECONFIG', 'openssl', 'n
 CVE_STATUS[CVE-2025-10966] = "${@bb.utils.contains('PACKAGECONFIG', 'openssl', 'not-applicable-config: applicable only with wolfssl','unpatched',d)}"
 CVE_STATUS[CVE-2026-10536] = "${@bb.utils.contains('PACKAGECONFIG', 'nghttp2', 'unpatched', 'not-applicable-config: applicable only with HTTP/2', d)}"
 CVE_STATUS[CVE-2026-8458] = "${@bb.utils.contains('PACKAGECONFIG', 'krb5 negotiate-auth', 'unpatched', 'not-applicable-config: applicable only with GSS-API-backed Negotiate authentication', d)}"
-
+CVE_STATUS[CVE-2026-82209] = "not-applicable-config: public suffix list support is disabled by the recipe with --without-libpsl"
 
 inherit autotools pkgconfig binconfig multilib_header ptest
 

