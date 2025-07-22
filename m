Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 720FEC83F27
	for <webhook@archiver.kernel.org>; Tue, 22 Jul 2025 12:27:33 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
 by mx.groups.io with SMTP id smtpd.web10.11347.1753187248466879131
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Jul 2025 05:27:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=bdyNaep9;
 spf=pass (domain: mvista.com, ip: 209.85.208.47, mailfrom: vanusuri@mvista.com)
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-60702d77c60so10549422a12.3
        for <openembedded-core@lists.openembedded.org>; Tue, 22 Jul 2025 05:27:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1753187247; x=1753792047; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ybxUSy3PheaySABd5WL7MHqqjWNkp6uSc0V0weCTMhI=;
        b=bdyNaep9bkoCqj7i5VemjAr+bgRLz0DLn4n8PlDjV5FcM2SnUmhloMOLvqZzK4x9/7
         QV5pcsPsIf+mjeXIO+j6ciX5FF4CDyTA1p9Z8uKEU6tmF7LtBWTnrrx5CB0DoM6yoMRq
         FJvhGB+3pkPQ4+9V/AbJ88ett8+xlnYfrxSrg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753187247; x=1753792047;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ybxUSy3PheaySABd5WL7MHqqjWNkp6uSc0V0weCTMhI=;
        b=K9PwHl4VUCwJQTMKp1WSSdo/+sgytKJy1GbkOlClRT8nBxclxfZaaU07iaCRjROy54
         rOBk4ZD1f5KixDQkZfjEHX/tfKIvn6dA1kcPFjU9EDYZAq0T4bkcTfmOB5zh9PscRMh2
         5CbbL5qjEcVVkIwPi/n1ObHEf6uis3UtBIUNgiy7GFE3JulbGu1cs7YRwAjfpV+4ZTbq
         RoEtDbrv8bICuR2dQZc0QxN/P6kimj+T36lDgsCiZLegXSGvZbTldTsywcIXZvSjzhpI
         ww8VrpueYPcvMXWljnQdy9bClU1Qx7mnrzrVOptj0XJ+hk0jW5vYnIdQbMyXlinTW5I6
         Etqg==
X-Gm-Message-State: AOJu0YyWPG+N6nolMsDHVeGtxF5LCJlf99DGxZ02afsCb9o5FNkrU0NF
	hyNXtfctXBJ3mFuiEmO6aa38nF9y/Zjp9gq3AlQ9aIFFvrUpAEYH6RXw4/3b5oVKuvZZyLlD1uY
	2HpeuDLJGpaYa++JV1VyzB3xQkR7H414/Eraw1KHR3A==
X-Gm-Gg: ASbGncuJ5jJ6u2g39VVL6FcuLV16NVHXZwpycU09WL92l4pcL1sPUVZ0/S+3TOYwlJX
	sZopZhSpDJIHL8ez7vvWgXrNtnOrWzUI28C3NROIq9R7AmIeFt1UY6g3D4DJ18NkSk9MZQfj/NE
	vXu7/tCV+bd4hyduCbHVVhy7fX+puaAQ2cpT+RtmCqhDj0q9fZUe16YVjCQLQoE+xgY2clT4LBN
	g60Vro=
X-Google-Smtp-Source: AGHT+IGx55dLFaXq/XYd580gM/Quaws/F7lbcJYV22b87ikNtoI9kOL+LjDOi/x/oY1SrIf+bm2GWymQA0FHtGE/ipQ=
X-Received: by 2002:a17:907:c248:b0:ad5:3a97:8438 with SMTP id
 a640c23a62f3a-ae9c9b5b350mr2457309866b.41.1753187245810; Tue, 22 Jul 2025
 05:27:25 -0700 (PDT)
MIME-Version: 1.0
References: <20250701103252.6703-1-vanusuri@mvista.com> <CANQUz18dZfkQWXPC9ZgVc-VP86Q3-pPcpHL31K8PbTF7k-17Ng@mail.gmail.com>
 <70ca79e9b3c8bc151b21951d710f21b5f66dcc36.camel@linuxfoundation.org>
In-Reply-To: <70ca79e9b3c8bc151b21951d710f21b5f66dcc36.camel@linuxfoundation.org>
From: Vijay Anusuri <vanusuri@mvista.com>
Date: Tue, 22 Jul 2025 17:57:13 +0530
X-Gm-Features: Ac12FXymUq3C1CtxsPTnxSA7kX5dip74Dc2xdrzIJoEkYoa9C_haPfweDu_BUik
Message-ID: <CANQUz19VQ8+yxRPjj8sxWfV2OC46UMhC+549Oua3_HO1gtSz8w@mail.gmail.com>
Subject: Re: [OE-core][master][walnascar][scarthgap][PATCH] xserver-xorg:
 upgrade 21.1.6 -> 21.1.18
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org, 
	Steve Sakoman <steve@sakoman.com>
Content-Type: multipart/alternative; boundary="0000000000000304ad063a83b7ce"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Jul 2025 12:27:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220738

--0000000000000304ad063a83b7ce
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Richard,

Thank you for accepting the patch.

Hi Steve,

Thanks for your suggestion. Hereafter I will send patches separately.

Thanks,
Vijay




On Tue, Jul 22, 2025 at 12:47=E2=80=AFPM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Mon, 2025-07-21 at 12:45 +0530, Vijay Anusuri wrote:
> > Any update on this ?
>
> For some reason I didn't have the email at all. I did pull it out of
> lore, testingit and it is now applied.
>
> Cheers,
>
> Richard
>

--0000000000000304ad063a83b7ce
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Richard,</div><div><br></div><div>Thank you for ac=
cepting the patch.<br><br></div><div>Hi Steve,<br></div><div><br></div><div=
>Thanks for your suggestion. Hereafter I will send patches separately.</div=
><div><br></div><div>Thanks,</div><div>Vijay</div><div><br><br></div><br></=
div><br><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" c=
lass=3D"gmail_attr">On Tue, Jul 22, 2025 at 12:47=E2=80=AFPM Richard Purdie=
 &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org">richard.purdie@l=
inuxfoundation.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">On Mon, 2025-07-21 at 12:45 +0530, Vijay Anusuri wrote:<b=
r>
&gt; Any update on this ?<br>
<br>
For some reason I didn&#39;t have the email at all. I did pull it out of<br=
>
lore, testingit and it is now applied.<br>
<br>
Cheers,<br>
<br>
Richard<br>
</blockquote></div>

--0000000000000304ad063a83b7ce--

