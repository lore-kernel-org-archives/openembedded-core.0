Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4E50EE49A4
	for <webhook@archiver.kernel.org>; Sun, 10 Sep 2023 21:26:32 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web10.45278.1694381184974581314
 for <openembedded-core@lists.openembedded.org>;
 Sun, 10 Sep 2023 14:26:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=ru11cwLi;
 spf=pass (domain: gmail.com, ip: 209.85.221.41, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-307d58b3efbso3473537f8f.0
        for <openembedded-core@lists.openembedded.org>; Sun, 10 Sep 2023 14:26:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694381183; x=1694985983; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=M0yTEffdW+v8C4VA1U72Zi/utfZTXq5GPG79svrLx9M=;
        b=ru11cwLiomqwSqigQqaY5bF8Iaim7BryB6n9MNHYA2bLxwUjVO4l4gmjrEh0btswHk
         7zG9FTvK9S4RIP6AsyDdg35Fch2jSACcL/63HXw/aYyVi5Mzx1IEjJTk7q+9L82G6yDp
         5t3ovkukPzIvqSonzSDDUwiWzdibx3GaogMRfJJYBLiB2umCDBsqcDGkW2l+dwyid/0V
         A0NwTX/RMY/SDIALxFyGDsGfT+Vt/0gjTffcsGjK0DdfVLZgDK1GKH56HlASsBRnAhxp
         2EF8AzaQQ0gAzPtjv3yyLbF/JocOmEjqjnXJQdp7gjrBwvEnbyN5wTwE26df3lXLysW6
         gbRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694381183; x=1694985983;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M0yTEffdW+v8C4VA1U72Zi/utfZTXq5GPG79svrLx9M=;
        b=EBinh7DnrkGI7qeWVAy6K6thGe1qHH+mOa23OgRq1SEVcNNkO9nFeJHqDB/cxvTOMk
         SDJWwZH3HzeU+QF4+c+tZMUMYA8aqBEwNqZCPq7S5gMaRjl69CSzkH5FcaJCUyV5E6Z4
         nG7owR8dSotzY68ctEPHcTJ9wC/swULQhFW8giS+Dh1RJRrb4qtcoG8JKD6lOjiRef9H
         7wbOtIyvrBSvWkfAoOmh2Hh0RfDjKyyfIxjPqaspMKrxvmLA4aNLv6VLkW/WZu8zaP3P
         T9HZD9Lz3E/EyikLyR/vtTNpT/MdjOCohGjQ9TULWmsoUZU1YZKsC4RYwTc5OEPjdeSV
         QEfA==
X-Gm-Message-State: AOJu0Yy4bgIpmQNEJT+IX7GwxJgU/jTclHwvWRbu/1kw2NPTaL+8Uesa
	s/1XCne/Ijq5AZZcq8/k4YEIFIZs2hWcQ7Aok3I=
X-Google-Smtp-Source: AGHT+IHsPjW7XKSnr95K5ekwjDFON7oayKX/ONl2qEDBD9eSO1YsT+93CA/m5hvKsw8v29yHq29uCZf/Hjqng+l18LI=
X-Received: by 2002:a5d:4ac3:0:b0:31a:e6c2:7705 with SMTP id
 y3-20020a5d4ac3000000b0031ae6c27705mr6900910wrs.50.1694381182967; Sun, 10 Sep
 2023 14:26:22 -0700 (PDT)
MIME-Version: 1.0
References: <20221222150246.91423-1-uvv.mail@gmail.com> <0c9483d89d86eae9a84362935108f0e915b31dda.camel@linuxfoundation.org>
 <CADkTA4NnDKC0LybGM5w_otZVpAPy3Gk8+0UR1s1_tn7NVUC0Sg@mail.gmail.com>
 <5910a96e-28a2-4af6-2dc9-bc21e8bee9fb@gmail.com> <CA+chaQebMbjndYC_vqjFohnNBzuov8X0p2F4a0AvMcjEFnqjyA@mail.gmail.com>
 <bce338f8-59bb-8786-87d2-7553f800d176@weidmueller.com> <174BA13431CDE838.27660@lists.openembedded.org>
In-Reply-To: <174BA13431CDE838.27660@lists.openembedded.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Sun, 10 Sep 2023 23:26:11 +0200
Message-ID: <CA+chaQc_dahtBYT+GX7ECsMbX7SN-hN5H5H2dOhvvKRw9+znnw@mail.gmail.com>
Subject: Re: [OE-core] [langdale][kirkstone][PATCH] go-mod.bbclass: Allow
 network in do_compile
To: Martin.Jansa@gmail.com
Cc: Lukas Funke <lukas.funke-oss@weidmueller.com>, Vyacheslav Yurkov <uvv.mail@gmail.com>, 
	stefan.herbrechtsmeier@weidmueller.com, =?UTF-8?B?66+86rK97KeB?= <dp.min@lge.com>, 
	Bruce Ashfield <bruce.ashfield@gmail.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org, wonsang.ryu@lge.com
Content-Type: multipart/alternative; boundary="00000000000086654c060507dc7a"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 10 Sep 2023 21:26:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187473

--00000000000086654c060507dc7a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 12, 2023 at 10:15=E2=80=AFAM Martin Jansa via lists.openembedde=
d.org
<Martin.Jansa=3Dgmail.com@lists.openembedded.org> wrote:

> On Tue, Jan 3, 2023 at 5:03=E2=80=AFPM Lukas Funke <
> lukas.funke-oss@weidmueller.com> wrote:
>
>> Martin,
>>
>> first of all: thank you for testing the patches. As usual the corner
>> cases are the most tricky ones.
>>
>> tl;dr: I'm working on an updated patch series to address the reported
>> issues.
>>
>
> Hi Lukas, Stefan,
>
> and update on this series?
>
> It doesn't have to be perfect, other people can help with remaining corne=
r
> cases and right now there is nothing for this in oe-core, so any version
> will be big improvement :) and it will make it easier for others to submi=
t
> incremental improvements - I have some as well, but haven't sent them as =
I
> don't know what you've already updated locally, so I'm waiting for v2.
>
> Mickledore is already in feature freeze, but maybe RP will make an
> exception as this is new important functionality which isn't likely to
> break other existing code.
>

