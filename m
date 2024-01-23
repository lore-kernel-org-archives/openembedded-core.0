Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74B0DC47258
	for <webhook@archiver.kernel.org>; Tue, 23 Jan 2024 19:14:53 +0000 (UTC)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
 by mx.groups.io with SMTP id smtpd.web11.2954.1706037285386180920
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jan 2024 11:14:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fLoadYxY;
 spf=pass (domain: gmail.com, ip: 209.85.208.175, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2cf0784d4aaso14755371fa.1
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Jan 2024 11:14:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706037283; x=1706642083; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=mCf4kKrp8cUlU5qloKu3yW2lJUvJZjRzC/mX/U+N9RM=;
        b=fLoadYxYDGhPbaLVFQfjmdb7Wwifjz4Ur3bm8bs1Unk8DULYdIsFg2zyhIu1teVZKS
         3nDj6Flfpn2bkjcof879fEF9OfOIFgXDF9sAKrhZQLnhGEgZGVI18HaILuA8FRkhg4zu
         vIX8p+7IHqT9cvhyPO3rTfw4b/i18PvBqazivgf0YyStzpxrUg+al0UL7lOWjPQqqeRb
         OFbGI/YnmajT+fjeCoGL+38uIiSysM0950lrQ4YfAMMA45eCCR8OuvdfeWuTcEXWZ2Jy
         QCgtSMyOUl7E40qTdrrDZ4nWNzWsWyMzneB2kTDD3mIXe03Zf029dqGEJ2k1gFpc1zfB
         SzjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706037283; x=1706642083;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mCf4kKrp8cUlU5qloKu3yW2lJUvJZjRzC/mX/U+N9RM=;
        b=crFJnFFmyHNbesss5JCvOORSyKUICD3skZ4AG8tHks6w0dU0f5lT+Kw52i6TkqJpOl
         V3xf/JcBvGLad+CjAcbi7XTPx2RPq1MB6PYNC2MiSTaRec5HFSlXI4xn5ACUvuSOSSGA
         FBApSlpc2+DMVMWPoOh37unUPiqeUjaqUmBnguj/Lc8uB5icKuwGmIBmr8ZgbNOoVqs1
         kaSlzQYb2iMun2W+p4QL8+d0ZyisAxMK5xPdozLQhllwa7Jr00EFGD6CBlu5XlCRVbEp
         ERH/1IFGe9zNKb3mjyGlse21hz2GzJgKkzByZYxTtDBhGwVA+ToqY2eQVDogcXbBP8Nl
         VsHQ==
X-Gm-Message-State: AOJu0YwJTdrPrihK9LCDT8a15+zJeoTvoijBIlLFcDpwA05J1OaWXiMK
	iBGdDMfQ9b2WYOUQfqp4qoWPSWOWudI/yiLnCYCPFesMmcPTKOd/wdOl6Ll3+XRrAVu3BsJviJz
	tXsW29fzNYgw758RThKMaAE/1xoI=
X-Google-Smtp-Source: AGHT+IGU245hZd/ld+9j0MVdsmpg2mAGlf9P94SuZDTSmdMR2tDXB666b8HHfEw1OanEhaLIA3fE/IqAipnXADoAcik=
X-Received: by 2002:a2e:b889:0:b0:2cf:1c9c:a43b with SMTP id
 r9-20020a2eb889000000b002cf1c9ca43bmr116977ljp.18.1706037283322; Tue, 23 Jan
 2024 11:14:43 -0800 (PST)
MIME-Version: 1.0
References: <5387538c4d9cdb021ad26dec9d8553ed0ead8e6b.camel@infinera.com>
 <CANNYZj8hkwep=rLn2_tiBmFJhYPpgB9gbkGssdpq6uZbn_qZig@mail.gmail.com>
 <15c60ef81ccec80f50643b4ebbe40a6dbacd4f5c.camel@infinera.com>
 <CANNYZj9HM_U=rvhVSrnEb-Ydgd593ytgcBJMYWtPiC-5XM4C8w@mail.gmail.com>
 <d92a64cfcbffc58821e70eba2c61e403f5002ec3.camel@infinera.com>
 <CANNYZj9HK0rmThC_uzN5vaNCYyWx2dfOuA2CH340ATavho1MHQ@mail.gmail.com>
 <e28167217b5f0404b81bb87d15c8a1df5e2cc938.camel@infinera.com>
 <CANNYZj-25pTodtkz-qZsZb4GX-D4Y4+QE=93EqRWhzGo9jd2aQ@mail.gmail.com> <5ab234b073a487445092ffec777a9757d68bc549.camel@infinera.com>
In-Reply-To: <5ab234b073a487445092ffec777a9757d68bc549.camel@infinera.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 23 Jan 2024 20:14:31 +0100
Message-ID: <CANNYZj_aa8XmPB7z5yh90g0pmNXM6cMU-41D8F-6=3iGmfgoqw@mail.gmail.com>
Subject: Re: [OE-core] oe-selftest -v -K -r reproducible.ReproducibleTests.test_reproducible_builds
 always succeeds, even when pkg is non-reproducible
To: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Jan 2024 19:14:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194250

On Tue, 23 Jan 2024 at 20:11, Joakim Tjernlund
<Joakim.Tjernlund@infinera.com> wrote:
>
> On Tue, 2024-01-23 at 20:02 +0100, Alexander Kanavin wrote:
> > Host tools can influence reproducibility of target items too, so I
> > would not want to use the same set in both builds. Checking for
> > reproducibility is simply something that needs a powerful machine.
>
> We would like to start gently, don't have that power yet and
> some pkgs needs fixing before doing serious repro. builds.
> Therefore I would like to reuse host tools if possible for now.
>
> But how to setup OEQA_REPRODUCIBLE_TEST_SSTATE_TARGETS?

Documentation doesn't seem to help there (patches welcome), so I
suggest you read the test directly:
meta/lib/oeqa/selftest/cases/reproducible.py

Alex

