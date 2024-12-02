Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76E19E69EA2
	for <webhook@archiver.kernel.org>; Mon,  2 Dec 2024 23:54:49 +0000 (UTC)
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
 by mx.groups.io with SMTP id smtpd.web10.7636.1733183684340864979
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Dec 2024 15:54:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TNdAAuPa;
 spf=pass (domain: gmail.com, ip: 209.85.210.48, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-71d51a9a42bso2293117a34.1
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Dec 2024 15:54:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733183683; x=1733788483; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5QiXZW30alH/5A9qNvfMMcQ//r+Ugjw9vYLBqoiCSXc=;
        b=TNdAAuPasKQQaw9zdx3EGa6alumcvpAufxWnBt3MCGpxmyvSDYgTmjES3O+AibWV2f
         2WaqGXwHAusQTVEdTItlJ16WLV9bJcMZzC1LgiI3F0mfHsZZWaOsiB+vxZn2mxoVOKAX
         Ge8aLfMln/26YGV46690AtJaEc4LADWbZ2/94oPJQM3XtjBQ0TnGANJ6NSDu/TKFt/vs
         S2Nhc2rFPSJvC7weFpJPvS4VDqMKuCKn5T1MUaAb6IiMZrYE3Se6sfEPw0ucq822UbZb
         N8bQ+uG1IjKTpbjIeCHhFLpDoXCwi615bu74i1sOJKgTvMEYG9LO0RqJEXUSDf8YhDA/
         6TaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733183683; x=1733788483;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5QiXZW30alH/5A9qNvfMMcQ//r+Ugjw9vYLBqoiCSXc=;
        b=GRzWpAjxVPWaLM8MtGeG0WvdkNpzrKwbkCX1Slz2ohhAntY2qQeRn3rD9Wn9C8EfKB
         4jF3kMTT92T0K+Kqp/C0rC5K9ZIe/WIGMjo0SIqy2c0eianrBnE/ngWt3w/bzXd+LBQf
         qKLbo2BPpxjFjk+/vZUDZHXXZhEe//L0biNcZH3MpqyQzLFOo4PEtn5mtolMHXl4cNhQ
         zW7JcGtvtc7zjlyWEnZy652Xphmkps1/rKAphjpC6XKigEXJRby1rKMXE3StBmGxSLxP
         JrbxZQdGlPsCGFS1Y6w/A/haxsM2SHZ9DrplhTkrkQ2KknsBMCZ7Vp0VpUmZ1JUhrQrS
         euhg==
X-Gm-Message-State: AOJu0Yx+ble22YN/7AYCcJrjVGT+mT2rYnbntQ3kK+DVDVOIKJcDIEvW
	mALjmFuCvCCEWhCLrnPkaYRf39rXQyfKAdCKPpbvkwiodofUwU+r46abKBn/K+W1RSYpaHT45MD
	mw065jUqKvuEDr5vM+wEyrbFLqi3xLw==
X-Gm-Gg: ASbGncs90PTXiLy+UKnmaoz6/cKsLUuXZOW2h0L+EXD6Hwt34YCF2Rzek3MoYXEMGa4
	JZgIY6sAF51Lq97/00XjImlkLK6pj8MPTntK7WHazSXbyJA==
X-Google-Smtp-Source: AGHT+IG8lbe/A932PP7q/UAOPgwaU+Pw0yuB4+TiRcostUGh8u1aRTWk7+mSZaYdke0F5GJOuLyChZo5C9SU0TROyMM=
X-Received: by 2002:a05:6830:610d:b0:718:4073:428f with SMTP id
 46e09a7af769-71dad67863cmr701370a34.16.1733183683594; Mon, 02 Dec 2024
 15:54:43 -0800 (PST)
MIME-Version: 1.0
References: <20241202232130.33442-1-richard.purdie@linuxfoundation.org>
In-Reply-To: <20241202232130.33442-1-richard.purdie@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 2 Dec 2024 15:54:16 -0800
Message-ID: <CAMKF1sp4spCkHxc6JZRP323g9ZHN24e=y9bM_JsL9D64LahxpQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] buildhistory: Drop git-gc call as obsolete
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 Dec 2024 23:54:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208167

On Mon, Dec 2, 2024 at 3:21=E2=80=AFPM Richard Purdie via
lists.openembedded.org
<richard.purdie=3Dlinuxfoundation.org@lists.openembedded.org> wrote:
>
> buildhistory used to result in many individual objects in the repo which
> could affect performance. This gc call was added over a decade ago to avo=
id
> those performance issues. Modern git calls git-gc when needed and this ki=
nd
> of workaround should no longer be needed.
>
> There is a small chance this is contributing to problems with the autobui=
lder
> buildhistory repositories, so simplifying the code may help that too.
>

I do run into situations on git repos often that requires running git
gc to fix them but I think
repo optimization should be left to user on those grounds I agree to remove=
 it.

> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/classes/buildhistory.bbclass | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistor=
y.bbclass
> index ce3abaa69d4..d735dd5fb5d 100644
> --- a/meta/classes/buildhistory.bbclass
> +++ b/meta/classes/buildhistory.bbclass
> @@ -877,7 +877,6 @@ END
>                         # Porcelain output looks like "?? packages/foo/ba=
r"
>                         # Ensure we commit metadata-revs with the first c=
ommit
>                         buildhistory_single_commit "$CMDLINE" "$HOSTNAME"=
 dummy
> -                       git gc --auto --quiet
>                 else
>                         buildhistory_single_commit "$CMDLINE" "$HOSTNAME"
>                 fi
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#208162): https://lists.openembedded.org/g/openembedde=
d-core/message/208162
> Mute This Topic: https://lists.openembedded.org/mt/109891145/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

