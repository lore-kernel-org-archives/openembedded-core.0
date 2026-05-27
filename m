Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4604CD5BD5
	for <webhook@archiver.kernel.org>; Wed, 27 May 2026 06:00:42 +0000 (UTC)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13803.1779860935778240981
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 May 2026 22:48:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Gg7DE/UN;
 spf=pass (domain: gmail.com, ip: 209.85.208.170, mailfrom: adityags2004@gmail.com)
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-3938cc204a7so81711431fa.1
        for <openembedded-core@lists.openembedded.org>; Tue, 26 May 2026 22:48:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779860934; cv=none;
        d=google.com; s=arc-20240605;
        b=EbKS8eP03yneY0jVLk/HHtzZXLWjjex/5Pr99z28txYhbkOsmVOguq0puu7+dD/56Z
         oowDhCvWSw6nQTZS+xQ+QL+js3/7sx7Z5vLpptybWEQbhBC4LWPPLWTYUireLUnoFT98
         ZjbMnXyD5krNScYl1Ziv4Xa5XQagZwC+38ygYmGj88ZgN6V/ZsqRqfZUttbmK2AuDrvO
         kkxHUbaeAln0pDnRtYmbYQgGVX/o4i9Q3zyL/0nQcOu3L9r2/BZGvsJxl/m9G9ucRXFK
         icD1ow1QYGlYVpirgpDfSj8XFuP87GccXLyzbpCuphOL7f5pFzJxrZudCa4AbRpc2JL4
         kFiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Y5Nh+aas4H+tVdFpcRY4qWpPqsA5iVZBosvMp7GvgMs=;
        fh=B6vtDpNTi4XOGWGC9Kq5d9W1AUmYn1kAF47SU3Mvhxo=;
        b=D+W0jPccMCcVnFJoLQp3rUue6s8u70zLFe/GFTSHUErkQOoB22UXyBQ7wz5xk632R4
         UV2gvaE13+MV2ejTKFboyNQVZ94LAA7Fphu0t8vIqsw28hDZ2qCNXuMEI5BV4rSpk6gc
         5jZdmzvrMifDZ3sBq1/w5zHdlP0HdwGCg+ytF39rYNHdrwpB/6zpfLTjTmQt7qdKuy29
         UFmUNuIsJ0LBGvv7qDrhkOHy8nYtDk/CgAvHTWku9E2d6VnB2dsZ8C9c66rCepNpQxxt
         hUtGu4WdDMy9ud/7XrGKhmNef4pEItG8lQuUeMVKlgx9BuHoCi7irbn041jFsDPYebJh
         go1A==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779860934; x=1780465734; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Y5Nh+aas4H+tVdFpcRY4qWpPqsA5iVZBosvMp7GvgMs=;
        b=Gg7DE/UN3VnHjWp0oS4bl/xG1c72C2Pr+S0iuN5I460ehV4cgG8epBbCalZNtOUwxb
         pJm03o2CesHYmaYVROa/EglSC/zg2s9gmcyp+E2NX//r6ggCvLBSVOOSwY5RHmsFItFr
         vg19Z1GaBOnFJ0+JI5JT291nAu9WgMyFQWyiqnBnewFpfOVOnNVGHeovgNE5lN/jlL/D
         sV5ydT7UaJVgkZDCklkCtTv6m2I88hp5sJyePjm3nZeg5jKEZTF+Lb9/X7ozOtMnNwjF
         HQK0hsAlyLCFNqNaeQyZd0e/+u9H5VdOqCYA92YO2aeg+Q137ogLLTxNLVntYPT80S+4
         +2Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779860934; x=1780465734;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y5Nh+aas4H+tVdFpcRY4qWpPqsA5iVZBosvMp7GvgMs=;
        b=oC3G+aecGoRo4JHmN3r6BnpB6Brzpd7ihAHiVjNkWE0AXHe8QaJnisaLdmeQI9+X4D
         hiAq6rrQ1dnhfGCL/kU0U08TyoZrJ7iiHpiM5HGLowA0xjz6yiO9K8c9GKkGDqETlfBt
         QG5343+75qeLCI7mNM08eK4593BpQZ9zzkneGVXOcqxttrjAlKyWvDrL7x9E2r6kA9I0
         v2SyzVbq5wL3av5ufaL42BfH4VfELjD4P1Sq38Y0oL+uODLmtJIdgkcwKXejDdA0wHQB
         WMjSvPewjl0uG8j7jgbyNakwpCkxMzq0BGh/Ez4+l3hZ8P9XppKqnlWrwroSCBO/o+u2
         EHpg==
X-Gm-Message-State: AOJu0YyDuMkxz7SO5oeZdsIOYP3tvDulEjDGzybg75J0lH5ueuhBFCNP
	79st2io7sg9fctXVCd7DcCOOjewIE4O2ESG+m+f8nNym9KfZThRNTptT8tI8qD8CSFuvBm7hH2w
	t67PTL/kllq6fUgSXJh8m/Cuc07uFBEU=
X-Gm-Gg: Acq92OFWWgehYi8Moj7DhWeC5gOmXUKuhHufZ76k+WB9KC+N4tR88KfmTSJgps99/jD
	EXbnMND8uRmxsQ/1fnuWGvqKD6i2rMaC1Ul/v/T7YEjKu6uf/8JbAzdyUH8TDmfPOq+HGHEGhrM
	2BXeLYzZnlCIdNIJZV3K+73uokZYAjAL1fh9ook+dlGjDo8DsrrY38TmguyiDQmtDVbhYOZPDUK
	Aq7Ysq4Zd8wFPbpaJzzsQRyBsr4fIRYsoPgCZFotIzFHkC2EpmiPtkcKaB7w2hWY6thNGnbkR9b
	C1ZNlynsjjPZwBz377RYO+sxI8hJJo3D29X2XPXcQ3nX2JxLXDc=
