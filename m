Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91EF3CAC597
	for <webhook@archiver.kernel.org>; Thu, 18 Sep 2025 08:10:00 +0000 (UTC)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
 by mx.groups.io with SMTP id smtpd.web11.8782.1758182992748124881
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Sep 2025 01:09:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=YRvnb+nn;
 spf=pass (domain: linaro.org, ip: 209.85.208.178, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-3603f07554eso5003751fa.0
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Sep 2025 01:09:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758182991; x=1758787791; darn=lists.openembedded.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=F3GFsenGoZ4XJozxUTXfAT4qqeS8A461f0TCw72BIJ0=;
        b=YRvnb+nnny/Pl0yzRHdAcq2CHCH7/bmva88LXDSt8QOMEKi7Qmbc509Ca+46SvmIvs
         RcDFE9iiPcXUm9nT8CN2NJ1FHI2aEp82ux+/QrptmlSQZLPDJEiZy/qyafZSf5IcA5FI
         MGerBP8RavoFQB/1cyqvum6ZQCt9Tvjs7mNz3ItgBMutxzthjeYnkzSoBfLEhfNLJa9H
         37/nckxD3rzVJzUXfBCs8aNsaVJ09CCnf/zG+z+kEQYzn5oaBT3Cvy86c41KkUxQkjk/
         S+ncvHUAc10+uNDMRLm5D77MIGXhfnpoKRu4I4vLgu8y3WJIWsTjnI/GZ/3ss1tVvleL
         rM2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758182991; x=1758787791;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=F3GFsenGoZ4XJozxUTXfAT4qqeS8A461f0TCw72BIJ0=;
        b=vigOpfksSIZwE4X3Tk18DiTKlNJ5ypQytE0iSSFwEEfGh8LkOAiubY3u5kwSFPCXxZ
         aerfmRLQY1afBLlxEzuwWYG9kvyufyeYeStzroMLjDXmpFDwhfsOtXUIin9crFEKGOG5
         e0KvMUX4fKhXNiyHQy+GZRhjaTIBfjXijT46jKefkwY5FmZmjIR1gPExi+E4E8DEk52/
         F50UT2m0LSjQiZHUKjRM46+j01v6ZQ6bzhexKRGcfguIfGj8Nvh4x/hnKCVuSbNfUVNy
         cX8ppaIXGAwYGIJ21OGDNIJ2ocaf5nLcMdU8Y8xK6k73Eegs6umYEL12HWK/ohW/gI78
         847Q==
X-Gm-Message-State: AOJu0Yx7YQgd1Lke6V0r8LWj10xsKuLqx01LiUsBaknntq/cbU3eHI9B
	Sbiu1E0ViVfVfDSgqBDksY7utejKeTfETC+2HUrLl8tPgwcqrxZV7FUdcVXkuZ1n01k=
X-Gm-Gg: ASbGncsXirJc0Rrl28dqrHeHmkRbpgv+nXIpYaryBYS/IWsOuKXr5wp6Zt0ulueseE7
	e+3P8+DVvrKBsrSa0ncE8vGBODFZYNOSSUWv3tkuDcfRcNSf2nD4ZZ0OKl7QVi7Q5s+GuwXewGE
	xR0FohDMBBJ8tnEPBGvmUvngQChVoWMflPqhRiNJ1cSjSLA67seGKMc1Mf/TvqxMRNIgNAv+5sq
	SH90rYc8mbhjJ/Ob29tv13Ixlm3qX68a1lLUedF5OHutXYQa/y99m8/sKj0yM+VdK47DIJWqrIn
	InRZJ8FFuQCH4pyxILH+iRd5sfXXxfPFEU1fLBrkLxpVB9RYPwVJh+mj3Gtnw2xlfkI1Muw3wZb
	3aECnNwnVbTjsup4n1KBcY26g+WJ0dhN6RAy4eq5I1evbBHgkWAD/AVB4XpkVWqZgMBI6KIDlWQ
	==
X-Google-Smtp-Source: AGHT+IE9Dj2uKchVmvrxYEndD2hLtnr3QkR53zcou3ERv/EmO1A9YrrrUCr6Zf7EUBAa0zFWhiwbGg==
X-Received: by 2002:a05:651c:3c3:b0:336:dff0:1783 with SMTP id 38308e7fff4ca-35f63c987eamr11572581fa.10.1758182990711;
        Thu, 18 Sep 2025 01:09:50 -0700 (PDT)
Received: from nuoska (87-100-249-247.bb.dnainternet.fi. [87.100.249.247])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-361a1e0773asm4149821fa.6.2025.09.18.01.09.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Sep 2025 01:09:50 -0700 (PDT)
Date: Thu, 18 Sep 2025 11:09:48 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Barne Carstensen <barne.carstensen@danfoss.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>,
	"randy.macleod@windriver.com" <randy.macleod@windriver.com>
Subject: Re: [OE-core] [PATCH] Fixes [YOCTO #15965]
Message-ID: <aMu-TBa1d6oVxF0W@nuoska>
References: <20250916122517.1965-1-barne.carstensen@danfoss.com>
 <aMqDjoK4oj_m0-04@nuoska>
 <DB9PR01MB72106CB784315DF9D5EEE5D08716A@DB9PR01MB7210.eurprd01.prod.exchangelabs.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DB9PR01MB72106CB784315DF9D5EEE5D08716A@DB9PR01MB7210.eurprd01.prod.exchangelabs.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Sep 2025 08:10:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223629

Hi,

On Thu, Sep 18, 2025 at 08:05:12AM +0000, Barne Carstensen wrote:
> Hello,
> Took me a while but I was able to build master now and yes, the parselogs_ignores_*.txt files are in the testexport.tar.gz Sorry for not checking that before, I only looked into the reported bugs. Lesson learned. I guess the patch can then be rejected 😊

No problem. This is a good outcome, a bug can be closed
as already fixed.

Cheers,

-Mikko

