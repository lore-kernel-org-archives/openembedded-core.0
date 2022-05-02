Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 334CEC433EF
	for <webhook@archiver.kernel.org>; Mon,  2 May 2022 23:03:19 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com
 [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web11.4333.1651532594421276124
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 May 2022 16:03:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=P6GNjIDf;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.179,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f179.google.com with SMTP id v11so3942921pff.6
        for <openembedded-core@lists.openembedded.org>;
 Mon, 02 May 2022 16:03:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=+p5g+kdtUh9MEZTMZp5bvttxn3QpsSwUc/Tr6mdIh/c=;
        b=P6GNjIDfU/9QSOsL28J7zqsMGlFmEmY9mdswaUg6l6H9902E99JO69IG/VtIpUSsaG
         eSIFgUSrq7dbFmqQ5BHsa+V0e8UBr7Yb1JqQlIYsg2Wi87bUaWGNi+VBGPUkZ6PLzlo+
         zgqeO2KH/Vy5TshdAyLrPRospp67ch5QKZMayL+yFXqFgIXdAW+o/1gglb4GTBm/Wh1x
         JIHWTj1m31BpC/oT7MD3+JPl1eUL/YKm4WfmWmpo4aKlEF51I2PBjB7t+KO9PX/Zro6R
         BkCWtkP+ZE+5ft/Qx/G//3hSHGPU6RYnwuu6bRw/81OoBL7fpxJVX/YNmma3hqNxzVXA
         vL3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+p5g+kdtUh9MEZTMZp5bvttxn3QpsSwUc/Tr6mdIh/c=;
        b=N+EjZg+Rn2DgHekYEc0T9i6wzCkrR4h69T6XKq4mSSIU372K1A8oarY6cUpxAwtiIS
         Q2JYc/Kz4asx9/TmYHCb9mHKZAfvl8ScQIB6rYPUENWYQ0eiFrLAEdWlBUmBYb4YWtVI
         R3BaRQJBVQvVm4UstmqBxHj/LqyYznLRuCAFH4Bx2QY9CFl6DS1ZsqIVKSYZUsXJ07Ne
         35eZiL0wR6BjEZ24GflLykOWr8TPviRfWW41uZfG9ln5NZuqrfEqnnRGx26MkToYNN3k
         dQeDcMi1mVZdkS3mt7bVc9ahvymVlWEpHyNgVY0DiiVkvp5m3qIUVpnoNAQXMNONLNU3
         6Syg==
X-Gm-Message-State: AOAM532DWPJ4wNdnUgtIx0WnzR3IL2tt4KyI2AVmR7cJUXCbJRsZzP3z
	xNa1VAry4eIgEzPwVDa1236T9uRpO6tJhQeGlBg=
X-Google-Smtp-Source: 
 ABdhPJxSNjIFvPwIrEYb8Oy/hupMbT2nagJ2LmOjzOqjuWxpPJ5Cf0YknDMvsek1jmvUCgaX9hBCaA==
X-Received: by 2002:a05:6a00:10cc:b0:506:e0:d6c3 with SMTP id
 d12-20020a056a0010cc00b0050600e0d6c3mr13636240pfu.33.1651532593229;
        Mon, 02 May 2022 16:03:13 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 s7-20020a170902988700b0015eaa9aee50sm2002945plp.202.2022.05.02.16.03.11
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 May 2022 16:03:12 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 3/9] devshell.bbclass: Allow devshell & pydevshell
 to use the network
Date: Mon,  2 May 2022 13:02:48 -1000
Message-Id: 
 <214a2fe628801af3fde5b540c31f1c515f6c855f.1651531749.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1651531749.git.steve@sakoman.com>
References: <cover.1651531749.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 May 2022 23:03:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165182

From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>

Otherwise it will fail if using OE_TERMINAL = "xterm" with the not so
helpful error:

  xterm: Xt error: Can't open display: localhost:0.0

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit ba53fc3bcecfe32401471dc1008c7ead96504150)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/devshell.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes/devshell.bbclass b/meta/classes/devshell.bbclass
index 76dd0b42ee..ad9f267848 100644
--- a/meta/classes/devshell.bbclass
+++ b/meta/classes/devshell.bbclass
@@ -21,6 +21,7 @@ addtask devshell after do_patch do_prepare_recipe_sysroot
 DEVSHELL_STARTDIR ?= "${S}"
 do_devshell[dirs] = "${DEVSHELL_STARTDIR}"
 do_devshell[nostamp] = "1"
+do_devshell[network] = "1"
 
 # devshell and fakeroot/pseudo need careful handling since only the final
 # command should run under fakeroot emulation, any X connection should
@@ -154,3 +155,4 @@ python do_devpyshell() {
 addtask devpyshell after do_patch
 
 do_devpyshell[nostamp] = "1"
+do_devpyshell[network] = "1"
-- 
2.25.1


