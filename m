Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82981C87FCB
	for <webhook@archiver.kernel.org>; Fri,  8 Aug 2025 06:38:26 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web11.16025.1754635103316508726
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Aug 2025 23:38:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ZCGCsz6c;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3b783d851e6so1546637f8f.0
        for <openembedded-core@lists.openembedded.org>; Thu, 07 Aug 2025 23:38:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1754635102; x=1755239902; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=C2cnsoYRAjMp1tfGy1LquSd43N1d4K0+KhHuaKzZLo0=;
        b=ZCGCsz6csdVmgiOJ2TAv99t+NUVbiI1e7hsKf0y6G7eHqnz8ADc7ZbcCRZ6EXz7cNJ
         EclFVElgYSlgGXiQtf3UTVObO4kKHDS73Tq7h5nFtp1a3P2rrgasHVyJrEDWpwA0nwlj
         YYUsyfBlhyXbDcXOrVRwIoAkGFe8VJscNT4+U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754635102; x=1755239902;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=C2cnsoYRAjMp1tfGy1LquSd43N1d4K0+KhHuaKzZLo0=;
        b=oyRGmVqKLv/YFdtn39f8ki5dYOtxoAZaaC5bk+CZ7T71CDct0LjS9S1rQBuIibIGg+
         Hvx7ANWFTRvMK18epUce1qiUp7IF3TJzbRmnZMaOQucNcv36e5G8XeX6gcuhPuaQe/AB
         dshW1l7voa51geVK9wqrai56lZFCx8nzbFfLc4fNOxhEAXJwthmQ+nO+7KFfXOrWcZWa
         seS4b73itvCIT5Dkj6fAz9CiA+MHbYNtN7oe+188FAJ4JiEunTiFDc/k6ElBdvzukVlO
         jBqm3vX/CRaQRONSr+Rt/58VjdoRWmPYK2Ak7asoANNO2l+kFfMqaUJCRbMvGvbz7Kea
         9U0A==
X-Gm-Message-State: AOJu0Yy+dxgjylYQXNfrIjKXCM6JXGjmV1e8OOKHQ4mja6bjdeqaclPA
	viswDcfGdH+awSQ3upPe4PQZKC2GZTtzzU9D0at8oJzH9aq9PEXho3YL5DUODHcNC5g=
X-Gm-Gg: ASbGncvANrkAALZ4FpUecVh037LVDhwWXtW+pSofMmhEZ8RiXwYj1TAVKtOqsZO4HEz
	7f0vnPj6MhpUnZpXsdZWN0bsMDRfABnIQdN2Gdar3eyGy9onKVtk627z2xgYN9S/CU7h6u+FE3D
	J3NBaSvUDAnQZml7f97GYlKpgoYvSFXzLm6P+/PCwhRubXgd5XFMYBkRpJClztPXZatRyYjT1yf
	bfxsReKhOjQ809k9goZjAtawEIRWarpY2ZLpAgyg2ARPOhcrnzEx8MsI99GxQr/1L0ArEttixdg
	Iz1rh4QehZYfSUG/YpaV2hrQJR/hxJ9WHYw2w1Q639QVsDilVcGDJNSEFPwNW4GsUNHrs7169kS
	UKZ84g+9yJLZ759tp1blY8pNykvgETSYk4+rG9fcyeZo8vH1ekouWZ+rnw2calmZXbLxZkoZAgf
	qqK/c=
X-Google-Smtp-Source: AGHT+IG7dQu7l4Uel7pZtUOQ4i4eoCWYp8erjmcDNruZnouEhbY5OPIHurwdMlUPD+Ouv0kqGuYZkg==
X-Received: by 2002:a05:6000:26c4:b0:3aa:caea:aa7f with SMTP id ffacd0b85a97d-3b900b842bamr1368789f8f.56.1754635101661;
        Thu, 07 Aug 2025 23:38:21 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:70a6:2e85:3c:f9e? ([2001:8b0:aba:5f3c:70a6:2e85:3c:f9e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b8f8b1bc81sm6771693f8f.69.2025.08.07.23.38.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Aug 2025 23:38:20 -0700 (PDT)
Message-ID: <c525b3f9dc5c82a28970681cae797faae7cc00d3.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH 1/3] oe/utils: extract method for parallel_make
 without d context
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Marko, Peter" <Peter.Marko@siemens.com>
Cc: "openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Date: Fri, 08 Aug 2025 07:38:18 +0100
In-Reply-To: <AS1PR10MB56979F115CE1DEEFD2A6977EFD2FA@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20250808055059.8851-1-peter.marko@siemens.com>
	 <AS1PR10MB56979F115CE1DEEFD2A6977EFD2FA@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Aug 2025 06:38:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221597

On Fri, 2025-08-08 at 06:00 +0000, Marko, Peter wrote:
> Note that this change rebuilds from scratch (with rn_work or empty tmpdir=
).
> So the patch verification took me most of the day.
> Although the value of PARALLEL_MAKE does not change and hashes of configu=
re/compile stay the same,
> hash of populate_sysroot changes although it does not evaluate parallel_m=
ake at all.
> Is this a bug or a feature?
>=20
> [poky]/home/projects/build/work-ccp7$ bitbake-diffsigs {/tmp,projects/pok=
y/tmp}/stamps/x86_64-linux/quilt-native/0.69.do_populate_sysroot.sigdata.*
> NOTE: Starting bitbake server...
> basehash changed from 3e355b49fe002160af197c4418d78fe5e6e3f5ee2bbd294bc5e=
be2f6cd62c93a to 13cd423267171f8ba581c9bf6c59a2380690daa9fa5dba3f14f33852d0=
c138fc
> Variable oe.utils.get_bb_number_threads value changed from '7789d42c55d34=
55966829336c3431581e91ea7f90daff00c90ba0bbc747625ac' to '3c2db6724598a1d5fd=
cef41fbb3e0971256afed3a3e1f891cd4b360864802a3f'
> Variable oe.utils.multiprocess_launch_mp value changed from '6fcecddf5f51=
5afff9d1970920f983978d2e68da9ef052ec5e434062795d61ff' to '3a7bc5ba90a4b7dca=
ae29af22611269610cad86f9ad8f3db6a27234d046239c3'

Feature. It is telling you the code changed and hence the task
checksums using that code changed and it rebuilt.

Cheers,

Richard

