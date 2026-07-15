Return-Path: <sivakumar.bs@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BFE0C44501
	for <webhook@archiver.kernel.org>; Wed, 15 Jul 2026 11:51:33 +0000 (UTC)
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4376.1784116283493330762
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jul 2026 04:51:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=gIXUMJQy;
 spf=pass (domain: gmail.com, ip: 209.85.219.46, mailfrom: sivakumar.bs@gmail.com)
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-8f1a8e914a9so24096886d6.1
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Jul 2026 04:51:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784116282; cv=none;
        d=google.com; s=arc-20260327;
        b=n/+jik8DNClhGor9aNuWscI0x0wtKDHcwxwgkEOFXE9h+vIrt7gdE6WHo3vAefXftw
         sowHRoWwTUBBfOAPvIWxZQHr3ZqASuaaHvPHXD9KcUQxvH3R2tkoB8W7a29fP0bEJEjR
         NCJByh03A/wN4GWImqX4lmUimqsRIDNOIQbfJVl6FsQs0WLpZLbhz6Pt8OOBCZyi+h2X
         q+ZzmunD1ZHLpKOMl+yHKwo12cRXwgT88JhVZzibI9x48jZrOaVp21HkQXLDnLVLyMzz
         fD2D6ITR7FJspmPLxNZ0lpzYXTmRlK64oFVue+VV2tdSdV0fDGpkPW6nYsRfBCUDj7LE
         G0Ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=neIGA3Tk1Ql4NqorGSdbDQbULzgo2NlpkwfiRgupnSM=;
        fh=hBbjFYf4eOgSnpEbUwipV2r0pSCq4vBaWvgyTfJV2IE=;
        b=lHr4nhmVg0cbVTNBQC3naq0AtE4doQHprB3BJXIABIearhkeys0RBNSSqSU+LbtdJG
         iREE+GVU5JPq0KLTo1Vneo/yYOYT5EODyFxoEeGtrsAgaqlmcPtaG5pNkTwr9VJvGN6Q
         p2loB/jav/7AlpmdlHi7r41WAj3VvdMqD9QviGJPznzoXEJjpY3DpGue/Avqaf3A/25B
         ys58tiKugMsMlpXWVr4ZAHmgLOemW4WJ6lTvk2P2PEzCu31CuZUtOU9Ww+QglPdq+MSw
         fJh0wqTdmJBwUF1SDKnh/8AldCbhgBLEwt8LsPh7aNHqnnVmZqgOnrS3kx0gfpXWCr5u
         G0XQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784116282; x=1784721082; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=neIGA3Tk1Ql4NqorGSdbDQbULzgo2NlpkwfiRgupnSM=;
        b=gIXUMJQyEIdTs3P/Jp64O+jC223SD5Aetm1WHnOlBzQGXKWFJ9YBfSCLRXfaeM8CR9
         XVmpCyJc6//hdlV+lbmHPAxlEjIGAsuxdCJvCdp4V35njYQuN+UYWXTHhWlZE/kvEHgU
         mBifqaGAgOVp56BO440LhfqAKZcFH7G7Z73B5Zx1cy3aylEAxYDNsub3D13UPeidca03
         aYg+v6ohY5dn9gBle2qc78sg6zV/Oa2R9oE72W/3y2tXtxNIEyZ4C+M+brKOA9Co44LG
         lvvUhZTO+hiQYoM3AWvNuZw95wRt0XHHHiunGgv0l4rFnTyqWtXgyU2S1BbXxO4KRcXI
         0CXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784116282; x=1784721082;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=neIGA3Tk1Ql4NqorGSdbDQbULzgo2NlpkwfiRgupnSM=;
        b=gmwR5IW+TT3gpg/V2vtDNexQPkIX9F1AAD6VzyJ4S1OMKnCj2Kw+Lc/cDL1Xn7LU0h
         bp0TAJEJCtXMnTuGQWvRSygDQ6iZ8jsv3dAu5iSuvYTfXwvIGct78cqvemNHEMnyLAwC
         qpf63rDwAvyxLwlkvrHhjD7EDalF1ZnUV4WdSAvJe7RZx9An5IDh+WPWR48qXJcOcdEt
         19ODwKAN118EONYFKHZ0yklDwkXEDqe+hhBeklrfMFaf1ddifT2qld2pM04Y/hOjpZMG
         qpTIJkna2MmfZVgZSRbD+BS/RCR4EGq+qkld4iTkE6fnjJunTkmnWCnmd8f8t8JiGXU0
         663A==
