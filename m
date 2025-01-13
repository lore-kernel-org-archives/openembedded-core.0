Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32AC7C02180
	for <webhook@archiver.kernel.org>; Mon, 13 Jan 2025 20:58:29 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web11.19787.1736782356166428196
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Jan 2025 07:32:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=B2kWTwYq;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.216.51, mailfrom: wminer@linuxfoundation.org)
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-2f441791e40so5870681a91.3
        for <openembedded-core@lists.openembedded.org>; Mon, 13 Jan 2025 07:32:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1736782355; x=1737387155; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jfHfsAXXHPYuJQY8c4R72iw8wTAgmIRJcAlbqawFcT4=;
        b=B2kWTwYq1PPiurKA+jWGLJHS1kJ5S0RKPqwWodV+ZVsOnSI7t9fyR8GjmWjgeRLVw7
         17TQlJfCoJiRAp0bGdscCFwUUG4I5EqP4lJW8xEDmcWeupV0/iEQYDhwjOLDp8Xhq1hx
         6BQQ3uyr3ooUN8WbLcZhS77QviuX7ankE8Jvg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736782355; x=1737387155;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jfHfsAXXHPYuJQY8c4R72iw8wTAgmIRJcAlbqawFcT4=;
        b=FNtGfr1eN9/z2KV9ohcVM+ldOJyDfh62qERxP+nwug/yTJw1Qk7EcC+36e3Ixon6eY
         07ObnGcuC/MPPiEfywRPuOtx0J2Y3eE6rE1F3K/xoInaKYpy/kzAO+W9xDHPtujEyN2K
         jUQ06IOMHjqq46K+3v4e3vBQgk2CcYQAEIg0T67Hg07SSpInGGAM0NdNj2d/1odlf0ES
         1y6mVLeS2wd60u86c/Rm6H61zvP72xPMLcXzYlGAf2T/HdKStHHxbljJUh6c+/fGKTHO
         mu8rbmCfgeu7r/m4qjzQ8QOFc4N5yVYKgCpHWxR6X5uWvI1cB7q5TVtiDm0JWYjoSNfA
         RZGg==
X-Forwarded-Encrypted: i=1; AJvYcCV/gZ1vSGfMmz81mdwWz8W7kI5gjoNBo09jVtOm2/7K6ygYmhy2BOeE45RgnUOGpc9HM41AjsvYHTOKCkFGpXgUcQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzhWrpAW3Zdg2lOPBTR/8dUOpeRHjF+JMnDA9vgVmYXd/xBLNRQ
	CmIpZHb8TOU9+I4sVPIYarT5a9NsaO/SsxelNYDLHZS9EAQfmZcXpabhmGngJxGxT9jo6t7uRxt
	SV1x1KyfZutv0JVxYeUHNy+ZmEVwQ8Tt4FR8eEg==
X-Gm-Gg: ASbGncvxvZCnmm4x7ouKUliJXwYUuwO+46R7FqzxQJKxb5nYyIhkY0jqd2kqqhLMd8j
	y+kCJWxV/4dZ+IO3ls4ZzJsKuRQQY/a2TU6zV1SYl6BQlM980CzJKN9VA/SrmmuIlPNgeDNIB
X-Google-Smtp-Source: AGHT+IEZs12ALNMXfL+8pCOP7YPnYhZmlZrAS2DXEsko29EOuPGrmojPFLgjPUaeMJkTmHANMZfMytnb1SwXE37ZDR4=
X-Received: by 2002:a17:90b:1f8a:b0:2ee:c9d8:d01a with SMTP id
 98e67ed59e1d1-2f548f33b54mr32172078a91.11.1736782354391; Mon, 13 Jan 2025
 07:32:34 -0800 (PST)
MIME-Version: 1.0
References: <CAK5yBb8dbPpVqDweeU0xsWAZ07k1x29MMtzvWWDtJesqinKE-g@mail.gmail.com>
In-Reply-To: <CAK5yBb8dbPpVqDweeU0xsWAZ07k1x29MMtzvWWDtJesqinKE-g@mail.gmail.com>
From: "Walt Miner" <wminer@linuxfoundation.org>
Date: Mon, 13 Jan 2025 10:32:16 -0500
X-Gm-Features: AbW1kvYLmE5xB1pYgEBnOOCC7u4oqqQsPcF6FMcsCs7Je7b86LP8-76o3YCWlow
Message-ID: <CAC_dYdrbwJPe8YQqvFpnpDU+Wq6NxMcj5sj2SSWRqao0zcZc0A@mail.gmail.com>
Subject: Re: [yocto-status] Yocto Project Status 7 Jan. 2025 (WW02)
To: yocto-status@lists.yoctoproject.org
Cc: Yocto-mailing-list <yocto@lists.yoctoproject.org>, 
	",openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000493f77062b98278c"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Jan 2025 20:58:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209760

--000000000000493f77062b98278c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

What is happening with the 5.0.6 release?

Walt Miner
AGL Community Manager
The Linux Foundation

Visit us at:
www.automotivegradelinux.org
lists.automotivelinux.org
www.linuxfoundation.org




On Tue, Jan 7, 2025 at 10:49=E2=80=AFAM Stephen Jolley via lists.yoctoproje=
ct.org <
sjolley.yp.pm=3Dgmail.com@lists.yoctoproject.org> wrote:

