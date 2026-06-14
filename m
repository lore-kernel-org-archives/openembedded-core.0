Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F835CD98E0
	for <webhook@archiver.kernel.org>; Sun, 14 Jun 2026 08:04:22 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.105060.1781424253894663965
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Jun 2026 01:04:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=F54hd02n;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-490ace40f4bso21949295e9.3
        for <openembedded-core@lists.openembedded.org>; Sun, 14 Jun 2026 01:04:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1781424252; x=1782029052; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WeSf1VxiECUQeFytrEdgnv0ZX6881nuoyzjm7KVklaU=;
        b=F54hd02n2DkRu0OuAjGLrlhzJIrvObcOoveHWQG8aqV6R+BHnD9QHJCI9I7qW8V56w
         sN0XoUCa3EkH951n7+E3jw8G45bO0WQgobwEu3aPwxCzsJf4tQ+ykOExmaQhsLXNglgc
         /QDmvMrNrnpEHy8AUXE5c0VgehVwJgastHb6M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781424252; x=1782029052;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WeSf1VxiECUQeFytrEdgnv0ZX6881nuoyzjm7KVklaU=;
        b=BLY9ib5SJH2HzksAP+VWoO7pN6KSIpxwuHsIoCz2lLILLoE1eV3k5EapzmohJgfXiQ
         BqLqU779y5RczHRBU/JdDe4CWP9GhX8GBKOhO250f/wy/CLazDGy9REzqKSwGbXobDUD
         N3TP1ORISSGr7w1bOahuzYFq8YpMUDKrq5p0y093nvhNvPi0g9bp7sq/GIG6Rvux2uct
         rw3vzXHV3G7Qzz5hPMVmc+2ZWonTqPM93ILS+eRlChf/xf4jPiJpJCRDMzBGLsgiAvB5
         RsgN3trmu5hgjsPh2JKonbbxcyC4V7Egx/9Uxz993V6weMtH1baKIAIVp2rfoheFV5QY
         AJ7g==
X-Gm-Message-State: AOJu0YwSvnVn1Lcob/vX9UasiaVPwn5DsZ0V93ZiPOObnMA2LfJ5b1o1
	Km/jBthpvgSCSqxAKLzmIL/Yd7H9GS2sjGHtD+D+upPx0TdUwBaTCtTsN3pS7ruUjPmKhEwmBOW
	eR41U
X-Gm-Gg: Acq92OHuxTnhiD5QHOykT0vwy78i4iZW3aawu2Oi4zMJm0kLUsyrMlM1nxJVQfw89MT
	xpNNXaTqLG5kzostWIJqXYoGYShnoKs49ppaaFFzmCHdrxPzoMxIzZRdVwn+m5IFTseLR0DboqP
	2zqcxpY5tZiu9NHA2mufbxqRncNj3ixR3P8HcL9jdBlvgyhwHxDd5yMKIzJK8iuhAT0QOCtl0pQ
	0odmMMNLtzQ022tHrfRfQvircpr3rtOz2aSNtasRjQGj/Gqi9mFfnZqwHHRhHO7ViRgMvIph44q
	QjWC/P1mEkqKryygovldVFUf99iVMLFsv52VGvu0iY9R/fWUq5/VZrpWNZptMJwAhOPeKySqP/k
	cmRQMNzin89nKu0i7QB+w2Jgo3HzFe7xiyc398PfSy4BsmlP+T9Sxhvv4NZeblDM+El5+y2k2Y0
	OcRy15Yq3T/yMTLqjNW6HhITZhFeX7Nbnqnjz3uSWbqiRdaZd25vXz
X-Received: by 2002:a05:600c:1f8c:b0:488:d6eb:e63c with SMTP id 5b1f17b1804b1-492200768abmr77665885e9.15.1781424252090;
        Sun, 14 Jun 2026 01:04:12 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:b23b:4f5a:d2e8:6789])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-492202edf89sm149999065e9.1.2026.06.14.01.04.11
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2026 01:04:11 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 41/56] python3-wcwidth: upgrade 0.7.0 -> 0.8.1
Date: Sun, 14 Jun 2026 09:02:52 +0100
Message-ID: <20260614080307.4017177-41-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260614080307.4017177-1-richard.purdie@linuxfoundation.org>
References: <20260614080307.4017177-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 14 Jun 2026 08:04:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238725

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../{python3-wcwidth_0.7.0.bb => python3-wcwidth_0.8.1.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-wcwidth_0.7.0.bb => python3-wcwidth_0.8.1.bb} (84%)

diff --git a/meta/recipes-devtools/python/python3-wcwidth_0.7.0.bb b/meta/recipes-devtools/python/python3-wcwidth_0.8.1.bb
similarity index 84%
rename from meta/recipes-devtools/python/python3-wcwidth_0.7.0.bb
rename to meta/recipes-devtools/python/python3-wcwidth_0.8.1.bb
index cd5e40b080d..9b306225d96 100644
--- a/meta/recipes-devtools/python/python3-wcwidth_0.7.0.bb
+++ b/meta/recipes-devtools/python/python3-wcwidth_0.8.1.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/jquast/wcwidth"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b15979c39a2543892fca8cd86b4b52cb"
 
-SRC_URI[sha256sum] = "90e3a7ea092341c44b99562e75d09e4d5160fe7a3974c6fb842a101a95e7eed0"
+SRC_URI[sha256sum] = "faf5b4a5366a72dc49cad48cdf21f52bdf63bdda995178e483ba247ff79089b9"
 
 inherit pypi python_hatchling ptest-python-pytest
 

