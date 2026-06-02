Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00103CD6E57
	for <webhook@archiver.kernel.org>; Tue,  2 Jun 2026 15:27:01 +0000 (UTC)
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.748.1780413218248972598
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Jun 2026 08:13:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=FJHM9jDQ;
 spf=pass (domain: gmail.com, ip: 209.85.160.169, mailfrom: sjolley54@gmail.com)
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-516cc1d6eeaso6040981cf.2
        for <openembedded-core@lists.openembedded.org>; Tue, 02 Jun 2026 08:13:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780413217; cv=none;
        d=google.com; s=arc-20240605;
        b=cduaWinJ0JwZ8opcADEqs4jXWyTI+9P+CoqyN/MpP96JZlu7bGTDHZeXwvtTlCD2OX
         a4tmpdBaJ7nTKruZUA/LOk1VmWNjq0JHNT/vy2Q0KhVgKRvbao5GhvZmTWFthFb1rLTl
         7l1+M5Cvi/C5g258WuQPiWf6MvarNusbAa8bi2vrKuClghUfr8nQiWLUMNKvHopajqvm
         i3PnMr7TMNRlvZkf0KmwI8nk1Isp1lWeG9A9oekhQM5iI1QIrXuxkFlA/YlyYEG5ablj
         Yu+byQvzIjjKNosySjeCCeCzRWxvJ6a/bUh2UB9Z6qdWG/EXi/alMv7kTgbwZ0+bA1yR
         muFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=lFFZfHX2lUGn+D/ls1b03uvuAjfw5GFNYOIzO67rRnQ=;
        fh=ytly0RZCgl+IP72dijbjSwvmqkswHT1R5i1DUu7bpIU=;
        b=AmyEybDiNXdk5Gn0Q9ocmdvX+kaLjtLVwL1Xaf6MEeUtmjyJ2qf91BQC034h94WL/3
         uyDdILmDxTaudPQt3xMHFIdjXfs5TKM5MTgU1VQ5t5Kt1EX8uyuDRw93GL/kl0umD0wT
         TrBVprViskmfas7L4vulWSCHK9lDQyRf7qeARpTC7jic5Uo5cbMEX/7hwGdA+BgeqK9J
         QmR5M0YXaXVEMmlquRNvXNCHsg3BYmexAntLzbimvbMpUeFOE5Hc2kGY6JUfvwR6TgcN
         8YPnxfpZ+SLbW9bitSNC74U9N5Ulkg/YaGtDUgPxaP529KCNd90SfJvy4KN6RHfMdEe0
         jbVA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780413217; x=1781018017; darn=lists.openembedded.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=lFFZfHX2lUGn+D/ls1b03uvuAjfw5GFNYOIzO67rRnQ=;
        b=FJHM9jDQrLTwm3xVHmQo8XPRrZmb7sRZencfW8ti87/2EZMKx7aFCwGN/fBk5ErIvI
         AOzPn9xGjuFOd8gTlcJaorh5rYx1Rh5uaaUPPZMAAFYQOQDwCVXdoCvO/RCAJ6OR9hbi
         Zbv/v4SERVMOk6+etE54r/PqKNLShgmmiqMqxVKAohjAokpyGqcIoIH/E4vlxKMqAjj3
         SvJHOckFy5KsZDUDmEj9KAH88/tenvBK0PSKmWTDN0YO3nMMThEkEaDLZ+tdmMYkSiRq
         2/wdrhmoT01nmGhMfclnh3X+v54UqL1Hxy/aJtc8gb9ETbkL75Tv4atUWWxFNeEZpt8s
         m0Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780413217; x=1781018017;
        h=to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lFFZfHX2lUGn+D/ls1b03uvuAjfw5GFNYOIzO67rRnQ=;
        b=hZHfNfceYRZNxKCQSC8rkMT5Ube3hzuUjgGRelXo2CCWW4EqW2bqCQ68J3fbqYGG1M
         G4UBA0hcv/0xt0k9VSQTCGp/B4a/ZoBrZ6Jx3z8B5iylxjEefgD2Ot1Wbc1sixSF8vzc
         k8etDohTie3N8qb+RcEYujUjW/Vc51bXY1qqT4RfRoqNkoNZD5W+o163bM10jrOX6Pgv
         qbLswQu9KcWpL/h4eHZFoVX0txQnYyNB/Ig4lup8BGsRgmc35rH8bAl1Npg+ktFSdR06
         7tdsLGQCsAVR3QV6L6AQ+6OtEIivy22PSsFoCIv2E8NU10GKBv1fLngZlnhGpUli7Hxh
         dPWQ==
X-Forwarded-Encrypted: i=1; AFNElJ/tWaoYDIc97cSZwXoi2jOkICVvSks5H3rkBH+JY4I8v7wlZts5B0agkGSNrvUqQOS6GnfdknKNQpZlBjS4NZ4nfw==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yzu8tv0g2CwIS+63S6QKY4q/pWpN9unbqQCXD8Lxd2ne1huwBTM
	swAkR10ey7Ld8vPw+bbGYfKy7Pgo3t7KCa2FF11AAeLQkb1d3CJCKl9hZRiRjfgqN+Sk1Qnv+7I
	zCp0173CdNsYqTmR1N4WMbGVlNkgFTuMlmBGq
X-Gm-Gg: Acq92OH3QHF0b94w6MIBj7+7MR4vn2b2R152P3w5RuOn9Vj6xk1NhFTiQPk0c1VvXGw
	9f8L5s4Zw8d00beiVMw30R7lI2eY3ijFFxjfpCFBODtJWFq1cexluY/3zPNx76FACb0sA40nYrJ
	ZdT5cAUYMhMMlkT4JmKXMnLomJXqEARf3RldS38TgQxvcpmyrRjF8hnKUMP/Btk43NJR7LnGdGC
	xrQQCcrahgow6+RKM8w9PJp8sGQU2zpzsUR8QDwqiAHG9OpdwOvdNpUjtnbbWSSZju8zOhGG/ya
	3wJbIT6A3WoQm0AYU+HOMMvl8mgZSQomHJXNqjiTklx636WLVfJC
