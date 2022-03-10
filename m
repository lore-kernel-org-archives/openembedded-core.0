Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86298C433F5
	for <webhook@archiver.kernel.org>; Thu, 10 Mar 2022 14:01:29 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web11.9505.1646920888612608024
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Mar 2022 06:01:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20210112.gappssmtp.com header.s=20210112
 header.b=q/jy4F4N;
 spf=pass (domain: burtonini.com, ip: 209.85.221.53,
 mailfrom: ross@burtonini.com)
Received: by mail-wr1-f53.google.com with SMTP id u10so8107535wra.9
        for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Mar 2022 06:01:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6bDygtsV5LuWF+Xdac5MMLypgSbLHRIuhFlb3CNJ1Yc=;
        b=q/jy4F4Npjwlx2+x25tUFAn5bAo+L696BC32Dqt4tdvLNTDvi06gz5wyq/wjHsnTbm
         uu5gLTMMWwU9qk430fMxW1s2J5O94/YlQzZCUALwqQJeKCOp+CqUjz5uxd5fWFLRVGKl
         Or7NTIlbGOs9gYw8sLpzLto7ceJi0WMLa9EKSoUvpxI9XYBq563/ks+aneMFCQzoacko
         GwaAT/OmIe8lPL20yfVPhBFzBL0MDBhdrPzrbts7HociSVhsYDRX+KfmyW2zUUWXHt/x
         lq+lN68RCicmQEEtx2TnNXqTJn7PzluUlcbh6kmUYqhlgy/sH9Lw6NvP9tc1TgZ8PL+v
         maJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6bDygtsV5LuWF+Xdac5MMLypgSbLHRIuhFlb3CNJ1Yc=;
        b=MPeXsnyPu5jyccAe1PZDCedh3/qZ/DIBTANMy9/OeOtcy+/qIktq9g9yE286IlgamW
         LhyGntA/GpjjKfdzobZG6I7dWwu9nnHGKEqp64UBmZEjXdXlb1e/Bu+ble5fhbWtPzP9
         TabGHiLlurLba6zs3wZ3GmtGc/4d9jQ3e3zg66HFn6k0sU1lEQQT0vUCy/w1quPGUb72
         4nq87/XYV/VKFJRdz/tShAo/7jgSHI5ofoy5+b61HrEf3R4QaZ1Q98914Yq5WhhgBtXV
         F2KdcnEzZBeAUCRdV75tbWl2Vbc/IY4+CdLTQesnB9RPYT8fMj42AS0mpGXUL3pR01MV
         5pEg==
X-Gm-Message-State: AOAM532opjqa/lCKmIfVIHB051FmfEe2r3zIxytm4l2IVhGkxiYmOXQX
	FOJo6KmRLxG3l22e2CSZx1PpD2Ln0Vj/FJuKNa1rYA==
X-Google-Smtp-Source: 
 ABdhPJxJjmTvtLjZZ72EhTvdfFJC5GB4p678UVJC67+oAEgoAK0Oxd1OXekM4rwTLHThOVdWdqY8lfFh6eq+x2MUjdg=
X-Received: by 2002:a5d:5918:0:b0:1f0:3295:f4ec with SMTP id
 v24-20020a5d5918000000b001f03295f4ecmr3618455wrd.451.1646920886774; Thu, 10
 Mar 2022 06:01:26 -0800 (PST)
MIME-Version: 1.0
References: <20220310114035.2226442-1-ross.burton@arm.com>
 <AM9PR09MB4642CA1CCF4C29F109985C76A80B9@AM9PR09MB4642.eurprd09.prod.outlook.com>
In-Reply-To: 
 <AM9PR09MB4642CA1CCF4C29F109985C76A80B9@AM9PR09MB4642.eurprd09.prod.outlook.com>
From: Ross Burton <ross@burtonini.com>
Date: Thu, 10 Mar 2022 14:01:15 +0000
Message-ID: 
 <CAAnfSTuga12XF0fDUAgpm0u0ryh4=L7f2bn4VHmiArusSo=hQA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/3] pip_install_wheel: add a generic do_install
 for bootstrapping
To: Konrad Weihmann <kweihmann@outlook.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Mar 2022 14:01:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163023

On Thu, 10 Mar 2022 at 11:48, Konrad Weihmann <kweihmann@outlook.com> wrote:
> > +pip_install_wheel_do_bootstrap_install () {
> > +    install -d ${D}${PYTHON_SITEPACKAGES_DIR}
> > +    unzip -d ${D}${PYTHON_SITEPACKAGES_DIR} ${PIP_INSTALL_DIST_PATH}/*.whl
> > +}
>
> I think these two lines could be moved into a generic do_install:native
> - and then removing all the override code from the recipes below.

There's only a few recipes which need this bootstrap, 99% of native
recipes can use pip: it's just flit_core/pip/setuptools/wheel which
can't as they're needed to build pip itself.

(and once installer is used instead of pip, it's just installer and flit_core)

I may send a v2 to this, as we should be byte-compiling the bootstrap code too.

Ross

