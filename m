Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E80F8C3DA7F
	for <webhook@archiver.kernel.org>; Fri, 26 Jul 2024 12:23:38 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web10.59493.1721996613553777251
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Jul 2024 05:23:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HT3lZfzP;
 spf=pass (domain: gmail.com, ip: 209.85.214.178, mailfrom: rybczynska@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1fc66fc35f2so4245465ad.0
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Jul 2024 05:23:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721996613; x=1722601413; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5aYfGcm/Xuj2i67mwoUJ1+hO57mA//4qxL0UZtep/is=;
        b=HT3lZfzP01//1B+XYpg/4FhQlviIntO2g5baeyOQhbRSp1Mfzq5AX793Bv30IkF8Od
         Bp9k5gY1sLR9/Q00HkVwlqo55wXnP6ppkU2mQwVbmhPOCvjZw5ePQ8LkyAYXO0korLkQ
         yLtE6cYCYaAKfkgenCUcDtnOs63T5AM6nKGAXa3R7Jyu3PpZPEf8RzKd6f6Airzg/l0Q
         msjqoy87+/X+Dn54dpKCY46AAIhdkg4sXHPE1+Y4qeaRoUtCgjHD1I5L0QU/hZ7gpLA/
         LnucKWb2lkNcUPFdv+bB6BsxCy7B9pKkiqxlb4/hVl6Sba3UcX/d4GyFK1b51hvzGYnJ
         00Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721996613; x=1722601413;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5aYfGcm/Xuj2i67mwoUJ1+hO57mA//4qxL0UZtep/is=;
        b=Kg9ImcBQb4PFF6D7YqfNiDbGUxiFZpZUVHiHzagnZhi2RYFCiAPPc5Z0UPX9RBRhlW
         b2mtIy8tFLvG1DNgAxZF9L6R/5te1I3XdcQcXJPKofGpWu4gSB39yATLHTeuGWwxT+8m
         GKfcv6tWSOymTUDxocn9GIGAPhQa/XSl4FPDkyVjarhXYZgytxUbi2wELbm7Jx2E1v+5
         w77LrsmU4gOTfM371iSPNjMK0/DnI7K6G4Wz9Mn4iL/4l3/BKnJx3zxXkN6MR2av3SmE
         9rtJDdUJu7VkwCmvrQwGxz1SscnpSzxsWxAifpUZP6MX/W/mXiEmYQ6MakpwhBXAyINr
         xytg==
X-Gm-Message-State: AOJu0YyZnPyXgcJXB8DgQPYltnyezRkp2lTlCHDBs5vlYoIeCX8PLwDm
	nVH2nlaGwer+NFEfPHEPp9Ba3+oa72WIHsRG3hrltCC8pypX/0mZXulnBW68GPbmSQkRUKEAy2i
	eDbJiX1aDivKbnzF9xL7IHpnnsa9waw==
X-Google-Smtp-Source: AGHT+IE8YxD4LAeeHt0A8VTI3slv6Qa+ohyYSofOhua2gjMcjo6BG2i7XsICnIV+P1pRZALJLxi/lyIX1h5QnzjrjAc=
X-Received: by 2002:a17:902:cecc:b0:1fd:6ca4:f987 with SMTP id
 d9443c01a7336-1fed277fb1emr110692675ad.15.1721996612914; Fri, 26 Jul 2024
 05:23:32 -0700 (PDT)
MIME-Version: 1.0
References: <20240724152530.25856-1-marta.rybczynska@syslinbit.com>
 <20240724152530.25856-3-marta.rybczynska@syslinbit.com> <3F580A6C-E380-4B95-9224-1F1336444B31@arm.com>
 <37438422-9E9A-41DB-86BB-988D46628ECF@arm.com>
In-Reply-To: <37438422-9E9A-41DB-86BB-988D46628ECF@arm.com>
From: Marta Rybczynska <rybczynska@gmail.com>
Date: Fri, 26 Jul 2024 14:23:21 +0200
Message-ID: <CAApg2=Q_rO2GuYy1+XTbRzFY6nR=TsfJGD6=iifrQYK78iWwpQ@mail.gmail.com>
Subject: Re: [OE-core][PATCH v3 3/5] vex.bbclass: add a new class
To: Ross Burton <Ross.Burton@arm.com>
Cc: ",openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	Samantha Jalabert <samantha.jalabert@syslinbit.com>
Content-Type: multipart/alternative; boundary="0000000000006ad52e061e2594ff"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Jul 2024 12:23:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202533

--0000000000006ad52e061e2594ff
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 26, 2024 at 2:12=E2=80=AFPM Ross Burton <Ross.Burton@arm.com> w=
rote:

> Also we should add a selftest for this class, to verify that the output i=
s
> as expected.
>
>
Yes, we'll add that.

Kind regards,
Marta

--0000000000006ad52e061e2594ff
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Jul 26, 2024 at 2:12=E2=80=AF=
PM Ross Burton &lt;<a href=3D"mailto:Ross.Burton@arm.com">Ross.Burton@arm.c=
om</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">Also we should add a selftest for this class, to verify that the output i=
s as expected.<br>
<br></blockquote><div><br></div><div>Yes, we&#39;ll add that.</div><div><br=
></div><div>Kind regards,</div><div>Marta <br></div></div></div>

--0000000000006ad52e061e2594ff--

