Return-Path: <chuckwolber@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F28DC369C7
	for <webhook@archiver.kernel.org>; Thu, 17 Apr 2025 04:39:25 +0000 (UTC)
Received: from mail-il1-f176.google.com (mail-il1-f176.google.com [209.85.166.176])
 by mx.groups.io with SMTP id smtpd.web10.1490.1744864758873676390
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Apr 2025 21:39:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NICu8HeZ;
 spf=pass (domain: gmail.com, ip: 209.85.166.176, mailfrom: chuckwolber@gmail.com)
Received: by mail-il1-f176.google.com with SMTP id e9e14a558f8ab-3d5bb2ae4d3so1510915ab.0
        for <openembedded-core@lists.openembedded.org>; Wed, 16 Apr 2025 21:39:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744864758; x=1745469558; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=O6wEljnZumLG3+kDqxYFumXDhxJfzVusBHBqIcnuYSY=;
        b=NICu8HeZ6hAoofCtI8AsVmeZiSoqpPEtwNvW/Fx/Hy9UEf5jtlNeehM2evQnJMYPMY
         OBcAh+XeW1ePifEQ6VMbmaarRHkEZvxSMwh9HXO+b1piAa/C7IYpqPx9Oask3JFEYNFf
         5dkuUpuGFw9zySlNwToy7bBviwTKItTB3evFYDE3K5G5nPFfhbare+QdjVwZVoc0lNAE
         rTgnRV3B+cPrCmc8HdhR6DwPElctY6Uoj/v4hbFWQIBySeVwoYK+kFLp2jO7fmtySxVf
         azyoIJFFMmBlkawZaTBnZidurpiBVVAKzDlXB6pGvcXw5aKGzlNBCfx9W5DPmN8+SWtz
         IWIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744864758; x=1745469558;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O6wEljnZumLG3+kDqxYFumXDhxJfzVusBHBqIcnuYSY=;
        b=Fwiva8DY3WlqMF+hZc4/s+zK+BrRXx1SZPcxm/iwScnunJuapw9tzdJJtRnIb6Nrct
         DgIHsDR4qeCI3AaKAvFH9t643ujEPXL24k66JYrWdNXx/pZmrlSaNNt9P1di4KUtuTYz
         JsPqS+L0tf6vxk7XBB8giHxbaY7LjF5AgAN9U7gwatvfVsCcWLp92YnU7FC5KLMFa4QA
         +1etedd94srEJKYLoab63FgUG08LSyhOufkrTgU4ik7qikfg2NmTHVN9J0U/mcjnitJ7
         hrZhSzwUjsFVUynnjaPHMp8+yyI76PfnpNHpZkoIkF5JUKxEMqedk5YFCJeyNl1yH6II
         oEFA==
X-Forwarded-Encrypted: i=1; AJvYcCXww4woEmPFmGgcVeNKifXB96X87wky/U2wPY9L9NGSaVeUNVLF2MIHTzrqcwQit/n7TmMyXE70+eRBeDVAT02rjQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwyU6WCxn/+Hpj8Pul2fZBb9rODtwuLauPR/h7SARIjjzTDqclO
	TAZJxIRc5y8OoBzZmY8zwelRArqXcIkyMhmepjxB2qNfOw2Sa9OFddcPGw+Y1jt8SGIeB8MEWEP
	W40LrBtUOpXiAPLn1cQCiIKQYNV8=
X-Gm-Gg: ASbGnctAAgC8o/pNIsk8MDKOZaf7nAtFhuzoG9b2gKA4VfDSiTkkYwiPvZSn5dPvJEv
	emV+5uksHF4wbh61phUN5/rlJSo4TEXo2r29JYQ1GUpKFNpxZMc/f96QiOYsjgzAJ6u18jVkX5R
	zxmFpLkkHxfawiCpETEESf1n9iMVieOQfYscGWbkfdVJJEka+4q4wRmyE=
X-Google-Smtp-Source: AGHT+IEx/je37EIYgC7Hd0WsMqwDr6iezqeE62dTXblYYiOk3QeVed7PwxW2D+zMBaFgbev9bR5POLrQEfmtOQoAAis=
X-Received: by 2002:a05:6e02:1524:b0:3d0:47cf:869c with SMTP id
 e9e14a558f8ab-3d815b6a852mr50468595ab.19.1744864757917; Wed, 16 Apr 2025
 21:39:17 -0700 (PDT)
