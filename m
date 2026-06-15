Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58FC7CD98CF
	for <webhook@archiver.kernel.org>; Mon, 15 Jun 2026 14:03:53 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.130406.1781532229562897234
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jun 2026 07:03:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=2NcPhNhL;
 spf=pass (domain: smile.fr, ip: 209.85.167.43, mailfrom: yoann.congal@smile.fr)
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5aa68cf03bfso3923702e87.0
        for <openembedded-core@lists.openembedded.org>; Mon, 15 Jun 2026 07:03:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781532227; cv=none;
        d=google.com; s=arc-20240605;
        b=f++Gqcpi1Ys8EFUyCSCLBB0BCr5EGmb9I8zxkEyTIhaBfSpgY0PHkNaWi9CrWNsxIw
         rfDCImW25WIXWEm9sHQqqZHk7EeiBmuiaHhQWyT+EjLAH3MV1JTu/9G9crivkALAdo4p
         ouUvappxdlXhRUKDko09RfiNQfOafRjY26UGk1VIWnGWAH4dCmAJJyvBZAuV5mHCM5pr
         9oBdsbesQtlw/JqX3Q6RffGuNU2gzU/8JQoYad96YxBCKR2wXHVgAH6FcOYwEBugJOg2
         Brc/ar08Bi184kTBszmqU7mNxsmyNgY1U/1bOjKO4UvcJws8+983ets/XF6GGYpgkPzy
         OwjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=+8TBZ/MGMx3yg97Bmd1/Thv8dNJbn2NhN/Ekx3hYG28=;
        fh=kyrcx/wGdP1K8AcZ1t5dlAg43e9Kck6gc8gLfroTQbI=;
        b=G8j3HP+uS83LcD719Nch/2aITi/YCzLEhE+3ugEo1/07Pt7Pz6yUvvUnYDtlF3IjmH
         GshdSH+v1jKd1mm1KB4y2jxtJVaFZZu0dnEudnJYe+fUroCC3c+g8tJ7vbbBliYsHVc+
         pYb5yL55xtfZONbbU/6ZhHzmhxSvDift6OwzcX/nQYl+IH78jXChe+Wwi4uNU5kERlVM
         ZAn/R+0v0QUXMhn0BVUXR/68jlqapZ4XIuDfvqfjx0czVPEJh+AmYa2WnOkqHOH/N7sB
         rH1YXyB+MsymF+k7D1HQTQ9ByG+nipM+THB9KQ5x9ETfafziWdgEXUmuiEFpba6+cgJz
         sMUA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1781532227; x=1782137027; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+8TBZ/MGMx3yg97Bmd1/Thv8dNJbn2NhN/Ekx3hYG28=;
        b=2NcPhNhLGAitALfs9d/+hQlTPG68kygr5q5AdPFTcxi3WAShPMai5tKCl2AyhSzy29
         2a7oePKFWfz+IlqWkX4ssBPm+7lCYSFZVLNgEcnd7PsD0v/5/XONGnUE3QBn12lBjfhx
         X8mmx0xe9f+VGuJamdGoxPYa5Jo/UgpyBGG9M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781532227; x=1782137027;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+8TBZ/MGMx3yg97Bmd1/Thv8dNJbn2NhN/Ekx3hYG28=;
        b=Yvg3qTH1g0CBskQfscr+m1ZRVBBAQCHPsYGUhKs5OXftHLUC415e88MZLmL52jo+EZ
         vlOkprAQlbt7b4QEJjpCHKvBmNS4VSLRoekuG2IFH8IpXkgzXnVSCz367OUCoy5Vbm8L
         xUriAohAFx3rmCKBDYW0eZVXj6JFT7HgMHdKjgcMPJQMhkxaZbecscu6SR5donjBLiq3
         8P4POGHYbvhPhCJeUYwga9uXcTQatr13aQeaT9+V6Yp4qqT/BUcgddpxpi3q+VUeGPwu
         7m7ywSMJaXShHel0h7hM7P6YaBBjp9FaPLih7AuDye3EA/LPsHlkn5QY3ceLGVWPPC/l
         ROZQ==
X-Gm-Message-State: AOJu0YzsN0PQQxPaGGh4gBp4upz1a8oIu5vfPjQ3OVoj7rYO2yImlBcu
	Z2buuJBM0hFSsgE3TIZokngUyoZeyJ8zMdAd36AUaqruSVmuwC4yBajkRU8c5d7nEuHf/77Iu51
	7/jqnIIMisWVEOfVPqYZTZ3DY/ZLoOjh/Y8ZxXVTXog==
