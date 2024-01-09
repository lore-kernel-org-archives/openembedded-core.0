Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7ADABC47073
	for <webhook@archiver.kernel.org>; Tue,  9 Jan 2024 16:14:11 +0000 (UTC)
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
 by mx.groups.io with SMTP id smtpd.web10.20731.1704816849025350546
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Jan 2024 08:14:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IksJlZG2;
 spf=pass (domain: gmail.com, ip: 209.85.210.44, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-6dc36e501e1so2216505a34.1
        for <openembedded-core@lists.openembedded.org>; Tue, 09 Jan 2024 08:14:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704816848; x=1705421648; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ege0AZCM+yb0rBjAGDlw/oWGTSkPBOgSYrPBxTtSCu4=;
        b=IksJlZG2AQ7OSuTBnuYNsbtCaKZrPmPYB4hWewVCLexIu9F0IlXl7KXvaKygeLWKQk
         f3LPvOcWiWrpyI4c0IXs4+az9hAyog4cddtkrqO/qAk8GEIQgyDo4y1m5pZnJ3QutFXx
         XmI3uzqMlYKap7NfAnL3+iDLjUdbrW9Tl8kOfSMX9c8Cvjcn17ddD7yKjrMFFVm2bA7C
         ZK85HehoLZopRxJnSzAFTmMt+7BOPp3xkuI+VKW2ELYFpEwAKZU2TqR3usfbFEkic2wZ
         QFJJRg+Nrfn1hlWBLmmSaD7sjjv0sBkvWahOiggaP/npExW7JpDnINNva80k2C2QoZ/d
         eybw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704816848; x=1705421648;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ege0AZCM+yb0rBjAGDlw/oWGTSkPBOgSYrPBxTtSCu4=;
        b=PsrUK5ImKJPyeiDpwbGVuh5bvjPwncnxuzUY7d9kiD/hotYfrEKM/gk7GEf9YM93Rt
         e5FJs/MMG3kVcfcMVNsDd95V5w82EhVAFjwdaL0RNvwE3hh8aaFjRo859IpFpk+AyzpA
         jSNDiXhKX/STZtj7DowSgpL9yVmLyNh2UwNX42LTh6PGHExQEvetM+FYPznBu4lDj3Nk
         EtrM3Kr8s6JhOm2qEE1cpCo/WBHkDRrOC1y+HVxJEzQ2lP3p3NDQ6PyXl0foA4TvtwVj
         dxAf2HduChVPiR98s3xVT/TTH4bThVt09MMtFbWgm5A44e/a/zYZx2JNp72SoFgXo8x2
         Hp9Q==
X-Gm-Message-State: AOJu0YxPx0wRU1uUNV4NqxAcCe3RymRqduQJdyGh01Y5pBEbK4PivGfl
	VbJFHU1/wDMOqhhYEkQ/NLynDchvYswkdIgEkSM=
X-Google-Smtp-Source: AGHT+IERBMSBlTGleCkLw1/AMYupk0FMaLJdNZJn8ryIpPnveTx8393+ZNDEvGRNxL5YFEgxqAwjXJlVLvYvBfur49o=
X-Received: by 2002:a05:6870:9a2a:b0:204:30eb:18c8 with SMTP id
 fo42-20020a0568709a2a00b0020430eb18c8mr7812921oab.99.1704816848090; Tue, 09
 Jan 2024 08:14:08 -0800 (PST)
MIME-Version: 1.0
References: <20231222175452.3796386-1-raj.khem@gmail.com> <CFDEB1DE-ACAF-4175-8BF5-8FD59AFC2110@arm.com>
In-Reply-To: <CFDEB1DE-ACAF-4175-8BF5-8FD59AFC2110@arm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 9 Jan 2024 08:13:42 -0800
Message-ID: <CAMKF1srWfX8ohAJZ0nAV9i7HjWkyb-hLUAn-wh1bbJ17_uyXFA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] glib-networking: Fix ptest failures with
 openssl backend
To: Ross Burton <Ross.Burton@arm.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Jan 2024 16:14:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193468

On Tue, Jan 9, 2024 at 7:55=E2=80=AFAM Ross Burton <Ross.Burton@arm.com> wr=
ote:
>
> On 22 Dec 2023, at 17:54, Khem Raj via lists.openembedded.org <raj.khem=
=3Dgmail.com@lists.openembedded.org> wrote:
> > +SRC_URI +=3D "file://eagain.patch \
> > +            file://0001-tests-Disable-test_unclean_close_by_server.pat=
ch \
>
> As this only affects builds with openssl, should we apply the patch in on=
 openssl builds?
>

is it enabled to run when using other backends ?

> Ross
>

