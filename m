Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03DA5C433F5
	for <webhook@archiver.kernel.org>; Tue,  8 Feb 2022 21:38:41 +0000 (UTC)
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com
 [209.85.217.52])
 by mx.groups.io with SMTP id smtpd.web12.17977.1644356319775112230
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Feb 2022 13:38:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=qjEpNZvR;
 spf=pass (domain: gmail.com, ip: 209.85.217.52,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f52.google.com with SMTP id t20so451752vsq.12
        for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Feb 2022 13:38:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=ibyr5sXToLPKwgDtzdFVv10dY1l0ThzVSte9h3lF6K0=;
        b=qjEpNZvRWKytRuFAtxW8y30k2ZhUs2x+FFmO3eMKwjenvEbzU8JrlaDFGgOlssM7jy
         J3MyYwOBQDA8m3e1uf/UvZkNcZKeO12qNHFCLGzcdTojFtfVtIjCVBmS9fVnbo6cc0E9
         5qNsBp78o3Y1N2Jv0bX0NRsC3KSgL2kZfR4iY3K6oaxVKs3AARuqoMNUSwGsAPEGdFaI
         AaTBf373CuATcyceHgUjVIxGv0Z/5nMKM8SuYNmWpgOI6J7zQQcPyM+dnvgYTDihQQba
         FXLCVum92WNlupqNRdxwTSd7AVa6+xXRxUgGUszs3Um6WZR7BhXC0goXoGAwy0GEftNt
         HGoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=ibyr5sXToLPKwgDtzdFVv10dY1l0ThzVSte9h3lF6K0=;
        b=UtSoi6/M4xG7R/Lo+3dY4lbCY2u0oyKmvpcLyB+vCp5WL78rLUjOlq/raRRyxljPTY
         waIiOPZdv02BQXlSua09D0xrBnCl6Z6iQW7RmiDsmpGgqv4pVuyCgs3UFURGtUJ42HAd
         Ekyjk8O/kQk2i7D9KMc8HE1krhzg62jq+NR6l5wo3Lj4hUkQfQbj11C2cgFnQ8+h2aW9
         Q/ws1ah5NwcqO5tZvI64f5TYM4jbpWdqp5jASWVBcT03rZf60RugyrIERbeu7WOwtY9R
         0/h29axpQEUL8a3rONgZ/9oS4Rc0jXJTpoFwL17Uub3XXYHLP991caQIdc+uczAK/vGR
         y3pw==
X-Gm-Message-State: AOAM532ZzUaPqd7jn1dn63t0y2Sr4gSs+OdCyyGq92kUGVG1t/CxGa5i
	n4Mc/qsDEtheQIuY88iHZ0rS3kjDtCUXbFz9++4=
X-Google-Smtp-Source: 
 ABdhPJyIQJpZgp8DlkRd+kr/hnUreYfwDBAYja1PKPd990mWC+KEWtTiCtOPiyVAE5mtXSuPK67RMxcIk+6C8/15pvc=
X-Received: by 2002:a05:6102:c50:: with SMTP id
 y16mr2181852vss.45.1644356318937;
 Tue, 08 Feb 2022 13:38:38 -0800 (PST)
MIME-Version: 1.0
References: 
 <CH0PR20MB3948AC26096D485ED45706F6BB2C9@CH0PR20MB3948.namprd20.prod.outlook.com>
 <CANNYZj9_bX2BLzXWM6f+OZL9dsjDrycc8TWrZkQMkW0MznYfgg@mail.gmail.com>
 <CH0PR20MB39480F83C8949247D7968800BB2D9@CH0PR20MB3948.namprd20.prod.outlook.com>
 <CANNYZj8FiA8==JdmsV-ws=q+0W8hQQRPM6o0+OsGrrjpRo+gXg@mail.gmail.com>
 <CH0PR20MB3948F3D57A8F78D131B9B246BB2D9@CH0PR20MB3948.namprd20.prod.outlook.com>
In-Reply-To: 
 <CH0PR20MB3948F3D57A8F78D131B9B246BB2D9@CH0PR20MB3948.namprd20.prod.outlook.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 8 Feb 2022 22:38:27 +0100
Message-ID: 
 <CANNYZj80JaZqGQQyYPB_8S7gejDKSc0fpYCmY-2=Z+=YoqKtMA@mail.gmail.com>
Subject: Re: [OE-core] gio-querymodules: error while loading shared libraries:
 libffi.so.6: cannot open shared object file
To: Bryan Evenson <bevenson@melinkcorp.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Feb 2022 21:38:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161528

On Tue, 8 Feb 2022 at 21:36, Bryan Evenson <bevenson@melinkcorp.com> wrote:
> As best I can tell, this is breaking because libffi upgraded from libffi6=
 to libffi7.  The old version of glib-2.0 depends on libffi6 and the new ve=
rsion of glib-2.0 depends on libffi7.  Opkg starts to upgrade glib-2.0, but=
 it first upgrades the dependent packages.  This removes libffi6 and instal=
ls libffi7.  Then, the postrm script runs for glib-2.0 using the old binari=
es.  The gio-querymodules call then fails because it tries to load libffi6 =
which no longer exists.  Even if I was able to defer upgrading libffi from =
libffi6 to libffi7 until after glib-2.0 upgrades, I=E2=80=99d then run into=
 a similar problem with the postinst script.  In that case, gio-querymodule=
s would fail because it would try to load libffi7 which would not be instal=
led yet.
> I understand that you don=E2=80=99t want errors to go through undetected.=
  Would an appropriate error message, such as:
>     ${libexecdir}/${MLPREFIX}gio-querymodules ${libdir}/gio/modules/ || e=
cho =E2=80=9CGIO module caching failed.  You may need to manually update th=
e GIO module cache.=E2=80=9D
> Work for you?

That is not an error message, that is a warning message, and no, that
is not appropriate either, because it's likely to go unseen, or
discarded.

I think you should study how desktop distributions handle this, both
rpm-based and deb-based. How do their postinst/postrms look like, and
in what sequence do they run?

As mentioned before, Yocto does not test or support mass-upgrades via
package manager: if we want to fix this, we better do it properly from
the start.

Alex