Hello Lukas,

any progress on updated patch series? Nanbield release is near and I don't
remember seeing the updated patch series in last couple months.

Is there anything I can do to help? The last version looked reasonably well
and IMHO could be used as starting point for everybody to help fixing those
corner cases where it didn't work well.

Regards,


> Kind Regards,
>
>
> I've looked into the issues and would like to give some explanation.
>>
>> 1) the first module you mention ('gonum.org/v1/gonum
>> <http://gonum.org/v1/gonum>') does not obey the go documentation for
>> resolving the modules source-code repository (see
>> https://go.dev/ref/mod#go-mod-download , Section 'Version control
>> systems'). The documentation states that there should be a html page,
>> queried by "?go-get=3D1", with a <meta>-tag which contains the original
>> URL to the source-code repository. For 'gonum' there is only a 404-page.
>> This page contains javascript-code that redirects to the actual gonum
>> package page. Unnecessary hard to process. I'll open an issue for that.
>> The second module 'code.cloudfoundry.org/clock
>> <http://code.cloudfoundry.org/clock>' has a broken certificate. I
>> already opend an issue on github for this.
>>
>> I addressed this issue above by maintaining a list of modules and their
>> actual repo URLs inside the go-recipetool as an absolute fallback. Would
>> do you think about this solution?
>>
>
> Yes, that's what I was starting to do in:
>
> https://git.openembedded.org/openembedded-core-contrib/commit/?h=3Djansa/=
go&id=3Db973c7f17c8a613233a1a18de0bf6daa352c47d8
>
> https://git.openembedded.org/openembedded-core-contrib/commit/?h=3Djansa/=
go&id=3D61c6c9962b3b7d4c1cf6e6823de6c32b09998b00
>
>
>> 2) yes, my bad :)
>>
>
> as work around I was using
>
> https://git.openembedded.org/openembedded-core-contrib/commit/?h=3Djansa/=
go&id=3D5767819bfe96de29ab751d4a37a431a324f7e547
>
>
> 3) The problem is that some repositories have a prefix in their tags.
>> The tags usually only contain the semantic version string. I'm curretly
>> working on this issue.
>>
>> Best regards
>>
>> Lukas
>>
>> Am 22.12.2022 um 20:08 schrieb Martin Jansa via lists.openembedded.org:
>> > On Thu, Dec 22, 2022 at 7:39 PM Vyacheslav Yurkov <uvv.mail@gmail.com>
>> > wrote:
>> >
>> >     On 22.12.2022 17:48, Bruce Ashfield wrote:
>> >     > On Thu, Dec 22, 2022 at 11:20 AM Richard Purdie
>> >     > <richard.purdie@linuxfoundation.org> wrote:
>> >     >> This patch is not in master and is not a backport therefore not
>> >     >> eligible for kirkstone/langdale.
>> >
>> >     My bad, the intention was to have it in all three branches: master=
,
>> >     kirkstone, and langdale.
>> >
>> >     > 'nor should it go to master.
>> >     >
>> >     > If someone wants to allow go to fetch sources during builds, it
>> >     needs
>> >     > to be done in their own layers.
>> >     >
>> >     > Bruce
>> >
>> >     Probably I misunderstood the outcome of the discussion in my first
>> >     link.
>> >     Bruce and Richard, you both suggested to have it in go-mod with th=
e
>> >     warning. I agree that it breaks reproducibility, and is considered
>> >     a bad
>> >     practice in general (I'm aware of a few more build systems with
>> >     the same
>> >     shortcoming).
>> >
>> >     My point is, until a proper solution is in place, it should be at
>> >     least
>> >     documented somewhere that this should be done in own layer/recipe.
>> >     Any
>> >     suggestions where this can be documented if not in OE-Core?
>> >
>> >
>> > Have you tried the changes submitted by Lukas/Stefan in:
>> > https://lists.openembedded.org/g/openembedded-architecture/message/153=
9
>> > ?
>> >
>> > It's not perfect, I was testing it on
>> > https://github.com/influxdata/telegraf/blob/master/go.mod and I've
>> > found some corner cases where it failed.
>> >
>> > But it seems like very good start and we should work with Lukas/Stefan
>> > to get it merged in master. Then all branches could consume recipes
>> > created in master and only the exceptions would need to have network
>> > access (instead of the bbclass enabling it for every go-mod user -
>> > go-vendor inherits go-mod as well).
>> >
>> > Lukas/Stefan: is there something we can do to help with v2 of your
>> > patches?
>> >
>> > I wanted to submit better review on submitted patches after more
>> > debugging, but here it is:
>> >
>> > 1) to resolve 2 deps:
>> > {'Path': 'gonum.org/v1/gonum <http://gonum.org/v1/gonum>', 'Version':
>> > 'v0.12.0'} due to 404 "ERROR: Error while fetching redirect page: HTTP
>> > Error 404: Not Found"
>> >
>> > {'Path': 'code.cloudfoundry.org/clock
>> > <http://code.cloudfoundry.org/clock>', 'Version': 'v1.0.0',
>> > 'Indirect': True} due to this being redirect to github.com
>> > <http://github.com> and failing with "ERROR: Error while fetching
>> > redirect page: <urlopen error [SSL: CERTIFICATE_VERIFY_FAILED]
>> > certificate verify failed: Hostname mismatch, certificate is not valid
>> > for 'code.cloudfoundry.org <http://code.cloudfoundry.org>'.
>> (_ssl.c:996)>"
>> > parse
>> >
>> > 2) some issues with LICENSEs:
>> > INFO: Please add the following line for
>> > 'docs/LICENSE_OF_DEPENDENCIES.md' to a 'lib/recipetool/licenses.csv'
>> > and replace `Unknown` with the license:
>> > c4807c5b058a56c02f592207b4e056b1,Unknown
>> > Traceback (most recent call last):
>> >   File "/OE/build/oe-core/openembedded-core/scripts/recipetool", line
>> > 111, in <module>
>> >     ret =3D main()
>> >           ^^^^^^
>> >   File "/OE/build/oe-core/openembedded-core/scripts/recipetool", line
>> > 100, in main
>> >     ret =3D args.func(args)
>> >           ^^^^^^^^^^^^^^^
>> >   File
>> > "/OE/layers/openembedded-core/scripts/lib/recipetool/create.py", line
>> > 746, in create_recipe
>> >     handler.process(srctree_use, classes, lines_before, lines_after,
>> > handled, extravalues)
>> >   File
>> > "/OE/layers/openembedded-core/scripts/lib/recipetool/create_go.py",
>> > line 349, in process
>> >     self._rewrite_lic_uri(lines_before)
>> >   File
>> > "/OE/layers/openembedded-core/scripts/lib/recipetool/create_go.py",
>> > line 380, in _rewrite_lic_uri
>> >     updated, newlines =3D bb.utils.edit_metadata(lines_before,
>> > ['LIC_FILES_CHKSUM'], varfunc)
>> > ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>> >   File "/OE/build/oe-core/bitbake/lib/bb/utils.py", line 1382, in
>> > edit_metadata
>> >     if handle_var_end():
>> >        ^^^^^^^^^^^^^^^^
>> >   File "/OE/build/oe-core/bitbake/lib/bb/utils.py", line 1280, in
>> > handle_var_end
>> >     (newvalue, newop, indent, minbreak) =3D varfunc(in_var, full_value=
,
>> > op, newlines)
>> > ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>> >   File
>> > "/OE/layers/openembedded-core/scripts/lib/recipetool/create_go.py",
>> > line 372, in varfunc
>> >     uri, chksum =3D license.split(';', 1)
>> >     ^^^^^^^^^^^
>> > ValueError: not enough values to unpack (expected 2, got 1)
>> >
>> > (the license was just '/')
>> >
>> > 3) some SRCREVs set to None leading to parsing failure:
>> >
>> >   File "/OE/layers/bitbake/lib/bb/fetch2/git.py", line 762, in
>> > _latest_revision
>> >     raise bb.fetch2.FetchError("Unable to resolve '%s' in upstream git
>> > repository in git ls-remote output for %s" % \
>> > bb.data_smart.ExpansionError: Failure expanding variable SRCPV,
>> > expression was ${@bb.fetch2.get_srcrev(d)} which triggered exception
>> > FetchError: Fetcher failure: Unable to resolve 'None' in upstream git
>> > repository in git ls-remote output for
>> > github.com/googleapis/google-cloud-go
>> > <http://github.com/googleapis/google-cloud-go>
>> > The variable dependency chain for the failure is: SRCPV -> PV -> BP ->
>> > FILESPATH
>> >
>> > ERROR: Parsing newly created recipe failed, moving recipe to
>> >
>> /OE/build/oe-core/workspace/recipes/telegraf/telegraf_git.bb.parsefailed
>> > for reference. If this looks to be caused by the recipe itself, please
>> > report this error.
>> >
>> > It takes long time to fetch all telegraf dependencies, so I'll create
>> > some test recipe to more easily debug these 3 issues in isolation.
>> >
>> >
>> >
>> >
>>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#178380):
> https://lists.openembedded.org/g/openembedded-core/message/178380
> Mute This Topic: https://lists.openembedded.org/mt/95827446/3617156
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> Martin.Jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--00000000000086654c060507dc7a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Sun, Mar 12, 2023 at 10:15=E2=80=AFAM =
Martin Jansa via <a href=3D"http://lists.openembedded.org">lists.openembedd=
ed.org</a> &lt;Martin.Jansa=3D<a href=3D"mailto:gmail.com@lists.openembedde=
d.org">gmail.com@lists.openembedded.org</a>&gt; wrote:<br></div><div class=
=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=
=3D"ltr"><div dir=3D"ltr">On Tue, Jan 3, 2023 at 5:03=E2=80=AFPM Lukas Funk=
e &lt;<a href=3D"mailto:lukas.funke-oss@weidmueller.com" target=3D"_blank">=
lukas.funke-oss@weidmueller.com</a>&gt; wrote:<br></div><div class=3D"gmail=
_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex">Martin,<br>
<br>
first of all: thank you for testing the patches. As usual the corner <br>
cases are the most tricky ones.<br>
<br>
tl;dr: I&#39;m working on an updated patch series to address the reported <=
br>
issues.<br></blockquote><div><br></div><div>Hi Lukas, Stefan,</div><div><br=
></div><div>and update on this series?</div><div><br></div><div>It doesn&#3=
9;t have to be perfect, other people can help with remaining corner cases a=
nd right now there is nothing for this in oe-core, so any version will be b=
ig improvement :) and it will make it easier for others to submit increment=
al improvements - I have some as well, but haven&#39;t sent them as I don&#=
39;t know what you&#39;ve already updated locally, so I&#39;m waiting for v=
2.</div><div><br></div><div>Mickledore is already in feature freeze, but ma=
ybe RP will make an exception as this is new important functionality which =
isn&#39;t likely to break other existing code.</div></div></div></blockquot=
e><div><br></div><div>Hello Lukas,</div><div><br></div><div>any progress on=
 updated patch series? Nanbield release is near and I don&#39;t remember se=
