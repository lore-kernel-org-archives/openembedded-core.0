Return-Path: <michalwsieron@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78C36FF6E6E
	for <webhook@archiver.kernel.org>; Tue, 17 Mar 2026 20:29:25 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.86398.1773779363763781531
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Mar 2026 13:29:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QHGh/sc0;
 spf=pass (domain: gmail.com, ip: 209.85.208.47, mailfrom: michalwsieron@gmail.com)
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-66778a3c1c4so1374128a12.2
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Mar 2026 13:29:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773779362; x=1774384162; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r2iWER64NgngMX0nHNPl/9BKzVhKE6yhAUGRni8KcSI=;
        b=QHGh/sc0oixyzTG9rg+jzyotUR4GeBX7TKuKgDyelPJgsaJuGCrNY8glyU17AFD7zO
         X8/B8K2PhQ7Ii8WpJT6ythwWhdLv0uR/UHuYqmqizsRR5UbOoN33BW2+adfj7zIZ917p
         yDzCCp8vpfbyl1fyYqlTDfs7/ggqRpu35eWhMuPltkcP3WYy6zdBMHWSFDyN2lquuzmF
         jb7k+0aAk0v8C72WdYLHG/18s0Sdw+pDH8BtmTSAR9SZxWVs82TQpPdtyk3tZBl9RjY/
         ghTasWZ999I8wyr9IJ5rtlGHmfuqvAD5Vvnhj3qeDb4nG0HiIgY7Vd50uFCnhXNYYYFe
         vKlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773779362; x=1774384162;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=r2iWER64NgngMX0nHNPl/9BKzVhKE6yhAUGRni8KcSI=;
        b=Hge18L8ne3JjSA9IZwdyefi5PVA5ooJ9l6XsxW4tdmSF/EQxf2reSq6vtBXFnHF/7O
         3UpTSy2r2BX2Qyl9mQycYiggUmhX7tefHh6sngoF7SfP3QnIwKLEG2jZAsL9bsl8XCI9
         Jb8yMA318fBaHoc6XxE7TU6L41OpemAQOncQ0xwldPSgfJMh41ijzupMegV6n4h3u7/Q
         1tfs8AWmpOLs+c/Ct8aBrFTuJM376n4+guIDXs752/PAishRh8J9uI9aUkhbfmKRIOzK
         7iTYtdm8xPBohBIgTe66GZ9uZZE3tRZ8C/WH+B4cBCYolQv8D32k+8ZB7GJiomkTh8L3
         WkIg==
X-Gm-Message-State: AOJu0Yytto/9PXBdQLf2MT6TH71WnYbtikwK/TbEfecpWdFbxqiKdDnC
	c9PztYxFDILwlOMcKPWSOLB4Ds88jELfa81APngKSCXXU6oTZscWBmHLdV7ktw==
X-Gm-Gg: ATEYQzwbC1hBDSbKZ7bNMyb3HQbyiQaP1e9XM9tGE1Z3H5aVuqcpXBrWkInD1uTAsiK
	S2CFTgmkLtTr0ua9NR00NdG7bqUBtMIAtL569e6o3WUWn33NgRho5HS+MZbiBj0m5mIeM2IgaTj
	jYZrFzDJeNMffVup8CmFdhQj/Rsl8TblTqpjJf7eN2w1VkuotRnGm5pqTk1uCeWXOzNRBXovODw
	aAGx6C7o2Vp6mV+Si2KZDpLGPpjJbq8/FXkbJbBhw7lBy4JY2nzTUqvcaDns79cApZxweoUUZpf
	+GiL3j/koT8i1z2+ECkbC59dxNMqTr2tBirHLC1v6ky+jHVMOsJd1A4HRtKeodyF4eoGAjgueKh
	vW8g5SmXWtMT7tkomRTpCfSgWApWwtltusseNjaUWO5JxwYToRAaawQTSVb50pT0c9eSchEtwjr
	HCliA9K/LOhQM1EECUkG2jUrLSs84t1wIBd7iGegMnVbWYyM+CTxile+QpbtLH2RE=
X-Received: by 2002:a05:6402:2810:b0:662:b884:d1c with SMTP id 4fb4d7f45d1cf-667b253300fmr757649a12.10.1773779362091;
        Tue, 17 Mar 2026 13:29:22 -0700 (PDT)
Received: from [127.0.1.1] (185-164-141-154.cgnat.inetia.pl. [185.164.141.154])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-667b0eb9c02sm451909a12.19.2026.03.17.13.29.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 13:29:21 -0700 (PDT)
From: Michal Sieron <michalwsieron@gmail.com>
Date: Tue, 17 Mar 2026 21:29:06 +0100
Subject: [PATCH v3 07/13] pigz: Convert confusing append to override syntax
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260317-fix-invalid-appends-v3-7-59452f073f31@gmail.com>
References: <20260317-fix-invalid-appends-v3-0-59452f073f31@gmail.com>
In-Reply-To: <20260317-fix-invalid-appends-v3-0-59452f073f31@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Michal Sieron <michalwsieron@gmail.com>
X-Mailer: b4 0.14.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Mar 2026 20:29:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233342

In this case `PROVIDES:class-native +=` doesn't override the default
provide of ${PN} only because that one is `:prepend`ed and thus cannot
be overriden. To avoid any surprises in the future let's use
`:append:class-native =` syntax here.

Signed-off-by: Michal Sieron <michalwsieron@gmail.com>
---
 meta/recipes-extended/pigz/pigz_2.8.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/pigz/pigz_2.8.bb b/meta/recipes-extended/pigz/pigz_2.8.bb
index fcf0c93e41..d4640eddce 100644
--- a/meta/recipes-extended/pigz/pigz_2.8.bb
+++ b/meta/recipes-extended/pigz/pigz_2.8.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://pigz.c;md5=9ae6dee8ceba9610596ed0ada493d142;beginline
 
 SRC_URI = "http://zlib.net/${BPN}/fossils/${BP}.tar.gz"
 SRC_URI[sha256sum] = "eb872b4f0e1f0ebe59c9f7bd8c506c4204893ba6a8492de31df416f0d5170fd0"
-PROVIDES:class-native += "gzip-native"
+PROVIDES:append:class-native = " gzip-native"
 
 # Point this at the homepage in case /fossils/ isn't updated
 UPSTREAM_CHECK_URI = "http://zlib.net/${BPN}/"

-- 
2.53.0


