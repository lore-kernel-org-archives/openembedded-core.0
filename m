Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C682DC43334
	for <webhook@archiver.kernel.org>; Thu,  2 Jun 2022 16:14:43 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web12.1073.1654186468444465802
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Jun 2022 09:14:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=T4po44KL;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.51,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f51.google.com with SMTP id e2so7109117wrc.1
        for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Jun 2022 09:14:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=DYDTZGabdoywmphZ40zmiVRL7KuStx2dYLuhvxC1Uas=;
        b=T4po44KL8p+wtf1kPixdntClT3g6U8giTVuaxwUiF7z+82d+cQtWJabg4OKz8osCXg
         1VHsE7FUKFjYlI9i7n/JQ7XkSsNXbPxqKZ8TeOGJ5gLRPKfrIoQpjQqiPwSVLb/qqumn
         aXeiwZSjLybf5qjOImydyUtbMkAluHm5jZPCA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=DYDTZGabdoywmphZ40zmiVRL7KuStx2dYLuhvxC1Uas=;
        b=5AJbyf6IN9uTFLiD8Mi3y0N+VUaVXJUq41+n9Cnhew7gtIHW+6N04AUhYpyJVvq4bE
         rijU62oEuJ80Jazm6zFcUbAAI1PJ2NCYvvFaeWpuQOv8Ox2Qiwdl2sinlS7myWcVXb/0
         wrIVvuHer2soSXuLGeslp54nSwM2/vuXtNZYSmfkPpa1iczBkl1e2nAlCuy8rD1FA860
         IKd/wtmINz9w/bUW7cWttJ2HaLHBPiccs6cJfGrzNWdFkeuWZALbMO6Ihdojb3+b1Wgt
         5mS8MDSF+4alnULN91yycm93zAQUi9RhspyZfaLBu6+N1W3R/AguyW29fdD3BaGyCJNN
         Ulbw==
X-Gm-Message-State: AOAM533u69gOQ6WAW+ObZnwZ+Nr9EWZEZmTy+Xj8Z4aRwwg4eG+9you1
	RYAuvn++SOaS0Yn+Ytf4NXMpAg==
X-Google-Smtp-Source: 
 ABdhPJw0VDkIA2Yi3r2n8aErL2qLEAKBou10rKlYlFEIQAORUzECy2niaqOHwD4IpTTCDMsJE7rZ6Q==
X-Received: by 2002:a05:6000:1889:b0:210:27d5:2a95 with SMTP id
 a9-20020a056000188900b0021027d52a95mr4363250wri.612.1654186466650;
        Thu, 02 Jun 2022 09:14:26 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:171c:95a:9d1d:26d3?
 ([2001:8b0:aba:5f3c:171c:95a:9d1d:26d3])
        by smtp.gmail.com with ESMTPSA id
 z2-20020adff1c2000000b0020c5253d8dcsm4496209wro.40.2022.06.02.09.14.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jun 2022 09:14:25 -0700 (PDT)
Message-ID: 
 <d378b06e4c7d079d8d791f385835490fcfde91c5.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] perl: Fix build with gcc-12
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Yu, Mingli" <mingli.yu@windriver.com>,
	openembedded-core@lists.openembedded.org
Date: Thu, 02 Jun 2022 17:14:24 +0100
In-Reply-To: <20220602054640.3543512-1-mingli.yu@windriver.com>
References: <20220602054640.3543512-1-mingli.yu@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Jun 2022 16:14:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166475

On Thu, 2022-06-02 at 13:46 +0800, Yu, Mingli wrote:
> From: Mingli Yu <mingli.yu@windriver.com>
>=20
> Fix the build failure when debug build is enabled.
> Add DEBUG_BUILD =3D "1" in conf/local.conf.
>  $ bitbake perl
>   | In function 'dynprep',
>     inlined from 'S_sortsv_flags_impl' at pp_sort.c:358:20,
>     inlined from 'sortsv_amagic_i_ncmp' at pp_sort.c:572:5:
>   |  pp_sort.c:1232:1: error: inlining failed in call to 'always_inline' =
'S_amagic_i_ncmp': function not considered for inlining
>   | 1232 | S_amagic_i_ncmp(pTHX_ SV *const a, SV *const b)
>=20
> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> ---
>  .../files/0001-Fix-build-with-gcc-12.patch    | 143 ++++++++++++++++++
>  meta/recipes-devtools/perl/perl_5.34.1.bb     |   1 +
>  2 files changed, 144 insertions(+)
>  create mode 100644 meta/recipes-devtools/perl/files/0001-Fix-build-with-=
gcc-12.patch

Dropping this as is seems to break things:

https://autobuilder.yoctoproject.org/typhoon/#/builders/37/builds/5315/step=
s/11/logs/stdio

Cheers,

Richard

