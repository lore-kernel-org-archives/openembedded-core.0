Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DA4AC433F5
	for <webhook@archiver.kernel.org>; Mon, 16 May 2022 12:38:50 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web12.28245.1652704721662806537
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 May 2022 05:38:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=BRNuk/N/;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.45,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f45.google.com with SMTP id
 v191-20020a1cacc8000000b00397001398c0so1976690wme.5
        for <openembedded-core@lists.openembedded.org>;
 Mon, 16 May 2022 05:38:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=fJxwe+w+2ob7hqKoXuGDc/5DFosyIylQxSF4Qi38178=;
        b=BRNuk/N/pwtZOtfkviWtED8LzZMcflZ7Ln4EtjAovqZG/uR4xwUP/PEiJ8jcE0y3Cv
         l6RT5F0SUvnnM4TCVMNzBvmZfiGQ4lu+EQzhCUQGEUlNFGgIjGMLubuRGLDccs+43vtH
         CACZwtDo39VpDGHoLpkFwR5+cFfqX3U2IRxZ4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=fJxwe+w+2ob7hqKoXuGDc/5DFosyIylQxSF4Qi38178=;
        b=GHnVLZ7tUgY2mruoi9Q1MmZqrVW6nwfqfHszrDBO3+rB/hJrTWPBiil6qFNzsZdzh8
         CTPg0lYoM+f8NTvpTtmYNi98fLtgOvJN4/q+VowIPF1LgOewb9ww1c6L/SVIIAugtjrW
         By5S3Q39YZ6wwEXk03CWLIp12mkkGmr+Vs6vE2lQZPaCQ2sCSJUCCsfB3I+9KIqqu2ee
         x7LfYNz8kh0OqZI7DMGgy+ZE0u4WjCEqyAnYT90poewH9R/WNkv5N9cc5H3z4jWTXtnf
         tEXbpY8aor5cs/C3kflCQwgu8Omtez68Mhy/9E63sZAHpUsnifrxucurHrkfb5I2MdKR
         YtVw==
X-Gm-Message-State: AOAM531DdbyIqsYdgVH0EMxVTl5tvHTwU2xSCsiPPhMGhBIYeq97jUMM
	XkUI4xj1x7PfYg2CLzdUSKCT6A==
X-Google-Smtp-Source: 
 ABdhPJyyaPZ6bPzjxrE00AwAk/K2i8zc6OE06vZlY7yj7MZbKxma6mFOgs2rIU9tB5lWShElbpit5A==
X-Received: by 2002:a7b:c119:0:b0:393:f98e:b56e with SMTP id
 w25-20020a7bc119000000b00393f98eb56emr27078340wmi.128.1652704720103;
        Mon, 16 May 2022 05:38:40 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:907b:5576:ab63:2b17?
 ([2001:8b0:aba:5f3c:907b:5576:ab63:2b17])
        by smtp.gmail.com with ESMTPSA id
 j25-20020adfa799000000b0020c5253d8dbsm9457054wrc.39.2022.05.16.05.38.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 May 2022 05:38:39 -0700 (PDT)
Message-ID: 
 <63b10a5b05a1a029e50725341b1cb5cf4838ac53.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] selftest/imagefeatures/overlayfs: Always
 append to DISTRO_FEATURES
From: richard.purdie@linuxfoundation.org
To: Jacob Kroon <jacob.kroon@gmail.com>,
	openembedded-core@lists.openembedded.org
Date: Mon, 16 May 2022 13:38:35 +0100
In-Reply-To: <7763f240-35b1-27d8-f2ec-8860dbea0e48@gmail.com>
References: <20220516112849.448882-1-richard.purdie@linuxfoundation.org>
	 <7763f240-35b1-27d8-f2ec-8860dbea0e48@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.0-1ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 May 2022 12:38:50 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165678

On Mon, 2022-05-16 at 13:43 +0200, Jacob Kroon wrote:
> Hi Richard,
>=20
> On 5/16/22 13:28, Richard Purdie wrote:
> > Using +=3D unintentionally removes all over entries from DISTRO_FEATURE=
S and
>=20
> "over", you mean "other" ? If so, how is that possible ?

I mean other, I'll fix the typo. It happens due to:

meta-poky/conf/distro/poky.conf:DISTRO_FEATURES ?=3D "${DISTRO_FEATURES_DEF=
AULT} ${POKY_DEFAULT_DISTRO_FEATURES}"

which interacts badly with "+=3D" :(

I'm not happy about the situation with variable interactions but still
not entirely sure the best way to proceed.

Cheers,

Richard

