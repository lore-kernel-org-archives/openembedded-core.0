Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 123E5C61DC2
	for <webhook@archiver.kernel.org>; Thu, 27 Aug 2026 07:23:17 +0000 (UTC)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.30736.1787815391604816643
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Aug 2026 00:23:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=eXujFm2j;
 spf=pass (domain: mvista.com, ip: 209.85.208.42, mailfrom: vanusuri@mvista.com)
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-698ae09e356so506340a12.2
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Aug 2026 00:23:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787815390; cv=none;
        d=google.com; s=arc-20260327;
        b=RGyiEiFRwvR/1FdE8JrcDHRN/+8dGUqSlmV/T5hMtmxCbpErXw/6TOTCdoL/yEmvh4
         wtdmz0PYgPIMZAJOCCK6eXWoN2wVfltZZo4eZDoh0uctEC/duXkQROMcK98JwoA4t+82
         nC8hP7drZl0auB10/9JPazAoCLL7EIkHuzKrFzdRS/S1xA95J8HHNW2KvrbygBx3MW91
         dW2++y/Dm5Wgoim/Ancjk7X+CWshuh1vh4Nhy/DHKiZEi5mnCsZBCn+xZ/XRmRS4Da53
         SZLCe/VyWiI+dt/M1F1+lr7ErCNtcj8mmuTPyTqRgypfGfK8BwyJCeLHhE8gk1vlpbC0
         yv0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=goheu8KrsojYx/mOv57xOj2qgXopNJuuesRZzVCxIs4=;
        fh=U8AJvFDH9EzMQ5AF2yeEipmNIRP9lHLd14HzSfQ14Es=;
        b=P6BusMTWVv1TaX89xK38W3xxnD/NLqJdkBdDbsAASuIC5pYh76QBbKavV06pywCATh
         GdSIvIeIXcjfX4+9RVljCpfnTLEJRKpm4epNJwSnJXtDdOtrZtl3asmGt/e1bjwwsuFV
         pIyFJf7rBAAUTJNLcyuFvGG7t+2pCMrsWV3VSCTFdmTdCV2SaB4RM3xsi8eLV1iRkL4k
         m4BTIb1MG7/S5ZVSFM1tS9u+x4PYjmoarX8WcZduClPNaF/uBatarCzYn8LSBWYTuUkn
         B4UzotSJ9w0Yjjq5ioV8fOCnADZjjlPW0zOtONfJ4EMStik4afuTXKpvzKIJlXnw+9oK
         1xgw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1787815390; x=1788420190; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=goheu8KrsojYx/mOv57xOj2qgXopNJuuesRZzVCxIs4=;
        b=eXujFm2jChBY1h2L7KldjbQpjWgZZ00tpaEx5jsQhDyVQ/MCo9v/BG0MeW7NbslZ7v
         cPc6p8Ml7kiWVvUHDADOlapqJmrmA24KoscJeIWuctzz5weh7FjFuAQgGFjtu1jgnHEZ
         wuB/kkRRU26MF+EkfZyWA/SfawC09EuPOrnyU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787815390; x=1788420190;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=goheu8KrsojYx/mOv57xOj2qgXopNJuuesRZzVCxIs4=;
        b=A/ZhdyC+wzayod/vDGFTMfcM6YjgaZJHLMvpoWbmsY9kjGUFLJ8IWjW182pXGJj+rJ
         r74FQrG7S4aSui7pCEK0jcVJEpUOuZGett/SKAj3M0W0V6wkFSST/hzlOlEMqMiQgl2p
         wFXE9eJkZc0Xjb9gTO0pEwaS8BDmbInER7W3VN74tpdH6HuxYTBzhJ38QeM09grkxDqK
         wPXWWGdlXkvdjjv2qUMy6NYFVAtx9w+C7Dsm8MZ176xzwPPY0BrLKQ8AnIF6LZczNY6e
         KIiECmQbeAMp0sto0Z4F8jnvC57sJlgkngJZpM/SLIgSIvWVkEyJRq/wRqBJsfkfGHxw
         qajQ==
X-Forwarded-Encrypted: i=1; AHgh+RqoNUPW/LXka8lP+giex/xBmkH3TK3W+d605/0I6Vvw1TyQf0PbjhImXDAmYSi+MTLhNfG4Y6JLUzdPiK8S6hjqZA==@lists.openembedded.org
X-Gm-Message-State: AFuF++lx/4mxR6zojtKbYtooiw2jRSU0SCH9T+zwIyHFexRixVHxp20n
	pUwy182CoFnSW1+6dkukXVcRHAYV698ieFjs0rmVkG9xaEj2itqpFkurN6q/Mv+teLayHW4nJSm
	3ksZCAz44DicguraYQPo5ONJi8TxQ6CapES6YTxNlbw==
