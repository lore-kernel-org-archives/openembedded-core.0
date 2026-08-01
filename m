Return-Path: <tim.orling@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC92EC5516F
	for <webhook@archiver.kernel.org>; Sat,  1 Aug 2026 20:47:23 +0000 (UTC)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12756.1785617241874715402
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Aug 2026 13:47:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=jteo+9fp;
 spf=pass (domain: konsulko.com, ip: 209.85.128.174, mailfrom: tim.orling@konsulko.com)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-81e86df8987so30536537b3.3
        for <openembedded-core@lists.openembedded.org>; Sat, 01 Aug 2026 13:47:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785617241; cv=none;
        d=google.com; s=arc-20260327;
        b=gkH3aTDbyTUZ3gHk5Lfa4TZkChtsvl7s3fpOy56slni0AqXnbRVGNQKZLImOyjHQCV
         s9RnPgPDKGqyX86zQb3DSGz39UbJIViSwx5rnEZLUpEhJEVzmMDe+3jJFe/UPlviaCjb
         ITHXQ1vpKBP1z88jw0VN51pxwCQrUvLBy411C9wFzLzfSBTG8TQsCTYYglRv6Bg5g+Mu
         I4zElKuRmIVyZV6eMt1k5FPntQ9tyd+/VB6yhky4BqLZGwitNXZ9R8RjQj/M6Ll6vtXz
         v0zcimcZA6Yn+ewF7Y5eIDKdJcUX8ZNv2IGO//oMgx/7UdkH4+1GxPkCwiwHq04HL7V+
         lrIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=/EH9GPiwK106GBiZGrdbbBQIHcPbpm2vfNPkR1yk980=;
        fh=a25D9d4/VQYaVGIMMPFDPpuuqEbbzI/115h0dCpfDJM=;
        b=MKD/YNP1JJ/M2r8thwIaYvbc49CVlJonhbcBZVFyRnRoPaEmmNdRKD2ZQoO3EqLPTa
         iXQuVfAKHgNlasR4JH7wyUwO8H1lyjbeXbc8hor+16CXMpbZbRFaS7QTRh562QWl2cDO
         JhEIhN+Oziyj+KVygf1qlWvwmQ0Tyf8eXisDD/RBdZ3cTuobVs9Y9l0YpCynCgHggvmz
         vqIKDwz3D/8Wy6+aRnyqP0N5ybRq2JUDMZG9N+19raGEcOoo2Du4UwhkytbK3FBq9nKa
         VbX6kM+2JkUBDS4BSMeaBVhY0LvPiblwT5mtw5AvtsIiYgtH+hT61vuLM6GwtxK7cua7
         1UsA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1785617241; x=1786222041; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/EH9GPiwK106GBiZGrdbbBQIHcPbpm2vfNPkR1yk980=;
        b=jteo+9fprMmqmls+XOPF1du0HQUld/LRgMVknf6G1ZMvhQHR9QyURg5kN4X6Thz4us
         qEaqiBPnydpy82deGCJ+aGGPk9vqmyTVAmBcPmAu45gn13bURYtgUVSXWlWAcJsWSfgr
         hUF5c3dvp15TZDQwbPoiWz0qWL/Hz1M/ujO+c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785617241; x=1786222041;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/EH9GPiwK106GBiZGrdbbBQIHcPbpm2vfNPkR1yk980=;
        b=MUCvDpAkIq1KC7CP4Tq1HlTVWtC77HCSwfRjzYTdS3f97B+caYndUaRRPJeXVWqnU8
         ktKuxM8QRHNmufbAGNM0eakTzoCpBtnF0f/6b9cVlxm0Afke4qjvzFxaNrMFlyItWMqd
         jQPMgtO6bfQHIO0zwDdlukt+1K4Uvo6b9YeT4muOisOaZ1WcsbJmHoiDbwM91R7HRiNG
         G5Lj/wSGQ/Fto5QqlvN+ntpBDIF3M3GBvDMc7Qj6RaYJY8JJD6+oNttrIc1kQAOqvl5K
         5lx5Ei1zIHeCBH+sBxYFxpL3zK6rHh7+/wuK99x0icMEC0dvFfvXF9nIuVr3YO2yOhu0
         m0fg==
