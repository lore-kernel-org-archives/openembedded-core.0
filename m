Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DD1CCFA76F
	for <webhook@archiver.kernel.org>; Fri,  4 Oct 2024 11:44:34 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
 by mx.groups.io with SMTP id smtpd.web10.19780.1728042256014707179
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Oct 2024 04:44:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RRbZ9UMY;
 spf=pass (domain: gmail.com, ip: 209.85.167.47, mailfrom: martin.jansa@gmail.com)
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5398f3be400so2616877e87.0
        for <openembedded-core@lists.openembedded.org>; Fri, 04 Oct 2024 04:44:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728042254; x=1728647054; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VQtgHLxPjrllfUkSAR2j1B+1rCpSKRiNsatTcZwEGT4=;
        b=RRbZ9UMYVLSfNEQgtnQHP1zwoB/Fssd+m1lfe3rmfXExFxrg1bbuU9Y8YNpxRRC4Z7
         KZ8o0fW1Jn/7o2ll7l5vquBUwvob/ZEVVcICJ9YNpamF2ZYe63ZO9EagkMogqgP4oK5p
         AJY53qvEKK5D8hU0kgxO3vz+RqRP8s+AltQDFBvDFTqDuxN15hGVn5Q2zaeTvjPRyKNq
         GTac7hZLMHvL2FQ7PczRLWBnV6+sfUJgn5taD56W2djCuAk2rvxYDr6wtrsuzHLJ/XPr
         xe3kJsqkAqwWABquLKag5YyW9UFDNnD8LFEbjDSNCQaqWGpbB34xaW8+KLKOJQFekQD/
         ILaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728042254; x=1728647054;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VQtgHLxPjrllfUkSAR2j1B+1rCpSKRiNsatTcZwEGT4=;
        b=YTWVWDEtcwDYLY5GWd5ryJJPSANVsaKN4HEYoPa5fp8Rt+AlMdCMZJMX9ASgKn62Hd
         TtM2SnQEMBl/iubSImRQdzy8C/PBl6qnzZm/johr842R+/9UCLkbYMMWCDEm018lBru3
         kmL18VcR8HbmQwte6Yf5YW7oPjpxOMt9mJHwr+VWCuCRwhiUb1hFZUrb7dSY+S4S+XlK
         E4uPuqq5vtik8uZ8WFOFQdxhN+aYWkOD8Gbd99AjjZUqf367GS1smbD5HP7sZZxGmyzV
         fcWkorgsjKNKDJQLJMXwDu0KcUnsBDMTdexNak5EZ0IHPzQYqssu04kx6sdeCONngUob
         Dpow==
X-Gm-Message-State: AOJu0YxT973qXcGPVmoXsZH+9+ZsU9Nro52L68kj8GLVtZ7uiKiD9SVx
	Ol71VImoLCSmX5/OkG49mJi6153Eg42xFA849HwMSz04HkeeXpyNjpYPTXC3+dUcSThFGOEQMvI
	OvDEcGGrkM8voJ7gyWJaj1yEEbBQ=
X-Google-Smtp-Source: AGHT+IEIQku9x8rfORiosy8sX8mxxepA2rYpLi2S5j+6WNQWt4OUkGzJbnUbgedziWu8yv7zyopU33UnvRLZHT4YBqI=
X-Received: by 2002:a05:6512:2245:b0:530:b76c:65df with SMTP id
 2adb3069b0e04-539ab88c391mr1800504e87.35.1728042253750; Fri, 04 Oct 2024
 04:44:13 -0700 (PDT)
MIME-Version: 1.0
References: <20240919100127.2857748-1-pmi183@gmail.com> <20240919100127.2857748-2-pmi183@gmail.com>
In-Reply-To: <20240919100127.2857748-2-pmi183@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 4 Oct 2024 13:44:01 +0200
Message-ID: <CA+chaQeZCsLoXPwYyT=wdedzk5UQw-NMx9FWyfXjUXWaHUw8Xw@mail.gmail.com>
Subject: Re: [OE-core] [kirkstone][PATCH v3 2/3] buildhistory: Restoring files
 from preserve list
