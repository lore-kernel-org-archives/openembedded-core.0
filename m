Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B6C7C54EBC
	for <webhook@archiver.kernel.org>; Thu, 12 Jan 2023 14:59:58 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web10.57035.1673535596550079047
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Jan 2023 06:59:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=UEfWEWKM;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f49.google.com with SMTP id h16so18346679wrz.12
        for <openembedded-core@lists.openembedded.org>; Thu, 12 Jan 2023 06:59:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:date:cc:to:from
         :subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=AhIk6tJx++v/JL1s98Vwc1vDIx8bNWULfae00i3wBRU=;
        b=UEfWEWKMsWErW6xfVt567qB2uXLgUpz4RR4M8WcpxKULdCNnf8TQXMgrhQFsxJSlEk
         L8Qm5X4eGhOoQLuYi2K/cMHAW0EqGsFmvn/VT5hEOF9oCxevGQB9Ar5acRipyOtP5Arn
         tth9kmDkTyb7dslyJJUz+A69NP1PyvX8gAWjM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:date:cc:to:from
         :subject:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AhIk6tJx++v/JL1s98Vwc1vDIx8bNWULfae00i3wBRU=;
        b=1VkdurC9Z0KIAwPxd96eg2IxopngqgdFcyHBtXhB4MBete5hmNiDQSuGEbHgqb66Kf
         67mNE1U2UKHMwomHHaCPS6sgvwaPXUnVo/F44MI0Y3HEZfRi6vV8PLUrgDl7MtpHx4a0
         nBdrzqvIRZVrsG1jSFqDz9UI7nDZsvYyUsuEbsDiYGR/B+JOE6KtQkowzznf1zTF++TU
         dcE1BJs7XwnhmWIg0mC7juWjqcdJKHwZuoz1JsQF3jhsIuOSZosEJ85IK8Upoqaovv0y
         Zh/dBQf553U360AzHpR8aM4MOBudcyE64+K7L8aoNZPVtPbTV0/GqAXkCwn7LhD1ztyi
         Si8g==
X-Gm-Message-State: AFqh2kpbFjUHT/kxeC6ER6LmjBZVoHhNWNeL7mar7Konlc2yC69ryYSQ
	/EdrEKNrqB+ccBxVXVk8QoGfjVO97zPk24qC
X-Google-Smtp-Source: AMrXdXsJGrinVIlrISOJSf2bliJ+jf7/VO/50fmWPuLjetpmIsbeAwRbl+cxdrL17Z/FGOaZUibX0g==
X-Received: by 2002:adf:eb08:0:b0:242:e73:f636 with SMTP id s8-20020adfeb08000000b002420e73f636mr58941672wrn.4.1673535594839;
        Thu, 12 Jan 2023 06:59:54 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:a64e:9cdc:56b5:438b? ([2001:8b0:aba:5f3c:a64e:9cdc:56b5:438b])
        by smtp.gmail.com with ESMTPSA id bj27-20020a0560001e1b00b0023659925b2asm17182767wrb.51.2023.01.12.06.59.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jan 2023 06:59:54 -0800 (PST)
Message-ID: <26317e9b105bc4d22a020c74e49e067b8a5af900.camel@linuxfoundation.org>
Subject: problematic interaction between buildtools and virgl
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>, Alexandre Belloni
	 <alexandre.belloni@bootlin.com>
Date: Thu, 12 Jan 2023 14:59:53 +0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Jan 2023 14:59:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175800

We've been seeing AB failures like:

https://autobuilder.yoctoproject.org/typhoon/#/builders/56/builds/2103

which looks like dri needs to be installed on the host but the problem
is in fact buildtools. Taking the opensuse154-ty-2 worker where this
failed:

rpurdie@opensuse154-ty-2:~> pkg-config --variable=3Ddridriverdir dri
/usr/lib64/dri

but using buildtools:

pokybuild@opensuse154-ty-2:~/yocto-worker/oe-selftest/build> source buildto=
ols/environment-setup-x86_64-pokysdk-linux=20
pokybuild@opensuse154-ty-2:~/yocto-worker/oe-selftest/build> pkg-config --v=
ariable=3Ddridriverdir dri
Package dri was not found in the pkg-config search path.
Perhaps you should add the directory containing `dri.pc'
to the PKG_CONFIG_PATH environment variable
No package 'dri' found
pokybuild@opensuse154-ty-2:~/yocto-worker/oe-selftest/build> which pkg-conf=
ig
/home/pokybuild/yocto-worker/oe-selftest/build/buildtools/sysroots/x86_64-p=
okysdk-linux/usr/bin/pkg-config

which means the pkg-config from buildtools isn't falling back to host
pc files. We should be able to set PKG_CONFIG_PATH in the sdk to
account for this, e.g.:

pokybuild@opensuse154-ty-2:~/yocto-worker/oe-selftest/build> PKG_CONFIG_PAT=
H=3D/usr/local/oe-sdk-hardcoded-buildpath/sysroots/x86_64-pokysdk-linux/usr=
/lib/pkgconfig:/usr/local/oe-sdk-hardcoded-buildpath/sysroots/x86_64-pokysd=
k-linux/usr/share/pkgconfig:/usr/lib64/pkgconfig/ pkg-config dri --variable=
=3Ddridriverdir
/usr/lib64/dri

the hard part is figuring out which paths the host pkg-config uses.

Cheers,

Richard

