Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10F44CD4F54
	for <webhook@archiver.kernel.org>; Thu, 28 May 2026 21:18:16 +0000 (UTC)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18013.1779993976017712065
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 May 2026 11:46:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=V4NWp8fY;
 spf=pass (domain: gmail.com, ip: 209.85.208.172, mailfrom: adityags2004@gmail.com)
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-38e97e73234so19518001fa.1
        for <openembedded-core@lists.openembedded.org>; Thu, 28 May 2026 11:46:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779993974; cv=none;
        d=google.com; s=arc-20240605;
        b=eofbVBvUmRSki6g/tpwH/4VJ2IPAOAm9dt/9D6Wjs4jRTLR18xxNxdxLuwVOSJYCqQ
         UEl/Ij1tL1QIJrcNEu0Xr01q2ECTAfpnZgpcBWaWTWog3p5ogB/VKQm5tP1JKRIfWB1t
         KD4qdwYtcAEvRTQ9p03cB6tEzv9wH/vAZGaiwr+/OxeR3T3SOtYBeQ8KYorAo8eVlBQ2
         aXNqNPyrpetmnA1dxO11hBDPxdor3nRKrOu1uyrk0d99x/kQV2o5N3SwY4dwGHbt2v4d
         yGHWsE1+B24vZ2JLdimfQZ4v0JRTnasII0Vf2Sxbbx5MyeXc+BEemuATBMV7VLJsn8zX
         8TQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=HxHXE4WhAiarh3s1u/bIytF84LBQs6D4WBGvzbyF5NY=;
        fh=Ug+utZakG8cDypuyc3isAGmUAtkXdDk5XYoisK59YNI=;
        b=Wp9VZ4f/Indbi4t74gJkZ3s4StDKSJUBL7SGn3A34V592ZpU+zxuvxU59lZ7Z9QM4K
         wFSYiA8mWUAbAfFfvdXiIujgl0x2ksLmXSezdTOB+pZ2XwkSwbt007yWAXasGY1p4TKk
         WDH26Yx/aJ/vbAdlCp7wS8hSbIbl0GFZ7gCcoA7YvR25k6BeLIMIb18aK6EMAH6rUDM8
         JmvfWrfXNqYt0//EZdk0QwvDuYChR0LgGtHjmmrW3XWZckUd1g87/oZlbIvnOegVRQmr
         0EliZJe4rzUnX1nT3TxYlh4fhXKJg/p6kMiOa8iCA1X3CfXOUbrGOMsrdg3u4nQeMa8O
         Hs5w==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779993974; x=1780598774; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HxHXE4WhAiarh3s1u/bIytF84LBQs6D4WBGvzbyF5NY=;
        b=V4NWp8fYiFaCI+A6C9qofGLAlgckshjCgMqs+Sa9sNzEblC9KQRhAu5C8VyRZtLlb+
         M2UfEWOHogItrmZUmGbf7x8KzLkKNQhCV4PxCe126K9gvoJBSHdyiEDwTyALva2cKSCo
         08oLISMLffVfNyu2MHHULcGy2+bEfZBaoiD+bE0OpULl7qEyOM4IeCyUUqvvA+9aioyI
         xLV+4L5178pI3aaQ/y3ZoShpQoW+2TqBjkgFz2iPoTq3Q6+2LpjltgnA592eekxYgnBS
         9iplE+0vV7OsP+auPy7MuoZeDa8uTeSIPvE46F5uV2WqDXbC6X/pByhPlObSLJK+VKyv
         mI5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779993974; x=1780598774;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HxHXE4WhAiarh3s1u/bIytF84LBQs6D4WBGvzbyF5NY=;
        b=h7BAhcU+FfTLAeJm/HvDPhHN/F5T8+mWO/X0Cn8yeQZCpTp0pbla/WPUTM/wlgLcOL
         dA4cM0UHU2tF2J/f+Wtx1v46tsTn7z/5Cbg0uhMmRaAfToEXK06HlflCSmrnT1w5Ls0C
         jgrFTRRnmxBnVnt9H/pkPphZ669iEmSaBdeOxHq2wI4vO2jc5CX5N9V/JyaqdjGqVGcO
         tyf16pWJqVBxd7tG7vNoQ4gWBmw8WUrNekb6DrBFVTWqsJlSyEYBlBBUb8aMYsHmG1yc
         U8wPDtE4xRuccgM20Qr5AgUNHd6qrfa9D9UW0xbm5V86KKbkofGWa3pxPw++dD6VFpmr
         Dtzg==
