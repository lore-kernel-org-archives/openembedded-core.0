Return-Path: <anibal@limonsoftware.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97A56C54F30
	for <webhook@archiver.kernel.org>; Tue, 27 May 2025 15:59:03 +0000 (UTC)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
 by mx.groups.io with SMTP id smtpd.web11.55767.1748361536938288257
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 May 2025 08:58:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@limonsoftware-com.20230601.gappssmtp.com header.s=20230601 header.b=dNwwVYZB;
 spf=pass (domain: limonsoftware.com, ip: 209.85.128.176, mailfrom: anibal@limonsoftware.com)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-708d90aa8f9so29554797b3.3
        for <openembedded-core@lists.openembedded.org>; Tue, 27 May 2025 08:58:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=limonsoftware-com.20230601.gappssmtp.com; s=20230601; t=1748361536; x=1748966336; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=scoQN552/HAfqyYkUg1R8/MqGo87Ma5agLWocWplLkw=;
        b=dNwwVYZBY0FtTLHphBK02/t3fE+fVj5ospA77/pTMPIMJJyvkceAEKKO/3yviJ6oz3
         08XnKaRjXFhkS1FAe7KOlHj7vxQ/T/4yvR9Uxa9clFQNogQKYn9JEbJBkxZKetQ1byAe
         7cYGUW8kfJV6B+FKP/m/pvWweBHIoyX5knvx4GmzPPJcf6YR1RyU3DVuMaVI5G+Awws/
         WBS6YHYmVrXSIi0kxh9+SjbNmSPdFTlTBLjRKFRejDRJ9TQ6Uk3WmLyyxCsJSRnlhtyz
         M8DsQ0dmL1ZyjRhyGz89R9u2P060oQI4EKKogjA4T1PsyHEG0JkalHN3PUIuyHlYW4Oo
         rxmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748361536; x=1748966336;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=scoQN552/HAfqyYkUg1R8/MqGo87Ma5agLWocWplLkw=;
        b=HcrTIQftG8qT0s2JnOFoOrf9On1LCkTMNOyO4QpLQOm9X59+PCaGrs1psOaPlqScUJ
         VL9pYLHdPbOukN/5vEvgJGfD4wLvA3d6Ce+kRfMu0kzFeB0+6Cyg9BuGiy6Dptq2AE0q
         ufNAcU2b+Gi5DYZNbrlI9yCXiyR4vc46n904JyYN0Vvp7qoI79R5Hu/qcjmk48Kgti6M
         LmXUQ6WrSoUF9FcHfjCmW8joSbNvcqUC3UcjKsf7UJHyz5sbxpYZH53M2LaCS5IfkNWw
         9PHey/MMdjw83N21I1t7CC0+FwvWei6oJNDAisaW58BQi5jLIi7qPT1+4ce7kxDs+dXG
         Y3zA==
X-Forwarded-Encrypted: i=1; AJvYcCXrgmSLVCXSdyu+M2a/4dUUAgpcKY82v5AgLnoq1YSeOC8Urbpwsx5e9a2pVtAgvgjuN4g9J3vdtOLIeeYfhtKNAg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwBAfH6LXff9AsKOsyedET54hL0GpU+me9iMsmK8KbG+/IJUw+4
	R6MljBtwnfHX3ev9qmKdE2kq/IUVzwga3ysVuYcQuCZhRIgL6IJ2Lmsg4wi4J8J/tqqsXelTUKD
	iGfei+rQJKV4yn/H92zYyWtdzcoyX22rgW+wSlZw/9Q==
X-Gm-Gg: ASbGncuyeSUPqrKL4h5gRdqTOtEOIJLoHy6POqp4tKsfx7tJcgZXyU2inVfMWyqDVh8
	4a8VYSpfiOdrSiK5LxSmwnoVq3BXNQhvpt0Io9kOHamxPNm7DC3UleUNFObk6IIIvZFuQHt1ahN
	SURuMQPDlQCUZLoAlpjgv5p6pp5SS3BIOwr3g=
X-Google-Smtp-Source: AGHT+IE/8T/Dx4Ql/4GwZUain31PcGOzDFJ1ZFd7l+CFxhktRHLfE0VbUb16/E072TIDkHmyjK6MxuMhXmtpJR9nxJM=
X-Received: by 2002:a05:690c:7484:b0:70e:20bb:7aee with SMTP id
 00721157ae682-70e2d993343mr177980097b3.15.1748361536087; Tue, 27 May 2025
 08:58:56 -0700 (PDT)