X-Received: by 2002:a05:6102:6c85:b0:631:2a09:94c0 with SMTP id
 ada2fe7eead31-6ea1d6f1e8cmr54199137.2.1780412772271; Tue, 02 Jun 2026
 08:06:12 -0700 (PDT)
MIME-Version: 1.0
From: Stephen Jolley <sjolley54@gmail.com>
Date: Tue, 2 Jun 2026 08:06:02 -0700
X-Gm-Features: AVHnY4Kpkv1ltJgA59lnpDpuWZARJbJYOrqnfMDeOsf63C1TRNtEn_7MtTFim7M
Message-ID: <CAHRhDrFBYUfbj31KkSfzPq-TVuwb8jQZWHOB1SWb5Rf8CJFCOw@mail.gmail.com>
Subject: Yocto Project Status 2 June 2026 (WW23)
To: yocto@lists.yoctoproject.org, openembedded-core@lists.openembedded.org, 
	yocto-status@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="000000000000d84b54065346a6ef"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Jun 2026 15:27:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238062

--000000000000d84b54065346a6ef
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Current Dev Position: YP 6.1 M1

Next Deadline: YP 6.1 M1: w/c 2026-06-08

Next Team Meetings:

   -

   Bug Triage meeting - Thursday 4th June 7:30am PDT (
   https://zoom.us/j/454367603?pwd=3DZGxoa2ZXL3FkM3Y0bFd5aVpHVVZ6dz09)
   -

   Weekly Project Engineering Sync  - Tuesday 2nd June. 8am PDT (
   https://zoom.us/j/990892712?pwd=3DcHU1MjhoM2x6ck81bkcrYjRrcmJsUT09)
   <https://zoom.us/j/990892712>
   -

   Yocto Project Patch Review - Thursday 4th June 10am GMT and Monday 8th
   June 9am PDT (https://zoom.us/j/9776239
   <https://zoom.us/j/97762397148?pwd=3D1xkiC9hp9SjEonaTaONwTb6iWry4Eb.1>7
   148?pwd=3D1xk0iC9hp9SjEonaTaONwTb6iWry4Eb.1
   <https://zoom.us/j/97762397148?pwd=3D1xkiC9hp9SjEonaTaONwTb6iWry4Eb.1>)


Project data dashboard: https://dashboard.yoctoproject.org/

Key Status/Updates:

   -

   YP 5.0.18 is due to be released
   -

   YP 6.0.1 is in QA.
   -

   YP 6.1 M1 is due to build next week
   -

   We=E2=80=99re working through the backlog of patches, the bandwidth for =
changes
   needing in depth review/feedback continues to be a challenge.
   -

   The upgrade to gcc 16 merged
   -

   We are planning to improve our python subprocess calls to avoid
   shell=3DTrue, we would appreciate others following and doing this in the=
ir
   code too.
   -

   Intermittent build failures continue to be problematic and unchanged
   from last week:
   -

      several qemu =E2=80=98hang=E2=80=99 type issues
      -

      sometimes yocto-check-layer is showing checksum mismatch issues
      -

      siggen reset issues (=E2=80=9CResourceWarning: unclosed transport=E2=
=80=9D)
      -

      groff build race issues
      -

      intermittent ptest failures in many recipes
      -

   Qemu v11 dropped support for 32 bit hosts and we are likely to drop
   support for running builds on 32 bits hosts
   -

   The upstream kernel is looking likely to drop x32 support and if they
   do, we will have to drop our support too - let them/us know if you=E2=80=
=99re using
   it!
   -

   We would like to know what people are planning to work on for Yocto
   Project 6.1 and beyond. We have a roadmap document in Google Docs:
   https://docs.google.com/document/d/12xgAzSjDj5zVlo4eQIbiv1s3QMjtBTCvBFY3=
_T7OPto


Want to contribute? We would appreciate help with the following areas:

   -

   We have several open issues for pseudo and limited maintainer time to
   work on them. Help from someone familiar with systems programming in C
   would be greatly appreciated.
   https://bugzilla.yoctoproject.org/buglist.cgi?list_id=3D661406&priority=
=3DHigh&priority=3DMedium%2B&product=3DPseudo&query_format=3Dadvanced&resol=
ution=3D---
   -

   There are a large number of intermittent failures on our autobuilder,
   any help with investigating, reproducing or solving these issues would b=
e
   welcome! https://valkyrie.yocto.io/pub/non-release/abint/
   -

   Many recipes in openembedded-core would benefit from a new recipe
   maintainer. Please look at
   https://git.openembedded.org/openembedded-core/tree/meta/conf/distro/inc=
lude/maintainers.inc
   and see if you can adopt any of the unassigned recipes.
   -

   For more ways to contribute, see
   https://docs.google.com/document/d/18oxKWxLorfF813h82mK6yKTIHeBp_-9owFuC=
WbzgjOk/edit?usp=3Dsharing


New to the project?

   -

   We have a list of issues we think are good places to start contributing:
   https://bugzilla.yoctoproject.org/buglist.cgi?quicksearch=3DNEWCOMER


Tracking Metrics:

   -

   WDD 2630 (last week 2660) (
   https://wiki.yoctoproject.org/charts/combo.html)
   -

   OE-Core/Poky Patch Metrics
   -

      Total patches found: 1087 (last week 1083)
      -

      Patches in the Pending State: 147 (14%) [last week 148 (14%)]
      -

      https://valkyrie.yocto.io/pub/non-release/patchmetrics/


Upcoming development releases:

   -

   6.1 M1:
   -

      Build Date: w/c 2026-06-08
      -

      Release Date: w/c 2026-06-22
      -

   6.1 M2:
   -

      Build Date: w/c 2026-07-20
      -

      Release Date: w/c 2026-08-03
      -

   6.1 M3:
   -

      Build Date: w/c 2026-08-31
      -

      Release Date: w/c 2026-09-14
      -

   6.1.0:
   -

      Build Date (M4): w/c 2026-10-12
      -

      Release Date: w/c 2026-11-02


Upcoming dot releases:

   -

   YP 5.0.18 is in review.
   -

   YP 6.0.1 is in QA.
   -

   YP 6.0.2
   -

      Build Date  2026-06-23
      -

      Release Date 2026-07-06
      -

   YP 5.0.19
   -

      Build Date  2026-06-30
      -

      Release Date 2026-07-13
      -

   For future release dates, see
   https://wiki.yoctoproject.org/wiki/Release_calendar


The Yocto Project=E2=80=99s technical governance is through its Technical S=
teering
Committee, more information is available at:

https://wiki.yoctoproject.org/wiki/TSC

The Status reports are now stored on the wiki at:
https://wiki.yoctoproject.org/wiki/Weekly_Status

[If anyone has suggestions for other information you=E2=80=99d like to see =
on this
weekly status update, let us know!]

Thanks,

Stephen

--000000000000d84b54065346a6ef
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><span id=3D"gmail-docs-internal-guid-a697e518-7fff-3a6a-2d=
7c-c3e3f58a7944"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;ma=
rgin-bottom:0pt"><span style=3D"font-size:11pt;font-family:Arial,sans-serif=
;color:rgb(0,0,0);background-color:transparent;font-variant:normal;vertical=
-align:baseline;white-space:pre-wrap">Current Dev Position: YP 6.1 M1</span=
></p><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:=
0pt"><span style=3D"font-size:11pt;font-family:Arial,sans-serif;color:rgb(0=
,0,0);background-color:transparent;font-variant:normal;vertical-align:basel=
ine;white-space:pre-wrap">Next Deadline: YP </span><span style=3D"font-size=
:9.5pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-color:trans=
parent;font-variant:normal;vertical-align:baseline;white-space:pre-wrap">6.=
1 M1:</span><span style=3D"font-size:11pt;font-family:Arial,sans-serif;colo=
r:rgb(0,0,0);background-color:transparent;font-variant:normal;vertical-alig=
n:baseline;white-space:pre-wrap"> w/c 2026-06-08</span></p><br><p dir=3D"lt=
r" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=
=3D"font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background=
-color:transparent;font-variant:normal;vertical-align:baseline;white-space:=
pre-wrap">Next Team Meetings:</span></p><ul style=3D"margin-top:0px;margin-=
bottom:0px"><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:9.5pt;f=
ont-family:Arial,sans-serif;color:rgb(0,0,0);background-color:transparent;f=
ont-variant:normal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" =
style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"present=
ation"><span style=3D"font-size:11pt;background-color:transparent;font-vari=
ant:normal;vertical-align:baseline;white-space:pre-wrap">Bug Triage meeting=
 - Thursday 4th June 7:30am PDT (</span><a href=3D"https://zoom.us/j/454367=
603?pwd=3DZGxoa2ZXL3FkM3Y0bFd5aVpHVVZ6dz09" style=3D"text-decoration:none">=
<span style=3D"font-size:11pt;background-color:transparent;font-variant:nor=
mal;text-decoration:underline;vertical-align:baseline;white-space:pre-wrap"=
>https://zoom.us/j/454367603?pwd=3DZGxoa2ZXL3FkM3Y0bFd5aVpHVVZ6dz09</span><=
/a><span style=3D"font-size:11pt;background-color:transparent;font-variant:=
normal;vertical-align:baseline;white-space:pre-wrap">)</span></p></li><li d=
ir=3D"ltr" style=3D"list-style-type:disc;font-size:9.5pt;font-family:Arial,=
sans-serif;color:rgb(0,0,0);background-color:transparent;font-variant:norma=
l;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-hei=
ght:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span styl=
e=3D"font-size:11pt;background-color:transparent;font-variant:normal;vertic=
al-align:baseline;white-space:pre-wrap">Weekly Project Engineering Sync=C2=
=A0 - Tuesday 2nd June. 8am PDT (</span><a href=3D"https://zoom.us/j/990892=
712?pwd=3DcHU1MjhoM2x6ck81bkcrYjRrcmJsUT09" style=3D"text-decoration:none">=
<span style=3D"font-size:11pt;background-color:transparent;font-variant:nor=
mal;text-decoration:underline;vertical-align:baseline;white-space:pre-wrap"=
>https://zoom.us/j/990892712?pwd=3DcHU1MjhoM2x6ck81bkcrYjRrcmJsUT09</span><=
/a><a href=3D"https://zoom.us/j/990892712" style=3D"text-decoration:none"><=
span style=3D"font-size:11pt;background-color:transparent;font-variant:norm=
al;text-decoration:underline;vertical-align:baseline;white-space:pre-wrap">=
)</span></a></p></li><li dir=3D"ltr" style=3D"list-style-type:disc;font-siz=
e:9.5pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-color:tran=
sparent;font-variant:normal;vertical-align:baseline;white-space:pre"><p dir=
=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=
=3D"presentation"><span style=3D"font-size:11pt;background-color:transparen=
t;font-variant:normal;vertical-align:baseline;white-space:pre-wrap">Yocto P=
roject Patch Review - Thursday 4th June 10am GMT and Monday 8th June 9am PD=
T (</span><a href=3D"https://zoom.us/j/97762397148?pwd=3D1xkiC9hp9SjEonaTaO=
NwTb6iWry4Eb.1" style=3D"text-decoration:none"><span style=3D"font-size:11p=
t;background-color:transparent;font-variant:normal;text-decoration:underlin=
e;vertical-align:baseline;white-space:pre-wrap">https://zoom.us/j/9776239</=
span></a><span style=3D"font-size:11pt;background-color:transparent;font-va=
riant:normal;vertical-align:baseline;white-space:pre-wrap">7</span><a href=
=3D"https://zoom.us/j/97762397148?pwd=3D1xkiC9hp9SjEonaTaONwTb6iWry4Eb.1" s=
tyle=3D"text-decoration:none"><span style=3D"font-size:11pt;background-colo=
r:transparent;font-variant:normal;text-decoration:underline;vertical-align:=
baseline;white-space:pre-wrap">148?pwd=3D1xk0iC9hp9SjEonaTaONwTb6iWry4Eb.1<=
/span></a><span style=3D"font-size:11pt;background-color:transparent;font-v=
ariant:normal;vertical-align:baseline;white-space:pre-wrap">)</span></p></l=
i></ul><br><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-b=
ottom:0pt"><span style=3D"font-size:11pt;font-family:Arial,sans-serif;color=
:rgb(0,0,0);background-color:transparent;font-variant:normal;vertical-align=
:baseline;white-space:pre-wrap">Project data dashboard: </span><a href=3D"h=
ttps://dashboard.yoctoproject.org/" style=3D"text-decoration:none"><span st=
yle=3D"font-size:11pt;font-family:Arial,sans-serif;background-color:transpa=
rent;font-variant:normal;text-decoration:underline;vertical-align:baseline;=
white-space:pre-wrap">https://dashboard.yoctoproject.org/</span></a><span s=
tyle=3D"font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);backgr=
ound-color:transparent;font-variant:normal;vertical-align:baseline;white-sp=
ace:pre-wrap">=C2=A0</span></p><br><p dir=3D"ltr" style=3D"line-height:1.38=
;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-famil=
y:Arial,sans-serif;color:rgb(0,0,0);background-color:transparent;font-varia=
nt:normal;vertical-align:baseline;white-space:pre-wrap">Key Status/Updates:=
</span></p><ul style=3D"margin-top:0px;margin-bottom:0px"><li dir=3D"ltr" s=
tyle=3D"list-style-type:disc;font-size:11pt;font-family:Arial,sans-serif;co=
lor:rgb(0,0,0);background-color:transparent;font-variant:normal;vertical-al=
ign:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;marg=
in-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"font-siz=
e:11pt;background-color:transparent;font-variant:normal;vertical-align:base=
line;white-space:pre-wrap">YP 5.0.18 is due to be released</span></p></li><=
li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-family:Ari=
al,sans-serif;color:rgb(0,0,0);background-color:transparent;font-variant:no=
rmal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-=
height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span s=
tyle=3D"font-size:11pt;background-color:transparent;font-variant:normal;ver=
tical-align:baseline;white-space:pre-wrap">YP 6.0.1 is in QA.</span></p></l=
i><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-family:=
Arial,sans-serif;color:rgb(0,0,0);background-color:transparent;font-variant=
:normal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"li=
ne-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><spa=
n style=3D"font-size:11pt;background-color:transparent;font-variant:normal;=
vertical-align:baseline;white-space:pre-wrap">YP 6.1 M1 is due to build nex=
t week</span></p></li><li dir=3D"ltr" style=3D"list-style-type:disc;font-si=
ze:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-color:tran=
sparent;font-variant:normal;vertical-align:baseline;white-space:pre"><p dir=
=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=
=3D"presentation"><span style=3D"font-size:11pt;background-color:transparen=
t;font-variant:normal;vertical-align:baseline;white-space:pre-wrap">We=E2=
=80=99re working through the backlog of patches, the bandwidth for changes =
needing in depth review/feedback continues to be a challenge.</span></p></l=
i><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-family:=
Arial,sans-serif;color:rgb(0,0,0);background-color:transparent;font-variant=
:normal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"li=
ne-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><spa=
n style=3D"font-size:11pt;background-color:transparent;font-variant:normal;=
vertical-align:baseline;white-space:pre-wrap">The upgrade to gcc 16 merged<=
/span></p></li><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt=
;font-family:Arial,sans-serif;color:rgb(0,0,0);background-color:transparent=
;font-variant:normal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr=
" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"prese=
ntation"><span style=3D"font-size:11pt;background-color:transparent;font-va=
riant:normal;vertical-align:baseline;white-space:pre-wrap">We are planning =
to improve our python subprocess calls to avoid shell=3DTrue, we would appr=
eciate others following and doing this in their code too.</span></p></li><l=
i dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-family:Aria=
l,sans-serif;color:rgb(0,0,0);background-color:transparent;font-variant:nor=
mal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-h=
eight:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span st=
yle=3D"font-size:11pt;background-color:transparent;font-variant:normal;vert=
ical-align:baseline;white-space:pre-wrap">Intermittent build failures conti=
nue to be problematic and unchanged from last week:</span></p></li><ul styl=
e=3D"margin-top:0px;margin-bottom:0px"><li dir=3D"ltr" style=3D"list-style-=
type:circle;font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);ba=
ckground-color:transparent;font-variant:normal;vertical-align:baseline;whit=
e-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin=
-bottom:0pt" role=3D"presentation"><span style=3D"font-size:11pt;background=
-color:transparent;font-variant:normal;vertical-align:baseline;white-space:=
pre-wrap">several qemu =E2=80=98hang=E2=80=99 type issues</span></p></li><l=
i dir=3D"ltr" style=3D"list-style-type:circle;font-size:11pt;font-family:Ar=
ial,sans-serif;color:rgb(0,0,0);background-color:transparent;font-variant:n=
ormal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line=
-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span =
style=3D"font-size:11pt;background-color:transparent;font-variant:normal;ve=
rtical-align:baseline;white-space:pre-wrap">sometimes yocto-check-layer is =
showing checksum mismatch issues</span></p></li><li dir=3D"ltr" style=3D"li=
st-style-type:circle;font-size:11pt;font-family:Arial,sans-serif;color:rgb(=
0,0,0);background-color:transparent;font-variant:normal;vertical-align:base=
line;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0=
pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"font-size:11pt;b=
ackground-color:transparent;font-variant:normal;vertical-align:baseline;whi=
te-space:pre-wrap">siggen reset issues (=E2=80=9CResourceWarning: unclosed =
transport=E2=80=9D)</span></p></li><li dir=3D"ltr" style=3D"list-style-type=
:circle;font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);backgr=
ound-color:transparent;font-variant:normal;vertical-align:baseline;white-sp=
ace:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bot=
tom:0pt" role=3D"presentation"><span style=3D"font-size:11pt;background-col=
or:transparent;font-variant:normal;vertical-align:baseline;white-space:pre-=
wrap">groff build race issues</span></p></li><li dir=3D"ltr" style=3D"list-=
style-type:circle;font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0=
,0);background-color:transparent;font-variant:normal;vertical-align:baselin=
e;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;=
margin-bottom:0pt" role=3D"presentation"><span style=3D"font-size:11pt;back=
ground-color:transparent;font-variant:normal;vertical-align:baseline;white-=
space:pre-wrap">intermittent ptest failures in many recipes</span></p></li>=
</ul><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-fami=
ly:Arial,sans-serif;color:rgb(0,0,0);background-color:transparent;font-vari=
ant:normal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D=
"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><=
span style=3D"font-size:11pt;background-color:transparent;font-variant:norm=
al;vertical-align:baseline;white-space:pre-wrap">Qemu v11 dropped support f=
or 32 bit hosts and we are likely to drop support for running builds on 32 =
bits hosts</span></p></li><li dir=3D"ltr" style=3D"list-style-type:disc;fon=
t-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-color:=
transparent;font-variant:normal;vertical-align:baseline;white-space:pre"><p=
 dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" ro=
le=3D"presentation"><span style=3D"font-size:11pt;background-color:transpar=
ent;font-variant:normal;vertical-align:baseline;white-space:pre-wrap">The u=
pstream kernel is looking likely to drop x32 support and if they do, we wil=
l have to drop our support too - let them/us know if you=E2=80=99re using i=
t!</span></p></li><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:1=
1pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-color:transpar=
ent;font-variant:normal;vertical-align:baseline;white-space:pre"><p dir=3D"=
ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"pr=
esentation"><span style=3D"font-size:11pt;background-color:transparent;font=
-variant:normal;vertical-align:baseline;white-space:pre-wrap">We would like=
 to know what people are planning to work on for Yocto Project 6.1 and beyo=
nd. We have a roadmap document in Google Docs: </span><a href=3D"https://do=
cs.google.com/document/d/12xgAzSjDj5zVlo4eQIbiv1s3QMjtBTCvBFY3_T7OPto" styl=
e=3D"text-decoration:none"><span style=3D"font-size:11pt;background-color:t=
ransparent;font-variant:normal;text-decoration:underline;vertical-align:bas=
eline;white-space:pre-wrap">https://docs.google.com/document/d/12xgAzSjDj5z=
Vlo4eQIbiv1s3QMjtBTCvBFY3_T7OPto</span></a></p></li></ul><br><p dir=3D"ltr"=
 style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D=
"font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-co=
lor:transparent;font-variant:normal;vertical-align:baseline;white-space:pre=
-wrap">Want to contribute? We would appreciate help with the following area=
s:</span></p><ul style=3D"margin-top:0px;margin-bottom:0px"><li dir=3D"ltr"=
 style=3D"list-style-type:disc;font-size:11pt;font-family:Arial,sans-serif;=
color:rgb(0,0,0);background-color:transparent;font-variant:normal;vertical-=
align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;ma=
rgin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"font-s=
ize:11pt;background-color:transparent;font-variant:normal;vertical-align:ba=
seline;white-space:pre-wrap">We have several open issues for pseudo and lim=
ited maintainer time to work on them. Help from someone familiar with syste=
ms programming in C would be greatly appreciated. </span><a href=3D"https:/=
/bugzilla.yoctoproject.org/buglist.cgi?list_id=3D661406&amp;priority=3DHigh=
&amp;priority=3DMedium%2B&amp;product=3DPseudo&amp;query_format=3Dadvanced&=
amp;resolution=3D---" style=3D"text-decoration:none"><span style=3D"font-si=
ze:11pt;background-color:transparent;font-variant:normal;text-decoration:un=
derline;vertical-align:baseline;white-space:pre-wrap">https://bugzilla.yoct=
oproject.org/buglist.cgi?list_id=3D661406&amp;priority=3DHigh&amp;priority=
=3DMedium%2B&amp;product=3DPseudo&amp;query_format=3Dadvanced&amp;resolutio=
n=3D---</span></a></p></li><li dir=3D"ltr" style=3D"list-style-type:disc;fo=
nt-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-color=
:transparent;font-variant:normal;vertical-align:baseline;white-space:pre"><=
p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" r=
ole=3D"presentation"><span style=3D"font-size:11pt;background-color:transpa=
rent;font-variant:normal;vertical-align:baseline;white-space:pre-wrap">Ther=
e are a large number of intermittent failures on our autobuilder, any help =
with investigating, reproducing or solving these issues would be welcome! <=
/span><a href=3D"https://valkyrie.yocto.io/pub/non-release/abint/" style=3D=
"text-decoration:none"><span style=3D"font-size:11pt;background-color:trans=
parent;font-variant:normal;text-decoration:underline;vertical-align:baselin=
e;white-space:pre-wrap">https://valkyrie.yocto.io/pub/non-release/abint/</s=
pan></a></p></li><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11=
pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-color:transpare=
nt;font-variant:normal;vertical-align:baseline;white-space:pre"><p dir=3D"l=
tr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"pre=
sentation"><span style=3D"font-size:11pt;background-color:transparent;font-=
variant:normal;vertical-align:baseline;white-space:pre-wrap">Many recipes i=
n openembedded-core would benefit from a new recipe maintainer. Please look=
 at </span><a href=3D"https://git.openembedded.org/openembedded-core/tree/m=
eta/conf/distro/include/maintainers.inc" style=3D"text-decoration:none"><sp=
an style=3D"font-size:11pt;background-color:transparent;font-variant:normal=
;text-decoration:underline;vertical-align:baseline;white-space:pre-wrap">ht=
tps://git.openembedded.org/openembedded-core/tree/meta/conf/distro/include/=
maintainers.inc</span></a><span style=3D"font-size:11pt;background-color:tr=
ansparent;font-variant:normal;vertical-align:baseline;white-space:pre-wrap"=
> and see if you can adopt any of the unassigned recipes.</span></p></li><l=
i dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-family:Aria=
l,sans-serif;color:rgb(0,0,0);background-color:transparent;font-variant:nor=
mal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-h=
eight:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span st=
yle=3D"font-size:11pt;background-color:transparent;font-variant:normal;vert=
ical-align:baseline;white-space:pre-wrap">For more ways to contribute, see =
</span><a href=3D"https://docs.google.com/document/d/18oxKWxLorfF813h82mK6y=
KTIHeBp_-9owFuCWbzgjOk/edit?usp=3Dsharing" style=3D"text-decoration:none"><=
span style=3D"font-size:11pt;background-color:transparent;font-variant:norm=
al;text-decoration:underline;vertical-align:baseline;white-space:pre-wrap">=
https://docs.google.com/document/d/18oxKWxLorfF813h82mK6yKTIHeBp_-9owFuCWbz=
gjOk/edit?usp=3Dsharing</span></a></p></li></ul><br><p dir=3D"ltr" style=3D=
"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-siz=
e:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-color:trans=
parent;font-variant:normal;vertical-align:baseline;white-space:pre-wrap">Ne=
w to the project?</span></p><ul style=3D"margin-top:0px;margin-bottom:0px">=
<li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-family:Ar=
ial,sans-serif;color:rgb(0,0,0);background-color:transparent;font-variant:n=
ormal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line=
-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span =
style=3D"font-size:11pt;background-color:transparent;font-variant:normal;ve=
rtical-align:baseline;white-space:pre-wrap">We have a list of issues we thi=
nk are good places to start contributing: </span><a href=3D"https://bugzill=
a.yoctoproject.org/buglist.cgi?quicksearch=3DNEWCOMER" style=3D"text-decora=
tion:none"><span style=3D"font-size:11pt;background-color:transparent;font-=
variant:normal;text-decoration:underline;vertical-align:baseline;white-spac=
e:pre-wrap">https://bugzilla.yoctoproject.org/buglist.cgi?quicksearch=3DNEW=
COMER</span></a></p></li></ul><br><p dir=3D"ltr" style=3D"line-height:1.38;=
margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-family=
:Arial,sans-serif;color:rgb(0,0,0);background-color:transparent;font-varian=
t:normal;vertical-align:baseline;white-space:pre-wrap">Tracking Metrics:</s=
pan></p><ul style=3D"margin-top:0px;margin-bottom:0px"><li dir=3D"ltr" styl=
e=3D"list-style-type:disc;font-size:11pt;font-family:Arial,sans-serif;color=
:rgb(0,0,0);background-color:transparent;font-variant:normal;vertical-align=
:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-=
top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"font-size:1=
1pt;background-color:transparent;font-variant:normal;vertical-align:baselin=
e;white-space:pre-wrap">WDD 2630 (last week 2660) </span><span style=3D"fon=
t-size:11pt;font-family:Consolas,sans-serif;background-color:transparent;fo=
nt-variant:normal;vertical-align:baseline;white-space:pre-wrap">(</span><a =
href=3D"https://wiki.yoctoproject.org/charts/combo.html" style=3D"text-deco=
ration:none"><span style=3D"font-size:11pt;background-color:transparent;fon=
t-variant:normal;text-decoration:underline;vertical-align:baseline;white-sp=
ace:pre-wrap">https://wiki.yoctoproject.org/charts/combo.html</span></a><sp=
an style=3D"font-size:11pt;font-family:Consolas,sans-serif;background-color=
:transparent;font-variant:normal;vertical-align:baseline;white-space:pre-wr=
ap">)</span></p></li><li dir=3D"ltr" style=3D"list-style-type:disc;font-siz=
e:11pt;font-family:Consolas,sans-serif;color:rgb(0,0,0);background-color:tr=
ansparent;font-variant:normal;vertical-align:baseline;white-space:pre"><p d=
ir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=
=3D"presentation"><span style=3D"font-size:11pt;font-family:Arial,sans-seri=
f;background-color:transparent;font-variant:normal;vertical-align:baseline;=
white-space:pre-wrap">OE-Core/Poky Patch Metrics</span></p></li><ul style=
=3D"margin-top:0px;margin-bottom:0px"><li dir=3D"ltr" style=3D"list-style-t=
ype:circle;font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);bac=
kground-color:transparent;font-variant:normal;vertical-align:baseline;white=
-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-=
bottom:0pt" role=3D"presentation"><span style=3D"font-size:11pt;background-=
color:transparent;font-variant:normal;vertical-align:baseline;white-space:p=
re-wrap">Total patches found: 1087 (last week 1083)</span></p></li><li dir=
=3D"ltr" style=3D"list-style-type:circle;font-size:11pt;font-family:Arial,s=
ans-serif;color:rgb(0,0,0);background-color:transparent;font-variant:normal=
;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-heig=
ht:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=
=3D"font-size:11pt;background-color:transparent;font-variant:normal;vertica=
l-align:baseline;white-space:pre-wrap">Patches in the Pending State: 147 (1=
4%) [last week 148 (14%)]</span></p></li><li dir=3D"ltr" style=3D"list-styl=
e-type:circle;font-size:11pt;font-family:Consolas,sans-serif;color:rgb(0,0,=
0);background-color:transparent;font-variant:normal;vertical-align:baseline=
;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;m=
argin-bottom:0pt" role=3D"presentation"><a href=3D"https://valkyrie.yocto.i=
o/pub/non-release/patchmetrics/" style=3D"text-decoration:none"><span style=
=3D"font-size:11pt;font-family:Arial,sans-serif;background-color:transparen=
t;font-variant:normal;text-decoration:underline;vertical-align:baseline;whi=
te-space:pre-wrap">https://valkyrie.yocto.io/pub/non-release/patchmetrics/<=
/span></a></p></li></ul></ul><br><p dir=3D"ltr" style=3D"line-height:1.38;m=
argin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-family:=
Arial,sans-serif;color:rgb(0,0,0);background-color:transparent;font-variant=
:normal;vertical-align:baseline;white-space:pre-wrap">Upcoming development =
releases:</span></p><ul style=3D"margin-top:0px;margin-bottom:0px"><li dir=
=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-family:Arial,san=
s-serif;color:rgb(0,0,0);background-color:transparent;font-variant:normal;v=
ertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height=
:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=
=3D"font-size:11pt;background-color:transparent;font-variant:normal;vertica=
l-align:baseline;white-space:pre-wrap">6.1 M1:=C2=A0</span></p></li><ul sty=
le=3D"margin-top:0px;margin-bottom:0px"><li dir=3D"ltr" style=3D"list-style=
-type:circle;font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);b=
ackground-color:transparent;font-variant:normal;vertical-align:baseline;whi=
te-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margi=
n-bottom:0pt" role=3D"presentation"><span style=3D"font-size:11pt;backgroun=
d-color:transparent;font-variant:normal;vertical-align:baseline;white-space=
:pre-wrap">Build Date: w/c 2026-06-08</span></p></li><li dir=3D"ltr" style=
=3D"list-style-type:circle;font-size:11pt;font-family:Arial,sans-serif;colo=
r:rgb(0,0,0);background-color:transparent;font-variant:normal;vertical-alig=
n:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin=
-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"font-size:=
11pt;background-color:transparent;font-variant:normal;vertical-align:baseli=
ne;white-space:pre-wrap">Release Date: w/c 2026-06-22</span></p></li></ul><=
li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-family:Ari=
al,sans-serif;color:rgb(0,0,0);background-color:transparent;font-variant:no=
rmal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-=
height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span s=
tyle=3D"font-size:11pt;background-color:transparent;font-variant:normal;ver=
tical-align:baseline;white-space:pre-wrap">6.1 M2:</span></p></li><ul style=
=3D"margin-top:0px;margin-bottom:0px"><li dir=3D"ltr" style=3D"list-style-t=
ype:circle;font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);bac=
kground-color:transparent;font-variant:normal;vertical-align:baseline;white=
-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-=
bottom:0pt" role=3D"presentation"><span style=3D"font-size:11pt;background-=
color:transparent;font-variant:normal;vertical-align:baseline;white-space:p=
re-wrap">Build Date: w/c 2026-07-20</span></p></li><li dir=3D"ltr" style=3D=
"list-style-type:circle;font-size:11pt;font-family:Arial,sans-serif;color:r=
gb(0,0,0);background-color:transparent;font-variant:normal;vertical-align:b=
aseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-to=
p:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"font-size:11p=
t;background-color:transparent;font-variant:normal;vertical-align:baseline;=
white-space:pre-wrap">Release Date: w/c 2026-08-03</span></p></li></ul><li =
dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-family:Arial,=
sans-serif;color:rgb(0,0,0);background-color:transparent;font-variant:norma=
l;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-hei=
ght:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span styl=
e=3D"font-size:11pt;background-color:transparent;font-variant:normal;vertic=
al-align:baseline;white-space:pre-wrap">6.1 M3:</span></p></li><ul style=3D=
"margin-top:0px;margin-bottom:0px"><li dir=3D"ltr" style=3D"list-style-type=
:circle;font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);backgr=
ound-color:transparent;font-variant:normal;vertical-align:baseline;white-sp=
ace:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bot=
tom:0pt" role=3D"presentation"><span style=3D"font-size:11pt;background-col=
or:transparent;font-variant:normal;vertical-align:baseline;white-space:pre-=
wrap">Build Date: w/c 2026-08-31</span></p></li><li dir=3D"ltr" style=3D"li=
st-style-type:circle;font-size:11pt;font-family:Arial,sans-serif;color:rgb(=
0,0,0);background-color:transparent;font-variant:normal;vertical-align:base=
line;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0=
pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"font-size:11pt;b=
ackground-color:transparent;font-variant:normal;vertical-align:baseline;whi=
te-space:pre-wrap">Release Date: w/c 2026-09-14</span></p></li></ul><li dir=
=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-family:Arial,san=
s-serif;color:rgb(0,0,0);background-color:transparent;font-variant:normal;v=
ertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height=
:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=
=3D"font-size:11pt;background-color:transparent;font-variant:normal;vertica=
l-align:baseline;white-space:pre-wrap">6.1.0:</span></p></li><ul style=3D"m=
argin-top:0px;margin-bottom:0px"><li dir=3D"ltr" style=3D"list-style-type:c=
ircle;font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);backgrou=
nd-color:transparent;font-variant:normal;vertical-align:baseline;white-spac=
e:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-botto=
m:0pt" role=3D"presentation"><span style=3D"font-size:11pt;background-color=
:transparent;font-variant:normal;vertical-align:baseline;white-space:pre-wr=
ap">Build Date (M4): w/c 2026-10-12</span></p></li><li dir=3D"ltr" style=3D=
"list-style-type:circle;font-size:11pt;font-family:Arial,sans-serif;color:r=
gb(0,0,0);background-color:transparent;font-variant:normal;vertical-align:b=
aseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-to=
p:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"font-size:11p=
t;background-color:transparent;font-variant:normal;vertical-align:baseline;=
white-space:pre-wrap">Release Date: w/c 2026-11-02</span></p></li></ul></ul=
><br><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:=
0pt"><span style=3D"font-size:11pt;font-family:Arial,sans-serif;color:rgb(0=
,0,0);background-color:transparent;font-variant:normal;vertical-align:basel=
ine;white-space:pre-wrap">Upcoming dot releases:</span></p><ul style=3D"mar=
gin-top:0px;margin-bottom:0px"><li dir=3D"ltr" style=3D"list-style-type:dis=
c;font-size:11pt;font-family:Arial,sans-serif;background-color:transparent;=
font-variant:normal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr"=
 style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presen=