To: pmi183@gmail.com
Cc: openembedded-core@lists.openembedded.org, 
	Pedro Ferreira <pedro.silva.ferreira@criticaltechworks.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Oct 2024 11:44:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205231

Hi,

you should request backporting:
https://lists.openembedded.org/g/openembedded-core/message/203338
as well as it now fails in kirkstone (and possibly in scarthgap as
well) due to these buildhistory changes being backported (libdevmapper
in meta-oe has the same issue, backport was already sent there, but I
haven't seen one for meta-world-pkgdata).

On Thu, Sep 19, 2024 at 12:01=E2=80=AFPM Pedro Ferreira via
lists.openembedded.org <pmi183=3Dgmail.com@lists.openembedded.org>
wrote:
>
> From: Pedro Ferreira <pedro.silva.ferreira@criticaltechworks.com>
>
> This fix will ensure that, when we activate feature
> `BUILDHISTORY_RESET`, files marked to keep on feature
> `BUILDHISTORY_PRESERVE` will indeed exist is buildhistory
> final path since they are moved to buildhistory/old but
> not restored at any point.
>
> Signed-off-by: Pedro Ferreira <Pedro.Silva.Ferreira@criticaltechworks.com=
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> (cherry picked from commit 9f68a45aa238ae5fcdfaca71ba0e7015e9cb720e)
> ---
>  meta/classes/buildhistory.bbclass | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
>
> diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistor=
y.bbclass
> index b35508db27..8adb44eba5 100644
> --- a/meta/classes/buildhistory.bbclass
> +++ b/meta/classes/buildhistory.bbclass
> @@ -108,6 +108,7 @@ python buildhistory_emit_pkghistory() {
>      import json
>      import shlex
>      import errno
> +    import shutil
>
>      pkghistdir =3D d.getVar('BUILDHISTORY_DIR_PACKAGE')
>      oldpkghistdir =3D d.getVar('BUILDHISTORY_OLD_DIR_PACKAGE')
> @@ -221,6 +222,20 @@ python buildhistory_emit_pkghistory() {
>          items.sort()
>          return ' '.join(items)
>
> +    def preservebuildhistoryfiles(pkg, preserve):
> +        if os.path.exists(os.path.join(oldpkghistdir, pkg)):
> +            listofobjs =3D os.listdir(os.path.join(oldpkghistdir, pkg))
> +            for obj in listofobjs:
> +                if obj not in preserve:
> +                    continue
> +                try:
> +                    bb.utils.mkdirhier(os.path.join(pkghistdir, pkg))
> +                    shutil.copyfile(os.path.join(oldpkghistdir, pkg, obj=
), os.path.join(pkghistdir, pkg, obj))
> +                except IOError as e:
> +                    bb.note("Unable to copy file. %s" % e)
> +                except EnvironmentError as e:
> +                    bb.note("Unable to copy file. %s" % e)
> +
>      pn =3D d.getVar('PN')
>      pe =3D d.getVar('PE') or "0"
>      pv =3D d.getVar('PV')
> @@ -248,6 +263,14 @@ python buildhistory_emit_pkghistory() {
>      if not os.path.exists(pkghistdir):
>          bb.utils.mkdirhier(pkghistdir)
>      else:
> +        # We need to make sure that all files kept in
> +        # buildhistory/old are restored successfully
> +        # otherwise next block of code wont have files to
> +        # check and purge
> +        if d.getVar("BUILDHISTORY_RESET"):
> +            for pkg in packagelist:
> +                preservebuildhistoryfiles(pkg, preserve)
> +
>          # Remove files for packages that no longer exist
>          for item in os.listdir(pkghistdir):
>              if item not in preserve:
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#204663): https://lists.openembedded.org/g/openembedde=
d-core/message/204663
> Mute This Topic: https://lists.openembedded.org/mt/108536777/3617156
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ma=
rtin.jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