X-Gm-Message-State: AOJu0YwMdi7XarraPS26iTGEtiRAENk0tIIJY74M0RPw3PYWCudhOUGO
	7u3cc+pI6PIvFN3/Xzt4Y0V+FBvBDeWRxFbkfbNbgUiTnyhxC/qnZHPyBqFNpS2oduz16hWAZ8Z
	Q6UF/yaIAIvpor8EM4BqY+f2lzeKSDJg=
X-Gm-Gg: AfdE7cmsT6/wdCdUji7IMitBNS4Gir1AcUjxqO4JT3n5bBJ+51NZ6nr2SUBZhfnk+sH
	TXYsftznmr3GtWSqSr5oztC1ZaUNX2sXIXtlbCUU82BkejCYsu4kKEwrZrMal6KtUAEQpA6XKqh
	LJRKX7YSnxP1q1eB/u1Se9JKVMtIbta3ORj1sdOftbgq4mhi4Gfc0pJTjvI0i9VqA5ZfxcU4s+E
	1DPutB1g0ZlClMxf8Dd5a55Y8PhQDZuGC1JYHHYEmVYakKL4W/NAFnX0OWpdLb2KIx5hfHOWI0y
	FoW79lAbJ+dMAfDqmHc2Y1lUv8Xj
X-Received: by 2002:a05:6214:54c1:b0:907:52e3:1c63 with SMTP id
 6a1803df08f44-90752e32676mr62205246d6.20.1784116282331; Wed, 15 Jul 2026
 04:51:22 -0700 (PDT)
MIME-Version: 1.0
References: <20260625090231.2575081-1-sivakumar.bs@gmail.com>
 <20260706115516.19878-1-sivakumar.bs@gmail.com> <cca6b5d5382e36e325a075861daf8bede882bcac.camel@pbarker.dev>
In-Reply-To: <cca6b5d5382e36e325a075861daf8bede882bcac.camel@pbarker.dev>
From: Siva Kumar Balasubramanian <sivakumar.bs@gmail.com>
Date: Wed, 15 Jul 2026 17:20:55 +0530
X-Gm-Features: AUfX_mzX8wrzLlp4K7SOZjenDvuDz-8aJYXUPX3OSO9LFaeL1fLtgASbzdxLl-w
Message-ID: <CACFV95JRe_vTQ3Vi8KKzvmbTvPp+aNewpDKXKb+xo6AkNCMG7w@mail.gmail.com>
Subject: Re: [OE-core][wrynose][PATCH] util-linux: upgrade 2.41.3 -> 2.41.5
To: Paul Barker <paul@pbarker.dev>
Cc: openembedded-core@lists.openembedded.org, 
	Yoann Congal <yoann.congal@smile.fr>, Chen Qi <Qi.Chen@windriver.com>
Content-Type: multipart/alternative; boundary="0000000000003f17730656a4f1db"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Jul 2026 11:51:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240953

--0000000000003f17730656a4f1db
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Paul,