tation"><span style=3D"font-size:11pt;font-variant:normal;vertical-align:ba=
seline;white-space:pre-wrap">YP 5.0.18 is in review.</span></p></li><li dir=
=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-family:Arial,san=
s-serif;background-color:transparent;font-variant:normal;vertical-align:bas=
eline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:=
0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"font-size:11pt;=
font-variant:normal;vertical-align:baseline;white-space:pre-wrap">YP 6.0.1 =
is in QA.</span></p></li><li dir=3D"ltr" style=3D"list-style-type:disc;font=
-size:11pt;font-family:Arial,sans-serif;background-color:transparent;font-v=
ariant:normal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=
=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation=
"><span style=3D"font-size:11pt;font-variant:normal;vertical-align:baseline=
;white-space:pre-wrap">YP 6.0.2</span></p></li><ul style=3D"margin-top:0px;=
margin-bottom:0px"><li dir=3D"ltr" style=3D"list-style-type:circle;font-siz=
e:11pt;font-family:Arial,sans-serif;background-color:transparent;font-varia=
nt:normal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"=
line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><s=
pan style=3D"font-size:11pt;font-variant:normal;vertical-align:baseline;whi=
te-space:pre-wrap">Build Date=C2=A0 2026-06-23</span></p></li><li dir=3D"lt=
r" style=3D"list-style-type:circle;font-size:11pt;font-family:Arial,sans-se=
rif;background-color:transparent;font-variant:normal;vertical-align:baselin=
e;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;=
margin-bottom:0pt" role=3D"presentation"><span style=3D"font-size:11pt;font=
-variant:normal;vertical-align:baseline;white-space:pre-wrap">Release Date =
2026-07-06</span></p></li></ul><li dir=3D"ltr" style=3D"list-style-type:dis=
c;font-size:11pt;font-family:Arial,sans-serif;background-color:transparent;=
font-variant:normal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr"=
 style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presen=
