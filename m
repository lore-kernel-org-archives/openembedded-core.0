Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web09.11976.1631883568232159610
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Sep 2021 05:59:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=lTRf8iKH;
 spf=pass (domain: gmail.com, ip: 209.85.221.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f50.google.com with SMTP id g16so15042148wrb.3
        for <openembedded-core@lists.openembedded.org>; Fri, 17 Sep 2021 05:59:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=XaV6aGr5YoaP+KlSqG31nMvT+RQXnCS70JkfzIy5UKw=;
        b=lTRf8iKH25DdkcPKfjv0IvpImP6HoG2lUoHNs+6ujrhD5miPqKNSaqqPfDHbizNvAw
         AySLVs2nbuwlDT+iAQlv44LcfA9T9gLc7KESu3kdrTmYcWHuC8Lu+7vDfvy3+UMZPKtL
         ldrojJ8F488/6c3LubVQyRdXXHaYB6lAC/0rNq1P0JxbYLMe033wnsdK5mpDAyn6bYtS
         0ELtm+WVfndTfqpF6PBf5YKRvU0bPE5mSGxgUgyFL04res4uKwWnX1dgyiVP2n8pn2Tw
         W+ELy3/wqbdvviSAAQm/QYC0ob3RP2ekmSnc3jjW428Rakh3oDVF8u0YvhNuIosPZYs9
         jAZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XaV6aGr5YoaP+KlSqG31nMvT+RQXnCS70JkfzIy5UKw=;
        b=aZd+q5HeSYszA/V9bPUk+h+mONX1SRaJXYeg8AJDHjZI7fy/2ll3WUo17gFxQujpUi
         tqJSP8n7TvXKTXxfg0XgReNtyLrShQgQonhh/Zl41mQXmcHZ9oZFCQx5ZfbM+OfUZTQy
         M4BkF6QDjxkXg9JSgeKsndZhR5ggl8ArtKtupqYu2+TWmOCZunP6jbHZnGACoNrpm3YC
         Ly73GwdbdIbDDf2iiG3CJxphzFXZYOw9atTc/xOoNEuDrvdKBkqGEKf5FHNTob0BEkPa
         25yMWAvBWCI1JIs/gkc/1DW62z8XoPqWl9vDlBdWThYhfMY8HXqsj3AABlhHLIb0aOlD
         aOgg==
X-Gm-Message-State: AOAM532VArG+789ZZIU+zP1Rl+GIBmhdjt4elY4tv9iLXNtxKlANjAWs
	hEKR3CbpuBrMoHiZ9Hur2a11K5FGDlw=
X-Google-Smtp-Source: ABdhPJwF0wGdAWAgA/lLeTyX2A56Arvjowq21ZM0FewTQIPIHmC9PQRGbCL7TNzYes4D931JEtqt4g==
X-Received: by 2002:adf:dd01:: with SMTP id a1mr11910263wrm.132.1631883566798;
        Fri, 17 Sep 2021 05:59:26 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id j21sm6929041wmj.40.2021.09.17.05.59.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Sep 2021 05:59:26 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 4/4] cpan-base.bbclass: use raw string for regexp
Date: Fri, 17 Sep 2021 14:59:22 +0200
Message-Id: <20210917125922.2435721-4-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210917125922.2435721-1-alex@linutronix.de>
References: <20210917125922.2435721-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This eliminates a deprecation warning and a future error as stipulated by
https://docs.python.org/3/library/re.html

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/classes/cpan-base.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/cpan-base.bbclass b/meta/classes/cpan-base.bbclass
index 9758065bfcb..93d11e1bee4 100644
--- a/meta/classes/cpan-base.bbclass
+++ b/meta/classes/cpan-base.bbclass
@@ -20,7 +20,7 @@ PERLLIBDIRS:class-native = "${libdir}/perl5"
 def cpan_upstream_check_pattern(d):
     for x in (d.getVar('SRC_URI') or '').split(' '):
         if x.startswith("https://cpan.metacpan.org"):
-            _pattern = x.split('/')[-1].replace(d.getVar('PV'), '(?P<pver>\d+.\d+)')
+            _pattern = x.split('/')[-1].replace(d.getVar('PV'), r'(?P<pver>\d+.\d+)')
             return _pattern
     return ''
 
-- 
2.20.1