X-Gm-Gg: Acq92OG4KJzI3jBwojqAIuUHJhFSzbobNiAEzMhXj20ZrZ0f2j+i80T6Ljn/nT+7bVS
	MhAzQqYjfIArpQp8vxRGzYHTgYNhfiU1yHC9fTylaEsVxGujaC7Sal8NTGIGaYNG5YhOM9581+o
	uusYxxkO2Evfkh/XmEiiFTqOdGhYTfpaUyPf/ywTqHO/U45oREapMk6ShrMu8+fKLc2biNKOdQK
	BgNu1XRpmDnx+pBJ7RXPGihye+jV+vFTOqFbVslWVPAAp+pRVni3HAg06gsK50fAYrGWWzY73t2
	v5dtdSlbpO9zgGo9EYXnADYDPzUhf3+dMFNh8bQr
X-Received: by 2002:a05:6512:3f18:b0:5a8:7317:5417 with SMTP id
 2adb3069b0e04-5ad2db1dd00mr3257795e87.9.1781532227101; Mon, 15 Jun 2026
 07:03:47 -0700 (PDT)
MIME-Version: 1.0
References: <20260608215354.3664441-1-peter.marko@siemens.com>
 <20260608215654.3664494-1-peter.marko@siemens.com> <20260608215654.3664494-2-peter.marko@siemens.com>
 <DJ9N3LXO3BIZ.1ZNV8G69H1RCK@smile.fr> <AS8PR10MB5073D3D3C7276E78F4A5EEF9FDE62@AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: <AS8PR10MB5073D3D3C7276E78F4A5EEF9FDE62@AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM>
From: Yoann Congal <yoann.congal@smile.fr>
Date: Mon, 15 Jun 2026 16:03:20 +0200
X-Gm-Features: AVVi8Cer2Vtgj-QwpuLNbPNbBdp9ZbVEiOp-jRc8WDKyYO0uW9vmU6QjDVtmKO0
Message-ID: <CAMSfU+5mgOt-JwHpdGWvyA1yaVA+Bzvs=OiJPXk_KLuCiabe2Q@mail.gmail.com>
Subject: Re: [OE-core] [wrynose][PATCH 3/6] python3: use SKIPPED_TESTS instead
 of test skip patches
To: "Marko, Peter" <Peter.Marko@siemens.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000008d7e5506544b4b56"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Jun 2026 14:03:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238853

--0000000000008d7e5506544b4b56
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le lun. 15 juin 2026 =C3=A0 15:56, Marko, Peter <Peter.Marko@siemens.com> a
=C3=A9crit :

>
>
> > -----Original Message-----
> > From: Yoann Congal <yoann.congal@smile.fr>
> > Sent: Monday, June 15, 2026 2:59 PM
> > To: Marko, Peter (FT D EU SK BFS1) <Peter.Marko@siemens.com>;
> > openembedded-core@lists.openembedded.org
> > Subject: Re: [OE-core] [wrynose][PATCH 3/6] python3: use SKIPPED_TESTS
> > instead of test skip patches
> >
> > On Mon Jun 8, 2026 at 11:56 PM CEST, Peter Marko via
> lists.openembedded.org
> > wrote:
> > > From: Trevor Gamblin <tgamblin@baylibre.com>
> > >
> > > Drop all 13 patches carried for skipping various known ptest failures
> > > and replace them with usage of the SKIPPED_TESTS variable, which we
> have
> > > started doing in recent commits (e.g. 40b0815dc9). Most but not all o=
f
> > > the test skips are due to load variability, distinguish between them =
by
> > > using multiple SKIPPED_TESTS:append blocks with comments taken from t=
he
> > > patch files indicating their purpose. This adds 62 lines to the Pytho=
n
> 3
> > > recipe, but it also means that we no longer have to maintain the patc=
h
> > > files across version upgrades, where they often break due to changes =
in
> > > the test modules upstream.
> > >
> > > Results look the same as those from my last upgrade run:
> > >
> > > |=3D=3D Tests result: SUCCESS =3D=3D
> > > |
> > > |28 tests skipped:
> > > |    test.test_asyncio.test_windows_events
> > > |    test.test_asyncio.test_windows_utils test.test_gdb.test_backtrac=
e
> > > |    test.test_gdb.test_cfunction test.test_gdb.test_cfunction_full
> > > |    test.test_gdb.test_misc test.test_gdb.test_pretty_print
> > > |    test_android test_apple test_asdl_parser test_clinic test_devpol=
l
> > > |    test_free_threading test_generated_cases test_idle test_kqueue
> > > |    test_launcher test_msvcrt test_startfile test_tcl test_tkinter
> > > |    test_ttk test_ttk_textonly test_turtle test_winapi
> > > |    test_winconsoleio test_winreg test_wmi
> > > |
> > > |9 tests skipped (resource denied):
> > > |    test_curses test_peg_generator test_smtpnet test_socketserver
> > > |    test_urllib2net test_urllibnet test_winsound test_xpickle
> > > |    test_zipfile64
> > > |
> > > |455 tests OK.
> > > |
> > > |Total duration: 3 min 9 sec
> > > |Total tests: run=3D47,012 (filtered) skipped=3D2,336
> > > |Total test files: run=3D483/492 (filtered) skipped=3D28 resource_den=
ied=3D9
> > > |Result: SUCCESS
> > > |DURATION: 190
> > > |END: /usr/lib/python3/ptest
> > > |2026-05-29T02:22
> > > |STOP: ptest-runner
> > > |TOTAL: 1 FAIL: 0
> > >
> > > Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
> > > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > > (From OE-Core rev: a8b2baa6020f96468a98200619ec37c460694c4c)
> > > Signed-off-by: Peter Marko <peter.marko@siemens.com>
> > > ---
> >
> > Hello Peter,
> >
> > After discussing with Paul, we decided to not take patches 3, 4 & 6/6 o=
f
> > this series. Those are (as of now) only cleanups and thus not eligible
> > for stable merge.
> >
> > This will be most likely be revisited when a fix appear on master in th=
e
> > SKIPPED_TESTS list.
> >
> > Thanks!
>
> OK, let's see on next upgrade what is needed for a clean cherry-pick.
> v3.14.6 is already out, I will do the upgrade later this week.
>

