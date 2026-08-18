Return-Path: <sjolley.yp.pm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69DE2C5DF7D
	for <webhook@archiver.kernel.org>; Tue, 18 Aug 2026 14:49:02 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10433.1787064537270935619
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Aug 2026 07:48:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=JCxwPuVM;
 spf=pass (domain: gmail.com, ip: 209.85.214.174, mailfrom: sjolley.yp.pm@gmail.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2d5cad1a6baso13403345ad.3
        for <openembedded-core@lists.openembedded.org>; Tue, 18 Aug 2026 07:48:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787064536; cv=none;
        d=google.com; s=arc-20260327;
        b=WtM9ZGxwABFdZkbN8vmEcg2cLbG3HZn4eFRlu/R4Vb2T+9O1aAKPSbjldhBRg/uLyP
         2Vw7vIp+PjkfSGy/0DVrSxjICXJQscK6l3f3LH+16UNW30oTV0cddvfRZd+vT3j0+JSg
         QmAWhTx+MmRGfTGuxhcQKDVpACx7zjGSEgYXcUvG182wTFYCq0mJ2qgPKlrRM3Oggoee
         ug4g4Pa1W1OXvZceJoL6U52UtJHFfoP9Sm14WQ5HMeXLM7tUHnu/EXiwvDByEg0qVHrY
         xD6Q/FI1PamRAd4w/EkueTs/FOFBeWaYoJOlOvAXmCq3dIxU8paYEQ/RMrmnxYk5AS4W
         Qpwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=573meYn0s+mnTOZA96IMTnX1sVApE6Ybr/Qf0tKwTus=;
        fh=AuNE02feMWiSl6WY9spCI/CkUnNaUEXLck7iyj5Amtg=;
        b=Tyz0D0A/tnUyXBXnDgtnX9TwVrD9zLtuCC2gHyBt8khJzXBZe/Tq+IQlI62Z/HQjUz
         yq8X+ufaP01NsA7AxrmXrs9dA+l4WU84Wy+VFzqlD8veJvmfdVTLSwNJ03sHXmk5S/w0
         ajotGTEiDelRb7Nl0OTz7Wq4clZcJ/lCcShlcFOzF9BQoGU/5q7Nm30vJek/+YMHr1D8
         DN/3tnaKwMvKoP0jZS02kDyfA/ekOoFZkynPA5z/+Hw7lSLNtKRCUjgqsWk4Clg4f6Y8
         Q7BC5zLUNo6eyYGzXqj1fl6Osf1/WBb0OFPhtrBJlTtN3IL5j8b4SOehd42EdMJ1ds3n
         GrIQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787064536; x=1787669336; darn=lists.openembedded.org;
        h=content-type:to:subject:message-id:date:from:mime-version:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=573meYn0s+mnTOZA96IMTnX1sVApE6Ybr/Qf0tKwTus=;
        b=JCxwPuVMra6cxcTEsBNfs4jt+FguffGR8hbTwNMN7D4J2ZGurE3hdfajkyZNrNcPjn
         ikywaPiuAgdqjOQypHe/6T1PKeSDo3CmjtlTForkLATr+21f9yHRRAm0kROpw+qidbAL
         AYqmdinnz4Z5eqxn8ZX2lWVFx5pWUxsLpfxGYTXOC0Boh6tTg9/LRW2uzUIQ2CJVjCw3
         fEw14HIEwJvvGRkvgtOc9QdVavmiPQJ023HnB/Yu+MBg7LpDhmn4Lrb5lqL+ISClcEIu
         FGgY8EgTwUS5tXgQn9dtnqFNMZaYBKIaMdOovckqFFJ8hMFNsU+XHPkJGh7WN7LTPWgA
         W8Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787064536; x=1787669336;
        h=content-type:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=573meYn0s+mnTOZA96IMTnX1sVApE6Ybr/Qf0tKwTus=;
        b=VpBl/F4rPlOjMwVmiutd8xYVw6DSSpQfmMR2SNn6X0VBY/Zs1/FKWWs0eQ2mauSHMc
         +bJpOyQ3wjisdcNgKjiYb4cfTTeFZbAKBfnPxew6F29w3whDsuqWNQjTENutBjl8ohgW
         dKSFbFSsspDoAer4R2bGzTZgJkZEATfksKn4WXhyuPPwk83aXZ4JBpqonIIKvDdna/9d
         hze1O4ozdB+OrgqCyJfs6e4FJisAava6JNGMiPmEZVFoh+aXaXNIcJFb/9W0ZLwbMtxV
         Sf2N6VUwIuudOE4gasl1hr7XpXfCYxq7gAl8Xk3TqGyelVv4YflVF2XjyLUTvbT5sKLI
         +WEQ==
X-Forwarded-Encrypted: i=1; AHgh+RqJPf20O2yqhv3/NoORlOZSHMyJcEYsQTTWXBcZAnCN1n21D4pCK4CQLc811bzKOYNbwIp5ZnyLKv8/trtuDLCn1g==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yy/W1ue93dskbVoEnvfKIE/RvDo4KX7VT7DXN8C6vnR4zO+dK6s
	EU0Cqkp/JINmRcBVWyxB+9/CyBn6XzmfvCxKnLtQwOpW3C9GNR5e+u0aID6MNNqCDfu8Dg2tzM0
	DrUtH+zGSApEIxP05HhQCVRaX+2dkWsY=
X-Gm-Gg: AR+sD11iJYh3si9HiZvH9HGI3/rKaCNyRkBcG511NbcOD9mpKxQqKwbNgkrFyQrNVj8
	Y0jixtzjyhmqWa85hILro3+HyezjxZGpbgMp79llPE3llmrWv75jYtR1+ngHFuEFa9o8Z7btBVw
	ztVtBdfWmKME4+YtQTljoXaBBnD4UhJfMNztjNZuhJfkbC3HykfjS3FyGSA3GZtYE6pyhm7C0yV
	fHmtZNlQtxbgflYmP3sb1EPm3FP2JFPdtWKGozPan62ShFqTAplx3s+FryopLj0Cr+yhvitdddi
	p9Tk8CfI/MuW8ZaSXVEyKr2VddKqEuRImEPZTVwYZw+GWOiRL/5xG4Dv4UJNKcs64WQalJUKIzp
	TY54SZIkF7DF3wVb5LqwTzpacof0L5WDLvi4mtWlWwOGCZzjzVwZe5+VpN665+9uQwsdSjkK05T
	QwpOB6w+PT2YvXxg6hC2NI0ic+/W4jB6r4xwIKyoUcFoWo1s0oWutrAlpwvCfDGODiVHJrX1XTg
	pusyhRc1CRrF6yfr+Y/3vJw8N34
X-Received: by 2002:a17:903:1a2e:b0:2ca:9d5a:8b6c with SMTP id
 d9443c01a7336-2d5c4ee9bf2mr132498795ad.5.1787064535858; Tue, 18 Aug 2026
 07:48:55 -0700 (PDT)
MIME-Version: 1.0
From: Stephen K Jolley <sjolley.yp.pm@gmail.com>
Date: Tue, 18 Aug 2026 07:48:43 -0700
X-Gm-Features: AcwNN1VDtL-upNZFDFYpGXm5-3u6fTwi7jEwpOnnOd3TvXlqNL6JXRX2lTVEpYI
Message-ID: <CAK5yBb9sY1dqEp+DqbokXxsDDY63AGa6unzv54f5Q66HTYm_sA@mail.gmail.com>
Subject: Yocto Project Status 18 August 2026 (WW34)
To: Yocto-mailing-list <yocto@lists.yoctoproject.org>, 
	",openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	yocto-status@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="000000000000d9bf9c065953625d"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Aug 2026 14:49:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243686

--000000000000d9bf9c065953625d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Current Dev Position: YP 6.1 M3

Next Deadline: YP 6.1 M3: w/c 2026-08-31

Next Team Meetings:

   -

   Bug Triage meeting - Thursday 20th Aug. 7:30am PDT (
   https://zoom.us/j/454367603?pwd=3DZGxoa2ZXL3FkM3Y0bFd5aVpHVVZ6dz09)
   -

   Weekly Project Engineering Sync  - Tuesday 18th Aug. 8am PDT (
   https://zoom.us/j/990892712?pwd=3DcHU1MjhoM2x6ck81bkcrYjRrcmJsUT09)
   <https://zoom.us/j/990892712>
   -

   Yocto Project Patch Review - Thursday 20th Aug. 10am GMT and Monday 24th
   Aug. 9am PDT (
   https://zoom.us/j/97762397148?pwd=3D1xk0iC9hp9SjEonaTaONwTb6iWry4Eb.1)


Project data dashboard: https://dashboard.yoctoproject.org/

Key Status/Updates:

   -

   YP 6.1 M3 is due in two weeks and this will be the feature freeze point
   for YP 6.1.
   -

   AI scrapers and bots continue to impact the infrastructure, taking huge
   amounts of time for our sysadmins and with a significant cost impact to =
the
   project.
   -

   We would like to remind everyone that AI-generated code submitted to
   Yocto Project must include disclosure of the use of AI tools, in line wi=
th
   our policy in the contributor guide (
   https://docs.yoctoproject.org/contributor-guide/submit-changes.html#acce=
ptance-of-ai-generated-code).
   Joshua has sent patches adding AGENTS.md <http://agents.md> files to
   bitbake and openembedded-core to prompt agents to follow this policy. We
   are discussing further updates to our policy on AI assisted submissions =
as
   this is a rapidly evolving area.
   -

   There have been locking changes with do_fetch/do_unpack within the
   bitbake fetcher to allow better performance of builds with shared DL_DIR=
s.
   There are also performance improvements to the handling of repeated ssl
   connection queries.
   -

   There is discussion on the architecture list about how we could improve
   the fetcher, particularly around how recursion is handled in git
   submodules:
   https://lists.openembedded.org/g/openembedded-architecture/message/2416
   -

   We continue to try and keep up to date with upstream releases through
   the AUH, big thanks to those sending version updates and fixing version
   update issues.
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

   WDD 2704 (last week 2694) (
   https://wiki.yoctoproject.org/charts/combo.html)
   -

   OE-Core/Poky Patch Metrics
   -

      Total patches found: 1030 (last week 1028)
      -

      Patches in the Pending State: 139 (14%) [last week 139 (14%)]
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

   YP 6.0.3
   -

      Build Date w/c 2026-08-10
      -

      Release Date w/c 2026-08-24
      -

   YP 5.0.20
   -

      Build Date w/c 2026-08-17
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

--000000000000d9bf9c065953625d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><span id=3D"gmail-docs-internal-guid-acea58fe-7fff-4e=
ad-aeb9-828bd10410cf"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0=
pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-family:Arial,sans-=
serif;color:rgb(0,0,0);background-color:transparent;font-variant:normal;ver=
tical-align:baseline;white-space:pre-wrap">Current Dev Position: YP 6.1 M3<=
/span></p><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bo=
ttom:0pt"><span style=3D"font-size:11pt;font-family:Arial,sans-serif;color:=
rgb(0,0,0);background-color:transparent;font-variant:normal;vertical-align:=
baseline;white-space:pre-wrap">Next Deadline: YP 6.1 M3: w/c 2026-08-31</sp=
an></p><br><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-b=
ottom:0pt"><span style=3D"font-size:11pt;font-family:Arial,sans-serif;color=
:rgb(0,0,0);background-color:transparent;font-variant:normal;vertical-align=
:baseline;white-space:pre-wrap">Next Team Meetings:</span></p><ul style=3D"=
margin-top:0px;margin-bottom:0px"><li dir=3D"ltr" style=3D"list-style-type:=
disc;font-size:9.5pt;font-family:Arial,sans-serif;color:rgb(0,0,0);backgrou=
nd-color:transparent;font-variant:normal;vertical-align:baseline;white-spac=
e:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-botto=
m:0pt" role=3D"presentation"><span style=3D"font-size:11pt;background-color=
:transparent;font-variant:normal;vertical-align:baseline;white-space:pre-wr=
ap">Bug Triage meeting - Thursday 20th Aug. 7:30am PDT (</span><a href=3D"h=
ttps://zoom.us/j/454367603?pwd=3DZGxoa2ZXL3FkM3Y0bFd5aVpHVVZ6dz09" style=3D=
"text-decoration:none"><span style=3D"font-size:11pt;background-color:trans=
parent;font-variant:normal;text-decoration:underline;vertical-align:baselin=
e;white-space:pre-wrap">https://zoom.us/j/454367603?pwd=3DZGxoa2ZXL3FkM3Y0b=
Fd5aVpHVVZ6dz09</span></a><span style=3D"font-size:11pt;background-color:tr=
ansparent;font-variant:normal;vertical-align:baseline;white-space:pre-wrap"=
>)</span></p></li><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:9=
.5pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-color:transpa=
rent;font-variant:normal;vertical-align:baseline;white-space:pre"><p dir=3D=
"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"p=
resentation"><span style=3D"font-size:11pt;background-color:transparent;fon=
t-variant:normal;vertical-align:baseline;white-space:pre-wrap">Weekly Proje=
ct Engineering Sync=C2=A0 - Tuesday 18th Aug. 8am PDT (</span><a href=3D"ht=
tps://zoom.us/j/990892712?pwd=3DcHU1MjhoM2x6ck81bkcrYjRrcmJsUT09" style=3D"=
text-decoration:none"><span style=3D"font-size:11pt;background-color:transp=
arent;font-variant:normal;text-decoration:underline;vertical-align:baseline=
;white-space:pre-wrap">https://zoom.us/j/990892712?pwd=3DcHU1MjhoM2x6ck81bk=
crYjRrcmJsUT09</span></a><a href=3D"https://zoom.us/j/990892712" style=3D"t=
ext-decoration:none"><span style=3D"font-size:11pt;background-color:transpa=
rent;font-variant:normal;text-decoration:underline;vertical-align:baseline;=
white-space:pre-wrap">)</span></a></p></li><li dir=3D"ltr" style=3D"list-st=
yle-type:disc;font-size:9.5pt;font-family:Arial,sans-serif;color:rgb(0,0,0)=
;background-color:transparent;font-variant:normal;vertical-align:baseline;w=
hite-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;mar=
gin-bottom:0pt" role=3D"presentation"><span style=3D"font-size:11pt;backgro=
und-color:transparent;font-variant:normal;vertical-align:baseline;white-spa=
ce:pre-wrap">Yocto Project Patch Review - Thursday 20th Aug. 10am GMT and M=
onday 24th Aug. 9am PDT (</span><a href=3D"https://zoom.us/j/97762397148?pw=
d=3D1xk0iC9hp9SjEonaTaONwTb6iWry4Eb.1" style=3D"text-decoration:none"><span=
 style=3D"font-size:11pt;background-color:transparent;font-variant:normal;t=
ext-decoration:underline;vertical-align:baseline;white-space:pre-wrap">http=
s://zoom.us/j/97762397148?pwd=3D1xk0iC9hp9SjEonaTaONwTb6iWry4Eb.1</span></a=
><span style=3D"font-size:11pt;background-color:transparent;font-variant:no=
rmal;vertical-align:baseline;white-space:pre-wrap">)</span></p></li></ul><b=
r><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt=
"><span style=3D"font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,=
0);background-color:transparent;font-variant:normal;vertical-align:baseline=
;white-space:pre-wrap">Project data dashboard: </span><a href=3D"https://da=
shboard.yoctoproject.org/" style=3D"text-decoration:none"><span style=3D"fo=
nt-size:11pt;font-family:Arial,sans-serif;background-color:transparent;font=
-variant:normal;text-decoration:underline;vertical-align:baseline;white-spa=
ce:pre-wrap">https://dashboard.yoctoproject.org/</span></a><span style=3D"f=
ont-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-colo=
r:transparent;font-variant:normal;vertical-align:baseline;white-space:pre-w=
rap">=C2=A0</span></p><br><p dir=3D"ltr" style=3D"line-height:1.38;margin-t=
op:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-family:Arial,s=
ans-serif;color:rgb(0,0,0);background-color:transparent;font-variant:normal=
;vertical-align:baseline;white-space:pre-wrap">Key Status/Updates:</span></=
p><ul style=3D"margin-top:0px;margin-bottom:0px"><li dir=3D"ltr" style=3D"l=
ist-style-type:disc;font-size:11pt;font-family:Arial,sans-serif;color:rgb(0=
,0,0);background-color:transparent;font-variant:normal;vertical-align:basel=
ine;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0p=
t;margin-bottom:0pt" role=3D"presentation"><span style=3D"font-size:11pt;ba=
ckground-color:transparent;font-variant:normal;vertical-align:baseline;whit=
e-space:pre-wrap">YP 6.1 M3 is due in two weeks and this will be the featur=
e freeze point for YP 6.1.</span></p></li><li dir=3D"ltr" style=3D"list-sty=
le-type:disc;font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);b=
ackground-color:transparent;font-variant:normal;vertical-align:baseline;whi=
te-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margi=
n-bottom:0pt" role=3D"presentation"><span style=3D"font-size:11pt;backgroun=
d-color:transparent;font-variant:normal;vertical-align:baseline;white-space=
:pre-wrap">AI scrapers and bots continue to impact the infrastructure, taki=
ng huge amounts of time for our sysadmins and with a significant cost impac=
t to the project.</span></p></li><li dir=3D"ltr" style=3D"list-style-type:d=
isc;font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background=
-color:transparent;font-variant:normal;vertical-align:baseline;white-space:=
pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:=
0pt" role=3D"presentation"><span style=3D"font-size:11pt;background-color:t=
ransparent;font-variant:normal;vertical-align:baseline;white-space:pre-wrap=
">We would like to remind everyone that AI-generated code submitted to Yoct=
o Project must include disclosure of the use of AI tools, in line with our =
policy in the contributor guide (</span><a href=3D"https://docs.yoctoprojec=
t.org/contributor-guide/submit-changes.html#acceptance-of-ai-generated-code=
" style=3D"text-decoration:none"><span style=3D"font-size:11pt;background-c=
olor:transparent;font-variant:normal;text-decoration:underline;vertical-ali=
gn:baseline;white-space:pre-wrap">https://docs.yoctoproject.org/contributor=
-guide/submit-changes.html#acceptance-of-ai-generated-code</span></a><span =
style=3D"font-size:11pt;background-color:transparent;font-variant:normal;ve=
rtical-align:baseline;white-space:pre-wrap">). Joshua has sent patches addi=
ng </span><a href=3D"http://agents.md" style=3D"text-decoration:none"><span=
 style=3D"font-size:11pt;background-color:transparent;font-variant:normal;t=
ext-decoration:underline;vertical-align:baseline;white-space:pre-wrap">AGEN=
TS.md</span></a><span style=3D"font-size:11pt;background-color:transparent;=
font-variant:normal;vertical-align:baseline;white-space:pre-wrap"> files to=
 bitbake and openembedded-core to prompt agents to follow this policy. We a=
re discussing further updates to our policy on AI assisted submissions as t=
his is a rapidly evolving area.</span></p></li><li dir=3D"ltr" style=3D"lis=
t-style-type:disc;font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0=
,0);background-color:transparent;font-variant:normal;vertical-align:baselin=
e;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;=
margin-bottom:0pt" role=3D"presentation"><span style=3D"font-size:11pt;back=
ground-color:transparent;font-variant:normal;vertical-align:baseline;white-=
space:pre-wrap">There have been locking changes with do_fetch/do_unpack wit=
hin the bitbake fetcher to allow better performance of builds with shared D=
L_DIRs. There are also performance improvements to the handling of repeated=
 ssl connection queries.</span></p></li><li dir=3D"ltr" style=3D"list-style=
-type:disc;font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);bac=
kground-color:transparent;font-variant:normal;vertical-align:baseline;white=
-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-=
bottom:0pt" role=3D"presentation"><span style=3D"font-size:11pt;background-=
color:transparent;font-variant:normal;vertical-align:baseline;white-space:p=
re-wrap">There is discussion on the architecture list about how we could im=
prove the fetcher, particularly around how recursion is handled in git subm=
odules: </span><a href=3D"https://lists.openembedded.org/g/openembedded-arc=
hitecture/message/2416" style=3D"text-decoration:none"><span style=3D"font-=
size:11pt;background-color:transparent;font-variant:normal;text-decoration:=
underline;vertical-align:baseline;white-space:pre-wrap">https://lists.opene=
mbedded.org/g/openembedded-architecture/message/2416</span></a></p></li><li=
 dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-family:Arial=
,sans-serif;color:rgb(0,0,0);background-color:transparent;font-variant:norm=
al;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-he=
ight:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span sty=
le=3D"font-size:11pt;background-color:transparent;font-variant:normal;verti=
cal-align:baseline;white-space:pre-wrap">We continue to try and keep up to =
date with upstream releases through the AUH, big thanks to those sending ve=
rsion updates and fixing version update issues.</span></p></li><li dir=3D"l=
tr" style=3D"list-style-type:disc;font-size:11pt;font-family:Arial,sans-ser=
if;color:rgb(0,0,0);background-color:transparent;font-variant:normal;vertic=
al-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38=
;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"fon=
t-size:11pt;background-color:transparent;font-variant:normal;vertical-align=
:baseline;white-space:pre-wrap">There are two AB-INT issues which are in a =
position where others could now help, as detailed in </span><a href=3D"http=
s://lists.openembedded.org/g/openembedded-core/message/242105" style=3D"tex=
t-decoration:none"><span style=3D"font-size:11pt;background-color:transpare=
nt;font-variant:normal;text-decoration:underline;vertical-align:baseline;wh=
ite-space:pre-wrap">https://lists.openembedded.org/g/openembedded-core/mess=
age/242105</span></a><span style=3D"font-size:11pt;background-color:transpa=
rent;font-variant:normal;vertical-align:baseline;white-space:pre-wrap">:</s=
pan></p></li><ul style=3D"margin-top:0px;margin-bottom:0px"><li dir=3D"ltr"=
 style=3D"list-style-type:circle;font-size:11pt;font-family:Arial,sans-seri=
f;color:rgb(0,0,0);background-color:transparent;font-variant:normal;vertica=
l-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;=
margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"font=
-size:11pt;background-color:transparent;font-variant:normal;vertical-align:=
baseline;white-space:pre-wrap">Matchbox-wm segfault/xserver restart</span><=
/p></li><li dir=3D"ltr" style=3D"list-style-type:circle;font-size:11pt;font=
-family:Arial,sans-serif;color:rgb(0,0,0);background-color:transparent;font=
-variant:normal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" sty=
le=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentati=
on"><span style=3D"font-size:11pt;background-color:transparent;font-variant=
:normal;vertical-align:baseline;white-space:pre-wrap">aarch64/x86-64 build =
host contamination/reproducibility issue</span></p></li></ul></ul><p dir=3D=
"ltr" style=3D"line-height:1.38;margin-left:36pt;margin-top:0pt;margin-bott=
om:0pt"><span style=3D"font-size:11pt;font-family:Arial,sans-serif;color:rg=
b(0,0,0);background-color:transparent;font-variant:normal;vertical-align:ba=
seline;white-space:pre-wrap">We get a lot of comments about these being har=
d to reproduce or work on, in both cases, these have specific well defined =
things which need to be done and a basic understanding of what the issue re=
lates to, if not the actual fix.</span></p><ul style=3D"margin-top:0px;marg=
in-bottom:0px"><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt=
;font-family:Arial,sans-serif;color:rgb(0,0,0);background-color:transparent=
;font-variant:normal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr=
" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"prese=
ntation"><span style=3D"font-size:11pt;background-color:transparent;font-va=
riant:normal;vertical-align:baseline;white-space:pre-wrap">Remaining interm=
ittent build failures of concern:</span></p></li><ul style=3D"margin-top:0p=
x;margin-bottom:0px"><li dir=3D"ltr" style=3D"list-style-type:circle;font-s=
ize:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-color:tra=
nsparent;font-variant:normal;vertical-align:baseline;white-space:pre"><p di=
r=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=
=3D"presentation"><span style=3D"font-size:11pt;background-color:transparen=
t;font-variant:normal;vertical-align:baseline;white-space:pre-wrap">other q=
emu =E2=80=98hang=E2=80=99 type issues on ARM</span></p></li><li dir=3D"ltr=
" style=3D"list-style-type:circle;font-size:11pt;font-family:Arial,sans-ser=
if;color:rgb(0,0,0);background-color:transparent;font-variant:normal;vertic=
al-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38=
;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"fon=
t-size:11pt;background-color:transparent;font-variant:normal;vertical-align=
:baseline;white-space:pre-wrap">sometimes yocto-check-layer is showing chec=
ksum mismatch issues</span></p></li><li dir=3D"ltr" style=3D"list-style-typ=
e:circle;font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);backg=
round-color:transparent;font-variant:normal;vertical-align:baseline;white-s=
pace:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bo=
ttom:0pt" role=3D"presentation"><span style=3D"font-size:11pt;background-co=
lor:transparent;font-variant:normal;vertical-align:baseline;white-space:pre=
-wrap">intermittent ptest failures in many recipes</span></p></li></ul></ul=
><br><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:=
0pt"><span style=3D"font-size:11pt;font-family:Arial,sans-serif;color:rgb(0=
,0,0);background-color:transparent;font-variant:normal;vertical-align:basel=
ine;white-space:pre-wrap">Want to contribute? We would appreciate help with=
 the following areas:</span></p><ul style=3D"margin-top:0px;margin-bottom:0=
px"><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-famil=
y:Arial,sans-serif;color:rgb(0,0,0);background-color:transparent;font-varia=
nt:normal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"=
line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><s=
pan style=3D"font-size:11pt;background-color:transparent;font-variant:norma=
l;vertical-align:baseline;white-space:pre-wrap">We have several open issues=
 for pseudo and limited maintainer time to work on them. Help from someone =
familiar with systems programming in C would be greatly appreciated. </span=
><a href=3D"https://bugzilla.yoctoproject.org/buglist.cgi?list_id=3D661406&=
amp;priority=3DHigh&amp;priority=3DMedium%2B&amp;product=3DPseudo&amp;query=
_format=3Dadvanced&amp;resolution=3D---" style=3D"text-decoration:none"><sp=
an style=3D"font-size:11pt;background-color:transparent;font-variant:normal=
;text-decoration:underline;vertical-align:baseline;white-space:pre-wrap">ht=
tps://bugzilla.yoctoproject.org/buglist.cgi?list_id=3D661406&amp;priority=
=3DHigh&amp;priority=3DMedium%2B&amp;product=3DPseudo&amp;query_format=3Dad=
vanced&amp;resolution=3D---</span></a></p></li><li dir=3D"ltr" style=3D"lis=
t-style-type:disc;font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0=
,0);background-color:transparent;font-variant:normal;vertical-align:baselin=
e;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;=
margin-bottom:0pt" role=3D"presentation"><span style=3D"font-size:11pt;back=
ground-color:transparent;font-variant:normal;vertical-align:baseline;white-=
space:pre-wrap">There are a large number of intermittent failures on our au=
tobuilder, any help with investigating, reproducing or solving these issues=
 would be welcome! </span><a href=3D"https://valkyrie.yocto.io/pub/non-rele=
ase/abint/" style=3D"text-decoration:none"><span style=3D"font-size:11pt;ba=
ckground-color:transparent;font-variant:normal;text-decoration:underline;ve=
rtical-align:baseline;white-space:pre-wrap">https://valkyrie.yocto.io/pub/n=
on-release/abint/</span></a></p></li><li dir=3D"ltr" style=3D"list-style-ty=
pe:disc;font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);backgr=
ound-color:transparent;font-variant:normal;vertical-align:baseline;white-sp=
ace:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bot=
tom:0pt" role=3D"presentation"><span style=3D"font-size:11pt;background-col=
or:transparent;font-variant:normal;vertical-align:baseline;white-space:pre-=
wrap">Many recipes in openembedded-core would benefit from a new recipe mai=
ntainer. Please look at </span><a href=3D"https://git.openembedded.org/open=
embedded-core/tree/meta/conf/distro/include/maintainers.inc" style=3D"text-=
decoration:none"><span style=3D"font-size:11pt;background-color:transparent=
;font-variant:normal;text-decoration:underline;vertical-align:baseline;whit=
e-space:pre-wrap">https://git.openembedded.org/openembedded-core/tree/meta/=
conf/distro/include/maintainers.inc</span></a><span style=3D"font-size:11pt=
;background-color:transparent;font-variant:normal;vertical-align:baseline;w=
hite-space:pre-wrap"> and see if you can adopt any of the unassigned recipe=
s.</span></p></li><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:1=
1pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-color:transpar=
ent;font-variant:normal;vertical-align:baseline;white-space:pre"><p dir=3D"=
ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"pr=
esentation"><span style=3D"font-size:11pt;background-color:transparent;font=
-variant:normal;vertical-align:baseline;white-space:pre-wrap">For more ways=
 to contribute, see </span><a href=3D"https://docs.google.com/document/d/18=
