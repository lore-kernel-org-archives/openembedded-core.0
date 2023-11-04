Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30871C4167B
	for <webhook@archiver.kernel.org>; Sat,  4 Nov 2023 10:29:34 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web10.7113.1699093767668249763
 for <openembedded-core@lists.openembedded.org>;
 Sat, 04 Nov 2023 03:29:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TP5d7Qaw;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4079ed65582so22397295e9.1;
        Sat, 04 Nov 2023 03:29:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699093766; x=1699698566; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=RzbyTedT9JIBqv/5PRNuoB3Li9R5ADno3YRUD0cTICk=;
        b=TP5d7QawcRx/Gl0zpCMuUzgIdclGVItWq8fpOTTCkLv1ffoA4zuf1QZd+N3nh5RUcg
         CTBFsYmly4dkHCmv1ytqEHaUVOkWrpjTbQ7Timx34wDeRvuDJXF6WJxzVPA5qi+UYnfb
         Y26h9jT3ef112ooTLitkHRDqE0utegy6GVGWDy9OaI2PrXfTp5pgzzPD7upB71+L8fd4
         KHXhVm4MQ84ETRcQRYG4hXrveDzyUT8FKiuHMeo3okUa/bDgtStrwCUOa/HcQkNFLVvA
         y4yFPgAhm0CXzHy/wDQblO/Jv/Hhwoi2hmSzWXNJCOzEx+XFuxYSo/hbRRCBX2iVqbnz
         THmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699093766; x=1699698566;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RzbyTedT9JIBqv/5PRNuoB3Li9R5ADno3YRUD0cTICk=;
        b=IciUmm9fp3w0b+9vpMohlOnPpIkq14reGL9jhlUYhnCve6cZ9rNP4hPWZGUBHFe+GX
         1Wnk/jJD5lNVqSLWk3Zy6n2fSRRM6+wdh67AI4o2K7ReQYhDJzIsvSOgACNmINRlNikJ
         DREZL6dx9kkVmgt8F06jwMGXSBFKhETc8B1QCunpp4JWKRiYQJPlJ8ZuBrhywMc7+JDL
         BarDUPrZS5dzxQ5KFt4tEvFcv66HPpaj6xoaI3zb6TKwotYjcUTSYv/WagvNeIIjN0qh
         iiCbhhFePUgT9b9ckxlqXZkK2tMgELqcVjLqmroLK3LNTMsDXbQR4oKBa+ycypKFYn/R
         AZ3A==
X-Gm-Message-State: AOJu0YyFy3awuj9C5oX+Ye0fXfYWbcC3nnmG1jNNaK8b3DJ45u3ETlsQ
	oBSLHngu5wKYNjCnQU8qCYk=
X-Google-Smtp-Source: AGHT+IGYXUNaBcRjEDakSFAY9igKG9I9qq1aPgsGtT2R2YqfQ6aFoKtmObIbtegwXhOUF5I0rFxdzg==
X-Received: by 2002:a05:600c:1ca2:b0:408:3963:5bfd with SMTP id k34-20020a05600c1ca200b0040839635bfdmr19460261wms.34.1699093765899;
        Sat, 04 Nov 2023 03:29:25 -0700 (PDT)
Received: from ?IPv6:2a02:169:59a6:0:55c4:f628:91f3:4287? ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id i17-20020a05600c481100b004063d8b43e7sm5192353wmo.48.2023.11.04.03.29.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Nov 2023 03:29:24 -0700 (PDT)
Message-ID: <58e2c7a830bceac9b3a8c6cee63f03ae4a118da0.camel@gmail.com>
Subject: Re: [OE-core] Core workflow: sstate for all, bblock/bbunlock, tools
 for why is sstate not being reused?
From: adrian.freihofer@gmail.com
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
 openembedded-architecture
 <openembedded-architecture@lists.openembedded.org>, Michael Halstead
 <mhalstead@linuxfoundation.org>,  Yocto-mailing-list
 <yocto@lists.yoctoproject.org>, ",openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>, Julien STEPHAN
 <jstephan@baylibre.com>
