Return-Path: <sjolley.yp.pm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C25FCD3440
	for <webhook@archiver.kernel.org>; Tue,  5 May 2026 14:47:51 +0000 (UTC)
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.41294.1777992468707903370
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 May 2026 07:47:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=aMzbv1SY;
 spf=pass (domain: gmail.com, ip: 74.125.82.172, mailfrom: sjolley.yp.pm@gmail.com)
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-2ef2a1cc06dso8187630eec.0
        for <openembedded-core@lists.openembedded.org>; Tue, 05 May 2026 07:47:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777992468; cv=none;
        d=google.com; s=arc-20240605;
        b=OKfcxRuVXJjNxkNULASpr+rKzG/+btCAbi+7mTe3SY6weqoiKnowVLCW5u9Z6vJPaH
         QeABGpr4QX2MoJAFpFotdDDY46RvtFHVR2euWHy1BFLOHG0PsijWbg4UsRRcpXlQ+7hu
         eccaf9x45XFlQQqOVTvN+PlZ1/18GYUWfi/eBQjArQQd0wa1HPqS6eoWsQQ0zSA0ZGdM
         EtfxWVZXJnHUFGk3CGzKdyLrkmYhzsZ2no+QXdr3x21H4pCuAdq2P+rzPaZR5Oi8GZtA
         6JKJq4bHknqG1qkmH2c54AI5iQSYyoUt6bXVURgMycECwpfnaoreZBJ8ekSOt18vtYE7
         YQRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=Nqaj4V8rcUyPQ5AbBtMc9It+UXlG2sVanvRJe4gUOm4=;
        fh=vsFoza/X2LXaD1/ENlWWdMXhON9lH1dzZqiIj9jhvxE=;
        b=bvu9I2c/s8ZtGtfXygbhp87mkcV04Xh4WhL7UgamlSjQZbeaRWA2qvvWEaVxeEbP+x
         yfa1wUzCW9IjMDBmH4X41cnMZcpRNAD5LPVtH8W5ZYGJ0zHBOqNAMn/2NHNxt1xQI0Og
         fP1cpnRtr9rWEpdL1LCk/HQJDcTc9x11Ij93mw/Pp+0jthxlTg9XlrwM1z1JSeKmRUUM
         RkLlOTASiSQr2Q1N23TvemiuSHPAdQkhZHfymETlAWWDsqMe280ynl4t772Fm0IeF/Yi
         zw+TWJSI8DaLVi5Y43rsfmY27R+1mhSS6u9d83KMBZcAcxcEb4UEgSosOQP6bfTyl2C0
         qKIw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777992468; x=1778597268; darn=lists.openembedded.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Nqaj4V8rcUyPQ5AbBtMc9It+UXlG2sVanvRJe4gUOm4=;
        b=aMzbv1SY5N3x9DqckI3VCzuHZ0DL9FQjVafIIZPuuFlg5aAaLIeu31PSEkYi6tmvex
         56lfrXMcwxKjORvq0wBi0xtF0ay9m8UyuvrdUnpQT+gjVad20dZw14rpqIgxHaPtt5Z9
         WtEekDI2Q5JkFSYFJ835QwmUrGX//Dah5YcMVwoI3SmDgQMHcYeDg2rhEfXXAOhs20rU
         ruHVmUa0C36xcN2pRlZH4i9kxr6kawsJzyrpCc1ou2aES0zDamDHGUFWEh/Byx0nGQ9V
         6O3H99MOSBDgASs5+GfhcAslLhJFtykL7/KBvWVqfNSeAQfEYp/+AxMVrFZwASrTlf7v
         APCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777992468; x=1778597268;
        h=to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Nqaj4V8rcUyPQ5AbBtMc9It+UXlG2sVanvRJe4gUOm4=;
        b=R4CJKkK7slhLhLFmgQyIrD3Vutdg3sl/yM8vNIg4A0S8IpGOJREC5jDAy0y3F4tA/y
         1Wx8yEzXOqR2/L2Fs70jioodKK1Nw6A+v3FHN0kwyl/VqnSE5ak3AR+IoT6ejKivxCLt
         7WT5o178PAzHhgH/eLUOEm7EgsFXWRMOFw4tiX2vq42jO5Hqg8mohGbhclBRFRfUbn2C
         Ff8JowcYsvVRYsJjVY9vsjghhmu4kFKOd8G8KmVIB9CGeqVA1IP/JZM31F4Op+oLvyEB
         qolU9/rJpPhmHSbYjtTUm8HJTgCUhEozbWihfhCkPT1B+InPYHg27WGK//xQVtl8u++R
         IBUg==