MIME-Version: 1.0
References: <20250416164134.399-1-thune.a.tran@boeing.com> <dd0877909b1240d999dae6979ce1efa269180173.camel@linuxfoundation.org>
In-Reply-To: <dd0877909b1240d999dae6979ce1efa269180173.camel@linuxfoundation.org>
From: Chuck Wolber <chuckwolber@gmail.com>
Date: Wed, 16 Apr 2025 21:39:00 -0700
X-Gm-Features: ATxdqUEetRzdUA-bm_fzI-xufD7V_P3c-CHRGmJmdkbVgi_RK-SXqeplB1Z_W0Q
Message-ID: <CAB=6tBQsqNJBqFsocxDQM9sOwz5S3w5HqkOO2cLuvH8OmSQ4kA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] oeqa/sdk/sdktest: Add test discovery across layers
To: richard.purdie@linuxfoundation.org
Cc: thune.a.tran@boeing.com, openembedded-core@lists.openembedded.org, 
	Chuck Wolber <chuck.wolber@boeing.com>
Content-Type: multipart/alternative; boundary="00000000000013b7d00632f1fc8e"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Apr 2025 04:39:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215038

--00000000000013b7d00632f1fc8e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 16, 2025 at 3:07=E2=80=AFPM Richard Purdie via lists.openembedd=
ed.org
<richard.purdie=3Dlinuxfoundation.org@lists.openembedded.org> wrote:

%< SNIP $<

>
> I suspect this causes some regressions in our automated testing
> unfortunately:
>
> buildtools:
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/43/builds/1396
>
> meta-mingw:
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/7/builds/1430


Would it make more sense to add self.context_executor_class.default_cases
to the list of paths returned by get_sdk_paths?

..Ch:W..


--=20



*  Opinions expressed are my own. | --------------------------------|------
"Perfection must be reached by degrees              she requires the slow
hand of time."                                 |       -Voltaire*

--00000000000013b7d00632f1fc8e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-family:monospace">On Wed, Apr 16, 2025 at 3:07=E2=80=AFPM Richard Purdie =
via <a href=3D"http://lists.openembedded.org">lists.openembedded.org</a> &l=
t;richard.purdie=3D<a href=3D"mailto:linuxfoundation.org@lists.openembedded=
.org">linuxfoundation.org@lists.openembedded.org</a>&gt; wrote:</div><div c=
lass=3D"gmail_default" style=3D"font-family:monospace"><br></div><div class=
=3D"gmail_default" style=3D"font-family:monospace">%&lt; SNIP $&lt; <br></d=
iv></div><div class=3D"gmail_quote gmail_quote_container"><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
<br>
I suspect this causes some regressions in our automated testing unfortunate=
ly:<br>
<br>
buildtools:<br>
<a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/43/buil=
ds/1396" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproj=
ect.org/valkyrie/#/builders/43/builds/1396</a><br>
<br>
meta-mingw:<br>
<a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/7/build=
s/1430" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproje=
ct.org/valkyrie/#/builders/7/builds/1430</a></blockquote><div><br></div><di=
v><div style=3D"font-family:monospace" class=3D"gmail_default">Would it mak=
e more sense to add self.context_executor_class.default_cases</div><div sty=
le=3D"font-family:monospace" class=3D"gmail_default">to the list of paths r=
eturned by get_sdk_paths?</div><div style=3D"font-family:monospace" class=
=3D"gmail_default"><br></div><div style=3D"font-family:monospace" class=3D"=
gmail_default">..Ch:W..</div><br></div><div>=C2=A0</div></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature"><div dir=3D"ltr"><div><b><span style=3D"font-family:monospace">=
=C2=A0 Opinions expressed are my own. |<br>=C2=A0--------------------------=
------|------ &quot;Perfection must be reached by degrees<br>=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 she requ=
ires the slow hand of time.&quot;<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -Voltaire</span></b></div></di=
v></div></div>

--00000000000013b7d00632f1fc8e--

