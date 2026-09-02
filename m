Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF560C61DD6
	for <webhook@archiver.kernel.org>; Wed,  2 Sep 2026 05:26:57 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5537.1788326812505372943
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Sep 2026 22:26:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=jESiAlW7;
 spf=pass (domain: smile.fr, ip: 209.85.128.53, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-49b8e527d63so6489905e9.2
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Sep 2026 22:26:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1788326811; x=1788931611; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=xoTWlAuWMvxa2V6tGFd7aDl/JLcVECse5mxcVtTAh2o=;
        b=jESiAlW7z+eXQxqnk+TSMj9hMAnbTasSaHK6aky3GJLGyWaSO/8yb0ZiCA2PjKm6Eq
         isd4Z/CQtHaIo34EJ8mH8a4f2TaZUVLhMbeECAIEcO/NH8kG8DXWrPGYbpaHdPPReLRw
         ngDDtpZMv1SmDx5/bQu0R8xhmHqykwgPYy2fA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788326811; x=1788931611;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=xoTWlAuWMvxa2V6tGFd7aDl/JLcVECse5mxcVtTAh2o=;
        b=S0Ct+/G2M2V/ACUUS05kAMdUEm+70iOfpkwBscwSkmVBB8756iYs4UYTyTv6BUMONL
         DPfFhHRf0vaEVv58uJikIAnjYsRrD7XUhRzVTu7ttijH5tmRvvEc5xZswQ3vHRfmR+mK
         PHuBVUNjPECWtm+i7iFEX1I/F7/eYVa2M4qOy93KW9Nomra2LAHMcWXBiYsmPyhTBTXh
         nvL47sBsyUcfZwH2NUFg4YhgAmGlgElWVyUlFV4xkptQ22jzaO+qjgZ7O6CbMMc4Gjoy
         CrLAZEw1Kdnj8A+xQ9sKGjawfIF31xIj/j+oksw0el4BTvKtol61b8pak08jr4EI2Q5H
         pacg==
X-Gm-Message-State: AFuF++lJR/myO8uMwVkoDNeE8CzzDjG0vOg8rsOne+IFSxR/Ms3l+shT
	CfmZG8REKLmHnZcOtPZB6G4ec5v1h8G1w0pnIXflTaowa/0/uFjKbSDwxufcuFU4tcw0XmWk/Ly
	X9TC1ogQ=
X-Gm-Gg: AR+sD10ERYYcE0ba19WrdLh0kCVtI8n1wW7jUacxl4rGU2L1LXyEUcBDJDqUUAu2xcn
	CJcHV9L7oKBtxZo0giRai5l6dKTreS9WE5F4PizcgTBbkwXBd88+KgOxPV0K0DNn8Oe1amvGmCJ
	bfM/br9zFBCqXvR1zPdTf8YfbYnWF3kgiktLr1TXXT2Rp21yx/58xiw8cH1WlaYjAFa4KoW0+FJ
	D9bc20bqf4akSTaPBuLT8y6JRw6MjzGK+XzmXnqXZzf1m/2zc1cFe23ostfUos82Xc25apIVK1r
	UL0UKFQjJ39sJWPJHKML625Xbz6Jg0NvKV14o4Y0iUsznOQSH7MkT9UhZVyZz5bP2y4ZONwjaWq
	1J7xzC+eTiLtWh06vvCg/C1bhc57NegEbducrEh9SOxcsLt0IJ1vCP9XQEp2iR4DFNCN93DEBl2
	f61YmP7+p44zBPdWewuwxXiDvxE5PvBS2Zzu7OohJXQmSJ2A8rX1JKkmBzgNpwH27nHo99Ar23Z
	+1dMJOnPZz7kkCf+w==
X-Received: by 2002:a05:600c:37ca:b0:49c:cf18:494e with SMTP id 5b1f17b1804b1-49ce5819a2fmr40009955e9.12.1788326810734;
        Tue, 01 Sep 2026 22:26:50 -0700 (PDT)
Received: from FRSMI25-LASER.wifi-gare.sncf.com ([148.169.40.19])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce4780f0dsm37084695e9.12.2026.09.01.22.26.49
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 22:26:50 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 10/27] gnutls: set status for CVE-2026-1584
Date: Wed,  2 Sep 2026 07:25:27 +0200
Message-ID: <a04716f2209d4d374d7e42388776917fb4179adc.1788326578.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1788326578.git.yoann.congal@smile.fr>
References: <cover.1788326578.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Sep 2026 05:26:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244861

From: Peter Marko <peter.marko@siemens.com>

Set status per [1].

[1] https://security-tracker.debian.org/tracker/CVE-2026-1584

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-support/gnutls/gnutls_3.8.4.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-support/gnutls/gnutls_3.8.4.bb b/meta/recipes-support/gnutls/gnutls_3.8.4.bb
index 676c5c6f940..0eabc517ce5 100644
--- a/meta/recipes-support/gnutls/gnutls_3.8.4.bb
+++ b/meta/recipes-support/gnutls/gnutls_3.8.4.bb
@@ -129,3 +129,4 @@ pkg_postinst_ontarget:${PN}-fips () {
 }
 
 CVE_STATUS[CVE-2026-3832] = "fixed-version: vulnerable multi-record OCSP response handling was introduced in 3.8.8 and is not present in 3.8.4"
+CVE_STATUS[CVE-2026-1584] = "fixed-version: vulnerable code not present, introduced with 3.8.11"