eing the updated patch series in last couple months.</div><div><br></div><d=
iv>Is there anything I can do to help? The last version looked reasonably w=
ell and IMHO could be used as starting point for everybody to help fixing t=
hose corner cases where it didn&#39;t work well.</div><div><br></div><div>R=
egards,=C2=A0</div><div><br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_quote"><div><br></div><div>=
Kind Regards,</div><div><br></div><div><br></div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex">
I&#39;ve looked into the issues and would like to give some explanation.<br=
>
<br>
1) the first module you mention (&#39;<a href=3D"http://gonum.org/v1/gonum"=
 rel=3D"noreferrer" target=3D"_blank">gonum.org/v1/gonum</a> <br>
&lt;<a href=3D"http://gonum.org/v1/gonum" rel=3D"noreferrer" target=3D"_bla=
nk">http://gonum.org/v1/gonum</a>&gt;&#39;) does not obey the go documentat=
ion for <br>
resolving the modules source-code repository (see <br>
<a href=3D"https://go.dev/ref/mod#go-mod-download" rel=3D"noreferrer" targe=
t=3D"_blank">https://go.dev/ref/mod#go-mod-download</a> , Section &#39;Vers=
ion control <br>
systems&#39;). The documentation states that there should be a html page, <=
br>
queried by &quot;?go-get=3D1&quot;, with a &lt;meta&gt;-tag which contains =
the original <br>
URL to the source-code repository. For &#39;gonum&#39; there is only a 404-=
page. <br>
This page contains javascript-code that redirects to the actual gonum <br>
package page. Unnecessary hard to process. I&#39;ll open an issue for that.=
 <br>
The second module &#39;<a href=3D"http://code.cloudfoundry.org/clock" rel=
=3D"noreferrer" target=3D"_blank">code.cloudfoundry.org/clock</a> <br>
&lt;<a href=3D"http://code.cloudfoundry.org/clock" rel=3D"noreferrer" targe=
t=3D"_blank">http://code.cloudfoundry.org/clock</a>&gt;&#39; has a broken c=
ertificate. I <br>
already opend an issue on github for this.<br>
<br>
I addressed this issue above by maintaining a list of modules and their <br=
>
actual repo URLs inside the go-recipetool as an absolute fallback. Would <b=
r>
do you think about this solution?<br></blockquote><div><br></div><div>Yes, =
that&#39;s what I was starting to do in:</div><div><a href=3D"https://git.o=
penembedded.org/openembedded-core-contrib/commit/?h=3Djansa/go&amp;id=3Db97=
3c7f17c8a613233a1a18de0bf6daa352c47d8" target=3D"_blank">https://git.openem=
bedded.org/openembedded-core-contrib/commit/?h=3Djansa/go&amp;id=3Db973c7f1=
7c8a613233a1a18de0bf6daa352c47d8</a></div><div><a href=3D"https://git.opene=
mbedded.org/openembedded-core-contrib/commit/?h=3Djansa/go&amp;id=3D61c6c99=
62b3b7d4c1cf6e6823de6c32b09998b00" target=3D"_blank">https://git.openembedd=
ed.org/openembedded-core-contrib/commit/?h=3Djansa/go&amp;id=3D61c6c9962b3b=
7d4c1cf6e6823de6c32b09998b00</a></div><div>=C2=A0</div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex">
2) yes, my bad :)<br></blockquote><div><br></div><div>as work around I was =
using</div><div><a href=3D"https://git.openembedded.org/openembedded-core-c=
ontrib/commit/?h=3Djansa/go&amp;id=3D5767819bfe96de29ab751d4a37a431a324f7e5=
47" target=3D"_blank">https://git.openembedded.org/openembedded-core-contri=
b/commit/?h=3Djansa/go&amp;id=3D5767819bfe96de29ab751d4a37a431a324f7e547</a=
>=C2=A0</div><div><br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">
3) The problem is that some repositories have a prefix in their tags. <br>
The tags usually only contain the semantic version string. I&#39;m curretly=
 <br>