Date: Sat, 04 Nov 2023 11:29:23 +0100
In-Reply-To: <CANNYZj_Cq+cncw5SCGii=Mhj0KGgo=qr=hCuo+wpdvtR9C=Qyg@mail.gmail.com>
References: 
	  <CAK5yBb9gO+WOJrv4TArzXK_1Bxu5AORp2oi=P-v=2nn6PgJE5Q@mail.gmail.com>
	 <CANNYZj9QpstUj_A8Vb2RbiaFGZkHkFjHkUfF=E1HR-nDJ_Vk6w@mail.gmail.com>
	 <81f4c191fe6dead1feec6bfc0d36aa328af1f7d4.camel@linuxfoundation.org>
	 <CANNYZj_uSknujoQUK2yV7U4N+WW_RkUH=sJnFDBfZgV0G5fv7Q@mail.gmail.com>
	 <649b2f000761831cabd1f5737fb5b30a2ffc3654.camel@gmail.com>
	 <CANNYZj_Cq+cncw5SCGii=Mhj0KGgo=qr=hCuo+wpdvtR9C=Qyg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.module_f38+17164+63eeee4a) 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 04 Nov 2023 10:29:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190170

Hi Alex, hi Richard

After some internal discussions, I would like to clarify my previous
answers on this topic.

 * Usually there are two different workflows
    - application developers: could use an SDK with a locked sstate-cache.
    - Yocto/BSP developers: need an unlocked SDK. They change the recipes.
 * A locked SDK
    - can work with setscene from SSTATE_MIRRORS
    - setscene does caching in the SSTATE_DIR (no issue about that)
    - But network problems can occur during the initial build because
      bitbake executes many independent setscene tasks. Opening so many
      independent connections slows down the build, especially if the
      server treats them as a denial of service attack.
    - The denial of service problem is difficult to solve because each
      setscene task runs in its own bibtake task. Reusing a connection to
      download multiple sstate artifacts seems almost impossible.
      This is much easier to solve with separate sstate download script.
 * An unlocked SDK
    - Tries to download the sstate cache for changed recipes and their
      dependencies, which obviously can't work.
    - The useless download requests slow down the build considerably and
      cause a high load on the servers without any benefit.
    - A script which gets a list of sstate artifacts from bitbake and then
      does a upfront download works much better
       + The script runs only when the user calls it or the SDK gets boot-
         strapped
       + The script uses a reasonable amount of parallel connections which
         are re-used for more then one artifact download
 * Idea for a smart lock/unlock implementation
    - Form a user's perspective a locked vs. an unlocked SDK does not make
      much sense. It makes more sense if the SDK would automatically
      download the sstate-cache if it is expected to be available.
      Lets think about an implementation (which allows to override the
      logic) to switch from automatic to manual mode:
     =20
      SSTATE_MIRRORS_ENABLED ?=3D "${is_sstate_mirror_available()}"
     =20
      In our case the sstate mirror is expected to provide all artifacts
      for tagged commits and for some git branches of the layer
      repositories.
      The sstate is obviousely not usable for a "dirty" git layer
      repository. That's what the is_sstate_mirror_available function
      could check to automatically enable and disable lazy downloads.
     =20
    - If is_sstate_mirror_available() returns false, it should still be
      possible to initiate a sstate-cache download manually.
     =20
 * Terminology
    - Older Yocto Releases:
       + eSDK means an installer which provides a different environment wit=
h
         different tools
       + The eSDK was static, with a locked sstate cache
       + Was for one MACHINE, for one image...
    - Newer Yocto Releases:
       + The bitbake environment offers all features of the eSDK installer.=
 I
         consider this as already implemented with meta-ide-support and
         build-sysroots.
       + The term eSDK means a replicable bitbake environment. (The
         documentation was recently changed in that sense)
       + The new SDK installer can be generated in different variants simil=
ar
         to what was already supported by the eSDK
         installer:=C2=A0https://docs.yoctoproject.org/sdk-manual/appendix-
         customizing.html#customizing-the-extensible-sdk-standalone-
         installer.
          * The lightest variant is just a script that sets up the layers (=
git
            clone or git checkout) and provides the build config. If
            SSTATE_MIRRORS are configured lazy downloads will just work
            otherwise bitbake will compile everything from scratch.
          * The heaviest variant of the SDK installer includes the layers a=
nd
            the sstate-cache. After installing it is_sstate_mirror_availabl=
e()
            evaluates to True.
* devtool ide
- Tries to bring this ideas further towards IDE configuration
- It supports two modes: No recipe mode is like the old eSDK
environment. The recipe mode goes beyond that. It is based on
devtool modify.
    - Naming: I was thinking about "devtool ide" versus "devtool esdk"
       + Why ide? I want to set up my IDE to work with the Yocto SDK. And
         that means, of course, that I have to bootstrap the SDK.
       + Could also be esdk: I want to bootstrap the eSDK and that should
         also configure my IDE.
 * Latest patch series is here:=C2=A0
    - https://lists.openembedded.org/g/openembedded-core/message/189899
    - docs: https://lists.yoctoproject.org/g/docs/message/4578

Adrian


