Return-Path: <sjolley.yp.pm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33AFECA5FF0
	for <webhook@archiver.kernel.org>; Tue,  6 Oct 2026 14:15:08 +0000 (UTC)
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.46705.1791296102273234872
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Oct 2026 07:15:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=R2i6mLnl;
 spf=pass (domain: gmail.com, ip: 74.125.82.179, mailfrom: sjolley.yp.pm@gmail.com)
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-35154cb9de2so363763eec.1
        for <openembedded-core@lists.openembedded.org>; Tue, 06 Oct 2026 07:15:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791296102; cv=none;
        d=google.com; s=arc-20260327;
        b=BoJ+LTIDb3fHdaozGjFRpsTlgxox2V85yczgBUzNwGqNdHUvlY70sn8+/5Dwlokvmw
         xxcaS24TsWAjHrS+qRdhDJD6iitvLrCTSATHbPgtIvIqnhntliJ/RO+yN3aAjZyYGhn9
         +VD/HGH0mRovE1nJdHA4gzJpyIAscsEXfnL5FouBYfEGztQs6qVKrPdV8uYD1AqDzvTB
         dIng0bzMNh67o9UMLKrhQ18HdN0KY6cscExakz57fCmMa0keBVcV42XJamEKDikXgeRJ
         RM6rLB4HhqwegO1Xp193FBckL/YM5vzZzqBzBZ2vJ59V/P+WvmiBglKtHVBB9U+Q166e
         T4Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=YFX1586G9/urZlLx9sla00E+DOyr5TdCLpNbfoAZG8A=;
        fh=wqUm6SQnH3Fdfub0RqUloUj4kkuz38/zvKcuvzoO2YU=;
        b=hRqyqeXLbg75tWT9nMRrVjZ0c7CZ719LdSJqNhf27HLMQygtXsLPSd5XaCeh9XgnuG
         a44lc6YBQnQ84CBnu9wwDW49SLfv7zLIsrf7OLcKtmPhzormnNrELOjUAzZLI44GoJsd
         ahxSbnm2hxlOsk2p0rwCM8AzKEk7WYkp2zGfZPl4+Umre+obRquHSIjX+zlnpgODoddu
         n6lyJ/X7NJS76vRxCtllSDMB6CXhHrU7Z4zqTgcFIpuLKck+kAjuLX+O2g5WKXe1fUTP
         8FQrE4qSRCDmjqQZv64RGYclV13Say7DNBZj3Y94B5E2ZYK3ymSABENwafmr97Jv8V6f
         /HMQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791296102; x=1791900902; darn=lists.openembedded.org;
        h=content-type:to:subject:message-id:date:from:mime-version:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=YFX1586G9/urZlLx9sla00E+DOyr5TdCLpNbfoAZG8A=;
        b=R2i6mLnlHKF/sKYzRojMPzDj3wJQTroAMqewY+bLeJtzGGmZIZSKbBjDbwFVMoe8yC
         VYWuLEnROOry+cTCeQu+FtInEArkE03EY3nl9g4XqOx5UVMpH4ZmOIx5Kwojw89WdCBC
         EpqyfNT8y34wDkhetwPY1hSxZSp4VCQm6cUkJ3N5euEtlyuG+R9QJvLBVZbuvpP4Gk7Q
         7wbavF4bRDvOtqg06J7YjspZXOGW2MyMJdvESmy58uLw01rVO7EfftQlVM9a6Clf0DXO
         NLIym48qhedTSbWZ1OtMkj2rZL2+PJxg4iFucLpHv6NkdxUvIeFCs7Rrc1G3spLPV7gL
         bvXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791296102; x=1791900902;
        h=content-type:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YFX1586G9/urZlLx9sla00E+DOyr5TdCLpNbfoAZG8A=;
        b=IgujDSupWzwx7a4iULJ4J3FsKFq9ZMX9XciwEjDgFHjIUK26m+uixGliPECKkj78pz
         qABbAQYkhLJtFF8Nm4Oh3144fFiDRhXzgLwbqQ65cFNVrtRU8+6Ovdj/5NJk6RkzCtf8
         dLETL6USlF9fckfNrtJPvvnc0+R1OXbSzq5dm4ZEgJtxI0lQXC1hynv2YYrkcjUcrD19
         QDo9UiaiLByWMCiLlC1uyODgydkzI7PCVGdcnHIzwdsjdgO1yLUU0jOaMyw8qOk7PNqN
         HK+DMkGGBI8DMhAv9wQMKXsB5xLD6MdssNiMLZhcsx1Sj5Rnpxa/94OLZYebtqKfcdOf
         duqg==
X-Forwarded-Encrypted: i=1; AKwUvBxSkhVoUlwNnU4QkCqcB87uGMqsR16MHQz72TUqyGY0WGp1idfLooCtQCzC7WfzhoZ8QM4G0+xll1jKMQ39lYEp6A==@lists.openembedded.org
X-Gm-Message-State: AFuF++kVyd14lpcgemsdVe5+2SnjTibzMbaV9Y24xb2Zn0pyj6b/xP43
	+oVHENORxVMvp+rZvnxwcK8cfF3cdkM23D2F4+ipV5aA3X9ygyOk6TUUouy8xkFjwtJ3roNuBRd
	GPOBmC4fls1m6lUSUBtYxnYXuNIKUwWk=