working on this issue.<br>
<br>
Best regards<br>
<br>
Lukas<br>
<br>
Am 22.12.2022 um 20:08 schrieb Martin Jansa via <a href=3D"http://lists.ope=
nembedded.org" rel=3D"noreferrer" target=3D"_blank">lists.openembedded.org<=
/a>:<br>
&gt; On Thu, Dec 22, 2022 at 7:39 PM Vyacheslav Yurkov &lt;<a href=3D"mailt=
o:uvv.mail@gmail.com" target=3D"_blank">uvv.mail@gmail.com</a>&gt; <br>
&gt; wrote:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0On 22.12.2022 17:48, Bruce Ashfield wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; On Thu, Dec 22, 2022 at 11:20 AM Richard Purdi=
e<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &lt;<a href=3D"mailto:richard.purdie@linuxfoun=
dation.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt; wr=
ote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; This patch is not in master and is not a b=
ackport therefore not<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; eligible for kirkstone/langdale.<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0My bad, the intention was to have it in all three b=
ranches: master,<br>
&gt;=C2=A0 =C2=A0 =C2=A0kirkstone, and langdale.<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &#39;nor should it go to master.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; If someone wants to allow go to fetch sources =
during builds, it<br>
&gt;=C2=A0 =C2=A0 =C2=A0needs<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; to be done in their own layers.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Bruce<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0Probably I misunderstood the outcome of the discuss=
ion in my first<br>
&gt;=C2=A0 =C2=A0 =C2=A0link.<br>
&gt;=C2=A0 =C2=A0 =C2=A0Bruce and Richard, you both suggested to have it in=
 go-mod with the<br>