Sounds good.
Thank you!
--=20
Yoann Congal
Smile ECS

--0000000000008d7e5506544b4b56
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0lun. 15=
 juin 2026 =C3=A0=C2=A015:56, Marko, Peter &lt;<a href=3D"mailto:Peter.Mark=
o@siemens.com">Peter.Marko@siemens.com</a>&gt; a =C3=A9crit=C2=A0:<br></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
<br>
&gt; -----Original Message-----<br>
&gt; From: Yoann Congal &lt;<a href=3D"mailto:yoann.congal@smile.fr" target=
=3D"_blank">yoann.congal@smile.fr</a>&gt;<br>
&gt; Sent: Monday, June 15, 2026 2:59 PM<br>
&gt; To: Marko, Peter (FT D EU SK BFS1) &lt;<a href=3D"mailto:Peter.Marko@s=
iemens.com" target=3D"_blank">Peter.Marko@siemens.com</a>&gt;;<br>
&gt; <a href=3D"mailto:openembedded-core@lists.openembedded.org" target=3D"=
_blank">openembedded-core@lists.openembedded.org</a><br>
&gt; Subject: Re: [OE-core] [wrynose][PATCH 3/6] python3: use SKIPPED_TESTS=
<br>
&gt; instead of test skip patches<br>
&gt; <br>
&gt; On Mon Jun 8, 2026 at 11:56 PM CEST, Peter Marko via <a href=3D"http:/=
/lists.openembedded.org" rel=3D"noreferrer" target=3D"_blank">lists.openemb=
edded.org</a><br>
&gt; wrote:<br>
&gt; &gt; From: Trevor Gamblin &lt;<a href=3D"mailto:tgamblin@baylibre.com"=
 target=3D"_blank">tgamblin@baylibre.com</a>&gt;<br>