The pam_lastlog2 libpam linking fix (YOCTO #16320) is included
natively in 2.41.5.

Thanks,
Siva

On Tue, Jul 14, 2026 at 6:59=E2=80=AFPM Paul Barker <paul@pbarker.dev> wrot=
e:

> On Mon, 2026-07-06 at 17:25 +0530, Siva Balasubramanian wrote:
> > 2.41.4 and 2.41.5 are point releases in the same 2.41 stable series and
> > contain only bug fixes and security fixes (no new features, no API/ABI
> > breaks), so the upgrade complies with the stable branch policy.
> >
> > Among the fixes pulled in:
> >  - Several mount(8) TOCTOU / symlink hardening fixes (incl.
> CVE-2026-27456)
> >  - libblkid integer overflow in parse_dos_extended() and a use-after-fr=
ee
> >    in partition probing
> >  - pam_lastlog2: fix libpam linking in the autotools build so
> >    pam_lastlog2.so links against libpam (fixes the runtime "undefined
> >    symbol: pam_syslog" / dlopen failure) [YOCTO #16320]
> >
> > Drop two backports that are now part of the release:
> >  - 0001-loopdev-add-LOOPDEV_FL_NOFOLLOW-to-prevent-symlink-a.patch
> >    (upstream f55f9906, released in 2.41.4)
> >  - the pam_lastlog2 libpam linking backport (upstream 5683ed6320e0,
> >    cherry-picked to the 2.41 stable branch as c8d0af0421f6, released in
> >    2.41.5)
>
> Hi Siva,
>
> I just see one backport dropped in this patch. I don't see any
> pam_lastlog2 backport in the current wrynose branch, is this related to
> a patch that wasn't applied or something you're carrying locally?
>
> Best regards,
>
> --
> Paul Barker
>
>

--=20

Sivakumar B

--0000000000003f17730656a4f1db
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-family:arial,he=
lvetica,sans-serif">Hi Paul,</div><div class=3D"gmail_default" style=3D"fon=
t-family:arial,helvetica,sans-serif"><br></div><div class=3D"gmail_default"=
 style=3D"font-family:arial,helvetica,sans-serif">The pam_lastlog2 libpam l=
inking fix (YOCTO #16320) is included<br>natively in 2.41.5.=C2=A0</div><di=
v class=3D"gmail_default" style=3D"font-family:arial,helvetica,sans-serif">=
<br></div><div class=3D"gmail_default" style=3D"font-family:arial,helvetica=
,sans-serif">Thanks,</div><div class=3D"gmail_default" style=3D"font-family=
:arial,helvetica,sans-serif">Siva</div></div><br><div class=3D"gmail_quote =
gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jul 14=
, 2026 at 6:59=E2=80=AFPM Paul Barker &lt;<a href=3D"mailto:paul@pbarker.de=
v">paul@pbarker.dev</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">On Mon, 2026-07-06 at 17:25 +0530, Siva Balasubramanian =
wrote:<br>
&gt; 2.41.4 and 2.41.5 are point releases in the same 2.41 stable series an=
d<br>
&gt; contain only bug fixes and security fixes (no new features, no API/ABI=
<br>
&gt; breaks), so the upgrade complies with the stable branch policy.<br>
&gt; <br>
&gt; Among the fixes pulled in:<br>
&gt;=C2=A0 - Several mount(8) TOCTOU / symlink hardening fixes (incl. CVE-2=
026-27456)<br>
&gt;=C2=A0 - libblkid integer overflow in parse_dos_extended() and a use-af=
ter-free<br>
&gt;=C2=A0 =C2=A0 in partition probing<br>
&gt;=C2=A0 - pam_lastlog2: fix libpam linking in the autotools build so<br>
&gt;=C2=A0 =C2=A0 pam_lastlog2.so links against libpam (fixes the runtime &=
quot;undefined<br>
&gt;=C2=A0 =C2=A0 symbol: pam_syslog&quot; / dlopen failure) [YOCTO #16320]=
<br>
&gt; <br>
&gt; Drop two backports that are now part of the release:<br>
&gt;=C2=A0 - 0001-loopdev-add-LOOPDEV_FL_NOFOLLOW-to-prevent-symlink-a.patc=
h<br>
&gt;=C2=A0 =C2=A0 (upstream f55f9906, released in 2.41.4)<br>
&gt;=C2=A0 - the pam_lastlog2 libpam linking backport (upstream 5683ed6320e=
0,<br>
&gt;=C2=A0 =C2=A0 cherry-picked to the 2.41 stable branch as c8d0af0421f6, =
released in<br>
&gt;=C2=A0 =C2=A0 2.41.5)<br>
<br>
Hi Siva,<br>
<br>
I just see one backport dropped in this patch. I don&#39;t see any<br>
pam_lastlog2 backport in the current wrynose branch, is this related to<br>
a patch that wasn&#39;t applied or something you&#39;re carrying locally?<b=
r>
<br>
Best regards,<br>
<br>
-- <br>
Paul Barker<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature"><div dir=3D"ltr"><div><div dir=3D"ltr"><div><br></div>Sivakumar B=
<span></span><span></span></div></div></div></div>

--0000000000003f17730656a4f1db--

