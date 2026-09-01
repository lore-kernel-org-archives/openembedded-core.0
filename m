Return-Path: <sjolley.yp.pm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E020EC624D4
	for <webhook@archiver.kernel.org>; Tue,  1 Sep 2026 14:46:09 +0000 (UTC)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9976.1788273960349135337
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Sep 2026 07:46:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=ewC8Dtl2;
 spf=pass (domain: gmail.com, ip: 209.85.215.175, mailfrom: sjolley.yp.pm@gmail.com)
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-cc147d86bebso1649989a12.0
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Sep 2026 07:46:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788273960; cv=none;
        d=google.com; s=arc-20260327;
        b=e+QV6c1g07Y1do59AgO5a3VCp8FuRLefmeJsoG9uUFpuErfph6pUfU8rTIQIpB6SlD
         j+23wyDcjuS7cGHVPBcWnDPSW2vwUtVbnxkjR2SguYCf0lj5CHr3mlOV1TeBW9/F3xdT
         6P7qfTxiZAtHqPM08Glv8nA59DgOR+d/jyumLToZTbFedT4DTv+AA1733z18YyRjkN3I
         Sn/apf/SoZFIRUynkPlfYAl9lbOwRqT+Wd36RGGoGn8uhrJfOrD5oKAWr2D0WMbnokgg
         2jxLY9kUyUxrDGH9be6g6asG6Af0R7flawhTJ2F0xGGx4ueaW71lCI2qcht3ECZhT0Xs
         6eAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=IlqkM6oFC6DIg0N05Ce6FtytTg//c0yHacmPi2/uHzU=;
        fh=mlkk44UTG4bDVFBBGWB2N+ColpZMHYd57+UjRGOkqQc=;
        b=JCRlvK1S9PH7JDq28SlV2Whi0SEvFwZDms0xv5bL0iDmYLg744G6n47T9kQ1UX2iBg
         R29l5BOHqmgzALFjtE/Q+tt3CwY0MEbWS+gH6GPL/Ub6nEPUDLGKw5xFHzxIpn+BXe+e
         5X2BnhWCKQPXmBUmNQSl+Hr+TKEWFOtTcYH/KY2JrfdWlrMytP9WJV8rM7GgnzgWBeUD
         owdvD+fS8Q2s4M/+cJDRc0jNpbO8g/lIQ26Bze1tnJMj354H2IyZyDH0VFFES3PuKQCR
         9/g/7k43g/RqLnTXd/MS51U39nrQo7XQjIe0YSQSmV///esJ39taJ2G9gldX+Gmoxa+K
         kSKw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788273960; x=1788878760; darn=lists.openembedded.org;
        h=content-type:to:subject:message-id:date:from:mime-version:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=IlqkM6oFC6DIg0N05Ce6FtytTg//c0yHacmPi2/uHzU=;
        b=ewC8Dtl2yMaduGWulFC83GmhDHlzeYlalnC9xjCoEJCSM5ATofRKxcicBcxDej6rbM
         jpmXwIu1ki+hTK1B/JG681Klvq8lK3MsKmzeju0X/GP4SIBbUwh03DomTLt0KUgBMnBs
         bzo8oLH5w6/JoehauMKcBjQggdEg3hI+jAjj3Eyr4B/rKBb5JWhBUf3X5GTJ6SAKADmR
         jtw7KJgAPn9I5SMVQYyLwV0c9SQpKT+a/mA8OXZolrqkWMtZfcAuQH0JR8Mtol+7XAeQ
         zmFJxE7LC9yck+QDs9HVVABDLEPInzjHtIUG8Uc4qUzk//Sd8czFyQRYReYvvqAmfluA
         pxXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788273960; x=1788878760;
        h=content-type:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IlqkM6oFC6DIg0N05Ce6FtytTg//c0yHacmPi2/uHzU=;
        b=OSxgD9DvjVS6CQppZG6aOAvjUWSBTlg1K4+Zvv8b+TBgpOUXWGW8P/M4hPDQYfqJFJ
         vMSxrm0L3galNhPeZwLgZrO38PorbSkHhil3jEdpU065eqwVVUExrUCgfaNi73gpejpE
         6BsgDJvkt8va5NZF5r3G8/4HtZxC2Fy61o7ml8dVgv8+zPNpnhiAirha25Hle7WBG4vZ
         bHMovf92iaXUqy3IVyRQ1bG/nZnJhW9jvuXkTdR+oPaBqx9Ixa2jXSUMB9jMb7gXZcIQ
         rkX1SA180Gon52PtmyeUxaqX+C4jaQm+JheATaqA3J2+F1QXRlBXNu3oUYW5NT47oTUA
         1tHw==
X-Forwarded-Encrypted: i=1; AKwUvByTLColly4SGUujBRC2AN29U9EufFMxT26V5be9CB/LoccxyNeDfOL+7eUD51irKNdsDZ5mmWJPGXeLw6PqgcAM+A==@lists.openembedded.org
X-Gm-Message-State: AFuF++ksMULkBlrqqVZT7LaTfLgEOTWFBSN6rFtN7HmdRB53K4BjVwL9
	xCZvRyzJ6qk/5eIwFnsChjpJ2O3wFk8LPbry9/7MoxJI/4mL7/u3tx3AbcF6d87PkFEQd4vaUXN
	tEPbph9motyUnJvH7v6dx7GlGnVm78Z0=
