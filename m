Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web12.18857.1593438518510957590
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Jun 2020 06:48:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=joBbLnjW;
 spf=pass (domain: burtonini.com, ip: 209.85.221.54, mailfrom: ross@burtonini.com)
Received: by mail-wr1-f54.google.com with SMTP id f18so8567790wrs.0
        for <openembedded-core@lists.openembedded.org>; Mon, 29 Jun 2020 06:48:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=FJ7dgzkNe6mfb1zq5CU3SAnSqwoKOqph3wzAF1/DyC0=;
        b=joBbLnjWfJH1yjuUN+ph5jSvB/Uqfy9kizjKtFTWNfox6smjUvWhBoLJdyB9f9k8dN
         7eIURdkS5JMMYQhCFaI/A2CzBRWtYWTomMyPBB/kqoD/XUrz6SMtR0IoSLLExTvErI9u
         bXDQ2m9882PtGTpLWejN9w0vvK1We/PtQREFiLVIyIIFVewFJTeV61PvtzQsDEVwsPU2
         bkMFa1NuESJuieW6jpLMtSA8hfv1vGDWBFlGZw1CaYROXiA83pJm8rtu3yUGL7MzGSo0
         ALmnxJDcaQL+G+4ymHYzZjIQntWMPU/NSiToVeXXhTloh1vI/8A/PIQNrV7t80R4rKS9
         XvqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FJ7dgzkNe6mfb1zq5CU3SAnSqwoKOqph3wzAF1/DyC0=;
        b=BkNtRzUOHyasOX6wgP1bM2x0lIsf927cE5HluDlUzg68in75sCh1HReBU8McSkUVqf
         K72sekgaC0s5M3apka08abonYzJ2ziOOoCEG0ZlhQ2viWtCscQNkDoLnADD9+ZLGm85A
         RD/SZbFRWh42aYu6M2dsAmqFiPiFFeYuygIZZqZ7AczQYwAx8486XC9MNjOs8fC0Hh9L
         nlHudD0Hc8aF9HXh5Ix7kJMvTepMHhkPA7RLCFX826xugyqMgoL8IJsQMD/p+pUWDMLa
         TBcOI1xwgMMCBhSj0Spwu9dM4RTWVK0fqlJZ4SDg4K5X2Tknkf/9gIqtb2vEVYo6Avpt
         /68g==
X-Gm-Message-State: AOAM531A70C2veFMUEH2Mg1x2FCc5HtVHPIkFdcPfuSNzWAqfR8eWXsi
	Kg/GNMmgaE5s311waf6ocNhWHlDp9qz90PBd
X-Google-Smtp-Source: ABdhPJxoSiv1mKKi/xsVml/kvY3FfuTF7f2ixSiyGRv5VXZnP9SuboxE5ND7MRDlqJ2u4ku+hXCXjQ==
X-Received: by 2002:a5d:698e:: with SMTP id g14mr18362610wru.301.1593438516820;
        Mon, 29 Jun 2020 06:48:36 -0700 (PDT)
Return-Path: <ross@burtonini.com>
Received: from localhost.localdomain (35.106.2.81.in-addr.arpa. [81.2.106.35])
        by smtp.gmail.com with ESMTPSA id z2sm30549400wmc.2.2020.06.29.06.48.36
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 29 Jun 2020 06:48:36 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH][dunfell 2/2] scripts/install-buildtools: Handle new format checksum files
Date: Mon, 29 Jun 2020 14:48:33 +0100
Message-Id: <20200629134833.83684-2-ross@burtonini.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20200629134833.83684-1-ross@burtonini.com>
References: <20200629134833.83684-1-ross@burtonini.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Autobuilder generated checksum files only have a single space between the sum and the
filename, tweak it to account for this.

(From OE-Core rev: d1e71bf5b399372166eb40bb0d99c8fb52231600)

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 scripts/install-buildtools | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/install-buildtools b/scripts/install-buildtools
index 1a458a2cc7..fbf6a4bc38 100755
--- a/scripts/install-buildtools
+++ b/scripts/install-buildtools
@@ -239,7 +239,7 @@ def main():
                 if ret != 0:
                     logger.error("Could not download file from %s" % check_url)
                     return ret
-            regex = re.compile(r"^(?P<checksum>[0-9a-f]+)\s\s(?P<path>.*/)?(?P<filename>.*)$")
+            regex = re.compile(r"^(?P<checksum>[0-9a-f]+)\s+(?P<path>.*/)?(?P<filename>.*)$")
             with open(tmpbuildtools_checksum, 'rb') as f:
                 original = f.read()
                 m = re.search(regex, original.decode("utf-8"))
-- 
2.24.3 (Apple Git-128)

