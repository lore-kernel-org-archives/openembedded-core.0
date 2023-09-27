Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A496E80ABD
	for <webhook@archiver.kernel.org>; Wed, 27 Sep 2023 14:41:13 +0000 (UTC)
Received: from mail-io1-f43.google.com (mail-io1-f43.google.com [209.85.166.43])
 by mx.groups.io with SMTP id smtpd.web10.18948.1695825664412056706
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Sep 2023 07:41:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PeoJPfbn;
 spf=pass (domain: gmail.com, ip: 209.85.166.43, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-io1-f43.google.com with SMTP id ca18e2360f4ac-79fca042ec0so219067439f.3
        for <openembedded-core@lists.openembedded.org>; Wed, 27 Sep 2023 07:41:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695825663; x=1696430463; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Ho8IV7Z2qkyH9DywLMdhay2UuYi+04/1ifJ4EH0/fmk=;
        b=PeoJPfbn0PSWN3MT5Tn138xzRx70aAMiLhNNHw5er8H9ZtMuet1LR/PDTcA+REoLVW
         4/ozYmoJd2csxuhOARntdw40UbRa4CVdweIPJTTTZwL5nZB8p1Ms+3yC7bbauVpy11dS
         /8Xuaeyhx+t3J9KCTzTBhfTY6GrS347qDZJw4XBF87tTakqUQ4jzUpNOoLT1b4xMOMOo
         XNfOAHsPwdizuw11XrQL5bh8VOAz5oORSuPxrbyyUFcOGnxVgFCtphZ2TzpHElkf8kBf
         ImnHBoodIVNkVacXSUDAGjaoVTpyMWPtyZpoR3/OQ/7FwWsC6Ycszl4ZnEFyBpHkUEfy
         5JQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695825663; x=1696430463;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ho8IV7Z2qkyH9DywLMdhay2UuYi+04/1ifJ4EH0/fmk=;
        b=Ts2v8K1CU/VBDSJV7Ig0xm15WSLuyCbYc0pMX/9UwFWMUObEcMXYXAM6JafOTCid/f
         zXhisrUpatPshL0SPzC5f+r7qg6HFjgD5xLV5FNHK9TgPQY6RW0igPLxtA0h7mSBWyn0
         4FBGlf+zkQqicVPwKuc90ws3dFZosWgqXpWsehd/7Q1onSilgxFUrOqX0XWwjplDCaU/
         H8F7vWadxyn1mhv2+u+erqoBme+aHzfjGk9d6/maGLSkeceNhx2r+vW3230EMTBbtYlb
         +3fqk6xZkVcJMVStjZVGKWdcgO/H5/+LeZkEG2/dKDneKAyAvHqUk2tYn2/aPPnoT29x
         1iSw==
X-Gm-Message-State: AOJu0YzUF2AWbFH77yXlq5tCRN7D7HQiiJESeGoo02JE9QJ0aZmj/nnz
	3hjxG9k/ntwHx+baD04jkCBCnRR0nMooZm8C6Ak=
X-Google-Smtp-Source: AGHT+IH6VgMeXF61JGhltAPuNgKr2wZy44gCHduUuO1+2FEwomKiEf4JnPlRf2tIkuZXTFoevQRZQwe4MoRYdZEa3UE=
X-Received: by 2002:a5e:a90c:0:b0:794:da97:d194 with SMTP id
 c12-20020a5ea90c000000b00794da97d194mr1883622iod.19.1695825663508; Wed, 27
 Sep 2023 07:41:03 -0700 (PDT)
MIME-Version: 1.0
References: <20221222150246.91423-1-uvv.mail@gmail.com> <0c9483d89d86eae9a84362935108f0e915b31dda.camel@linuxfoundation.org>
 <CADkTA4NnDKC0LybGM5w_otZVpAPy3Gk8+0UR1s1_tn7NVUC0Sg@mail.gmail.com>
 <5910a96e-28a2-4af6-2dc9-bc21e8bee9fb@gmail.com> <CA+chaQebMbjndYC_vqjFohnNBzuov8X0p2F4a0AvMcjEFnqjyA@mail.gmail.com>
 <bce338f8-59bb-8786-87d2-7553f800d176@weidmueller.com> <174BA13431CDE838.27660@lists.openembedded.org>
 <CA+chaQc_dahtBYT+GX7ECsMbX7SN-hN5H5H2dOhvvKRw9+znnw@mail.gmail.com> <bf3ebd99-4427-1fe1-7c3e-743e51667e66@weidmueller.com>
In-Reply-To: <bf3ebd99-4427-1fe1-7c3e-743e51667e66@weidmueller.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 27 Sep 2023 10:40:51 -0400
Message-ID: <CADkTA4NxFsrufgo1LN+ZzxEOca8DZfq+8bAty2GjU_cW0+65TA@mail.gmail.com>
Subject: Re: [OE-core] [langdale][kirkstone][PATCH] go-mod.bbclass: Allow
 network in do_compile
To: Lukas Funke <lukas.funke-oss@weidmueller.com>
Cc: Martin Jansa <martin.jansa@gmail.com>, Vyacheslav Yurkov <uvv.mail@gmail.com>, 
	stefan.herbrechtsmeier@weidmueller.com, =?UTF-8?B?66+86rK97KeB?= <dp.min@lge.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org, wonsang.ryu@lge.com
Content-Type: multipart/alternative; boundary="0000000000004647720606582e65"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Sep 2023 14:41:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188331

--0000000000004647720606582e65
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 27, 2023 at 9:34=E2=80=AFAM Lukas Funke <lukas.funke-oss@weidmu=
eller.com>
wrote:

> On 10.09.2023 23:26, Martin Jansa wrote:
> > On Sun, Mar 12, 2023 at 10:15=E2=80=AFAM Martin Jansa via lists.openemb=
edded.org
> > <Martin.Jansa=3Dgmail.com@lists.openembedded.org> wrote:
> >
> >> On Tue, Jan 3, 2023 at 5:03=E2=80=AFPM Lukas Funke <
> >> lukas.funke-oss@weidmueller.com> wrote:
> >>
> >>> Martin,
> >>>
> >>> first of all: thank you for testing the patches. As usual the corner
> >>> cases are the most tricky ones.
> >>>
> >>> tl;dr: I'm working on an updated patch series to address the reported
> >>> issues.
> >>>
> >>
> >> Hi Lukas, Stefan,
> >>
> >> and update on this series?
> >>
> >> It doesn't have to be perfect, other people can help with remaining
> corner
> >> cases and right now there is nothing for this in oe-core, so any versi=
on
> >> will be big improvement :) and it will make it easier for others to
> submit
> >> incremental improvements - I have some as well, but haven't sent them
> as I
> >> don't know what you've already updated locally, so I'm waiting for v2.
> >>
> >> Mickledore is already in feature freeze, but maybe RP will make an
> >> exception as this is new important functionality which isn't likely to
> >> break other existing code.
> >>
> >
> > Hello Lukas,
> >
> > any progress on updated patch series? Nanbield release is near and I
> don't
> > remember seeing the updated patch series in last couple months.
> >
> > Is there anything I can do to help? The last version looked reasonably
> well
> > and IMHO could be used as starting point for everybody to help fixing
> those
> > corner cases where it didn't work well.
> >
> > Regards,
>
> Hello Martin,
>
> I'm currently working on an update, but can't make any promises
> regarding the timeline.
>

