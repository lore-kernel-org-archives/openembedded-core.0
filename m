Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 836A8C433F5
	for <webhook@archiver.kernel.org>; Wed, 11 May 2022 05:40:09 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 by mx.groups.io with SMTP id smtpd.web12.7859.1652247602177792187
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 May 2022 22:40:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=dnGCXgfU;
 spf=pass (domain: gmail.com, ip: 209.85.167.44,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f44.google.com with SMTP id p26so1596781lfh.10
        for <openembedded-core@lists.openembedded.org>;
 Tue, 10 May 2022 22:40:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Zllkiht6kbLO+9yck3VQu2xvh0+OZC2Br/kPHRLnfbg=;
        b=dnGCXgfUSBOnn3TqL42cVFStAtaOiQ6WUY7tfLTzRmtb82sy+VV0ns0QZ/Q49OaXeP
         1izU8SSZqRIV0MCGZPWDuxI0+EyeZ0rhNWKwniL/pLkobmy0V0v5Qxj+xduDz+l1BsjL
         d2cITFyDtIOVuZCMrjaW29lOh8h5Z9yS2DypIq47fmU17/uGgs9zxb1d/Ln+ljKiO3fI
         9H5qYDalqRvF2V2atWaMrFepbMpkwgB1WGfTV0AwQ1/3jf+2C6oRuHIJJ16WxSP0Zt1n
         85/dq+5MoyX3NMztcB7vp4/2jl+XTYprJH4D144raNcXMTf8tmD6YcoML/u4+2pjCAK4
         rGHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Zllkiht6kbLO+9yck3VQu2xvh0+OZC2Br/kPHRLnfbg=;
        b=hHKxbsa6LGSbO3VV8JJbW76OHmgnF97USSJ8aJirOgqbLIPAOAf6tdZM6HbHrF/B0i
         DIQxtYEoYyfRntz5ttbQZTIG0QRUfIZ8LA2ogZN795HL0HPhB6cEnaNAQu3Uuc4Ybypd
         /zHX/G3ln/cZ5wsjWlHTiswo+T2JTMkND2+W45EU/bGi7fqsLQHUo/orlvzKE+u2Z+8E
         5klM93TEkVXtgJEZ6UXxuhUkST1RupflYAbuPOLe79jAEOZBN89Piirvbgbmbv+6NLkk
         ri2bBflmqQavDDDmkcbsmSOg9rwLf1mRzgzKWmPrszMdxEgyMbs8fA8zHC8uc91nyxRa
         2mEw==
X-Gm-Message-State: AOAM530oNHZNPLiRnM0wpYajZ7ZsTHNFVV44jsvVOhMxq2QBZVY96+Ll
	htYvPwAwd2vwWUQoREhcvZJQtoBrn92EKynv1bI=
X-Google-Smtp-Source: 
 ABdhPJx9miaa3KILAgn7I29H0zi9TOEPIMPGVHk3KFfNau/TxAsp8/GIJvDPBMxmhJqmv0jJofJGXv1njTdfrIwNUiA=
X-Received: by 2002:a19:504a:0:b0:473:b6da:52ee with SMTP id
 z10-20020a19504a000000b00473b6da52eemr18344808lfj.665.1652247599683; Tue, 10
 May 2022 22:39:59 -0700 (PDT)
MIME-Version: 1.0
References: <1651808269-3775-1-git-send-email-leimaohui@fujitsu.com>
 <CANNYZj96-SMiUCmTMhZ3uoLSHN8mH0js6e2k2JJQOW3Tp3MV5w@mail.gmail.com>
 <OS0PR01MB6178F9B577423A035BD3CCDDA0C49@OS0PR01MB6178.jpnprd01.prod.outlook.com>
 <CANNYZj_wg3r2smGwNVoN34L0ai-pPjPEfjg0P7LoQEirfL8rhQ@mail.gmail.com>
 <OS0PR01MB61785EBD9D1441B3201AC1A2A0C69@OS0PR01MB6178.jpnprd01.prod.outlook.com>
 <CANNYZj_K42tgo7kRVV4fOHkFXQBxEs86KdGBX_vbYsahip9FVg@mail.gmail.com>
 <OS0PR01MB61786F05D3748BC41FBC3CDBA0C99@OS0PR01MB6178.jpnprd01.prod.outlook.com>
In-Reply-To: 
 <OS0PR01MB61786F05D3748BC41FBC3CDBA0C99@OS0PR01MB6178.jpnprd01.prod.outlook.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 11 May 2022 07:39:48 +0200
Message-ID: 
 <CANNYZj9-xW5_mEh1UTyX_AJ=nVbsN4LOhTGjYGVRvZjLH7=skg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] gnutls: Added fips support option.
To: "leimaohui@fujitsu.com" <leimaohui@fujitsu.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 May 2022 05:40:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165486

On Tue, 10 May 2022 at 02:54, leimaohui@fujitsu.com
<leimaohui@fujitsu.com> wrote:
> I'm afraid I'm not quite with you. Searched poky by the following command and there is no example about how to config PACKAGECONFIG[xxx] for target or native separately.
> The result is all about how to config PACKAGECONFIG for target or native.
> ----------------------------------------
> $ grep -ir PACKAGECONFIG *|grep class-native
> meta/recipes-support/libcap/libcap_2.64.bb:PACKAGECONFIG:class-native ??= ""
> meta/recipes-support/vim/vim_8.2.bb:PACKAGECONFIG:class-native = ""
> meta/recipes-support/sqlite/sqlite3.inc:PACKAGECONFIG:class-native ?= "fts4 fts5 rtree dyn_ext"
> ......
> ----------------------------------------
>
> But I think you mean not PACKAGECONFIG but PACKAGECONFIG[fips]. For example, in libcap_2.64.bb file:
> $ cat meta/recipes-support/libcap/libcap_2.64.bb
> ......
> PACKAGECONFIG ??= "libidn  ${@bb.utils.filter('DISTRO_FEATURES', 'seccomp', d)} "  //not here
> ......
> PACKAGECONFIG[fips] = "--enable-fips140-mode --with-libdl-prefix=${STAGING_BASELIBDIR},--disable-fips140-mode"   //Your comment means modify here
> .......
>
> Did I misunderstand?

Sorry, it's always a bit confusing with PACKAGECONFIG, as the keyword
is used for two different purposes.

What I meant is something like this:

PACKAGECONFIG ??= "fips"
PACKAGECONFIG:class-native ??= "fips-native"

Alex

