Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 329F9C433FE
	for <webhook@archiver.kernel.org>; Tue, 10 May 2022 14:37:45 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
 [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web09.10850.1652193464479647415
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 May 2022 07:37:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=Mr/R0/V5;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.180,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f180.google.com with SMTP id j14so16922000plx.3
        for <openembedded-core@lists.openembedded.org>;
 Tue, 10 May 2022 07:37:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=OR5F/UKHJRB8fcRaa0adP3fI56BeB2xkyb/uk3pfy98=;
        b=Mr/R0/V5pe8zSne/johXdZAqxqHzr5B4kaYUV5+55oc07NeUgzmuehotOnFFu8qJdd
         cHmlSImoigWj+Y272SmGEo5iZQ5W5Iv8GH0onzvtVvaZfpUgRctYOu/wYQ+X4sxhB2Yj
         fac++e14yXsUYRkmzV+sWkRtfW6HEzvfPuXlyBnZ/Pky746FvMFEjdIkrYn4/ivT3COg
         ga+sYSYTM2mEX9xAsYqt/kynd5O2nF9EJid8BwViYa9xeIsxO6ZPxFcJDelyiP78r7hD
         Y5h9MZTVkbJO87lVZtvb8StI/T7oVXA8ZxS0B92qknD+bpQ7ogN5+AP5UsrLwUQ4DZjy
         6IKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OR5F/UKHJRB8fcRaa0adP3fI56BeB2xkyb/uk3pfy98=;
        b=ZN0JZuGu1WGIjigXdbWwwwko1FmAzJti7ukSfoNlvFG6iofz2zUbTFkBm3mE2HqqbY
         D3SmR4i36Hyws3nl05E/vG4Ucys/1UPPo/fZywVvD1WD2oVY0DwcfB+KC15SJrgSuGfn
         r/cyeCwp6VqzMJI4ny25CYAjp9wrK0asU3VjKTc3jXENweX5rgmnXdL1RpuS7fKoPrO5
         bCnUN0SFwapphVZL3XTwospe8slOdwwBl865yYhpdW3/HGCrcga0T7fL7HJc83QtKa5O
         9ITbgMv0Y7GzCKJGfA9wlYpENXjN/CwCQfpNTl/hMbaNq6Oe5Zgj8kFtYpZC1o2mu1oS
         AWFQ==
X-Gm-Message-State: AOAM532xScXyivmoUyibrPwsHnDMZchBn5Ft9tdugGnR4NOux+tXsRmf
	jm9QhWSRz989AAG1qUtVlbyardhv3svmn+tA
X-Google-Smtp-Source: 
 ABdhPJytKSeTOeycGhR9V4D4zL+D80FeLPo2/SXTbg9DRnR0FF2K4xn1d4Wzgu9nMKOmcawb/6J08g==
X-Received: by 2002:a17:90b:35cb:b0:1dc:7905:c4c1 with SMTP id
 nb11-20020a17090b35cb00b001dc7905c4c1mr302061pjb.95.1652193463138;
        Tue, 10 May 2022 07:37:43 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 fv18-20020a17090b0e9200b001cd4989feb7sm1973161pjb.3.2022.05.10.07.37.41
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 May 2022 07:37:42 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 02/40] pulseaudio: conditionally depend on
 alsa-plugins-pulseaudio-conf
Date: Tue, 10 May 2022 04:36:41 -1000
Message-Id: 
 <1800c06e254d44b6439dee82b7a4f4b678479b62.1652192957.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1652192957.git.steve@sakoman.com>
References: <cover.1652192957.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 May 2022 14:37:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165419

From: Justin Bronder <jsbronder@cold-front.org>

The alsa-plugins-pulseaudio-conf package is only enabled when
DISTRO_FEATURES contains pulseaudio.

Signed-off-by: Justin Bronder <jsbronder@cold-front.org>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 54e9b8f308f28bb2db37f5ea5b85e6a1608c0516)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-multimedia/pulseaudio/pulseaudio.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
index a69dd32bd7..821ce7d1df 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
@@ -254,7 +254,7 @@ RDEPENDS:pulseaudio-server = " \
 # If the server is installed, it's usually desirable to make ALSA applications
 # use PulseAudio. alsa-plugins-pulseaudio-conf will install the configuration
 # that makes the PulseAudio plugin the default ALSA device.
-RDEPENDS:pulseaudio-server += "alsa-plugins-pulseaudio-conf"
+RDEPENDS:pulseaudio-server += "${@bb.utils.contains('DISTRO_FEATURES', 'pulseaudio', 'alsa-plugins-pulseaudio-conf', '', d)}"
 
 # pulseaudio-module-console-kit is built whenever dbus is enabled by PACKAGECONFIG
 # but consolekit depends on libx11 and is available only for DISTRO with x11 in DISTRO_FEATURES
-- 
2.25.1


