Return-Path: <wak@google.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58D3AC25B47
	for <webhook@archiver.kernel.org>; Fri, 27 Oct 2023 21:44:49 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web10.27228.1698443079502569406
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Oct 2023 14:44:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@google.com header.s=20230601 header.b=gKyJXghz;
 spf=pass (domain: google.com, ip: 209.85.218.52, mailfrom: wak@google.com)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-9a6190af24aso406983466b.0
        for <openembedded-core@lists.openembedded.org>; Fri, 27 Oct 2023 14:44:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1698443078; x=1699047878; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zqLDIfuTv0C42uXVDrTnFpL1zGQbrIB7Zn8/XC2RpWA=;
        b=gKyJXghzWm67WT8JCCdBFTRDOUDpatx+vDAK6FbEY1t2LSL5SfNTTi4/DOphmWQMrK
         3ggnbiaiFRThuPFjqVWtHxscix5lz1JZxaVFUZNctuEVm4ynOMP0WyiFtNOvgvra9jhl
         RzYtTDjaBxeWZm47+nfUxWoHNa2CBduVARFya4LrJAOkWakKNoJRepz5qUMo5W9RULpc
         FjayvlUnP310gtx7oGd74WcDjI/sGmty1U/QC7cAcEsthJbOjs8BAMPklLFCjVMDid0H
         zHeA6cKkG4yIp1Oif/FCQNfRsbhkpRP9b32QseNIsW/AJaQL21JldulxDSOiSCpmRnkM
         guUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698443078; x=1699047878;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zqLDIfuTv0C42uXVDrTnFpL1zGQbrIB7Zn8/XC2RpWA=;
        b=g3ENxTRgv7vJjgYuOzKq8/OhfmdJQjfhDM7HUcm5iQ7dy2JYpah3PvM1QT9vZ5oRs5
         5GgruVRoeYyk4LO3iWZ41fNAjy/GOkwRYILtkAtsbRxmwo+sz4HVtw59oQWXpYCrJXPg
         TlX27shiEnei/GY1WrGavX9LIKBH1axJCahdfEwKFbdcbPz2ATFbmCv9QBFruJV4VpHF
         OzzkXHR57WacAlt+6ddfzdJn1RZ8/+fZF8binGTkgnzP6zzlA/naq+R4dkcGtAhklKFD
         qTgIlHPa+pl7NDk4alR4bU1GrdlVuBEEMd34ukED+0NQpCXYcPC2dXMk+Vmn2ecYZUVB
         +3MQ==
X-Gm-Message-State: AOJu0Yw8/aTygR700hL7tXMSdbuR/8ytar7/rHQsr1ZhL5yvEK2OwCW/
	bJf8WNVgDs1JfAg5pTpjhvKbgo2gljy3bW9Fkp9kaA==
X-Google-Smtp-Source: AGHT+IE/jIO25fO3H+IfCOXcARey9ZUATNY0LMb9KUh7ZKSNMI9Ijs6uNwm2HQtl8l0MNmk/xnijA1dOs8Ho5Tq1kmk=
X-Received: by 2002:a17:907:3f20:b0:9bd:b8d0:c096 with SMTP id
 hq32-20020a1709073f2000b009bdb8d0c096mr3340507ejc.21.1698443077782; Fri, 27
 Oct 2023 14:44:37 -0700 (PDT)
MIME-Version: 1.0
References: <20231025223710.93502-1-wak@google.com> <20231027120846.5466ec42@booty>
In-Reply-To: <20231027120846.5466ec42@booty>
From: William Kennington <wak@google.com>
Date: Fri, 27 Oct 2023 14:44:25 -0700
Message-ID: <CAPnigKnvJ55BBc0+Gti38aLpoyZXNK6ztx7yz4HRsm7zparjnQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] kernel: Commit without running hooks
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: "William A. Kennington III via lists.openembedded.org" <wak=google.com@lists.openembedded.org>, 
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 27 Oct 2023 21:44:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189754

On Fri, Oct 27, 2023 at 3:08=E2=80=AFAM Luca Ceresoli <luca.ceresoli@bootli=
n.com> wrote:
>
> Hello William,
>
> On Wed, 25 Oct 2023 15:37:10 -0700
> "William A. Kennington III via lists.openembedded.org"
> <wak=3Dgoogle.com@lists.openembedded.org> wrote:
>  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>
> As you can see your sender address has been mangled, and as a result
> the patch is rejected by the the openembedded git server. This is not
> your fault, but we need you to modify your git configuration to prevent
> this from happening in the future. Have a look at the Contributor Guide
> for more info:
>
> https://docs.yoctoproject.org/contributor-guide/submit-changes.html#fixin=
g-your-from-identity

Ah interesting, I didn't know there was a missing setting and assumed
it was our special mail server config that always caused the issue.

>
> I'm taking your patch for testing on the autobuilders, fixing it
> manually so you don't need to resend your patch this time.
>
> Best regards,
> Luca
>
> --
> Luca Ceresoli, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