&gt;=C2=A0 =C2=A0 =C2=A0warning. I agree that it breaks reproducibility, an=
d is considered<br>
&gt;=C2=A0 =C2=A0 =C2=A0a bad<br>
&gt;=C2=A0 =C2=A0 =C2=A0practice in general (I&#39;m aware of a few more bu=
ild systems with<br>
&gt;=C2=A0 =C2=A0 =C2=A0the same<br>
&gt;=C2=A0 =C2=A0 =C2=A0shortcoming).<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0My point is, until a proper solution is in place, i=
t should be at<br>
&gt;=C2=A0 =C2=A0 =C2=A0least<br>
&gt;=C2=A0 =C2=A0 =C2=A0documented somewhere that this should be done in ow=
n layer/recipe.<br>
&gt;=C2=A0 =C2=A0 =C2=A0Any<br>
&gt;=C2=A0 =C2=A0 =C2=A0suggestions where this can be documented if not in =
OE-Core?<br>
&gt;<br>
&gt;<br>
&gt; Have you tried the changes submitted by Lukas/Stefan in:<br>
&gt; <a href=3D"https://lists.openembedded.org/g/openembedded-architecture/=
message/1539" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedd=
ed.org/g/openembedded-architecture/message/1539</a><br>
&gt; ?<br>
&gt;<br>
&gt; It&#39;s not perfect, I was testing it on <br>
&gt; <a href=3D"https://github.com/influxdata/telegraf/blob/master/go.mod" =
rel=3D"noreferrer" target=3D"_blank">https://github.com/influxdata/telegraf=
/blob/master/go.mod</a> and I&#39;ve <br>
&gt; found some corner cases where it failed.<br>
&gt;<br>
&gt; But it seems like very good start and we should work with Lukas/Stefan=
 <br>