X-Gm-Gg: AYBFou3EZXbPfFuNfvo3breTwI8k2gb43aFiaOcE7CHTrKvtLL+HZQ1SiEFSx2qJkRu
	iO/Q/mTqH8Dl8F1COElG7gswYcjgVDd+UyxeJret4gNa0DnwRiiscE058PbSVQECkXnIYEHkoEl
	QhfMcU5JqEs7YWKWUzm40KF19xYLgyTFV/YmaRbQWNnrQsxxvJw5rHYOlYlX6DxoT/A8JXaemmJ
	rlpqAbCYGVnG21KWBvls0g/mLlwxFt9bgzTtmi7GLdEyRH3jRpqjNNF0wldQu2h4siwQh6QlUYA
	8Pv7bI/L2SoGeW7ayxT47M+R4MuaSwuNZ/tV0oZKWt/joYpGaBS2UD21LoPv9jBn+ojXfjjGxse
	lNcsfiXZzrJnD8tZ+O5iBv8w4LjUMkS6WElFkpA785BdW9VWT6YOtcwkJGGQQvZxgQsrvtCNeNW
	mVbG6KqwibL2+6p4WkBIlG4d3p5hxz1X7RtKPbxCQ2iyfqg+oRmaFIqn5UIj/wLAyeeJC/hke1K
	bu7HaSnJljbqoYsw4ZUqc4nfI6YkeUR3/7O77KaSv+CsESecCww
X-Received: by 2002:a05:7301:6196:10b0:351:26ac:1e2f with SMTP id
 5a478bee46e88-3514e38176amr1482954eec.37.1791296101122; Tue, 06 Oct 2026
 07:15:01 -0700 (PDT)
MIME-Version: 1.0
From: Stephen K Jolley <sjolley.yp.pm@gmail.com>
Date: Tue, 6 Oct 2026 07:14:49 -0700
X-Gm-Features: AclHuK8D9aAtuoLXY3hvI5P3hfE3a_e-UJ_b7j32P6rpksDZAb2yDhaa-FmhO_k
Message-ID: <CAK5yBb9uoxg2g0B9Os1ESTO3XD6pPGBY9hiv4OHhC5+8--BodQ@mail.gmail.com>
Subject: Yocto Project Status 6 October 2026 (WW41)
To: Yocto-mailing-list <yocto@lists.yoctoproject.org>, 
	",openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	yocto-status@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="000000000000cb8d9c065d2c9f44"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Oct 2026 14:15:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247288

--000000000000cb8d9c065d2c9f44
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Current Dev Position: YP 6.2 M1 - Development

Next Deadline: YP 6.1 M4: w/c 2026-10-12

