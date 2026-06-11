Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BED5CD98C6
	for <webhook@archiver.kernel.org>; Thu, 11 Jun 2026 06:25:09 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.38932.1781155662996272205
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Jun 2026 22:27:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=H4ioDl4z;
 spf=pass (domain: gmail.com, ip: 209.85.167.44, mailfrom: adityags2004@gmail.com)
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5aa5edf347eso5147599e87.3
        for <openembedded-core@lists.openembedded.org>; Wed, 10 Jun 2026 22:27:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781155661; cv=none;
        d=google.com; s=arc-20240605;
        b=Nods0cRVBIetn2vcaZaHoBCVcELhZ6UUI1DRataMFPyoRXqdj+z4gw7y2We+uF27+O
         v7fc0FtqjrlPIStKWCFOkHN0pZDXCMboXaP+w5VfxLUV2Ryw1Z7nmvf61ilM08byXYMD
         IvNPa6FhNmWfyuVa1zXlbYmzWJT3J/NF8fM/CT1jovWHTFBLKyO7PcOpERRWk0Ms9yi+
         ExwPzXTxMHrxpYlV9pL22O4lAxq/MU2YtL2TG2eQOF2orTeO94Xel8isADqs3aeSBS9/
         Dm2rW/Bf/92vv/T7egaQaElHNX+Ec/9oU++oSIJPHsCi3DDX9HBg06IPQmLzVQnQgfIf
         G55A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=mHcgEC37CuI7wE6Oa0BS/xnSbXteSVFnM+ohKUk3rRo=;
        fh=fDgMUn+vN3uCzeXIxmBgiMkoeCU1eb8Rj/+cvIcTT+4=;
        b=lkG3Y/9X1Ol2bxgNUH3Dv3GAFNLO0qc9K6YB4vJ54HeTh4uf2oN+Qof3O+Wxdol0Yp
         B8fm9ViT/185GfgW/nMWOyybe6XDc0pIxaV0n/5UHw1tEayiFXsPwbObymwbhlwj1ilT
         4Jx48Fve5sCNaaetW5oO5sujdCskTdvcwgfVtb2Dy2OqTLy8SNjj9Gwsm8gVfyIOonmV
         GQW3N80+M2cXeIGvU9frO3ehJ+9seJXWRKwIXvbW1K7VDnwzQf88sdn6TFzc5TuvxNUm
         xF4RjcPUzqvr+lgQ2PMbIfmOjNxmJoE/ALRZvt0IaQT1TsrrKNbLjShFw9hdzHF6md9h
         8TpA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781155661; x=1781760461; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=mHcgEC37CuI7wE6Oa0BS/xnSbXteSVFnM+ohKUk3rRo=;
        b=H4ioDl4zC0U0FGmqSKvrRXrfmUfFzML9G3xUOV+jiT/Dn3KW5UxARuE3VKVJ/8MVwv
         K59t0ACw9LFLcL3GcxIrKB+oVLNNpMQxq6yK4PpXFxVFoqA2lfQPoLHx956tBf5d/Zg0
         zLd95lZAqfx1TCmp0Dzccb+3zq1lmYAGRk8CSJDdfXL7d0O1Vo9h1keVBKV1hfbHP3Mw
         IDPrSvoOlhOWX3EKvjujjHIyfBsXSYgaoaF7MLS7cf8uYJqYefgFRCSWFqytMlSU1sIS
         BFfzAWsOrPDQ9Yzc0/2Iobzsgma2tkw0d11Dm4BAuGKGY/u1vmbcCX8fzef49mLp3rh1
         bvlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781155661; x=1781760461;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mHcgEC37CuI7wE6Oa0BS/xnSbXteSVFnM+ohKUk3rRo=;
        b=AhuXyc0km3NbCYTIOJeycyj92Y5VmqGW8g+dkpHgXj1MeVc0j/me2Hb/Yor6l+zo0p
         WgeKlLE4nftxui+ric6tx3/Lv0EBn3PfBk/q+i7wXXEIqog8hUPeoE0+SQ4o3dm3AYeq
         dKYTTLGAarVFnacs9xmAkOyzJ/KBpdmlFO4MUq3Nz8H/Th6lxKxHcL9dMWeGzu3ZOoJi
         VBJgvsSsHhDmC6rYXJaF1c1wKbmrBGmP5ghDRCyWwy19aTBsZ77Wo7Ki4mS/JIayoTwj
         uu/NrWNDnXVuCnmYCDLCmNnSI4XzXnPtKGv38kMVTx8zF+JCz5DidsNISB2hmHZPk9UI
         ADpg==