Just FYI: on meta-virt master there is a reworked script that is used to
update the .inc files for go projects in the layer.

It might be helpful, it might not be!

Bruce




>
> Thanks for offering help! Reviewing and testing is always helpful when
> the updated series is on it's way.
>
> Regards
> Lukas
>
>
> >
> >
> >> Kind Regards,
> >>
> >>
> >> I've looked into the issues and would like to give some explanation.
> >>>
> >>> 1) the first module you mention ('gonum.org/v1/gonum
> >>> <http://gonum.org/v1/gonum>') does not obey the go documentation for
> >>> resolving the modules source-code repository (see
> >>> https://go.dev/ref/mod#go-mod-download , Section 'Version control
> >>> systems'). The documentation states that there should be a html page,
> >>> queried by "?go-get=3D1", with a <meta>-tag which contains the origin=
al
> >>> URL to the source-code repository. For 'gonum' there is only a
> 404-page.
> >>> This page contains javascript-code that redirects to the actual gonum
> >>> package page. Unnecessary hard to process. I'll open an issue for tha=
t.
> >>> The second module 'code.cloudfoundry.org/clock
> >>> <http://code.cloudfoundry.org/clock>' has a broken certificate. I
> >>> already opend an issue on github for this.
> >>>
> >>> I addressed this issue above by maintaining a list of modules and the=
ir
> >>> actual repo URLs inside the go-recipetool as an absolute fallback.
> Would
> >>> do you think about this solution?
> >>>
> >>
> >> Yes, that's what I was starting to do in:
> >>
> >>
> https://git.openembedded.org/openembedded-core-contrib/commit/?h=3Djansa/=
go&id=3Db973c7f17c8a613233a1a18de0bf6daa352c47d8
> >>
> >>
> https://git.openembedded.org/openembedded-core-contrib/commit/?h=3Djansa/=
go&id=3D61c6c9962b3b7d4c1cf6e6823de6c32b09998b00
> >>
> >>
> >>> 2) yes, my bad :)
> >>>
> >>
> >> as work around I was using
> >>
> >>
> https://git.openembedded.org/openembedded-core-contrib/commit/?h=3Djansa/=
go&id=3D5767819bfe96de29ab751d4a37a431a324f7e547
> >>
> >>
> >> 3) The problem is that some repositories have a prefix in their tags.
> >>> The tags usually only contain the semantic version string. I'm curret=
ly
> >>> working on this issue.
> >>>
> >>> Best regards
> >>>
> >>> Lukas
> >>>
> >>> Am 22.12.2022 um 20:08 schrieb Martin Jansa via lists.openembedded.or=
g
> :
> >>>> On Thu, Dec 22, 2022 at 7:39 PM Vyacheslav Yurkov <uvv.mail@gmail.co=
m
> >
> >>>> wrote:
> >>>>
> >>>>      On 22.12.2022 17:48, Bruce Ashfield wrote:
> >>>>      > On Thu, Dec 22, 2022 at 11:20 AM Richard Purdie
> >>>>      > <richard.purdie@linuxfoundation.org> wrote:
> >>>>      >> This patch is not in master and is not a backport therefore
> not
> >>>>      >> eligible for kirkstone/langdale.
> >>>>
> >>>>      My bad, the intention was to have it in all three branches:
> master,
> >>>>      kirkstone, and langdale.
> >>>>
> >>>>      > 'nor should it go to master.
> >>>>      >
> >>>>      > If someone wants to allow go to fetch sources during builds, =
it
> >>>>      needs
> >>>>      > to be done in their own layers.
> >>>>      >
> >>>>      > Bruce
> >>>>
> >>>>      Probably I misunderstood the outcome of the discussion in my
> first
> >>>>      link.
> >>>>      Bruce and Richard, you both suggested to have it in go-mod with
> the
> >>>>      warning. I agree that it breaks reproducibility, and is
> considered
> >>>>      a bad
> >>>>      practice in general (I'm aware of a few more build systems with
> >>>>      the same
> >>>>      shortcoming).
> >>>>
> >>>>      My point is, until a proper solution is in place, it should be =
at
> >>>>      least
> >>>>      documented somewhere that this should be done in own
> layer/recipe.
> >>>>      Any
> >>>>      suggestions where this can be documented if not in OE-Core?
> >>>>
> >>>>
> >>>> Have you tried the changes submitted by Lukas/Stefan in:
> >>>>
> https://lists.openembedded.org/g/openembedded-architecture/message/1539
> >>>> ?
> >>>>
> >>>> It's not perfect, I was testing it on
> >>>> https://github.com/influxdata/telegraf/blob/master/go.mod and I've
> >>>> found some corner cases where it failed.
> >>>>
> >>>> But it seems like very good start and we should work with Lukas/Stef=
an
> >>>> to get it merged in master. Then all branches could consume recipes
> >>>> created in master and only the exceptions would need to have network
> >>>> access (instead of the bbclass enabling it for every go-mod user -
> >>>> go-vendor inherits go-mod as well).
> >>>>
> >>>> Lukas/Stefan: is there something we can do to help with v2 of your
> >>>> patches?
> >>>>
> >>>> I wanted to submit better review on submitted patches after more
> >>>> debugging, but here it is:
> >>>>
> >>>> 1) to resolve 2 deps:
> >>>> {'Path': 'gonum.org/v1/gonum <http://gonum.org/v1/gonum>', 'Version'=
:
> >>>> 'v0.12.0'} due to 404 "ERROR: Error while fetching redirect page: HT=
TP
> >>>> Error 404: Not Found"
> >>>>
> >>>> {'Path': 'code.cloudfoundry.org/clock
> >>>> <http://code.cloudfoundry.org/clock>', 'Version': 'v1.0.0',
> >>>> 'Indirect': True} due to this being redirect to github.com
> >>>> <http://github.com> and failing with "ERROR: Error while fetching
> >>>> redirect page: <urlopen error [SSL: CERTIFICATE_VERIFY_FAILED]
> >>>> certificate verify failed: Hostname mismatch, certificate is not val=
id
> >>>> for 'code.cloudfoundry.org <http://code.cloudfoundry.org>'.
> >>> (_ssl.c:996)>"
> >>>> parse
> >>>>
> >>>> 2) some issues with LICENSEs:
> >>>> INFO: Please add the following line for
> >>>> 'docs/LICENSE_OF_DEPENDENCIES.md' to a 'lib/recipetool/licenses.csv'
> >>>> and replace `Unknown` with the license:
> >>>> c4807c5b058a56c02f592207b4e056b1,Unknown
> >>>> Traceback (most recent call last):
> >>>>    File "/OE/build/oe-core/openembedded-core/scripts/recipetool", li=
ne
> >>>> 111, in <module>
> >>>>      ret =3D main()
> >>>>            ^^^^^^
> >>>>    File "/OE/build/oe-core/openembedded-core/scripts/recipetool", li=
ne
> >>>> 100, in main
> >>>>      ret =3D args.func(args)
> >>>>            ^^^^^^^^^^^^^^^
> >>>>    File
> >>>> "/OE/layers/openembedded-core/scripts/lib/recipetool/create.py", lin=
e
> >>>> 746, in create_recipe
> >>>>      handler.process(srctree_use, classes, lines_before, lines_after=
,
> >>>> handled, extravalues)
> >>>>    File
> >>>> "/OE/layers/openembedded-core/scripts/lib/recipetool/create_go.py",
> >>>> line 349, in process
> >>>>      self._rewrite_lic_uri(lines_before)
> >>>>    File
> >>>> "/OE/layers/openembedded-core/scripts/lib/recipetool/create_go.py",
> >>>> line 380, in _rewrite_lic_uri
> >>>>      updated, newlines =3D bb.utils.edit_metadata(lines_before,
> >>>> ['LIC_FILES_CHKSUM'], varfunc)
> >>>> ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> >>>>    File "/OE/build/oe-core/bitbake/lib/bb/utils.py", line 1382, in
> >>>> edit_metadata
> >>>>      if handle_var_end():
> >>>>         ^^^^^^^^^^^^^^^^
> >>>>    File "/OE/build/oe-core/bitbake/lib/bb/utils.py", line 1280, in
> >>>> handle_var_end
> >>>>      (newvalue, newop, indent, minbreak) =3D varfunc(in_var, full_va=
lue,
> >>>> op, newlines)
> >>>> ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> >>>>    File
> >>>> "/OE/layers/openembedded-core/scripts/lib/recipetool/create_go.py",
> >>>> line 372, in varfunc
> >>>>      uri, chksum =3D license.split(';', 1)
> >>>>      ^^^^^^^^^^^
> >>>> ValueError: not enough values to unpack (expected 2, got 1)
> >>>>
> >>>> (the license was just '/')
> >>>>
> >>>> 3) some SRCREVs set to None leading to parsing failure:
> >>>>
> >>>>    File "/OE/layers/bitbake/lib/bb/fetch2/git.py", line 762, in
> >>>> _latest_revision
> >>>>      raise bb.fetch2.FetchError("Unable to resolve '%s' in upstream
> git
> >>>> repository in git ls-remote output for %s" % \
> >>>> bb.data_smart.ExpansionError: Failure expanding variable SRCPV,
> >>>> expression was ${@bb.fetch2.get_srcrev(d)} which triggered exception
> >>>> FetchError: Fetcher failure: Unable to resolve 'None' in upstream gi=
t
> >>>> repository in git ls-remote output for
> >>>> github.com/googleapis/google-cloud-go
> >>>> <http://github.com/googleapis/google-cloud-go>
> >>>> The variable dependency chain for the failure is: SRCPV -> PV -> BP =
->
> >>>> FILESPATH
> >>>>
> >>>> ERROR: Parsing newly created recipe failed, moving recipe to
> >>>>
> >>>
> /OE/build/oe-core/workspace/recipes/telegraf/telegraf_git.bb.parsefailed
> >>>> for reference. If this looks to be caused by the recipe itself, plea=
se
> >>>> report this error.
> >>>>
> >>>> It takes long time to fetch all telegraf dependencies, so I'll creat=
e
> >>>> some test recipe to more easily debug these 3 issues in isolation.
> >>>>
> >>>>
> >>>>
> >>>>
> >>>
> >>
> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >> Links: You receive all messages sent to this group.
> >> View/Reply Online (#178380):
> >> https://lists.openembedded.org/g/openembedded-core/message/178380
> >> Mute This Topic: https://lists.openembedded.org/mt/95827446/3617156
> >> Group Owner: openembedded-core+owner@lists.openembedded.org
> >> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub =
[
> >> Martin.Jansa@gmail.com]
> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >>
> >>
> >
>
>

--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--0000000000004647720606582e65
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Wed, Sep 27, 2023 at 9:34=E2=80=AFAM Lukas Funke=
 &lt;<a href=3D"mailto:lukas.funke-oss@weidmueller.com">lukas.funke-oss@wei=
dmueller.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">On 10.09.2023 23:26, Martin Jansa wrote:<br>
&gt; On Sun, Mar 12, 2023 at 10:15=E2=80=AFAM Martin Jansa via <a href=3D"h=
ttp://lists.openembedded.org" rel=3D"noreferrer" target=3D"_blank">lists.op=
enembedded.org</a><br>
&gt; &lt;Martin.Jansa=3D<a href=3D"mailto:gmail.com@lists.openembedded.org"=
 target=3D"_blank">gmail.com@lists.openembedded.org</a>&gt; wrote:<br>
&gt; <br>
&gt;&gt; On Tue, Jan 3, 2023 at 5:03=E2=80=AFPM Lukas Funke &lt;<br>
&gt;&gt; <a href=3D"mailto:lukas.funke-oss@weidmueller.com" target=3D"_blan=
k">lukas.funke-oss@weidmueller.com</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt;&gt; Martin,<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; first of all: thank you for testing the patches. As usual the =
corner<br>
&gt;&gt;&gt; cases are the most tricky ones.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; tl;dr: I&#39;m working on an updated patch series to address t=
he reported<br>
&gt;&gt;&gt; issues.<br>
&gt;&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; Hi Lukas, Stefan,<br>
&gt;&gt;<br>
&gt;&gt; and update on this series?<br>
&gt;&gt;<br>
&gt;&gt; It doesn&#39;t have to be perfect, other people can help with rema=
ining corner<br>
&gt;&gt; cases and right now there is nothing for this in oe-core, so any v=
ersion<br>
&gt;&gt; will be big improvement :) and it will make it easier for others t=
o submit<br>
&gt;&gt; incremental improvements - I have some as well, but haven&#39;t se=
nt them as I<br>
&gt;&gt; don&#39;t know what you&#39;ve already updated locally, so I&#39;m=
 waiting for v2.<br>
&gt;&gt;<br>
&gt;&gt; Mickledore is already in feature freeze, but maybe RP will make an=
<br>
&gt;&gt; exception as this is new important functionality which isn&#39;t l=
ikely to<br>
&gt;&gt; break other existing code.<br>
&gt;&gt;<br>
&gt; <br>
&gt; Hello Lukas,<br>
&gt; <br>
&gt; any progress on updated patch series? Nanbield release is near and I d=
on&#39;t<br>
&gt; remember seeing the updated patch series in last couple months.<br>
&gt; <br>
&gt; Is there anything I can do to help? The last version looked reasonably=
 well<br>
&gt; and IMHO could be used as starting point for everybody to help fixing =
those<br>
&gt; corner cases where it didn&#39;t work well.<br>
&gt; <br>
&gt; Regards,<br>
<br>
Hello Martin,<br>
<br>
I&#39;m currently working on an update, but can&#39;t make any promises <br=
>
regarding the timeline.<br></blockquote><div><br></div><div><div class=3D"g=
mail_default" style=3D"font-size:small">Just FYI: on meta-virt master there=
 is a reworked script that is used to update the .inc files for go projects=
 in the layer.</div><div class=3D"gmail_default" style=3D"font-size:small">=
<br></div><div class=3D"gmail_default" style=3D"font-size:small">It might b=
e helpful, it might not be!</div><div class=3D"gmail_default" style=3D"font=
-size:small"><br></div><div class=3D"gmail_default" style=3D"font-size:smal=
l">Bruce</div><br></div><div><br></div><div>=C2=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
<br>
Thanks for offering help! Reviewing and testing is always helpful when <br>
the updated series is on it&#39;s way.<br>
<br>
Regards<br>
Lukas<br>
<br>
<br>
&gt; <br>
&gt; <br>
&gt;&gt; Kind Regards,<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; I&#39;ve looked into the issues and would like to give some explan=
ation.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; 1) the first module you mention (&#39;<a href=3D"http://gonum.=
org/v1/gonum" rel=3D"noreferrer" target=3D"_blank">gonum.org/v1/gonum</a><b=
r>
&gt;&gt;&gt; &lt;<a href=3D"http://gonum.org/v1/gonum" rel=3D"noreferrer" t=
arget=3D"_blank">http://gonum.org/v1/gonum</a>&gt;&#39;) does not obey the =
go documentation for<br>
&gt;&gt;&gt; resolving the modules source-code repository (see<br>
&gt;&gt;&gt; <a href=3D"https://go.dev/ref/mod#go-mod-download" rel=3D"nore=
ferrer" target=3D"_blank">https://go.dev/ref/mod#go-mod-download</a> , Sect=
ion &#39;Version control<br>
&gt;&gt;&gt; systems&#39;). The documentation states that there should be a=
 html page,<br>
&gt;&gt;&gt; queried by &quot;?go-get=3D1&quot;, with a &lt;meta&gt;-tag wh=
ich contains the original<br>
&gt;&gt;&gt; URL to the source-code repository. For &#39;gonum&#39; there i=
s only a 404-page.<br>
&gt;&gt;&gt; This page contains javascript-code that redirects to the actua=
l gonum<br>
&gt;&gt;&gt; package page. Unnecessary hard to process. I&#39;ll open an is=
sue for that.<br>
&gt;&gt;&gt; The second module &#39;<a href=3D"http://code.cloudfoundry.org=
/clock" rel=3D"noreferrer" target=3D"_blank">code.cloudfoundry.org/clock</a=
><br>
&gt;&gt;&gt; &lt;<a href=3D"http://code.cloudfoundry.org/clock" rel=3D"nore=
ferrer" target=3D"_blank">http://code.cloudfoundry.org/clock</a>&gt;&#39; h=
as a broken certificate. I<br>
&gt;&gt;&gt; already opend an issue on github for this.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; I addressed this issue above by maintaining a list of modules =
and their<br>
&gt;&gt;&gt; actual repo URLs inside the go-recipetool as an absolute fallb=
ack. Would<br>
&gt;&gt;&gt; do you think about this solution?<br>
&gt;&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; Yes, that&#39;s what I was starting to do in:<br>
&gt;&gt;<br>
&gt;&gt; <a href=3D"https://git.openembedded.org/openembedded-core-contrib/=
commit/?h=3Djansa/go&amp;id=3Db973c7f17c8a613233a1a18de0bf6daa352c47d8" rel=
=3D"noreferrer" target=3D"_blank">https://git.openembedded.org/openembedded=
-core-contrib/commit/?h=3Djansa/go&amp;id=3Db973c7f17c8a613233a1a18de0bf6da=
a352c47d8</a><br>
&gt;&gt;<br>
&gt;&gt; <a href=3D"https://git.openembedded.org/openembedded-core-contrib/=
commit/?h=3Djansa/go&amp;id=3D61c6c9962b3b7d4c1cf6e6823de6c32b09998b00" rel=
=3D"noreferrer" target=3D"_blank">https://git.openembedded.org/openembedded=
-core-contrib/commit/?h=3Djansa/go&amp;id=3D61c6c9962b3b7d4c1cf6e6823de6c32=
b09998b00</a><br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;&gt; 2) yes, my bad :)<br>
&gt;&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; as work around I was using<br>
&gt;&gt;<br>
&gt;&gt; <a href=3D"https://git.openembedded.org/openembedded-core-contrib/=
commit/?h=3Djansa/go&amp;id=3D5767819bfe96de29ab751d4a37a431a324f7e547" rel=
=3D"noreferrer" target=3D"_blank">https://git.openembedded.org/openembedded=
-core-contrib/commit/?h=3Djansa/go&amp;id=3D5767819bfe96de29ab751d4a37a431a=
324f7e547</a><br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; 3) The problem is that some repositories have a prefix in their ta=
gs.<br>
&gt;&gt;&gt; The tags usually only contain the semantic version string. I&#=
39;m curretly<br>
&gt;&gt;&gt; working on this issue.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Best regards<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Lukas<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Am 22.12.2022 um 20:08 schrieb Martin Jansa via <a href=3D"htt=
p://lists.openembedded.org" rel=3D"noreferrer" target=3D"_blank">lists.open=
embedded.org</a>:<br>
&gt;&gt;&gt;&gt; On Thu, Dec 22, 2022 at 7:39 PM Vyacheslav Yurkov &lt;<a h=
ref=3D"mailto:uvv.mail@gmail.com" target=3D"_blank">uvv.mail@gmail.com</a>&=
gt;<br>
&gt;&gt;&gt;&gt; wrote:<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 On 22.12.2022 17:48, Bruce Ashfield wr=
ote:<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 &gt; On Thu, Dec 22, 2022 at 11:20 AM =
Richard Purdie<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 &gt; &lt;<a href=3D"mailto:richard.pur=
die@linuxfoundation.org" target=3D"_blank">richard.purdie@linuxfoundation.o=
rg</a>&gt; wrote:<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; This patch is not in master a=
nd is not a backport therefore not<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; eligible for kirkstone/langda=
le.<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 My bad, the intention was to have it i=
n all three branches: master,<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 kirkstone, and langdale.<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 &gt; &#39;nor should it go to master.<=
br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 &gt; If someone wants to allow go to f=
etch sources during builds, it<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 needs<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 &gt; to be done in their own layers.<b=
r>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 &gt; Bruce<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 Probably I misunderstood the outcome o=
f the discussion in my first<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 link.<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 Bruce and Richard, you both suggested =
to have it in go-mod with the<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 warning. I agree that it breaks reprod=
ucibility, and is considered<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 a bad<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 practice in general (I&#39;m aware of =
a few more build systems with<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 the same<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 shortcoming).<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 My point is, until a proper solution i=
s in place, it should be at<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 least<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 documented somewhere that this should =
be done in own layer/recipe.<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 Any<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 suggestions where this can be document=
ed if not in OE-Core?<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; Have you tried the changes submitted by Lukas/Stefan in:<b=
r>
&gt;&gt;&gt;&gt; <a href=3D"https://lists.openembedded.org/g/openembedded-a=
rchitecture/message/1539" rel=3D"noreferrer" target=3D"_blank">https://list=
s.openembedded.org/g/openembedded-architecture/message/1539</a><br>
&gt;&gt;&gt;&gt; ?<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; It&#39;s not perfect, I was testing it on<br>
&gt;&gt;&gt;&gt; <a href=3D"https://github.com/influxdata/telegraf/blob/mas=
ter/go.mod" rel=3D"noreferrer" target=3D"_blank">https://github.com/influxd=
ata/telegraf/blob/master/go.mod</a> and I&#39;ve<br>
&gt;&gt;&gt;&gt; found some corner cases where it failed.<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; But it seems like very good start and we should work with =
Lukas/Stefan<br>
&gt;&gt;&gt;&gt; to get it merged in master. Then all branches could consum=
e recipes<br>
&gt;&gt;&gt;&gt; created in master and only the exceptions would need to ha=
ve network<br>
&gt;&gt;&gt;&gt; access (instead of the bbclass enabling it for every go-mo=
d user -<br>
&gt;&gt;&gt;&gt; go-vendor inherits go-mod as well).<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; Lukas/Stefan: is there something we can do to help with v2=
 of your<br>