X-Gm-Gg: AR+sD11Sn3KQOE5JDwAisgMpe0dPA1kCnD57+e+BYGpZZZLB2yxok7xDgDxDTUm/zdI
	dIqSN9UXLxpYTDtACbOZpXcWo1n4J+WWpFOpSQ2VhKXodcAMDF4mQ6z1hGhnrHAM/zoj/HjLWF4
	VV3rSepVB8KCQyYJ8UDFgiM31F5GDgitag7M09HD0Mq9WyvN7ktZp92DBtgFgR4lwzfUNI6refk
	kIesf9hKdwZWXgSvn7OSv4+q8I6yMCao4kp0NbpMKaJBnpmatZs8jJkQe5IZJoblaSOrFe2+5Wf
	Ib2dhcCGOwFNqRa7IvZ/SyJtJgCHiwzfFngJRh6y2K93
X-Received: by 2002:a05:6402:505b:b0:698:af31:5a9b with SMTP id
 4fb4d7f45d1cf-6a5df62ac1bmr13658406a12.9.1787815389188; Thu, 27 Aug 2026
 00:23:09 -0700 (PDT)
MIME-Version: 1.0
References: <20260723092354.54697-1-sdoshi@mvista.com> <20260723092354.54697-13-sdoshi@mvista.com>
 <CANQUz18xEMFKxx9QpXjfBomaJkzJWyj1nkF_vp96fna=dG7LmA@mail.gmail.com> <DKZ1IM1Z8T8O.1D5HCOURS6TZP@smile.fr>
In-Reply-To: <DKZ1IM1Z8T8O.1D5HCOURS6TZP@smile.fr>
From: Vijay Anusuri <vanusuri@mvista.com>
Date: Thu, 27 Aug 2026 12:52:56 +0530
X-Gm-Features: AcwNN1Wfb6vM2P3icf1YwhYAO_hymKBSROSNHMVYmo3x4A7WmIL2W7iDrEzWwVw
Message-ID: <CANQUz1_knhX0H_SbpZZ9VeqwY+n5ZueBiGf7NWMhmBLgjofSug@mail.gmail.com>
Subject: Re: [OE-core][scarthgap][PATCHv2 13/13] vim: Security Fix for CVE-2026-59858
To: Yoann Congal <yoann.congal@smile.fr>
Cc: sdoshi@mvista.com, Fabien Thomas <fabien.thomas@smile.fr>, 
	openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000032667a065a023520"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Aug 2026 07:23:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244464

--00000000000032667a065a023520
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Yoann,

Thanks for the information.

I checked the patches, and patches 6=E2=80=9313 are already present in the
wrynose-nut branch.

Thanks & Regards,

Vijay


On Wed, Aug 26, 2026 at 10:39=E2=80=AFPM Yoann Congal <yoann.congal@smile.f=
r> wrote:

> On Wed Aug 26, 2026 at 4:51 PM CEST, Vijay Anusuri wrote:
> > Hi Team,
> >
> > Any update on this?
>
> For this series, 6-13/13 are in "awaiting Upstream" state[0], that mean
> that
> I will check if their equivalent merged on master&wrynose (I plan to do
> this next week)
>
> You can check this yourself and send the missing patches if you find
> any (please be mindful of exiting patches on -nut branch and on list)
>
> Regards,
>
> [0]:
> https://patchwork.yoctoproject.org/project/oe-core/list/?series=3D49053&s=
tate=3D%2A&archive=3Dboth
> >
> > Thanks & Regards,
> > Vijay
> >
> > On Thu, Jul 23, 2026 at 2:56=E2=80=AFPM Siddharth Doshi via
> lists.openembedded.org
> > <sdoshi=3Dmvista.com@lists.openembedded.org> wrote:
> >
> >> From: Siddharth Doshi <sdoshi@mvista.com>
> >>
> >> Picking patch as per [1], and same patch is mentioned in [2]
> >>
> >> References:
> >> [1] https://nvd.nist.gov/vuln/detail/CVE-2026-59858
> >> [2] https://security-tracker.debian.org/tracker/CVE-2026-59858
> >>
> >> Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
> >> ---
> >>  .../vim/files/CVE-2026-59858.patch            | 134 +++++++++++++++++=
+
> >>  meta/recipes-support/vim/vim.inc              |   1 +
> >>  2 files changed, 135 insertions(+)
> >>  create mode 100644 meta/recipes-support/vim/files/CVE-2026-59858.patc=
h
>
> --
> Yoann Congal
> Smile ECS
>
>

