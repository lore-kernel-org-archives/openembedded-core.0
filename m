Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0800C36002
	for <webhook@archiver.kernel.org>; Thu, 20 Mar 2025 13:40:18 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web10.7676.1742478014660179738
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Mar 2025 06:40:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=skF7GXPJ;
 spf=pass (domain: smile.fr, ip: 209.85.128.44, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43690d4605dso5304535e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 20 Mar 2025 06:40:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1742478013; x=1743082813; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/p2OScyQrHeCW1OogWc3uNl0IAGgYfliUw0Gy8EV934=;
        b=skF7GXPJ1nm4rjVt2jMvp1i9XQEIomg/UJXOI6RSqQKMUWN6pgEkZwjaU/SkZH9ZIw
         PkCaZUdr+ZBKn2s9UW3m9hqTMdvA7Teb4EHhq2cF62SzIqzSjNwUVX0KHPr8UyX71760
         zBkm/g2AmRFQyXtphKfqXmssk9KByT/06K9Qw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742478013; x=1743082813;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/p2OScyQrHeCW1OogWc3uNl0IAGgYfliUw0Gy8EV934=;
        b=Row4XCiBDRjXhLOhjcGFdZEJchd9yZxeCmZFRiYSP/JPO4dFVM8w5gYlmYdk5y8VY2
         PoQvcLGy6ZlQ/0UTBiiJX3nGQma2WJzbR0OC8tGqelpLjhPhL93rVym1wJamNdw+9/Cc
         eg1HmFqCNSrLsTpAut4lpkMSAfI/cU/Mjp5pjssYUtU83JDv+xSLOfseGMOKf1qzlIW0
         dzPETHpjZqoHQrm4NGGWD63WX8i1nUVZ7o+H6DAE0qSdiKjd4lIyBJDdwF8sC/Ve6lI9
         TVf0As3HfTiaDa1ngyS3fJsKKQrr6Ms2POssbLlPTZl9X57sqF5MXLEa2kwDWrJjnR+h
         4D/w==
X-Gm-Message-State: AOJu0YweinF2qjck4B8WV+Um8Z1hHuq2jfnM0Mwsr4xS4wMV8m9i8ge3
	n0o3T62UXBd81nDj9xXAVl03X/O+SQpkdbw5zdw0E+8UvnStCJAcqma4sasg10q4SkMSYsBqPH4
	k
X-Gm-Gg: ASbGncuqxCnT1HnC/FiU9tdtFhr3d+vkinS7JdhhfNO+4kluCOUqdUTwWKcmxUUmt/n
	RjJ9ik65MQFMIS4/lJ7JV3fXKTyOurLXshnLeM6jYBsoOk4M1nWxwnKwP/RFWCkPj2TlVhT4cfb
	Ka+yQs7nAhTRI3Laxp94Pi8Oe5bb/Caqib+qPCxYImPPQ1OI6m9dlTo3q+75fkJfoha1cdswfRm
	g2ITcKIIN4JMVY4EU5e5W1ysdm3ffGfwb4Qo7O7TOKfGB01VzCs7IOQPqyFLW0uYHDaSIVo4NUn
	URk1aO+fiilWqhK638zSbSE9/ra6G8OdESYu1G55I2ynReFeZ+Sh9ck9dvWlMviwnvIrPc+Rwon
	+72l2i5b9fgfATpcnptnAwjEyb9fQG+n3DI+ZLn2ZsAq2fd7m5NOBUfn8OThRc0R/y4G0
X-Google-Smtp-Source: AGHT+IGE7rBX2YDpAmuaz/gJZKX0BKXfq6fbM3LlgK9o4uTe0hxN+kw2Ky1FsSYOtDqQGp7Xl51I6w==
X-Received: by 2002:a05:600c:5107:b0:43c:f597:d584 with SMTP id 5b1f17b1804b1-43d43899ffcmr74843655e9.29.1742478012766;
        Thu, 20 Mar 2025 06:40:12 -0700 (PDT)
Received: from P-ASN-ECS-830T8C3.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d43f8679bsm50069995e9.40.2025.03.20.06.40.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Mar 2025 06:40:12 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>
Subject: [PATCH v2 2/2] insane: Check if the C++ toolchain supports --std=gnu++20
Date: Thu, 20 Mar 2025 14:40:09 +0100
Message-Id: <20250320134009.2631475-2-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250320134009.2631475-1-yoann.congal@smile.fr>
References: <20250320134009.2631475-1-yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Mar 2025 13:40:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213390

From: Yoann Congal <yoann.congal@smile.fr>

This is needed to build nodejs from meta-oe. Check this early to avoid
an error later in the build.

Fixes [YOCTO #15804]

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
WARNING: as discussed in previous threads [0][1], this will disqualify
builds on Ubuntu 20.04 (its g++ does not support the option)
[0]: https://lists.openembedded.org/g/openembedded-devel/topic/111740469
[1]: https://lists.yoctoproject.org/g/yocto-patches/topic/yocto_autobuilder2_patch/111757761

v1->v2:
* Changed error message
* Refactor C++ toolchain flag check
---
 meta/classes-global/sanity.bbclass | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/classes-global/sanity.bbclass b/meta/classes-global/sanity.bbclass
index dc317e846d..ce52bcdf90 100644
--- a/meta/classes-global/sanity.bbclass
+++ b/meta/classes-global/sanity.bbclass
@@ -804,6 +804,11 @@ def check_sanity_version_change(status, d):
     # Check if linking with lstdc++ is failing
     status.addresult(check_cpp_toolchain_flag(d, "-lstdc++"))
 
+    # Check if the C++ toochain support the "--std=gnu++20" flag
+    status.addresult(check_cpp_toolchain_flag(d, "--std=gnu++20",
+        "An error occurred during checking the C++ toolchain for '--std=gnu++20' support. "
+        "Please use a g++ compiler that supports C++20 (e.g. g++ version 10 onwards)."))
+
 def sanity_check_locale(d):
     """
     Currently bitbake switches locale to en_US.UTF-8 so check that this locale actually exists.