> Current Dev Position: YP 5.2 M2
>
> Next Deadline: YP 5.2 M2 Build date 2025-01-20
>
> Next Team Meetings:
>
>    -
>
>    Bug Triage meeting Thursday Jan. 9th at 7:30 am PST (
>    https://zoom.us/j/454367603?pwd=3DZGxoa2ZXL3FkM3Y0bFd5aVpHVVZ6dz09)
>    -
>
>    Weekly Project Engineering Sync Tuesday Jan. 7th at 8 am PST (
>    https://zoom.us/j/990892712?pwd=3DcHU1MjhoM2x6ck81bkcrYjRrcmJsUT09)
>    <https://zoom.us/j/990892712>
>    -
>
>    Twitch -  See https://www.twitch.tv/theyoctojester
>
>
> Key Status/Updates:
>
>    -
>
>    YP 5.2 M1 has two major QA issues, one for beaglebone and one for
>    beagleplay
>
> The issues are being investigated:
>
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D15703
>
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D15704
>
>    -
>
>    YP 5.0.6 is ready to be released
>    -
>
>    Feedback from Richard has now been given on the meta-clang merging
>    patches which are not ready yet. Development work is needed to move th=
is
>    forward, a copy and paste into core isn=E2=80=99t enough and it will n=
ot merge
>    without help from people.
>    -
>
>    There are discussions about how to implement =E2=80=9Cmanifest=E2=80=
=9D based fetchers
>    to handle cargo, go and npm amongst others. We need to solve this prob=
lem
>    in a way which everyone can work with but there is limited feedback or
>    involvement in the patch review. Help is needed here to get this right=
 and
>    solve the long standing problems with these forms of software.
>    -
>
>    Patches using config fragment and include_all are being worked on in
>    master-next for OE-Core.
>    -
>
>    There is a proposed fix for some native class extension handling code
>    bugs/issues however that fix creates new dependency problems and will
>    require wider metadata changes.
>    -
>
>    The 5.2 development plans are being developed in this document:
>    https://docs.google.com/document/d/1xsnN_HcaMhqg6Dn1P_19AnumDaUMQSdFZ_=
I4rjD830A/edit?usp=3Dsharing
>
> We need to continue to develop this, thanks to all who have contributed s=
o
> far!
>
> Ways to contribute:
>
>    -
>
>    As people are likely aware, the project has a number of components
>    which are either unmaintained, or have people with little to no time t=
rying
>    to keep them alive. These components include: devtool, toaster, wic, o=
eqa,
>    autobuilder, CROPs containers, pseudo and more. Many have open bugs. H=
elp
>    is welcome in trying to better look after these components!
>    -
>
>    There is an issue open upstream with the openssl project related to
>    making path relocation of openssl easier (as used in our buildtools ta=
rball
>    and SDK). We=E2=80=99d love assistance in moving this forward and gett=
ing some kind
>    of upstream feature merged to make this easier:
>    https://github.com/openssl/openssl/pull/19260
>    -
>
>    There are bugs identified as possible for newcomers to the project:
>    https://wiki.yoctoproject.org/wiki/Newcomers
>    -
>
>    There are bugs that are currently unassigned for YP 5.2. See:
>    https://wiki.yoctoproject.org/wiki/Bug_Triage#Medium+_5.2_Unassigned_E=
nhancements/Bugs
>    -
>
>    We=E2=80=99d welcome new maintainers for recipes in OE-Core. Please se=
e the
>    list at:
>    http://git.yoctoproject.org/cgit.cgi/poky/tree/meta/conf/distro/includ=
e/maintainers.inc
>    and discuss with the existing maintainer, or ask on the OE-Core mailin=
g
>    list. We will likely move a chunk of these to =E2=80=9CUnassigned=E2=
=80=9D soon to help
>    facilitate this.
>    -
>
>    Help is very much welcome in trying to resolve our autobuilder
>    intermittent issues. You can see the list of failures we=E2=80=99re co=
ntinuing to
>    see by searching for the =E2=80=9CAB-INT=E2=80=9D tag in bugzilla:
>    https://bugzilla.yoctoproject.org/buglist.cgi?quicksearch=3DAB-INT.
>    -
>
>    Help us resolve CVE issues: CVE metrics
>    <https://autobuilder.yocto.io/pub/non-release/patchmetrics/>
>    -
>
>    We have a growing number of bugs in bugzilla, any help with them is
>    appreciated.
>    -
>
>    Regarding bugs, even if you can=E2=80=99t fix a bug, submitting a fail=
ing test
>    case that can reproduce the issue significantly improves the chances i=
t
>    might get fixed.
>    -
>
>    Further help on optimizing build disk usage would be most welcome.
>
>
> Tracking Metrics:
>
>    -
>
>    WDD 2840 (last week 2845) (
>    https://wiki.yoctoproject.org/charts/combo.html)
>    -
>
>    OE-Core/Poky Patch Metrics
>    -
>
>       Total patches found: 1037 (last week 1046)
>       -
>
>       Patches in the Pending State: 174 (17%) [last week 175 (17%)]
>       -
>
>       https://autobuilder.yocto.io/pub/non-release/patchmetrics/
>
>
> YP 5.2 Milestone Dates:
>
>    -
>
>    YP 5.2 M1 in review.
>    -
>
>    YP 5.2 M2 Build Date 2025-01-20
>    -
>
>    YP 5.2 M2 Release Date 2025-01-31
>    -
>
>    YP 5.2 M3 Build Date 2025-03-03
>    -
>
>    YP 5.2 M3 Release Date 2025-03-14
>    -
>
>    YP 5.2 M4 Build Date 2025-03-31
>    -
>
>    YP 5.2 M4 Release Date 2025-04-25
>
>
> Upcoming dot releases:
>
>    -
>
>    YP 5.0.6 in review.
>    -
>
>    YP 4.0.24 Build Date 2025-01-06
>    -
>
>    YP 4.0.24 Release Date 2025-01-17
>    -
>
>    YP 5.1.2 Build Date 2025-01-13
>    -
>
>    YP 5.1.2 Release Date 2025-01-24
>    -
>
>    YP 5.0.7 Build Date 2025-01-27
>    -
>
>    YP 5.0.7 Release Date 2025-02-07
>    -
>
>    YP 4.0.25 Build Date 2025-02-17
>    -
>
>    YP 4.0.25 Release Date 2025-02-28
>    -
>
>    YP 5.1.3 Build Date 2025-02-24
>    -
>
>    YP 5.1.3 Release Date 2025-03-07
>    -
>
>    YP 5.0.8 Build Date 2025-03-10
>    -
>
>    YP 5.0.8 Release Date 2025-03-21
>    -
>
>    YP 5.1.4 Build Date 2025-03-24
>    -
>
>    YP 5.1.4 Release Date 2025-04-04
>    -
>
>    YP 4.0.26 Build Date 2025-04-07
>    -
>
>    YP 4.0.26 Release Date 2025-04-18
>    -
>
>    YP 5.0.9 Build Date 2025-04-21
>    -
>
>    YP 5.0.9 Release Date 2025-05-02
>    -
>
>    YP 4.0.27 Build Date 2025-05-19
>    -
>
>    YP 4.0.27 Release Date 2025-05-30
>    -
>
>    YP 5.0.10 Build Date 2025-06-02
>    -
>
>    YP 5.0.10 Release Date 2025-06-13
>    -
>
>    YP 4.0.28 Build Date 2025-06-30
>    -
>
>    YP 4.0.28 Release Date 2025-07-11
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
>=20
>
>

--000000000000493f77062b98278c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>What is happening with the 5.0.6 release? =C2=A0</div=
><div><br></div><div><div dir=3D"ltr" class=3D"gmail_signature" data-smartm=
ail=3D"gmail_signature"><div dir=3D"ltr"><div><div dir=3D"ltr"><div dir=3D"=
ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><d=
iv dir=3D"ltr"><div dir=3D"ltr"><span style=3D"color:rgb(136,136,136)">Walt=
 Miner</span></div><div dir=3D"ltr"><div style=3D"color:rgb(136,136,136)">A=
GL Community Manager</div><div style=3D"color:rgb(136,136,136)">The Linux F=
oundation<br></div><div style=3D"color:rgb(136,136,136)"><br></div><div sty=
le=3D"color:rgb(136,136,136)">Visit us at:</div><div style=3D"color:rgb(136=
,136,136)"><a href=3D"http://www.automotivegradelinux.org" target=3D"_blank=
">www.automotivegradelinux.org</a></div><div style=3D"color:rgb(136,136,136=
)"><a href=3D"http://lists.automotivelinux.org" target=3D"_blank">lists.aut=
omotivelinux.org</a></div><div style=3D"color:rgb(136,136,136)"><a href=3D"=
http://www.linuxfoundation.org" target=3D"_blank">www.linuxfoundation.org</=
a></div><div style=3D"color:rgb(136,136,136)"><br></div><div style=3D"color=
:rgb(136,136,136)"><br></div></div></div></div></div></div></div></div></di=
v></div></div></div></div><br></div><br><div class=3D"gmail_quote gmail_quo=
te_container"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jan 7, 2025 at =
10:49=E2=80=AFAM Stephen Jolley via <a href=3D"http://lists.yoctoproject.or=
g">lists.yoctoproject.org</a> &lt;<a href=3D"http://sjolley.yp.pm">sjolley.=
yp.pm</a>=3D<a href=3D"mailto:gmail.com@lists.yoctoproject.org">gmail.com@l=
ists.yoctoproject.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-st=
yle:solid;border-left-color:rgb(204,204,204);padding-left:1ex"><div dir=3D"=
ltr"><div><span id=3D"m_8833492395047191737gmail-docs-internal-guid-1928c2f=
1-7fff-816e-3f96-b7ffaf23fcf5"><p dir=3D"ltr" style=3D"line-height:1.38;mar=
gin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-family:Ar=
ial,sans-serif;color:rgb(0,0,0);background-color:transparent;font-variant-n=
umeric:normal;font-variant-east-asian:normal;font-variant-alternates:normal=
;vertical-align:baseline">Current Dev Position: YP 5.2 M2</span></p><p dir=
=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span =
style=3D"font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);backg=
round-color:transparent;font-variant-numeric:normal;font-variant-east-asian=
:normal;font-variant-alternates:normal;vertical-align:baseline">Next Deadli=
ne: YP 5.2 M2 Build date 2025-01-20</span></p><br><p dir=3D"ltr" style=3D"l=
ine-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:=
11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-color:transpa=
rent;font-variant-numeric:normal;font-variant-east-asian:normal;font-varian=
t-alternates:normal;vertical-align:baseline">Next Team Meetings:</span></p>=
<ul style=3D"margin-top:0px;margin-bottom:0px"><li dir=3D"ltr" style=3D"lis=
t-style-type:disc;font-size:9.5pt;font-family:Arial,sans-serif;color:rgb(0,=
0,0);background-color:transparent;font-variant-numeric:normal;font-variant-=
east-asian:normal;font-variant-alternates:normal;vertical-align:baseline;wh=
ite-space:pre-wrap"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt=
;margin-bottom:0pt" role=3D"presentation"><span style=3D"font-size:11pt;bac=
kground-color:transparent;font-variant-numeric:normal;font-variant-east-asi=
an:normal;font-variant-alternates:normal;vertical-align:baseline">Bug Triag=
e meeting Thursday Jan. 9th at 7:30 am PST (</span><a href=3D"https://zoom.=
us/j/454367603?pwd=3DZGxoa2ZXL3FkM3Y0bFd5aVpHVVZ6dz09" style=3D"text-decora=
tion:none" target=3D"_blank"><span style=3D"font-size:11pt;background-color=
:transparent;font-variant-numeric:normal;font-variant-east-asian:normal;fon=
t-variant-alternates:normal;text-decoration:underline;vertical-align:baseli=
ne">https://zoom.us/j/454367603?pwd=3DZGxoa2ZXL3FkM3Y0bFd5aVpHVVZ6dz09</spa=
n></a><span style=3D"font-size:11pt;background-color:transparent;font-varia=
nt-numeric:normal;font-variant-east-asian:normal;font-variant-alternates:no=
rmal;vertical-align:baseline">)</span></p></li><li dir=3D"ltr" style=3D"lis=
t-style-type:disc;font-size:9.5pt;font-family:Arial,sans-serif;color:rgb(0,=
0,0);background-color:transparent;font-variant-numeric:normal;font-variant-=
east-asian:normal;font-variant-alternates:normal;vertical-align:baseline;wh=
ite-space:pre-wrap"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt=
;margin-bottom:0pt" role=3D"presentation"><span style=3D"font-size:11pt;bac=
kground-color:transparent;font-variant-numeric:normal;font-variant-east-asi=
an:normal;font-variant-alternates:normal;vertical-align:baseline">Weekly Pr=
oject Engineering Sync Tuesday Jan. 7th at 8 am PST (</span><a href=3D"http=
s://zoom.us/j/990892712?pwd=3DcHU1MjhoM2x6ck81bkcrYjRrcmJsUT09" style=3D"te=
xt-decoration:none" target=3D"_blank"><span style=3D"font-size:11pt;backgro=
und-color:transparent;font-variant-numeric:normal;font-variant-east-asian:n=
ormal;font-variant-alternates:normal;text-decoration:underline;vertical-ali=
gn:baseline">https://zoom.us/j/990892712?pwd=3DcHU1MjhoM2x6ck81bkcrYjRrcmJs=
UT09</span></a><a href=3D"https://zoom.us/j/990892712" style=3D"text-decora=
tion:none" target=3D"_blank"><span style=3D"font-size:11pt;background-color=
:transparent;font-variant-numeric:normal;font-variant-east-asian:normal;fon=
t-variant-alternates:normal;text-decoration:underline;vertical-align:baseli=
ne">)</span></a></p></li><li dir=3D"ltr" style=3D"list-style-type:disc;font=
-size:9.5pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-color:=
transparent;font-variant-numeric:normal;font-variant-east-asian:normal;font=
-variant-alternates:normal;vertical-align:baseline;white-space:pre-wrap"><p=
 dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" ro=
le=3D"presentation"><span style=3D"font-size:11pt;background-color:transpar=
ent;font-variant-numeric:normal;font-variant-east-asian:normal;font-variant=
-alternates:normal;vertical-align:baseline">Twitch -=C2=A0 See </span><a hr=
ef=3D"https://www.twitch.tv/theyoctojester" style=3D"text-decoration:none" =
target=3D"_blank"><span style=3D"font-size:11pt;background-color:transparen=
t;font-variant-numeric:normal;font-variant-east-asian:normal;font-variant-a=
lternates:normal;text-decoration:underline;vertical-align:baseline">https:/=
/www.twitch.tv/theyoctojester</span></a><span style=3D"font-size:11pt;backg=
round-color:transparent;font-variant-numeric:normal;font-variant-east-asian=
:normal;font-variant-alternates:normal;vertical-align:baseline">=C2=A0</spa=
n></p></li></ul><br><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt=
;margin-bottom:0pt"><span style=3D"font-size:11pt;font-family:Arial,sans-se=
rif;color:rgb(0,0,0);background-color:transparent;font-variant-numeric:norm=
al;font-variant-east-asian:normal;font-variant-alternates:normal;vertical-a=
lign:baseline">Key Status/Updates:</span></p><ul style=3D"margin-top:0px;ma=
rgin-bottom:0px"><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11=
pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-color:transpare=
nt;font-variant-numeric:normal;font-variant-east-asian:normal;font-variant-=
alternates:normal;vertical-align:baseline;white-space:pre-wrap"><p dir=3D"l=
tr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"pre=
sentation"><span style=3D"font-size:11pt;background-color:transparent;font-=
variant-numeric:normal;font-variant-east-asian:normal;font-variant-alternat=
es:normal;vertical-align:baseline">YP 5.2 M1 has two major QA issues, one f=
or beaglebone and one for beagleplay</span></p></li></ul><p dir=3D"ltr" sty=
le=3D"line-height:1.38;margin-left:36pt;margin-top:0pt;margin-bottom:0pt"><=
span style=3D"font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);=
background-color:transparent;font-variant-numeric:normal;font-variant-east-=
asian:normal;font-variant-alternates:normal;vertical-align:baseline">The is=
sues are being investigated:</span></p><p dir=3D"ltr" style=3D"line-height:=
1.38;margin-left:36pt;margin-top:0pt;margin-bottom:0pt"><a href=3D"https://=
bugzilla.yoctoproject.org/show_bug.cgi?id=3D15703" style=3D"text-decoration=
:none" target=3D"_blank"><span style=3D"font-size:11pt;font-family:Arial,sa=
ns-serif;background-color:transparent;font-variant-numeric:normal;font-vari=
ant-east-asian:normal;font-variant-alternates:normal;text-decoration:underl=
ine;vertical-align:baseline">https://bugzilla.yoctoproject.org/show_bug.cgi=
?id=3D15703</span></a></p><p dir=3D"ltr" style=3D"line-height:1.38;margin-l=
eft:36pt;margin-top:0pt;margin-bottom:0pt"><a href=3D"https://bugzilla.yoct=
oproject.org/show_bug.cgi?id=3D15704" style=3D"text-decoration:none" target=
=3D"_blank"><span style=3D"font-size:11pt;font-family:Arial,sans-serif;back=
ground-color:transparent;font-variant-numeric:normal;font-variant-east-asia=
n:normal;font-variant-alternates:normal;text-decoration:underline;vertical-=
align:baseline">https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D15704</=
span></a></p><ul style=3D"margin-top:0px;margin-bottom:0px"><li dir=3D"ltr"=
 style=3D"list-style-type:disc;font-size:11pt;font-family:Arial,sans-serif;=
color:rgb(0,0,0);background-color:transparent;font-variant-numeric:normal;f=
ont-variant-east-asian:normal;font-variant-alternates:normal;vertical-align=
:baseline;white-space:pre-wrap"><p dir=3D"ltr" style=3D"line-height:1.38;ma=
rgin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"font-s=
ize:11pt;background-color:transparent;font-variant-numeric:normal;font-vari=
ant-east-asian:normal;font-variant-alternates:normal;vertical-align:baselin=
e">YP 5.0.6 is ready to be released</span></p></li><li dir=3D"ltr" style=3D=
"list-style-type:disc;font-size:11pt;font-family:Arial,sans-serif;color:rgb=
(0,0,0);background-color:transparent;font-variant-numeric:normal;font-varia=
nt-east-asian:normal;font-variant-alternates:normal;vertical-align:baseline=
;white-space:pre-wrap"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:=
0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"font-size:11pt;=
background-color:transparent;font-variant-numeric:normal;font-variant-east-=
asian:normal;font-variant-alternates:normal;vertical-align:baseline">Feedba=
ck from Richard has now been given on the meta-clang merging patches which =
are not ready yet. Development work is needed to move this forward, a copy =
and paste into core isn=E2=80=99t enough and it will not merge without help=
 from people.</span></p></li><li dir=3D"ltr" style=3D"list-style-type:disc;=
font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-col=
or:transparent;font-variant-numeric:normal;font-variant-east-asian:normal;f=
ont-variant-alternates:normal;vertical-align:baseline;white-space:pre-wrap"=
><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"=
 role=3D"presentation"><span style=3D"font-size:11pt;background-color:trans=
parent;font-variant-numeric:normal;font-variant-east-asian:normal;font-vari=
ant-alternates:normal;vertical-align:baseline">There are discussions about =
how to implement =E2=80=9Cmanifest=E2=80=9D based fetchers to handle cargo,=
 go and npm amongst others. We need to solve this problem in a way which ev=
eryone can work with but there is limited feedback or involvement in the pa=
tch review. Help is needed here to get this right and solve the long standi=
ng problems with these forms of software.</span></p></li><li dir=3D"ltr" st=
yle=3D"list-style-type:disc;font-size:11pt;font-family:Arial,sans-serif;col=
or:rgb(0,0,0);background-color:transparent;font-variant-numeric:normal;font=
-variant-east-asian:normal;font-variant-alternates:normal;vertical-align:ba=
seline;white-space:pre-wrap"><p dir=3D"ltr" style=3D"line-height:1.38;margi=
n-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"font-size=
:11pt;background-color:transparent;font-variant-numeric:normal;font-variant=
-east-asian:normal;font-variant-alternates:normal;vertical-align:baseline">=
Patches using config fragment and include_all are being worked on in master=
-next for OE-Core.</span></p></li><li dir=3D"ltr" style=3D"list-style-type:=
disc;font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);backgroun=
d-color:transparent;font-variant-numeric:normal;font-variant-east-asian:nor=
mal;font-variant-alternates:normal;vertical-align:baseline;white-space:pre-=
wrap"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom=
:0pt" role=3D"presentation"><span style=3D"font-size:11pt;background-color:=
transparent;font-variant-numeric:normal;font-variant-east-asian:normal;font=
-variant-alternates:normal;vertical-align:baseline">There is a proposed fix=
 for some native class extension handling code bugs/issues however that fix=
 creates new dependency problems and will require wider metadata changes.</=
span></p></li><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;=
font-family:Arial,sans-serif;color:rgb(0,0,0);background-color:transparent;=
font-variant-numeric:normal;font-variant-east-asian:normal;font-variant-alt=
ernates:normal;vertical-align:baseline;white-space:pre-wrap"><p dir=3D"ltr"=
 style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presen=
tation"><span style=3D"font-size:11pt;background-color:transparent;font-var=
iant-numeric:normal;font-variant-east-asian:normal;font-variant-alternates:=
normal;vertical-align:baseline">The 5.2 development plans are being develop=
ed in this document: </span><a href=3D"https://docs.google.com/document/d/1=
xsnN_HcaMhqg6Dn1P_19AnumDaUMQSdFZ_I4rjD830A/edit?usp=3Dsharing" style=3D"te=
xt-decoration:none" target=3D"_blank"><span style=3D"font-size:11pt;backgro=
und-color:transparent;font-variant-numeric:normal;font-variant-east-asian:n=
ormal;font-variant-alternates:normal;text-decoration:underline;vertical-ali=
gn:baseline">https://docs.google.com/document/d/1xsnN_HcaMhqg6Dn1P_19AnumDa=
UMQSdFZ_I4rjD830A/edit?usp=3Dsharing</span></a></p></li></ul><p dir=3D"ltr"=
 style=3D"line-height:1.38;margin-left:36pt;margin-top:0pt;margin-bottom:0p=
t"><span style=3D"font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0=
,0);background-color:transparent;font-variant-numeric:normal;font-variant-e=
ast-asian:normal;font-variant-alternates:normal;vertical-align:baseline">We=
 need to continue to develop this, thanks to all who have contributed so fa=
r!</span></p><br><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;ma=
rgin-bottom:0pt"><span style=3D"font-size:11pt;font-family:Arial,sans-serif=
;color:rgb(0,0,0);background-color:transparent;font-variant-numeric:normal;=
font-variant-east-asian:normal;font-variant-alternates:normal;vertical-alig=
n:baseline">Ways to contribute:</span></p><ul style=3D"margin-top:0px;margi=
n-bottom:0px"><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;=
font-family:Arial,sans-serif;color:rgb(0,0,0);background-color:transparent;=
font-variant-numeric:normal;font-variant-east-asian:normal;font-variant-alt=
ernates:normal;vertical-align:baseline;white-space:pre-wrap"><p dir=3D"ltr"=
 style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presen=
tation"><span style=3D"font-size:11pt;background-color:transparent;font-var=
iant-numeric:normal;font-variant-east-asian:normal;font-variant-alternates:=
normal;vertical-align:baseline">As people are likely aware, the project has=
 a number of components which are either unmaintained, or have people with =
little to no time trying to keep them alive. These components include: devt=
ool, toaster, wic, oeqa, autobuilder, CROPs containers, pseudo and more. Ma=
ny have open bugs. Help is welcome in trying to better look after these com=
ponents!</span></p></li><li dir=3D"ltr" style=3D"list-style-type:disc;font-=
size:9.5pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-color:t=
ransparent;font-variant-numeric:normal;font-variant-east-asian:normal;font-=
variant-alternates:normal;vertical-align:baseline;white-space:pre-wrap"><p =
dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" rol=
e=3D"presentation"><span style=3D"font-size:11pt;background-color:transpare=
nt;font-variant-numeric:normal;font-variant-east-asian:normal;font-variant-=
alternates:normal;vertical-align:baseline">There is an issue open upstream =
with the openssl project related to making path relocation of openssl easie=
r (as used in our buildtools tarball and SDK). We=E2=80=99d love assistance=
 in moving this forward and getting some kind of upstream feature merged to=
 make this easier: </span><a href=3D"https://github.com/openssl/openssl/pul=
l/19260" style=3D"text-decoration:none" target=3D"_blank"><span style=3D"fo=
nt-size:11pt;background-color:transparent;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-variant-alternates:normal;text-decoration:un=
derline;vertical-align:baseline">https://github.com/openssl/openssl/pull/19=
260</span></a></p></li><li dir=3D"ltr" style=3D"list-style-type:disc;font-s=
ize:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-color:tra=
nsparent;font-variant-numeric:normal;font-variant-east-asian:normal;font-va=
riant-alternates:normal;vertical-align:baseline;white-space:pre-wrap"><p di=
r=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=
=3D"presentation"><span style=3D"font-size:11pt;background-color:transparen=
t;font-variant-numeric:normal;font-variant-east-asian:normal;font-variant-a=
lternates:normal;vertical-align:baseline">There are bugs identified as poss=
ible for newcomers to the project: </span><a href=3D"https://wiki.yoctoproj=
ect.org/wiki/Newcomers" style=3D"text-decoration:none" target=3D"_blank"><s=
pan style=3D"font-size:11pt;background-color:transparent;font-variant-numer=
ic:normal;font-variant-east-asian:normal;font-variant-alternates:normal;tex=
t-decoration:underline;vertical-align:baseline">https://wiki.yoctoproject.o=
rg/wiki/Newcomers</span></a></p></li><li dir=3D"ltr" style=3D"list-style-ty=
pe:disc;font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);backgr=
ound-color:transparent;font-variant-numeric:normal;font-variant-east-asian:=
normal;font-variant-alternates:normal;vertical-align:baseline;white-space:p=
re-wrap"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bot=
tom:0pt" role=3D"presentation"><span style=3D"font-size:11pt;background-col=
or:transparent;font-variant-numeric:normal;font-variant-east-asian:normal;f=
ont-variant-alternates:normal;vertical-align:baseline">There are bugs that =
are currently unassigned for YP 5.2. See: </span><a href=3D"https://wiki.yo=
ctoproject.org/wiki/Bug_Triage#Medium+_5.2_Unassigned_Enhancements/Bugs" st=
yle=3D"text-decoration:none" target=3D"_blank"><span style=3D"font-size:11p=
t;background-color:transparent;font-variant-numeric:normal;font-variant-eas=
t-asian:normal;font-variant-alternates:normal;text-decoration:underline;ver=
tical-align:baseline">https://wiki.yoctoproject.org/wiki/Bug_Triage#Medium+=
_5.2_Unassigned_Enhancements/Bugs</span></a></p></li><li dir=3D"ltr" style=
=3D"list-style-type:disc;font-size:11pt;font-family:Arial,sans-serif;color:=
rgb(0,0,0);background-color:transparent;font-variant-numeric:normal;font-va=
riant-east-asian:normal;font-variant-alternates:normal;vertical-align:basel=
ine;white-space:pre-wrap"><p dir=3D"ltr" style=3D"line-height:1.38;margin-t=
op:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"font-size:11=
pt;background-color:transparent;font-variant-numeric:normal;font-variant-ea=
st-asian:normal;font-variant-alternates:normal;vertical-align:baseline">We=
=E2=80=99d welcome new maintainers for recipes in OE-Core. Please see the l=
ist at: </span><a href=3D"http://git.yoctoproject.org/cgit.cgi/poky/tree/me=
ta/conf/distro/include/maintainers.inc" style=3D"text-decoration:none" targ=
et=3D"_blank"><span style=3D"font-size:11pt;background-color:transparent;fo=
nt-variant-numeric:normal;font-variant-east-asian:normal;font-variant-alter=
nates:normal;text-decoration:underline;vertical-align:baseline">http://git.=
yoctoproject.org/cgit.cgi/poky/tree/meta/conf/distro/include/maintainers.in=
c</span></a><span style=3D"font-size:11pt;background-color:transparent;font=
-variant-numeric:normal;font-variant-east-asian:normal;font-variant-alterna=
tes:normal;vertical-align:baseline"> and discuss with the existing maintain=
er, or ask on the OE-Core mailing list. We will likely move a chunk of thes=
e to =E2=80=9CUnassigned=E2=80=9D soon to help facilitate this.</span></p><=
/li><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-famil=
y:Arial,sans-serif;color:rgb(0,0,0);background-color:transparent;font-varia=
nt-numeric:normal;font-variant-east-asian:normal;font-variant-alternates:no=
rmal;vertical-align:baseline;white-space:pre-wrap"><p dir=3D"ltr" style=3D"=
line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><s=
pan style=3D"font-size:11pt;background-color:transparent;font-variant-numer=
ic:normal;font-variant-east-asian:normal;font-variant-alternates:normal;ver=
tical-align:baseline">Help is very much welcome in trying to resolve our au=
tobuilder intermittent issues. You can see the list of failures we=E2=80=99=
re continuing to see by searching for the =E2=80=9CAB-INT=E2=80=9D tag in b=
ugzilla: </span><a href=3D"https://bugzilla.yoctoproject.org/buglist.cgi?qu=
icksearch=3DAB-INT" style=3D"text-decoration:none" target=3D"_blank"><span =
style=3D"font-size:11pt;background-color:transparent;font-variant-numeric:n=
ormal;font-variant-east-asian:normal;font-variant-alternates:normal;text-de=
coration:underline;vertical-align:baseline">https://bugzilla.yoctoproject.o=
rg/buglist.cgi?quicksearch=3DAB-INT</span></a><span style=3D"font-size:11pt=
;background-color:transparent;font-variant-numeric:normal;font-variant-east=
-asian:normal;font-variant-alternates:normal;vertical-align:baseline">.</sp=
an></p></li><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;fo=
nt-family:Arial,sans-serif;color:rgb(0,0,0);background-color:transparent;fo=
nt-variant-numeric:normal;font-variant-east-asian:normal;font-variant-alter=
nates:normal;vertical-align:baseline;white-space:pre-wrap"><p dir=3D"ltr" s=
tyle=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presenta=
tion"><span style=3D"font-size:11pt;background-color:transparent;font-varia=
nt-numeric:normal;font-variant-east-asian:normal;font-variant-alternates:no=
rmal;vertical-align:baseline">Help us resolve CVE issues: </span><a href=3D=
"https://autobuilder.yocto.io/pub/non-release/patchmetrics/" style=3D"text-=
decoration:none" target=3D"_blank"><span style=3D"font-size:11pt;background=
-color:transparent;font-variant-numeric:normal;font-variant-east-asian:norm=
al;font-variant-alternates:normal;text-decoration:underline;vertical-align:=
baseline">CVE metrics</span></a><span style=3D"font-size:11pt;background-co=
lor:transparent;font-variant-numeric:normal;font-variant-east-asian:normal;=
font-variant-alternates:normal;vertical-align:baseline">=C2=A0</span></p></=
li><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-family=
:Arial,sans-serif;color:rgb(0,0,0);background-color:transparent;font-varian=
t-numeric:normal;font-variant-east-asian:normal;font-variant-alternates:nor=
mal;vertical-align:baseline;white-space:pre-wrap"><p dir=3D"ltr" style=3D"l=
ine-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><sp=
an style=3D"font-size:11pt;background-color:transparent;font-variant-numeri=
c:normal;font-variant-east-asian:normal;font-variant-alternates:normal;vert=
ical-align:baseline">We have a growing number of bugs in bugzilla, any help=
 with them is appreciated.</span></p></li><li dir=3D"ltr" style=3D"list-sty=
le-type:disc;font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);b=
ackground-color:transparent;font-variant-numeric:normal;font-variant-east-a=
sian:normal;font-variant-alternates:normal;vertical-align:baseline;white-sp=
ace:pre-wrap"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margi=
n-bottom:0pt" role=3D"presentation"><span style=3D"font-size:11pt;backgroun=
d-color:transparent;font-variant-numeric:normal;font-variant-east-asian:nor=
mal;font-variant-alternates:normal;vertical-align:baseline">Regarding bugs,=
 even if you can=E2=80=99t fix a bug, submitting a failing test case that c=