&gt;&gt;&gt;&gt; patches?<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; I wanted to submit better review on submitted patches afte=
r more<br>
&gt;&gt;&gt;&gt; debugging, but here it is:<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; 1) to resolve 2 deps:<br>
&gt;&gt;&gt;&gt; {&#39;Path&#39;: &#39;<a href=3D"http://gonum.org/v1/gonum=
" rel=3D"noreferrer" target=3D"_blank">gonum.org/v1/gonum</a> &lt;<a href=
=3D"http://gonum.org/v1/gonum" rel=3D"noreferrer" target=3D"_blank">http://=
gonum.org/v1/gonum</a>&gt;&#39;, &#39;Version&#39;:<br>
&gt;&gt;&gt;&gt; &#39;v0.12.0&#39;} due to 404 &quot;ERROR: Error while fet=
ching redirect page: HTTP<br>
&gt;&gt;&gt;&gt; Error 404: Not Found&quot;<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; {&#39;Path&#39;: &#39;<a href=3D"http://code.cloudfoundry.=
org/clock" rel=3D"noreferrer" target=3D"_blank">code.cloudfoundry.org/clock=
</a><br>
&gt;&gt;&gt;&gt; &lt;<a href=3D"http://code.cloudfoundry.org/clock" rel=3D"=
noreferrer" target=3D"_blank">http://code.cloudfoundry.org/clock</a>&gt;&#3=
9;, &#39;Version&#39;: &#39;v1.0.0&#39;,<br>
&gt;&gt;&gt;&gt; &#39;Indirect&#39;: True} due to this being redirect to <a=
 href=3D"http://github.com" rel=3D"noreferrer" target=3D"_blank">github.com=
</a><br>
&gt;&gt;&gt;&gt; &lt;<a href=3D"http://github.com" rel=3D"noreferrer" targe=
t=3D"_blank">http://github.com</a>&gt; and failing with &quot;ERROR: Error =
while fetching<br>
&gt;&gt;&gt;&gt; redirect page: &lt;urlopen error [SSL: CERTIFICATE_VERIFY_=
FAILED]<br>
&gt;&gt;&gt;&gt; certificate verify failed: Hostname mismatch, certificate =
is not valid<br>
&gt;&gt;&gt;&gt; for &#39;<a href=3D"http://code.cloudfoundry.org" rel=3D"n=
oreferrer" target=3D"_blank">code.cloudfoundry.org</a> &lt;<a href=3D"http:=
//code.cloudfoundry.org" rel=3D"noreferrer" target=3D"_blank">http://code.c=
loudfoundry.org</a>&gt;&#39;.<br>
&gt;&gt;&gt; (_ssl.c:996)&gt;&quot;<br>
&gt;&gt;&gt;&gt; parse<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; 2) some issues with LICENSEs:<br>
&gt;&gt;&gt;&gt; INFO: Please add the following line for<br>
&gt;&gt;&gt;&gt; &#39;docs/LICENSE_OF_DEPENDENCIES.md&#39; to a &#39;lib/re=
cipetool/licenses.csv&#39;<br>
&gt;&gt;&gt;&gt; and replace `Unknown` with the license:<br>
&gt;&gt;&gt;&gt; c4807c5b058a56c02f592207b4e056b1,Unknown<br>
&gt;&gt;&gt;&gt; Traceback (most recent call last):<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 File &quot;/OE/build/oe-core/openembedded-cor=
e/scripts/recipetool&quot;, line<br>
&gt;&gt;&gt;&gt; 111, in &lt;module&gt;<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 ret =3D main()<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^^^^^^<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 File &quot;/OE/build/oe-core/openembedded-cor=
e/scripts/recipetool&quot;, line<br>
&gt;&gt;&gt;&gt; 100, in main<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 ret =3D args.func(args)<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^^^^^^^^^^^^^^^<b=
r>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 File<br>
&gt;&gt;&gt;&gt; &quot;/OE/layers/openembedded-core/scripts/lib/recipetool/=
create.py&quot;, line<br>
&gt;&gt;&gt;&gt; 746, in create_recipe<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 handler.process(srctree_use, classes, =
lines_before, lines_after,<br>
&gt;&gt;&gt;&gt; handled, extravalues)<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 File<br>
&gt;&gt;&gt;&gt; &quot;/OE/layers/openembedded-core/scripts/lib/recipetool/=
create_go.py&quot;,<br>
&gt;&gt;&gt;&gt; line 349, in process<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 self._rewrite_lic_uri(lines_before)<br=
>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 File<br>
&gt;&gt;&gt;&gt; &quot;/OE/layers/openembedded-core/scripts/lib/recipetool/=
create_go.py&quot;,<br>
&gt;&gt;&gt;&gt; line 380, in _rewrite_lic_uri<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 updated, newlines =3D bb.utils.edit_me=
tadata(lines_before,<br>
&gt;&gt;&gt;&gt; [&#39;LIC_FILES_CHKSUM&#39;], varfunc)<br>
&gt;&gt;&gt;&gt; ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^=
^^^^^^^^^<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 File &quot;/OE/build/oe-core/bitbake/lib/bb/u=
tils.py&quot;, line 1382, in<br>
&gt;&gt;&gt;&gt; edit_metadata<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 if handle_var_end():<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^^^^^^^^^^^^^^^^<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 File &quot;/OE/build/oe-core/bitbake/lib/bb/u=
tils.py&quot;, line 1280, in<br>
&gt;&gt;&gt;&gt; handle_var_end<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 (newvalue, newop, indent, minbreak) =
=3D varfunc(in_var, full_value,<br>
&gt;&gt;&gt;&gt; op, newlines)<br>
&gt;&gt;&gt;&gt; ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 File<br>
&gt;&gt;&gt;&gt; &quot;/OE/layers/openembedded-core/scripts/lib/recipetool/=
create_go.py&quot;,<br>
&gt;&gt;&gt;&gt; line 372, in varfunc<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 uri, chksum =3D license.split(&#39;;&#=
39;, 1)<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 ^^^^^^^^^^^<br>
&gt;&gt;&gt;&gt; ValueError: not enough values to unpack (expected 2, got 1=
)<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; (the license was just &#39;/&#39;)<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; 3) some SRCREVs set to None leading to parsing failure:<br=
>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 File &quot;/OE/layers/bitbake/lib/bb/fetch2/g=
it.py&quot;, line 762, in<br>
&gt;&gt;&gt;&gt; _latest_revision<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 raise bb.fetch2.FetchError(&quot;Unabl=
e to resolve &#39;%s&#39; in upstream git<br>
&gt;&gt;&gt;&gt; repository in git ls-remote output for %s&quot; % \<br>
&gt;&gt;&gt;&gt; bb.data_smart.ExpansionError: Failure expanding variable S=
RCPV,<br>
&gt;&gt;&gt;&gt; expression was ${@bb.fetch2.get_srcrev(d)} which triggered=
 exception<br>
&gt;&gt;&gt;&gt; FetchError: Fetcher failure: Unable to resolve &#39;None&#=
39; in upstream git<br>
&gt;&gt;&gt;&gt; repository in git ls-remote output for<br>
&gt;&gt;&gt;&gt; <a href=3D"http://github.com/googleapis/google-cloud-go" r=
el=3D"noreferrer" target=3D"_blank">github.com/googleapis/google-cloud-go</=
a><br>
&gt;&gt;&gt;&gt; &lt;<a href=3D"http://github.com/googleapis/google-cloud-g=
o" rel=3D"noreferrer" target=3D"_blank">http://github.com/googleapis/google=
-cloud-go</a>&gt;<br>
&gt;&gt;&gt;&gt; The variable dependency chain for the failure is: SRCPV -&=
gt; PV -&gt; BP -&gt;<br>
&gt;&gt;&gt;&gt; FILESPATH<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; ERROR: Parsing newly created recipe failed, moving recipe =
to<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt; /OE/build/oe-core/workspace/recipes/telegraf/telegraf_git.bb.p=
arsefailed<br>
&gt;&gt;&gt;&gt; for reference. If this looks to be caused by the recipe it=
self, please<br>
&gt;&gt;&gt;&gt; report this error.<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; It takes long time to fetch all telegraf dependencies, so =
I&#39;ll create<br>
&gt;&gt;&gt;&gt; some test recipe to more easily debug these 3 issues in is=
olation.<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;&gt; Links: You receive all messages sent to this group.<br>
&gt;&gt; View/Reply Online (#178380):<br>
&gt;&gt; <a href=3D"https://lists.openembedded.org/g/openembedded-core/mess=
age/178380" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded=
.org/g/openembedded-core/message/178380</a><br>
&gt;&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/9582=
7446/3617156" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedd=
ed.org/mt/95827446/3617156</a><br>
&gt;&gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.ope=
nembedded.org" target=3D"_blank">openembedded-core+owner@lists.openembedded=
.org</a><br>
&gt;&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembed=
ded-core/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembe=
dded.org/g/openembedded-core/unsub</a> [<br>
&gt;&gt; <a href=3D"mailto:Martin.Jansa@gmail.com" target=3D"_blank">Martin=
.Jansa@gmail.com</a>]<br>
&gt;&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt; <br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature">- =
Thou shalt not follow the NULL pointer, for chaos and madness await thee at=
 its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star Trek II<br><b=
r></div></div>

--0000000000004647720606582e65--

