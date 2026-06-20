Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 348F2CDB473
	for <webhook@archiver.kernel.org>; Sat, 20 Jun 2026 13:00:27 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6007.1781960421115177832
 for <openembedded-core@lists.openembedded.org>;
 Sat, 20 Jun 2026 06:00:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=1kiOYfo7;
 spf=pass (domain: smile.fr, ip: 209.85.221.47, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-45ef41adbc1so2348946f8f.0
        for <openembedded-core@lists.openembedded.org>; Sat, 20 Jun 2026 06:00:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1781960419; x=1782565219; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZYYChyjPGWXGInU7OVu188SnilmFSWX5JxSjxoYI8rg=;
        b=1kiOYfo7inCr0xMwieV9W+Cqe0mNvxTanxS+FZLrJHJ9Yg4ivQFMLtxHYw53DArRvj
         q6/y8+bWJUKRiXVnspE1jW+O7XoSrC/wB+cRxC4mr+2PaCwYsz9cb2GycGVLLi1bHZhq
         PYeSd/R4341ivXCNbKAc8xBGM+blFm5Jbq+1o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781960419; x=1782565219;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZYYChyjPGWXGInU7OVu188SnilmFSWX5JxSjxoYI8rg=;
        b=Cg+td4smtWRKd/+3hu/irtpeQOWDlAfR2ASypzzK1O0GqPIFfbguL+q3VJLGStDuTx
         ZSDVra5xQRuJ/LdtddtVylBDzX+xJ0Q2b/K3y9dEC5cbP0Z3q+v/HtVGXL7cl9GuTs5S
         kO4Hx9egG9QINNe1Sed2lJVPLdJixUrVIW6kwB4B0xK1ZFI1ONV3/zOsborzvSTlQycV
         8o1R5J3y+zSYFtNAFjZoAbhOEFdfGxOwMxtW0DxashzVGgS+DWi10fp9Tf4adcVuiab/
         Ob5xC9b9nA4zMB+H3b0lpMqo4G3SZE7bvhmC+JPsyHuLD/eokV8/kg4EO1LlJwC+rNyk
         BHuQ==
X-Gm-Message-State: AOJu0YxCNnAtgvaM+mVhFptatgNVcOJqV+DgcPEzhwQueShq/sEcWQCU
	dh/GMTEpBeOVFiYiEKtXO5iwLuVvO2nuKk8Ij7dbFGa6MZIyV3fiFnGCAQDnW55301m3uNABfEm
	/XHWz
X-Gm-Gg: AfdE7cn3P8Q90J4uU6bIcWmiPSCvCyPtanWMeJRKM1II5aRvyaWdPyHKd9e2dFH1j+P
	ATl5+/L8ngu4+c/9kqiXOV4bDeMpRPZ0QqNjVEZwQgMafJiRsLpN+EycK1bNivNLHJLueMJZ6sE
	U+iVhg6xJWzW+/wg7rSKOC/uGLGhQBLCRm1+sONS2rTa1tLzyYceRcDd382NIjUQ/+eXMEdhqjx
	szQGmzqgltE7ybYGik7CDqIKTc/ai3WKDrj++5zV0JC6RAgk7cWOKH6IyUneDmF+c2UQagrEkE0
	WEewxDc8nv9z0mbXHHjJlyg1gJQxum8NV6J0HXN9MMOiMMylcYGxzgg7NWXoFzWO2llmD2O46eN
	uzuhIyzFcxQNjM4HzPRFiT5Eso9P19zbAjWxtAonbhBlPDUXhytOWEeU1Jgxj2UpNQ11wFvYhL/
	7Es1ZdIL8jMrBNlN5CptalkPpV5zz0hYLKFPgHkRq0KvleqoNj3tzVNDKwoedcaHCr62Ak4eUyN
	b8KJnx+AVQPslgF
X-Received: by 2002:a5d:56cb:0:b0:461:e27d:5690 with SMTP id ffacd0b85a97d-46501b5ad7emr9929533f8f.26.1781960419285;
        Sat, 20 Jun 2026 06:00:19 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4666722141csm7338573f8f.34.2026.06.20.06.00.18
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Jun 2026 06:00:18 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 16/36] classes/gtk-icon-cache: fix libdir passed to the postrm intercept
Date: Sat, 20 Jun 2026 14:59:31 +0200
Message-ID: <24ae0f2616a47fdd60af18883df0ceb8253bc1b6.1781960051.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1781960051.git.yoann.congal@smile.fr>
References: <cover.1781960051.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 20 Jun 2026 13:00:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239225

From: Ross Burton <ross.burton@arm.com>

Back in 2015[1] I fixed the libdir passed to the postinst intercept, but
I forgot to also update the postrm intercept.  This should also be
libdir_native, not libdir.

[ YOCTO #13896 ]

[1] oe-core 0fe8400717 ("gtk-icon-cache: pass the native libdir to the intercept")

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 92dd67114be325e019c149bddaf5f874f6917094)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/classes-recipe/gtk-icon-cache.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/gtk-icon-cache.bbclass b/meta/classes-recipe/gtk-icon-cache.bbclass
index fad8c4c65fa..1c573264e0a 100644
--- a/meta/classes-recipe/gtk-icon-cache.bbclass
+++ b/meta/classes-recipe/gtk-icon-cache.bbclass
@@ -46,7 +46,7 @@ gtk_icon_cache_postrm() {
 if [ "x$D" != "x" ]; then
 	$INTERCEPT_DIR/postinst_intercept update_gtk_icon_cache ${PKG} \
 		mlprefix=${MLPREFIX} \
-		libdir=${libdir}
+		libdir_native=${libdir_native}
 else
 	for icondir in /usr/share/icons/* ; do
 		if [ -d $icondir ] ; then