an reproduce the issue significantly improves the chances it might get fixe=
d.</span></p></li><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:1=
1pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-color:transpar=
ent;font-variant-numeric:normal;font-variant-east-asian:normal;font-variant=
-alternates:normal;vertical-align:baseline;white-space:pre-wrap"><p dir=3D"=
ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"pr=
esentation"><span style=3D"font-size:11pt;background-color:transparent;font=
-variant-numeric:normal;font-variant-east-asian:normal;font-variant-alterna=
tes:normal;vertical-align:baseline">Further help on optimizing build disk u=
sage would be most welcome.</span></p></li></ul><br><p dir=3D"ltr" style=3D=
"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-siz=
e:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-color:trans=
parent;font-variant-numeric:normal;font-variant-east-asian:normal;font-vari=
ant-alternates:normal;vertical-align:baseline">Tracking Metrics:</span></p>=
<ul style=3D"margin-top:0px;margin-bottom:0px"><li dir=3D"ltr" style=3D"lis=
t-style-type:disc;font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0=
,0);background-color:transparent;font-variant-numeric:normal;font-variant-e=
ast-asian:normal;font-variant-alternates:normal;vertical-align:baseline;whi=
te-space:pre-wrap"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;=
margin-bottom:0pt" role=3D"presentation"><span style=3D"font-size:11pt;back=
ground-color:transparent;font-variant-numeric:normal;font-variant-east-asia=
n:normal;font-variant-alternates:normal;vertical-align:baseline">WDD 2840 (=
last week 2845) </span><span style=3D"font-size:11pt;font-family:Consolas,s=
ans-serif;background-color:transparent;font-variant-numeric:normal;font-var=
iant-east-asian:normal;font-variant-alternates:normal;vertical-align:baseli=
ne">(</span><a href=3D"https://wiki.yoctoproject.org/charts/combo.html" sty=
le=3D"text-decoration:none" target=3D"_blank"><span style=3D"font-size:11pt=
;background-color:transparent;font-variant-numeric:normal;font-variant-east=
-asian:normal;font-variant-alternates:normal;text-decoration:underline;vert=
ical-align:baseline">https://wiki.yoctoproject.org/charts/combo.html</span>=
</a><span style=3D"font-size:11pt;font-family:Consolas,sans-serif;backgroun=
d-color:transparent;font-variant-numeric:normal;font-variant-east-asian:nor=
mal;font-variant-alternates:normal;vertical-align:baseline">)</span></p></l=
i><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-family:=
Consolas,sans-serif;color:rgb(0,0,0);background-color:transparent;font-vari=
ant-numeric:normal;font-variant-east-asian:normal;font-variant-alternates:n=
ormal;vertical-align:baseline;white-space:pre-wrap"><p dir=3D"ltr" style=3D=
"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><=
span style=3D"font-size:11pt;font-family:Arial,sans-serif;background-color:=
transparent;font-variant-numeric:normal;font-variant-east-asian:normal;font=
-variant-alternates:normal;vertical-align:baseline">OE-Core/Poky Patch Metr=
ics</span></p></li><ul style=3D"margin-top:0px;margin-bottom:0px"><li dir=
=3D"ltr" style=3D"list-style-type:circle;font-size:11pt;font-family:Arial,s=
ans-serif;color:rgb(0,0,0);background-color:transparent;font-variant-numeri=
c:normal;font-variant-east-asian:normal;font-variant-alternates:normal;vert=
ical-align:baseline;white-space:pre-wrap"><p dir=3D"ltr" style=3D"line-heig=
ht:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=
=3D"font-size:11pt;background-color:transparent;font-variant-numeric:normal=
;font-variant-east-asian:normal;font-variant-alternates:normal;vertical-ali=
gn:baseline">Total patches found: 1037 (last week 1046)</span></p></li><li =
dir=3D"ltr" style=3D"list-style-type:circle;font-size:11pt;font-family:Aria=
l,sans-serif;color:rgb(0,0,0);background-color:transparent;font-variant-num=
eric:normal;font-variant-east-asian:normal;font-variant-alternates:normal;v=
ertical-align:baseline;white-space:pre-wrap"><p dir=3D"ltr" style=3D"line-h=
eight:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span st=
yle=3D"font-size:11pt;background-color:transparent;font-variant-numeric:nor=
mal;font-variant-east-asian:normal;font-variant-alternates:normal;vertical-=
align:baseline">Patches in the Pending State: 174 (17%) [last week 175 (17%=
)]</span></p></li><li dir=3D"ltr" style=3D"list-style-type:circle;font-size=
:11pt;font-family:Consolas,sans-serif;color:rgb(0,0,0);background-color:tra=
nsparent;font-variant-numeric:normal;font-variant-east-asian:normal;font-va=
riant-alternates:normal;vertical-align:baseline;white-space:pre-wrap"><p di=
r=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=
=3D"presentation"><a href=3D"https://autobuilder.yocto.io/pub/non-release/p=
atchmetrics/" style=3D"text-decoration:none" target=3D"_blank"><span style=
=3D"font-size:11pt;font-family:Arial,sans-serif;background-color:transparen=
t;font-variant-numeric:normal;font-variant-east-asian:normal;font-variant-a=
lternates:normal;text-decoration:underline;vertical-align:baseline">https:/=
/autobuilder.yocto.io/pub/non-release/patchmetrics/</span></a></p></li></ul=
></ul><br><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bo=
ttom:0pt"><span style=3D"font-size:11pt;font-family:Arial,sans-serif;color:=
rgb(0,0,0);background-color:transparent;font-variant-numeric:normal;font-va=
riant-east-asian:normal;font-variant-alternates:normal;vertical-align:basel=
ine">YP 5.2 Milestone Dates:</span></p><ul style=3D"margin-top:0px;margin-b=
ottom:0px"><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;fon=
t-family:Arial,sans-serif;color:rgb(0,0,0);background-color:transparent;fon=
t-variant-numeric:normal;font-variant-east-asian:normal;font-variant-altern=
ates:normal;vertical-align:baseline;white-space:pre-wrap"><p dir=3D"ltr" st=
yle=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentat=
ion"><span style=3D"font-size:11pt;background-color:transparent;font-varian=
t-numeric:normal;font-variant-east-asian:normal;font-variant-alternates:nor=
mal;vertical-align:baseline">YP 5.2 M1 in review.</span></p></li><li dir=3D=
"ltr" style=3D"list-style-type:disc;font-size:11pt;font-family:Arial,sans-s=
erif;color:rgb(0,0,0);background-color:transparent;font-variant-numeric:nor=
mal;font-variant-east-asian:normal;font-variant-alternates:normal;vertical-=
align:baseline;white-space:pre-wrap"><p dir=3D"ltr" style=3D"line-height:1.=
38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"f=
ont-size:11pt;background-color:transparent;font-variant-numeric:normal;font=
-variant-east-asian:normal;font-variant-alternates:normal;vertical-align:ba=
seline">YP 5.2 M2 Build Date 2025-01-20</span><span style=3D"font-size:11pt=
;background-color:transparent;font-variant-numeric:normal;font-variant-east=
-asian:normal;font-variant-alternates:normal;vertical-align:baseline"><span=
>	</span></span></p></li><li dir=3D"ltr" style=3D"list-style-type:disc;font=
-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-color:t=
ransparent;font-variant-numeric:normal;font-variant-east-asian:normal;font-=
variant-alternates:normal;vertical-align:baseline;white-space:pre-wrap"><p =
dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" rol=
e=3D"presentation"><span style=3D"font-size:11pt;background-color:transpare=
nt;font-variant-numeric:normal;font-variant-east-asian:normal;font-variant-=
alternates:normal;vertical-align:baseline">YP 5.2 M2 Release Date 2025-01-3=
1</span></p></li><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11=
pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-color:transpare=
nt;font-variant-numeric:normal;font-variant-east-asian:normal;font-variant-=
alternates:normal;vertical-align:baseline;white-space:pre-wrap"><p dir=3D"l=
tr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"pre=
sentation"><span style=3D"font-size:11pt;background-color:transparent;font-=
variant-numeric:normal;font-variant-east-asian:normal;font-variant-alternat=
es:normal;vertical-align:baseline">YP 5.2 M3 Build Date 2025-03-03</span><s=
pan style=3D"font-size:11pt;background-color:transparent;font-variant-numer=
ic:normal;font-variant-east-asian:normal;font-variant-alternates:normal;ver=
tical-align:baseline"><span>	</span></span></p></li><li dir=3D"ltr" style=
=3D"list-style-type:disc;font-size:11pt;font-family:Arial,sans-serif;color:=
rgb(0,0,0);background-color:transparent;font-variant-numeric:normal;font-va=
riant-east-asian:normal;font-variant-alternates:normal;vertical-align:basel=
ine;white-space:pre-wrap"><p dir=3D"ltr" style=3D"line-height:1.38;margin-t=
op:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"font-size:11=
pt;background-color:transparent;font-variant-numeric:normal;font-variant-ea=
st-asian:normal;font-variant-alternates:normal;vertical-align:baseline">YP =
5.2 M3 Release Date 2025-03-14</span></p></li><li dir=3D"ltr" style=3D"list=
-style-type:disc;font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,=
0);background-color:transparent;font-variant-numeric:normal;font-variant-ea=
st-asian:normal;font-variant-alternates:normal;vertical-align:baseline;whit=
e-space:pre-wrap"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;m=
argin-bottom:0pt" role=3D"presentation"><span style=3D"font-size:11pt;backg=
round-color:transparent;font-variant-numeric:normal;font-variant-east-asian=
:normal;font-variant-alternates:normal;vertical-align:baseline">YP 5.2 M4 B=
uild Date 2025-03-31</span><span style=3D"font-size:11pt;background-color:t=
ransparent;font-variant-numeric:normal;font-variant-east-asian:normal;font-=
variant-alternates:normal;vertical-align:baseline"><span>	</span></span></p=
></li><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-fam=
ily:Arial,sans-serif;color:rgb(0,0,0);background-color:transparent;font-var=
iant-numeric:normal;font-variant-east-asian:normal;font-variant-alternates:=
normal;vertical-align:baseline;white-space:pre-wrap"><p dir=3D"ltr" style=
=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation=
"><span style=3D"font-size:11pt;background-color:transparent;font-variant-n=
umeric:normal;font-variant-east-asian:normal;font-variant-alternates:normal=
;vertical-align:baseline">YP 5.2 M4 Release Date 2025-04-25</span></p></li>=
</ul><br><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bot=
tom:0pt"><span style=3D"font-size:11pt;font-family:Arial,sans-serif;color:r=
gb(0,0,0);background-color:transparent;font-variant-numeric:normal;font-var=
iant-east-asian:normal;font-variant-alternates:normal;vertical-align:baseli=
ne">Upcoming dot releases:</span></p><ul style=3D"margin-top:0px;margin-bot=
tom:0px"><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-=
family:Arial,sans-serif;color:rgb(0,0,0);background-color:transparent;font-=
variant-numeric:normal;font-variant-east-asian:normal;font-variant-alternat=
es:normal;vertical-align:baseline;white-space:pre-wrap"><p dir=3D"ltr" styl=
e=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentatio=
n"><span style=3D"font-size:11pt;background-color:transparent;font-variant-=
numeric:normal;font-variant-east-asian:normal;font-variant-alternates:norma=
l;vertical-align:baseline">YP 5.0.6 in review.</span></p></li><li dir=3D"lt=
r" style=3D"list-style-type:disc;font-size:11pt;font-family:Arial,sans-seri=
f;color:rgb(0,0,0);background-color:transparent;font-variant-numeric:normal=
;font-variant-east-asian:normal;font-variant-alternates:normal;vertical-ali=
gn:baseline;white-space:pre-wrap"><p dir=3D"ltr" style=3D"line-height:1.38;=
margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"font=
-size:11pt;background-color:transparent;font-variant-numeric:normal;font-va=
riant-east-asian:normal;font-variant-alternates:normal;vertical-align:basel=
ine">YP 4.0.24 Build Date 2025-01-06</span><span style=3D"font-size:11pt;ba=
ckground-color:transparent;font-variant-numeric:normal;font-variant-east-as=
ian:normal;font-variant-alternates:normal;vertical-align:baseline"><span>	<=
/span></span></p></li><li dir=3D"ltr" style=3D"list-style-type:disc;font-si=
ze:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-color:tran=
sparent;font-variant-numeric:normal;font-variant-east-asian:normal;font-var=
iant-alternates:normal;vertical-align:baseline;white-space:pre-wrap"><p dir=
=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=
=3D"presentation"><span style=3D"font-size:11pt;background-color:transparen=
t;font-variant-numeric:normal;font-variant-east-asian:normal;font-variant-a=
lternates:normal;vertical-align:baseline">YP 4.0.24 Release Date 2025-01-17=
</span></p></li><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11p=
t;font-family:Arial,sans-serif;color:rgb(0,0,0);background-color:transparen=
t;font-variant-numeric:normal;font-variant-east-asian:normal;font-variant-a=
lternates:normal;vertical-align:baseline;white-space:pre-wrap"><p dir=3D"lt=
r" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"pres=
entation"><span style=3D"font-size:11pt;background-color:transparent;font-v=
ariant-numeric:normal;font-variant-east-asian:normal;font-variant-alternate=
s:normal;vertical-align:baseline">YP 5.1.2 Build Date 2025-01-13</span><spa=
n style=3D"font-size:11pt;background-color:transparent;font-variant-numeric=
:normal;font-variant-east-asian:normal;font-variant-alternates:normal;verti=
cal-align:baseline"><span>	</span></span></p></li><li dir=3D"ltr" style=3D"=
list-style-type:disc;font-size:11pt;font-family:Arial,sans-serif;color:rgb(=
0,0,0);background-color:transparent;font-variant-numeric:normal;font-varian=
t-east-asian:normal;font-variant-alternates:normal;vertical-align:baseline;=
white-space:pre-wrap"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0=
pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"font-size:11pt;b=
ackground-color:transparent;font-variant-numeric:normal;font-variant-east-a=
sian:normal;font-variant-alternates:normal;vertical-align:baseline">YP 5.1.=
2 Release Date 2025-01-24</span></p></li><li dir=3D"ltr" style=3D"list-styl=
e-type:disc;font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);ba=
ckground-color:transparent;font-variant-numeric:normal;font-variant-east-as=
ian:normal;font-variant-alternates:normal;vertical-align:baseline;white-spa=
ce:pre-wrap"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin=
-bottom:0pt" role=3D"presentation"><span style=3D"font-size:11pt;background=
-color:transparent;font-variant-numeric:normal;font-variant-east-asian:norm=
al;font-variant-alternates:normal;vertical-align:baseline">YP 5.0.7 Build D=
ate 2025-01-27</span><span style=3D"font-size:11pt;background-color:transpa=
rent;font-variant-numeric:normal;font-variant-east-asian:normal;font-varian=
t-alternates:normal;vertical-align:baseline"><span>	</span></span></p></li>=
<li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-family:Ar=
ial,sans-serif;color:rgb(0,0,0);background-color:transparent;font-variant-n=
umeric:normal;font-variant-east-asian:normal;font-variant-alternates:normal=
;vertical-align:baseline;white-space:pre-wrap"><p dir=3D"ltr" style=3D"line=
-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span =
style=3D"font-size:11pt;background-color:transparent;font-variant-numeric:n=
ormal;font-variant-east-asian:normal;font-variant-alternates:normal;vertica=
l-align:baseline">YP 5.0.7 Release Date 2025-02-07</span></p></li><li dir=
=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-family:Arial,san=
s-serif;color:rgb(0,0,0);background-color:transparent;font-variant-numeric:=
normal;font-variant-east-asian:normal;font-variant-alternates:normal;vertic=
al-align:baseline;white-space:pre-wrap"><p dir=3D"ltr" style=3D"line-height=
:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=
=3D"font-size:11pt;background-color:transparent;font-variant-numeric:normal=
;font-variant-east-asian:normal;font-variant-alternates:normal;vertical-ali=
gn:baseline">YP 4.0.25 Build Date 2025-02-17</span><span style=3D"font-size=
:11pt;background-color:transparent;font-variant-numeric:normal;font-variant=
-east-asian:normal;font-variant-alternates:normal;vertical-align:baseline">=
<span>	</span></span></p></li><li dir=3D"ltr" style=3D"list-style-type:disc=
;font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-co=
lor:transparent;font-variant-numeric:normal;font-variant-east-asian:normal;=
font-variant-alternates:normal;vertical-align:baseline;white-space:pre-wrap=
"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt=
" role=3D"presentation"><span style=3D"font-size:11pt;background-color:tran=
sparent;font-variant-numeric:normal;font-variant-east-asian:normal;font-var=
iant-alternates:normal;vertical-align:baseline">YP 4.0.25 Release Date 2025=
-02-28</span></p></li><li dir=3D"ltr" style=3D"list-style-type:disc;font-si=
ze:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-color:tran=
sparent;font-variant-numeric:normal;font-variant-east-asian:normal;font-var=
iant-alternates:normal;vertical-align:baseline;white-space:pre-wrap"><p dir=
=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=
=3D"presentation"><span style=3D"font-size:11pt;background-color:transparen=
t;font-variant-numeric:normal;font-variant-east-asian:normal;font-variant-a=
lternates:normal;vertical-align:baseline">YP 5.1.3 Build Date 2025-02-24</s=
pan><span style=3D"font-size:11pt;background-color:transparent;font-variant=
-numeric:normal;font-variant-east-asian:normal;font-variant-alternates:norm=
al;vertical-align:baseline"><span>	</span></span></p></li><li dir=3D"ltr" s=
tyle=3D"list-style-type:disc;font-size:11pt;font-family:Arial,sans-serif;co=
lor:rgb(0,0,0);background-color:transparent;font-variant-numeric:normal;fon=
t-variant-east-asian:normal;font-variant-alternates:normal;vertical-align:b=
aseline;white-space:pre-wrap"><p dir=3D"ltr" style=3D"line-height:1.38;marg=
in-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"font-siz=
e:11pt;background-color:transparent;font-variant-numeric:normal;font-varian=
t-east-asian:normal;font-variant-alternates:normal;vertical-align:baseline"=
>YP 5.1.3 Release Date 2025-03-07</span></p></li><li dir=3D"ltr" style=3D"l=
ist-style-type:disc;font-size:11pt;font-family:Arial,sans-serif;color:rgb(0=
,0,0);background-color:transparent;font-variant-numeric:normal;font-variant=
-east-asian:normal;font-variant-alternates:normal;vertical-align:baseline;w=
hite-space:pre-wrap"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0p=
t;margin-bottom:0pt" role=3D"presentation"><span style=3D"font-size:11pt;ba=
ckground-color:transparent;font-variant-numeric:normal;font-variant-east-as=
ian:normal;font-variant-alternates:normal;vertical-align:baseline">YP 5.0.8=
 Build Date 2025-03-10</span><span style=3D"font-size:11pt;background-color=