X-Forwarded-Encrypted: i=1; AHgh+RpmOPLF1SKaLN2pQevLgIbo+Fwz0dtIQ2VKhAs7sQNkZoVq6kNBuOYybIdKXT1fc3x4COAz+yLWFC3C9rQmZqHFCA==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yy0Td4/n9zJUaXLl628naDIYH+idnEf9dt5zFJT46RGu04uSlO4
	WMetbrpww0htJmoW/aHjygNGHwMT+swFrZLA+D+PjH2JYqEZp1ORGi/TkjQ+H3XVxzEoSm9urZT
	uHr2xuDWUDzhGq601HVmpQJzhs+3duccF5rY5SP2taQ==
X-Gm-Gg: AR+sD10dH8EcDV1M/Hf9lXNYS85jQn9VjPzux4CY+o3RHJYlwKuIReGRWzEj4xBIalP
	S0kXMntAJAqViIXUSOXAfEXdvCDb9WT/72gc43iOmoWU4wkqsHSBzLpjeDNEC+SEoC+hznSpDD0
	dNK7AzDwr95pLVKwI354j43w/3MmpyM9Wzze6SekhJJXGxaQ3iamuo8gIS1084/zOgi9Cs9/ej9
	emWpYYToNrmI0qdl/OVVXXdpro/DEMgRvwE79xJcVcHPkuuNg/kVgF+2lNuUtKPpNmN4aLgKAzo
	Jr/vdMU6PGEIMkRSmunUOYBQdUUP5LM4Vk2wSfd9lRU4
X-Received: by 2002:a05:690c:260b:b0:81c:89a2:dbce with SMTP id
 00721157ae682-81fd49c386bmr76751137b3.3.1785617240848; Sat, 01 Aug 2026
 13:47:20 -0700 (PDT)
MIME-Version: 1.0
References: <0101019fb18e1918-6e60db78-fa07-43d5-8bb5-0f1a3bf1758a-000000@us-west-2.amazonses.com>
 <040de8e5eb3f8b57f00cfa691c8d5889103b7e50.camel@linuxfoundation.org>
 <CAOyo-84CvS6-hHAdU4T2+8PRs1U-N1-bwmrc-kbm-D-E+hf0hg@mail.gmail.com> <ed706c3879b38bb0e588725b3074f68008161949.camel@linuxfoundation.org>
In-Reply-To: <ed706c3879b38bb0e588725b3074f68008161949.camel@linuxfoundation.org>
From: Tim Orling <tim.orling@konsulko.com>
Date: Sat, 1 Aug 2026 13:47:10 -0700
X-Gm-Features: AUfX_mxYzmm5Wm0Fm89uOCGkDsFu_RkQaaWjxhIeQmLAQa48b13IfQT_RZl-lMM
Message-ID: <CAOyo-87jLx5afRQNFBUDHW1Oqt_OfPR=8L-XbfawMse_V-tqhg@mail.gmail.com>
Subject: Re: [OE-core] [AUH] python3-websockets: upgrading to 17.0 SUCCEEDED
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: auh@yoctoproject.org, openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000589c0f06580269d6"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Aug 2026 20:47:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242505

--000000000000589c0f06580269d6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 1, 2026 at 1:38=E2=80=AFPM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Sat, 2026-08-01 at 13:07 -0700, Tim Orling wrote:
> > On Fri, Jul 31, 2026 at 11:14=E2=80=AFPM Richard Purdie <
> richard.purdie@linuxfoundation.org> wrote:
> > > On Thu, 2026-07-30 at 05:45 +0000, Auto Upgrade Helper via
> lists.openembedded.org wrote:
> > > > Hello,
> > > >
> > > > this email is a notification from the Auto Upgrade Helper
> > > > that the automatic attempt to upgrade the recipe(s)
> *python3-websockets* to *17.0* has Succeeded.
> > > >
> > > > Next steps:
> > > >     - apply the patch: git am
> 0001-python3-websockets-upgrade-16.1.1-17.0.patch
> > > >     - check the changes to upstream patches and summarize them in
> the commit message,
> > > >     - compile an image that contains the package
> > > >     - perform some basic sanity tests
> > > >     - amend the patch and sign it off: git commit -s --reset-author
> --amend
> > > >     - send it to the appropriate mailing list
> > > >
> > > > Alternatively, if you believe the recipe should not be upgraded at
> this time,
> > > > you can fill RECIPE_NO_UPDATE_REASON in respective recipe file so
> that
> > > > automatic upgrades would no longer be attempted.
> > > >
> > > > Please review the attached files for further information and
> build/update failures.
> > > > Any problem please file a bug at
> https://bugzilla.yoctoproject.org/enter_bug.cgi?product=3DAutomated%20Upd=
ate%20Handler
> > > >
> > > > Regards,
> > > > The Upgrade Helper
> > >
> > > This creates ptest failures. I note a new point release in AUH today
> too.
> > >
> > >
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/56/builds/2047
> > >
> >
> > This upgrade was already "on my list", so I will follow up on the
> > ptest failures next week. Thank you for the feedback and the link.
>
> Thanks, the newer version still has the ptest issue FWIW (with no ptest
> results showing at all).
>
> I've held off the uv-build upgrade as that doesn't work with the
> current python3-crytopgraphy too!
>
>
I'll add the uv-build upgrade to my "TODO list".


