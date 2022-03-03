Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AC34C433F5
	for <webhook@archiver.kernel.org>; Thu,  3 Mar 2022 15:29:11 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web08.12072.1646321343908172494
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Mar 2022 07:29:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=DhjDD23I;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.51,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f51.google.com with SMTP id u10so6766922wra.9
        for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Mar 2022 07:29:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:user-agent:mime-version
         :content-transfer-encoding;
        bh=Q4Z6pVBL4LbdnWz4xG5h892qsqouQg8B4uu2LuaC8Io=;
        b=DhjDD23I/Q6k7gtkvvruSXhI2PBXYUhu1XABMd+n4atbwZwQZ7S11CtpClaIoEU3m2
         6Cfr0ZxrQ9bSYb0le1xAiLBOs0uOjN2uc5piU09aW2684T8Z1cyK/MQL9sBLkZF/5e06
         64Kp4QnQr3eGlc40VwHeknJ0P+5iJDX+wy3zs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:user-agent
         :mime-version:content-transfer-encoding;
        bh=Q4Z6pVBL4LbdnWz4xG5h892qsqouQg8B4uu2LuaC8Io=;
        b=En8McTRGANfSxIbNwjiCNiJP79AA0aZ1Cwv0L6CBPf9RWfjEzARs+lNK2nDISCSlas
         SJUQfeG4s11K+IKWlDWUVvbWeLsxkbkyXJOevd0U+DbPIquaCSnLFG+jHT4k7mxQjfuD
         qSDJ2J+h8iQ4pZgNOZ4aT6a4LxA9vn/iVX8caQgoaUGrJi9WCOECBDcA+W+XSGxm0tI7
         zsjzLlDx1G1ojF6Xr/UzlR/5+4xaGUtEox6UOFIbxixguVQbe/d+UsZPDYiWTPMYR91M
         b15+nTagE1F2ZQYaGUH10J6aYxxh6xA1REOHvaEkhacg7HZXuxcVim2/JwZKGAvYbSyZ
         bp4A==
X-Gm-Message-State: AOAM533OjPfNhVC7G5PHOXqfN3VZF3PSiWX/vWJEXI2f6DSREzCXh/XV
	wWUXGFpHQMLoo1GFgoriF0w1++F8yY1zpQAK
X-Google-Smtp-Source: 
 ABdhPJwNYO0i4aDV6NPl/P6tPwN14SaOO4wzHdALhBsgKv/ZRjDk4Q3nD+z1WEzOHNVTPWVr1sagew==
X-Received: by 2002:a05:6000:15cb:b0:1ea:78fc:2201 with SMTP id
 y11-20020a05600015cb00b001ea78fc2201mr27774324wry.362.1646321341907;
        Thu, 03 Mar 2022 07:29:01 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:68d0:4b5c:ced3:87b1?
 ([2001:8b0:aba:5f3c:68d0:4b5c:ced3:87b1])
        by smtp.gmail.com with ESMTPSA id
 e18-20020adfdbd2000000b001e4bbbe5b92sm2498657wrj.76.2022.03.03.07.29.01
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Mar 2022 07:29:01 -0800 (PST)
Message-ID: 
 <1d823e69acf53be178df2cfd02d9c7138fcd28b5.camel@linuxfoundation.org>
Subject: Listing numbers of files in native populate_sysroot installs
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Thu, 03 Mar 2022 15:29:00 +0000
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Mar 2022 15:29:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162661

For info for people who've not seen this, you can list the number of files
installed by native recipes that are present in the current build with:

wc tmp/sstate-control/manifest-x86_64-*native*.populate_sysroot -l | sort -n

which on my local build shows:

    153 tmp/sstate-control/manifest-x86_64-alsa-lib-native.populate_sysroot
    168 tmp/sstate-control/manifest-x86_64-ncurses-native.populate_sysroot
    168 tmp/sstate-control/manifest-x86_64-xorgproto-native.populate_sysroot
    180 tmp/sstate-control/manifest-x86_64-python3-setuptools-native.populate_sysroot
    181 tmp/sstate-control/manifest-x86_64-openssl-native.populate_sysroot
    208 tmp/sstate-control/manifest-x86_64-gobject-introspection-native.populate_sysroot
    219 tmp/sstate-control/manifest-x86_64-docbook-xml-dtd4-native.populate_sysroot
    231 tmp/sstate-control/manifest-x86_64-dpkg-native.populate_sysroot
    266 tmp/sstate-control/manifest-x86_64-rpm-native.populate_sysroot
    376 tmp/sstate-control/manifest-x86_64-glib-2.0-native.populate_sysroot
    426 tmp/sstate-control/manifest-x86_64-perlcross-native.populate_sysroot
    466 tmp/sstate-control/manifest-x86_64-meson-native.populate_sysroot
    483 tmp/sstate-control/manifest-x86_64-icu-native.populate_sysroot
    524 tmp/sstate-control/manifest-x86_64-gtk+3-native.populate_sysroot
    585 tmp/sstate-control/manifest-x86_64-autoconf-archive-native.populate_sysroot
    600 tmp/sstate-control/manifest-x86_64-python3-pip-native.populate_sysroot
    748 tmp/sstate-control/manifest-x86_64-swig-native.populate_sysroot
    850 tmp/sstate-control/manifest-x86_64-shared-mime-info-native.populate_sysroot
   1945 tmp/sstate-control/manifest-x86_64-docbook-xsl-stylesheets-native.populate_sysroot
   2005 tmp/sstate-control/manifest-x86_64-perl-native.populate_sysroot
   2362 tmp/sstate-control/manifest-x86_64-python3-native.populate_sysroot
   3035 tmp/sstate-control/manifest-x86_64-cmake-native.populate_sysroot
  21246 total

Removing cmake-native's help files would probably help next...

Cheers,

Richard