:transparent;font-variant-numeric:normal;font-variant-east-asian:normal;fon=
t-variant-alternates:normal;vertical-align:baseline"><span>	</span></span><=
/p></li><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-f=
amily:Arial,sans-serif;color:rgb(0,0,0);background-color:transparent;font-v=
ariant-numeric:normal;font-variant-east-asian:normal;font-variant-alternate=
s:normal;vertical-align:baseline;white-space:pre-wrap"><p dir=3D"ltr" style=
=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation=
"><span style=3D"font-size:11pt;background-color:transparent;font-variant-n=
umeric:normal;font-variant-east-asian:normal;font-variant-alternates:normal=
;vertical-align:baseline">YP 5.0.8 Release Date 2025-03-21</span></p></li><=
li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-family:Ari=
al,sans-serif;color:rgb(0,0,0);background-color:transparent;font-variant-nu=
meric:normal;font-variant-east-asian:normal;font-variant-alternates:normal;=
vertical-align:baseline;white-space:pre-wrap"><p dir=3D"ltr" style=3D"line-=
height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span s=
tyle=3D"font-size:11pt;background-color:transparent;font-variant-numeric:no=
rmal;font-variant-east-asian:normal;font-variant-alternates:normal;vertical=
-align:baseline">YP 5.1.4 Build Date 2025-03-24</span><span style=3D"font-s=
ize:11pt;background-color:transparent;font-variant-numeric:normal;font-vari=
ant-east-asian:normal;font-variant-alternates:normal;vertical-align:baselin=
e"><span>	</span></span></p></li><li dir=3D"ltr" style=3D"list-style-type:d=
isc;font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background=
-color:transparent;font-variant-numeric:normal;font-variant-east-asian:norm=
al;font-variant-alternates:normal;vertical-align:baseline;white-space:pre-w=
rap"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:=
0pt" role=3D"presentation"><span style=3D"font-size:11pt;background-color:t=
ransparent;font-variant-numeric:normal;font-variant-east-asian:normal;font-=
variant-alternates:normal;vertical-align:baseline">YP 5.1.4 Release Date 20=
25-04-04</span></p></li><li dir=3D"ltr" style=3D"list-style-type:disc;font-=
size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-color:tr=
ansparent;font-variant-numeric:normal;font-variant-east-asian:normal;font-v=
ariant-alternates:normal;vertical-align:baseline;white-space:pre-wrap"><p d=
ir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=
=3D"presentation"><span style=3D"font-size:11pt;background-color:transparen=
t;font-variant-numeric:normal;font-variant-east-asian:normal;font-variant-a=
lternates:normal;vertical-align:baseline">YP 4.0.26 Build Date 2025-04-07</=
span><span style=3D"font-size:11pt;background-color:transparent;font-varian=
t-numeric:normal;font-variant-east-asian:normal;font-variant-alternates:nor=
mal;vertical-align:baseline"><span>	</span></span></p></li><li dir=3D"ltr" =
style=3D"list-style-type:disc;font-size:11pt;font-family:Arial,sans-serif;c=
olor:rgb(0,0,0);background-color:transparent;font-variant-numeric:normal;fo=
nt-variant-east-asian:normal;font-variant-alternates:normal;vertical-align:=
baseline;white-space:pre-wrap"><p dir=3D"ltr" style=3D"line-height:1.38;mar=
gin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"font-si=
ze:11pt;background-color:transparent;font-variant-numeric:normal;font-varia=
nt-east-asian:normal;font-variant-alternates:normal;vertical-align:baseline=
">YP 4.0.26 Release Date 2025-04-18</span></p></li><li dir=3D"ltr" style=3D=
"list-style-type:disc;font-size:11pt;font-family:Arial,sans-serif;color:rgb=
(0,0,0);background-color:transparent;font-variant-numeric:normal;font-varia=
nt-east-asian:normal;font-variant-alternates:normal;vertical-align:baseline=
;white-space:pre-wrap"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:=
0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"font-size:11pt;=
background-color:transparent;font-variant-numeric:normal;font-variant-east-=
asian:normal;font-variant-alternates:normal;vertical-align:baseline">YP 5.0=
.9 Build Date 2025-04-21</span><span style=3D"font-size:11pt;background-col=
or:transparent;font-variant-numeric:normal;font-variant-east-asian:normal;f=
ont-variant-alternates:normal;vertical-align:baseline"><span>	</span></span=
></p></li><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font=
-family:Arial,sans-serif;color:rgb(0,0,0);background-color:transparent;font=
-variant-numeric:normal;font-variant-east-asian:normal;font-variant-alterna=
tes:normal;vertical-align:baseline;white-space:pre-wrap"><p dir=3D"ltr" sty=
le=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentati=
on"><span style=3D"font-size:11pt;background-color:transparent;font-variant=
-numeric:normal;font-variant-east-asian:normal;font-variant-alternates:norm=
al;vertical-align:baseline">YP 5.0.9 Release Date 2025-05-02</span></p></li=
><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-family:A=
rial,sans-serif;color:rgb(0,0,0);background-color:transparent;font-variant-=
numeric:normal;font-variant-east-asian:normal;font-variant-alternates:norma=
l;vertical-align:baseline;white-space:pre-wrap"><p dir=3D"ltr" style=3D"lin=
e-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span=
 style=3D"font-size:11pt;background-color:transparent;font-variant-numeric:=