Next Team Meetings:

   -

   Bug Triage meeting - Thursday 15th Oct. 7:30am PDT (
   https://zoom.us/j/454367603?pwd=3DZGxoa2ZXL3FkM3Y0bFd5aVpHVVZ6dz09)
   -

   Weekly Project Engineering Sync  - Tuesday 13rd Oct. 8am PDT (
   https://zoom.us/j/990892712?pwd=3DcHU1MjhoM2x6ck81bkcrYjRrcmJsUT09)
   <https://zoom.us/j/990892712>
   -

   Yocto Project Patch Review - Thursday 15th Oct. 10am GMT and Monday 12th
   Oct. 9am PDT (
   https://zoom.us/j/97762397148?pwd=3D1xk0iC9hp9SjEonaTaONwTb6iWry4Eb.1)


Project data dashboard: https://dashboard.yoctoproject.org/

Key Status/Updates:

   -

   YP 6.1 is in QA
   -

   YP 6.0.4 is pending with QA.
   -

   Blacksail and master are now on separate branches and have diverged.
   -

   Patches for 6.2 have started merging into master
   -

   There are changes to the pypi class so that PYPI_PACKAGE is the
   normalised name
   -

   python3-pytz moved from core to meta-oe, if you notice anything using
   it, it is a sign the dependencies may be obsolete
   -

   There are issues where we could accept help:
   -

      Matchbox-wm segfault/xserver restart
      -

      aarch64/x86-64 build host contamination/reproducibility issue -
      thanks for the work and fixes so far on this.
      -

      Remaining github.com references in bitbake-selftest
      -

   Bitbake=E2=80=99s network disabling has recently been enhanced to includ=
e
   landlock support.
   -

   This week is Open Source Summit EU and Yocto Project Developer Day in
   Prague! Contact Paul or Megan if you are attending and want to meet up w=
ith
   other Yocto Project folks, especially if you=E2=80=99re new to our commu=
nity.
   -

      Regular meetings on Tuesday and Thursday will be canceled, including
      the Tech call (Tue 6th), Patch review call (Thu 8th) and Bug triage c=
all
      (Thu 8th).


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

   WDD 2644 (last week 2643) (
   https://wiki.yoctoproject.org/charts/combo.html)
   -

   OE-Core/Poky Patch Metrics
   -

      Total found: 1057 (last week 1053)
      -

      Patches in the Pending State: 135 (13%) [last week 135 (13%)]
      -

      https://valkyrie.yocto.io/pub/non-release/patchmetrics/


Upcoming development releases

   -

   6.1.0:
   -

      In QA
      -

      Release Date: w/c 2026-11-02


Upcoming dot releases:

   -

   YP 6.0.4
   -

      In QA
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

--000000000000cb8d9c065d2c9f44
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><span id=3D"gmail-docs-internal-guid-9dfa6811-7fff-d2=
25-2150-781793fe1e30"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0=
pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-family:Arial,sans-=
serif;color:rgb(0,0,0);background-color:transparent;font-variant:normal;ver=
tical-align:baseline;white-space:pre-wrap">Current Dev Position: YP 6.2 M1 =
- Development</span></p><p dir=3D"ltr" style=3D"line-height:1.38;margin-top=
:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-family:Arial,san=
s-serif;color:rgb(0,0,0);background-color:transparent;font-variant:normal;v=
ertical-align:baseline;white-space:pre-wrap">Next Deadline: YP 6.1 M4: w/c =
2026-10-12</span></p><br><p dir=3D"ltr" style=3D"line-height:1.38;margin-to=
p:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-family:Arial,sa=
ns-serif;color:rgb(0,0,0);background-color:transparent;font-variant:normal;=
vertical-align:baseline;white-space:pre-wrap">Next Team Meetings:</span></p=
><ul style=3D"margin-top:0px;margin-bottom:0px"><li dir=3D"ltr" style=3D"li=
st-style-type:disc;font-size:9.5pt;font-family:Arial,sans-serif;color:rgb(0=
,0,0);background-color:transparent;font-variant:normal;vertical-align:basel=
ine;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0p=
t;margin-bottom:0pt" role=3D"presentation"><span style=3D"font-size:11pt;ba=
ckground-color:transparent;font-variant:normal;vertical-align:baseline;whit=
e-space:pre-wrap">Bug Triage meeting - Thursday 15th Oct. 7:30am PDT (</spa=
n><a href=3D"https://zoom.us/j/454367603?pwd=3DZGxoa2ZXL3FkM3Y0bFd5aVpHVVZ6=
dz09" style=3D"text-decoration:none"><span style=3D"font-size:11pt;backgrou=
nd-color:transparent;font-variant:normal;text-decoration:underline;vertical=
-align:baseline;white-space:pre-wrap">https://zoom.us/j/454367603?pwd=3DZGx=
oa2ZXL3FkM3Y0bFd5aVpHVVZ6dz09</span></a><span style=3D"font-size:11pt;backg=
round-color:transparent;font-variant:normal;vertical-align:baseline;white-s=
pace:pre-wrap">)</span></p></li><li dir=3D"ltr" style=3D"list-style-type:di=
sc;font-size:9.5pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background=
-color:transparent;font-variant:normal;vertical-align:baseline;white-space:=
pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:=
0pt" role=3D"presentation"><span style=3D"font-size:11pt;background-color:t=
ransparent;font-variant:normal;vertical-align:baseline;white-space:pre-wrap=
">Weekly Project Engineering Sync=C2=A0 - Tuesday 13rd Oct. 8am PDT (</span=
><a href=3D"https://zoom.us/j/990892712?pwd=3DcHU1MjhoM2x6ck81bkcrYjRrcmJsU=
T09" style=3D"text-decoration:none"><span style=3D"font-size:11pt;backgroun=
d-color:transparent;font-variant:normal;text-decoration:underline;vertical-=
align:baseline;white-space:pre-wrap">https://zoom.us/j/990892712?pwd=3DcHU1=
MjhoM2x6ck81bkcrYjRrcmJsUT09</span></a><a href=3D"https://zoom.us/j/9908927=
12" style=3D"text-decoration:none"><span style=3D"font-size:11pt;background=
-color:transparent;font-variant:normal;text-decoration:underline;vertical-a=
lign:baseline;white-space:pre-wrap">)</span></a></p></li><li dir=3D"ltr" st=
yle=3D"list-style-type:disc;font-size:9.5pt;font-family:Arial,sans-serif;co=
lor:rgb(0,0,0);background-color:transparent;font-variant:normal;vertical-al=
ign:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;marg=
in-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"font-siz=
e:11pt;background-color:transparent;font-variant:normal;vertical-align:base=
line;white-space:pre-wrap">Yocto Project Patch Review - Thursday 15th Oct. =
10am GMT and Monday 12th Oct. 9am PDT (</span><a href=3D"https://zoom.us/j/=
97762397148?pwd=3D1xk0iC9hp9SjEonaTaONwTb6iWry4Eb.1" style=3D"text-decorati=
on:none"><span style=3D"font-size:11pt;background-color:transparent;font-va=
riant:normal;text-decoration:underline;vertical-align:baseline;white-space:=
pre-wrap">https://zoom.us/j/97762397148?pwd=3D1xk0iC9hp9SjEonaTaONwTb6iWry4=
Eb.1</span></a><span style=3D"font-size:11pt;background-color:transparent;f=
ont-variant:normal;vertical-align:baseline;white-space:pre-wrap">)</span></=
p></li></ul><br><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;mar=
gin-bottom:0pt"><span style=3D"font-size:11pt;font-family:Arial,sans-serif;=
color:rgb(0,0,0);background-color:transparent;font-variant:normal;vertical-=
align:baseline;white-space:pre-wrap">Project data dashboard: </span><a href=
=3D"https://dashboard.yoctoproject.org/" style=3D"text-decoration:none"><sp=
an style=3D"font-size:11pt;font-family:Arial,sans-serif;background-color:tr=
ansparent;font-variant:normal;text-decoration:underline;vertical-align:base=
line;white-space:pre-wrap">https://dashboard.yoctoproject.org/</span></a><s=
pan style=3D"font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);b=
ackground-color:transparent;font-variant:normal;vertical-align:baseline;whi=
te-space:pre-wrap">=C2=A0</span></p><br><p dir=3D"ltr" style=3D"line-height=
:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-=
family:Arial,sans-serif;color:rgb(0,0,0);background-color:transparent;font-=
variant:normal;vertical-align:baseline;white-space:pre-wrap">Key Status/Upd=
ates:</span></p><ul style=3D"margin-top:0px;margin-bottom:0px"><li dir=3D"l=
tr" style=3D"list-style-type:disc;font-size:11pt;font-family:Arial,sans-ser=
if;color:rgb(0,0,0);background-color:transparent;font-variant:normal;vertic=
al-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38=
;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"fon=
t-size:11pt;background-color:transparent;font-variant:normal;vertical-align=
:baseline;white-space:pre-wrap">YP 6.1 is in QA</span></p></li><li dir=3D"l=
tr" style=3D"list-style-type:disc;font-size:11pt;font-family:Arial,sans-ser=
if;color:rgb(0,0,0);background-color:transparent;font-variant:normal;vertic=
al-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38=
;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"fon=
t-size:11pt;background-color:transparent;font-variant:normal;vertical-align=
:baseline;white-space:pre-wrap">YP 6.0.4 is pending with QA.</span></p></li=
><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-family:A=
rial,sans-serif;color:rgb(0,0,0);background-color:transparent;font-variant:=
normal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"lin=
e-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span=
 style=3D"font-size:11pt;background-color:transparent;font-variant:normal;v=
ertical-align:baseline;white-space:pre-wrap">Blacksail and master are now o=
n separate branches and have diverged.</span></p></li><li dir=3D"ltr" style=
=3D"list-style-type:disc;font-size:11pt;font-family:Arial,sans-serif;color:=
rgb(0,0,0);background-color:transparent;font-variant:normal;vertical-align:=
baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-t=
op:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"font-size:11=
pt;background-color:transparent;font-variant:normal;vertical-align:baseline=
;white-space:pre-wrap">Patches for 6.2 have started merging into master</sp=
an></p></li><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;fo=
nt-family:Arial,sans-serif;color:rgb(0,0,0);background-color:transparent;fo=
nt-variant:normal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" s=
tyle=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presenta=
tion"><span style=3D"font-size:11pt;background-color:transparent;font-varia=
nt:normal;vertical-align:baseline;white-space:pre-wrap">There are changes t=
o the pypi class so that PYPI_PACKAGE is the normalised name</span></p></li=
><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-family:A=
rial,sans-serif;color:rgb(0,0,0);background-color:transparent;font-variant:=
normal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"lin=
e-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span=
 style=3D"font-size:11pt;background-color:transparent;font-variant:normal;v=
ertical-align:baseline;white-space:pre-wrap">python3-pytz moved from core t=
o meta-oe, if you notice anything using it, it is a sign the dependencies m=
ay be obsolete</span></p></li><li dir=3D"ltr" style=3D"list-style-type:disc=
;font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-co=
lor:transparent;font-variant:normal;vertical-align:baseline;white-space:pre=
"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt=
" role=3D"presentation"><span style=3D"font-size:11pt;background-color:tran=
sparent;font-variant:normal;vertical-align:baseline;white-space:pre-wrap">T=
here are issues where we could accept help:</span></p></li><ul style=3D"mar=
gin-top:0px;margin-bottom:0px"><li dir=3D"ltr" style=3D"list-style-type:cir=
cle;font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background=
-color:transparent;font-variant:normal;vertical-align:baseline;white-space:=
pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:=
0pt" role=3D"presentation"><span style=3D"font-size:11pt;background-color:t=
ransparent;font-variant:normal;vertical-align:baseline;white-space:pre-wrap=
">Matchbox-wm segfault/xserver restart</span></p></li><li dir=3D"ltr" style=
=3D"list-style-type:circle;font-size:11pt;font-family:Arial,sans-serif;colo=
r:rgb(0,0,0);background-color:transparent;font-variant:normal;vertical-alig=
n:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin=
-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"font-size:=
11pt;background-color:transparent;font-variant:normal;vertical-align:baseli=
ne;white-space:pre-wrap">aarch64/x86-64 build host contamination/reproducib=
ility issue - thanks for the work and fixes so far on this.</span></p></li>=
<li dir=3D"ltr" style=3D"list-style-type:circle;font-size:11pt;font-family:=
Arial,sans-serif;color:rgb(0,0,0);background-color:transparent;font-variant=
:normal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"li=
ne-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><spa=
n style=3D"font-size:11pt;background-color:transparent;font-variant:normal;=
vertical-align:baseline;white-space:pre-wrap">Remaining </span><a href=3D"h=
ttp://github.com" style=3D"text-decoration:none"><span style=3D"font-size:1=
1pt;background-color:transparent;font-variant:normal;text-decoration:underl=
ine;vertical-align:baseline;white-space:pre-wrap">github.com</span></a><spa=
n style=3D"font-size:11pt;background-color:transparent;font-variant:normal;=
vertical-align:baseline;white-space:pre-wrap"> references in bitbake-selfte=
st</span></p></li></ul><li dir=3D"ltr" style=3D"list-style-type:disc;font-s=
ize:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-color:tra=
nsparent;font-variant:normal;vertical-align:baseline;white-space:pre"><p di=
r=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=
=3D"presentation"><span style=3D"font-size:11pt;background-color:transparen=
t;font-variant:normal;vertical-align:baseline;white-space:pre-wrap">Bitbake=
=E2=80=99s network disabling has recently been enhanced to include landlock=
 support.</span></p></li><li dir=3D"ltr" style=3D"list-style-type:disc;font=
-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-color:t=
ransparent;font-variant:normal;vertical-align:baseline;white-space:pre"><p =
dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" rol=
e=3D"presentation"><span style=3D"font-size:11pt;background-color:transpare=
nt;font-variant:normal;vertical-align:baseline;white-space:pre-wrap">This w=
eek is Open Source Summit EU and Yocto Project Developer Day in Prague! Con=
tact Paul or Megan if you are attending and want to meet up with other Yoct=
o Project folks, especially if you=E2=80=99re new to our community.</span><=
/p></li><ul style=3D"margin-top:0px;margin-bottom:0px"><li dir=3D"ltr" styl=
e=3D"list-style-type:circle;font-size:11pt;font-family:Arial,sans-serif;col=
or:rgb(0,0,0);background-color:transparent;font-variant:normal;vertical-ali=
gn:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margi=
n-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"font-size=
:11pt;background-color:transparent;font-variant:normal;vertical-align:basel=
ine;white-space:pre-wrap">Regular meetings on Tuesday and Thursday will be =
canceled, including the Tech call (Tue 6th), Patch review call (Thu 8th) an=
d Bug triage call (Thu 8th).</span></p></li></ul></ul><br><p dir=3D"ltr" st=
yle=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"fo=
nt-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-color=
:transparent;font-variant:normal;vertical-align:baseline;white-space:pre-wr=
ap">Want to contribute? We would appreciate help with the following areas:<=
/span></p><ul style=3D"margin-top:0px;margin-bottom:0px"><li dir=3D"ltr" st=
yle=3D"list-style-type:disc;font-size:11pt;font-family:Arial,sans-serif;col=
or:rgb(0,0,0);background-color:transparent;font-variant:normal;vertical-ali=
gn:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margi=
n-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"font-size=
:11pt;background-color:transparent;font-variant:normal;vertical-align:basel=
ine;white-space:pre-wrap">We have several open issues for pseudo and limite=
d maintainer time to work on them. Help from someone familiar with systems =
programming in C would be greatly appreciated. </span><a href=3D"https://bu=
gzilla.yoctoproject.org/buglist.cgi?list_id=3D661406&amp;priority=3DHigh&am=
p;priority=3DMedium%2B&amp;product=3DPseudo&amp;query_format=3Dadvanced&amp=
;resolution=3D---" style=3D"text-decoration:none"><span style=3D"font-size:=
11pt;background-color:transparent;font-variant:normal;text-decoration:under=
line;vertical-align:baseline;white-space:pre-wrap">https://bugzilla.yoctopr=
oject.org/buglist.cgi?list_id=3D661406&amp;priority=3DHigh&amp;priority=3DM=
edium%2B&amp;product=3DPseudo&amp;query_format=3Dadvanced&amp;resolution=3D=
---</span></a></p></li><li dir=3D"ltr" style=3D"list-style-type:disc;font-s=
ize:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-color:tra=
nsparent;font-variant:normal;vertical-align:baseline;white-space:pre"><p di=
r=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=
=3D"presentation"><span style=3D"font-size:11pt;background-color:transparen=
t;font-variant:normal;vertical-align:baseline;white-space:pre-wrap">There a=
re a large number of intermittent failures on our autobuilder, any help wit=
h investigating, reproducing or solving these issues would be welcome! </sp=
an><a href=3D"https://valkyrie.yocto.io/pub/non-release/abint/" style=3D"te=
xt-decoration:none"><span style=3D"font-size:11pt;background-color:transpar=
ent;font-variant:normal;text-decoration:underline;vertical-align:baseline;w=
hite-space:pre-wrap">https://valkyrie.yocto.io/pub/non-release/abint/</span=
></a></p></li><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;=
font-family:Arial,sans-serif;color:rgb(0,0,0);background-color:transparent;=
font-variant:normal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr"=
 style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presen=
tation"><span style=3D"font-size:11pt;background-color:transparent;font-var=
iant:normal;vertical-align:baseline;white-space:pre-wrap">Many recipes in o=
penembedded-core would benefit from a new recipe maintainer. Please look at=
 </span><a href=3D"https://git.openembedded.org/openembedded-core/tree/meta=
/conf/distro/include/maintainers.inc" style=3D"text-decoration:none"><span =
style=3D"font-size:11pt;background-color:transparent;font-variant:normal;te=
xt-decoration:underline;vertical-align:baseline;white-space:pre-wrap">https=
://git.openembedded.org/openembedded-core/tree/meta/conf/distro/include/mai=
ntainers.inc</span></a><span style=3D"font-size:11pt;background-color:trans=
parent;font-variant:normal;vertical-align:baseline;white-space:pre-wrap"> a=
nd see if you can adopt any of the unassigned recipes.</span></p></li><li d=
ir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-family:Arial,s=
ans-serif;color:rgb(0,0,0);background-color:transparent;font-variant:normal=
;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-heig=
ht:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=
=3D"font-size:11pt;background-color:transparent;font-variant:normal;vertica=
l-align:baseline;white-space:pre-wrap">For more ways to contribute, see </s=
pan><a href=3D"https://docs.google.com/document/d/18oxKWxLorfF813h82mK6yKTI=
HeBp_-9owFuCWbzgjOk/edit?usp=3Dsharing" style=3D"text-decoration:none"><spa=
n style=3D"font-size:11pt;background-color:transparent;font-variant:normal;=
text-decoration:underline;vertical-align:baseline;white-space:pre-wrap">htt=
ps://docs.google.com/document/d/18oxKWxLorfF813h82mK6yKTIHeBp_-9owFuCWbzgjO=
k/edit?usp=3Dsharing</span></a></p></li></ul><br><p dir=3D"ltr" style=3D"li=
ne-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:1=
1pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-color:transpar=
ent;font-variant:normal;vertical-align:baseline;white-space:pre-wrap">New t=
o the project?</span></p><ul style=3D"margin-top:0px;margin-bottom:0px"><li=
 dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-family:Arial=
,sans-serif;color:rgb(0,0,0);background-color:transparent;font-variant:norm=
al;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-he=
ight:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span sty=
le=3D"font-size:11pt;background-color:transparent;font-variant:normal;verti=
cal-align:baseline;white-space:pre-wrap">We have a list of issues we think =
are good places to start contributing: </span><a href=3D"https://bugzilla.y=
octoproject.org/buglist.cgi?quicksearch=3DNEWCOMER" style=3D"text-decoratio=
n:none"><span style=3D"font-size:11pt;background-color:transparent;font-var=
iant:normal;text-decoration:underline;vertical-align:baseline;white-space:p=
re-wrap">https://bugzilla.yoctoproject.org/buglist.cgi?quicksearch=3DNEWCOM=
ER</span></a></p></li></ul><br><p dir=3D"ltr" style=3D"line-height:1.38;mar=
gin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-family:Ar=
ial,sans-serif;color:rgb(0,0,0);background-color:transparent;font-variant:n=
ormal;vertical-align:baseline;white-space:pre-wrap">Tracking Metrics:</span=
></p><ul style=3D"margin-top:0px;margin-bottom:0px"><li dir=3D"ltr" style=
=3D"list-style-type:disc;font-size:11pt;font-family:Arial,sans-serif;color:=
rgb(0,0,0);background-color:transparent;font-variant:normal;vertical-align:=
baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-t=
op:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"font-size:11=
pt;background-color:transparent;font-variant:normal;vertical-align:baseline=
;white-space:pre-wrap">WDD 2644 (last week 2643) </span><span style=3D"font=
-size:11pt;font-family:Consolas,sans-serif;background-color:transparent;fon=
t-variant:normal;vertical-align:baseline;white-space:pre-wrap">(</span><a h=
ref=3D"https://wiki.yoctoproject.org/charts/combo.html" style=3D"text-decor=
ation:none"><span style=3D"font-size:11pt;background-color:transparent;font=
-variant:normal;text-decoration:underline;vertical-align:baseline;white-spa=
ce:pre-wrap">https://wiki.yoctoproject.org/charts/combo.html</span></a><spa=
n style=3D"font-size:11pt;font-family:Consolas,sans-serif;background-color:=
transparent;font-variant:normal;vertical-align:baseline;white-space:pre-wra=
p">)</span></p></li><li dir=3D"ltr" style=3D"list-style-type:disc;font-size=
:11pt;font-family:Consolas,sans-serif;color:rgb(0,0,0);background-color:tra=
nsparent;font-variant:normal;vertical-align:baseline;white-space:pre"><p di=
r=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=
=3D"presentation"><span style=3D"font-size:11pt;font-family:Arial,sans-seri=
f;background-color:transparent;font-variant:normal;vertical-align:baseline;=
white-space:pre-wrap">OE-Core/Poky Patch Metrics</span></p></li><ul style=
=3D"margin-top:0px;margin-bottom:0px"><li dir=3D"ltr" style=3D"list-style-t=
ype:circle;font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);bac=
kground-color:transparent;font-variant:normal;vertical-align:baseline;white=
-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-=
bottom:0pt" role=3D"presentation"><span style=3D"font-size:11pt;background-=
color:transparent;font-variant:normal;vertical-align:baseline;white-space:p=
re-wrap">Total found: 1057 (last week 1053)</span></p></li><li dir=3D"ltr" =
style=3D"list-style-type:circle;font-size:11pt;font-family:Arial,sans-serif=
;color:rgb(0,0,0);background-color:transparent;font-variant:normal;vertical=
-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;m=
argin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"font-=
size:11pt;background-color:transparent;font-variant:normal;vertical-align:b=
aseline;white-space:pre-wrap">Patches in the Pending State: 135 (13%) [last=
 week 135 (13%)]</span></p></li><li dir=3D"ltr" style=3D"list-style-type:ci=
rcle;font-size:11pt;font-family:Consolas,sans-serif;color:rgb(0,0,0);backgr=
ound-color:transparent;font-variant:normal;vertical-align:baseline;white-sp=
ace:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bot=
tom:0pt" role=3D"presentation"><a href=3D"https://valkyrie.yocto.io/pub/non=
-release/patchmetrics/" style=3D"text-decoration:none"><span style=3D"font-=
size:11pt;font-family:Arial,sans-serif;background-color:transparent;font-va=
riant:normal;text-decoration:underline;vertical-align:baseline;white-space:=
pre-wrap">https://valkyrie.yocto.io/pub/non-release/patchmetrics/</span></a=
></p></li></ul></ul><br><p dir=3D"ltr" style=3D"line-height:1.38;margin-top=
:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-family:Arial,san=
s-serif;color:rgb(0,0,0);background-color:transparent;font-variant:normal;v=
ertical-align:baseline;white-space:pre-wrap">Upcoming development releases<=
/span></p><ul style=3D"margin-top:0px;margin-bottom:0px"><li dir=3D"ltr" st=
yle=3D"list-style-type:disc;font-size:11pt;font-family:Arial,sans-serif;col=
or:rgb(0,0,0);background-color:transparent;font-variant:normal;vertical-ali=
gn:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margi=
n-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"font-size=
:11pt;background-color:transparent;font-variant:normal;vertical-align:basel=
ine;white-space:pre-wrap">6.1.0:</span></p></li><ul style=3D"margin-top:0px=
;margin-bottom:0px"><li dir=3D"ltr" style=3D"list-style-type:circle;font-si=
ze:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-color:tran=
sparent;font-variant:normal;vertical-align:baseline;white-space:pre"><p dir=
=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=
=3D"presentation"><span style=3D"font-size:11pt;background-color:transparen=
t;font-variant:normal;vertical-align:baseline;white-space:pre-wrap">In QA</=
span></p></li><li dir=3D"ltr" style=3D"list-style-type:circle;font-size:11p=
t;font-family:Arial,sans-serif;color:rgb(0,0,0);background-color:transparen=
t;font-variant:normal;vertical-align:baseline;white-space:pre"><p dir=3D"lt=
r" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"pres=
entation"><span style=3D"font-size:11pt;background-color:transparent;font-v=
ariant:normal;vertical-align:baseline;white-space:pre-wrap">Release Date: w=
/c 2026-11-02</span></p></li></ul></ul><br><p dir=3D"ltr" style=3D"line-hei=
ght:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;fo=
nt-family:Arial,sans-serif;color:rgb(0,0,0);background-color:transparent;fo=
nt-variant:normal;vertical-align:baseline;white-space:pre-wrap">Upcoming do=
t releases:</span></p><ul style=3D"margin-top:0px;margin-bottom:0px"><li di=
r=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-family:Arial,sa=
ns-serif;background-color:transparent;font-variant:normal;vertical-align:ba=
seline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top=
:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"font-size:11pt=
;font-variant:normal;vertical-align:baseline;white-space:pre-wrap">YP 6.0.4=
</span></p></li><ul style=3D"margin-top:0px;margin-bottom:0px"><li dir=3D"l=
tr" style=3D"list-style-type:circle;font-size:11pt;font-family:Arial,sans-s=
erif;background-color:transparent;font-variant:normal;vertical-align:baseli=
ne;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt=
;margin-bottom:0pt" role=3D"presentation"><span style=3D"font-size:11pt;fon=
t-variant:normal;vertical-align:baseline;white-space:pre-wrap">In QA</span>=
</p></li><li dir=3D"ltr" style=3D"list-style-type:circle;font-size:11pt;fon=
t-family:Arial,sans-serif;background-color:transparent;font-variant:normal;=
vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-heigh=
t:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=
=3D"font-size:11pt;font-variant:normal;vertical-align:baseline;white-space:=
pre-wrap">Release Date w/c 2026-10-12</span></p></li></ul><li dir=3D"ltr" s=
tyle=3D"list-style-type:disc;font-size:11pt;font-family:Arial,sans-serif;ba=
ckground-color:transparent;font-variant:normal;vertical-align:baseline;whit=
e-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin=
-bottom:0pt" role=3D"presentation"><span style=3D"font-size:11pt;font-varia=
nt:normal;vertical-align:baseline;white-space:pre-wrap">YP 5.0.21</span></p=
></li><ul style=3D"margin-top:0px;margin-bottom:0px"><li dir=3D"ltr" style=
=3D"list-style-type:circle;font-size:11pt;font-family:Arial,sans-serif;back=
ground-color:transparent;font-variant:normal;vertical-align:baseline;white-=
space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-b=
ottom:0pt" role=3D"presentation"><span style=3D"font-size:11pt;font-variant=
:normal;vertical-align:baseline;white-space:pre-wrap">Build Date w/c 2026-1=
0-05</span></p></li><li dir=3D"ltr" style=3D"list-style-type:circle;font-si=
ze:11pt;font-family:Arial,sans-serif;background-color:transparent;font-vari=
ant:normal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D=
"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><=
span style=3D"font-size:11pt;font-variant:normal;vertical-align:baseline;wh=
ite-space:pre-wrap">Release Date w/c 2026-10-19</span></p></li></ul><li dir=
=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-family:Arial,san=
s-serif;color:rgb(0,0,0);background-color:transparent;font-variant:normal;v=
ertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height=
:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=
=3D"font-size:11pt;background-color:transparent;font-variant:normal;vertica=
l-align:baseline;white-space:pre-wrap">For future release dates, see </span=
><a href=3D"https://wiki.yoctoproject.org/wiki/Release_calendar" style=3D"t=
ext-decoration:none"><span style=3D"font-size:11pt;background-color:transpa=
rent;font-variant:normal;text-decoration:underline;vertical-align:baseline;=
white-space:pre-wrap">https://wiki.yoctoproject.org/wiki/Release_calendar</=
span></a></p></li></ul><br><p dir=3D"ltr" style=3D"line-height:1.38;margin-=
top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-family:Arial,=
sans-serif;color:rgb(0,0,0);background-color:transparent;font-variant:norma=
l;vertical-align:baseline;white-space:pre-wrap">The Yocto Project=E2=80=99s=
 technical governance is through its Technical Steering Committee, more inf=
ormation is available at:</span></p><p dir=3D"ltr" style=3D"line-height:1.3=
8;margin-top:0pt;margin-bottom:0pt"><a href=3D"https://wiki.yoctoproject.or=
g/wiki/TSC" style=3D"text-decoration:none"><span style=3D"font-size:11pt;fo=
nt-family:Arial,sans-serif;background-color:transparent;font-variant:normal=
;text-decoration:underline;vertical-align:baseline;white-space:pre-wrap">ht=
tps://wiki.yoctoproject.org/wiki/TSC</span></a></p><br><p dir=3D"ltr" style=
=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-=
size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-color:tr=
ansparent;font-variant:normal;vertical-align:baseline;white-space:pre-wrap"=
>The Status reports are stored on the wiki at: </span><a href=3D"https://wi=
ki.yoctoproject.org/wiki/Weekly_Status" style=3D"text-decoration:none"><spa=
n style=3D"font-size:11pt;font-family:Arial,sans-serif;background-color:tra=
nsparent;font-variant:normal;text-decoration:underline;vertical-align:basel=
ine;white-space:pre-wrap">https://wiki.yoctoproject.org/wiki/Weekly_Status<=
/span></a></p><br><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;m=
argin-bottom:0pt"><span style=3D"font-size:11pt;font-family:Arial,sans-seri=
f;color:rgb(0,0,0);background-color:transparent;font-variant:normal;vertica=
l-align:baseline;white-space:pre-wrap">[If anyone has suggestions for other=
 information you=E2=80=99d like to see on this weekly status update, let us=
 know!]</span></p></span><br class=3D"gmail-Apple-interchange-newline"></di=
v><div dir=3D"ltr" class=3D"gmail_signature" data-smartmail=3D"gmail_signat=
ure"><div dir=3D"ltr"><div dir=3D"ltr"><p class=3D"MsoNormal" style=3D"back=
ground-image:initial;background-position:initial;background-repeat:initial"=
><span style=3D"font-size:12pt;font-family:Arial,sans-serif">Thanks,<span><=
/span></span></p>

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

--000000000000cb8d9c065d2c9f44--