X-Gm-Gg: AYBFou2ATYYfS4dUfbF0rf9sZye3InHoxeVUi4Z4BLh2KkZHrfUhiSHLbOQ0X6Wqr/8
	XuwQw1gUT9G9ezAVEjSM7Malcuo4YGo/djj3Z02zOOftuJX77eFhPnV/qn88qQ6Fk6dayIKQeyF
	Z3ylvt6iCMTpJlmbGTmw2uSwmVSrZqxjTI4d2E90vrelju+6qvXgiZY81oQx8bFXpiLQDwMeqWf
	R+geqdjAw9azKJRw+Du3hWLb9wmzU0kyhidTQkoQDYvz5E4+X2dlcTVZu1OxSWfhA6Jw+mZlFLH
	WqCSH2j++VfodwLczmWP5qDCBhx43CQfE6jyK30NyVVjuG5K1IOi/hy6OEZFLZ+zYJA6rhHBWY0
	V1E/Lnj/rVxZiQoU53GTchEEVgvti74YIbM5/YJla7euwKIIYZj2k0X0Vkcy/ocsbo9H6o7vwoH
	eYR/HIQ4uub82OkcqX02o4ZnKBPBNPYf9CA691KrcQL4Pnacyt3r0mpG0fZvBUumqkghK/udS98
	ybo5cJBGlSCqD4ox7EhPr166C8=
X-Received: by 2002:a17:90b:2dd2:b0:396:d28e:b53 with SMTP id
 98e67ed59e1d1-3990f891a13mr6768271a91.20.1788273958899; Tue, 01 Sep 2026
 07:45:58 -0700 (PDT)
MIME-Version: 1.0
From: Stephen K Jolley <sjolley.yp.pm@gmail.com>
Date: Tue, 1 Sep 2026 07:45:48 -0700
X-Gm-Features: AcwNN1W0Uwa54sPFJO3b3Qt5WFUpZkjvKyCUk6P8VAcfyDwv5UKrJYYxjT7uWHw
Message-ID: <CAK5yBb-WKLTqfmnKvb7hOcUCV8QQXRDv-V=XQmysk9goNGOfzg@mail.gmail.com>
Subject: Yocto Project Status 1 September 2026 (WW36)
To: Yocto-mailing-list <yocto@lists.yoctoproject.org>, 
	",openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	yocto-status@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="00000000000014d29d065a6cfaf7"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Sep 2026 14:46:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244833

--00000000000014d29d065a6cfaf7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Current Dev Position: YP 6.1 M3 - Feature Freeze

Next Deadline: YP 6.1 M3: w/c 2026-08-31