X-Gm-Message-State: AOJu0YyfAb9nFLZulRf8OrVgPLQWb85va2VUeJnlN/HhsAH+UIiacZTZ
	E7F+qur5JVy9WMCpfZfuIEOiqyuF4iV1h2E+LyV14w2DyOXM6BnrTfqmHTu17mXmGDIefEW64nt
	fTSQ5pYDWyoU1vCIkwfl1WAa0HBsTK2o=
X-Gm-Gg: Acq92OGa7owGAMo2w1hafVfXas+j0eMGoxKA7JfmDVEwcYW+P4sqKOR/Dn38Z5F9lIp
	kcjDbAZHlz1Z2wRh8dZ5npnKIX1mv81dAcJoNzEVXzi8PaKSExBNqIGqolk2R6VTBObMOeicUhD
	0FdkRw8mdpJmtx5bLPRXs7twhsfjxrYIQhl/z3Rzj42TBzE46zdHkdchIzqUNqvrT0TSMj6Sryk
	dSTCtPUyZ7LdIU7bu7ZFdcO4hAMVF/1Ak4vKq8NQxaICkB5cazKb4WCKzGzp6T088o6XyGa10Yi
	CnEqo8J1NI/5IoGVL+xP
X-Received: by 2002:a05:651c:622:b0:38e:a12c:418c with SMTP id
 38308e7fff4ca-39650842504mr87211fa.11.1779993973954; Thu, 28 May 2026
 11:46:13 -0700 (PDT)
MIME-Version: 1.0
References: <20260528174515.1274649-1-adityags2004@gmail.com> <CANNYZj9sQ7vmZorrSvHGjr1iqzNKEdTwvuVSdH6PCuJDssD8Og@mail.gmail.com>
In-Reply-To: <CANNYZj9sQ7vmZorrSvHGjr1iqzNKEdTwvuVSdH6PCuJDssD8Og@mail.gmail.com>
From: "Aditya G.S" <adityags2004@gmail.com>
Date: Fri, 29 May 2026 00:16:01 +0530
X-Gm-Features: AVHnY4JXn0EvTlFqlsWWTazfunFHbUmo-simbQb-aoPDz1zWMqgbmNC-RLo6I9Q
Message-ID: <CAHaUZZASS_X-EL6Haxtd8mqDEJy+ZdOUhkYWh2QB8m8RVeg4TA@mail.gmail.com>
Subject: Re: [PATCH] gawk: backport randtest stability fix
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	richard.purdie@linuxfoundation.org, joaomarcos.costa@bootlin.com, 
	ross.burton@arm.com, randy.macleod@windriver.com
Content-Type: multipart/alternative; boundary="000000000000851a9a0652e524c0"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 May 2026 21:18:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237729

--000000000000851a9a0652e524c0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Alex,

Thanks for the detailed review and suggestions.

I've updated the patch based on your feedback:

Removed Upstream-Status from commit message and added Bugzilla reference

Updated Upstream-Status in the patch with the upstream commit link

Integrated the patch into the main SRC_URI

The updated patch has now been sent to the mailing list for review.

Please let me know if any further changes are needed.

Thanks,
Aditya

On Thu, May 28, 2026, 11:55=E2=80=AFPM Alexander Kanavin <alex.kanavin@gmai=
l.com>
wrote:

> On Thu, 28 May 2026 at 19:45, Aditya GS <adityags2004@gmail.com> wrote:
> >
> > Backport upstream fix to improve stability of randtest.sh by
> > retrying when sigma is too small, avoiding intermittent failures.
> >
> > Upstream-Status: Backport [f2250f4bc864913437619af7a9834a1c24915acd]
>
> Upstream-Status should only be in the patch file itself, not in the
> commit message for oe-core.
>
> Instead, provide a reference to the yocto bugzilla, so that the
> reviewers know which bug this is fixing. A http link or [YOCTO
> #nnnnnn] tag.
>
> > +Upstream-Status: Backport [f2250f4bc864913437619af7a9834a1c24915acd]
>
> It's better to link to the web interface:
>
> Upstream-Status: Backport
> [
> https://cgit.git.savannah.gnu.org/cgit/gawk.git/commit/?id=3Df2250f4bc864=
913437619af7a9834a1c24915acd
> ]
>
> The reason is that sometimes a patch submission is labeled as
> Backport, but actually isn't (not here, of course). It's best to make
> that easy to verify, with a link like above.
>
> > @@ -19,6 +19,7 @@ SRC_URI =3D "${GNU_MIRROR}/gawk/gawk-${PV}.tar.gz \
> >             file://0001-m4-readline-add-missing-includes.patch \
> >             file://run-ptest \
> >             "
> > +SRC_URI +=3D "file://randtest-fix.patch"
>
> You can simply change the main SRC_URI assignment and add the patch
> there, instead of making a new statement with +=3D.
>
> Other than this, looks good. Thanks for taking time to develop a
> proper fix, and getting upstream to accept it. It's much better to
> solve the issue properly, than simply skip the flaky tests.
>
> Alex
>

--000000000000851a9a0652e524c0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Hi Alex,<div dir=3D"auto"><br></div><div dir=3D"auto">Tha=
nks for the detailed review and suggestions.</div><div dir=3D"auto"><br></d=
iv><div dir=3D"auto">I&#39;ve updated the patch based on your feedback:</di=
v><div dir=3D"auto"><br></div><div dir=3D"auto">Removed Upstream-Status fro=
m commit message and added Bugzilla reference</div><div dir=3D"auto"><br></=
div><div dir=3D"auto">Updated Upstream-Status in the patch with the upstrea=
m commit link</div><div dir=3D"auto"><br></div><div dir=3D"auto">Integrated=
 the patch into the main SRC_URI</div><div dir=3D"auto"><br></div><div dir=
=3D"auto">The updated patch has now been sent to the mailing list for revie=
w.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Please let me know if=
 any further changes are needed.</div><div dir=3D"auto"><br></div><div dir=
=3D"auto">Thanks,</div><div dir=3D"auto">Aditya=C2=A0</div></div><br><div c=
lass=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_=
attr">On Thu, May 28, 2026, 11:55=E2=80=AFPM Alexander Kanavin &lt;<a href=
=3D"mailto:alex.kanavin@gmail.com">alex.kanavin@gmail.com</a>&gt; wrote:<br=
></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-=
left:1px #ccc solid;padding-left:1ex">On Thu, 28 May 2026 at 19:45, Aditya =
GS &lt;<a href=3D"mailto:adityags2004@gmail.com" target=3D"_blank" rel=3D"n=
oreferrer">adityags2004@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Backport upstream fix to improve stability of randtest.sh by<br>
&gt; retrying when sigma is too small, avoiding intermittent failures.<br>
&gt;<br>
&gt; Upstream-Status: Backport [f2250f4bc864913437619af7a9834a1c24915acd]<b=
r>
<br>
Upstream-Status should only be in the patch file itself, not in the<br>
commit message for oe-core.<br>
<br>
Instead, provide a reference to the yocto bugzilla, so that the<br>
reviewers know which bug this is fixing. A http link or [YOCTO<br>
#nnnnnn] tag.<br>
<br>
&gt; +Upstream-Status: Backport [f2250f4bc864913437619af7a9834a1c24915acd]<=
br>
<br>
It&#39;s better to link to the web interface:<br>
<br>
Upstream-Status: Backport<br>
[<a href=3D"https://cgit.git.savannah.gnu.org/cgit/gawk.git/commit/?id=3Df2=
250f4bc864913437619af7a9834a1c24915acd" rel=3D"noreferrer noreferrer" targe=
t=3D"_blank">https://cgit.git.savannah.gnu.org/cgit/gawk.git/commit/?id=3Df=
2250f4bc864913437619af7a9834a1c24915acd</a>]<br>
<br>
The reason is that sometimes a patch submission is labeled as<br>
Backport, but actually isn&#39;t (not here, of course). It&#39;s best to ma=
ke<br>
that easy to verify, with a link like above.<br>
<br>
&gt; @@ -19,6 +19,7 @@ SRC_URI =3D &quot;${GNU_MIRROR}/gawk/gawk-${PV}.tar.=
gz \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-m4-readline=
-add-missing-includes.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://run-ptest \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
&gt; +SRC_URI +=3D &quot;file://randtest-fix.patch&quot;<br>
<br>
You can simply change the main SRC_URI assignment and add the patch<br>
there, instead of making a new statement with +=3D.<br>
<br>
Other than this, looks good. Thanks for taking time to develop a<br>
proper fix, and getting upstream to accept it. It&#39;s much better to<br>
solve the issue properly, than simply skip the flaky tests.<br>
<br>
Alex<br>
</blockquote></div>

--000000000000851a9a0652e524c0--