oxKWxLorfF813h82mK6yKTIHeBp_-9owFuCWbzgjOk/edit?usp=3Dsharing" style=3D"tex=
t-decoration:none"><span style=3D"font-size:11pt;background-color:transpare=
nt;font-variant:normal;text-decoration:underline;vertical-align:baseline;wh=
ite-space:pre-wrap">https://docs.google.com/document/d/18oxKWxLorfF813h82mK=
6yKTIHeBp_-9owFuCWbzgjOk/edit?usp=3Dsharing</span></a></p></li></ul><br><p =
dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><sp=
an style=3D"font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);ba=
ckground-color:transparent;font-variant:normal;vertical-align:baseline;whit=
e-space:pre-wrap">New to the project?</span></p><ul style=3D"margin-top:0px=
;margin-bottom:0px"><li dir=3D"ltr" style=3D"list-style-type:disc;font-size=
:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-color:transp=
arent;font-variant:normal;vertical-align:baseline;white-space:pre"><p dir=
=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=
=3D"presentation"><span style=3D"font-size:11pt;background-color:transparen=
t;font-variant:normal;vertical-align:baseline;white-space:pre-wrap">We have=
 a list of issues we think are good places to start contributing: </span><a=
 href=3D"https://bugzilla.yoctoproject.org/buglist.cgi?quicksearch=3DNEWCOM=