--00000000000032667a065a023520
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><p class=3D"gmail-isSelectedEnd"><span>Hi Yoann,</span></p=
><p class=3D"gmail-isSelectedEnd"><span>Thanks for the information.</span><=
/p><p><span>I checked the patches, and patches 6=E2=80=9313 are already pre=
sent in the wrynose-nut branch.<br><br></span></p><p><span>Thanks &amp;=C2=
=A0Regards,<br></span></p><p><span>Vijay</span></p><br></div><br><div class=
=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr=
">On Wed, Aug 26, 2026 at 10:39=E2=80=AFPM Yoann Congal &lt;<a href=3D"mail=
to:yoann.congal@smile.fr">yoann.congal@smile.fr</a>&gt; wrote:<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex">On Wed Aug 26, 2026 at 4:51 =
PM CEST, Vijay Anusuri wrote:<br>
&gt; Hi Team,<br>
&gt;<br>
&gt; Any update on this?<br>
<br>
For this series, 6-13/13 are in &quot;awaiting Upstream&quot; state[0], tha=
t mean that<br>
I will check if their equivalent merged on master&amp;wrynose (I plan to do=
<br>
this next week)<br>
<br>
You can check this yourself and send the missing patches if you find<br>
any (please be mindful of exiting patches on -nut branch and on list)<br>
<br>
Regards,<br>
<br>
[0]: <a href=3D"https://patchwork.yoctoproject.org/project/oe-core/list/?se=
ries=3D49053&amp;state=3D%2A&amp;archive=3Dboth" rel=3D"noreferrer" target=
=3D"_blank">https://patchwork.yoctoproject.org/project/oe-core/list/?series=
=3D49053&amp;state=3D%2A&amp;archive=3Dboth</a><br>
&gt;<br>
&gt; Thanks &amp; Regards,<br>
&gt; Vijay<br>
&gt;<br>
&gt; On Thu, Jul 23, 2026 at 2:56=E2=80=AFPM Siddharth Doshi via <a href=3D=
"http://lists.openembedded.org" rel=3D"noreferrer" target=3D"_blank">lists.=
openembedded.org</a><br>
&gt; &lt;sdoshi=3D<a href=3D"mailto:mvista.com@lists.openembedded.org" targ=
et=3D"_blank">mvista.com@lists.openembedded.org</a>&gt; wrote:<br>
&gt;<br>
&gt;&gt; From: Siddharth Doshi &lt;<a href=3D"mailto:sdoshi@mvista.com" tar=
get=3D"_blank">sdoshi@mvista.com</a>&gt;<br>
&gt;&gt;<br>
&gt;&gt; Picking patch as per [1], and same patch is mentioned in [2]<br>
&gt;&gt;<br>
&gt;&gt; References:<br>
&gt;&gt; [1] <a href=3D"https://nvd.nist.gov/vuln/detail/CVE-2026-59858" re=
l=3D"noreferrer" target=3D"_blank">https://nvd.nist.gov/vuln/detail/CVE-202=
6-59858</a><br>
&gt;&gt; [2] <a href=3D"https://security-tracker.debian.org/tracker/CVE-202=
6-59858" rel=3D"noreferrer" target=3D"_blank">https://security-tracker.debi=
an.org/tracker/CVE-2026-59858</a><br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Siddharth Doshi &lt;<a href=3D"mailto:sdoshi@mvista=
.com" target=3D"_blank">sdoshi@mvista.com</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt;=C2=A0 .../vim/files/CVE-2026-59858.patch=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 | 134 ++++++++++++++++++<br>
&gt;&gt;=C2=A0 meta/recipes-support/vim/vim.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A01 +<br>
&gt;&gt;=C2=A0 2 files changed, 135 insertions(+)<br>
&gt;&gt;=C2=A0 create mode 100644 meta/recipes-support/vim/files/CVE-2026-5=
9858.patch<br>
<br>
-- <br>
Yoann Congal<br>
Smile ECS<br>
<br>
</blockquote></div>

--00000000000032667a065a023520--

