Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6501FF885A
	for <webhook@archiver.kernel.org>; Fri, 24 Apr 2026 20:57:14 +0000 (UTC)
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.31989.1777064225473169322
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Apr 2026 13:57:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=zXxgfnhc;
 spf=pass (domain: smile.fr, ip: 209.85.128.65, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f65.google.com with SMTP id 5b1f17b1804b1-488b150559bso65820095e9.1
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Apr 2026 13:57:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1777064223; x=1777669023; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pY1s+zHT08SEX6gQ0CxslLgmCaGI1+kmymp2pZCgTSI=;
        b=zXxgfnhcXNWYkMIlyzBWCJQAjMzOeSRZr4CgkHduv0qPfoInwjOUc1z5wUu/2Dnx5P
         KluMVRAMePumJBFe9MD/jTecYjinMAP8JRgOmhV6HHYoJhUA06YtNCZiZwHqZUOdngGK
         brizZcWiIxH0HIMVawJRgzjk/RZ/HVuQkf+GA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777064223; x=1777669023;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pY1s+zHT08SEX6gQ0CxslLgmCaGI1+kmymp2pZCgTSI=;
        b=BsTTqAgM//7hGjvxEuHlnAG0F8qGRPmhzKxjj2f9eCv+14meryJdncBwmorUEjNtYJ
         AJP+oSa7cuHfxBsa3mD9FzJruXyzIp1Xjcg4xyL5RLA4OnoZqZAII6VB3uExM88qihkN
         bk8yoX33ekexiPJLfBR5i3mgg/E0gQ9utR14vx87hm/ffVNIfdjaaL1B0NQ3F9ILvLaX
         pB+DyGgGuJEUHD6fBpPIIVFr51HXZFZNg+ln5yyRnMhfyn0P7ARiPU8XAm0+z5q/bSTG
         FnpeLdMtTC5l2hXxVqoVxmi+0Xxb4ja5J7gJp+s48zmZBsoq9RbE/D4ttQWQ8IBgSR5l
         FRhA==
X-Gm-Message-State: AOJu0Yz+qmL2dkkdjnZ2VsdtIyDEHbmwknk0s9N9q41SKwpkCWLPrBdX
	YvCfiP044eQ4cioPQ7gGLJ2mIPTvBuxIpK+eVgdknO0OYO1iQVyJGntBVTTJrdJPu4tIyOqMUTW
	ZLy5Q7MCX8Vec
X-Gm-Gg: AeBDieuqnslf/uM/EE7tktIkL+PsP6Wj2kC8kK9fwrRduChJQmuVV/FpIJ0A6H4OkkF
	spmAzVz/K3N3XhuZpsOnlJbJ2k1U+OdCd0dCbW5uWZQUo4BT2fmbYnVX99oAHyxx3uwO0R7A7UV
	4qv1etQblUSwq6REmvlQ5+uuNcBDVw2L85g0AlBhWyZpvu3WUm1mjq3xc+c70xLSeFeUijXZtWx
	LnOictaFz9418wn435cga2wnfCs09qAdsIUVmgZ5aZiH7VoJoXP57mVGN3SpJ21pqydiz0w1mDo
	tMxnBCE6oSnbn6G9Y6Cv4W5mNUP1WwlUI0w1Ox03puVDdLgU7vFQBWbG89/YBkuJl/6QKZeXtZ3
	vyr7DSZijELAAmhbxESjHU0E1k245zdUeoTxs0z6fDDcT13MMtUt+CyBRfBh/xIrRQAu6KPAbhH
	rBA27f1/Up/yh/ye0kYGsqSAz8llKdI6OxzCky/JT4vlaUu4JzD/QbWj1U4fEken/KtXtHFqH/d
	6u8Gqh9FFyRbUPBK1rohGqgss9tjyNgfIZtjA==
X-Received: by 2002:a05:600c:348b:b0:489:5022:39a4 with SMTP id 5b1f17b1804b1-4895040c025mr330976955e9.9.1777064223583;
        Fri, 24 Apr 2026 13:57:03 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4891cca5743sm394841005e9.9.2026.04.24.13.57.03
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 13:57:03 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 45/66] meta/files/layers.example.json: switch to https clone URIs
Date: Fri, 24 Apr 2026 22:55:44 +0200
Message-ID: <1ee811091a4e82c9c79872a86e4e573a45229245.1777064068.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1777064068.git.yoann.congal@smile.fr>
References: <cover.1777064068.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Apr 2026 20:57:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235918

From: Yoann Congal <yoann.congal@smile.fr>

Following up on commit 139102a73d41 ("recipes: Default to https git protocol where possible"),
> The recommendation from server maintainers is that the https protocol
> is both faster and more reliable than the dedicated git protocol at this point.
> Switch to it where possible.

(cherry picked from commit d1fb36b3ddcb033ef472042cffb0dfa68714ba96)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/files/layers.example.json | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/files/layers.example.json b/meta/files/layers.example.json
index 0a6a6a7b489..91b32736c15 100644
--- a/meta/files/layers.example.json
+++ b/meta/files/layers.example.json
@@ -20,7 +20,7 @@
                 "describe": "15.0-hardknott-3.3-310-g0a96edae",
                 "remotes": {
                     "origin": {
-                        "uri": "git://git.yoctoproject.org/meta-intel"
+                        "uri": "https://git.yoctoproject.org/meta-intel"
                     }
                 },
                 "rev": "0a96edae609a3f48befac36af82cf1eed6786b4a"
@@ -33,7 +33,7 @@
                 "describe": "4.1_M1-374-g9dda719b2a",
                 "remotes": {
                     "origin": {
-                        "uri": "git://git.yoctoproject.org/poky"
+                        "uri": "https://git.yoctoproject.org/poky"
                     },
                     "poky-contrib": {
                         "uri": "ssh://git@push.yoctoproject.org/poky-contrib"

