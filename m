Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD8C7CFD34E
	for <webhook@archiver.kernel.org>; Fri, 11 Oct 2024 11:18:09 +0000 (UTC)
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
 by mx.groups.io with SMTP id smtpd.web10.9148.1728645480876373428
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Oct 2024 04:18:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mVLmJN3c;
 spf=pass (domain: gmail.com, ip: 209.85.215.178, mailfrom: rybczynska@gmail.com)
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-7ea0ae67df5so1518413a12.2
        for <openembedded-core@lists.openembedded.org>; Fri, 11 Oct 2024 04:18:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728645480; x=1729250280; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZDPzIpojgYEqL/VLHcUdsCbczi7nivXrigLsL8oBysM=;
        b=mVLmJN3cqxwNNnX8GXcspFi+HlMbmt9g73rRT1JxmhiBqudmo9cz/iOb7DKkEpQJHx
         +pJILzOeM6mv2+3OnAKBi5aOChCXu+DcHIlL4JEFwvq7Ci6iGze/jTqxgKGP3K7TsjHX
         S530DFzf+9mQz97GFjkL1ikI1NQjh05yILLKyd6sg9SAfVLkB7NmENtn64BmxUP6yAps
         hdExbgGHZ4jykOfQ6IyxP7EDSxwxju2PLAZwEFYffAqHBoUcBce4RAQNyuktnOUq1nOp
         siHbJhOVjN+m7S6JFk6rr2LNIvxbWZEcFRJrCh3U2FSH7CRdmXcU7yQaVzdURMoQxAlV
         QLsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728645480; x=1729250280;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZDPzIpojgYEqL/VLHcUdsCbczi7nivXrigLsL8oBysM=;
        b=DFQtc8HhqB2Wo0vYvbZobyRNbRutcxRqKRNEBcoJDhcHu1/z2jXRhNI/pCalrPpDbr
         uZRoF9StnoscdAuH8HpB08ckM/k1hgySaVZepVDJe8NmwgD6ACDGTUsrDLZsfs7CWmkz
         JZcB/vCB6IiE0KuuXxllIzTKVVZpcrs680JV9IT9YkC+3Eel1/OEzl235HrwMKcqcfP6
         S/C8szWjXNbYqzjPPhVqngEbOhP7EXRjUfmp3bk+zjfif8/Z7xAXM60JAXcUDMuhal2t
         7PrWSp1nGGMqW8w0xrAzJ+dlTDSyHmfZ4c1xqMeRXh0aTFUcD+nZlE/Q3taabjx/BC1X
         mctg==
X-Gm-Message-State: AOJu0Yxj2t+ABRTs9x6zYFD+IDhghDrPQekxObfYbyr54MuRD6wsq3NM
	KNMHZ9w1hxJzaBPaeVjVFfB+bLHYGENJObu4iAePCfmUynunVlfb70JFfSW+FfOilIcdzVKRbuu
	JkJFVZmx4BYgAfqhg4oAx9hxsfnj6RQ==
X-Google-Smtp-Source: AGHT+IHsmWN6KW04EgEnVDtm1rJJN3GYUneKjHcAwEOFtj2/SvJNQZGXlqIhqMB1Y+EZCafhe/GUT9Y0+C6SE+v41eo=
X-Received: by 2002:a17:90a:bd96:b0:2da:8c28:6561 with SMTP id
 98e67ed59e1d1-2e2f0aec08amr2594293a91.22.1728645480145; Fri, 11 Oct 2024
 04:18:00 -0700 (PDT)
MIME-Version: 1.0
References: <17FD60BEC9A54A4B.2207@lists.openembedded.org> <8281d9cb51a5e652f99ed998fd71c7b6a84e1e63.camel@linuxfoundation.org>
In-Reply-To: <8281d9cb51a5e652f99ed998fd71c7b6a84e1e63.camel@linuxfoundation.org>
From: Marta Rybczynska <rybczynska@gmail.com>
Date: Fri, 11 Oct 2024 13:17:48 +0200
Message-ID: <CAApg2=RmrYULa7KMi6EMdGAhW3-uVA81ggVJg5BGDMSg0M0nLA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] cve-check-update-nvd2-native: Incremement
 DL_DIR database location
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org, 
	Marta Rybczynska <marta.rybczynska@syslinbit.com>, Steve Sakoman <steve@sakoman.com>
Content-Type: multipart/alternative; boundary="000000000000c96acc062431a3df"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Oct 2024 11:18:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205672

--000000000000c96acc062431a3df
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 11, 2024 at 1:02=E2=80=AFPM Richard Purdie via lists.openembedd=
ed.org
<richard.purdie=3Dlinuxfoundation.org@lists.openembedded.org> wrote:

>
> I now do have an example of a corrupted database:
>
> https://valkyrie.yocto.io/pub/shared-failure-data/nvdcve_2-1.db
>
> I'm not sure why this is happening but the older releases are all
> accessing the DB over NFS which makes me nervous. We're seeing a lot of
> failures on the new cluster, hopefully this will help isolate the
> problem.
>

The database isn't completely corrupted, it looks like it is partial,
however. What was the error
that you got in that build? Any or just strange results? I'm running a
verification vs a fresh database.

Regards,
Marta

--000000000000c96acc062431a3df
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><div class=3D"gmail_quote"><div=
 dir=3D"ltr" class=3D"gmail_attr">On Fri, Oct 11, 2024 at 1:02=E2=80=AFPM R=
ichard Purdie via <a href=3D"http://lists.openembedded.org">lists.openembed=
ded.org</a> &lt;richard.purdie=3D<a href=3D"mailto:linuxfoundation.org@list=
s.openembedded.org">linuxfoundation.org@lists.openembedded.org</a>&gt; wrot=
e:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
I now do have an example of a corrupted database:<br>
<br>
<a href=3D"https://valkyrie.yocto.io/pub/shared-failure-data/nvdcve_2-1.db"=
 rel=3D"noreferrer" target=3D"_blank">https://valkyrie.yocto.io/pub/shared-=
failure-data/nvdcve_2-1.db</a><br>
<br>
I&#39;m not sure why this is happening but the older releases are all<br>
accessing the DB over NFS which makes me nervous. We&#39;re seeing a lot of=
<br>
failures on the new cluster, hopefully this will help isolate the<br>
problem.<br></blockquote><div><br></div><div>The database isn&#39;t complet=
ely corrupted, it looks like it is partial, however. What was the error</di=
v><div>that you got in that build? Any or just strange results? I&#39;m run=
ning a verification vs a fresh database.</div><div><br></div><div>Regards,<=
/div><div>Marta<br></div></div></div>

--000000000000c96acc062431a3df--