normal;font-variant-east-asian:normal;font-variant-alternates:normal;vertic=
al-align:baseline">YP 4.0.27 Build Date 2025-05-19</span><span style=3D"fon=
t-size:11pt;background-color:transparent;font-variant-numeric:normal;font-v=
ariant-east-asian:normal;font-variant-alternates:normal;vertical-align:base=
line"><span>	</span></span></p></li><li dir=3D"ltr" style=3D"list-style-typ=
e:disc;font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);backgro=
und-color:transparent;font-variant-numeric:normal;font-variant-east-asian:n=
ormal;font-variant-alternates:normal;vertical-align:baseline;white-space:pr=
e-wrap"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bott=
om:0pt" role=3D"presentation"><span style=3D"font-size:11pt;background-colo=
r:transparent;font-variant-numeric:normal;font-variant-east-asian:normal;fo=
nt-variant-alternates:normal;vertical-align:baseline">YP 4.0.27 Release Dat=
e 2025-05-30</span></p></li><li dir=3D"ltr" style=3D"list-style-type:disc;f=
ont-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-colo=
r:transparent;font-variant-numeric:normal;font-variant-east-asian:normal;fo=
nt-variant-alternates:normal;vertical-align:baseline;white-space:pre-wrap">=
<p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" =
role=3D"presentation"><span style=3D"font-size:11pt;background-color:transp=
arent;font-variant-numeric:normal;font-variant-east-asian:normal;font-varia=
nt-alternates:normal;vertical-align:baseline">YP 5.0.10 Build Date 2025-06-=
02</span><span style=3D"font-size:11pt;background-color:transparent;font-va=
riant-numeric:normal;font-variant-east-asian:normal;font-variant-alternates=
:normal;vertical-align:baseline"><span>	</span></span></p></li><li dir=3D"l=
tr" style=3D"list-style-type:disc;font-size:11pt;font-family:Arial,sans-ser=
if;color:rgb(0,0,0);background-color:transparent;font-variant-numeric:norma=
l;font-variant-east-asian:normal;font-variant-alternates:normal;vertical-al=
ign:baseline;white-space:pre-wrap"><p dir=3D"ltr" style=3D"line-height:1.38=
;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"fon=
t-size:11pt;background-color:transparent;font-variant-numeric:normal;font-v=
ariant-east-asian:normal;font-variant-alternates:normal;vertical-align:base=
line">YP 5.0.10 Release Date 2025-06-13</span></p></li><li dir=3D"ltr" styl=
e=3D"list-style-type:disc;font-size:11pt;font-family:Arial,sans-serif;color=
:rgb(0,0,0);background-color:transparent;font-variant-numeric:normal;font-v=
ariant-east-asian:normal;font-variant-alternates:normal;vertical-align:base=
line;white-space:pre-wrap"><p dir=3D"ltr" style=3D"line-height:1.38;margin-=
top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"font-size:1=
1pt;background-color:transparent;font-variant-numeric:normal;font-variant-e=
ast-asian:normal;font-variant-alternates:normal;vertical-align:baseline">YP=
 4.0.28 Build Date 2025-06-30</span><span style=3D"font-size:11pt;backgroun=