ER" style=3D"text-decoration:none"><span style=3D"font-size:11pt;background=
-color:transparent;font-variant:normal;text-decoration:underline;vertical-a=
lign:baseline;white-space:pre-wrap">https://bugzilla.yoctoproject.org/bugli=
st.cgi?quicksearch=3DNEWCOMER</span></a></p></li></ul><br><p dir=3D"ltr" st=
yle=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"fo=
nt-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-color=
:transparent;font-variant:normal;vertical-align:baseline;white-space:pre-wr=
ap">Tracking Metrics:</span></p><ul style=3D"margin-top:0px;margin-bottom:0=
px"><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-famil=
y:Arial,sans-serif;color:rgb(0,0,0);background-color:transparent;font-varia=
nt:normal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"=
line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><s=
pan style=3D"font-size:11pt;background-color:transparent;font-variant:norma=
l;vertical-align:baseline;white-space:pre-wrap">WDD 2704 (last week 2694) <=
/span><span style=3D"font-size:11pt;font-family:Consolas,sans-serif;backgro=
und-color:transparent;font-variant:normal;vertical-align:baseline;white-spa=
ce:pre-wrap">(</span><a href=3D"https://wiki.yoctoproject.org/charts/combo.=
html" style=3D"text-decoration:none"><span style=3D"font-size:11pt;backgrou=
nd-color:transparent;font-variant:normal;text-decoration:underline;vertical=
-align:baseline;white-space:pre-wrap">https://wiki.yoctoproject.org/charts/=
combo.html</span></a><span style=3D"font-size:11pt;font-family:Consolas,san=
s-serif;background-color:transparent;font-variant:normal;vertical-align:bas=
eline;white-space:pre-wrap">)</span></p></li><li dir=3D"ltr" style=3D"list-=
style-type:disc;font-size:11pt;font-family:Consolas,sans-serif;color:rgb(0,=
0,0);background-color:transparent;font-variant:normal;vertical-align:baseli=
ne;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt=
;margin-bottom:0pt" role=3D"presentation"><span style=3D"font-size:11pt;fon=
t-family:Arial,sans-serif;background-color:transparent;font-variant:normal;=
vertical-align:baseline;white-space:pre-wrap">OE-Core/Poky Patch Metrics</s=
pan></p></li><ul style=3D"margin-top:0px;margin-bottom:0px"><li dir=3D"ltr"=
 style=3D"list-style-type:circle;font-size:11pt;font-family:Arial,sans-seri=