MIME-Version: 1.0
References: <20240323195304.2909926-1-anibal@limonsoftware.com>
 <20240323195304.2909926-2-anibal@limonsoftware.com> <20240325101809ec807440@mail.local>
 <17C008DA5E69D9E5.27941@lists.openembedded.org> <183C6D415DE5406F.22941@lists.openembedded.org>
 <CAOU5ZMu4ysbugdvOJ4Q1YqVK4nD8frX_wAeo-mSJXRCG3tTQFA@mail.gmail.com>
 <fa7b5f9f72d23b279f8d933a7ccf4d40c629e381.camel@linuxfoundation.org>
 <CAOU5ZMtUY=pP_U+nhdyNDkKS-cGctG1ymEAXqQ6iMe4bFdEBCw@mail.gmail.com> <be0202a16d696f29ac3c583ad764813a98e96b68.camel@linuxfoundation.org>
In-Reply-To: <be0202a16d696f29ac3c583ad764813a98e96b68.camel@linuxfoundation.org>
From: Anibal Limon <anibal@limonsoftware.com>
Date: Tue, 27 May 2025 09:58:44 -0600
X-Gm-Features: AX0GCFtMLpPBYAV-8iz_kkG1kODOkenV69mZIB_NPSpqZpJvz8AHbAIGH-qTvAM
Message-ID: <CAOU5ZMt47eVrsKxAH8a7E83J9tRgtU0bOYt7gFzAErMkrZf--Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] wic: plugins source bootimage/isoimage
 rename to allow be imported
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, openembedded-core@lists.openembedded.org, 
	bruce.ashfield@gmail.com
Content-Type: multipart/alternative; boundary="0000000000004c3c17063620245e"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 May 2025 15:59:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217313

--0000000000004c3c17063620245e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I will fix the failures and add the proper migration doc to the patch.

Thanks!,
Anibal

On Tue, May 27, 2025 at 2:04=E2=80=AFAM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> Hi Anibal,
>
> On Mon, 2025-05-26 at 10:30 -0600, Anibal Limon wrote:
> > Yeah, I understand, let me know any further breakage I can fix.
>
> I have patches for oe-core and meta-yocto to fix the issues there.
> meta-virtualization fails, I believe you have fixes for that. meta-arm
> and meta-intel also showed issues:
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/75/builds/1599
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/41/builds/1561
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/89/builds/1574
>
> I think the missing pieces to get this merged are:
>
> * A note for the migration guide explaining what changed and how to fix
> it
>
> * A tweak to wic to warn about "-" characters in the plugin name. This
> might be able to translate "-" to "_" with a warning to allow some kind
> of slightly easier migration? At the very least we should give users a
> better error with a hint about how to fix it.
>
> Cheers,
>
> Richard
>

--0000000000004c3c17063620245e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I will fix the failures and add the proper migration =
doc to the patch.</div><div><br></div><div>Thanks!,</div><div>Anibal</div><=
/div><br><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" =
class=3D"gmail_attr">On Tue, May 27, 2025 at 2:04=E2=80=AFAM Richard Purdie=
 &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org">richard.purdie@l=
inuxfoundation.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">Hi Anibal,<br>
<br>
On Mon, 2025-05-26 at 10:30 -0600, Anibal Limon wrote:<br>
&gt; Yeah, I=C2=A0understand, let me know any further breakage I can fix.<b=
r>
<br>
I have patches for oe-core and meta-yocto to fix the issues there.<br>
meta-virtualization fails, I believe you have fixes for that. meta-arm<br>
and meta-intel also showed issues:<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/75/buil=
ds/1599" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproj=
ect.org/valkyrie/#/builders/75/builds/1599</a><br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/41/buil=
ds/1561" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproj=
ect.org/valkyrie/#/builders/41/builds/1561</a><br>
<a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/89/buil=
ds/1574" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproj=
ect.org/valkyrie/#/builders/89/builds/1574</a><br>
<br>
I think the missing pieces to get this merged are:<br>
<br>
* A note for the migration guide explaining what changed and how to fix<br>
it<br>
<br>
* A tweak to wic to warn about &quot;-&quot; characters in the plugin name.=
 This<br>
might be able to translate &quot;-&quot; to &quot;_&quot; with a warning to=
 allow some kind<br>
of slightly easier migration? At the very least we should give users a<br>
better error with a hint about how to fix it.<br>
<br>
Cheers,<br>
<br>
Richard<br>
</blockquote></div>

--0000000000004c3c17063620245e--

