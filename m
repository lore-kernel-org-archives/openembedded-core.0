Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE375C433FE
	for <webhook@archiver.kernel.org>; Wed,  9 Nov 2022 03:47:23 +0000 (UTC)
Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
 by mx.groups.io with SMTP id smtpd.web09.2290.1667965639564002264
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Nov 2022 19:47:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=S0V08+D7;
 spf=pass (domain: gmail.com, ip: 209.85.160.54, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-13be3ef361dso18394439fac.12
        for <openembedded-core@lists.openembedded.org>; Tue, 08 Nov 2022 19:47:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=yxNyxQLi7PN0xAJvuJCU97jqV7HKao+QwVUC3dk/INQ=;
        b=S0V08+D7LAKJMqHEDgS5lvB/nUeg4kH4oBOV54ZV/FAgwVvlkU/DepmrpKIQWEh3gB
         8grcbqlGSE34ZuIUEyog8zzJ6X01NX/Ij89HgxqZrR/BnTalj2IkDin3n3JkIqL4o8Ji
         YGSPlvycRTy/3/gzia4ta9P53Wzthds9bMEcOIURKYuQwqADV5fMoOryJ5VuXcE+sH07
         znXW2uK++vW+tDkLiIrWxwvHiZim+ZcbAEQB/mh4Rm++ttxRiYq95eeGf2az8GJWNUfS
         UEk3/LyY71nkgAAYqe4jGqVBulP6kqdVgoe0VGAt7osI+HHO06Ww+5mBbzhk1w2MT9kb
         JvVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yxNyxQLi7PN0xAJvuJCU97jqV7HKao+QwVUC3dk/INQ=;
        b=ATHpmuWpq+PAP7K3yHATxrYnDFnk76LR55NPrD2DlidIHIJbVVdN8gTQs5QCjvdsC+
         gMoovTZx6HdMK46/h+S4EwStD3RUmRNAZioAquLNtKkswK1M9Ftxmg16NkeA71PEw+Hg
         54QkcS7vSgNhclV5OfEq0I1xr8xxWs9gILht2d0QXnSt2/TJPqTMHgPu/5htY1xei83B
         JNOZwoQ5XN93nzK50bDLtsVRxcnTM1x2GZ2xliDf0WUUWRA5uI+rEV544TzYj69Tq4H/
         itSkKOQ/28dAOD9qiBMTN2wkdzd7ESKmud/x7BjCi6tEkK3RCjhRj/PEvgvmuwAwyse1
         tcRw==
X-Gm-Message-State: ACrzQf09Hk2888HAe2Yt9u940ZJTVoVRuDsVMf1h9NohxyMPkUzVIMUr
	JwxKWAN8tJHFZ1/wWC6+keYa0vAAxznvDaFHYqc=
X-Google-Smtp-Source: AMsMyM6NGxFj8e1PDZfULKwPGxr2thntpXTMIUN0MXCXf9Ptv2FHNH/lhDrR5qHLnS0y3HG1zICQwqg3hxxbAAGfTY4=
X-Received: by 2002:a05:6870:b00b:b0:127:2d3d:3c16 with SMTP id
 y11-20020a056870b00b00b001272d3d3c16mr43936682oae.262.1667965637981; Tue, 08
 Nov 2022 19:47:17 -0800 (PST)
MIME-Version: 1.0
References: <20221107145508.1051404-1-alex@linutronix.de> <20221107145508.1051404-46-alex@linutronix.de>
 <53c48a9347a894fd991b4faf3bfb415ae3529830.camel@linuxfoundation.org>
In-Reply-To: <53c48a9347a894fd991b4faf3bfb415ae3529830.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 8 Nov 2022 19:46:51 -0800
Message-ID: <CAMKF1soCO_zcACw7+EmudmD2i=yv59_YSkOioMoFxYmOR+RcFA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 46/48] python3: use the standard shell version
 of python3-config
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>, openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Nov 2022 03:47:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173010

I am seeing a bunch of failures perhaps related but not sure

https://errors.yoctoproject.org/Errors/Build/154610/

On Tue, Nov 8, 2022 at 2:59 PM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Mon, 2022-11-07 at 15:55 +0100, Alexander Kanavin wrote:
> >
> > +SYSROOT_PREPROCESS_FUNCS:append:class-target = " provide_target_config_script"
> > +SYSROOT_PREPROCESS_FUNCS:append:class-nativesdk = " provide_target_config_script"
> > +
> > +provide_target_config_script() {
> > +        install -d ${SYSROOT_DESTDIR}${bindir}/
> > +        install ${D}/${bindir}/python3-config ${SYSROOT_DESTDIR}${bindir}/
> > +        install ${D}/${bindir}/python${PYTHON_MAJMIN}-config ${SYSROOT_DESTDIR}${bindir}/
> > +}
> > +
> > +
> >  SSTATE_SCAN_FILES += "Makefile _sysconfigdata.py"
> >  SSTATE_HASHEQUIV_FILEMAP = " \
> >      populate_sysroot:*/lib*/python3*/_sysconfigdata*.py:${TMPDIR} \
>
> This made me wonder if we shouldn't have a better way of handling this.
> I was wondering if we should have a sysroot_stage_file function (like
> sysroot_stage_dir) and then we could do something like:
>
> sysroot_stage_all:append() {
>         sysroot_stage_file ${D}/${bindir}/python3-config ${SYSROOT_DESTDIR}/${bindir}/python3-config
> }
>
> Note that the sysroot code plays with hardlinks for efficiency, I
> appreciate one file doesn't really matter though.
>
> I was hoping we could have just added to SYSROOT_DIRS but that does
> only handle dirs, not files.
>
> Cheers,
>
> Richard
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#173003): https://lists.openembedded.org/g/openembedded-core/message/173003
> Mute This Topic: https://lists.openembedded.org/mt/94867622/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