f;color:rgb(0,0,0);background-color:transparent;font-variant:normal;vertica=
l-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;=
margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"font=
-size:11pt;background-color:transparent;font-variant:normal;vertical-align:=
baseline;white-space:pre-wrap">Total patches found: 1030 (last week 1028)</=
span></p></li><li dir=3D"ltr" style=3D"list-style-type:circle;font-size:11p=
t;font-family:Arial,sans-serif;color:rgb(0,0,0);background-color:transparen=
t;font-variant:normal;vertical-align:baseline;white-space:pre"><p dir=3D"lt=
r" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"pres=
entation"><span style=3D"font-size:11pt;background-color:transparent;font-v=
ariant:normal;vertical-align:baseline;white-space:pre-wrap">Patches in the =
Pending State: 139 (14%) [last week 139 (14%)]</span></p></li><li dir=3D"lt=
r" style=3D"list-style-type:circle;font-size:11pt;font-family:Consolas,sans=
-serif;color:rgb(0,0,0);background-color:transparent;font-variant:normal;ve=
rtical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:=
1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><a href=3D"htt=
ps://valkyrie.yocto.io/pub/non-release/patchmetrics/" style=3D"text-decorat=
ion:none"><span style=3D"font-size:11pt;font-family:Arial,sans-serif;backgr=
ound-color:transparent;font-variant:normal;text-decoration:underline;vertic=
al-align:baseline;white-space:pre-wrap">https://valkyrie.yocto.io/pub/non-r=
elease/patchmetrics/</span></a></p></li></ul></ul><br><p dir=3D"ltr" style=
=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-=
size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-color:tr=
ansparent;font-variant:normal;vertical-align:baseline;white-space:pre-wrap"=
>Upcoming development releases:</span></p><ul style=3D"margin-top:0px;margi=
n-bottom:0px"><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;=
font-family:Arial,sans-serif;color:rgb(0,0,0);background-color:transparent;=
font-variant:normal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr"=
 style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presen=
