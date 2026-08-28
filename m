Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6F66C61DBD
	for <webhook@archiver.kernel.org>; Fri, 28 Aug 2026 19:38:44 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3000.1787945918772530811
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Aug 2026 12:38:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=Uo+sJW1Y;
 spf=pass (domain: smile.fr, ip: 209.85.128.42, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-49a97714f5dso10122645e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 28 Aug 2026 12:38:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1787945917; x=1788550717; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=4YWkqBmrB9asWPZJsJ0UilXpgPLiqNBbtY2GpvU25s4=;
        b=Uo+sJW1Y+QgKsxie/zrl2o2WQrpY50l0Sueie66aN+1tA7JA3Ec+eXZXKQ8r4DPhmm
         PFIfpkSLniTqtq11gls8ME9WIp3EFdz7eKi5WFyDz/F6wuAhBCLt+czGJrLr/3LmYzZF
         bOrvnCTgN/IqYfYhOMFxu/oH/lUqtxryCqUdw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787945917; x=1788550717;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=4YWkqBmrB9asWPZJsJ0UilXpgPLiqNBbtY2GpvU25s4=;
        b=eIL/nVS0aHaD8PuvHwqU8/OO+NIa+k5EktQbR6/v+kFGVp9GC8voEpNMaEjGSOLNRi
         bv3gZv84ETVyLQS4TxRSBdsp3Jl6PIgpQW2Jyzs9CmBwIBO1ZjBIZTKLnoGEnM1S/yik
         Ib7069/nr5XuNCOfgTDTpchWfDUbTYBCv1Ipp30xQL2EqEXywvkcZrUfNY4bT7sJeqTH
         R/OC5SaNmMXEZ6GWDfCLQqnbdEt3gdmFGb2DDywbAyk0UUnWlt6oRCZwGQWU1PXWIgcr
         2UFOwEF3bCvtqZRvKGySsMGEh8vUkzLkYCBbk4soClWz1L4g4PRSXP2IfUTZt69ks+uf
         TtJA==
X-Gm-Message-State: AFuF++lmXzite26635Bmm9TQ6dtkx2IeYO7g6tc47NdebeOR4AHC2Vpr
	Dc6Pf7Kw8ebiPFEIklZ7uOV9a9XUq4pYDb+tGPsX4mJlGEWOP7z3L3plIEW8WJ0nKuIjwCBI95q
	QVPsX954=
X-Gm-Gg: AR+sD13YbpdUv049DrwGMJny3jQWhuuK2SiY1jYa+9VdjQFnQpGc2S3nO/dUkTVGV5E
	YvU+z5blzm3Iq8aaT6TnLXjONlR0lG4lW8/X6/9XIsFE8LSjY3+OjDysQq/K/f0NxAn0ALPTNzB
	qBieN2D7zFp5MwdqCFoRsiqe7FiaIsHrIJS6uYCUhJNEpvV6TglMAUv7QR1OSQ5BLS0loXidpf/
	USn1mg5frroBAIdb+4q+kSUNY6lygihIr5LzVUBMTHQMpozayd+pxnntHrPj0PJdZkWaWYuIUtQ
	EpTYVbbQ4CMTHpQBFzj2an2qaWAY/MQnL/O0mnwLlpRq5je63Jcohx7n1voXYKvNoDFaTQuwy+r
	Usy6pL3bAsn8abt5JBpBvogAnJoVaU3s5aRPPdUxxldYjOUjPAOmO6MegTKy+VTPnsk/uNsJxOi
	cmJqKiFjssBZPWemKNy9VFcdw1ouxTV3x3rIg4XpCbDJhpZo7dpdJCYVotU7nV58YDStjFw4tSh
	QakOsUEEb0n0SuGDE+0qQ0YcY6MF3WWuFkc0HxAfR+tk/zAvVU7uyhBofRkEYlT
X-Received: by 2002:a05:600c:4453:b0:499:8777:ccba with SMTP id 5b1f17b1804b1-49b91c486abmr119772625e9.12.1787945917034;
        Fri, 28 Aug 2026 12:38:37 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b497fa9c5sm147703115e9.4.2026.08.28.12.38.36
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 12:38:36 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 55/56] pseudo: Update to 1.9.10
Date: Fri, 28 Aug 2026 21:36:05 +0200
Message-ID: <89a0cbb92825ced445a25242bd5af681fb1a35ab.1787945536.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1787945536.git.yoann.congal@smile.fr>
References: <cover.1787945536.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Aug 2026 19:38:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244616

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Pulls in various important fixes:

Makefile.in: Bump to 1.9.10
test: various: Move to makefile compilation
test-bash-exec-env: Add bash env test case
test/test-openat2-func.c: Remove unusuaed saved_errno
pseudo_util.c: strchr now returns const char
pseudo_client: remove the unused pseudo_prefix_dir_fd
pseudo_client: step around all of pseudo's own fds in closefrom
pseudo_client: step fully past pseudo's own fds when computing startfd
makewrappers: Avoid efault workaround if using AT_EMPTY_PATH
ports/linux/guts: Add __open64_2 wrapper
Makefile.in: Bump to 1.9.9

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 4232a7cc5fa28828fdf3223b3c0a6432c8c1e670)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-devtools/pseudo/pseudo_git.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
index 9f02d905681..d0559f6c9f3 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -1,6 +1,6 @@
 require pseudo.inc
 
-SRC_URI = "git://git.yoctoproject.org/pseudo;branch=master;protocol=https;branch=master \
+SRC_URI = "git://git.yoctoproject.org/pseudo;branch=master;protocol=https;tag=pseudo-${PV} \
            file://fallback-passwd \
            file://fallback-group \
            "
@@ -12,8 +12,8 @@ SRC_URI:append:class-nativesdk = " \
     file://older-glibc-symbols.patch"
 SRC_URI[prebuilt.sha256sum] = "ed9f456856e9d86359f169f46a70ad7be4190d6040282b84c8d97b99072485aa"
 
-SRCREV = "ca47829825f297d7bf83665c0541a9de4aa78009"
-PV = "1.9.8+git"
+SRCREV = "2a5521e9573049864e07907415f1fee28232d90c"
+PV = "1.9.10"
 
 # largefile and 64bit time_t support adds these macros via compiler flags globally
 # remove them for pseudo since pseudo intercepts some of the functions which will be

