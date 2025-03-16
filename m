Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C149DC35FF3
	for <webhook@archiver.kernel.org>; Sun, 16 Mar 2025 16:12:52 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web10.31797.1742141565631283137
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Mar 2025 09:12:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=OL2t9k2P;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43cfdc2c8c9so6879665e9.2
        for <openembedded-core@lists.openembedded.org>; Sun, 16 Mar 2025 09:12:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1742141563; x=1742746363; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p9bChovC/JEinZSK7EsTunzVG/Y7WVRbYD3Cuzs/FLk=;
        b=OL2t9k2PWpMsW85ZLbPAbhJGCj1xYDr1REEeihFH4do9HYsl5UuQGzxGR8yrYWWfwT
         Co9wTW5YriohBHCs1JyFREWAd5NQpt2wqQFRNWqwHIKktsnTK/Il6QAFlvrd/NJxKqTp
         OFYvGH6n5+qhuAU6tQlBdRszGiRj//1wwcR/U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742141563; x=1742746363;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p9bChovC/JEinZSK7EsTunzVG/Y7WVRbYD3Cuzs/FLk=;
        b=FzoWuVyk6VOQ9bj2Tkl551Ll2sMR6EnLAf00+8DE00sJLIQsM8OljV8I86hCTkEgr8
         n41199WjAp20y5iRv1olBtZBrSSJMYaYNG1tCCg9bpdcUcwqIQkxbVxyZuzB1o/ejZxc
         K7R/yaG/D4G2V76TzG6zOMmdZU0K66WrccxvSRxtnyrFWVgVRUL9xpMX2pV7D/gAQ6MQ
         8UVhT7Q/lVc53ef1rTyZmHrq68aCbw9s8ndb6pdZ00epUALcsxJZulHCalxcLExZqy7K
         zBcxqRWsF4vdRh9ceSMOjwPQWZx/9qTaKgWDlwccUcalcFWPReq9bYp9/Ii76qy2nEXk
         b3Dw==
X-Gm-Message-State: AOJu0YwCCZoXKujcsBYHg76zn1ka3su+hG5hCeZTUvANRi0aolf25w4o
	yqw7zSdcuhZvcmwzE8N6BY9rBQev8ji9ASot8DNLTHlR0qRE5wvE/CiVYOAjAu9yqC+8t/XRe26
	1
X-Gm-Gg: ASbGncu5DiWZfHuP5X+bNkVShgLjyNAC6MEnnN2v4QBVzCxnXVKKC5aUF2sxxrkHRps
	GRRCzzqexg7qHo4XTmvfP8yP7Unk1hsELd0QGZvHX9cEHdWC5eRixvo7mXd5ETQZjF6nf0E+MDN
	5IJq3oQAgRF3pW5/BrSSvNQ9y2rpCqeIgjiJ/q8czuZBzrGUD7P1KZ0VwitTBOt/VObXDM92h0H
	mm0SJt91SlOktMy4tuPkO6LKR15wY8oVkypRl97ffS7eTVxz6aFx10+yiygy6Dt4OIZqVDp8e21
	hR4rAcqEheda/CM79Lz4WNZrrs7xbcz/mTIPrTooFzqTFm6nPojluccRF4iWiqHrrYT5aTw7Av5
	Ie44HlgVs
X-Google-Smtp-Source: AGHT+IG08b20QXjF/r76noJ0V5i+D4Y7hrYjNcTsVKaDbJp/z+s86DqZ1xYKCYvSluHs0dnnQBPT1A==
X-Received: by 2002:a05:600c:46c4:b0:43d:24d:bbe2 with SMTP id 5b1f17b1804b1-43d1ecd10fbmr99321865e9.28.1742141563263;
        Sun, 16 Mar 2025 09:12:43 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:bead:7cef:d139:9ec0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d200faebbsm80252225e9.30.2025.03.16.09.12.41
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Mar 2025 09:12:42 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 22/43] python3-jinja2: upgrade 3.1.5 -> 3.1.6
Date: Sun, 16 Mar 2025 16:11:48 +0000
Message-ID: <20250316161209.3629986-22-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250316161209.3629986-1-richard.purdie@linuxfoundation.org>
References: <20250316161209.3629986-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 16 Mar 2025 16:12:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213025

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../python/{python3-jinja2_3.1.5.bb => python3-jinja2_3.1.6.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-jinja2_3.1.5.bb => python3-jinja2_3.1.6.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-jinja2_3.1.5.bb b/meta/recipes-devtools/python/python3-jinja2_3.1.6.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-jinja2_3.1.5.bb
rename to meta/recipes-devtools/python/python3-jinja2_3.1.6.bb
index b9ef57f5991..2e96eb0dcb3 100644
--- a/meta/recipes-devtools/python/python3-jinja2_3.1.5.bb
+++ b/meta/recipes-devtools/python/python3-jinja2_3.1.6.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://pypi.org/project/Jinja2/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=5dc88300786f1c214c1e9827a5229462"
 
-SRC_URI[sha256sum] = "8fefff8dc3034e27bb80d67c671eb8a9bc424c0ef4c0826edbff304cceff43bb"
+SRC_URI[sha256sum] = "0137fb05990d35f1275a587e9aee6d56da821fc83491a0fb838183be43f66d6d"
 
 PYPI_PACKAGE = "jinja2"
 

