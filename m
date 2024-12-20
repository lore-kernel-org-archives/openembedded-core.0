Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDB5AE77188
	for <webhook@archiver.kernel.org>; Fri, 20 Dec 2024 09:42:40 +0000 (UTC)
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
 by mx.groups.io with SMTP id smtpd.web11.148723.1734687750425681458
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Dec 2024 01:42:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UoVp7N5+;
 spf=pass (domain: gmail.com, ip: 209.85.219.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-6d88cb85987so14474436d6.1
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Dec 2024 01:42:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734687749; x=1735292549; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=SY6f290YZtg0XMZQUQ2ZaCzAh4WsUVk3ygMlUe5eotM=;
        b=UoVp7N5+zM+3a2g7dHg5PRe6gr8VCugj7EsvJCmQP9kL8pivQCxjVE45mMM4NHFizY
         30pGzpr3jr236HiR0k/zxESWgyqjy5Se6G0xjmmBWWd2ot2ll717ny9O2wWstsdO2GHE
         Z3sSLg0u9IjDmBG4wSMAEzswhk0/PUeKrG5dam0u7m7qnqqhiYxd0+9nkquLLf6vX9qf
         1kQ0s2oP+bh9b4ica5YGLRU0u8U7TKb1m2tiJNHN7ftELWGceVjhkWil+EVXuox/Ngky
         RAlPLnMjSIrIi41FnZj3oUQII6cynvzrQLx3E4JzhuLpO0YMqFtjq59WF59r10V6S5v4
         eo3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734687749; x=1735292549;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SY6f290YZtg0XMZQUQ2ZaCzAh4WsUVk3ygMlUe5eotM=;
        b=OtyM0hOzzfDGTvxntIlDh/DhmlM/e6haq6pCs0PJ+Z1VtRE771ZZseKmI5OZnCF4N/
         ubb/yvcSvIPCjREQ0zM5i9uEqn9JWytZsTJEUrFbQGkCrUcXGkwJfG902SbhAks4MYqb
         JUleVbg2vO6BrjHI0f9o6gxY43njqkC8cFoIuqB364plyxKxH+fXMuf4BQV11lwkeXsX
         IXZcUiOgpTFOUChWGg4Pe63Oh1PwKb7mq4SlfdxaD8jJaxaZkqYR9UHEGlum01E40CAl
         cmmfjW/Muc6E1cJjlOHFZ2iga6MWkeD9m0GHH1MOuyK69DV8idUGzoSAiGCRX4kXKL2O
         GfYg==
X-Gm-Message-State: AOJu0Yz2R4PXBmO4GWW/2lsiawCY6OqXaUQkl3W1MSfHG4YVXHPCAL8b
	z7WOWnzR1aY6N4WyR7PDN3UIHTfixhNXUWuWgPYUFJec+DPmdvpfvpmadozAcZDkvIwqE4Vmh3b
	SCacq2h7u5IVO2w886eCuKkcZIVs=
X-Gm-Gg: ASbGncuaXhzVo0Jcdz/JzwNNiQBv6Wz1ZKbDobGm/rrOjg9wAag7yUcW0pCN6z9Y4Ga
	27RwbmckHSGvjuT+P3oc89N2wtojatIuYrkTFJnbsHN6uyD04jBt7Z3RCvq9bF6z4jv1OXh0K
X-Google-Smtp-Source: AGHT+IEv2d1xb5w23TSvuSDyq192QTteUrzxsCkOLwXw4VEl79iM/wH9JK0iXcGkgjnPLISMPlo2ry3WK50UrkSFa8Y=
X-Received: by 2002:a05:6214:19e7:b0:6d9:fb5:d496 with SMTP id
 6a1803df08f44-6dd155f4ba4mr114658606d6.24.1734687749405; Fri, 20 Dec 2024
 01:42:29 -0800 (PST)
MIME-Version: 1.0
References: <20241219222120.1188742-1-tom.hochstein@oss.nxp.com>
 <20241219222120.1188742-4-tom.hochstein@oss.nxp.com> <CANNYZj-9Jdf6eeW=SdVPnSd8vVq3m+bhO=m9SZF5KKggcfKGvA@mail.gmail.com>
 <f1df3290-445e-4525-a3e5-7d156c5a45a5@oss.nxp.com>
In-Reply-To: <f1df3290-445e-4525-a3e5-7d156c5a45a5@oss.nxp.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 20 Dec 2024 10:42:18 +0100
Message-ID: <CANNYZj_V5sxoaN=FpvpaFxfKSRNrrarR1Mcv9nuxKAADtbYXGQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 4/4] weston: Add xcb-util-cursor dependency
To: Tom Hochstein <tom.hochstein@oss.nxp.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Dec 2024 09:42:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208974

On Fri, 20 Dec 2024 at 00:13, Tom Hochstein <tom.hochstein@oss.nxp.com> wrote:
> Good question, I actually made a guess that xcb-util-cursor is missing
> from the rootfs because nothing actually links to it, so Yocto doesn't
> automatically add it to the runtime. Adding it explicitly to the runtime
> forces it into the SDK as well and fixes the above error.

This can't be the correct fix. RDEPENDS is intended only for things
necessary at runtime that aren't discovered automatically (like for
example shared library dependencies are). SDK content is determined
via DEPENDS, particularly, by taking everything in it, and adding -dev
to it. You need to see why that doesn't work in this case.

Alex