Next Team Meetings:

   -

   Bug Triage meeting - Thursday 3rd Sept. 7:30am PDT (
   https://zoom.us/j/454367603?pwd=3DZGxoa2ZXL3FkM3Y0bFd5aVpHVVZ6dz09)
   -

   Weekly Project Engineering Sync  - Tuesday 1st Sept. 8am PDT (
   https://zoom.us/j/990892712?pwd=3DcHU1MjhoM2x6ck81bkcrYjRrcmJsUT09)
   <https://zoom.us/j/990892712>
   -

   Yocto Project Patch Review - Thursday 3rd Sept. 10am GMT and Monday 7th
   Sept. 9am PDT (
   https://zoom.us/j/97762397148?pwd=3D1xk0iC9hp9SjEonaTaONwTb6iWry4Eb.1)


Project data dashboard: https://dashboard.yoctoproject.org/

Key Status/Updates:

   -

   YP 6.0.3 is under review.
   -

   YP 5.0.20 is in QA.
   -

   YP 6.1 M3 is due to build this week and we are at feature freeze
   -

   For 6.1 M3 our current intent is to merge:
   -

      rpm 6
      -

      openssl 4
      -

      clang 23.1.0
      -

      7.2 linux kernel
      -

   There were bot protection issues on layerindex causing forbidden errors
   to queries from layerindex code. These have now been resolved and should=
 be
   working again.
   -

   AI scrapers and bots continue to impact the infrastructure, taking huge
   amounts of time for our sysadmins and with a significant cost impact to =
the
   project.
   -

   We continue to try and keep up to date with upstream releases through
   the AUH, big thanks to those sending version updates and fixing version
   update issues.

It is worth noting that the =E2=80=98success=E2=80=99 updates do still need=
 work on the
commit message changelogs and much of this work is being pushed to Richard.

   -

   There are two AB-INT issues which are in a position where others could
   now help, as detailed in
   https://lists.openembedded.org/g/openembedded-core/message/242105:
   -

      Matchbox-wm segfault/xserver restart
      -

      aarch64/x86-64 build host contamination/reproducibility issue

We get a lot of comments about these being hard to reproduce or work on, in
both cases, these have specific well defined things which need to be done
and a basic understanding of what the issue relates to, if not the actual
fix.

   -

   Remaining intermittent build failures of concern:
   -

      other qemu =E2=80=98hang=E2=80=99 type issues on ARM
      -

      sometimes yocto-check-layer is showing checksum mismatch issues
      -

      intermittent ptest failures in many recipes
      -

   Progress was made on some of the risc-v speed differences in qemu which
   should help some of the autobuilder intermittent failures, thanks Trevor=
!


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

   WDD 2612 (last week 2659) (
   https://wiki.yoctoproject.org/charts/combo.html)
   -

   OE-Core/Poky Patch Metrics
   -

      Total patches found: 1039 (last week 1028)
      -

      Patches in the Pending State: 139 (13%) [last week 139 (14%)]
      -

      https://valkyrie.yocto.io/pub/non-release/patchmetrics/


Upcoming development releases:

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

   YP 6.0.3 is in review,
   -

      Release Date w/c 2026-08-24
      -

   YP 5.0.20 is in QA.
   -

      Release Date w/c 2026-08-31
      -

   YP 6.0.4
   -

      Build Date w/c 2026-09-28
      -

      Release Date w/c 2026-10-12
      -

   YP 5.0.21
   -

      Build Date w/c 2026-10-05
      -

      Release Date w/c 2026-10-19
      -

   For future release dates, see
   https://wiki.yoctoproject.org/wiki/Release_calendar


The Yocto Project=E2=80=99s technical governance is through its Technical S=
teering
Committee, more information is available at:

https://wiki.yoctoproject.org/wiki/TSC

The Status reports are stored on the wiki at:
https://wiki.yoctoproject.org/wiki/Weekly_Status

[If anyone has suggestions for other information you=E2=80=99d like to see =
on this
weekly status update, let us know!]

Thanks,



*Stephen K. Jolley*

*Yocto Project Program Manager*

(    *Cell*:                (208) 244-4460

* *Email*:                 *s
<stephen.k.jolley@intel.com>jolley.yp.pm@gmail.com <jolley.yp.pm@gmail.com>=
*

--00000000000014d29d065a6cfaf7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><span id=3D"gmail-docs-internal-guid-f20cff65-7fff-a6=
29-99f8-b95ee54b97f9"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0=
pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-family:Arial,sans-=
serif;color:rgb(0,0,0);background-color:transparent;font-variant:normal;ver=
tical-align:baseline;white-space:pre-wrap">Current Dev Position: YP 6.1 M3 =
- Feature Freeze</span></p><p dir=3D"ltr" style=3D"line-height:1.38;margin-=
top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-family:Arial,=
sans-serif;color:rgb(0,0,0);background-color:transparent;font-variant:norma=
l;vertical-align:baseline;white-space:pre-wrap">Next Deadline: YP 6.1 M3: w=
/c 2026-08-31</span></p><br><p dir=3D"ltr" style=3D"line-height:1.38;margin=
-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-family:Arial=
,sans-serif;color:rgb(0,0,0);background-color:transparent;font-variant:norm=
al;vertical-align:baseline;white-space:pre-wrap">Next Team Meetings:</span>=
</p><ul style=3D"margin-top:0px;margin-bottom:0px"><li dir=3D"ltr" style=3D=
"list-style-type:disc;font-size:9.5pt;font-family:Arial,sans-serif;color:rg=
b(0,0,0);background-color:transparent;font-variant:normal;vertical-align:ba=
seline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top=
:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"font-size:11pt=
;background-color:transparent;font-variant:normal;vertical-align:baseline;w=
hite-space:pre-wrap">Bug Triage meeting - Thursday 3rd Sept. 7:30am PDT (</=
span><a href=3D"https://zoom.us/j/454367603?pwd=3DZGxoa2ZXL3FkM3Y0bFd5aVpHV=
VZ6dz09" style=3D"text-decoration:none"><span style=3D"font-size:11pt;backg=
round-color:transparent;font-variant:normal;text-decoration:underline;verti=
cal-align:baseline;white-space:pre-wrap">https://zoom.us/j/454367603?pwd=3D=
ZGxoa2ZXL3FkM3Y0bFd5aVpHVVZ6dz09</span></a><span style=3D"font-size:11pt;ba=
ckground-color:transparent;font-variant:normal;vertical-align:baseline;whit=
e-space:pre-wrap">)</span></p></li><li dir=3D"ltr" style=3D"list-style-type=
:disc;font-size:9.5pt;font-family:Arial,sans-serif;color:rgb(0,0,0);backgro=
und-color:transparent;font-variant:normal;vertical-align:baseline;white-spa=
ce:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bott=
om:0pt" role=3D"presentation"><span style=3D"font-size:11pt;background-colo=
r:transparent;font-variant:normal;vertical-align:baseline;white-space:pre-w=
rap">Weekly Project Engineering Sync=C2=A0 - Tuesday 1st Sept. 8am PDT (</s=
pan><a href=3D"https://zoom.us/j/990892712?pwd=3DcHU1MjhoM2x6ck81bkcrYjRrcm=
JsUT09" style=3D"text-decoration:none"><span style=3D"font-size:11pt;backgr=
ound-color:transparent;font-variant:normal;text-decoration:underline;vertic=
al-align:baseline;white-space:pre-wrap">https://zoom.us/j/990892712?pwd=3Dc=
HU1MjhoM2x6ck81bkcrYjRrcmJsUT09</span></a><a href=3D"https://zoom.us/j/9908=
92712" style=3D"text-decoration:none"><span style=3D"font-size:11pt;backgro=
und-color:transparent;font-variant:normal;text-decoration:underline;vertica=
l-align:baseline;white-space:pre-wrap">)</span></a></p></li><li dir=3D"ltr"=
 style=3D"list-style-type:disc;font-size:9.5pt;font-family:Arial,sans-serif=
;color:rgb(0,0,0);background-color:transparent;font-variant:normal;vertical=
-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;m=
argin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"font-=
size:11pt;background-color:transparent;font-variant:normal;vertical-align:b=
aseline;white-space:pre-wrap">Yocto Project Patch Review - Thursday 3rd Sep=
t. 10am GMT and Monday 7th Sept. 9am PDT (</span><a href=3D"https://zoom.us=
/j/97762397148?pwd=3D1xk0iC9hp9SjEonaTaONwTb6iWry4Eb.1" style=3D"text-decor=
ation:none"><span style=3D"font-size:11pt;background-color:transparent;font=
-variant:normal;text-decoration:underline;vertical-align:baseline;white-spa=
ce:pre-wrap">https://zoom.us/j/97762397148?pwd=3D1xk0iC9hp9SjEonaTaONwTb6iW=
ry4Eb.1</span></a><span style=3D"font-size:11pt;background-color:transparen=
t;font-variant:normal;vertical-align:baseline;white-space:pre-wrap">)</span=
></p></li></ul><br><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;=
margin-bottom:0pt"><span style=3D"font-size:11pt;font-family:Arial,sans-ser=
if;color:rgb(0,0,0);background-color:transparent;font-variant:normal;vertic=
al-align:baseline;white-space:pre-wrap">Project data dashboard: </span><a h=
ref=3D"https://dashboard.yoctoproject.org/" style=3D"text-decoration:none">=
<span style=3D"font-size:11pt;font-family:Arial,sans-serif;background-color=
:transparent;font-variant:normal;text-decoration:underline;vertical-align:b=
aseline;white-space:pre-wrap">https://dashboard.yoctoproject.org/</span></a=
><span style=3D"font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0=
);background-color:transparent;font-variant:normal;vertical-align:baseline;=
white-space:pre-wrap">=C2=A0</span></p><br><p dir=3D"ltr" style=3D"line-hei=
ght:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;fo=
nt-family:Arial,sans-serif;color:rgb(0,0,0);background-color:transparent;fo=
nt-variant:normal;vertical-align:baseline;white-space:pre-wrap">Key Status/=
Updates:</span></p><ul style=3D"margin-top:0px;margin-bottom:0px"><li dir=
=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-family:Arial,san=
s-serif;color:rgb(0,0,0);background-color:transparent;font-variant:normal;v=
ertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height=
:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=
=3D"font-size:11pt;background-color:transparent;font-variant:normal;vertica=
l-align:baseline;white-space:pre-wrap">YP 6.0.3 is under review.</span></p>=
</li><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-fami=
ly:Arial,sans-serif;color:rgb(0,0,0);background-color:transparent;font-vari=
ant:normal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D=
"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><=
span style=3D"font-size:11pt;background-color:transparent;font-variant:norm=
al;vertical-align:baseline;white-space:pre-wrap">YP 5.0.20 is in QA.</span>=
</p></li><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-=
family:Arial,sans-serif;color:rgb(0,0,0);background-color:transparent;font-=
variant:normal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" styl=
e=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentatio=
n"><span style=3D"font-size:11pt;background-color:transparent;font-variant:=
normal;vertical-align:baseline;white-space:pre-wrap">YP 6.1 M3 is due to bu=
ild this week and we are at feature freeze</span></p></li><li dir=3D"ltr" s=
tyle=3D"list-style-type:disc;font-size:11pt;font-family:Arial,sans-serif;co=
lor:rgb(0,0,0);background-color:transparent;font-variant:normal;vertical-al=
ign:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;marg=
in-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"font-siz=
e:11pt;background-color:transparent;font-variant:normal;vertical-align:base=
line;white-space:pre-wrap">For 6.1 M3 our current intent is to merge:</span=
></p></li><ul style=3D"margin-top:0px;margin-bottom:0px"><li dir=3D"ltr" st=
yle=3D"list-style-type:circle;font-size:11pt;font-family:Arial,sans-serif;c=
olor:rgb(0,0,0);background-color:transparent;font-variant:normal;vertical-a=
lign:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;mar=
gin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"font-si=
ze:11pt;background-color:transparent;font-variant:normal;vertical-align:bas=
eline;white-space:pre-wrap">rpm 6</span></p></li><li dir=3D"ltr" style=3D"l=
ist-style-type:circle;font-size:11pt;font-family:Arial,sans-serif;color:rgb=
(0,0,0);background-color:transparent;font-variant:normal;vertical-align:bas=
eline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:=
0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"font-size:11pt;=
background-color:transparent;font-variant:normal;vertical-align:baseline;wh=
ite-space:pre-wrap">openssl 4</span></p></li><li dir=3D"ltr" style=3D"list-=
style-type:circle;font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0=
,0);background-color:transparent;font-variant:normal;vertical-align:baselin=
e;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;=
margin-bottom:0pt" role=3D"presentation"><span style=3D"font-size:11pt;back=
ground-color:transparent;font-variant:normal;vertical-align:baseline;white-=
space:pre-wrap">clang 23.1.0</span></p></li><li dir=3D"ltr" style=3D"list-s=
tyle-type:circle;font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,=
0);background-color:transparent;font-variant:normal;vertical-align:baseline=
;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;m=
argin-bottom:0pt" role=3D"presentation"><span style=3D"font-size:11pt;backg=
round-color:transparent;font-variant:normal;vertical-align:baseline;white-s=
pace:pre-wrap">7.2 linux kernel</span></p></li></ul><li dir=3D"ltr" style=
=3D"list-style-type:disc;font-size:11pt;font-family:Arial,sans-serif;color:=
rgb(0,0,0);background-color:transparent;font-variant:normal;vertical-align:=
baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-t=
op:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"font-size:11=
pt;background-color:transparent;font-variant:normal;vertical-align:baseline=
;white-space:pre-wrap">There were bot protection issues on layerindex causi=
ng forbidden errors to queries from layerindex code. These have now been re=
solved and should be working again.</span></p></li><li dir=3D"ltr" style=3D=
"list-style-type:disc;font-size:11pt;font-family:Arial,sans-serif;color:rgb=
(0,0,0);background-color:transparent;font-variant:normal;vertical-align:bas=
eline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:=
0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"font-size:11pt;=
background-color:transparent;font-variant:normal;vertical-align:baseline;wh=
ite-space:pre-wrap">AI scrapers and bots continue to impact the infrastruct=
ure, taking huge amounts of time for our sysadmins and with a significant c=
ost impact to the project.</span></p></li><li dir=3D"ltr" style=3D"list-sty=
le-type:disc;font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);b=
ackground-color:transparent;font-variant:normal;vertical-align:baseline;whi=
te-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margi=
n-bottom:0pt" role=3D"presentation"><span style=3D"font-size:11pt;backgroun=
d-color:transparent;font-variant:normal;vertical-align:baseline;white-space=
:pre-wrap">We continue to try and keep up to date with upstream releases th=
rough the AUH, big thanks to those sending version updates and fixing versi=
on update issues.</span></p></li></ul><p dir=3D"ltr" style=3D"line-height:1=
.38;margin-left:36pt;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-=
size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-color:tr=
ansparent;font-variant:normal;vertical-align:baseline;white-space:pre-wrap"=
>It is worth noting that the =E2=80=98success=E2=80=99 updates do still nee=
d work on the commit message changelogs and much of this work is being push=
ed to Richard.</span></p><ul style=3D"margin-top:0px;margin-bottom:0px"><li=
 dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-family:Arial=
,sans-serif;color:rgb(0,0,0);background-color:transparent;font-variant:norm=
al;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-he=
ight:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span sty=
le=3D"font-size:11pt;background-color:transparent;font-variant:normal;verti=
cal-align:baseline;white-space:pre-wrap">There are two AB-INT issues which =
are in a position where others could now help, as detailed in </span><a hre=
f=3D"https://lists.openembedded.org/g/openembedded-core/message/242105" sty=
le=3D"text-decoration:none"><span style=3D"font-size:11pt;background-color:=
transparent;font-variant:normal;text-decoration:underline;vertical-align:ba=
seline;white-space:pre-wrap">https://lists.openembedded.org/g/openembedded-=
core/message/242105</span></a><span style=3D"font-size:11pt;background-colo=
r:transparent;font-variant:normal;vertical-align:baseline;white-space:pre-w=
rap">:</span></p></li><ul style=3D"margin-top:0px;margin-bottom:0px"><li di=
r=3D"ltr" style=3D"list-style-type:circle;font-size:11pt;font-family:Arial,=
sans-serif;color:rgb(0,0,0);background-color:transparent;font-variant:norma=
l;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-hei=
ght:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span styl=
e=3D"font-size:11pt;background-color:transparent;font-variant:normal;vertic=
al-align:baseline;white-space:pre-wrap">Matchbox-wm segfault/xserver restar=
t</span></p></li><li dir=3D"ltr" style=3D"list-style-type:circle;font-size:=
11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-color:transpa=
rent;font-variant:normal;vertical-align:baseline;white-space:pre"><p dir=3D=
"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"p=
resentation"><span style=3D"font-size:11pt;background-color:transparent;fon=
t-variant:normal;vertical-align:baseline;white-space:pre-wrap">aarch64/x86-=
64 build host contamination/reproducibility issue</span></p></li></ul></ul>=
<p dir=3D"ltr" style=3D"line-height:1.38;margin-left:36pt;margin-top:0pt;ma=
rgin-bottom:0pt"><span style=3D"font-size:11pt;font-family:Arial,sans-serif=
;color:rgb(0,0,0);background-color:transparent;font-variant:normal;vertical=
-align:baseline;white-space:pre-wrap">We get a lot of comments about these =
being hard to reproduce or work on, in both cases, these have specific well=
 defined things which need to be done and a basic understanding of what the=
 issue relates to, if not the actual fix.</span></p><ul style=3D"margin-top=
:0px;margin-bottom:0px"><li dir=3D"ltr" style=3D"list-style-type:disc;font-=
size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-color:tr=
ansparent;font-variant:normal;vertical-align:baseline;white-space:pre"><p d=
ir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=
=3D"presentation"><span style=3D"font-size:11pt;background-color:transparen=
t;font-variant:normal;vertical-align:baseline;white-space:pre-wrap">Remaini=
ng intermittent build failures of concern:</span></p></li><ul style=3D"marg=
in-top:0px;margin-bottom:0px"><li dir=3D"ltr" style=3D"list-style-type:circ=
le;font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-=
color:transparent;font-variant:normal;vertical-align:baseline;white-space:p=
re"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0=
pt" role=3D"presentation"><span style=3D"font-size:11pt;background-color:tr=
ansparent;font-variant:normal;vertical-align:baseline;white-space:pre-wrap"=
>other qemu =E2=80=98hang=E2=80=99 type issues on ARM</span></p></li><li di=
r=3D"ltr" style=3D"list-style-type:circle;font-size:11pt;font-family:Arial,=
sans-serif;color:rgb(0,0,0);background-color:transparent;font-variant:norma=
l;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-hei=
ght:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span styl=
e=3D"font-size:11pt;background-color:transparent;font-variant:normal;vertic=
al-align:baseline;white-space:pre-wrap">sometimes yocto-check-layer is show=
ing checksum mismatch issues</span></p></li><li dir=3D"ltr" style=3D"list-s=
tyle-type:circle;font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,=
0);background-color:transparent;font-variant:normal;vertical-align:baseline=
;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;m=
argin-bottom:0pt" role=3D"presentation"><span style=3D"font-size:11pt;backg=
round-color:transparent;font-variant:normal;vertical-align:baseline;white-s=
pace:pre-wrap">intermittent ptest failures in many recipes</span></p></li><=
/ul><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-famil=
y:Arial,sans-serif;color:rgb(0,0,0);background-color:transparent;font-varia=
nt:normal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"=
line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><s=
pan style=3D"font-size:11pt;background-color:transparent;font-variant:norma=
l;vertical-align:baseline;white-space:pre-wrap">Progress was made on some o=
f the risc-v speed differences in qemu which should help some of the autobu=
ilder intermittent failures, thanks Trevor!</span></p></li></ul><br><p dir=
=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span =
style=3D"font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);backg=
round-color:transparent;font-variant:normal;vertical-align:baseline;white-s=
pace:pre-wrap">Want to contribute? We would appreciate help with the follow=
ing areas:</span></p><ul style=3D"margin-top:0px;margin-bottom:0px"><li dir=
=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-family:Arial,san=
s-serif;color:rgb(0,0,0);background-color:transparent;font-variant:normal;v=
ertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height=
:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=
=3D"font-size:11pt;background-color:transparent;font-variant:normal;vertica=
l-align:baseline;white-space:pre-wrap">We have several open issues for pseu=
do and limited maintainer time to work on them. Help from someone familiar =
with systems programming in C would be greatly appreciated. </span><a href=
=3D"https://bugzilla.yoctoproject.org/buglist.cgi?list_id=3D661406&amp;prio=
rity=3DHigh&amp;priority=3DMedium%2B&amp;product=3DPseudo&amp;query_format=
=3Dadvanced&amp;resolution=3D---" style=3D"text-decoration:none"><span styl=
e=3D"font-size:11pt;background-color:transparent;font-variant:normal;text-d=
ecoration:underline;vertical-align:baseline;white-space:pre-wrap">https://b=
ugzilla.yoctoproject.org/buglist.cgi?list_id=3D661406&amp;priority=3DHigh&a=
mp;priority=3DMedium%2B&amp;product=3DPseudo&amp;query_format=3Dadvanced&am=
p;resolution=3D---</span></a></p></li><li dir=3D"ltr" style=3D"list-style-t=
ype:disc;font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);backg=
round-color:transparent;font-variant:normal;vertical-align:baseline;white-s=
pace:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bo=
ttom:0pt" role=3D"presentation"><span style=3D"font-size:11pt;background-co=
lor:transparent;font-variant:normal;vertical-align:baseline;white-space:pre=
-wrap">There are a large number of intermittent failures on our autobuilder=
, any help with investigating, reproducing or solving these issues would be=
 welcome! </span><a href=3D"https://valkyrie.yocto.io/pub/non-release/abint=