&gt; to get it merged in master. Then all branches could consume recipes <b=
r>
&gt; created in master and only the exceptions would need to have network <=
br>
&gt; access (instead of the bbclass enabling it for every go-mod user - <br=
>
&gt; go-vendor inherits go-mod as well).<br>
&gt;<br>
&gt; Lukas/Stefan: is there something we can do to help with v2 of your <br=
>
&gt; patches?<br>
&gt;<br>
&gt; I wanted to submit better review on submitted patches after more <br>
&gt; debugging, but here it is:<br>
&gt;<br>
&gt; 1) to resolve 2 deps:<br>
&gt; {&#39;Path&#39;: &#39;<a href=3D"http://gonum.org/v1/gonum" rel=3D"nor=
eferrer" target=3D"_blank">gonum.org/v1/gonum</a> &lt;<a href=3D"http://gon=
um.org/v1/gonum" rel=3D"noreferrer" target=3D"_blank">http://gonum.org/v1/g=
onum</a>&gt;&#39;, &#39;Version&#39;: <br>
&gt; &#39;v0.12.0&#39;} due to 404 &quot;ERROR: Error while fetching redire=
ct page: HTTP <br>
&gt; Error 404: Not Found&quot;<br>
&gt;<br>
&gt; {&#39;Path&#39;: &#39;<a href=3D"http://code.cloudfoundry.org/clock" r=
el=3D"noreferrer" target=3D"_blank">code.cloudfoundry.org/clock</a> <br>
&gt; &lt;<a href=3D"http://code.cloudfoundry.org/clock" rel=3D"noreferrer" =
target=3D"_blank">http://code.cloudfoundry.org/clock</a>&gt;&#39;, &#39;Ver=
sion&#39;: &#39;v1.0.0&#39;, <br>
&gt; &#39;Indirect&#39;: True} due to this being redirect to <a href=3D"htt=
p://github.com" rel=3D"noreferrer" target=3D"_blank">github.com</a> <br>
&gt; &lt;<a href=3D"http://github.com" rel=3D"noreferrer" target=3D"_blank"=
>http://github.com</a>&gt; and failing with &quot;ERROR: Error while fetchi=
ng <br>
&gt; redirect page: &lt;urlopen error [SSL: CERTIFICATE_VERIFY_FAILED] <br>
&gt; certificate verify failed: Hostname mismatch, certificate is not valid=
 <br>
&gt; for &#39;<a href=3D"http://code.cloudfoundry.org" rel=3D"noreferrer" t=
arget=3D"_blank">code.cloudfoundry.org</a> &lt;<a href=3D"http://code.cloud=
foundry.org" rel=3D"noreferrer" target=3D"_blank">http://code.cloudfoundry.=
org</a>&gt;&#39;. (_ssl.c:996)&gt;&quot;<br>
&gt; parse<br>
&gt;<br>
&gt; 2) some issues with LICENSEs:<br>
&gt; INFO: Please add the following line for <br>
&gt; &#39;docs/LICENSE_OF_DEPENDENCIES.md&#39; to a &#39;lib/recipetool/lic=
enses.csv&#39; <br>
&gt; and replace `Unknown` with the license:<br>
&gt; c4807c5b058a56c02f592207b4e056b1,Unknown<br>
&gt; Traceback (most recent call last):<br>
&gt; =C2=A0 File &quot;/OE/build/oe-core/openembedded-core/scripts/recipeto=
ol&quot;, line <br>
&gt; 111, in &lt;module&gt;<br>
&gt; =C2=A0 =C2=A0 ret =3D main()<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^^^^^^<br>
&gt; =C2=A0 File &quot;/OE/build/oe-core/openembedded-core/scripts/recipeto=
ol&quot;, line <br>
&gt; 100, in main<br>
&gt; =C2=A0 =C2=A0 ret =3D args.func(args)<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^^^^^^^^^^^^^^^<br>
&gt; =C2=A0 File <br>
&gt; &quot;/OE/layers/openembedded-core/scripts/lib/recipetool/create.py&qu=
ot;, line <br>
&gt; 746, in create_recipe<br>
&gt; =C2=A0 =C2=A0 handler.process(srctree_use, classes, lines_before, line=
s_after, <br>
&gt; handled, extravalues)<br>
&gt; =C2=A0 File <br>
&gt; &quot;/OE/layers/openembedded-core/scripts/lib/recipetool/create_go.py=
&quot;, <br>
&gt; line 349, in process<br>
&gt; =C2=A0 =C2=A0 self._rewrite_lic_uri(lines_before)<br>
&gt; =C2=A0 File <br>
&gt; &quot;/OE/layers/openembedded-core/scripts/lib/recipetool/create_go.py=
&quot;, <br>
&gt; line 380, in _rewrite_lic_uri<br>
&gt; =C2=A0 =C2=A0 updated, newlines =3D bb.utils.edit_metadata(lines_befor=
e, <br>
&gt; [&#39;LIC_FILES_CHKSUM&#39;], varfunc)<br>
&gt; ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^<br=
>
&gt; =C2=A0 File &quot;/OE/build/oe-core/bitbake/lib/bb/utils.py&quot;, lin=
e 1382, in <br>
&gt; edit_metadata<br>
&gt; =C2=A0 =C2=A0 if handle_var_end():<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0^^^^^^^^^^^^^^^^<br>
&gt; =C2=A0 File &quot;/OE/build/oe-core/bitbake/lib/bb/utils.py&quot;, lin=
e 1280, in <br>
&gt; handle_var_end<br>
&gt; =C2=A0 =C2=A0 (newvalue, newop, indent, minbreak) =3D varfunc(in_var, =
full_value, <br>
&gt; op, newlines)<br>
&gt; ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^<br>
&gt; =C2=A0 File <br>
&gt; &quot;/OE/layers/openembedded-core/scripts/lib/recipetool/create_go.py=
&quot;, <br>
&gt; line 372, in varfunc<br>
&gt; =C2=A0 =C2=A0 uri, chksum =3D license.split(&#39;;&#39;, 1)<br>
&gt; =C2=A0 =C2=A0 ^^^^^^^^^^^<br>
&gt; ValueError: not enough values to unpack (expected 2, got 1)<br>
&gt;<br>
&gt; (the license was just &#39;/&#39;)<br>
&gt;<br>
&gt; 3) some SRCREVs set to None leading to parsing failure:<br>
&gt;<br>
&gt; =C2=A0 File &quot;/OE/layers/bitbake/lib/bb/fetch2/git.py&quot;, line =
762, in <br>
&gt; _latest_revision<br>
&gt; =C2=A0 =C2=A0 raise bb.fetch2.FetchError(&quot;Unable to resolve &#39;=
%s&#39; in upstream git <br>
&gt; repository in git ls-remote output for %s&quot; % \<br>
&gt; bb.data_smart.ExpansionError: Failure expanding variable SRCPV, <br>
&gt; expression was ${@bb.fetch2.get_srcrev(d)} which triggered exception <=
br>
&gt; FetchError: Fetcher failure: Unable to resolve &#39;None&#39; in upstr=
eam git <br>
&gt; repository in git ls-remote output for <br>
&gt; <a href=3D"http://github.com/googleapis/google-cloud-go" rel=3D"norefe=
rrer" target=3D"_blank">github.com/googleapis/google-cloud-go</a> <br>
&gt; &lt;<a href=3D"http://github.com/googleapis/google-cloud-go" rel=3D"no=
referrer" target=3D"_blank">http://github.com/googleapis/google-cloud-go</a=
>&gt;<br>
&gt; The variable dependency chain for the failure is: SRCPV -&gt; PV -&gt;=
 BP -&gt; <br>
&gt; FILESPATH<br>
&gt;<br>
&gt; ERROR: Parsing newly created recipe failed, moving recipe to <br>
&gt; /OE/build/oe-core/workspace/recipes/telegraf/telegraf_git.bb.parsefail=
ed <br>
&gt; for reference. If this looks to be caused by the recipe itself, please=
 <br>
&gt; report this error.<br>
&gt;<br>
&gt; It takes long time to fetch all telegraf dependencies, so I&#39;ll cre=
ate <br>
&gt; some test recipe to more easily debug these 3 issues in isolation.<br>
&gt;<br>
&gt;<br>
&gt; <br>
&gt;<br>
</blockquote></div></div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#178380): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/178380" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/178380</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/95827446/3617=
156" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/95827446/3617156</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:Martin.Jansa@gmail.com" ta=
rget=3D"_blank">Martin.Jansa@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--00000000000086654c060507dc7a--