> Cheers,
>
> Richard
>

--000000000000589c0f06580269d6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Sat, Aug 1, =
2026 at 1:38=E2=80=AFPM Richard Purdie &lt;<a href=3D"mailto:richard.purdie=
@linuxfoundation.org">richard.purdie@linuxfoundation.org</a>&gt; wrote:<br>=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex">On Sat, 2026-08-01 =
at 13:07 -0700, Tim Orling wrote:<br>
&gt; On Fri, Jul 31, 2026 at 11:14=E2=80=AFPM Richard Purdie &lt;<a href=3D=
"mailto:richard.purdie@linuxfoundation.org" target=3D"_blank">richard.purdi=
e@linuxfoundation.org</a>&gt; wrote:<br>
&gt; &gt; On Thu, 2026-07-30 at 05:45 +0000, Auto Upgrade Helper via <a hre=
f=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D"_blank">li=
sts.openembedded.org</a> wrote:<br>
&gt; &gt; &gt; Hello,<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; this email is a notification from the Auto Upgrade Helper<br=
>
&gt; &gt; &gt; that the automatic attempt to upgrade the recipe(s) *python3=
-websockets* to *17.0* has Succeeded.<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; Next steps:<br>
&gt; &gt; &gt; =C2=A0=C2=A0=C2=A0 - apply the patch: git am 0001-python3-we=
bsockets-upgrade-16.1.1-17.0.patch<br>
&gt; &gt; &gt; =C2=A0=C2=A0=C2=A0 - check the changes to upstream patches a=
nd summarize them in the commit message,<br>
&gt; &gt; &gt; =C2=A0=C2=A0=C2=A0 - compile an image that contains the pack=
age<br>
&gt; &gt; &gt; =C2=A0=C2=A0=C2=A0 - perform some basic sanity tests<br>
&gt; &gt; &gt; =C2=A0=C2=A0=C2=A0 - amend the patch and sign it off: git co=
mmit -s --reset-author --amend<br>
&gt; &gt; &gt; =C2=A0=C2=A0=C2=A0 - send it to the appropriate mailing list=
<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; Alternatively, if you believe the recipe should not be upgra=
ded at this time,<br>
&gt; &gt; &gt; you can fill RECIPE_NO_UPDATE_REASON in respective recipe fi=
le so that<br>
&gt; &gt; &gt; automatic upgrades would no longer be attempted.<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; Please review the attached files for further information and=
 build/update failures.<br>
&gt; &gt; &gt; Any problem please file a bug at <a href=3D"https://bugzilla=
.yoctoproject.org/enter_bug.cgi?product=3DAutomated%20Update%20Handler" rel=
=3D"noreferrer" target=3D"_blank">https://bugzilla.yoctoproject.org/enter_b=
ug.cgi?product=3DAutomated%20Update%20Handler</a><br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; Regards,<br>
&gt; &gt; &gt; The Upgrade Helper<br>
&gt; &gt; <br>
&gt; &gt; This creates ptest failures. I note a new point release in AUH to=
day too.<br>
&gt; &gt; <br>
&gt; &gt; <a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builde=
rs/56/builds/2047" rel=3D"noreferrer" target=3D"_blank">https://autobuilder=
.yoctoproject.org/valkyrie/#/builders/56/builds/2047</a><br>
&gt; &gt; <br>
&gt; <br>
&gt; This upgrade was already &quot;on my list&quot;, so I will follow up o=
n the<br>
&gt; ptest failures next week. Thank you for the feedback and the link.<br>
<br>
Thanks, the newer version still has the ptest issue FWIW (with no ptest<br>
results showing at all).<br>
<br>
I&#39;ve held off the uv-build upgrade as that doesn&#39;t work with the<br=
>
current python3-crytopgraphy too!<br>
<br></blockquote><div><br></div><div>I&#39;ll add the uv-build upgrade to m=
y &quot;TODO list&quot;.</div><div>=C2=A0</div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex">
Cheers,<br>
<br>
Richard<br>
</blockquote></div></div>

--000000000000589c0f06580269d6--