/" style=3D"text-decoration:none"><span style=3D"font-size:11pt;background-=
color:transparent;font-variant:normal;text-decoration:underline;vertical-al=
ign:baseline;white-space:pre-wrap">https://valkyrie.yocto.io/pub/non-releas=
e/abint/</span></a></p></li><li dir=3D"ltr" style=3D"list-style-type:disc;f=
ont-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-colo=
r:transparent;font-variant:normal;vertical-align:baseline;white-space:pre">=
<p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" =
role=3D"presentation"><span style=3D"font-size:11pt;background-color:transp=
arent;font-variant:normal;vertical-align:baseline;white-space:pre-wrap">Man=
y recipes in openembedded-core would benefit from a new recipe maintainer. =
Please look at </span><a href=3D"https://git.openembedded.org/openembedded-=
core/tree/meta/conf/distro/include/maintainers.inc" style=3D"text-decoratio=
n:none"><span style=3D"font-size:11pt;background-color:transparent;font-var=
iant:normal;text-decoration:underline;vertical-align:baseline;white-space:p=
re-wrap">https://git.openembedded.org/openembedded-core/tree/meta/conf/dist=
ro/include/maintainers.inc</span></a><span style=3D"font-size:11pt;backgrou=
nd-color:transparent;font-variant:normal;vertical-align:baseline;white-spac=
e:pre-wrap"> and see if you can adopt any of the unassigned recipes.</span>=
</p></li><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-=
family:Arial,sans-serif;color:rgb(0,0,0);background-color:transparent;font-=
variant:normal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" styl=
e=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentatio=
n"><span style=3D"font-size:11pt;background-color:transparent;font-variant:=
normal;vertical-align:baseline;white-space:pre-wrap">For more ways to contr=
ibute, see </span><a href=3D"https://docs.google.com/document/d/18oxKWxLorf=
F813h82mK6yKTIHeBp_-9owFuCWbzgjOk/edit?usp=3Dsharing" style=3D"text-decorat=
ion:none"><span style=3D"font-size:11pt;background-color:transparent;font-v=
ariant:normal;text-decoration:underline;vertical-align:baseline;white-space=
:pre-wrap">https://docs.google.com/document/d/18oxKWxLorfF813h82mK6yKTIHeBp=
_-9owFuCWbzgjOk/edit?usp=3Dsharing</span></a></p></li></ul><br><p dir=3D"lt=
r" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=
=3D"font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background=
-color:transparent;font-variant:normal;vertical-align:baseline;white-space:=
pre-wrap">New to the project?</span></p><ul style=3D"margin-top:0px;margin-=
bottom:0px"><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;fo=
nt-family:Arial,sans-serif;color:rgb(0,0,0);background-color:transparent;fo=
nt-variant:normal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" s=
tyle=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presenta=
tion"><span style=3D"font-size:11pt;background-color:transparent;font-varia=
nt:normal;vertical-align:baseline;white-space:pre-wrap">We have a list of i=
ssues we think are good places to start contributing: </span><a href=3D"htt=
ps://bugzilla.yoctoproject.org/buglist.cgi?quicksearch=3DNEWCOMER" style=3D=
"text-decoration:none"><span style=3D"font-size:11pt;background-color:trans=
parent;font-variant:normal;text-decoration:underline;vertical-align:baselin=
e;white-space:pre-wrap">https://bugzilla.yoctoproject.org/buglist.cgi?quick=
search=3DNEWCOMER</span></a></p></li></ul><br><p dir=3D"ltr" style=3D"line-=
height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt=
;font-family:Arial,sans-serif;color:rgb(0,0,0);background-color:transparent=
;font-variant:normal;vertical-align:baseline;white-space:pre-wrap">Tracking=
 Metrics:</span></p><ul style=3D"margin-top:0px;margin-bottom:0px"><li dir=