X-Received: by 2002:a2e:be89:0:b0:38e:d3ec:4f87 with SMTP id
 38308e7fff4ca-395d8cf8f77mr59472861fa.21.1779860933495; Tue, 26 May 2026
 22:48:53 -0700 (PDT)
MIME-Version: 1.0
References: <20260526112501.15985-1-adityags2004@gmail.com> <CANNYZj-CRdJjU1z-0m8bqfWtS=X_PVzyg8uKS4mcRXMua+ikVQ@mail.gmail.com>
In-Reply-To: <CANNYZj-CRdJjU1z-0m8bqfWtS=X_PVzyg8uKS4mcRXMua+ikVQ@mail.gmail.com>
From: "Aditya G.S" <adityags2004@gmail.com>
Date: Wed, 27 May 2026 11:18:39 +0530
X-Gm-Features: AVHnY4IXii9q3U4NAwzyO2VMfDG1l0gbvg30XSMTCaaWqrsHCWypApcLSX9s6mY
Message-ID: <CAHaUZZAZGRx0H4z5sr8ndJVqjdUk4N9kaSRKp=6-DyX73e0VkQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] randtest: retry on unstable sigma instead of tolerating statistical outliers
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org, joaomarcos.costa@bootlin.com, 
	ross.burton@arm.com, randy.macleod@windriver.com, 
	richard.purdie@linuxfoundation.org
Content-Type: multipart/alternative; boundary="000000000000b0d3cc0652c62af0"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 May 2026 06:00:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237629

--000000000000b0d3cc0652c62af0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Alex,

Thanks for your feedback.

Originally, this patch was created on the Yocto side to handle intermittent
failures in randtest.sh by skipping the test. However, when I submitted it
via Bugzilla, I was advised to also engage with the gawk upstream
maintainers since the root cause lies within the gawk test itself.

Based on upstream feedback, instead of masking the issue in Yocto (by
skipping the test), I reworked the approach and created a patch for gawk's
randtest.sh to address the underlying problem (unstable sigma leading to
false failures). The idea is that if this fix is accepted upstream, it
would resolve the issue globally, including for Yocto, without needing a
workaround.

Following that, Bugzilla suggested sharing the updated gawk-side solution
here as well for visibility and review.

If the upstream fix is not accepted or takes time to land, I can provide
the original Yocto-specific patch (which skips the test) as a fallback
solution.

Please let me know how you would prefer to proceed.

Thanks,
Aditya

On Tue, May 26, 2026, 8:49=E2=80=AFPM Alexander Kanavin <alex.kanavin@gmail=
.com>
wrote:

> On Tue, 26 May 2026 at 15:36, Aditya GS via lists.openembedded.org
> <adityags2004=3Dgmail.com@lists.openembedded.org> wrote:
> >  test/randtest.sh | 122 +++++++++++++++++++++--------------------------
>
> This is a patch for gawk source code, and so is not applicable to
> oe-core. Does it need to be added to gawk recipe?
>
> Alex
>

--000000000000b0d3cc0652c62af0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Hi Alex,<div dir=3D"auto"><br></div><div dir=3D"auto">Tha=
nks for your feedback.</div><div dir=3D"auto"><br></div><div dir=3D"auto">O=
riginally, this patch was created on the Yocto side to handle intermittent =
failures in randtest.sh by skipping the test. However, when I submitted it =
via Bugzilla, I was advised to also engage with the gawk upstream maintaine=
rs since the root cause lies within the gawk test itself.</div><div dir=3D"=
auto"><br></div><div dir=3D"auto">Based on upstream feedback, instead of ma=
sking the issue in Yocto (by skipping the test), I reworked the approach an=
d created a patch for gawk&#39;s randtest.sh to address the underlying prob=
lem (unstable sigma leading to false failures). The idea is that if this fi=
x is accepted upstream, it would resolve the issue globally, including for =
Yocto, without needing a workaround.</div><div dir=3D"auto"><br></div><div =
dir=3D"auto">Following that, Bugzilla suggested sharing the updated gawk-si=
de solution here as well for visibility and review.</div><div dir=3D"auto">=
<br></div><div dir=3D"auto">If the upstream fix is not accepted or takes ti=
me to land, I can provide the original Yocto-specific patch (which skips th=
e test) as a fallback solution.</div><div dir=3D"auto"><br></div><div dir=
=3D"auto">Please let me know how you would prefer to proceed.</div><div dir=
=3D"auto"><br></div><div dir=3D"auto">Thanks,=C2=A0</div><div dir=3D"auto">=
Aditya</div></div><br><div class=3D"gmail_quote gmail_quote_container"><div=
 dir=3D"ltr" class=3D"gmail_attr">On Tue, May 26, 2026, 8:49=E2=80=AFPM Ale=
xander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com">alex.kanavin@g=
mail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On Tue, 26 =
May 2026 at 15:36, Aditya GS via <a href=3D"http://lists.openembedded.org" =
rel=3D"noreferrer noreferrer" target=3D"_blank">lists.openembedded.org</a><=
br>
&lt;adityags2004=3D<a href=3D"mailto:gmail.com@lists.openembedded.org" targ=
et=3D"_blank" rel=3D"noreferrer">gmail.com@lists.openembedded.org</a>&gt; w=
rote:<br>
&gt;=C2=A0 test/randtest.sh | 122 +++++++++++++++++++++--------------------=
------<br>
<br>
This is a patch for gawk source code, and so is not applicable to<br>
oe-core. Does it need to be added to gawk recipe?<br>
<br>
Alex<br>
</blockquote></div>

--000000000000b0d3cc0652c62af0--