X-Forwarded-Encrypted: i=1; AFNElJ/AvT+9BJpAB7DbM/pahlBjFpYlpg49UUy2+20bIF5mB9nyDUY3JYuTjes7ULWUlFVmKy7XwjpUTpthwUl6UXWn0A==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yy6qGuqQmj+O11HdaONT0cPCk9wJ2Z/KkX03Uf1hnqDywp/EobD
	r23tLOFkE/KN42sITopt4n7cnfL53FWHf4t4zvrA+4rv36/aXAWNHijTSFKHxUfHe9xZna9ukjs
	o7aOVK8+WHt5b4Bb+WUX+mjNMYlln1fQ=
X-Gm-Gg: AeBDieuFQMKV0yY9KlH6pI++cypG0rRTpx2c/40ciI5QFmZ7p9jA7wguE/mMdjzPUH9
	lyv36uImyPbyDavD8BIY/W13gz/xJYAuR+MSfxsxpd4fmnHnIdIUtD63sH9jr6RcO/OqDXbc+AP
	75thfEHVXg12RQHk0/GGmQGQPkbMduNZboP9P6qN4qY5fMI5WpBE8DuLkH0rAI9RM5nB8RPaYFZ
	HVKmb/Tk45NNn/ko5iuz1FL9WKZlXSf3XIGEEhb2um2QDDwzPv/lS1KFnj7aOKaTB1NTGUUjdOA
	7PFuLURXFVs8796K8iqGZ4XmjlthokErzIl9YkAClyd7BzR5XNkD61Utr2KCR5GRp8jWZG8TreS
	q9Ifpub7md6YXKK89JXlYN1UMcF6+dJGGx6OoAHBJO/5QDmbOuX+ONqwxl5jsp1/Ps3k8Yx5gTU
	H0m573cCpZ2bp3FWiCo2EBUd73m2UF
X-Received: by 2002:a05:7300:5792:b0:2da:933b:f51f with SMTP id
 5a478bee46e88-2efb84b00cbmr7950808eec.11.1777992467604; Tue, 05 May 2026
 07:47:47 -0700 (PDT)
MIME-Version: 1.0
From: Stephen K Jolley <sjolley.yp.pm@gmail.com>
Date: Tue, 5 May 2026 08:47:36 -0600
X-Gm-Features: AVHnY4KbSEcgzmMTutk_Hn-hfPdHLNgP1BLVX3Ls80GWISl5XiEHnO9n_w73npQ
Message-ID: <CAK5yBb--tdXj8xe=_-hnUa6CZJEKRdzStvYHbBf0umK-UpwXFg@mail.gmail.com>
Subject: Yocto Project Status 28 April 2026 (WW19)
To: Yocto-mailing-list <yocto@lists.yoctoproject.org>, 
	",openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	yocto-status@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="00000000000071e948065113218c"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 May 2026 14:47:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236490

--00000000000071e948065113218c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Current Dev Position: YP 6.1 M1

Next Deadline: YP 6.1 M1: w/c 2026-06-22