=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-family:Arial,san=
s-serif;color:rgb(0,0,0);background-color:transparent;font-variant:normal;v=
ertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height=
:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=
=3D"font-size:11pt;background-color:transparent;font-variant:normal;vertica=
l-align:baseline;white-space:pre-wrap">WDD 2612 (last week 2659) </span><sp=
an style=3D"font-size:11pt;font-family:Consolas,sans-serif;background-color=
:transparent;font-variant:normal;vertical-align:baseline;white-space:pre-wr=
ap">(</span><a href=3D"https://wiki.yoctoproject.org/charts/combo.html" sty=
le=3D"text-decoration:none"><span style=3D"font-size:11pt;background-color:=
transparent;font-variant:normal;text-decoration:underline;vertical-align:ba=
seline;white-space:pre-wrap">https://wiki.yoctoproject.org/charts/combo.htm=
l</span></a><span style=3D"font-size:11pt;font-family:Consolas,sans-serif;b=
ackground-color:transparent;font-variant:normal;vertical-align:baseline;whi=
te-space:pre-wrap">)</span></p></li><li dir=3D"ltr" style=3D"list-style-typ=
e:disc;font-size:11pt;font-family:Consolas,sans-serif;color:rgb(0,0,0);back=
ground-color:transparent;font-variant:normal;vertical-align:baseline;white-=
space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-b=
ottom:0pt" role=3D"presentation"><span style=3D"font-size:11pt;font-family:=
Arial,sans-serif;background-color:transparent;font-variant:normal;vertical-=
align:baseline;white-space:pre-wrap">OE-Core/Poky Patch Metrics</span></p><=
/li><ul style=3D"margin-top:0px;margin-bottom:0px"><li dir=3D"ltr" style=3D=
"list-style-type:circle;font-size:11pt;font-family:Arial,sans-serif;color:r=
gb(0,0,0);background-color:transparent;font-variant:normal;vertical-align:b=
aseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-to=
p:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"font-size:11p=
t;background-color:transparent;font-variant:normal;vertical-align:baseline;=
white-space:pre-wrap">Total patches found: 1039 (last week 1028)</span></p>=
</li><li dir=3D"ltr" style=3D"list-style-type:circle;font-size:11pt;font-fa=
mily:Arial,sans-serif;color:rgb(0,0,0);background-color:transparent;font-va=
riant:normal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=
=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation=
"><span style=3D"font-size:11pt;background-color:transparent;font-variant:n=
ormal;vertical-align:baseline;white-space:pre-wrap">Patches in the Pending =
State: 139 (13%) [last week 139 (14%)]</span></p></li><li dir=3D"ltr" style=
=3D"list-style-type:circle;font-size:11pt;font-family:Consolas,sans-serif;c=
olor:rgb(0,0,0);background-color:transparent;font-variant:normal;vertical-a=
lign:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;mar=
gin-top:0pt;margin-bottom:0pt" role=3D"presentation"><a href=3D"https://val=
kyrie.yocto.io/pub/non-release/patchmetrics/" style=3D"text-decoration:none=
"><span style=3D"font-size:11pt;font-family:Arial,sans-serif;background-col=
or:transparent;font-variant:normal;text-decoration:underline;vertical-align=
:baseline;white-space:pre-wrap">https://valkyrie.yocto.io/pub/non-release/p=
atchmetrics/</span></a></p></li></ul></ul><br><p dir=3D"ltr" style=3D"line-=
height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt=
;font-family:Arial,sans-serif;color:rgb(0,0,0);background-color:transparent=
;font-variant:normal;vertical-align:baseline;white-space:pre-wrap">Upcoming=
 development releases:</span></p><ul style=3D"margin-top:0px;margin-bottom:=