X-Gm-Message-State: AOJu0YzMP0zTa/qCFWlavDxR0J4ztxk3NSl+Sa0dRTLLeMGEGsgxl2pm
	yVNnqyX+mullHHw8gVb2KursmNCoT6VY27WTyuAAk6arJD91i2eTovUmR7iE2/29GVcKrELHKyq
	qT3BB4dyqM2fwbDkKoKyf6m0RHAmyDm0=
X-Gm-Gg: Acq92OGo3K9OSlLSuorVQCnmAzrGVj3u17WAj41eAnJ2Ra4pClFJ7zTXyVnLrvtJeNY
	emZwAs7m51YI8PEz54T2dxc6cMoCbWdHOanfBsNiUJapACo5JGRwyVYgWR9iudnknHqAaJleJhG
	oRfb48JwP958kL8XmRQvrX7oWxrU/4XLTHQgkkR2NDEiPLnrW30LKUuDcMNtQAMXkeHPYw1bUGc
	LoBvKh0eBLkd9kd/Qpo0e6Aticxb7Mx+8g9WU9OUnTBFpwVCz2pJrB7V6X4yuJb7L0F1Z2KZBu6
	UPDmHq20+XvE7BVL17i7AdHDGz7jZzzQtxoZmiWmgQrm1ctvZEHhHCP1C0r8JiNjzUPLea6qGwA
	EkaOV
X-Received: by 2002:a05:6512:3da7:b0:5a8:7426:d2da with SMTP id
 2adb3069b0e04-5ad27a9ff78mr343817e87.7.1781155660684; Wed, 10 Jun 2026
 22:27:40 -0700 (PDT)
MIME-Version: 1.0
References: <20260609084704.2765-1-adityags2004@gmail.com> <DJ5JBHEBG48P.1M8Z5YPHYEXTK@bootlin.com>
In-Reply-To: <DJ5JBHEBG48P.1M8Z5YPHYEXTK@bootlin.com>
From: "Aditya G.S" <adityags2004@gmail.com>
Date: Thu, 11 Jun 2026 10:57:27 +0530
X-Gm-Features: AVVi8CcMdDqvrJ2NnOUaeYHeyby-Sdl6MF82y3GwlvQU8OVW3K8ZcbSGN--Y6cw
Message-ID: <CAHaUZZB+CBdR1mbx8yNtr8jwJL-7Expu6o=_EnTyf4vvDJ5fpA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] patchtest: warn if Upstream-Status is after patch scissors
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Cc: openembedded-core@lists.openembedded.org, tgamblin@baylibre.com
Content-Type: multipart/alternative; boundary="00000000000071e35d0653f39eca"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Jun 2026 06:25:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238423

--00000000000071e35d0653f39eca
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Mathieu,

Thanks for reviewing the patch.