Next Team Meetings:

   -

   Bug Triage meeting - Thursday 7th May 7:30am PDT (
   https://zoom.us/j/454367603?pwd=3DZGxoa2ZXL3FkM3Y0bFd5aVpHVVZ6dz09)
   -

   Weekly Project Engineering Sync  - Tuesday 5th May. 8am PDT (
   https://zoom.us/j/990892712?pwd=3DcHU1MjhoM2x6ck81bkcrYjRrcmJsUT09)
   <https://zoom.us/j/990892712>
   -

   Yocto Project Patch Review - Thursday 7th May 10am GMT and Monday 11th
   May 9am PDT (https://zoom.us/j/9776239
   <https://zoom.us/j/97762397148?pwd=3D1xkiC9hp9SjEonaTaONwTb6iWry4Eb.1>7
   148?pwd=3D1xk0iC9hp9SjEonaTaONwTb6iWry4Eb.1
   <https://zoom.us/j/97762397148?pwd=3D1xkiC9hp9SjEonaTaONwTb6iWry4Eb.1>)


Project data dashboard: https://dashboard.yoctoproject.org/

Key Status/Updates:

   -

   YP 4.0.35 was released
   -

   YP 5.3.4 is due to release, pending TSC approval
   -

   YP 6.0 is due to release, pending TSC approval
   -

   We=E2=80=99re working through the backlog of patches, the bandwidth for =
changes
   needing in depth review/feedback continues to be a challenge
   -

   Intermittent build failures continue to be problematic
   -

   Patch review/merging is slow due to public holidays clashing with a
   review call
   -

   Master is open for new development


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

   WDD 2698 (last week 2788) (
   https://wiki.yoctoproject.org/charts/combo.html)
   -

   OE-Core/Poky Patch Metrics
   -

      Total patches found: 1087 (last week 1085)
      -

      Patches in the Pending State: 146 (13%) [last week 146 (13%)
      -

      https://valkyrie.yocto.io/pub/non-release/patchmetrics/


Upcoming dot releases:

   -

   YP 5.3.4 is due to release, pending TSC approval
   -

   YP 5.0.18
   -

      Build Date  2026-05-11
      -

      Release Date 2026-05-25
      -

   YP 6.0.1
   -

      Build Date  2026-05-18
      -

      Release Date 2026-06-01
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



*Stephen K. Jolley*

*Yocto Project Program Manager*

(    *Cell*:                (208) 244-4460

* *Email*:                 *s
<stephen.k.jolley@intel.com>jolley.yp.pm@gmail.com <jolley.yp.pm@gmail.com>=
*

--00000000000071e948065113218c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><span id=3D"gmail-docs-internal-guid-35068707-7fff-a2=
da-38cd-3184ad95f451"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0=
pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-family:Arial,sans-=
serif;color:rgb(0,0,0);background-color:transparent;font-variant:normal;ver=
tical-align:baseline;white-space:pre-wrap">Current Dev Position: YP 6.1 M1<=
/span></p><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bo=
ttom:0pt"><span style=3D"font-size:11pt;font-family:Arial,sans-serif;color:=
rgb(0,0,0);background-color:transparent;font-variant:normal;vertical-align:=
baseline;white-space:pre-wrap">Next Deadline: YP </span><span style=3D"font=
-size:9.5pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-color:=
transparent;font-variant:normal;vertical-align:baseline;white-space:pre-wra=
p">6.1 M1:</span><span style=3D"font-size:11pt;font-family:Arial,sans-serif=
;color:rgb(0,0,0);background-color:transparent;font-variant:normal;vertical=
-align:baseline;white-space:pre-wrap"> w/c 2026-06-22</span></p><br><p dir=
=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span =
style=3D"font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);backg=
round-color:transparent;font-variant:normal;vertical-align:baseline;white-s=
pace:pre-wrap">Next Team Meetings:</span></p><ul style=3D"margin-top:0px;ma=
rgin-bottom:0px"><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:9.=
5pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-color:transpar=
ent;font-variant:normal;vertical-align:baseline;white-space:pre"><p dir=3D"=
ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"pr=
esentation"><span style=3D"font-size:11pt;background-color:transparent;font=
-variant:normal;vertical-align:baseline;white-space:pre-wrap">Bug Triage me=
eting - Thursday 7th May 7:30am PDT (</span><a href=3D"https://zoom.us/j/45=
4367603?pwd=3DZGxoa2ZXL3FkM3Y0bFd5aVpHVVZ6dz09" style=3D"text-decoration:no=
ne"><span style=3D"font-size:11pt;background-color:transparent;font-variant=
:normal;text-decoration:underline;vertical-align:baseline;white-space:pre-w=
rap">https://zoom.us/j/454367603?pwd=3DZGxoa2ZXL3FkM3Y0bFd5aVpHVVZ6dz09</sp=
an></a><span style=3D"font-size:11pt;background-color:transparent;font-vari=
ant:normal;vertical-align:baseline;white-space:pre-wrap">)</span></p></li><=
li dir=3D"ltr" style=3D"list-style-type:disc;font-size:9.5pt;font-family:Ar=
ial,sans-serif;color:rgb(0,0,0);background-color:transparent;font-variant:n=
ormal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line=
-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span =
style=3D"font-size:11pt;background-color:transparent;font-variant:normal;ve=
rtical-align:baseline;white-space:pre-wrap">Weekly Project Engineering Sync=
=C2=A0 - Tuesday 5th May. 8am PDT (</span><a href=3D"https://zoom.us/j/9908=
92712?pwd=3DcHU1MjhoM2x6ck81bkcrYjRrcmJsUT09" style=3D"text-decoration:none=
"><span style=3D"font-size:11pt;background-color:transparent;font-variant:n=
ormal;text-decoration:underline;vertical-align:baseline;white-space:pre-wra=
p">https://zoom.us/j/990892712?pwd=3DcHU1MjhoM2x6ck81bkcrYjRrcmJsUT09</span=
></a><a href=3D"https://zoom.us/j/990892712" style=3D"text-decoration:none"=
><span style=3D"font-size:11pt;background-color:transparent;font-variant:no=
rmal;text-decoration:underline;vertical-align:baseline;white-space:pre-wrap=
">)</span></a></p></li><li dir=3D"ltr" style=3D"list-style-type:disc;font-s=
ize:9.5pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-color:tr=
ansparent;font-variant:normal;vertical-align:baseline;white-space:pre"><p d=
ir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=
=3D"presentation"><span style=3D"font-size:11pt;background-color:transparen=
t;font-variant:normal;vertical-align:baseline;white-space:pre-wrap">Yocto P=
roject Patch Review - Thursday 7th May 10am GMT and Monday 11th May 9am PDT=
 (</span><a href=3D"https://zoom.us/j/97762397148?pwd=3D1xkiC9hp9SjEonaTaON=
wTb6iWry4Eb.1" style=3D"text-decoration:none"><span style=3D"font-size:11pt=
;background-color:transparent;font-variant:normal;text-decoration:underline=
;vertical-align:baseline;white-space:pre-wrap">https://zoom.us/j/9776239</s=
pan></a><span style=3D"font-size:11pt;background-color:transparent;font-var=
iant:normal;vertical-align:baseline;white-space:pre-wrap">7</span><a href=
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
line;white-space:pre-wrap">YP 4.0.35 was released</span></p></li><li dir=3D=
"ltr" style=3D"list-style-type:disc;font-size:11pt;font-family:Arial,sans-s=
erif;color:rgb(0,0,0);background-color:transparent;font-variant:normal;vert=
ical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.=
38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"f=
ont-size:11pt;background-color:transparent;font-variant:normal;vertical-ali=
gn:baseline;white-space:pre-wrap">YP 5.3.4 is due to release, pending TSC a=
pproval</span></p></li><li dir=3D"ltr" style=3D"list-style-type:disc;font-s=
ize:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-color:tra=
nsparent;font-variant:normal;vertical-align:baseline;white-space:pre"><p di=
r=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=
=3D"presentation"><span style=3D"font-size:11pt;background-color:transparen=
t;font-variant:normal;vertical-align:baseline;white-space:pre-wrap">YP 6.0 =
is due to release, pending TSC approval</span></p></li><li dir=3D"ltr" styl=
e=3D"list-style-type:disc;font-size:11pt;font-family:Arial,sans-serif;color=
:rgb(0,0,0);background-color:transparent;font-variant:normal;vertical-align=
:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-=
top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"font-size:1=
1pt;background-color:transparent;font-variant:normal;vertical-align:baselin=
e;white-space:pre-wrap">We=E2=80=99re working through the backlog of patche=
s, the bandwidth for changes needing in depth review/feedback continues to =
be a challenge</span></p></li><li dir=3D"ltr" style=3D"list-style-type:disc=
;font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-co=
lor:transparent;font-variant:normal;vertical-align:baseline;white-space:pre=
"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt=
" role=3D"presentation"><span style=3D"font-size:11pt;background-color:tran=
sparent;font-variant:normal;vertical-align:baseline;white-space:pre-wrap">I=
ntermittent build failures continue to be problematic</span></p></li><li di=
r=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-family:Arial,sa=
ns-serif;color:rgb(0,0,0);background-color:transparent;font-variant:normal;=
vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-heigh=
t:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=
=3D"font-size:11pt;background-color:transparent;font-variant:normal;vertica=
l-align:baseline;white-space:pre-wrap">Patch review/merging is slow due to =
public holidays clashing with a review call</span></p></li><li dir=3D"ltr" =
style=3D"list-style-type:disc;font-size:11pt;font-family:Arial,sans-serif;c=
olor:rgb(0,0,0);background-color:transparent;font-variant:normal;vertical-a=
lign:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;mar=
gin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"font-si=
ze:11pt;background-color:transparent;font-variant:normal;vertical-align:bas=
eline;white-space:pre-wrap">Master is open for new development</span></p></=
li></ul><br><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-=
bottom:0pt"><span style=3D"font-size:11pt;font-family:Arial,sans-serif;colo=
r:rgb(0,0,0);background-color:transparent;font-variant:normal;vertical-alig=
n:baseline;white-space:pre-wrap">Want to contribute? We would appreciate he=
lp with the following areas:</span></p><ul style=3D"margin-top:0px;margin-b=
ottom:0px"><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;fon=
t-family:Arial,sans-serif;color:rgb(0,0,0);background-color:transparent;fon=
t-variant:normal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" st=
yle=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentat=
ion"><span style=3D"font-size:11pt;background-color:transparent;font-varian=
t:normal;vertical-align:baseline;white-space:pre-wrap">We have several open=
 issues for pseudo and limited maintainer time to work on them. Help from s=
omeone familiar with systems programming in C would be greatly appreciated.=
 </span><a href=3D"https://bugzilla.yoctoproject.org/buglist.cgi?list_id=3D=
661406&amp;priority=3DHigh&amp;priority=3DMedium%2B&amp;product=3DPseudo&am=
p;query_format=3Dadvanced&amp;resolution=3D---" style=3D"text-decoration:no=
ne"><span style=3D"font-size:11pt;background-color:transparent;font-variant=
:normal;text-decoration:underline;vertical-align:baseline;white-space:pre-w=
rap">https://bugzilla.yoctoproject.org/buglist.cgi?list_id=3D661406&amp;pri=
ority=3DHigh&amp;priority=3DMedium%2B&amp;product=3DPseudo&amp;query_format=
=3Dadvanced&amp;resolution=3D---</span></a></p></li><li dir=3D"ltr" style=
=3D"list-style-type:disc;font-size:11pt;font-family:Arial,sans-serif;color:=
rgb(0,0,0);background-color:transparent;font-variant:normal;vertical-align:=
baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-t=
op:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"font-size:11=
pt;background-color:transparent;font-variant:normal;vertical-align:baseline=
;white-space:pre-wrap">There are a large number of intermittent failures on=
 our autobuilder, any help with investigating, reproducing or solving these=
 issues would be welcome! </span><a href=3D"https://valkyrie.yocto.io/pub/n=
on-release/abint/" style=3D"text-decoration:none"><span style=3D"font-size:=
11pt;background-color:transparent;font-variant:normal;text-decoration:under=
line;vertical-align:baseline;white-space:pre-wrap">https://valkyrie.yocto.i=
o/pub/non-release/abint/</span></a></p></li><li dir=3D"ltr" style=3D"list-s=
tyle-type:disc;font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0)=
;background-color:transparent;font-variant:normal;vertical-align:baseline;w=
hite-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;mar=
gin-bottom:0pt" role=3D"presentation"><span style=3D"font-size:11pt;backgro=
und-color:transparent;font-variant:normal;vertical-align:baseline;white-spa=
ce:pre-wrap">Many recipes in openembedded-core would benefit from a new rec=
ipe maintainer. Please look at </span><a href=3D"https://git.openembedded.o=
rg/openembedded-core/tree/meta/conf/distro/include/maintainers.inc" style=
=3D"text-decoration:none"><span style=3D"font-size:11pt;background-color:tr=
ansparent;font-variant:normal;text-decoration:underline;vertical-align:base=
line;white-space:pre-wrap">https://git.openembedded.org/openembedded-core/t=
ree/meta/conf/distro/include/maintainers.inc</span></a><span style=3D"font-=
size:11pt;background-color:transparent;font-variant:normal;vertical-align:b=
aseline;white-space:pre-wrap"> and see if you can adopt any of the unassign=
ed recipes.</span></p></li><li dir=3D"ltr" style=3D"list-style-type:disc;fo=
nt-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-color=
:transparent;font-variant:normal;vertical-align:baseline;white-space:pre"><=
p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" r=
ole=3D"presentation"><span style=3D"font-size:11pt;background-color:transpa=
rent;font-variant:normal;vertical-align:baseline;white-space:pre-wrap">For =
more ways to contribute, see </span><a href=3D"https://docs.google.com/docu=
ment/d/18oxKWxLorfF813h82mK6yKTIHeBp_-9owFuCWbzgjOk/edit?usp=3Dsharing" sty=
le=3D"text-decoration:none"><span style=3D"font-size:11pt;background-color:=
transparent;font-variant:normal;text-decoration:underline;vertical-align:ba=
seline;white-space:pre-wrap">https://docs.google.com/document/d/18oxKWxLorf=
F813h82mK6yKTIHeBp_-9owFuCWbzgjOk/edit?usp=3Dsharing</span></a></p></li></u=
l><br><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom=
:0pt"><span style=3D"font-size:11pt;font-family:Arial,sans-serif;color:rgb(=
0,0,0);background-color:transparent;font-variant:normal;vertical-align:base=
line;white-space:pre-wrap">New to the project?</span></p><ul style=3D"margi=
n-top:0px;margin-bottom:0px"><li dir=3D"ltr" style=3D"list-style-type:disc;=
font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-col=
or:transparent;font-variant:normal;vertical-align:baseline;white-space:pre"=
><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"=
 role=3D"presentation"><span style=3D"font-size:11pt;background-color:trans=
parent;font-variant:normal;vertical-align:baseline;white-space:pre-wrap">We=
 have a list of issues we think are good places to start contributing: </sp=
an><a href=3D"https://bugzilla.yoctoproject.org/buglist.cgi?quicksearch=3DN=
EWCOMER" style=3D"text-decoration:none"><span style=3D"font-size:11pt;backg=
round-color:transparent;font-variant:normal;text-decoration:underline;verti=
cal-align:baseline;white-space:pre-wrap">https://bugzilla.yoctoproject.org/=
buglist.cgi?quicksearch=3DNEWCOMER</span></a></p></li></ul><br><p dir=3D"lt=
r" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=
=3D"font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background=
-color:transparent;font-variant:normal;vertical-align:baseline;white-space:=
pre-wrap">Tracking Metrics:</span></p><ul style=3D"margin-top:0px;margin-bo=
ttom:0px"><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font=
-family:Arial,sans-serif;color:rgb(0,0,0);background-color:transparent;font=
-variant:normal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" sty=
le=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentati=
on"><span style=3D"font-size:11pt;background-color:transparent;font-variant=
:normal;vertical-align:baseline;white-space:pre-wrap">WDD 2698 (last week 2=
788) </span><span style=3D"font-size:11pt;font-family:Consolas,sans-serif;b=
ackground-color:transparent;font-variant:normal;vertical-align:baseline;whi=
te-space:pre-wrap">(</span><a href=3D"https://wiki.yoctoproject.org/charts/=
combo.html" style=3D"text-decoration:none"><span style=3D"font-size:11pt;ba=
ckground-color:transparent;font-variant:normal;text-decoration:underline;ve=
rtical-align:baseline;white-space:pre-wrap">https://wiki.yoctoproject.org/c=
harts/combo.html</span></a><span style=3D"font-size:11pt;font-family:Consol=
as,sans-serif;background-color:transparent;font-variant:normal;vertical-ali=
gn:baseline;white-space:pre-wrap">)</span></p></li><li dir=3D"ltr" style=3D=
"list-style-type:disc;font-size:11pt;font-family:Consolas,sans-serif;color:=
rgb(0,0,0);background-color:transparent;font-variant:normal;vertical-align:=
baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-t=
op:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"font-size:11=
pt;font-family:Arial,sans-serif;background-color:transparent;font-variant:n=
ormal;vertical-align:baseline;white-space:pre-wrap">OE-Core/Poky Patch Metr=
ics</span></p></li><ul style=3D"margin-top:0px;margin-bottom:0px"><li dir=
=3D"ltr" style=3D"list-style-type:circle;font-size:11pt;font-family:Arial,s=
ans-serif;color:rgb(0,0,0);background-color:transparent;font-variant:normal=
;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-heig=
ht:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=
=3D"font-size:11pt;background-color:transparent;font-variant:normal;vertica=
l-align:baseline;white-space:pre-wrap">Total patches found: 1087 (last week=
 1085)</span></p></li><li dir=3D"ltr" style=3D"list-style-type:circle;font-=
size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-color:tr=
ansparent;font-variant:normal;vertical-align:baseline;white-space:pre"><p d=
ir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=
=3D"presentation"><span style=3D"font-size:11pt;background-color:transparen=
t;font-variant:normal;vertical-align:baseline;white-space:pre-wrap">Patches=
 in the Pending State: 146 (13%) [last week 146 (13%)</span></p></li><li di=
r=3D"ltr" style=3D"list-style-type:circle;font-size:11pt;font-family:Consol=
as,sans-serif;color:rgb(0,0,0);background-color:transparent;font-variant:no=
rmal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-=
height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><a href=
=3D"https://valkyrie.yocto.io/pub/non-release/patchmetrics/" style=3D"text-=
decoration:none"><span style=3D"font-size:11pt;font-family:Arial,sans-serif=
;background-color:transparent;font-variant:normal;text-decoration:underline=
;vertical-align:baseline;white-space:pre-wrap">https://valkyrie.yocto.io/pu=
b/non-release/patchmetrics/</span></a></p></li></ul></ul><br><p dir=3D"ltr"=
 style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D=
"font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-co=
lor:transparent;font-variant:normal;vertical-align:baseline;white-space:pre=
-wrap">Upcoming dot releases:</span></p><ul style=3D"margin-top:0px;margin-=
bottom:0px"><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;fo=
nt-family:Arial,sans-serif;color:rgb(0,0,0);background-color:transparent;fo=
nt-variant:normal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" s=
tyle=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presenta=
tion"><span style=3D"font-size:11pt;background-color:transparent;font-varia=
nt:normal;vertical-align:baseline;white-space:pre-wrap">YP 5.3.4 is due to =
release, pending TSC approval</span></p></li><li dir=3D"ltr" style=3D"list-=
style-type:disc;font-size:11pt;font-family:Arial,sans-serif;background-colo=
r:transparent;font-variant:normal;vertical-align:baseline;white-space:pre">=
<p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" =
role=3D"presentation"><span style=3D"font-size:11pt;font-variant:normal;ver=
tical-align:baseline;white-space:pre-wrap">YP 5.0.18</span></p></li><ul sty=
le=3D"margin-top:0px;margin-bottom:0px"><li dir=3D"ltr" style=3D"list-style=
-type:circle;font-size:11pt;font-family:Arial,sans-serif;background-color:t=
ransparent;font-variant:normal;vertical-align:baseline;white-space:pre"><p =
dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" rol=
e=3D"presentation"><span style=3D"font-size:11pt;font-variant:normal;vertic=
al-align:baseline;white-space:pre-wrap">Build Date=C2=A0 2026-05-11</span><=
/p></li><li dir=3D"ltr" style=3D"list-style-type:circle;font-size:11pt;font=
-family:Arial,sans-serif;background-color:transparent;font-variant:normal;v=
ertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height=
:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=
=3D"font-size:11pt;font-variant:normal;vertical-align:baseline;white-space:=
pre-wrap">Release Date 2026-05-25</span></p></li></ul><li dir=3D"ltr" style=
=3D"list-style-type:disc;font-size:11pt;font-family:Arial,sans-serif;backgr=
ound-color:transparent;font-variant:normal;vertical-align:baseline;white-sp=
ace:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bot=
tom:0pt" role=3D"presentation"><span style=3D"font-size:11pt;font-variant:n=
ormal;vertical-align:baseline;white-space:pre-wrap">YP 6.0.1</span></p></li=
><ul style=3D"margin-top:0px;margin-bottom:0px"><li dir=3D"ltr" style=3D"li=
st-style-type:circle;font-size:11pt;font-family:Arial,sans-serif;background=
-color:transparent;font-variant:normal;vertical-align:baseline;white-space:=
pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:=
0pt" role=3D"presentation"><span style=3D"font-size:11pt;font-variant:norma=
l;vertical-align:baseline;white-space:pre-wrap">Build Date=C2=A0 2026-05-18=
</span></p></li><li dir=3D"ltr" style=3D"list-style-type:circle;font-size:1=
1pt;font-family:Arial,sans-serif;background-color:transparent;font-variant:=
normal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"lin=
e-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span=
 style=3D"font-size:11pt;font-variant:normal;vertical-align:baseline;white-=
space:pre-wrap">Release Date 2026-06-01</span></p></li></ul><li dir=3D"ltr"=
 style=3D"list-style-type:disc;font-size:11pt;font-family:Arial,sans-serif;=
color:rgb(0,0,0);background-color:transparent;font-variant:normal;vertical-=
align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;ma=
rgin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"font-s=
ize:11pt;background-color:transparent;font-variant:normal;vertical-align:ba=
seline;white-space:pre-wrap">For future release dates, see </span><a href=
=3D"https://wiki.yoctoproject.org/wiki/Release_calendar" style=3D"text-deco=
ration:none"><span style=3D"font-size:11pt;background-color:transparent;fon=
t-variant:normal;text-decoration:underline;vertical-align:baseline;white-sp=
ace:pre-wrap">https://wiki.yoctoproject.org/wiki/Release_calendar</span></a=
></p></li></ul><br><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;=
margin-bottom:0pt"><span style=3D"font-size:11pt;font-family:Arial,sans-ser=
if;color:rgb(0,0,0);background-color:transparent;font-variant:normal;vertic=
al-align:baseline;white-space:pre-wrap">The Yocto Project=E2=80=99s technic=
al governance is through its Technical Steering Committee, more information=
 is available at:</span></p><p dir=3D"ltr" style=3D"line-height:1.38;margin=
-top:0pt;margin-bottom:0pt"><a href=3D"https://wiki.yoctoproject.org/wiki/T=
SC" style=3D"text-decoration:none"><span style=3D"font-size:11pt;font-famil=
y:Arial,sans-serif;background-color:transparent;font-variant:normal;text-de=
coration:underline;vertical-align:baseline;white-space:pre-wrap">https://wi=
ki.yoctoproject.org/wiki/TSC</span></a></p><br><p dir=3D"ltr" style=3D"line=
-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11p=
t;font-family:Arial,sans-serif;color:rgb(0,0,0);background-color:transparen=
t;font-variant:normal;vertical-align:baseline;white-space:pre-wrap">The Sta=
tus reports are now stored on the wiki at: </span><a href=3D"https://wiki.y=
octoproject.org/wiki/Weekly_Status" style=3D"text-decoration:none"><span st=
yle=3D"font-size:11pt;font-family:Arial,sans-serif;background-color:transpa=
rent;font-variant:normal;text-decoration:underline;vertical-align:baseline;=
white-space:pre-wrap">https://wiki.yoctoproject.org/wiki/Weekly_Status</spa=
n></a></p><br><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margi=
n-bottom:0pt"><span style=3D"font-size:11pt;font-family:Arial,sans-serif;co=
lor:rgb(0,0,0);background-color:transparent;font-variant:normal;vertical-al=
ign:baseline;white-space:pre-wrap">[If anyone has suggestions for other inf=
ormation you=E2=80=99d like to see on this weekly status update, let us kno=
w!]</span></p></span><br class=3D"gmail-Apple-interchange-newline"></div><d=
iv dir=3D"ltr" class=3D"gmail_signature" data-smartmail=3D"gmail_signature"=
><div dir=3D"ltr"><div dir=3D"ltr"><p class=3D"MsoNormal" style=3D"backgrou=
nd-image:initial;background-position:initial;background-repeat:initial"><sp=
an style=3D"font-size:12pt;font-family:Arial,sans-serif">Thanks,<span></spa=
n></span></p>

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

--00000000000071e948065113218c--

