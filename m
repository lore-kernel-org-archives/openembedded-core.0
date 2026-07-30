Return-Path: <ecordonnier@snap.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A00CEC55165
	for <webhook@archiver.kernel.org>; Thu, 30 Jul 2026 12:11:06 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10035.1785413465496002826
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Jul 2026 05:11:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@snap.com header.s=google header.b=dd165bng;
 spf=pass (domain: snapchat.com, ip: 209.85.221.45, mailfrom: ecordonnier@snapchat.com)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-47ddf7b09e5so2125408f8f.1
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Jul 2026 05:11:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785413463; cv=none;
        d=google.com; s=arc-20260327;
        b=lbc+4QundAbDoeGObTD7Ysp9CLuhllojejSlH08eAGgXG3PB4W0doJROkE4gkneDyO
         itHbsd/vnAzs1nc95ZKv7wIhXVDgGTm1AUKv/G4WfPYp2CbPp9Zvhnd2b7GUgTNs4pla
         e5itvN17iPYegAoXUbanoXxLl+yqUrSmxJWfF3NycUPTm3LEAynfa1Non6o5UtQTTULy
         LHRE5JvDI4d7J5+SIKIS4n6iBk0Qw5dEAXtObF5NDWVyoxQGzDUKsyBnq+CP94XeIYHL
         VDkZ2UxdJmnXhQWGk21cJKajVr4/CRFHwbAlvtn4CK901uAlkiWsUenGpkx+t5rZogKP
         21Ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=4YwVsm96eulsKmu33RLCOa2C+c/wbreRWOcce4j67Vc=;
        fh=E22hnrDeFOhblX6O88lo3ne3xDOhxPQXcBK1pwgmqrY=;
        b=XlUeHLK9EJGu+WJ9tmfMmXCgQObBXNS+n3RvSRm/B9d9VMCHE/nnQVwVUu1gX5zFzo
         5AsLOyitSCUwX6QxLtXl2mdyLA1CYsrb93SVAWe9PE7HDWa87wsqP25jQCxASs9wdjH7
         aNRKw/k7tnH9Z+Q4O9/632zr6/nE3hGdir953uT+WdMzMKgxqyFEhc+9mPNKqHd0Rb7A
         sTzkPmbGVNHTWGOeJ8yJMupXah/KSV14lV+grK/qaZqKWqoMHMySm4YK8xnpED3rXCvd
         eK9y/Wjlb7gEyHKL/kPOuX+sY1Pl8FW0md+LPyP8dO+8fAMe/48kdRloOf67qtNgHqPn
         fWkA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snap.com; s=google; t=1785413463; x=1786018263; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4YwVsm96eulsKmu33RLCOa2C+c/wbreRWOcce4j67Vc=;
        b=dd165bngI5PT8C+xVYdyceUMDPras8jyz+bGjrccv8DiJFVCALVwtgKuhaKQQr4LqQ
         lHrJC7wpUowhyD2nyAMLBI+E+VnKVjcXiAR8Wjkj8SP6SBfvzf8ONLWX9PG5iIL8dg1+
         h1M27UOHlyJfMXd67glui5qQ108JnJAfl6NKQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785413463; x=1786018263;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=4YwVsm96eulsKmu33RLCOa2C+c/wbreRWOcce4j67Vc=;
        b=AtnGTLHUsJYpeyaFblDhBXJBrUqXDQyt6sLNrMQsbb3o1RZsLBtitTF3znBKXqJn/q
         zFPIdrWl48o6cNDct6K9ksZnlGpZ/fSqmDmce6YiDheobOHTGJkwKySpODkFmPYcbwCR
         O/e+mD9VInd2VQ7OJi0Ny11WgORKCMUSs80fo20SlzJqzvOBSPt/JRBk4BqVEXW2KyXc
         K4pUMc3pHx2cz9cxbSiZzS+UJ03A3iN6cAXLrTi1IoL2e2C93jfOIRzk9Bmjga/bSUmv
         ewezOVGxY5VGfaKZpzuEjdhxA71wPNpUneQxTLX5fPs99vfQoFMSmXcILY72sb7csog8
         6HYg==
X-Gm-Message-State: AOJu0Ywvrkr2BUIp+sbsGpVU4fiTxgpt/niNfhR6aHbrTsyxrk/eR7AR
	cek12Dw7vfL713aio9Om+Sq5wHkeADOeAn6eBqL48loYvio5wzAQ4JwtnjT2Bnz1kQtRUsy/PhB
	dSrtvKWP/VuuzsOAuv+jY3QaMrSFjZhuUVA0EfLRxjg==
X-Gm-Gg: AR+sD13n99sB3q9I3ar0mJnni+1FZ67vdIhBx2VqmW1ybHicxMcXrtHQTJ2w/RKdtaj
	1XfvS0NiG4UlkLwQBVkjUN6M9Q/iWUvJvZz3LJnsMD43cqwTEW0RZnabnX1bfna/PwcM0OoZd0M
	iPqjpTA3o6f/xxYs64WK9WP+AU+m51S4l7PtmqK++KXVbxbqP1iHfMHFYGGY3pSomDjdhtGVcQe
	s6owzuGbrSl9x09RRJjFcRQ73XrA0vtl5ggEnrcaYm6qTQG2WQ4pxqN23eT4tg74aFeSlP/97md
	C+0EYow7CmsfaOAKnv8bu7ZSjv00Z73QJHTlUbQSBb0ECaJ1CVP8vVUqGlIBwoqj2OEuzAtEmTH
	sBg==
X-Received: by 2002:a05:6000:2903:b0:47f:73fb:daa1 with SMTP id
 ffacd0b85a97d-47fc81c5c0fmr3613598f8f.19.1785413463294; Thu, 30 Jul 2026
 05:11:03 -0700 (PDT)