tation"><span style=3D"font-size:11pt;background-color:transparent;font-var=
iant:normal;vertical-align:baseline;white-space:pre-wrap">6.1 M3:</span></p=
></li><ul style=3D"margin-top:0px;margin-bottom:0px"><li dir=3D"ltr" style=
=3D"list-style-type:circle;font-size:11pt;font-family:Arial,sans-serif;colo=
r:rgb(0,0,0);background-color:transparent;font-variant:normal;vertical-alig=
n:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin=
-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"font-size:=
11pt;background-color:transparent;font-variant:normal;vertical-align:baseli=
ne;white-space:pre-wrap">Build Date: w/c 2026-08-31</span></p></li><li dir=
=3D"ltr" style=3D"list-style-type:circle;font-size:11pt;font-family:Arial,s=
ans-serif;color:rgb(0,0,0);background-color:transparent;font-variant:normal=
;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-heig=
ht:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=
=3D"font-size:11pt;background-color:transparent;font-variant:normal;vertica=
l-align:baseline;white-space:pre-wrap">Release Date: w/c 2026-09-14</span><=
/p></li></ul><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;f=
ont-family:Arial,sans-serif;color:rgb(0,0,0);background-color:transparent;f=
ont-variant:normal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" =
style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"present=
ation"><span style=3D"font-size:11pt;background-color:transparent;font-vari=
ant:normal;vertical-align:baseline;white-space:pre-wrap">6.1.0:</span></p><=
/li><ul style=3D"margin-top:0px;margin-bottom:0px"><li dir=3D"ltr" style=3D=
"list-style-type:circle;font-size:11pt;font-family:Arial,sans-serif;color:r=
gb(0,0,0);background-color:transparent;font-variant:normal;vertical-align:b=
aseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-to=
p:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"font-size:11p=
t;background-color:transparent;font-variant:normal;vertical-align:baseline;=
white-space:pre-wrap">Build Date (M4): w/c 2026-10-12</span></p></li><li di=
r=3D"ltr" style=3D"list-style-type:circle;font-size:11pt;font-family:Arial,=
sans-serif;color:rgb(0,0,0);background-color:transparent;font-variant:norma=
l;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-hei=
ght:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span styl=
e=3D"font-size:11pt;background-color:transparent;font-variant:normal;vertic=
al-align:baseline;white-space:pre-wrap">Release Date: w/c 2026-11-02</span>=
</p></li></ul></ul><br><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:=
0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-family:Arial,sans=
-serif;color:rgb(0,0,0);background-color:transparent;font-variant:normal;ve=
rtical-align:baseline;white-space:pre-wrap">Upcoming dot releases:</span></=
p><ul style=3D"margin-top:0px;margin-bottom:0px"><li dir=3D"ltr" style=3D"l=
ist-style-type:disc;font-size:11pt;font-family:Arial,sans-serif;background-=
color:transparent;font-variant:normal;vertical-align:baseline;white-space:p=
re"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0=
pt" role=3D"presentation"><span style=3D"font-size:11pt;font-variant:normal=
;vertical-align:baseline;white-space:pre-wrap">YP 6.0.3</span></p></li><ul =
style=3D"margin-top:0px;margin-bottom:0px"><li dir=3D"ltr" style=3D"list-st=
yle-type:circle;font-size:11pt;font-family:Arial,sans-serif;background-colo=
r:transparent;font-variant:normal;vertical-align:baseline;white-space:pre">=
<p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" =
role=3D"presentation"><span style=3D"font-size:11pt;font-variant:normal;ver=
tical-align:baseline;white-space:pre-wrap">Build Date w/c 2026-08-10</span>=
</p></li><li dir=3D"ltr" style=3D"list-style-type:circle;font-size:11pt;fon=
t-family:Arial,sans-serif;background-color:transparent;font-variant:normal;=
vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-heigh=
t:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=
=3D"font-size:11pt;font-variant:normal;vertical-align:baseline;white-space:=
pre-wrap">Release Date w/c 2026-08-24</span></p></li></ul><li dir=3D"ltr" s=
tyle=3D"list-style-type:disc;font-size:11pt;font-family:Arial,sans-serif;ba=
ckground-color:transparent;font-variant:normal;vertical-align:baseline;whit=
e-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin=
-bottom:0pt" role=3D"presentation"><span style=3D"font-size:11pt;font-varia=
nt:normal;vertical-align:baseline;white-space:pre-wrap">YP 5.0.20</span></p=
></li><ul style=3D"margin-top:0px;margin-bottom:0px"><li dir=3D"ltr" style=
=3D"list-style-type:circle;font-size:11pt;font-family:Arial,sans-serif;back=
ground-color:transparent;font-variant:normal;vertical-align:baseline;white-=
space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-b=
ottom:0pt" role=3D"presentation"><span style=3D"font-size:11pt;font-variant=
:normal;vertical-align:baseline;white-space:pre-wrap">Build Date w/c 2026-0=
8-17</span></p></li><li dir=3D"ltr" style=3D"list-style-type:circle;font-si=
ze:11pt;font-family:Arial,sans-serif;background-color:transparent;font-vari=
ant:normal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D=
"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><=
span style=3D"font-size:11pt;font-variant:normal;vertical-align:baseline;wh=
ite-space:pre-wrap">Release Date w/c 2026-08-31</span></p></li></ul><li dir=
=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-family:Arial,san=
s-serif;background-color:transparent;font-variant:normal;vertical-align:bas=
eline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:=
0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"font-size:11pt;=
font-variant:normal;vertical-align:baseline;white-space:pre-wrap">YP 6.0.4<=
/span></p></li><ul style=3D"margin-top:0px;margin-bottom:0px"><li dir=3D"lt=
r" style=3D"list-style-type:circle;font-size:11pt;font-family:Arial,sans-se=
rif;background-color:transparent;font-variant:normal;vertical-align:baselin=
e;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;=
margin-bottom:0pt" role=3D"presentation"><span style=3D"font-size:11pt;font=
-variant:normal;vertical-align:baseline;white-space:pre-wrap">Build Date w/=
c 2026-09-28</span></p></li><li dir=3D"ltr" style=3D"list-style-type:circle=
;font-size:11pt;font-family:Arial,sans-serif;background-color:transparent;f=
ont-variant:normal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" =
style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"present=
ation"><span style=3D"font-size:11pt;font-variant:normal;vertical-align:bas=
eline;white-space:pre-wrap">Release Date w/c 2026-10-12</span></p></li></ul=
><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-family:A=
rial,sans-serif;background-color:transparent;font-variant:normal;vertical-a=
lign:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;mar=
gin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"font-si=
ze:11pt;font-variant:normal;vertical-align:baseline;white-space:pre-wrap">Y=
P 5.0.21</span></p></li><ul style=3D"margin-top:0px;margin-bottom:0px"><li =
dir=3D"ltr" style=3D"list-style-type:circle;font-size:11pt;font-family:Aria=
l,sans-serif;background-color:transparent;font-variant:normal;vertical-alig=
n:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin=
-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"font-size:=
11pt;font-variant:normal;vertical-align:baseline;white-space:pre-wrap">Buil=
d Date w/c 2026-10-05</span></p></li><li dir=3D"ltr" style=3D"list-style-ty=
pe:circle;font-size:11pt;font-family:Arial,sans-serif;background-color:tran=
sparent;font-variant:normal;vertical-align:baseline;white-space:pre"><p dir=
=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=
=3D"presentation"><span style=3D"font-size:11pt;font-variant:normal;vertica=
l-align:baseline;white-space:pre-wrap">Release Date w/c 2026-10-19</span></=
p></li></ul><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;fo=
nt-family:Arial,sans-serif;color:rgb(0,0,0);background-color:transparent;fo=
nt-variant:normal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" s=
tyle=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presenta=
tion"><span style=3D"font-size:11pt;background-color:transparent;font-varia=
nt:normal;vertical-align:baseline;white-space:pre-wrap">For future release =
dates, see </span><a href=3D"https://wiki.yoctoproject.org/wiki/Release_cal=
endar" style=3D"text-decoration:none"><span style=3D"font-size:11pt;backgro=
und-color:transparent;font-variant:normal;text-decoration:underline;vertica=
l-align:baseline;white-space:pre-wrap">https://wiki.yoctoproject.org/wiki/R=
elease_calendar</span></a></p></li></ul><br><p dir=3D"ltr" style=3D"line-he=
ight:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;f=
ont-family:Arial,sans-serif;color:rgb(0,0,0);background-color:transparent;f=
ont-variant:normal;vertical-align:baseline;white-space:pre-wrap">The Yocto =
Project=E2=80=99s technical governance is through its Technical Steering Co=
mmittee, more information is available at:</span></p><p dir=3D"ltr" style=
=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><a href=3D"https://w=
iki.yoctoproject.org/wiki/TSC" style=3D"text-decoration:none"><span style=
=3D"font-size:11pt;font-family:Arial,sans-serif;background-color:transparen=
t;font-variant:normal;text-decoration:underline;vertical-align:baseline;whi=
te-space:pre-wrap">https://wiki.yoctoproject.org/wiki/TSC</span></a></p><br=
><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"=
><span style=3D"font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0=
);background-color:transparent;font-variant:normal;vertical-align:baseline;=
white-space:pre-wrap">The Status reports are stored on the wiki at: </span>=
<a href=3D"https://wiki.yoctoproject.org/wiki/Weekly_Status" style=3D"text-=
decoration:none"><span style=3D"font-size:11pt;font-family:Arial,sans-serif=
;background-color:transparent;font-variant:normal;text-decoration:underline=
;vertical-align:baseline;white-space:pre-wrap">https://wiki.yoctoproject.or=
g/wiki/Weekly_Status</span></a></p><br><p dir=3D"ltr" style=3D"line-height:=
1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-f=
amily:Arial,sans-serif;color:rgb(0,0,0);background-color:transparent;font-v=
ariant:normal;vertical-align:baseline;white-space:pre-wrap">[If anyone has =
suggestions for other information you=E2=80=99d like to see on this weekly =
status update, let us know!]</span></p></span><br class=3D"gmail-Apple-inte=
rchange-newline"></div><div dir=3D"ltr" class=3D"gmail_signature" data-smar=
tmail=3D"gmail_signature"><div dir=3D"ltr"><div dir=3D"ltr"><p class=3D"Mso=
Normal" style=3D"background-image:initial;background-position:initial;backg=
round-repeat:initial"><span style=3D"font-size:12pt;font-family:Arial,sans-=
serif">Thanks,<span></span></span></p>

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

--000000000000d9bf9c065953625d--