d-color:transparent;font-variant-numeric:normal;font-variant-east-asian:nor=
mal;font-variant-alternates:normal;vertical-align:baseline"><span>	</span><=
/span></p></li><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt=
;font-family:Arial,sans-serif;color:rgb(0,0,0);background-color:transparent=
;font-variant-numeric:normal;font-variant-east-asian:normal;font-variant-al=
ternates:normal;vertical-align:baseline;white-space:pre-wrap"><p dir=3D"ltr=
" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"prese=
ntation"><span style=3D"font-size:11pt;background-color:transparent;font-va=
riant-numeric:normal;font-variant-east-asian:normal;font-variant-alternates=
:normal;vertical-align:baseline">YP 4.0.28 Release Date 2025-07-11</span></=
p></li></ul><br><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;mar=
gin-bottom:0pt"><span style=3D"font-size:11pt;font-family:Arial,sans-serif;=
color:rgb(0,0,0);background-color:transparent;font-variant-numeric:normal;f=
ont-variant-east-asian:normal;font-variant-alternates:normal;vertical-align=
:baseline">The Yocto Project=E2=80=99s technical governance is through its =
Technical Steering Committee, more information is available at:</span></p><=
p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><=
a href=3D"https://wiki.yoctoproject.org/wiki/TSC" style=3D"text-decoration:=
none" target=3D"_blank"><span style=3D"font-size:11pt;font-family:Arial,san=
s-serif;background-color:transparent;font-variant-numeric:normal;font-varia=
nt-east-asian:normal;font-variant-alternates:normal;text-decoration:underli=
ne;vertical-align:baseline">https://wiki.yoctoproject.org/wiki/TSC</span></=
a></p><br><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bo=
ttom:0pt"><span style=3D"font-size:11pt;font-family:Arial,sans-serif;color:=
rgb(0,0,0);background-color:transparent;font-variant-numeric:normal;font-va=
riant-east-asian:normal;font-variant-alternates:normal;vertical-align:basel=
ine">The Status reports are now stored on the wiki at: </span><a href=3D"ht=
tps://wiki.yoctoproject.org/wiki/Weekly_Status" style=3D"text-decoration:no=
ne" target=3D"_blank"><span style=3D"font-size:11pt;font-family:Arial,sans-=
serif;background-color:transparent;font-variant-numeric:normal;font-variant=
-east-asian:normal;font-variant-alternates:normal;text-decoration:underline=
;vertical-align:baseline">https://wiki.yoctoproject.org/wiki/Weekly_Status<=
/span></a></p><br><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;m=
argin-bottom:0pt"><span style=3D"font-size:11pt;font-family:Arial,sans-seri=
f;color:rgb(0,0,0);background-color:transparent;font-variant-numeric:normal=
;font-variant-east-asian:normal;font-variant-alternates:normal;vertical-ali=
gn:baseline">[If anyone has suggestions for other information you=E2=80=99d=
 like to see on this weekly status update, let us know!]</span></p></span><=
br></div><div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"ltr"><div d=
ir=3D"ltr"><p class=3D"MsoNormal" style=3D"background-image:initial;backgro=
und-position:initial;background-repeat:initial"><span style=3D"font-size:12=
pt;font-family:Arial,sans-serif">Thanks,<span></span></span></p>

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




<p></p><p></p></blockquote></div>

--000000000000493f77062b98278c--