MIME-Version: 1.0
References: <20260730091017.171702-1-ecordonnier@snap.com> <20260730091017.171702-2-ecordonnier@snap.com>
 <69f5608c9989dbcf3ce0049b6770dd7407881bc6.camel@pbarker.dev>
In-Reply-To: <69f5608c9989dbcf3ce0049b6770dd7407881bc6.camel@pbarker.dev>
From: Etienne Cordonnier <ecordonnier@snap.com>
Date: Thu, 30 Jul 2026 14:10:51 +0200
X-Gm-Features: AUfX_mzhrG4c2PMw4MKJ1SKibCA_BKqBxyu2M-ixXpjlyi5HuptgcPF8bp-S7QA
Message-ID: <CAHUKmYY1OHXROO5_DrHepHVkwqCECWgN2pZYcxZdwuKRf58VUQ@mail.gmail.com>
Subject: Re: [OE-core][PATCH v2 2/2] opkg: enable sha256 checksum verification
 by default
To: Paul Barker <paul@pbarker.dev>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000042179c0657d2f7e7"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Jul 2026 12:11:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242344

--00000000000042179c0657d2f7e7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

hi Paul,
I've already manually revised the commit message to include the relevant
context justifying the increase in size of opkg. What should I remove?

 =C3=89tienne

On Thu, Jul 30, 2026 at 1:52=E2=80=AFPM Paul Barker <paul@pbarker.dev> wrot=
e:

> On Thu, 2026-07-30 at 11:10 +0200, Etienne Cordonnier via
> lists.openembedded.org wrote:
> > From: Etienne Cordonnier <ecordonnier@snap.com>
> >
> > WITH_SHA256=3DON adds no external dependency: sha256.c is a self-contai=
ned
> > 528-line pure C implementation already present in the source tree.
> >
> > oe-core already generates SHA256Sum fields in the Packages index
> > (via --checksum sha256 in OpkgIndexer.write_index), but opkg silently
> > ignores them unless compiled with WITH_SHA256=3DON.  Enabling sha256 by
> > default makes those checksums actually verified at install time,
> > improving package integrity checking at zero dependency cost.
> >
> > Once SHA256 is universally available, --checksum md5 can also be
> > dropped from OpkgIndexer.write_index() -- MD5 is collision-prone and
> > should not be relied upon for integrity checking -- completing the
> > deprecation noted in
> https://git.openembedded.org/openembedded-core/commit/?id=3De462f47489f35=
902b6972f9837d9adfa542fc796
> > (2019).
> >
> > AI-Generated: Claude Sonnet 4.6
> > Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
>
> Hi,
>
> Claude likes to include irrelevant information in commit messages,
> please re-write this one to focus on the relevant bits.
>
> Otherwise this LGTM.
>
> Best regards,
>
> --
> Paul Barker
>
>

--00000000000042179c0657d2f7e7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">hi Paul,<br>I&#39;ve already manually revised the commit m=
essage to include the relevant context justifying the increase in size of o=
pkg. What should I remove?<br><br>=C2=A0=C3=89tienne</div><br><div class=3D=
"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">O=
n Thu, Jul 30, 2026 at 1:52=E2=80=AFPM Paul Barker &lt;<a href=3D"mailto:pa=
ul@pbarker.dev">paul@pbarker.dev</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">On Thu, 2026-07-30 at 11:10 +0200, Etienne=
 Cordonnier via<br>
<a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D"_bla=
nk">lists.openembedded.org</a> wrote:<br>
&gt; From: Etienne Cordonnier &lt;<a href=3D"mailto:ecordonnier@snap.com" t=
arget=3D"_blank">ecordonnier@snap.com</a>&gt;<br>
&gt; <br>
&gt; WITH_SHA256=3DON adds no external dependency: sha256.c is a self-conta=
ined<br>
&gt; 528-line pure C implementation already present in the source tree.<br>
&gt; <br>
&gt; oe-core already generates SHA256Sum fields in the Packages index<br>
&gt; (via --checksum sha256 in OpkgIndexer.write_index), but opkg silently<=
br>
&gt; ignores them unless compiled with WITH_SHA256=3DON.=C2=A0 Enabling sha=
256 by<br>
&gt; default makes those checksums actually verified at install time,<br>
&gt; improving package integrity checking at zero dependency cost.<br>
&gt; <br>
&gt; Once SHA256 is universally available, --checksum md5 can also be<br>
&gt; dropped from OpkgIndexer.write_index() -- MD5 is collision-prone and<b=
r>
&gt; should not be relied upon for integrity checking -- completing the<br>
&gt; deprecation noted in <a href=3D"https://git.openembedded.org/openembed=
ded-core/commit/?id=3De462f47489f35902b6972f9837d9adfa542fc796" rel=3D"nore=
ferrer" target=3D"_blank">https://git.openembedded.org/openembedded-core/co=
mmit/?id=3De462f47489f35902b6972f9837d9adfa542fc796</a><br>
&gt; (2019).<br>
&gt; <br>
&gt; AI-Generated: Claude Sonnet 4.6<br>
&gt; Signed-off-by: Etienne Cordonnier &lt;<a href=3D"mailto:ecordonnier@sn=
ap.com" target=3D"_blank">ecordonnier@snap.com</a>&gt;<br>
<br>
Hi,<br>
<br>
Claude likes to include irrelevant information in commit messages,<br>
please re-write this one to focus on the relevant bits.<br>
<br>
Otherwise this LGTM.<br>
<br>
Best regards,<br>
<br>
-- <br>
Paul Barker<br>
<br>
</blockquote></div>

--00000000000042179c0657d2f7e7--

