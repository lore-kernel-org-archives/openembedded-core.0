Return-Path: <majortomtosourcecontrol@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35850FCA19F
	for <webhook@archiver.kernel.org>; Mon,  9 Mar 2026 23:11:10 +0000 (UTC)
Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.28136.1773097866920344935
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Mar 2026 16:11:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Qql/9uPv;
 spf=pass (domain: gmail.com, ip: 209.85.161.50, mailfrom: majortomtosourcecontrol@gmail.com)
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-662f2fa7e67so4738555eaf.1
        for <openembedded-core@lists.openembedded.org>; Mon, 09 Mar 2026 16:11:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773097866; x=1773702666; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-language:cc:to:subject:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Oaykt5MCSlhAnQJ2x3D1LUYvb0xPNmOeYkaqM6f6Q8Y=;
        b=Qql/9uPv5wFQKZGNtS78DiAF4BkHxPXmdbyT5fLnuDugFPJseHMVrDyMSBjFd84o1C
         K9KiqOzhODeZ+IlFQouTIn5Cnu7lIX5Z2RjBGiMJvCpivY5VGS1gCd6AQjkIWC8SNU3w
         LcSgcil94OtAL0JzLIiSx9W675a6CRTl516syo83sqZ5clyJhZaHbEYwewNAgDs436D1
         t+EDkeOReTLet0twrnrBfZVhJhoG1+mR+WiCohz1wIKiuD4xiuKbK6jKpumS5wXMvtXd
         kDrGZ/lw3Zhgm1FdOO4bI3vEi9s4poQ9JiWQk7SW4xW5wiaObA9V9DDdHvSM1l3P/B/Q
         XKpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773097866; x=1773702666;
        h=content-transfer-encoding:content-language:cc:to:subject:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Oaykt5MCSlhAnQJ2x3D1LUYvb0xPNmOeYkaqM6f6Q8Y=;
        b=C+tTMgW+yp+IwY8bhtsUCYVk7GmN6bc9u2Pr7puryMPvk3KrR2Hesi51sc4Tgx76Yy
         SfQO3oOgWY2f42bBqc1fvLL6HHyiy5HogMZVVIXnwKilNdsy+tOIEU5c1wB+/pzpKCaz
         SJbFEyo1ZDgjQzhIbZXtXxW+DWvXe/1vwEYBDQELiV1k7VdUJMbroG65wxyKn+qGDPY4
         D5PMQQIpT9Xm9fUuEzp/mjFVcJXru2kjq8DJ+ZyCVyHNNCUcU5LP73sN8zrv8y8XE64q
         hQi1NNxm6o94aItGjwM+YUROw58XtyakZz1qpCFS9ONfBpmcb74XE2awH8SachFkwody
         y6FA==
X-Gm-Message-State: AOJu0YzL17vC1h6clnVnicVYxInRMcaW8IpMICsY0TwTwGvB7SkNYvDU
	ei80Hx6HMSWYy8tsWRDc1AJcHcThhTau01n45lHEZYqUchBNUUJtFu3CQ1IoUw==
X-Gm-Gg: ATEYQzwDDtSe3zxLYFxsBCV3W3d4NwcAZo2tdCQ/0fEf9BWOWXNT7KuOKydmKDLfSI1
	oAnICcdpxm+Vrx8ma7N0lJS2zsEkyo60CQhLwhbZ/z8aCZSsJkR7hdXWiQ4I1ax5Xdc4itSgDWA
	2I8xXa7T7s1dt4ngAqcTDvKvUd5nuYgeqH2p9lxOZU75WJc4gM8JEI4TwFLStiJnpW91YVk3l/k
	Bye2EaoWM6eVUE2MtEZVe7SJZvyNXU0vE0JoNnOSxQT25h7LanLbFtvIbxFRFxXzSstCeJ8pJJD
	96OY5fOZ1abt91NNnc/S6xSMXw4xd9ENp1KXyeOSVwiEh2gFQ3eh+0TAUB375P55rqsx/uety27
	FcVbGo48LYjHk5du7m+EeXyf3LWXWuHz8b+6e03bs6tHPSm5pypbr4QlIcSy5EFRIWuUColK6lK
	yWVQ/bdQNLjurFivnFu3OJqfZfquXOSbXSEo6IPlgTfDVpmDXy9bXUNNKVI5gkYmx2iQwKObIXm
	P9G
X-Received: by 2002:a05:6820:81f:b0:67b:ad63:95c7 with SMTP id 006d021491bc7-67bad6396femr4558688eaf.36.1773097866083;
        Mon, 09 Mar 2026 16:11:06 -0700 (PDT)
Received: from [172.26.252.3] (97-118-253-141.hlrn.qwest.net. [97.118.253.141])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-67bb230e0f1sm3177053eaf.13.2026.03.09.16.11.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Mar 2026 16:11:05 -0700 (PDT)
Message-ID: <efe6271e-fb70-4fd3-8992-5f4116d2595c@gmail.com>
Date: Mon, 9 Mar 2026 17:11:05 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Clayton Casciato <majortomtosourcecontrol@gmail.com>
Subject: [scarthgap][PATCH] oe-setup-build: Fix typo
To: OE Core mailing list <openembedded-core@lists.openembedded.org>,
 yoann.congal@smile.fr
Cc: reatmon@ti.com, richard.purdie@linuxfoundation.org
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Mar 2026 23:11:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232755

From:
https://git.openembedded.org/openembedded-core/commit/?id=275a3c015d37729c3b0c9cc4395d50ea2f210f02

A variable was mistyped in an error message resulting in this error:

NameError: name 'tempalte_name' is not defined. Did you mean: 'template_name'?

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Clayton Casciato <majortomtosourcecontrol@gmail.com>
---
Sponsor: 21SoftWare LLC

 scripts/oe-setup-build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/oe-setup-build b/scripts/oe-setup-build
index c0476992a2..1cb06b3b79 100755
--- a/scripts/oe-setup-build
+++ b/scripts/oe-setup-build
@@ -77,7 +77,7 @@ def find_template(template_name, templates):
         for t in templates:
             if t["templatename"] == template_name:
                 return t
-        print("Configuration {} is not one of {}, please try again.".format(tempalte_name, [t["templatename"] for t in templates]))
+        print("Configuration {} is not one of {}, please try again.".format(template_name, [t["templatename"] for t in templates]))
         return None
 
 def setup_build_env(args):

