Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88B3CC433F5
	for <webhook@archiver.kernel.org>; Sun,  6 Feb 2022 09:53:27 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web09.7283.1644141206766885787
 for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Feb 2022 01:53:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=TlINAIjJ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.48,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f48.google.com with SMTP id
 l35-20020a05600c1d2300b0034d477271c1so6632121wms.3
        for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Feb 2022 01:53:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=PId+2NnwLbdX46gvr2y2wScyrLir6VeO55ScfFtDuz4=;
        b=TlINAIjJoAoE5M2axVGP/3WVkpfHGKk/4EvcW0MUXAOBlSd2wvSJ6AsEChYf2cwqOl
         c205jUfseP57CVtvLklJD2/3Wr//qBnNdchxTWM7AZaXqqcUG9iXPzfTdBChSfbbsE+o
         zHAN6edPvmr2uw4p+cTY/DFk71QXP+PYuGA+M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=PId+2NnwLbdX46gvr2y2wScyrLir6VeO55ScfFtDuz4=;
        b=A3c0ef1tZreY0uuGQyHkceekC/d+ATlf4MZALmQvjoGFdzn3FPfv9Tio3dzQp7Bs6R
         ly3SGoWVY/WCRj456nIId5r4Olms33GVBMozC2mKUEyhnrMySKedgdu9Pn+MnlEbh9RG
         RbZ+AJ64sRdu4DXslTiHVQC14xvYVY5hoFgASRKdXXWineL8cwP8RWhoxBOujP24xFeD
         3L3HQXBrWfB9rymN7HdaQofy0e2uf2UfH+jgQD7vdM3NLac808sEuyX3hngBbFAyTRNI
         c2woZpydmu+hzinFilPrSVLQ+kimv7rMQq3JvQRIPNpdMIrKXZ+O+T8PuLaQfgA/cjgL
         G5fg==
X-Gm-Message-State: AOAM531W4GhjvFrNatAJ7TzIvQy6ooK8Q50kaeFtSlyX/g+lGh6PIpjH
	Wxqt7DHl1H+p6Rmvg+AiuH5nig==
X-Google-Smtp-Source: 
 ABdhPJxS6IAibA8gLjhsb6PG0tx8GxToQySuyILRDFMCv3sGTAWNT6QFeT2Z/L3y4KDYyTGBmFaslw==
X-Received: by 2002:a05:600c:264d:: with SMTP id
 13mr6368908wmy.85.1644141205093;
        Sun, 06 Feb 2022 01:53:25 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:aabf:a020:d9fb:13aa?
 ([2001:8b0:aba:5f3c:aabf:a020:d9fb:13aa])
        by smtp.gmail.com with ESMTPSA id
 f16sm6879366wmg.28.2022.02.06.01.53.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Feb 2022 01:53:24 -0800 (PST)
Message-ID: 
 <d32894f49e357e1bcd713a5ab843f43cad6ce1e7.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2 3/3] systemd: Minimize udev package size if
 DISTRO_FEATURES contains systemd
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>,
	openembedded-core@lists.openembedded.org
Cc: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
Date: Sun, 06 Feb 2022 09:53:23 +0000
In-Reply-To: <16D124152B709F2D.20549@lists.openembedded.org>
References: 
	<20220202073525.3413-1-stefan.herbrechtsmeier-oss@weidmueller.com>
	 <20220202073525.3413-3-stefan.herbrechtsmeier-oss@weidmueller.com>
	 <16D124152B709F2D.20549@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 06 Feb 2022 09:53:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161395

On Sun, 2022-02-06 at 08:10 +0000, Richard Purdie via lists.openembedded.org
wrote:
> On Wed, 2022-02-02 at 08:35 +0100, Stefan Herbrechtsmeier wrote:
> > From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
> > 
> > Link udev shared with systemd helper to minimize the udev package size
> > if DISTRO_FEATURES contains systemd.
> > 
> > It is only usefull to link udev static with systemd helper if udev
> > should be installed without systemd.
> > 
> > Signed-off-by: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
> > 
> > ---
> > 
> > (no changes since v1)
> > 
> >  meta/recipes-core/systemd/systemd_249.7.bb | 1 +
> >  1 file changed, 1 insertion(+)
> 
> 
> This seems to break some of our tests:
> 
> https://autobuilder.yoctoproject.org/typhoon/#/builders/72/builds/4708
> https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/3121
> https://autobuilder.yoctoproject.org/typhoon/#/builders/80/builds/3085
> https://autobuilder.yoctoproject.org/typhoon/#/builders/86/builds/3089
> https://autobuilder.yoctoproject.org/typhoon/#/builders/87/builds/3127
> 
> Presumably it causes extra dependencies to be pulled in causing the file overlap
> where there was previously none.

Thinking a bit more, I think this needs to be:

diff --git a/meta/recipes-core/systemd/systemd_250.3.bb b/meta/recipes-core/systemd/systemd_250.3.bb
index 2b6bfcc2c25..7851c4c16a7 100644
--- a/meta/recipes-core/systemd/systemd_250.3.bb
+++ b/meta/recipes-core/systemd/systemd_250.3.bb
@@ -69,7 +69,7 @@ PACKAGECONFIG ??= " \
     ${@bb.utils.filter('DISTRO_FEATURES', 'acl audit efi ldconfig pam selinux smack usrmerge polkit seccomp', d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'wifi', 'rfkill', '', d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'xkbcommon', '', d)} \
-    ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'link-udev-shared', '', d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', '', 'link-udev-shared', d)} \
     backlight \
     binfmt \
     gshadow \


which I'll test...

Cheers,

Richard


