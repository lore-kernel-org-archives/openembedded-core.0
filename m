Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C94AD2F34B
	for <webhook@archiver.kernel.org>; Tue, 13 Jan 2026 17:06:24 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.64503.1768323973952358601
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Jan 2026 09:06:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=qj2XdFSG;
 spf=pass (domain: smile.fr, ip: 209.85.221.47, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-42fb2314eb0so6593015f8f.2
        for <openembedded-core@lists.openembedded.org>; Tue, 13 Jan 2026 09:06:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1768323972; x=1768928772; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jdWnGV4090C1fFCKKEwp9UnUQL6mC8ZaJY9Zer8A/BM=;
        b=qj2XdFSGElcb5B/FWhoXMO1i7ntQuS8SI6dpNFN0xwrMFWzrcoPPGtK9HRZuj58q1y
         lfL6aqUCJkdLrNksmyKETI97peOrxkgUQTpT73u75AVG2LMnRIESJPt6x9NNDDYTWzL8
         N6gt5u4fAwPwEnUcIWPBGpU5P4BJK2QSqOflw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768323972; x=1768928772;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jdWnGV4090C1fFCKKEwp9UnUQL6mC8ZaJY9Zer8A/BM=;
        b=ap4KfLmgMSxa8Cf7JzFmvy3jwWOe9MpkaxsxNxsq0kUesH8CAe2AT8UAV85UD6Dnj8
         wUApNzOZJ4L/C372nI+gAe7FidXWrB/GbCQml034/0tRStT9YZaudSr3KR7Sf3UHTR8L
         zZKpWnIhl6AbRWMPNpFlcVMNsh/GrkMI5hIzQHHQsIbQz5v7gPLJrPJ8ZV4O4hBqbRp6
         AI/YC1PJZisJVp+R/2UgNHeH6dpLU5WfvHzGZX/2JiSicF2WxXzUocSFQLU2BWfsnxrz
         RXRAe/MK7oJ/gJ7m9fr/Sqdiis+wIXXnXTuiCMlYkXSCvz9yyad+FEeXd9xNqaG0mViY
         BslA==
X-Forwarded-Encrypted: i=1; AJvYcCUZIolEVy6oFkBmo+XFJc/y0P1PaQA8xTzh4po4o5aCLMRRUUkvKnD3LeNQUz9jjvYO2MOJRP7P0L/3ViVY4LLvVw==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yxd7zYU4jYjCCbqbUOJ1yslCTpMxgx0O4WAvmLUyo2uPORVmJXd
	FaYcw3GH225scbEm0y1R/P5gS9g0Z+e8pGMAewJd48mWukDeuN1qR4DhCuys3UWZ8PwV9tgRBK2
	t0tw/P80B91pbUq9Mds3KGjgnnXJT7QYCNw43PNHQIA==
X-Gm-Gg: AY/fxX4LcxS6eHuAiIV8F/8sed+COhwZQ+Jco7MrZDDBZAZ/LkNJOSZ4FTdAGvfMP62
	WcSsqPH4wjd6yJ83+FHR8JH0hF3+KWG6b42ev+w0HVU48rOYJcOhwBEGOShbKlCksbpd0Tg+LZi
	PjDBM5gb4Tj+o3tOuH9MPsg15/hWFWO/hbV0GgKgCfUs2wlJ0fCYCyDbF0lo+TQvc4cn1YeCXYy
	ip97dsTBonXrfxigqhidR1WjfTbpJrWGIgt9/NCK99yv9lqhIKhl68rHTqo8ZvH7QSIyTt8Rg==
X-Google-Smtp-Source: AGHT+IGiRI5Z5EKSdmj4xh3Xax6sCd9SBO/ahg3AA9BWMxoVY5TouyO8RNk5e/L5gxCy0xz6ET6XqSnsTDA+8PBKx8k=
X-Received: by 2002:a5d:4bc9:0:b0:431:344:5a2d with SMTP id
 ffacd0b85a97d-432c37c87a3mr20664475f8f.41.1768323971546; Tue, 13 Jan 2026
 09:06:11 -0800 (PST)
MIME-Version: 1.0
References: <CAK5yBb9O+ZyTDJ55razkzhvLqzTK2DitOyS0_EehSkmvv6e3Bg@mail.gmail.com>
In-Reply-To: <CAK5yBb9O+ZyTDJ55razkzhvLqzTK2DitOyS0_EehSkmvv6e3Bg@mail.gmail.com>
From: Yoann Congal <yoann.congal@smile.fr>
Date: Tue, 13 Jan 2026 18:05:45 +0100
X-Gm-Features: AZwV_QhYxKhPznoAGxqQvOVCdS_DgfPfR0zAE0EfBngjRKmNNOBV2bd_uhbWXsA
Message-ID: <CAMSfU+74B0rJvpdaBdnG=-H1tAz6d+QaHMaEiTa1xVr44KwZ+g@mail.gmail.com>
Subject: Re: [OE-core] Yocto Project Status 13 January 2026 (WW02)
To: sjolley.yp.pm@gmail.com
Cc: Yocto-mailing-list <yocto@lists.yoctoproject.org>, 
	",openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000002c167806484802dd"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Jan 2026 17:06:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229279

--0000000000002c167806484802dd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mar. 13 janv. 2026 =C3=A0 16:55, Stephen Jolley via lists.openembedded.o=
rg <
sjolley.yp.pm=3Dgmail.com@lists.openembedded.org> a =C3=A9crit :

> Current Dev Position:YP 6.0 M1
>
> Next Deadline: YP 6.0 M1 Build Date 2026-01-05
>
> Next Team Meetings:
>
>    -
>
>    Bug Triage meeting - Thursday 15th Jan. 7:30am PDT (
>    https://zoom.us/j/454367603?pwd=3DZGxoa2ZXL3FkM3Y0bFd5aVpHVVZ6dz09)
>    -
>
>    Weekly Project Engineering Sync  - Tuesday 13th Jan. 8am PDT (
>    https://zoom.us/j/990892712?pwd=3DcHU1MjhoM2x6ck81bkcrYjRrcmJsUT09)
>    <https://zoom.us/j/990892712>
>    -
>
>    Yocto Project Patch Review - Thursday 15th Jan. 10am GMT and Monday
>    19th Jan. 9am PDT (
>    https://zoom.us/j/97762397148?pwd=3D1xk0iC9hp9SjEonaTaONwTb6iWry4Eb.1
>    <https://zoom.us/j/97762397148?pwd=3D1xkiC9hp9SjEonaTaONwTb6iWry4Eb.1>=
)
>
>
> Project data dashboard: https://dashboard.yoctoproject.org/
>
> Key Status/Updates:
>
>    -
>
>    YP 5.0.15 is under review.
>    -
>
>    YP 5.3.1 is in QA
>    -
>
>    YP 6.0 M1 will build when the 5 open high bugs are resolved.
>    -
>
>    There are also 4 high bugs open for 6.0 M2.
>    -
>
>    We are seeing multiple serious issues blocking 6.0 M1 from building:
>    -
>
>       A glibc test causing builds to hang (a buffer overflow SIGABRT in
>       unfs3 triggered by host compiler + fortify source) (#16113)
>       -
>
>       Hangs of the autobuilder controller (database locking, should be
>       fixed) (#16129)
>       -
>
>       Issues with a CVE patch applied to tar in
>       rocky9/alma9/centos-stream using the openat2 syscall which pseudo d=
oesn=E2=80=99t
>       wrap (#16117)
>       -
>
>       Issues reusing binaries from fedora 43 (and maybe ubuntu 25.10) on
>       older systems (patchelf triggered?) (#16074, #16087)
>       -
>
>       still need to disable the npm fetcher (#16105)
>       -
>
>    We have not had this number of high bugs blocking releases in several
>    years
>    -
>
>    The number of intermittent failures affecting stable release builds is
>    becoming problematic. Any given build is now statistically likely to h=
it
>    one or more of them and we don=E2=80=99t have successful builds. Since=
 we struggle
>    to get help in addressing these, we need to change and start potential=
ly
>    blocking releases (including stable/LTS) until these get addressed in =
some
>    way. We plan to form a dedicated team to investigate these and find wa=
ys of
>    removing the failures from our builds which may include reducing testi=
ng.
>    -
>
>    To be clear, due to the problems above, most patch testing is now
>    stalled as the autobuilder is currently inoperable and we can=E2=80=99=
t test
>    anything.
>    -
>
>    The project is exploring the idea of applying for funding for security
>    related work. If anyone (individual or consultancies) has ideas, pleas=
e
>    talk to Paul/Richard/TSC. This is an opportunity to work on those issu=
es
>    you never have time/funding for!
>
>
> Want to contribute? We would appreciate help with the following areas:
>
>    -
>
>    We have several open issues for pseudo and limited maintainer time to
>    work on them. Help from someone familiar with systems programming in C
>    would be greatly appreciated.
>    https://bugzilla.yoctoproject.org/buglist.cgi?list_id=3D661406&priorit=
y=3DHigh&priority=3DMedium%2B&product=3DPseudo&query_format=3Dadvanced&reso=
lution=3D---
>    -
>
>    There are a large number of intermittent failures on our autobuilder,
>    any help with investigating, reproducing or solving these issues would=
 be
>    welcome! https://valkyrie.yocto.io/pub/non-release/abint/
>    -
>
>    Many recipes in openembedded-core would benefit from a new recipe
>    maintainer. Please look at
>    https://git.openembedded.org/openembedded-core/tree/meta/conf/distro/i=
nclude/maintainers.inc
>    and see if you can adopt any of the unassigned recipes.
>    -
>
>    For more ways to contribute, see
>    https://docs.google.com/document/d/18oxKWxLorfF813h82mK6yKTIHeBp_-9owF=
uCWbzgjOk/edit?usp=3Dsharing
>
>
> New to the project?
>
>    -
>
>    We have a list of issues we think are good places to start
>    contributing:
>    https://bugzilla.yoctoproject.org/buglist.cgi?quicksearch=3DNEWCOMER
>
>
> Tracking Metrics:
>
>    -
>
>    WDD 3026 (last week 3011) (
>    https://wiki.yoctoproject.org/charts/combo.html)
>    -
>
>    OE-Core/Poky Patch Metrics
>    -
>
>       Total patches found: 1089 (last week 1092)
>       -
>
>       Patches in the Pending State: 151 (14%) [last week 151 (14%)]
>       -
>
>       https://autobuilder.yocto.io/pub/non-release/patchmetrics/
>
>
> YP 6.0 Milestone Dates:
>
>    -
>
>    YP 6.0 M1 Build Date 2026-01-05
>    -
>
>    YP 6.0 M1 Release Date 2026-01-16
>    -
>
>    YP 6.0 M2 Build Date 2026-02-02
>    -
>
>    YP 6.0 M2 Release Date 2026-02-13
>    -
>
>    YP 6.0 M3 Build Date 2026-03-02
>    -
>
>    YP 6.0 M3 Release Date 2026-03-13
>    -
>
>    YP 6.0 M4 Build Date 2026-03-30
>    -
>
>    YP 6.0 M4 Release Date 2026-04-26
>
>
> Upcoming dot releases:.
>
>    -
>
>    YP 5.0.15 is under review.
>    -
>
>    YP 5.3.1 is in QA.
>    -
>
>    YP 4.0.33 Build Date 2026-01-26
>    -
>
>    YP 4.0.33 Release Date 2026-01-30
>
>
Hello,

There is only 4 days between build date and release date for 4.0.33.
That is far less than the usual 11 days. isn't this a problem?

Regards,


>    -
>
>    YP 5.0.16 Build Date 2026-02-09
>    -
>
>    YP 5.0.16 Release Date 2026-02-20
>    -
>
>    YP 5.3.2 Build Date 2026-02-16
>    -
>
>    YP 5.3.2 Release Date 2026-02-27
>    -
>
>    YP 4.0.34 Build Date 2026-02-23
>    -
>
>    YP 4.0.34 Release Date 2026-03-06
>    -
>
>    YP 5.3.3 Build Date 2026-03-09
>    -
>
>    YP 5.3.3 Release Date 2026-03-20
>    -
>
>    YP 5.0.17 Build Date 2026-03-16
>    -
>
>    YP 5.0.17 Release Date 2026-03-23
>    -
>
>    YP 4.0.35 Build Date 2026-04-06
>    -
>
>    YP 4.0.35 Release Date 2026-04-17
>    -
>
>    YP 5.3.4 Build Date 2026-04-13
>    -
>
>    YP 5.3.4 Release Date 2026-04-24
>    -
>
>    YP 5.0.18 Build Date 2026-04-20
>    -
>
>    YP 5.0.18 Release Date 2026-05-01
>    -
>
>    YP 5.0.19 Build Date 2026-05-26
>    -
>
>    YP 5.0.19 Release Date 2026-06-05
>
>
> The Yocto Project=E2=80=99s technical governance is through its Technical=
 Steering
> Committee, more information is available at:
>
> https://wiki.yoctoproject.org/wiki/TSC
>
> The Status reports are now stored on the wiki at:
> https://wiki.yoctoproject.org/wiki/Weekly_Status
>
> [If anyone has suggestions for other information you=E2=80=99d like to se=
e on this
> weekly status update, let us know!]
>
> Thanks,
>
>
>
> *Stephen K. Jolley*
>
> *Yocto Project Program Manager*
>
> (    *Cell*:                (208) 244-4460
>
> * *Email*:                 *s
> <stephen.k.jolley@intel.com>jolley.yp.pm@gmail.com <jolley.yp.pm@gmail.co=
m>*
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#229276):
> https://lists.openembedded.org/g/openembedded-core/message/229276
> Mute This Topic: https://lists.openembedded.org/mt/117245166/4316185
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> yoann.congal@smile.fr]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Yoann Congal
Smile ECS

--0000000000002c167806484802dd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0mar. 13=
 janv. 2026 =C3=A0=C2=A016:55, Stephen Jolley via <a href=3D"http://lists.o=
penembedded.org">lists.openembedded.org</a> &lt;<a href=3D"http://sjolley.y=
p.pm">sjolley.yp.pm</a>=3D<a href=3D"mailto:gmail.com@lists.openembedded.or=
g">gmail.com@lists.openembedded.org</a>&gt; a =C3=A9crit=C2=A0:<br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div><span=
 id=3D"m_8732553588448971748gmail-docs-internal-guid-caf46895-7fff-6140-974=
3-0c651ba10604"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;mar=
gin-bottom:0pt"><span style=3D"font-size:11pt;font-family:Arial,sans-serif;=
color:rgb(0,0,0);background-color:transparent;font-variant-numeric:normal;f=
ont-variant-east-asian:normal;font-variant-alternates:normal;vertical-align=
:baseline">Current Dev Position:YP 6.0 M1</span></p><p dir=3D"ltr" style=3D=
"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-siz=
e:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-color:trans=
parent;font-variant-numeric:normal;font-variant-east-asian:normal;font-vari=
ant-alternates:normal;vertical-align:baseline">Next Deadline: YP 6.0 M1 Bui=
ld Date 2026-01-05</span></p><br><p dir=3D"ltr" style=3D"line-height:1.38;m=
argin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-family:=
Arial,sans-serif;color:rgb(0,0,0);background-color:transparent;font-variant=
-numeric:normal;font-variant-east-asian:normal;font-variant-alternates:norm=
al;vertical-align:baseline">Next Team Meetings:</span></p><ul style=3D"marg=
in-top:0px;margin-bottom:0px"><li dir=3D"ltr" style=3D"list-style-type:disc=
;font-size:9.5pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-c=
olor:transparent;font-variant-numeric:normal;font-variant-east-asian:normal=
;font-variant-alternates:normal;vertical-align:baseline;white-space:pre-wra=
p"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0p=
t" role=3D"presentation"><span style=3D"font-size:11pt;background-color:tra=
nsparent;font-variant-numeric:normal;font-variant-east-asian:normal;font-va=
riant-alternates:normal;vertical-align:baseline">Bug Triage meeting - Thurs=
day 15th Jan. 7:30am PDT (</span><a href=3D"https://zoom.us/j/454367603?pwd=
=3DZGxoa2ZXL3FkM3Y0bFd5aVpHVVZ6dz09" style=3D"text-decoration-line:none" ta=
rget=3D"_blank"><span style=3D"font-size:11pt;background-color:transparent;=
font-variant-numeric:normal;font-variant-east-asian:normal;font-variant-alt=
ernates:normal;text-decoration-line:underline;vertical-align:baseline">http=
s://zoom.us/j/454367603?pwd=3DZGxoa2ZXL3FkM3Y0bFd5aVpHVVZ6dz09</span></a><s=
pan style=3D"font-size:11pt;background-color:transparent;font-variant-numer=
ic:normal;font-variant-east-asian:normal;font-variant-alternates:normal;ver=
tical-align:baseline">)</span></p></li><li dir=3D"ltr" style=3D"list-style-=
type:disc;font-size:9.5pt;font-family:Arial,sans-serif;color:rgb(0,0,0);bac=
kground-color:transparent;font-variant-numeric:normal;font-variant-east-asi=
an:normal;font-variant-alternates:normal;vertical-align:baseline;white-spac=
e:pre-wrap"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-=
bottom:0pt" role=3D"presentation"><span style=3D"font-size:11pt;background-=
color:transparent;font-variant-numeric:normal;font-variant-east-asian:norma=
l;font-variant-alternates:normal;vertical-align:baseline">Weekly Project En=
gineering Sync=C2=A0 - Tuesday 13th Jan. 8am PDT (</span><a href=3D"https:/=
/zoom.us/j/990892712?pwd=3DcHU1MjhoM2x6ck81bkcrYjRrcmJsUT09" style=3D"text-=
decoration-line:none" target=3D"_blank"><span style=3D"font-size:11pt;backg=
round-color:transparent;font-variant-numeric:normal;font-variant-east-asian=
:normal;font-variant-alternates:normal;text-decoration-line:underline;verti=
cal-align:baseline">https://zoom.us/j/990892712?pwd=3DcHU1MjhoM2x6ck81bkcrY=
jRrcmJsUT09</span></a><a href=3D"https://zoom.us/j/990892712" style=3D"text=
-decoration-line:none" target=3D"_blank"><span style=3D"font-size:11pt;back=
ground-color:transparent;font-variant-numeric:normal;font-variant-east-asia=
n:normal;font-variant-alternates:normal;text-decoration-line:underline;vert=
ical-align:baseline">)</span></a></p></li><li dir=3D"ltr" style=3D"list-sty=
le-type:disc;font-size:9.5pt;font-family:Arial,sans-serif;color:rgb(0,0,0);=
background-color:transparent;font-variant-numeric:normal;font-variant-east-=
asian:normal;font-variant-alternates:normal;vertical-align:baseline;white-s=
pace:pre-wrap"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;marg=
in-bottom:0pt" role=3D"presentation"><span style=3D"font-size:11pt;backgrou=
nd-color:transparent;font-variant-numeric:normal;font-variant-east-asian:no=
rmal;font-variant-alternates:normal;vertical-align:baseline">Yocto Project =
Patch Review - Thursday 15th Jan. 10am GMT and Monday 19th Jan. 9am PDT (</=
span><a href=3D"https://zoom.us/j/97762397148?pwd=3D1xkiC9hp9SjEonaTaONwTb6=
iWry4Eb.1" style=3D"text-decoration-line:none" target=3D"_blank"><span styl=
e=3D"font-size:11pt;background-color:transparent;font-variant-numeric:norma=
l;font-variant-east-asian:normal;font-variant-alternates:normal;text-decora=
tion-line:underline;vertical-align:baseline">https://zoom.us/j/97762397148?=
pwd=3D1xk0iC9hp9SjEonaTaONwTb6iWry4Eb.1</span></a><span style=3D"font-size:=
11pt;background-color:transparent;font-variant-numeric:normal;font-variant-=
east-asian:normal;font-variant-alternates:normal;vertical-align:baseline">)=
</span></p></li></ul><br><p dir=3D"ltr" style=3D"line-height:1.38;margin-to=
p:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-family:Arial,sa=
ns-serif;color:rgb(0,0,0);background-color:transparent;font-variant-numeric=
:normal;font-variant-east-asian:normal;font-variant-alternates:normal;verti=
cal-align:baseline">Project data dashboard: </span><a href=3D"https://dashb=
oard.yoctoproject.org/" style=3D"text-decoration-line:none" target=3D"_blan=
k"><span style=3D"font-size:11pt;font-family:Arial,sans-serif;background-co=
lor:transparent;font-variant-numeric:normal;font-variant-east-asian:normal;=
font-variant-alternates:normal;text-decoration-line:underline;vertical-alig=
n:baseline">https://dashboard.yoctoproject.org/</span></a><span style=3D"fo=
nt-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-color=
:transparent;font-variant-numeric:normal;font-variant-east-asian:normal;fon=
t-variant-alternates:normal;vertical-align:baseline">=C2=A0</span></p><br><=
p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><=
span style=3D"font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);=
background-color:transparent;font-variant-numeric:normal;font-variant-east-=
asian:normal;font-variant-alternates:normal;vertical-align:baseline">Key St=
atus/Updates:</span></p><ul style=3D"margin-top:0px;margin-bottom:0px"><li =
dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-family:Arial,=
sans-serif;color:rgb(0,0,0);background-color:transparent;font-variant-numer=
ic:normal;font-variant-east-asian:normal;font-variant-alternates:normal;ver=
tical-align:baseline;white-space:pre-wrap"><p dir=3D"ltr" style=3D"line-hei=
ght:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span styl=
e=3D"font-size:11pt;background-color:transparent;font-variant-numeric:norma=
l;font-variant-east-asian:normal;font-variant-alternates:normal;vertical-al=
ign:baseline">YP 5.0.15 is under review.</span></p></li><li dir=3D"ltr" sty=
le=3D"list-style-type:disc;font-size:11pt;font-family:Arial,sans-serif;colo=
r:rgb(0,0,0);background-color:transparent;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-variant-alternates:normal;vertical-align:bas=
eline;white-space:pre-wrap"><p dir=3D"ltr" style=3D"line-height:1.38;margin=
-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"font-size:=
11pt;background-color:transparent;font-variant-numeric:normal;font-variant-=
east-asian:normal;font-variant-alternates:normal;vertical-align:baseline">Y=
P 5.3.1 is in QA</span></p></li><li dir=3D"ltr" style=3D"list-style-type:di=
sc;font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-=
color:transparent;font-variant-numeric:normal;font-variant-east-asian:norma=
l;font-variant-alternates:normal;vertical-align:baseline;white-space:pre-wr=
ap"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0=
pt" role=3D"presentation"><span style=3D"font-size:11pt;background-color:tr=
ansparent;font-variant-numeric:normal;font-variant-east-asian:normal;font-v=
ariant-alternates:normal;vertical-align:baseline">YP 6.0 M1 will build when=
 the 5 open high bugs are resolved.</span></p></li><li dir=3D"ltr" style=3D=
"list-style-type:disc;font-size:11pt;font-family:Arial,sans-serif;color:rgb=
(0,0,0);background-color:transparent;font-variant-numeric:normal;font-varia=
nt-east-asian:normal;font-variant-alternates:normal;vertical-align:baseline=
;white-space:pre-wrap"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:=
0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"font-size:11pt;=
background-color:transparent;font-variant-numeric:normal;font-variant-east-=
asian:normal;font-variant-alternates:normal;vertical-align:baseline">There =
are also 4 high bugs open for 6.0 M2.</span></p></li><li dir=3D"ltr" style=
=3D"list-style-type:disc;font-size:11pt;font-family:Arial,sans-serif;color:=
rgb(0,0,0);background-color:transparent;font-variant-numeric:normal;font-va=
riant-east-asian:normal;font-variant-alternates:normal;vertical-align:basel=
ine;white-space:pre-wrap"><p dir=3D"ltr" style=3D"line-height:1.38;margin-t=
op:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"font-size:11=
pt;background-color:transparent;font-variant-numeric:normal;font-variant-ea=
st-asian:normal;font-variant-alternates:normal;vertical-align:baseline">We =
are seeing multiple serious issues blocking 6.0 M1 from building:</span></p=
></li><ul style=3D"margin-top:0px;margin-bottom:0px"><li dir=3D"ltr" style=
=3D"list-style-type:circle;font-size:11pt;font-family:Arial,sans-serif;colo=
r:rgb(0,0,0);background-color:transparent;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-variant-alternates:normal;vertical-align:bas=
eline;white-space:pre-wrap"><p dir=3D"ltr" style=3D"line-height:1.38;margin=
-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"font-size:=
11pt;background-color:transparent;font-variant-numeric:normal;font-variant-=
east-asian:normal;font-variant-alternates:normal;vertical-align:baseline">A=
 glibc test causing builds to hang (a buffer overflow SIGABRT in unfs3 trig=
gered by host compiler + fortify source) (#16113)</span></p></li><li dir=3D=
"ltr" style=3D"list-style-type:circle;font-size:11pt;font-family:Arial,sans=
-serif;color:rgb(0,0,0);background-color:transparent;font-variant-numeric:n=
ormal;font-variant-east-asian:normal;font-variant-alternates:normal;vertica=
l-align:baseline;white-space:pre-wrap"><p dir=3D"ltr" style=3D"line-height:=
1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D=
"font-size:11pt;background-color:transparent;font-variant-numeric:normal;fo=
nt-variant-east-asian:normal;font-variant-alternates:normal;vertical-align:=
baseline">Hangs of the autobuilder controller (database locking, should be =
fixed) (#16129)</span></p></li><li dir=3D"ltr" style=3D"list-style-type:cir=
cle;font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background=
-color:transparent;font-variant-numeric:normal;font-variant-east-asian:norm=
al;font-variant-alternates:normal;vertical-align:baseline;white-space:pre-w=
rap"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:=
0pt" role=3D"presentation"><span style=3D"font-size:11pt;background-color:t=
ransparent;font-variant-numeric:normal;font-variant-east-asian:normal;font-=
variant-alternates:normal;vertical-align:baseline">Issues with a CVE patch =
applied to tar in rocky9/alma9/centos-stream using the openat2 syscall whic=
h pseudo doesn=E2=80=99t wrap (#16117)</span></p></li><li dir=3D"ltr" style=
=3D"list-style-type:circle;font-size:11pt;font-family:Arial,sans-serif;colo=
r:rgb(0,0,0);background-color:transparent;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-variant-alternates:normal;vertical-align:bas=
eline;white-space:pre-wrap"><p dir=3D"ltr" style=3D"line-height:1.38;margin=
-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"font-size:=
11pt;background-color:transparent;font-variant-numeric:normal;font-variant-=
east-asian:normal;font-variant-alternates:normal;vertical-align:baseline">I=
ssues reusing binaries from fedora 43 (and maybe ubuntu 25.10) on older sys=
tems (patchelf triggered?) (#16074, #16087)</span></p></li><li dir=3D"ltr" =
style=3D"list-style-type:circle;font-size:11pt;font-family:Arial,sans-serif=
;color:rgb(0,0,0);background-color:transparent;font-variant-numeric:normal;=
font-variant-east-asian:normal;font-variant-alternates:normal;vertical-alig=
n:baseline;white-space:pre-wrap"><p dir=3D"ltr" style=3D"line-height:1.38;m=
argin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"font-=
size:11pt;background-color:transparent;font-variant-numeric:normal;font-var=
iant-east-asian:normal;font-variant-alternates:normal;vertical-align:baseli=
ne">still need to disable the npm fetcher (#16105)</span></p></li></ul><li =
dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-family:Arial,=
sans-serif;color:rgb(0,0,0);background-color:transparent;font-variant-numer=
ic:normal;font-variant-east-asian:normal;font-variant-alternates:normal;ver=
tical-align:baseline;white-space:pre-wrap"><p dir=3D"ltr" style=3D"line-hei=
ght:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span styl=
e=3D"font-size:11pt;background-color:transparent;font-variant-numeric:norma=
l;font-variant-east-asian:normal;font-variant-alternates:normal;vertical-al=
ign:baseline">We have not had this number of high bugs blocking releases in=
 several years</span></p></li><li dir=3D"ltr" style=3D"list-style-type:disc=
;font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-co=
lor:transparent;font-variant-numeric:normal;font-variant-east-asian:normal;=
font-variant-alternates:normal;vertical-align:baseline;white-space:pre-wrap=
"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt=
" role=3D"presentation"><span style=3D"font-size:11pt;background-color:tran=
sparent;font-variant-numeric:normal;font-variant-east-asian:normal;font-var=
iant-alternates:normal;vertical-align:baseline">The number of intermittent =
failures affecting stable release builds is becoming problematic. Any given=
 build is now statistically likely to hit one or more of them and we don=E2=
=80=99t have successful builds. Since we struggle to get help in addressing=
 these, we need to change and start potentially blocking releases (includin=
g stable/LTS) until these get addressed in some way. We plan to form a dedi=
cated team to investigate these and find ways of removing the failures from=
 our builds which may include reducing testing.</span></p></li><li dir=3D"l=
tr" style=3D"list-style-type:disc;font-size:11pt;font-family:Arial,sans-ser=
if;color:rgb(0,0,0);background-color:transparent;font-variant-numeric:norma=
l;font-variant-east-asian:normal;font-variant-alternates:normal;vertical-al=
ign:baseline;white-space:pre-wrap"><p dir=3D"ltr" style=3D"line-height:1.38=
;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"fon=
t-size:11pt;background-color:transparent;font-variant-numeric:normal;font-v=
ariant-east-asian:normal;font-variant-alternates:normal;vertical-align:base=
line">To be clear, due to the problems above, most patch testing is now sta=
lled as the autobuilder is currently inoperable and we can=E2=80=99t test a=
nything.</span></p></li><li dir=3D"ltr" style=3D"list-style-type:disc;font-=
size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-color:tr=
ansparent;font-variant-numeric:normal;font-variant-east-asian:normal;font-v=
ariant-alternates:normal;vertical-align:baseline;white-space:pre-wrap"><p d=
ir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=
=3D"presentation"><span style=3D"font-size:11pt;background-color:transparen=
t;font-variant-numeric:normal;font-variant-east-asian:normal;font-variant-a=
lternates:normal;vertical-align:baseline">The project is exploring the idea=
 of applying for funding for security related work. If anyone (individual o=
r consultancies) has ideas, please talk to Paul/Richard/TSC. This is an opp=
ortunity to work on those issues you never have time/funding for!</span></p=
></li></ul><br><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;marg=
in-bottom:0pt"><span style=3D"font-size:11pt;font-family:Arial,sans-serif;c=
olor:rgb(0,0,0);background-color:transparent;font-variant-numeric:normal;fo=
nt-variant-east-asian:normal;font-variant-alternates:normal;vertical-align:=
baseline">Want to contribute? We would appreciate help with the following a=
reas:</span></p><ul style=3D"margin-top:0px;margin-bottom:0px"><li dir=3D"l=
tr" style=3D"list-style-type:disc;font-size:11pt;font-family:Arial,sans-ser=
if;color:rgb(0,0,0);background-color:transparent;font-variant-numeric:norma=
l;font-variant-east-asian:normal;font-variant-alternates:normal;vertical-al=
ign:baseline;white-space:pre-wrap"><p dir=3D"ltr" style=3D"line-height:1.38=
;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"fon=
t-size:11pt;background-color:transparent;font-variant-numeric:normal;font-v=
ariant-east-asian:normal;font-variant-alternates:normal;vertical-align:base=
line">We have several open issues for pseudo and limited maintainer time to=
 work on them. Help from someone familiar with systems programming in C wou=
ld be greatly appreciated. </span><a href=3D"https://bugzilla.yoctoproject.=
org/buglist.cgi?list_id=3D661406&amp;priority=3DHigh&amp;priority=3DMedium%=
2B&amp;product=3DPseudo&amp;query_format=3Dadvanced&amp;resolution=3D---" s=
tyle=3D"text-decoration-line:none" target=3D"_blank"><span style=3D"font-si=
ze:11pt;background-color:transparent;font-variant-numeric:normal;font-varia=
nt-east-asian:normal;font-variant-alternates:normal;text-decoration-line:un=
derline;vertical-align:baseline">https://bugzilla.yoctoproject.org/buglist.=
cgi?list_id=3D661406&amp;priority=3DHigh&amp;priority=3DMedium%2B&amp;produ=
ct=3DPseudo&amp;query_format=3Dadvanced&amp;resolution=3D---</span></a></p>=
</li><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-fami=
ly:Arial,sans-serif;color:rgb(0,0,0);background-color:transparent;font-vari=
ant-numeric:normal;font-variant-east-asian:normal;font-variant-alternates:n=
ormal;vertical-align:baseline;white-space:pre-wrap"><p dir=3D"ltr" style=3D=
"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><=
span style=3D"font-size:11pt;background-color:transparent;font-variant-nume=
ric:normal;font-variant-east-asian:normal;font-variant-alternates:normal;ve=
rtical-align:baseline">There are a large number of intermittent failures on=
 our autobuilder, any help with investigating, reproducing or solving these=
 issues would be welcome! </span><a href=3D"https://valkyrie.yocto.io/pub/n=
on-release/abint/" style=3D"text-decoration-line:none" target=3D"_blank"><s=
pan style=3D"font-size:11pt;background-color:transparent;font-variant-numer=
ic:normal;font-variant-east-asian:normal;font-variant-alternates:normal;tex=
t-decoration-line:underline;vertical-align:baseline">https://valkyrie.yocto=
.io/pub/non-release/abint/</span></a></p></li><li dir=3D"ltr" style=3D"list=
-style-type:disc;font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,=
0);background-color:transparent;font-variant-numeric:normal;font-variant-ea=
st-asian:normal;font-variant-alternates:normal;vertical-align:baseline;whit=
e-space:pre-wrap"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;m=
argin-bottom:0pt" role=3D"presentation"><span style=3D"font-size:11pt;backg=
round-color:transparent;font-variant-numeric:normal;font-variant-east-asian=
:normal;font-variant-alternates:normal;vertical-align:baseline">Many recipe=
s in openembedded-core would benefit from a new recipe maintainer. Please l=
ook at </span><a href=3D"https://git.openembedded.org/openembedded-core/tre=
e/meta/conf/distro/include/maintainers.inc" style=3D"text-decoration-line:n=
one" target=3D"_blank"><span style=3D"font-size:11pt;background-color:trans=
parent;font-variant-numeric:normal;font-variant-east-asian:normal;font-vari=
ant-alternates:normal;text-decoration-line:underline;vertical-align:baselin=
e">https://git.openembedded.org/openembedded-core/tree/meta/conf/distro/inc=
lude/maintainers.inc</span></a><span style=3D"font-size:11pt;background-col=
or:transparent;font-variant-numeric:normal;font-variant-east-asian:normal;f=
ont-variant-alternates:normal;vertical-align:baseline"> and see if you can =
adopt any of the unassigned recipes.</span></p></li><li dir=3D"ltr" style=
=3D"list-style-type:disc;font-size:11pt;font-family:Arial,sans-serif;color:=
rgb(0,0,0);background-color:transparent;font-variant-numeric:normal;font-va=
riant-east-asian:normal;font-variant-alternates:normal;vertical-align:basel=
ine;white-space:pre-wrap"><p dir=3D"ltr" style=3D"line-height:1.38;margin-t=
op:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"font-size:11=
pt;background-color:transparent;font-variant-numeric:normal;font-variant-ea=
st-asian:normal;font-variant-alternates:normal;vertical-align:baseline">For=
 more ways to contribute, see </span><a href=3D"https://docs.google.com/doc=
ument/d/18oxKWxLorfF813h82mK6yKTIHeBp_-9owFuCWbzgjOk/edit?usp=3Dsharing" st=
yle=3D"text-decoration-line:none" target=3D"_blank"><span style=3D"font-siz=
e:11pt;background-color:transparent;font-variant-numeric:normal;font-varian=
t-east-asian:normal;font-variant-alternates:normal;text-decoration-line:und=
erline;vertical-align:baseline">https://docs.google.com/document/d/18oxKWxL=
orfF813h82mK6yKTIHeBp_-9owFuCWbzgjOk/edit?usp=3Dsharing</span></a></p></li>=
</ul><br><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bot=
tom:0pt"><span style=3D"font-size:11pt;font-family:Arial,sans-serif;color:r=
gb(0,0,0);background-color:transparent;font-variant-numeric:normal;font-var=
iant-east-asian:normal;font-variant-alternates:normal;vertical-align:baseli=
ne">New to the project?</span></p><ul style=3D"margin-top:0px;margin-bottom=
:0px"><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-fam=
ily:Arial,sans-serif;color:rgb(0,0,0);background-color:transparent;font-var=
iant-numeric:normal;font-variant-east-asian:normal;font-variant-alternates:=
normal;vertical-align:baseline;white-space:pre-wrap"><p dir=3D"ltr" style=
=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation=
"><span style=3D"font-size:11pt;background-color:transparent;font-variant-n=
umeric:normal;font-variant-east-asian:normal;font-variant-alternates:normal=
;vertical-align:baseline">We have a list of issues we think are good places=
 to start contributing: </span><a href=3D"https://bugzilla.yoctoproject.org=
/buglist.cgi?quicksearch=3DNEWCOMER" style=3D"text-decoration-line:none" ta=
rget=3D"_blank"><span style=3D"font-size:11pt;background-color:transparent;=
font-variant-numeric:normal;font-variant-east-asian:normal;font-variant-alt=
ernates:normal;text-decoration-line:underline;vertical-align:baseline">http=
s://bugzilla.yoctoproject.org/buglist.cgi?quicksearch=3DNEWCOMER</span></a>=
</p></li></ul><br><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;m=
argin-bottom:0pt"><span style=3D"font-size:11pt;font-family:Arial,sans-seri=
f;color:rgb(0,0,0);background-color:transparent;font-variant-numeric:normal=
;font-variant-east-asian:normal;font-variant-alternates:normal;vertical-ali=
gn:baseline">Tracking Metrics:</span></p><ul style=3D"margin-top:0px;margin=
-bottom:0px"><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;f=
ont-family:Arial,sans-serif;color:rgb(0,0,0);background-color:transparent;f=
ont-variant-numeric:normal;font-variant-east-asian:normal;font-variant-alte=
rnates:normal;vertical-align:baseline;white-space:pre-wrap"><p dir=3D"ltr" =
style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"present=
ation"><span style=3D"font-size:11pt;background-color:transparent;font-vari=
ant-numeric:normal;font-variant-east-asian:normal;font-variant-alternates:n=
ormal;vertical-align:baseline">WDD 3026 (last week 3011) </span><span style=
=3D"font-size:11pt;font-family:Consolas,sans-serif;background-color:transpa=
rent;font-variant-numeric:normal;font-variant-east-asian:normal;font-varian=
t-alternates:normal;vertical-align:baseline">(</span><a href=3D"https://wik=
i.yoctoproject.org/charts/combo.html" style=3D"text-decoration-line:none" t=
arget=3D"_blank"><span style=3D"font-size:11pt;background-color:transparent=
;font-variant-numeric:normal;font-variant-east-asian:normal;font-variant-al=
ternates:normal;text-decoration-line:underline;vertical-align:baseline">htt=
ps://wiki.yoctoproject.org/charts/combo.html</span></a><span style=3D"font-=
size:11pt;font-family:Consolas,sans-serif;background-color:transparent;font=
-variant-numeric:normal;font-variant-east-asian:normal;font-variant-alterna=
tes:normal;vertical-align:baseline">)</span></p></li><li dir=3D"ltr" style=
=3D"list-style-type:disc;font-size:11pt;font-family:Consolas,sans-serif;col=
or:rgb(0,0,0);background-color:transparent;font-variant-numeric:normal;font=
-variant-east-asian:normal;font-variant-alternates:normal;vertical-align:ba=
seline;white-space:pre-wrap"><p dir=3D"ltr" style=3D"line-height:1.38;margi=
n-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"font-size=
:11pt;font-family:Arial,sans-serif;background-color:transparent;font-varian=
t-numeric:normal;font-variant-east-asian:normal;font-variant-alternates:nor=
mal;vertical-align:baseline">OE-Core/Poky Patch Metrics</span></p></li><ul =
style=3D"margin-top:0px;margin-bottom:0px"><li dir=3D"ltr" style=3D"list-st=
yle-type:circle;font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0=
);background-color:transparent;font-variant-numeric:normal;font-variant-eas=
t-asian:normal;font-variant-alternates:normal;vertical-align:baseline;white=
-space:pre-wrap"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;ma=
rgin-bottom:0pt" role=3D"presentation"><span style=3D"font-size:11pt;backgr=
ound-color:transparent;font-variant-numeric:normal;font-variant-east-asian:=
normal;font-variant-alternates:normal;vertical-align:baseline">Total patche=
s found: 1089 (last week 1092)</span></p></li><li dir=3D"ltr" style=3D"list=
-style-type:circle;font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,=
0,0);background-color:transparent;font-variant-numeric:normal;font-variant-=
east-asian:normal;font-variant-alternates:normal;vertical-align:baseline;wh=
ite-space:pre-wrap"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt=
;margin-bottom:0pt" role=3D"presentation"><span style=3D"font-size:11pt;bac=
kground-color:transparent;font-variant-numeric:normal;font-variant-east-asi=
an:normal;font-variant-alternates:normal;vertical-align:baseline">Patches i=
n the Pending State: 151 (14%) [last week 151 (14%)]</span></p></li><li dir=
=3D"ltr" style=3D"list-style-type:circle;font-size:11pt;font-family:Consola=
s,sans-serif;color:rgb(0,0,0);background-color:transparent;font-variant-num=
eric:normal;font-variant-east-asian:normal;font-variant-alternates:normal;v=
ertical-align:baseline;white-space:pre-wrap"><p dir=3D"ltr" style=3D"line-h=
eight:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><a href=
=3D"https://autobuilder.yocto.io/pub/non-release/patchmetrics/" style=3D"te=
xt-decoration-line:none" target=3D"_blank"><span style=3D"font-size:11pt;fo=
nt-family:Arial,sans-serif;background-color:transparent;font-variant-numeri=
c:normal;font-variant-east-asian:normal;font-variant-alternates:normal;text=
-decoration-line:underline;vertical-align:baseline">https://autobuilder.yoc=
to.io/pub/non-release/patchmetrics/</span></a></p></li></ul></ul><br><p dir=
=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span =
style=3D"font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);backg=
round-color:transparent;font-variant-numeric:normal;font-variant-east-asian=
:normal;font-variant-alternates:normal;vertical-align:baseline">YP 6.0 Mile=
stone Dates:</span></p><ul style=3D"margin-top:0px;margin-bottom:0px"><li d=
ir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-family:Arial,s=
ans-serif;color:rgb(0,0,0);background-color:transparent;font-variant-numeri=
c:normal;font-variant-east-asian:normal;font-variant-alternates:normal;vert=
ical-align:baseline;white-space:pre-wrap"><p dir=3D"ltr" style=3D"line-heig=
ht:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=
=3D"font-size:11pt;background-color:transparent;font-variant-numeric:normal=
;font-variant-east-asian:normal;font-variant-alternates:normal;vertical-ali=
gn:baseline">YP 6.0 M1 Build Date 2026-01-05</span></p></li><li dir=3D"ltr"=
 style=3D"list-style-type:disc;font-size:11pt;font-family:Arial,sans-serif;=
color:rgb(0,0,0);background-color:transparent;font-variant-numeric:normal;f=
ont-variant-east-asian:normal;font-variant-alternates:normal;vertical-align=
:baseline;white-space:pre-wrap"><p dir=3D"ltr" style=3D"line-height:1.38;ma=
rgin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"font-s=
ize:11pt;background-color:transparent;font-variant-numeric:normal;font-vari=
ant-east-asian:normal;font-variant-alternates:normal;vertical-align:baselin=
e">YP 6.0 M1 Release Date 2026-01-16</span></p></li><li dir=3D"ltr" style=
=3D"list-style-type:disc;font-size:11pt;font-family:Arial,sans-serif;color:=
rgb(0,0,0);background-color:transparent;font-variant-numeric:normal;font-va=
riant-east-asian:normal;font-variant-alternates:normal;vertical-align:basel=
ine;white-space:pre-wrap"><p dir=3D"ltr" style=3D"line-height:1.38;margin-t=
op:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"font-size:11=
pt;background-color:transparent;font-variant-numeric:normal;font-variant-ea=
st-asian:normal;font-variant-alternates:normal;vertical-align:baseline">YP =
6.0 M2 Build Date 2026-02-02</span></p></li><li dir=3D"ltr" style=3D"list-s=
tyle-type:disc;font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0)=
;background-color:transparent;font-variant-numeric:normal;font-variant-east=
-asian:normal;font-variant-alternates:normal;vertical-align:baseline;white-=
space:pre-wrap"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;mar=
gin-bottom:0pt" role=3D"presentation"><span style=3D"font-size:11pt;backgro=
und-color:transparent;font-variant-numeric:normal;font-variant-east-asian:n=
ormal;font-variant-alternates:normal;vertical-align:baseline">YP 6.0 M2 Rel=
ease Date 2026-02-13</span></p></li><li dir=3D"ltr" style=3D"list-style-typ=
e:disc;font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);backgro=
und-color:transparent;font-variant-numeric:normal;font-variant-east-asian:n=
ormal;font-variant-alternates:normal;vertical-align:baseline;white-space:pr=
e-wrap"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bott=
om:0pt" role=3D"presentation"><span style=3D"font-size:11pt;background-colo=
r:transparent;font-variant-numeric:normal;font-variant-east-asian:normal;fo=
nt-variant-alternates:normal;vertical-align:baseline">YP 6.0 M3 Build Date =
2026-03-02</span></p></li><li dir=3D"ltr" style=3D"list-style-type:disc;fon=
t-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-color:=
transparent;font-variant-numeric:normal;font-variant-east-asian:normal;font=
-variant-alternates:normal;vertical-align:baseline;white-space:pre-wrap"><p=
 dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" ro=
le=3D"presentation"><span style=3D"font-size:11pt;background-color:transpar=
ent;font-variant-numeric:normal;font-variant-east-asian:normal;font-variant=
-alternates:normal;vertical-align:baseline">YP 6.0 M3 Release Date 2026-03-=
13</span></p></li><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:1=
1pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-color:transpar=
ent;font-variant-numeric:normal;font-variant-east-asian:normal;font-variant=
-alternates:normal;vertical-align:baseline;white-space:pre-wrap"><p dir=3D"=
ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"pr=
esentation"><span style=3D"font-size:11pt;background-color:transparent;font=
-variant-numeric:normal;font-variant-east-asian:normal;font-variant-alterna=
tes:normal;vertical-align:baseline">YP 6.0 M4 Build Date 2026-03-30</span><=
/p></li><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-f=
amily:Arial,sans-serif;color:rgb(0,0,0);background-color:transparent;font-v=
ariant-numeric:normal;font-variant-east-asian:normal;font-variant-alternate=
s:normal;vertical-align:baseline;white-space:pre-wrap"><p dir=3D"ltr" style=
=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation=
"><span style=3D"font-size:11pt;background-color:transparent;font-variant-n=
umeric:normal;font-variant-east-asian:normal;font-variant-alternates:normal=
;vertical-align:baseline">YP 6.0 M4 Release Date 2026-04-26</span></p></li>=
</ul><br><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bot=
tom:0pt"><span style=3D"font-size:11pt;font-family:Arial,sans-serif;color:r=
gb(0,0,0);background-color:transparent;font-variant-numeric:normal;font-var=
iant-east-asian:normal;font-variant-alternates:normal;vertical-align:baseli=
ne">Upcoming dot releases:.</span></p><ul style=3D"margin-top:0px;margin-bo=
ttom:0px"><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font=
-family:Arial,sans-serif;color:rgb(0,0,0);background-color:transparent;font=
-variant-numeric:normal;font-variant-east-asian:normal;font-variant-alterna=
tes:normal;vertical-align:baseline;white-space:pre-wrap"><p dir=3D"ltr" sty=
le=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentati=
on"><span style=3D"font-size:11pt;background-color:transparent;font-variant=
-numeric:normal;font-variant-east-asian:normal;font-variant-alternates:norm=
al;vertical-align:baseline">YP 5.0.15 is under review.</span></p></li><li d=
ir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-family:Arial,s=
ans-serif;color:rgb(0,0,0);background-color:transparent;font-variant-numeri=
c:normal;font-variant-east-asian:normal;font-variant-alternates:normal;vert=
ical-align:baseline;white-space:pre-wrap"><p dir=3D"ltr" style=3D"line-heig=
ht:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=
=3D"font-size:11pt;background-color:transparent;font-variant-numeric:normal=
;font-variant-east-asian:normal;font-variant-alternates:normal;vertical-ali=
gn:baseline">YP 5.3.1 is in QA.</span></p></li><li dir=3D"ltr" style=3D"lis=
t-style-type:disc;font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0=
,0);background-color:transparent;font-variant-numeric:normal;font-variant-e=
ast-asian:normal;font-variant-alternates:normal;vertical-align:baseline;whi=
te-space:pre-wrap"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;=
margin-bottom:0pt" role=3D"presentation"><span style=3D"font-size:11pt;back=
ground-color:transparent;font-variant-numeric:normal;font-variant-east-asia=
n:normal;font-variant-alternates:normal;vertical-align:baseline">YP 4.0.33 =
Build Date 2026-01-26</span></p></li><li dir=3D"ltr" style=3D"list-style-ty=
pe:disc;font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);backgr=
ound-color:transparent;font-variant-numeric:normal;font-variant-east-asian:=
normal;font-variant-alternates:normal;vertical-align:baseline;white-space:p=
re-wrap"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bot=
tom:0pt" role=3D"presentation"><span style=3D"font-size:11pt;background-col=
or:transparent;font-variant-numeric:normal;font-variant-east-asian:normal;f=
ont-variant-alternates:normal;vertical-align:baseline">YP 4.0.33 Release Da=
te 2026-01-30</span></p></li></ul></span></div></div></blockquote><div><br>=
</div><div>Hello,</div><div><br></div><div>There is only 4 days between bui=
ld date and release date for 4.0.33.</div><div>That is far less than the us=
ual 11 days. isn&#39;t this a problem?</div><div><br></div><div>Regards,</d=
iv><div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div di=
r=3D"ltr"><div><span id=3D"m_8732553588448971748gmail-docs-internal-guid-ca=
f46895-7fff-6140-9743-0c651ba10604"><ul style=3D"margin-top:0px;margin-bott=
om:0px"><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-f=
amily:Arial,sans-serif;color:rgb(0,0,0);background-color:transparent;font-v=
ariant-numeric:normal;font-variant-east-asian:normal;font-variant-alternate=
s:normal;vertical-align:baseline;white-space:pre-wrap"><p dir=3D"ltr" style=
=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation=
"><span style=3D"font-size:11pt;background-color:transparent;font-variant-n=
umeric:normal;font-variant-east-asian:normal;font-variant-alternates:normal=
;vertical-align:baseline">YP 5.0.16 Build Date 2026-02-09</span></p></li><l=
i dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-family:Aria=
l,sans-serif;color:rgb(0,0,0);background-color:transparent;font-variant-num=
eric:normal;font-variant-east-asian:normal;font-variant-alternates:normal;v=
ertical-align:baseline;white-space:pre-wrap"><p dir=3D"ltr" style=3D"line-h=
eight:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span st=
yle=3D"font-size:11pt;background-color:transparent;font-variant-numeric:nor=
mal;font-variant-east-asian:normal;font-variant-alternates:normal;vertical-=
align:baseline">YP 5.0.16 Release Date 2026-02-20</span></p></li><li dir=3D=
"ltr" style=3D"list-style-type:disc;font-size:11pt;font-family:Arial,sans-s=
erif;color:rgb(0,0,0);background-color:transparent;font-variant-numeric:nor=
mal;font-variant-east-asian:normal;font-variant-alternates:normal;vertical-=
align:baseline;white-space:pre-wrap"><p dir=3D"ltr" style=3D"line-height:1.=
38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"f=
ont-size:11pt;background-color:transparent;font-variant-numeric:normal;font=
-variant-east-asian:normal;font-variant-alternates:normal;vertical-align:ba=
seline">YP 5.3.2 Build Date 2026-02-16</span></p></li><li dir=3D"ltr" style=
=3D"list-style-type:disc;font-size:11pt;font-family:Arial,sans-serif;color:=
rgb(0,0,0);background-color:transparent;font-variant-numeric:normal;font-va=
riant-east-asian:normal;font-variant-alternates:normal;vertical-align:basel=
ine;white-space:pre-wrap"><p dir=3D"ltr" style=3D"line-height:1.38;margin-t=
op:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"font-size:11=
pt;background-color:transparent;font-variant-numeric:normal;font-variant-ea=
st-asian:normal;font-variant-alternates:normal;vertical-align:baseline">YP =
5.3.2 Release Date 2026-02-27</span></p></li><li dir=3D"ltr" style=3D"list-=
style-type:disc;font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0=
);background-color:transparent;font-variant-numeric:normal;font-variant-eas=
t-asian:normal;font-variant-alternates:normal;vertical-align:baseline;white=
-space:pre-wrap"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;ma=
rgin-bottom:0pt" role=3D"presentation"><span style=3D"font-size:11pt;backgr=
ound-color:transparent;font-variant-numeric:normal;font-variant-east-asian:=
normal;font-variant-alternates:normal;vertical-align:baseline">YP 4.0.34 Bu=
ild Date 2026-02-23</span></p></li><li dir=3D"ltr" style=3D"list-style-type=
:disc;font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);backgrou=
nd-color:transparent;font-variant-numeric:normal;font-variant-east-asian:no=
rmal;font-variant-alternates:normal;vertical-align:baseline;white-space:pre=
-wrap"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-botto=
m:0pt" role=3D"presentation"><span style=3D"font-size:11pt;background-color=
:transparent;font-variant-numeric:normal;font-variant-east-asian:normal;fon=
t-variant-alternates:normal;vertical-align:baseline">YP 4.0.34 Release Date=
 2026-03-06</span></p></li><li dir=3D"ltr" style=3D"list-style-type:disc;fo=
nt-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-color=
:transparent;font-variant-numeric:normal;font-variant-east-asian:normal;fon=
t-variant-alternates:normal;vertical-align:baseline;white-space:pre-wrap"><=
p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" r=
ole=3D"presentation"><span style=3D"font-size:11pt;background-color:transpa=
rent;font-variant-numeric:normal;font-variant-east-asian:normal;font-varian=
t-alternates:normal;vertical-align:baseline">YP 5.3.3 Build Date 2026-03-09=
</span></p></li><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11p=
t;font-family:Arial,sans-serif;color:rgb(0,0,0);background-color:transparen=
t;font-variant-numeric:normal;font-variant-east-asian:normal;font-variant-a=
lternates:normal;vertical-align:baseline;white-space:pre-wrap"><p dir=3D"lt=
r" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"pres=
entation"><span style=3D"font-size:11pt;background-color:transparent;font-v=
ariant-numeric:normal;font-variant-east-asian:normal;font-variant-alternate=
s:normal;vertical-align:baseline">YP 5.3.3 Release Date 2026-03-20</span></=
p></li><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-fa=
mily:Arial,sans-serif;color:rgb(0,0,0);background-color:transparent;font-va=
riant-numeric:normal;font-variant-east-asian:normal;font-variant-alternates=
:normal;vertical-align:baseline;white-space:pre-wrap"><p dir=3D"ltr" style=
=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation=
"><span style=3D"font-size:11pt;background-color:transparent;font-variant-n=
umeric:normal;font-variant-east-asian:normal;font-variant-alternates:normal=
;vertical-align:baseline">YP 5.0.17 Build Date 2026-03-16</span></p></li><l=
i dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-family:Aria=
l,sans-serif;color:rgb(0,0,0);background-color:transparent;font-variant-num=
eric:normal;font-variant-east-asian:normal;font-variant-alternates:normal;v=
ertical-align:baseline;white-space:pre-wrap"><p dir=3D"ltr" style=3D"line-h=
eight:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span st=
yle=3D"font-size:11pt;background-color:transparent;font-variant-numeric:nor=
mal;font-variant-east-asian:normal;font-variant-alternates:normal;vertical-=
align:baseline">YP 5.0.17 Release Date 2026-03-23</span></p></li><li dir=3D=
"ltr" style=3D"list-style-type:disc;font-size:11pt;font-family:Arial,sans-s=
erif;color:rgb(0,0,0);background-color:transparent;font-variant-numeric:nor=
mal;font-variant-east-asian:normal;font-variant-alternates:normal;vertical-=
align:baseline;white-space:pre-wrap"><p dir=3D"ltr" style=3D"line-height:1.=
38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"f=
ont-size:11pt;background-color:transparent;font-variant-numeric:normal;font=
-variant-east-asian:normal;font-variant-alternates:normal;vertical-align:ba=
seline">YP 4.0.35 Build Date 2026-04-06</span></p></li><li dir=3D"ltr" styl=
e=3D"list-style-type:disc;font-size:11pt;font-family:Arial,sans-serif;color=
:rgb(0,0,0);background-color:transparent;font-variant-numeric:normal;font-v=
ariant-east-asian:normal;font-variant-alternates:normal;vertical-align:base=
line;white-space:pre-wrap"><p dir=3D"ltr" style=3D"line-height:1.38;margin-=
top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"font-size:1=
1pt;background-color:transparent;font-variant-numeric:normal;font-variant-e=
ast-asian:normal;font-variant-alternates:normal;vertical-align:baseline">YP=
 4.0.35 Release Date 2026-04-17</span></p></li><li dir=3D"ltr" style=3D"lis=
t-style-type:disc;font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0=
,0);background-color:transparent;font-variant-numeric:normal;font-variant-e=
ast-asian:normal;font-variant-alternates:normal;vertical-align:baseline;whi=
te-space:pre-wrap"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;=
margin-bottom:0pt" role=3D"presentation"><span style=3D"font-size:11pt;back=
ground-color:transparent;font-variant-numeric:normal;font-variant-east-asia=
n:normal;font-variant-alternates:normal;vertical-align:baseline">YP 5.3.4 B=
uild Date 2026-04-13</span></p></li><li dir=3D"ltr" style=3D"list-style-typ=
e:disc;font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);backgro=
und-color:transparent;font-variant-numeric:normal;font-variant-east-asian:n=
ormal;font-variant-alternates:normal;vertical-align:baseline;white-space:pr=
e-wrap"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bott=
om:0pt" role=3D"presentation"><span style=3D"font-size:11pt;background-colo=
r:transparent;font-variant-numeric:normal;font-variant-east-asian:normal;fo=
nt-variant-alternates:normal;vertical-align:baseline">YP 5.3.4 Release Date=
 2026-04-24</span></p></li><li dir=3D"ltr" style=3D"list-style-type:disc;fo=
nt-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-color=
:transparent;font-variant-numeric:normal;font-variant-east-asian:normal;fon=
t-variant-alternates:normal;vertical-align:baseline;white-space:pre-wrap"><=
p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" r=
ole=3D"presentation"><span style=3D"font-size:11pt;background-color:transpa=
rent;font-variant-numeric:normal;font-variant-east-asian:normal;font-varian=
t-alternates:normal;vertical-align:baseline">YP 5.0.18 Build Date 2026-04-2=
0</span></p></li><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11=
pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-color:transpare=
nt;font-variant-numeric:normal;font-variant-east-asian:normal;font-variant-=
alternates:normal;vertical-align:baseline;white-space:pre-wrap"><p dir=3D"l=
tr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"pre=
sentation"><span style=3D"font-size:11pt;background-color:transparent;font-=
variant-numeric:normal;font-variant-east-asian:normal;font-variant-alternat=
es:normal;vertical-align:baseline">YP 5.0.18 Release Date 2026-05-01</span>=
</p></li><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-=
family:Arial,sans-serif;color:rgb(0,0,0);background-color:transparent;font-=
variant-numeric:normal;font-variant-east-asian:normal;font-variant-alternat=
es:normal;vertical-align:baseline;white-space:pre-wrap"><p dir=3D"ltr" styl=
e=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentatio=
n"><span style=3D"font-size:11pt;background-color:transparent;font-variant-=
numeric:normal;font-variant-east-asian:normal;font-variant-alternates:norma=
l;vertical-align:baseline">YP 5.0.19 Build Date 2026-05-26</span></p></li><=
li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-family:Ari=
al,sans-serif;color:rgb(0,0,0);background-color:transparent;font-variant-nu=
meric:normal;font-variant-east-asian:normal;font-variant-alternates:normal;=
vertical-align:baseline;white-space:pre-wrap"><p dir=3D"ltr" style=3D"line-=
height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span s=
tyle=3D"font-size:11pt;background-color:transparent;font-variant-numeric:no=
rmal;font-variant-east-asian:normal;font-variant-alternates:normal;vertical=
-align:baseline">YP 5.0.19 Release Date 2026-06-05</span></p></li></ul><br>=
<p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt">=
<span style=3D"font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0)=
;background-color:transparent;font-variant-numeric:normal;font-variant-east=
-asian:normal;font-variant-alternates:normal;vertical-align:baseline">The Y=
octo Project=E2=80=99s technical governance is through its Technical Steeri=
ng Committee, more information is available at:</span></p><p dir=3D"ltr" st=
yle=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><a href=3D"https:=
//wiki.yoctoproject.org/wiki/TSC" style=3D"text-decoration-line:none" targe=
t=3D"_blank"><span style=3D"font-size:11pt;font-family:Arial,sans-serif;bac=
kground-color:transparent;font-variant-numeric:normal;font-variant-east-asi=
an:normal;font-variant-alternates:normal;text-decoration-line:underline;ver=
tical-align:baseline">https://wiki.yoctoproject.org/wiki/TSC</span></a></p>=
<br><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0=
pt"><span style=3D"font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,=
0,0);background-color:transparent;font-variant-numeric:normal;font-variant-=
east-asian:normal;font-variant-alternates:normal;vertical-align:baseline">T=
he Status reports are now stored on the wiki at: </span><a href=3D"https://=
wiki.yoctoproject.org/wiki/Weekly_Status" style=3D"text-decoration-line:non=
e" target=3D"_blank"><span style=3D"font-size:11pt;font-family:Arial,sans-s=
erif;background-color:transparent;font-variant-numeric:normal;font-variant-=
east-asian:normal;font-variant-alternates:normal;text-decoration-line:under=
line;vertical-align:baseline">https://wiki.yoctoproject.org/wiki/Weekly_Sta=
tus</span></a></p><br><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0=
pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-family:Arial,sans-=
serif;color:rgb(0,0,0);background-color:transparent;font-variant-numeric:no=
rmal;font-variant-east-asian:normal;font-variant-alternates:normal;vertical=
-align:baseline">[If anyone has suggestions for other information you=E2=80=
=99d like to see on this weekly status update, let us know!]</span></p></sp=
an><br></div><div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"ltr"><d=
iv dir=3D"ltr"><p class=3D"MsoNormal" style=3D"background-image:initial;bac=
kground-position:initial;background-repeat:initial"><span style=3D"font-siz=
e:12pt;font-family:Arial,sans-serif">Thanks,<span></span></span></p>

<p class=3D"MsoNormal" style=3D"background-image:initial;background-positio=
n:initial;background-repeat:initial"><span style=3D"font-size:12pt;font-fam=
ily:Arial,sans-serif">=C2=A0<span></span></span></p>

<p class=3D"MsoNormal" style=3D"background-image:initial;background-positio=
n:initial;background-repeat:initial"><b><i><span style=3D"font-size:16pt;co=
lor:purple">Stephen K. Jolley</span></i></b><span style=3D"font-size:12pt;f=
ont-family:Arial,sans-serif"><span></span></span></p>

<p class=3D"MsoNormal" style=3D"background-image:initial;background-positio=
n:initial;background-repeat:initial"><b><span style=3D"font-size:8pt;font-f=
amily:&quot;Courier New&quot;;color:blue">Yocto Project Program Manager</sp=
an></b></p>

<p class=3D"MsoNormal" style=3D"background-image:initial;background-positio=
n:initial;background-repeat:initial"><span style=3D"font-size:9pt;font-fami=
ly:Wingdings;color:black">(</span><span style=3D"font-size:9pt;font-family:=
&quot;MS Sans Serif&quot;,serif;color:teal">=C2=A0=C2=A0=C2=A0=C2=A0</span>=
<b><span style=3D"font-size:8pt;font-family:&quot;Comic Sans MS&quot;;color=
:teal">Cell</span></b><span style=3D"font-size:9pt;font-family:&quot;MS San=
s Serif&quot;,serif;color:teal">:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 </span><span style=3D"font=
-size:9pt;font-family:&quot;MS Sans Serif&quot;,serif">(208) 244-4460</span=
><span style=3D"font-size:12pt;font-family:Arial,sans-serif"><span></span><=
/span></p>

<p class=3D"MsoNormal" style=3D"background-image:initial;background-positio=
n:initial;background-repeat:initial"><span style=3D"font-size:9pt;font-fami=
ly:Wingdings">*=C2=A0</span><b><span lang=3D"FR" style=3D"font-size:8pt;fon=
t-family:&quot;Comic Sans MS&quot;;color:teal">Email</span></b><span lang=
=3D"FR" style=3D"font-size:9pt;font-family:&quot;MS Sans Serif&quot;,serif;=
color:teal">:</span><span lang=3D"FR" style=3D"font-size:9pt;font-family:&q=
uot;MS Sans Serif&quot;,serif">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0</span><u><span=
 lang=3D"FR" style=3D"font-size:9pt;font-family:&quot;MS Sans Serif&quot;,s=
erif;color:blue"><span style=3D"color:rgb(17,85,204)"><a href=3D"mailto:ste=
phen.k.jolley@intel.com" target=3D"_blank">s</a><a href=3D"mailto:jolley.yp=
.pm@gmail.com" target=3D"_blank">jolley.yp.pm@gmail.com</a></span></span></=
u></p></div></div></div></div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#229276): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/229276" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/229276</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/117245166/431=
6185" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/117245166/4316185</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:yoann.congal@smile.fr" tar=
get=3D"_blank">yoann.congal@smile.fr</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><br><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr"><font face=3D"Raleway, regular">Yoann Congal</font><div><fon=
t face=3D"Raleway, regular">Smile ECS</font></div></div></div></div>

--0000000000002c167806484802dd--

