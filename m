Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71583C74A44
	for <webhook@archiver.kernel.org>; Thu,  9 Mar 2023 22:58:35 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web11.5725.1678402714224112498
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Mar 2023 14:58:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=OfKvX9P0;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.44, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f44.google.com with SMTP id bo22so3557937pjb.4
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Mar 2023 14:58:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1678402713;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FGN6eAlg8mmLHs/bjDT+antBibI3/U3B+dhZgUREaOg=;
        b=OfKvX9P09qdMG3s10wGJ7YsDRzmWiqGDJz77FcjjsVAQIVbyxiGPwWdUjOEG0sx6fV
         XGeu6U6Vj8In9P82Q3eVPysvDiv0lopnF6h3twyGqf+zIefYQYziqZ+QbyTlfJlMivEK
         hTUKSn2cxKGQmTOA2Lj/NpA5OUOsV8jz1Me0+a9/sFXa7SOCZlKeWbWlUxakA3w3u5Of
         qFeBqpKPXC2AgbrgNyvbBJR3xL3Cl3sl6R6w2sIuaTaJhvZxknT82lfS4dtFGm1IfZuX
         7ctI47pmdk/jRzQSGmcZoxV/BTeApSK92ojKIMsldUgbfNBQOXiwSvw3DG4rM/gJUeAx
         iMLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678402713;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FGN6eAlg8mmLHs/bjDT+antBibI3/U3B+dhZgUREaOg=;
        b=8MIIMHcoVi5EqzTla2saMs6fgRXPVSuHfyHAQtSDJqtQeFotkLJKBc5ZoSgowq9ZQo
         FRo1kIPx4wxIduW9rVRHP9syP+vJHweCIXAiaD+DESjOiPHiaY+a6A2eoPnKQyiED4pm
         C052SArrtU+pw9ou75Hkf1G6VBqXp5xBq21G0ekFXKYsKAI0Uu2Y0MmbNR543+axI/bV
         oJNDbDIRnixWTivuVP9cmokJCfob9zANUa69crkSTtzAX0paknHTGbFtzNA3nEi0eAqh
         /l0PA6bHPHIEqfIWzGGlFg8F54lM2UuN1+FdZZxJ3JLmFdhjip3ibNM17GsDmSsah1gC
         Vk0Q==
X-Gm-Message-State: AO0yUKUg+ADfkNdclw/B+0zVeEI0ApIWjGHjdb+LbUJB/M+m/Vg/ZFMR
	HtHL8J8Sb86PfkeowFCa+5CyUon9CJHHBauzUBQ=
X-Google-Smtp-Source: AK7set+ILtMK4TJS/M4dFh49Usjon/QT044wshEBl3MKoy4idYLXjBO3LlD106C85XyJbzU/LAXyFg==
X-Received: by 2002:a05:6a20:1448:b0:c7:770a:557f with SMTP id a8-20020a056a20144800b000c7770a557fmr30285309pzi.50.1678402713216;
        Thu, 09 Mar 2023 14:58:33 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id j9-20020aa79289000000b0058db8f8bce8sm89717pfa.166.2023.03.09.14.58.32
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Mar 2023 14:58:32 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 12/27] binutils: Fix nativesdk ld.so search
Date: Thu,  9 Mar 2023 12:57:47 -1000
Message-Id: <12f9527b698f98de66ef53d107626b45ce7194c5.1678401759.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1678401759.git.steve@sakoman.com>
References: <cover.1678401759.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Mar 2023 22:58:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178285

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Currently binutils in buildtools is searching for /etc/etc/ld.so.conf
which makes no sense. ld_sysconfdir already contains /etc so we need to
drop the /etc from the fixed string.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit ccd28c418ab8390118d738fbe914395b5c2a1f75)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...3-binutils-nativesdk-Search-for-alternative-ld.so.conf.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/binutils/binutils/0003-binutils-nativesdk-Search-for-alternative-ld.so.conf.patch b/meta/recipes-devtools/binutils/binutils/0003-binutils-nativesdk-Search-for-alternative-ld.so.conf.patch
index 4fe5520010..9c825df5ab 100644
--- a/meta/recipes-devtools/binutils/binutils/0003-binutils-nativesdk-Search-for-alternative-ld.so.conf.patch
+++ b/meta/recipes-devtools/binutils/binutils/0003-binutils-nativesdk-Search-for-alternative-ld.so.conf.patch
@@ -65,7 +65,7 @@ index bfa0d54753a..0d61a3209ec 100644
        info.path = NULL;
        info.len = info.alloc = 0;
 -      tmppath = concat (ld_sysroot, prefix, "/etc/ld.so.conf",
-+      tmppath = concat (ld_sysconfdir, "/etc/ld.so.conf",
++      tmppath = concat (ld_sysconfdir, "/ld.so.conf",
  			(const char *) NULL);
        if (!ldelf_parse_ld_so_conf (&info, tmppath))
  	{
-- 
2.34.1


