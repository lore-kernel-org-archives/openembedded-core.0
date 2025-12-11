Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9913D41C14
	for <webhook@archiver.kernel.org>; Thu, 11 Dec 2025 10:07:31 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6132.1765447644584780975
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Dec 2025 02:07:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=L1c55rUF;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-477b5e0323bso9530715e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 11 Dec 2025 02:07:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1765447643; x=1766052443; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=FH0POaXwHAup/jY2Y/p4ZQMtABGdOx6iKzDA7jyD2tw=;
        b=L1c55rUFOaiWkXUiorQsGoA5/r+vDAFDW73HKZA+bgVxwvQGIcHf8VGcWAxmMByjbY
         KfLNtfATLbs29WscgXmQYbtLOdynqDPvmbHRDhSeRw8hneoBxVpTmMS7PSQPYpe/2RsD
         Z3le/pWFsiYkUKKnjdxo7SJOda/mewXaicwQ8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765447643; x=1766052443;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FH0POaXwHAup/jY2Y/p4ZQMtABGdOx6iKzDA7jyD2tw=;
        b=RmHdh9SCnnFNUScueSuZAUU1OqzYMAT2j4EJlv6iTBx/J/Qor2JGYnr87VMUzbkfi5
         EsBRLL8srbjrGV3nGGnf60zt8WuackaRROWKdLtR1dGYbd//wbLh54rhk3dIVBXQlvEL
         Tr1rfW32AHIstpQILfm4wLl8ovyufycM2jwEoeR5cHwbuRtJcp0bJe0Yl0L9OE/X1C6N
         6f2oA4RA7+RBi5L9NzlIkSwHgq9SxmG7ykT+Q6Z04j75w4sb17LIkVbw2dFbHgSjdQ0i
         P0JyxO0jfja3iepkt4O+klNlC+2G/fj8coBHt6GOofNtMYhrKp9UbTiOkPR+4KCPFFqM
         G3aQ==
X-Gm-Message-State: AOJu0YyOWq5bG5rgcGH5lcThIy4+Q+ocSXq+Fx9DgRyFipkQPorZCAqy
	gowNVutYrHFvfYeKht3MjIaG9NBx7qko4mVp12YQVH/q0sSswrc1q5wa14ECGrugY40=
X-Gm-Gg: AY/fxX5LS1IbvB9yyqtz2PHLYxRkI50GUNjpyifJlzjDmptWNComc5oCoHmXeO3x6c6
	bBpwNsiP+2l5lvLyrwiuTFmgQk2L4urW1a+f6OaCtGgLtgweovUs+oh+PqCo7FvcMWzbmlqAdq5
	dBNJ7+dl/GZ7nVU9mMPSfNQxXHR+2ZInsXkTgvpXoSoRkx1KoMmOtn5PitYQiHPE80TAR4xCNHh
	ODacdRgB3xjwbQreQ/pU5DG+1/OaNRDwtiH7V+MrmTPmUOQNhe4kHJRwuhJAhPBSRkCQypOXvVD
	8wt3NLWX3Xqufl3DVnQDNRwECibYTdfRW4lKLVJ5Vk93+5xhGI65eaDtkr2V4oJL+Kox2xIPWAr
	R5Fq5C5IsRYH3tJu/UtYmr0Vl/fZM7U4wc1AemxFsAyL0tTg6q13F8JxrZ8O2cNox8p5DnrYMcZ
	mgXFbjwv7yzYaD0vRzMdx2hWtK8Pen16zE/cKljt9jWAahN/Xs+ALeyfYAm1TIuz2nX3KzJPppl
	LE=
X-Google-Smtp-Source: AGHT+IGTiIUVMEHd3krOe6xNKX9Qol7uSK9nCWf9pvgpweBF34LoiCtyryhtu31sHoqP6O8RpZ4P5Q==
X-Received: by 2002:a05:600c:1395:b0:46f:a2ba:581f with SMTP id 5b1f17b1804b1-47a89fab64bmr15755425e9.16.1765447642715;
        Thu, 11 Dec 2025 02:07:22 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:d9a5:9dbc:9018:5f05? ([2001:8b0:aba:5f3c:d9a5:9dbc:9018:5f05])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42fa8b8601csm4947451f8f.22.2025.12.11.02.07.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Dec 2025 02:07:21 -0800 (PST)
Message-ID: <1ad9096181f3a5779b8b81e488662f2644ae86c4.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH] wic/engine: fix copying directories into wic
 image with ext* partition
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: ross.burton@arm.com, "daniel.dragomir@windriver.com"
	 <daniel.dragomir@windriver.com>
Cc: "openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Date: Thu, 11 Dec 2025 10:07:21 +0000
In-Reply-To: <D8277C29-A859-491A-85B8-C518E37EB988@arm.com>
References: <20251003203130.23843-1-daniel.dragomir@windriver.com>
	 <D8277C29-A859-491A-85B8-C518E37EB988@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1ubuntu0.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Dec 2025 10:07:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227517

On Mon, 2025-10-06 at 20:08 +0000, Ross Burton via
lists.openembedded.org wrote:
> On 3 Oct 2025, at 21:31, Dragomir, Daniel via lists.openembedded.org
> <daniel.dragomir=3Dwindriver.com@lists.openembedded.org> wrote:
> >=20
> > wic uses debugfs to write on ext* partitions, but debugfs can only
> > write to the current working directory and it cannot copy complete
> > directory trees. Running 'wic ls' on a copied directory show this:
> > =C2=A0=C2=A0 -l: Ext2 inode is not a directory
> >=20
> > Fix this by creating a command list for debugfs (-f parameter) when
> > recursive parsing the host directory in order to create a similar
> > directory structure (mkdir) and copy files (write) on each level
> > into the destination directory from the wic's ext* partition.
>=20
> This is great, but could you please add a test case to the wic
> selftests to exercise this and ensure it doesn=E2=80=99t break in the fut=
ure?

This has been waiting on the tests for a while in master-next. Is that
something you are able to do?

Cheers,

Richard