0px"><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-fami=
ly:Arial,sans-serif;color:rgb(0,0,0);background-color:transparent;font-vari=
ant:normal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D=
"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><=
span style=3D"font-size:11pt;background-color:transparent;font-variant:norm=
al;vertical-align:baseline;white-space:pre-wrap">6.1 M3:</span></p></li><ul=
 style=3D"margin-top:0px;margin-bottom:0px"><li dir=3D"ltr" style=3D"list-s=
tyle-type:circle;font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,=
0);background-color:transparent;font-variant:normal;vertical-align:baseline=
;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;m=
argin-bottom:0pt" role=3D"presentation"><span style=3D"font-size:11pt;backg=
round-color:transparent;font-variant:normal;vertical-align:baseline;white-s=
pace:pre-wrap">Build Date: w/c 2026-08-31</span></p></li><li dir=3D"ltr" st=
yle=3D"list-style-type:circle;font-size:11pt;font-family:Arial,sans-serif;c=
olor:rgb(0,0,0);background-color:transparent;font-variant:normal;vertical-a=
lign:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;mar=
gin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"font-si=
ze:11pt;background-color:transparent;font-variant:normal;vertical-align:bas=
eline;white-space:pre-wrap">Release Date: w/c 2026-09-14</span></p></li></u=
l><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-family:=
Arial,sans-serif;color:rgb(0,0,0);background-color:transparent;font-variant=
:normal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"li=
ne-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><spa=
n style=3D"font-size:11pt;background-color:transparent;font-variant:normal;=
vertical-align:baseline;white-space:pre-wrap">6.1.0:</span></p></li><ul sty=
le=3D"margin-top:0px;margin-bottom:0px"><li dir=3D"ltr" style=3D"list-style=
-type:circle;font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);b=
ackground-color:transparent;font-variant:normal;vertical-align:baseline;whi=
te-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margi=
n-bottom:0pt" role=3D"presentation"><span style=3D"font-size:11pt;backgroun=
d-color:transparent;font-variant:normal;vertical-align:baseline;white-space=
:pre-wrap">Build Date (M4): w/c 2026-10-12</span></p></li><li dir=3D"ltr" s=
tyle=3D"list-style-type:circle;font-size:11pt;font-family:Arial,sans-serif;=
color:rgb(0,0,0);background-color:transparent;font-variant:normal;vertical-=
align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;ma=
rgin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"font-s=
ize:11pt;background-color:transparent;font-variant:normal;vertical-align:ba=
seline;white-space:pre-wrap">Release Date: w/c 2026-11-02</span></p></li></=
ul></ul><br><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-=
bottom:0pt"><span style=3D"font-size:11pt;font-family:Arial,sans-serif;colo=
r:rgb(0,0,0);background-color:transparent;font-variant:normal;vertical-alig=
n:baseline;white-space:pre-wrap">Upcoming dot releases:</span></p><ul style=
=3D"margin-top:0px;margin-bottom:0px"><li dir=3D"ltr" style=3D"list-style-t=
ype:disc;font-size:11pt;font-family:Arial,sans-serif;background-color:trans=
parent;font-variant:normal;vertical-align:baseline;white-space:pre"><p dir=
=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=
=3D"presentation"><span style=3D"font-size:11pt;font-variant:normal;vertica=
l-align:baseline;white-space:pre-wrap">YP 6.0.3 is in review,</span></p></l=
i><ul style=3D"margin-top:0px;margin-bottom:0px"><li dir=3D"ltr" style=3D"l=
ist-style-type:circle;font-size:11pt;font-family:Arial,sans-serif;backgroun=
d-color:transparent;font-variant:normal;vertical-align:baseline;white-space=
:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom=
:0pt" role=3D"presentation"><span style=3D"font-size:11pt;font-variant:norm=
al;vertical-align:baseline;white-space:pre-wrap">Release Date w/c 2026-08-2=
4</span></p></li></ul><li dir=3D"ltr" style=3D"list-style-type:disc;font-si=
ze:11pt;font-family:Arial,sans-serif;background-color:transparent;font-vari=
ant:normal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D=
"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><=
span style=3D"font-size:11pt;font-variant:normal;vertical-align:baseline;wh=
ite-space:pre-wrap">YP 5.0.20 is in QA.</span></p></li><ul style=3D"margin-=
top:0px;margin-bottom:0px"><li dir=3D"ltr" style=3D"list-style-type:circle;=
font-size:11pt;font-family:Arial,sans-serif;background-color:transparent;fo=
nt-variant:normal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" s=
tyle=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presenta=
tion"><span style=3D"font-size:11pt;font-variant:normal;vertical-align:base=
line;white-space:pre-wrap">Release Date w/c 2026-08-31</span></p></li></ul>=
<li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-family:Ar=
ial,sans-serif;background-color:transparent;font-variant:normal;vertical-al=
ign:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;marg=
in-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"font-siz=
e:11pt;font-variant:normal;vertical-align:baseline;white-space:pre-wrap">YP=
 6.0.4</span></p></li><ul style=3D"margin-top:0px;margin-bottom:0px"><li di=