tation"><span style=3D"font-size:11pt;font-variant:normal;vertical-align:ba=
seline;white-space:pre-wrap">YP 5.0.19</span></p></li><ul style=3D"margin-t=
op:0px;margin-bottom:0px"><li dir=3D"ltr" style=3D"list-style-type:circle;f=
ont-size:11pt;font-family:Arial,sans-serif;background-color:transparent;fon=
t-variant:normal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" st=
yle=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentat=
ion"><span style=3D"font-size:11pt;font-variant:normal;vertical-align:basel=
ine;white-space:pre-wrap">Build Date=C2=A0 2026-06-30</span></p></li><li di=
r=3D"ltr" style=3D"list-style-type:circle;font-size:11pt;font-family:Arial,=
sans-serif;background-color:transparent;font-variant:normal;vertical-align:=
baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-t=
op:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"font-size:11=
pt;font-variant:normal;vertical-align:baseline;white-space:pre-wrap">Releas=
e Date 2026-07-13</span></p></li></ul><li dir=3D"ltr" style=3D"list-style-t=
ype:disc;font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);backg=
round-color:transparent;font-variant:normal;vertical-align:baseline;white-s=
pace:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bo=
ttom:0pt" role=3D"presentation"><span style=3D"font-size:11pt;background-co=
lor:transparent;font-variant:normal;vertical-align:baseline;white-space:pre=
-wrap">For future release dates, see </span><a href=3D"https://wiki.yoctopr=
oject.org/wiki/Release_calendar" style=3D"text-decoration:none"><span style=
=3D"font-size:11pt;background-color:transparent;font-variant:normal;text-de=
coration:underline;vertical-align:baseline;white-space:pre-wrap">https://wi=
ki.yoctoproject.org/wiki/Release_calendar</span></a></p></li></ul><br><p di=
r=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span=
 style=3D"font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);back=
