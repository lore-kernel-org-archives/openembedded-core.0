Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11BB1C43334
	for <webhook@archiver.kernel.org>; Thu, 30 Jun 2022 15:28:12 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web08.26496.1656602883656226715
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Jun 2022 08:28:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Wsj3MMcS;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.53,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f53.google.com with SMTP id
 bi22-20020a05600c3d9600b003a04de22ab6so1900489wmb.1
        for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Jun 2022 08:28:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=pMKQv0CqY03D028jPYBRKxvmfLLSkOaUsfMlnz9PLBc=;
        b=Wsj3MMcSl625Hf59VxZAZxlbUs1f5MNrLqwN7m+ox+GW/+ysQ9QQ05hFhTgUbYEOrT
         Moqg/1jn7OisaJcTFjqG3dgJDxcPEj0+QQAewg9brrt5MmQuzVwZApY3QyWne6JcW34H
         4xyxQF4wbqO1OHQ39M2Xpgq3pthgrMvse9YhM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=pMKQv0CqY03D028jPYBRKxvmfLLSkOaUsfMlnz9PLBc=;
        b=k6syXmPIG0j3D/IK6ERQG7c2qG4r8rnfgm7Rmxrge6nsNjF4QBXxF9cxk4A+sCI+LE
         VpG1ZmRxwzWk/z+8dfiXQjLT8tGbZMXKCW0SS4aCqf1OC+JuNfVP6Rsj++WDj2TOHU/5
         VXdfXEoj6ymmFFwt/o7rHE7O6DObC2NJ9nVg3U7C7M6meANS6BgApAqdiUQPXR1MhVN2
         cXag0BVhTufSEykAgKUooFoJdyJrJ/pHFkbJTjrY0EaCU2CfBbhwr3o1/ZsAvSV2vZqV
         /3IX7hAlGgV+1j9Mz9Coab+AqmNikz7YJAF+o3LMkYLhHnL7HuyUc8+QyM69RokbYSGk
         l9dA==
X-Gm-Message-State: AJIora/PVuW9sifc0TbbKPBB2/rwSooLVObEgKGDTJjof7CR8T1D+2A7
	gmI63bEFgPBuI7Af/8rvg1SNOg==
X-Google-Smtp-Source: 
 AGRyM1tZquJQ51TsmSVvOaOiRNYxYRMpYu1I4x535AEY9qKePcxSdbmaFs9j0IWQx2+qqiGIoEBB0w==
X-Received: by 2002:a05:600c:1908:b0:3a0:998c:313d with SMTP id
 j8-20020a05600c190800b003a0998c313dmr11662655wmq.19.1656602881988;
        Thu, 30 Jun 2022 08:28:01 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:f06b:8b84:2b52:384a?
 ([2001:8b0:aba:5f3c:f06b:8b84:2b52:384a])
        by smtp.gmail.com with ESMTPSA id
 u20-20020a05600c19d400b0039c4f53c4fdsm3727419wmq.45.2022.06.30.08.28.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jun 2022 08:28:01 -0700 (PDT)
Message-ID: 
 <eb07e0ecfc61d8848497773025c1bb8a4b57035b.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] base.bbclass: Add sstate-cache dependency to
 GCCVERSION
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Tomasz Dziendzielski <tomasz.dziendzielski@gmail.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>, Jan
	Brzezanski <jan.brzezanski@gmail.com>
Date: Thu, 30 Jun 2022 16:28:00 +0100
In-Reply-To: 
 <CAJkqNs3CpSbHOEeEBQefHf0vu_cETZ2oAe0MExETSVGUEi1q+Q@mail.gmail.com>
References: <20220629130830.48974-1-tomasz.dziendzielski@gmail.com>
	 <d0ea870012451b209c23dd76627aceee97530ef1.camel@linuxfoundation.org>
	 <CAJkqNs3CpSbHOEeEBQefHf0vu_cETZ2oAe0MExETSVGUEi1q+Q@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Jun 2022 15:28:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167413

On Thu, 2022-06-30 at 16:14 +0200, Tomasz Dziendzielski wrote:
> Would setting dependency to SDKGCCVERSION be more acceptable?

No, it wouldn't. It doesn't address the manjority of my concerns.

>  That way native recipes will not depend on target gcc version.

The native recipes shouldn't depend on the SDK gcc version either.

> > I'm guessing what has happened in your case is that a
> > TMPDIR as reused after changing gcc version but something didn't
> > rebuild, probably as ${S} =3D=3D ${B} and hence ${B} couldn't be
> > cleaned
>=20
> The problem is not that it didn't rerun the make or didn't clean the
> ${B} or ${S}. After changing GCCVERSION the nativesdk-mgen is taken
> from sstate-cache.

I don't believe that is the issue. I don't have "nativesdk-mgen", but
taking nativesdk-sed as an example:

$ bitbake nativesdk-sed -S none

(to dump the signatures for that recipe)

$ bitbake-dumpsig tmp/stamps/aarch64-nativesdk-pokysdk-linux/nativesdk-sed/=
4.8-r0.do_prepare_recipe_sysroot.sigdata.*

shows:

Hash for dependent task /media/build1/poky/meta/recipes-devtools/gcc/gcc-cr=
osssdk_12.1.bb:do_populate_sysroot is 4a58e102e0d4e2652a7f960e728b5ae3465a0=
3a9fe6c26135ab6b4dc5b89b951
Hash for dependent task virtual:nativesdk:/media/build1/poky/meta/recipes-d=
evtools/gcc/gcc-runtime_12.1.bb:do_populate_sysroot is 3bcf5017659d63c6e744=
140dde8db8a9e37a412a38924ab5f1031337dec44198

amongst other things.

i.e. the nativesdk recipes *clearly* do have a dependency on the gcc
version used for nativesdk.

Cheers,

Richard

