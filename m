Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78A8CEE14D0
	for <webhook@archiver.kernel.org>; Wed,  6 Sep 2023 20:53:24 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web10.1210.1694033598592700852
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Sep 2023 13:53:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=NhlOa4+h;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-401c90ed2ecso3334745e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 06 Sep 2023 13:53:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1694033597; x=1694638397; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=t638HeiPuenLYQzNRAex96Gb20sLrfaARo7q49eAVQQ=;
        b=NhlOa4+hqLVFcKCb9WzJc4kCpY7FMgDW18Vb+VlcoDw752zlL2yQMK0tXHj/GW/YHz
         QckE52LvOQkoznAD0zoyPf7I6oxHxtjz0ejeLxAMMEa9U6KvYOMKipP5DOU0k4FwbJDN
         px8H2oK687wGzlBA13n44jNw/6ZVoUdENeicE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694033597; x=1694638397;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=t638HeiPuenLYQzNRAex96Gb20sLrfaARo7q49eAVQQ=;
        b=LdkTp2w3n4FmjYoDyQ/oiy+m3OsghuEt1S98848I4ocBMKrE7oNlkWQdeNKMdyn9f3
         +tE3tsG8bEG9fKiTxlQD6+nXCrhh4HC/oo89kVCtMEq+U0NyfLf9pVTsYRQA/3WgIXGJ
         g7aRLpzwNUi3h6vjvVVCnEIvSV2e6NvMI1JiQk7G/Av3oc9nwV01tfm3tRbiFulWtD8E
         ha3yRDXnTlmjASU+4a+bGChnJ5i8FuV3ayuR1JZC7MCQekLhC53fDWeysVvxFCTyYepV
         ogDyQGprprIf15eFdmELmJCY3VlFmIrs4PTQ1PRIhDJ4krBSAhjp0cVP6Nc+f1SdjLBw
         V/TA==
X-Gm-Message-State: AOJu0YzXzm7vc1hFzKW9F4PvP0uTIkAMSQFg13xfC3wp43vtR1CVlKSL
	18etVMPPjQkxCiVOuKvU96Zd0Q==
X-Google-Smtp-Source: AGHT+IHjZ9T5azZiw1S5iNhg0jvLfQxUMtsyRoBzcsqdtYdthZnF8WDzEGIkiEu8JrSN+LafP9IrrQ==
X-Received: by 2002:a05:600c:4f11:b0:402:ec55:ca14 with SMTP id l17-20020a05600c4f1100b00402ec55ca14mr347575wmq.37.1694033596944;
        Wed, 06 Sep 2023 13:53:16 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:5f38:2f43:a165:5f10? ([2001:8b0:aba:5f3c:5f38:2f43:a165:5f10])
        by smtp.gmail.com with ESMTPSA id k17-20020a7bc411000000b003fed1ba0b8esm563421wmi.8.2023.09.06.13.53.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Sep 2023 13:53:16 -0700 (PDT)
Message-ID: <02407d75fc40487431a84d18b60476552083b1ce.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 16/17] build-sysroots.bb: run tasks one after
 the other
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org, Alexander Kanavin
	 <alex@linutronix.de>
Date: Wed, 06 Sep 2023 21:53:15 +0100
In-Reply-To: <CANNYZj_RfCwHmt_TnUgdHeoTNdqMcX+f7aAzZ7e=MYSx+E-rXg@mail.gmail.com>
References: <20230906165633.2382629-1-alex@linutronix.de>
	 <20230906165633.2382629-16-alex@linutronix.de>
	 <18264a59f21e43aed1138bc58ffdf2471c5ccc05.camel@linuxfoundation.org>
	 <CANNYZj_ptnLNvwPGDcAciok0bsE7Ctzww4WkAJmamgkCyB19CQ@mail.gmail.com>
	 <781c93976fbd19e146ab2626a6202a0ccb23ab82.camel@linuxfoundation.org>
	 <CANNYZj_RfCwHmt_TnUgdHeoTNdqMcX+f7aAzZ7e=MYSx+E-rXg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Sep 2023 20:53:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187355

On Wed, 2023-09-06 at 22:28 +0200, Alexander Kanavin wrote:
> On Wed, 6 Sept 2023 at 22:13, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > Firstly, that recipe was a bit of a hack. In bygone times, we had a
> > shared sysroot and this was effectively creating it for the places we
> > hadn't converted to use recipe specific sysroots. There should only be
> > a small number of places it is used where we haven't found a better
> > way.
> >=20
> > When you use it, the calling code first has to ensure the things it
> > wants in the sysroots have been built. The caller is therefore expected
> > to build the right set of dependencies.
> >=20
> > Putting ordering constraints into the recipe is going to make people
> > think it all happens by magic. It doesn't and the caller has to be
> > careful.
> >=20
> > I'm reluctant to add any dependencies when it should be clear the
> > caller is entirely responsible for this.
>=20
> This commit was prompted by seeing these intermittent races with the
> upgraded shadow:
>=20
> https://autobuilder.yoctoproject.org/typhoon/#/builders/146/builds/468/st=
eps/12/logs/stdio
> https://autobuilder.yoctoproject.org/typhoon/#/builders/147/builds/467/st=
eps/12/logs/stdio
>=20
> What happens here is:
> - target sysroot population relies on being able to run useradd
> without errors. It will also skip the useradd execution if useradd is
> not present.
> - useradd comes from the native sysroot
> - native sysroot is being populated at the same time as target sysroot
> is because the build-sysroots recipe doesn't constrain that
> - this can result in races where useradd executable is already there,
> but the libraries it needs (libbsd, libattr, libmd) are not
>=20
> How would the caller ensure this doesn't happen? I think it's
> reasonable to assume 'bitbake build-sysroots' should complete without
> intermittent failures.

That test/calls were fairly recently added:

https://git.yoctoproject.org/poky/commit/meta/lib/oeqa/selftest/cases/meta_=
ide.py?id=3D9b3fcb0d91648ae3b53ec8ffcb31fb6eac9209dd

That test should probably call:

bitbake("build-sysroots -c build_native_sysroot")
bitbake("build-sysroots -c build_target_sysroot")

om the setup case and then just call the target piece again in the
specific test.

We could drop the "before do_build" in the build-sysroots recipe.

Note that the tasks are nostamp so they will always rerun. It does make
sense to have a way to regenerate the target sysroot only but if you
change it as you suggest, that becomes impossible.

Cheers,

Richard





