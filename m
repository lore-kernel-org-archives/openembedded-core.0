Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5E2EC54EBE
	for <webhook@archiver.kernel.org>; Fri, 13 Jan 2023 09:50:34 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web10.82422.1673603428654914286
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Jan 2023 01:50:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Jvgm+RP9;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f46.google.com with SMTP id j16-20020a05600c1c1000b003d9ef8c274bso12607678wms.0
        for <openembedded-core@lists.openembedded.org>; Fri, 13 Jan 2023 01:50:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ePY+n6ZghNFYRgELD8B0uDFKe/EAhp/JyQoVFjoQhm0=;
        b=Jvgm+RP9TsvycRSJw2PkIJWN4v7LROcC4fm33ie0AZK+qIBLX4r5cUwn+iuETIfKGE
         MwALB8EHqoJnxrU+5IKA+hPT8GXax5HZ+6kWPXoDdrjkOX/QJ4e3/DdZ8AvFixv8SmyA
         kqy0FI/i8+huThUWGiBKJ8XNpxLtjvHVuSp68=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ePY+n6ZghNFYRgELD8B0uDFKe/EAhp/JyQoVFjoQhm0=;
        b=Z/m1yA5dlGg0IlFt+sCYnjHlWnTfJ1O48UIovBKDmTtwxJa5k22fw07hlLMe+rPfHg
         DETb/slVifggM56nVzMp42CS6+l7jJwyk+JXh+3tB4vemYAGks3g/T7+GCF/YS464Lwa
         PkX/AYYt2XSBek6ZGu7BAtJrruZvXwQAwmawje2RximCESqHvi5aclCAbk9QypNXWoYl
         qtE9ZhgS/QypHEkZs3DfqCSEumMG2SgmUKPtgAwsOnSfzE2NxAoyfs95icFD6MQX8x8Q
         1FgjbB/Pvl9N13jH4BJdW4weJ1nsvrNpDBx6MULH/uoWopGOgBnHNUPbe3u0XnV24ycp
         uafQ==
X-Gm-Message-State: AFqh2kqaLUmJymlAq+0saeH/2XcCa8CKehCsc2HiE63Vcc/qb3SCfpAT
	COl0h6oRM/xHKeCuP8aUUTmCUg==
X-Google-Smtp-Source: AMrXdXv2zsrpyHKDtNP0S/lq2hfTnsLhHl8wyVvYZB+y+zC89qo+2aE8uh+9swnJVsJRDMknydQ7fg==
X-Received: by 2002:a05:600c:3b28:b0:3da:516:19ed with SMTP id m40-20020a05600c3b2800b003da051619edmr7996477wms.29.1673603426740;
        Fri, 13 Jan 2023 01:50:26 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:615d:b1e6:6cd2:7fd3? ([2001:8b0:aba:5f3c:615d:b1e6:6cd2:7fd3])
        by smtp.gmail.com with ESMTPSA id p3-20020a05600c358300b003d1f2c3e571sm32282545wmq.33.2023.01.13.01.50.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jan 2023 01:50:26 -0800 (PST)
Message-ID: <ea059c6fd86267376a501008384d57dd9c7f96fa.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] package_rpm: allow arch overriding
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Sergey Zhmylev <s.zhmylev@yadro.com>, "alex.kanavin@gmail.com"
	 <alex.kanavin@gmail.com>
Cc: "openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Date: Fri, 13 Jan 2023 09:50:25 +0000
In-Reply-To: <8eae30b2192df5bae48ad7c8eb028b868ef89e55.camel@yadro.com>
References: <20230112213301.11768-1-s.zhmylev@yadro.com>
	 <a956c7ec6640cfee5bebb41720beec74e8b663cf.camel@linuxfoundation.org>
	 <dca56133ff38a2700cdeda8832d187e8f1863a63.camel@yadro.com>
	 <CANNYZj89sJH398ksmtB-TRcTOW6_MYKsDdCie3mHe7QRvKu47Q@mail.gmail.com>
	 <8eae30b2192df5bae48ad7c8eb028b868ef89e55.camel@yadro.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Jan 2023 09:50:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175818

On Fri, 2023-01-13 at 09:14 +0000, Sergey Zhmylev wrote:
> Sure, RPM naming convention from rpm.org:
> http://ftp.rpm.org/max-rpm/ch-rpm-file-format.html
> As you can see, there are nothing about "core2_64" architecture.

We build target binaries to different levels of tuning, there are
packages which run everywhere (noarch), there are binaries which are
optimised to a specific tune and there is machine specific output.
People can inject other levels of packages as well. Giving a hint of
the kind of thing a given rpm contains seems like a perfectly
reasonable thing for us to be doing.

If you come from the rpm world, yes it is slightly unusual but as the
document above says, it works fine. We're not "in-compliant", we're
just adapting rpm usage to the environment it is being used in.

So no, I don't think we should be taking a patch which would just
confuse things for what seems to be a cosmetic reason.

Can you perhaps convince your audit team this is a sensible usage given
how the project builds and uses the rpms?

Cheers,

Richard