&gt; &gt;<br>
&gt; &gt; Drop all 13 patches carried for skipping various known ptest fail=
ures<br>
&gt; &gt; and replace them with usage of the SKIPPED_TESTS variable, which =
we have<br>
&gt; &gt; started doing in recent commits (e.g. 40b0815dc9). Most but not a=
ll of<br>
&gt; &gt; the test skips are due to load variability, distinguish between t=
hem by<br>
&gt; &gt; using multiple SKIPPED_TESTS:append blocks with comments taken fr=
om the<br>
&gt; &gt; patch files indicating their purpose. This adds 62 lines to the P=
ython 3<br>
&gt; &gt; recipe, but it also means that we no longer have to maintain the =
patch<br>
&gt; &gt; files across version upgrades, where they often break due to chan=
ges in<br>
&gt; &gt; the test modules upstream.<br>
&gt; &gt;<br>
&gt; &gt; Results look the same as those from my last upgrade run:<br>
&gt; &gt;<br>
&gt; &gt; |=3D=3D Tests result: SUCCESS =3D=3D<br>
&gt; &gt; |<br>
&gt; &gt; |28 tests skipped:<br>
&gt; &gt; |=C2=A0 =C2=A0 test.test_asyncio.test_windows_events<br>
&gt; &gt; |=C2=A0 =C2=A0 test.test_asyncio.test_windows_utils test.test_gdb=
.test_backtrace<br>
&gt; &gt; |=C2=A0 =C2=A0 test.test_gdb.test_cfunction test.test_gdb.test_cf=
unction_full<br>
&gt; &gt; |=C2=A0 =C2=A0 test.test_gdb.test_misc test.test_gdb.test_pretty_=
print<br>
&gt; &gt; |=C2=A0 =C2=A0 test_android test_apple test_asdl_parser test_clin=
ic test_devpoll<br>
&gt; &gt; |=C2=A0 =C2=A0 test_free_threading test_generated_cases test_idle=
 test_kqueue<br>
&gt; &gt; |=C2=A0 =C2=A0 test_launcher test_msvcrt test_startfile test_tcl =
test_tkinter<br>
&gt; &gt; |=C2=A0 =C2=A0 test_ttk test_ttk_textonly test_turtle test_winapi=
<br>
&gt; &gt; |=C2=A0 =C2=A0 test_winconsoleio test_winreg test_wmi<br>
&gt; &gt; |<br>
&gt; &gt; |9 tests skipped (resource denied):<br>
&gt; &gt; |=C2=A0 =C2=A0 test_curses test_peg_generator test_smtpnet test_s=
ocketserver<br>
&gt; &gt; |=C2=A0 =C2=A0 test_urllib2net test_urllibnet test_winsound test_=
xpickle<br>
&gt; &gt; |=C2=A0 =C2=A0 test_zipfile64<br>
&gt; &gt; |<br>
&gt; &gt; |455 tests OK.<br>
&gt; &gt; |<br>
&gt; &gt; |Total duration: 3 min 9 sec<br>
&gt; &gt; |Total tests: run=3D47,012 (filtered) skipped=3D2,336<br>
&gt; &gt; |Total test files: run=3D483/492 (filtered) skipped=3D28 resource=
_denied=3D9<br>
&gt; &gt; |Result: SUCCESS<br>
&gt; &gt; |DURATION: 190<br>
&gt; &gt; |END: /usr/lib/python3/ptest<br>
&gt; &gt; |2026-05-29T02:22<br>
&gt; &gt; |STOP: ptest-runner<br>
&gt; &gt; |TOTAL: 1 FAIL: 0<br>
&gt; &gt;<br>
&gt; &gt; Signed-off-by: Trevor Gamblin &lt;<a href=3D"mailto:tgamblin@bayl=
ibre.com" target=3D"_blank">tgamblin@baylibre.com</a>&gt;<br>
&gt; &gt; Signed-off-by: Richard Purdie &lt;<a href=3D"mailto:richard.purdi=
e@linuxfoundation.org" target=3D"_blank">richard.purdie@linuxfoundation.org=
</a>&gt;<br>
&gt; &gt; (From OE-Core rev: a8b2baa6020f96468a98200619ec37c460694c4c)<br>
&gt; &gt; Signed-off-by: Peter Marko &lt;<a href=3D"mailto:peter.marko@siem=
ens.com" target=3D"_blank">peter.marko@siemens.com</a>&gt;<br>
&gt; &gt; ---<br>
&gt; <br>
&gt; Hello Peter,<br>
&gt; <br>
&gt; After discussing with Paul, we decided to not take patches 3, 4 &amp; =
6/6 of<br>
&gt; this series. Those are (as of now) only cleanups and thus not eligible=
<br>
&gt; for stable merge.<br>
&gt; <br>
&gt; This will be most likely be revisited when a fix appear on master in t=
he<br>
&gt; SKIPPED_TESTS list.<br>
&gt; <br>
&gt; Thanks!<br>
<br>
OK, let&#39;s see on next upgrade what is needed for a clean cherry-pick.<b=
r>
v3.14.6 is already out, I will do the upgrade later this week.<br></blockqu=
ote><div><br></div><div>Sounds good.</div><div>Thank you!</div></div><span =
class=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gm=
ail_signature"><div dir=3D"ltr"><font face=3D"Raleway, regular">Yoann Conga=
l</font><div><font face=3D"Raleway, regular">Smile ECS</font></div></div></=
div></div>

--0000000000008d7e5506544b4b56--