r=3D"ltr" style=3D"list-style-type:circle;font-size:11pt;font-family:Arial,=
sans-serif;background-color:transparent;font-variant:normal;vertical-align:=
baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-t=
op:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"font-size:11=
pt;font-variant:normal;vertical-align:baseline;white-space:pre-wrap">Build =
Date w/c 2026-09-28</span></p></li><li dir=3D"ltr" style=3D"list-style-type=
:circle;font-size:11pt;font-family:Arial,sans-serif;background-color:transp=
arent;font-variant:normal;vertical-align:baseline;white-space:pre"><p dir=
=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=
=3D"presentation"><span style=3D"font-size:11pt;font-variant:normal;vertica=
l-align:baseline;white-space:pre-wrap">Release Date w/c 2026-10-12</span></=
p></li></ul><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;fo=
nt-family:Arial,sans-serif;background-color:transparent;font-variant:normal=
;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-heig=
ht:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=
=3D"font-size:11pt;font-variant:normal;vertical-align:baseline;white-space:=
pre-wrap">YP 5.0.21</span></p></li><ul style=3D"margin-top:0px;margin-botto=
m:0px"><li dir=3D"ltr" style=3D"list-style-type:circle;font-size:11pt;font-=
family:Arial,sans-serif;background-color:transparent;font-variant:normal;ve=
rtical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:=
1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D=
"font-size:11pt;font-variant:normal;vertical-align:baseline;white-space:pre=
-wrap">Build Date w/c 2026-10-05</span></p></li><li dir=3D"ltr" style=3D"li=
st-style-type:circle;font-size:11pt;font-family:Arial,sans-serif;background=
-color:transparent;font-variant:normal;vertical-align:baseline;white-space:=
pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:=
0pt" role=3D"presentation"><span style=3D"font-size:11pt;font-variant:norma=
l;vertical-align:baseline;white-space:pre-wrap">Release Date w/c 2026-10-19=
</span></p></li></ul><li dir=3D"ltr" style=3D"list-style-type:disc;font-siz=
e:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-color:trans=
parent;font-variant:normal;vertical-align:baseline;white-space:pre"><p dir=
=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=
=3D"presentation"><span style=3D"font-size:11pt;background-color:transparen=
t;font-variant:normal;vertical-align:baseline;white-space:pre-wrap">For fut=
ure release dates, see </span><a href=3D"https://wiki.yoctoproject.org/wiki=
/Release_calendar" style=3D"text-decoration:none"><span style=3D"font-size:=
11pt;background-color:transparent;font-variant:normal;text-decoration:under=
line;vertical-align:baseline;white-space:pre-wrap">https://wiki.yoctoprojec=
t.org/wiki/Release_calendar</span></a></p></li></ul><br><p dir=3D"ltr" styl=
e=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font=
-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-color:t=
ransparent;font-variant:normal;vertical-align:baseline;white-space:pre-wrap=
">The Yocto Project=E2=80=99s technical governance is through its Technical=
 Steering Committee, more information is available at:</span></p><p dir=3D"=
ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><a href=3D=
"https://wiki.yoctoproject.org/wiki/TSC" style=3D"text-decoration:none"><sp=
an style=3D"font-size:11pt;font-family:Arial,sans-serif;background-color:tr=
ansparent;font-variant:normal;text-decoration:underline;vertical-align:base=
line;white-space:pre-wrap">https://wiki.yoctoproject.org/wiki/TSC</span></a=
></p><br><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bot=
tom:0pt"><span style=3D"font-size:11pt;font-family:Arial,sans-serif;color:r=
gb(0,0,0);background-color:transparent;font-variant:normal;vertical-align:b=
aseline;white-space:pre-wrap">The Status reports are stored on the wiki at:=
 </span><a href=3D"https://wiki.yoctoproject.org/wiki/Weekly_Status" style=
=3D"text-decoration:none"><span style=3D"font-size:11pt;font-family:Arial,s=
ans-serif;background-color:transparent;font-variant:normal;text-decoration:=
underline;vertical-align:baseline;white-space:pre-wrap">https://wiki.yoctop=
roject.org/wiki/Weekly_Status</span></a></p><br><p dir=3D"ltr" style=3D"lin=
e-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11=
pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-color:transpare=
nt;font-variant:normal;vertical-align:baseline;white-space:pre-wrap">[If an=
yone has suggestions for other information you=E2=80=99d like to see on thi=
s weekly status update, let us know!]</span></p></span><br class=3D"gmail-A=
pple-interchange-newline"></div><div dir=3D"ltr" class=3D"gmail_signature" =
data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><div dir=3D"ltr"><p cla=
ss=3D"MsoNormal" style=3D"background-image:initial;background-position:init=
ial;background-repeat:initial"><span style=3D"font-size:12pt;font-family:Ar=
ial,sans-serif">Thanks,<span></span></span></p>

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

--00000000000014d29d065a6cfaf7--