ground-color:transparent;font-variant:normal;vertical-align:baseline;white-=
space:pre-wrap">The Yocto Project=E2=80=99s technical governance is through=
 its Technical Steering Committee, more information is available at:</span>=
</p><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0=
pt"><a href=3D"https://wiki.yoctoproject.org/wiki/TSC" style=3D"text-decora=
tion:none"><span style=3D"font-size:11pt;font-family:Arial,sans-serif;backg=
round-color:transparent;font-variant:normal;text-decoration:underline;verti=
cal-align:baseline;white-space:pre-wrap">https://wiki.yoctoproject.org/wiki=
/TSC</span></a></p><br><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:=
0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-family:Arial,sans=
-serif;color:rgb(0,0,0);background-color:transparent;font-variant:normal;ve=
rtical-align:baseline;white-space:pre-wrap">The Status reports are now stor=
ed on the wiki at: </span><a href=3D"https://wiki.yoctoproject.org/wiki/Wee=
kly_Status" style=3D"text-decoration:none"><span style=3D"font-size:11pt;fo=
nt-family:Arial,sans-serif;background-color:transparent;font-variant:normal=
;text-decoration:underline;vertical-align:baseline;white-space:pre-wrap">ht=
tps://wiki.yoctoproject.org/wiki/Weekly_Status</span></a></p><br><p dir=3D"=
ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span styl=
e=3D"font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);backgroun=
d-color:transparent;font-variant:normal;vertical-align:baseline;white-space=
:pre-wrap">[If anyone has suggestions for other information you=E2=80=99d l=
ike to see on this weekly status update, let us know!]</span></p></span><br=
 class=3D"gmail-Apple-interchange-newline"><div>Thanks,</div><div><br></div=
><div>Stephen</div></div>

--000000000000d84b54065346a6ef--

