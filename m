Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34747F31E5A
	for <webhook@archiver.kernel.org>; Thu,  9 Apr 2026 16:00:08 +0000 (UTC)
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.136113.1775750399175827060
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Apr 2026 08:59:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=q6bK+9iW;
 spf=pass (domain: smile.fr, ip: 209.85.128.66, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f66.google.com with SMTP id 5b1f17b1804b1-482f454be5bso11529615e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Apr 2026 08:59:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1775750397; x=1776355197; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tKZ9G/NdOtagwAPvJOKTWSQfsxyhuSqzb1tWjjrrk6I=;
        b=q6bK+9iWtSdx5AEvoLm6fm5BWXs58kE6eLAO+A3XCQzf+eTdalu3OUbjzGpV/Vo7UE
         +0gBe6yoSQqA2mwE/jguzYAWJWMWDOLmyT47Zmj/4P8wo1XF5HrtFKmkZop9kBVGdIRG
         Zkwl/fDKW++WQnzi5jSNo1d9JULqdjqM/KGM4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775750397; x=1776355197;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tKZ9G/NdOtagwAPvJOKTWSQfsxyhuSqzb1tWjjrrk6I=;
        b=ZaK22JrXUi6CiOcB9xSyIEISgUb5VAcYwGhwDv0uL1cowCOUonLq6Q4U31kLbephfV
         EuD16Bqn+oVEMVmBOPf/42VT6YO2VW73HSd3BYBV3tuGyBErSt2sTJDzzfMicRdfLpBA
         Y18J8D25ASr0+iYNOjJngE1qzhiA4WF2m0+YKekZCgvG/zoyfSg10N94Y1zi3g23A0BL
         YYq9PWPT+kTPRKeNq4xBqjuJLNch/jxkZoDaWvyiithtzXxlFAc3LTB77Ljm/W4Mbxc5
         3HqBl6VtrQBJdBLJ15skBCjcCx8vIA0MOvEbJWJ228Cs3SAtiTqfsfVQay2pMfBNUnni
         aZ0w==
X-Gm-Message-State: AOJu0Ywox6v7A3FfzMEW5KhKtWYgCCi9P9u2YKwFSwo5MYSKeTr9I0tH
	P56OiXcRrW8yTvWgRyqnFzOAa851xz9ozfROAiHxcOIG8wybP6jn52+cKOkXvdyxEuvSu41bJ9n
	PSteILFhLHy1Q
X-Gm-Gg: AeBDiesYQE4GD54kca2wh763U8+vdOz9SN1rhexl7K/K/PdiCTdBnCUvdBcNaL7/S6E
	t41yAJYgs+UjkRsqbTVm9yYjButOICNrpbKq1jZUIZxk3PkJhvkmf1eSlitnvQREqli2sexf1te
	27vZzXRlyzBkJ6G369k/nCFWUdaRquOXCScS00SByAhV9TtIhyb2wbCHIT8ciQKyxgibNhXXqDO
	0KTIivUsoXKDbF1kXH3qfkeu/qBq857F024d6OvjuFCC5fKq56HrApgi1O/4dZHShZ0u3HdQGhw
	SJNEgQw2HbirObfI5+QKU5KZrEQyef/cp0Gk8AZXs7Ix0I4D8yK2deJuvaMNn+evuxUuocOAToX
	7/QKJZAg4Jy5bgU0Y4CqeY6mq0rgI1DaqqwZ8Twy5muSghLXa/FihKd9kuIKRemxqjCi+L8U6qr
	xXwwvdWL+tv1Z6B9X1NUxSF1uYKR4FX6CL5c1UoAFpdFK7nPeWlqkZCKdS5q2fo78aaywo+QHY3
	vImfSclCafdlarTFZ8R8q3KRL6R
X-Received: by 2002:a05:6000:22c9:b0:43d:1de8:80b1 with SMTP id ffacd0b85a97d-43d595bbe83mr6204653f8f.21.1775750397105;
        Thu, 09 Apr 2026 08:59:57 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa003cc57ca6ff0f11d4.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:3cc5:7ca6:ff0f:11d4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e2a6f13sm69149364f8f.3.2026.04.09.08.59.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 08:59:56 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: OE-core ML <openembedded-core@lists.openembedded.org>
Cc: Yoann Congal <yoann.congal@smile.fr>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [kirkstone][PATCH 4/5] recipetool: Recognise https://git. as git urls
Date: Thu,  9 Apr 2026 17:59:34 +0200
Message-ID: <20260409155935.2245789-4-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260409155935.2245789-1-yoann.congal@smile.fr>
References: <20260409155935.2245789-1-yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Apr 2026 16:00:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234930

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