This change is for Bug 15940 ("Detect tags like Upstream-Status after the
scissors in patches").

You are right to point this out. On re-checking, the current patch includes
unintended indentation changes, and the if block appearing at the same
level as the function definition is not intentional.

The goal of the patch is only to introduce the warning logic, and the
indentation changes are not required for that.

I'll prepare and resend a cleaned-up version with proper indentation and a
minimal diff so the functional change can be reviewed clearly.

Thanks for catching this.

Best regards,
Aditya

On Wed, Jun 10, 2026, 10:41=E2=80=AFPM Mathieu Dubois-Briand <
mathieu.dubois-briand@bootlin.com> wrote:

> On Tue Jun 9, 2026 at 10:47 AM CEST, Aditya GS via lists.openembedded.org
> wrote:
> > Detect cases where Upstream-Status is placed after the patch
> > scissors ("---") and emit a warning instead of failing.
> >
> > Such placement may be intentional in some workflows to avoid
> > including the tag in upstream commits.
> >
> > Signed-off-by: Aditya GS <adityags2004@gmail.com>
> > ---
> >  meta/lib/patchtest/tests/test_patch.py | 187 ++++++++++++-------------
> >  1 file changed, 89 insertions(+), 98 deletions(-)
> >
> > diff --git a/meta/lib/patchtest/tests/test_patch.py
> b/meta/lib/patchtest/tests/test_patch.py
> > index f427b7a8b0..79aa8f100c 100644
> > --- a/meta/lib/patchtest/tests/test_patch.py
> > +++ b/meta/lib/patchtest/tests/test_patch.py
> > @@ -40,116 +40,107 @@ class TestPatch(base.Base):
> >              self.skip('No new CVE patches introduced')
> >
> >      def test_upstream_status_presence_format(self):
> > -        if not TestPatch.newpatches:
> > -            self.skip("There are no new software patches, no reason to
> test Upstream-Status presence/format")
> > +    if not TestPatch.newpatches:
> > +        self.skip("There are no new software patches, no reason to tes=
t
> Upstream-Status presence/format")
>
>
> Hi Aditya,
>
> Thanks for your patch.
>
> Maybe I'm missing something, but the whole re-indentation of the file
> looks wrong. Particularly here, the "if" block is at the same level as
> the function definition. Can you confirm this is intended?
>
> Thanks,
> Mathieu
>
> --
> Mathieu Dubois-Briand, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
>

--00000000000071e35d0653f39eca
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Hi Mathieu,<div dir=3D"auto"><br></div><div dir=3D"auto">=
Thanks for reviewing the patch.</div><div dir=3D"auto"><br></div><div dir=
=3D"auto">This change is for Bug 15940 (&quot;Detect tags like Upstream-Sta=
tus after the scissors in patches&quot;).</div><div dir=3D"auto"><br></div>=
<div dir=3D"auto">You are right to point this out. On re-checking, the curr=
ent patch includes unintended indentation changes, and the if block appeari=
ng at the same level as the function definition is not intentional.</div><d=
iv dir=3D"auto"><br></div><div dir=3D"auto">The goal of the patch is only t=
o introduce the warning logic, and the indentation changes are not required=
 for that.</div><div dir=3D"auto"><br></div><div dir=3D"auto">I&#39;ll prep=
are and resend a cleaned-up version with proper indentation and a minimal d=
iff so the functional change can be reviewed clearly.</div><div dir=3D"auto=
"><br></div><div dir=3D"auto">Thanks for catching this.</div><div dir=3D"au=
to"><br></div><div dir=3D"auto">Best regards,</div><div dir=3D"auto">Aditya=
=C2=A0</div></div><br><div class=3D"gmail_quote gmail_quote_container"><div=
 dir=3D"ltr" class=3D"gmail_attr">On Wed, Jun 10, 2026, 10:41=E2=80=AFPM Ma=
thieu Dubois-Briand &lt;<a href=3D"mailto:mathieu.dubois-briand@bootlin.com=
">mathieu.dubois-briand@bootlin.com</a>&gt; wrote:<br></div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;pa=
dding-left:1ex">On Tue Jun 9, 2026 at 10:47 AM CEST, Aditya GS via <a href=
=3D"http://lists.openembedded.org" rel=3D"noreferrer noreferrer" target=3D"=
_blank">lists.openembedded.org</a> wrote:<br>
&gt; Detect cases where Upstream-Status is placed after the patch<br>
&gt; scissors (&quot;---&quot;) and emit a warning instead of failing.<br>
&gt;<br>
&gt; Such placement may be intentional in some workflows to avoid<br>
&gt; including the tag in upstream commits.<br>
&gt;<br>
&gt; Signed-off-by: Aditya GS &lt;<a href=3D"mailto:adityags2004@gmail.com"=
 target=3D"_blank" rel=3D"noreferrer">adityags2004@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/lib/patchtest/tests/test_patch.py | 187 ++++++++++++-------=
------<br>
&gt;=C2=A0 1 file changed, 89 insertions(+), 98 deletions(-)<br>
&gt;<br>
&gt; diff --git a/meta/lib/patchtest/tests/test_patch.py b/meta/lib/patchte=
st/tests/test_patch.py<br>
&gt; index f427b7a8b0..79aa8f100c 100644<br>
&gt; --- a/meta/lib/patchtest/tests/test_patch.py<br>
&gt; +++ b/meta/lib/patchtest/tests/test_patch.py<br>
&gt; @@ -40,116 +40,107 @@ class TestPatch(base.Base):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.skip(&#39;No new =
CVE patches introduced&#39;)<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 def test_upstream_status_presence_format(self):<br=
>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if not TestPatch.newpatches:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.skip(&quot;There are n=
o new software patches, no reason to test Upstream-Status presence/format&q=
uot;)<br>
&gt; +=C2=A0 =C2=A0 if not TestPatch.newpatches:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.skip(&quot;There are no new software=
 patches, no reason to test Upstream-Status presence/format&quot;)<br>
<br>
<br>
Hi Aditya,<br>
<br>
Thanks for your patch.<br>
<br>
Maybe I&#39;m missing something, but the whole re-indentation of the file<b=
r>
looks wrong. Particularly here, the &quot;if&quot; block is at the same lev=
el as<br>
the function definition. Can you confirm this is intended?<br>
<br>
Thanks,<br>
Mathieu<br>
<br>
-- <br>
Mathieu Dubois-Briand, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer noreferrer" target=3D"_bl=
ank">https://bootlin.com</a><br>
<br>
</blockquote></div>

--00000000000071e35d0653f39eca--

