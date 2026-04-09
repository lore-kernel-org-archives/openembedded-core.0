Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 808C8F36B8D
	for <webhook@archiver.kernel.org>; Thu,  9 Apr 2026 23:11:41 +0000 (UTC)
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.145077.1775776298237447514
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Apr 2026 16:11:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=eHj2BFRr;
 spf=pass (domain: smile.fr, ip: 209.85.128.66, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f66.google.com with SMTP id 5b1f17b1804b1-488b0e1b870so20793385e9.2
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Apr 2026 16:11:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1775776296; x=1776381096; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tKZ9G/NdOtagwAPvJOKTWSQfsxyhuSqzb1tWjjrrk6I=;
        b=eHj2BFRrTojnxEeWns4xx2mEGKh9MZaFV66soa0dbaa0amhQIfFL2waeylBz4rO1Td
         trVLTCdxHqCqPSc4pTga/7G++vMRvtIcLky0am8DUtApjujuC5oHTBZGLLO1YpvIfwcv
         fCubAFQ6c7a8vsBqh+5chxjv3+oLGcFJbulJ4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775776296; x=1776381096;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tKZ9G/NdOtagwAPvJOKTWSQfsxyhuSqzb1tWjjrrk6I=;
        b=T10UdJyqSMNLCLdGFHjXBaZASQPqL1z3K/0qrc3bGyTQq6YLGtUnNvqNDea2eLq2ke
         hV8K4UgHO/KWy+bopxdcjddS+ttwitM/ElrJVRKsf1wKxptz92M3fZ3Zk8+Xn9Er+gs3
         blHNSDwFupv5Jv6EyBNwL+ep6OFqYmDs5KhvWB8RiPBtyQSBP8pAF7YPLSB9I7pKSHKl
         SM3QiZVZWA/NJ1fTReiPSxNGZXJDU8A+f4OQl43+/UdJVwqNZqTcviAZ/EWObR7Y1HN0
         08C4wYUunjzZkY/r4OJpVqO4s6QAjW79LYjT0qByEuArBiGx3icPDNEjRcqKP7Tz4Fnl
         GieA==
X-Gm-Message-State: AOJu0YxSP+WYEZ+7ofl9qfZSFlbMffdN7V/h5T43WeeCnET3UrV0isSR
	wS7N/3hYjbsuYZoqFDf8FnI9AFwuG/GPS2f4HkNi/cO9JpID/5hf4+VfKIvDgaeOfBStbLhFP46
	L7NHLSGvIBvEd
X-Gm-Gg: AeBDieshxsgJEsIw+QtXpsqYKS6N/Kh4wZcCv2/chiwD5t32FJQerLO+P6JqcJdAa2p
	mDuE5lFYX6lisa6W2d2Z4x0zXpi8nvgUiOELxX+5/kAgtwXc187gFFSMduxAnzmTt1hhHgRgpXj
	9FEK5tIDEXZiE7RI6rurwKk9/xO3RdnVPol6irn0VqU06hfZs1S9y98fUUYesFUKGnfRgYVZp8l
	7LeM3dezKDAqIs8VHQo2ZCUgv/ANzO25qdYyoIuJDd3tL11xJhViHlzLXyD67e6KWV9bpMr6bqC
	opEsG8Tt4N2EHU7cQ5EBfIEWp+7fSG88+/4cNil2X1wsbVEkXNtJNcqgUkjY17oX5z2DX0syfNf
	cRtCCcp2OJNj7MFS+svZW+1xIrG6WRM7YVTN5qOtxCLB04m8BfngwBQD17CiwLZ1x1UkAsnqHJo
	uNXiQfm+2PMD4zeGTEbEb2SfK4J8Lg59fv+fqKqHKP4+IqEXMsoyXlOsVQmgjlKS7A5fao0MIz1
	cL+8FAbl+c5Fu1ISLWQfaxs0Yfd
X-Received: by 2002:a05:600c:8907:b0:488:80b6:873a with SMTP id 5b1f17b1804b1-488d6860bc3mr5265755e9.21.1775776296371;
        Thu, 09 Apr 2026 16:11:36 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00af4acfc73fc9518a.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:af4a:cfc7:3fc9:518a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d67e685csm7708855e9.6.2026.04.09.16.11.35
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 16:11:35 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone v4 23/30] recipetool: Recognise https://git. as git urls
Date: Fri, 10 Apr 2026 01:10:23 +0200
Message-ID: <d88ef7b29d30d19a9c0f8705b896e35af0fc44cb.1775775155.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1775775154.git.yoann.congal@smile.fr>
References: <cover.1775775154.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Apr 2026 23:11:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234982

From: Richard Purdie <richard.purdie@linuxfoundation.org>

If a url has git. in it, assume it is likely to be a git cloneable url
and should be treated as such.

This allows us to switch from https://git.yoctoproject.org/git/XXX urls to
the preferred https://git.yoctoproject.org/XXX form.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit cedc9209e3bae0da8d61423b16c74c49a132aa63)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 scripts/lib/recipetool/create.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/recipetool/create.py b/scripts/lib/recipetool/create.py
index 7b4c501456b..c4b99619f5e 100644
--- a/scripts/lib/recipetool/create.py
+++ b/scripts/lib/recipetool/create.py
@@ -366,7 +366,7 @@ def supports_srcrev(uri):
 def reformat_git_uri(uri):
     '''Convert any http[s]://....git URI into git://...;protocol=http[s]'''
     checkuri = uri.split(';', 1)[0]
-    if checkuri.endswith('.git') or '/git/' in checkuri or re.match('https?://git(hub|lab).com/[^/]+/[^/]+/?$', checkuri):
+    if checkuri.endswith('.git') or '/git/' in checkuri or re.match('https?://git(hub|lab).com/[^/]+/[^/]+/?$', checkuri) or re.match(r'https?://git\..*', checkuri):
         # Appends scheme if the scheme is missing
         if not '://' in uri:
             uri = 'git://' + uri

