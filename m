Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1211CC52D11
	for <webhook@archiver.kernel.org>; Fri, 20 Jan 2023 18:12:20 +0000 (UTC)
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
 by mx.groups.io with SMTP id smtpd.web11.82173.1674238307386370032
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Jan 2023 10:12:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=Y8VCNYtH;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.178, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f178.google.com with SMTP id q9so4745174pgq.5
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Jan 2023 10:12:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LvHZENQ6fLe7D2fhJ5hJuB522YhhU2pIKLPRoqq72D0=;
        b=Y8VCNYtH1k+P8jZjT0iy5xYfTwnf7KEiK7fWUpuBm/Vq6X8gwN86yOhEiTupkuKQnQ
         RQI8g+DWWuNDG336rlLcSv4tjPNXlJdx6e8vkGYxJ1DnFHaZu/vUmM2/MOZTiXcEkq49
         6vjHAU7KjeQj/FZATIrRDqeGa50iur5wJ75wwX4zUOo2bEZkWl1HwvD/LwHCaphoIdwI
         Sg2S+hyoUnsp8PlqkDxZI7uMiEKJk6PnHUm7WQtHD2EMkW3HAWIbo4UdpRHkO9i9M/nA
         L2Fgu4eYR/frRD5QznOqhUPms2p0azU6j73JmahAnx9Z4sIVdm/svNHSib6dcJJRnHdu
         vqKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LvHZENQ6fLe7D2fhJ5hJuB522YhhU2pIKLPRoqq72D0=;
        b=68uwZj0wjzFy3jUrqa7YsyEw6DbKaWYHofq7/pINYwAJhSp49T2Z/947yLwujGdTgL
         FhAxGUiG0QOng+j4hVIJSb44l5e2LA1mvsdVMq+Ha5qByE/uKcOtMMToNk2w4EqgRhkX
         c9s7fFl9xwia5n8JGSNJ3/HGHauMBQZ56dKJe5clbaQYv9ogdH6pvtnBwxADwmQXdA9W
         VIwygmFTUFFRHO0tvOKTX+/gcdV74FmMI5mjqRQktO3f4fe+90MREehUrowKY1L5bw2t
         cPbXC8QsOzNbrl9q8R0TIBsBKCZzAv4uWrPYR5DIjsF9+NFrvJGGykjVmqbG29dND6Wk
         5aZQ==
X-Gm-Message-State: AFqh2kqfdxWGhKfk4NYnTWfG0mZHJAODm5VRluHNfdmUZgpVtCFSPOPe
	3ygAR8jo2pti4806BNyD//cymOusUtw+nxse7To=
X-Google-Smtp-Source: AMrXdXuOWr8vLEAVa/DaVex8f0WOvvIyEMLeKboY2nGJogNfisz/y6gGHZHFEROnIguSkhV/+mrhTw==
X-Received: by 2002:aa7:9614:0:b0:58b:b9cc:5724 with SMTP id q20-20020aa79614000000b0058bb9cc5724mr30575971pfg.15.1674238335267;
        Fri, 20 Jan 2023 10:12:15 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-5-74.hawaiiantel.net. [72.253.5.74])
        by smtp.gmail.com with ESMTPSA id i128-20020a626d86000000b0058db8f8bce8sm8990396pfc.166.2023.01.20.10.12.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jan 2023 10:12:14 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 39/41] at: Change when files are copied
Date: Fri, 20 Jan 2023 08:10:56 -1000
Message-Id: <d887fe5886dc6bd9756835a2ca8c88db54e649f6.1674238148.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1674238148.git.steve@sakoman.com>
References: <cover.1674238148.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Jan 2023 18:12:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176246

From: Saul Wold <Saul.Wold@windriver.com>

The create_spdx code relies on patched code, if files are changed
or added during the do_configure phase they will be missed by the
create_spdx process. So we need to ensure files modifications/additions
happen in the do_patch phase.

Signed-off-by: Saul Wold <saul.wold@windriver.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 227c46fe48b64de7574f7b6b407b8c13be71b392)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-extended/at/at_3.2.5.bb | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/at/at_3.2.5.bb b/meta/recipes-extended/at/at_3.2.5.bb
index 87a436173f..c0c876a644 100644
--- a/meta/recipes-extended/at/at_3.2.5.bb
+++ b/meta/recipes-extended/at/at_3.2.5.bb
@@ -52,8 +52,10 @@ INITSCRIPT_PARAMS = "defaults"
 
 SYSTEMD_SERVICE:${PN} = "atd.service"
 
-do_configure:prepend() {
-	cp -f ${WORKDIR}/posixtm.[ch] ${S}
+do_patch[postfuncs] += "copy_posix_files"
+
+copy_posix_files() {
+    cp -f ${WORKDIR}/posixtm.[ch] ${S}
 }
 
 do_install () {
-- 
2.25.1


