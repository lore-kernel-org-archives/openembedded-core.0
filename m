Return-Path: <sjolley.yp.pm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4974BC982FA
	for <webhook@archiver.kernel.org>; Tue, 22 Sep 2026 14:48:30 +0000 (UTC)
Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12064.1790088500481265266
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Sep 2026 07:48:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=KA0Ga8Wa;
 spf=pass (domain: gmail.com, ip: 74.125.227.141, mailfrom: sjolley.yp.pm@gmail.com)
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-396ccd5cf02so3203017a91.3
        for <openembedded-core@lists.openembedded.org>; Tue, 22 Sep 2026 07:48:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790088500; cv=none;
        d=google.com; s=arc-20260327;
        b=BFCfmU4hgB+xy/FjANLPV5ZC6t6cgCpMETdiRt663G4jqBJS0zvYWJQtCXtUJNLMNU
         vtUurB9Sliq9spzCCKyCfzc4SpeGyDgb8gZAC7CehYtE09wUOQ7vusotk1+VAOPA0b7N
         /FgCIFtZWZMkeQJZWP8RU4OxY7JH1PmUc6tcmbjV1Ur2mM+Zr2EyQZ+WPX+uNnfhMqtC
         WMJXuDPoyWz/l5mpfBB9ETPLdffPvbDAfYN25xaroCFGpK+617LJI2e3qgp46fMDa9Bz
         rwaqrMjh+qLvMjIJvuiRthDTOj8I35i6XhH+WBOdjjTvPV+VHaYdrzVgdCb7qiSOaT9F
         3tew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=WcFLvtMiUdnEFYRZz32Z3136VGJx9ZBc3+yvEW5RE+A=;
        fh=IvqHNL0keSimkVIf2JDMia/VaNchYVv9Idl9GwBr98w=;
        b=i0TIEqhQSTgvTC+lhhSeCa890hSbXQ2KQHoSu1DYpJZSQ7cy0NlA1+Edy2CL+5Z+5s
         /UDnuVnzUklP6+R7OhHD5Nq/nyfsz2Roir24eNO3aHF/FPbGBidc4n/sVSdOOyt5apBC
         g42WUsBKnlilsGkDfkUPzcrkTQKZR8vMhNFUjSoMZM+JwlwURgnKdsHFMnxbrkQyFYLX
         vysuMToOTudjsCVsz0V/sZSpwqmrwCh7utdbTttGZgfwZyqDebCVMA95CSjkJTpbydlN
         lFcL/F1LaPwlMT0zi/Gvb+Mc2eiGTqMerj1rZogD0R5+zXnUWTReJEXGOor5enDW3dcC
         tX9Q==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790088500; x=1790693300; darn=lists.openembedded.org;
        h=content-type:to:subject:message-id:date:from:mime-version:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=WcFLvtMiUdnEFYRZz32Z3136VGJx9ZBc3+yvEW5RE+A=;
        b=KA0Ga8Wa4aShNriHIY6WsvKz7Drd3i95zEdIoMvIM/zE9hNoAk1zQCnFWTSgsVzx0y
         zVPF9tfq3ron7BOjq5Gs5TX7t6NjpgGIWrTNa90PDhBF6d1bwtFtoEFrFNWtU0qDiKbL
         5I+iqSZS/WalZU6yv4WuLBjEygiFNkRf959CboQTP0kWmWrRjtB+7dcCAg+fFHkNAfXk
         PWxHGOB1hKfl7r+wleM536hmqRjZncQ99ozsunOfdEFYusi4qVg2yE7m8exbjA0WjtA9
         hFho9gH3ycbvwp+rxw0yoxinG3CP9ebKr7ZnYLcl7I7oUNVZuS5IYi1J9aUshRQpWp34
         wR1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790088500; x=1790693300;
        h=content-type:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WcFLvtMiUdnEFYRZz32Z3136VGJx9ZBc3+yvEW5RE+A=;
        b=NWsYA8NNJ+BAIyrqpUt/mMSnC67lvAin0TiSIQYTri1UY1NQtkJKy0VKkK6eFwy5D6
         fjHm+pDt3nKed5+TA1SUpvvAdqPcFdR7wJbeDm4bQbmcHxfWn4g43P/hZRPzGh74jeiB
         f9X3jYF4TOoNKndHb/H0cDXWRmmOzFQP1ngzUESID/XdcGZXz13BbE/j6fP4fRuKcTy0
         UM0GKZUr3Znmi13roREq5IqftzeyoDCr5ubqGgYabjmoXiKFJpsNklALS3AAWqfhjAlm
         2OU6FgqhL7Lrh9vleplA4w7QCnkfQRRzcgxAOzVQ8Orgc33Eg2zEGpx/DJqBejWJXP6y
         Qu9A==
X-Forwarded-Encrypted: i=1; AKwUvBxF1uhvFVcmrvBuooRb3OD4ChUCJUpuo9Xl/cGZePyz7Y0lh99Vq2V6WvWoqq7zz3HMCzRtKbawddzYeuPJU731dA==@lists.openembedded.org
X-Gm-Message-State: AFuF++lra3OvK2CK+XvR4xcBXCD5dqQUTrydXC0jeIzYY4QfUBO4uun9
	GxOwMWvimIMxldIqprpzoifcJjyjA0423Xm/hFUTgdJI/osYtoiS4zjz46GLmdnX88in6zDAP4/
	z3LqiqUPKDncsMTm9EdOMjdLaQ1kvSpk=
X-Gm-Gg: AYBFou2WK9Qv1aukKIRHv9I32ByRRAPmt9TutIwZL5JbIB5YJCnpOHC996v/oGRNQyt
	q914B6X//iDrTs3JShe6/RbQoNWLVVYZLrUp+5At6xOg5IuucMNEQ42TV17XY0aJXW3patnB6Bt
	Tkv0G6M/ohY3pdK+0ig66n1GpIdvWrUiBTdmcpGO0TWDwOels9jwljRuBsR7d18SJ7svEqm/ts+
	vYT8Ec0NeJ0amWBB7xd3KDLc4RF61L/zk6WToZ4QUdh40naAckvGdKso9Er5tNmWgvGpMqgO+pD
	YJ9hXVS4S5Nfgb73CoC3kZIVY3FVUKmcAGBikDY5l2U07CZt4s7TDdrxpakCqD3VBq+7/uS4C43
	TtwN4WWQ21H1VDpBOZe6Zl6e06vCWtLk6NRXQ9NvkXMEHe427RUwjj/p5G1nTNBR0USQ8+g/6h5
	kTfI3kUmvOXGWoDUkBR5m4yxv3bX1wtZBSuTIOe4uY21f/f+L4yjMbqUmLfWxYoLWEnIp5Nh/eY
	bJ0ESWh9CjE7VlRR3DzwBV7BNmYx0UEJz8UFXM=
X-Received: by 2002:a17:90a:e7cc:b0:3a0:2900:f57e with SMTP id
 98e67ed59e1d1-3a07320034amr1593060a91.40.1790088499348; Tue, 22 Sep 2026
 07:48:19 -0700 (PDT)
MIME-Version: 1.0
From: Stephen K Jolley <sjolley.yp.pm@gmail.com>
Date: Tue, 22 Sep 2026 07:48:07 -0700
X-Gm-Features: AclHuK8WHB-ejTJG0hKvaDzUXUimX2yJ4kOx9qwuYF_1R7dURN4xYj6Lh5N2Zzs
Message-ID: <CAK5yBb8YFZsxhBOY2s+Nrs2-gS=5n7qoa-XHgVud5RC6z3M04w@mail.gmail.com>
Subject: Yocto Project Status 22 September 2026 (WW39)
To: Yocto-mailing-list <yocto@lists.yoctoproject.org>, 
	",openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	yocto-status@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="0000000000001ec9a1065c137530"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Sep 2026 14:48:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246421

--0000000000001ec9a1065c137530
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Current Dev Position: YP 6.1 M4 - Stabilisation (Bug Fixing)

Next Deadline: YP 6.1 M4: w/c 2026-10-12

Next Team Meetings:

   -

   Bug Triage meeting - Thursday 24th Sept. 7:30am PDT (
   https://zoom.us/j/454367603?pwd=3DZGxoa2ZXL3FkM3Y0bFd5aVpHVVZ6dz09)
   -

   Weekly Project Engineering Sync  - Tuesday 22nd Sept. 8am PDT (
   https://zoom.us/j/990892712?pwd=3DcHU1MjhoM2x6ck81bkcrYjRrcmJsUT09)
   <https://zoom.us/j/990892712>
   -

   Yocto Project Patch Review - Thursday 24th Sept. 10am GMT and Monday
   28th Sept. 9am PDT (
   https://zoom.us/j/97762397148?pwd=3D1xk0iC9hp9SjEonaTaONwTb6iWry4Eb.1)


Project data dashboard: https://dashboard.yoctoproject.org/

Key Status/Updates:

   -

   YP 5.0.20 was released
   -

   YP 6.1 M3 is due for release
   -

   Our plan is to build M4 within the next week unless significant problems
   become known as we=E2=80=99re not aware of anyone working on any major f=
ixes which
   would delay it.
   -

   If there are release blocking issues, please report ASAP.
   -

   We have made progress on the build architecture reproducibility issues,
   thanks in particular to Alejandro and Sunil and team at Windriver for
   getting the major rust issues resolved. There are around 30 issues left =
as
   shown by the autobuilder tests (down from ~90) so great progress.
   -

   python3-six recipe moved to meta-oe, it provides python 2.x era support
   so nothing should be needing that now - references are a sign that
   dependencies probably need updating but it is still available if needed.
   -

   There are issues which are in a position where others could now help:
   -

      Matchbox-wm segfault/xserver restart
      -

      aarch64/x86-64 build host contamination/reproducibility issue -
      thanks for the work and fixes so far on this.
      -

      See Richard=E2=80=99s email on the list
      https://lists.openembedded.org/g/openembedded-core/topic/areas_we_cou=
ld_do_with/121159956
      which details some others too

We get a lot of comments about these being hard to reproduce or work on, in
both cases, these have specific well defined things which need to be done
and a basic understanding of what the issue relates to, if not the actual
fix.

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

   WDD 2640 (last week 2647) (
   https://wiki.yoctoproject.org/charts/combo.html)
   -

   OE-Core/Poky Patch Metrics
   -

      Total patches found: 1055 (last week 1054)
      -

      Patches in the Pending State: 137 (13%) [last week 135 (13%)]
      -

      https://valkyrie.yocto.io/pub/non-release/patchmetrics/


Upcoming development releases

   -

   6.1 M3: is due for release
   -

   6.1.0:
   -

      Build Date (M4): w/c 2026-10-12
      -

      Release Date: w/c 2026-11-02


Upcoming dot releases:

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

--0000000000001ec9a1065c137530
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><span id=3D"gmail-docs-internal-guid-6c3e4a29-7fff-66=
59-079a-37d1a0c9f6df"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0=
pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-family:Arial,sans-=
serif;color:rgb(0,0,0);background-color:transparent;font-variant:normal;ver=
tical-align:baseline;white-space:pre-wrap">Current Dev Position: YP 6.1 M4 =
- Stabilisation (Bug Fixing)</span></p><p dir=3D"ltr" style=3D"line-height:=
1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-f=
amily:Arial,sans-serif;color:rgb(0,0,0);background-color:transparent;font-v=
ariant:normal;vertical-align:baseline;white-space:pre-wrap">Next Deadline: =
YP 6.1 M4: w/c 2026-10-12</span></p><br><p dir=3D"ltr" style=3D"line-height=
:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-=
family:Arial,sans-serif;color:rgb(0,0,0);background-color:transparent;font-=
variant:normal;vertical-align:baseline;white-space:pre-wrap">Next Team Meet=
ings:</span></p><ul style=3D"margin-top:0px;margin-bottom:0px"><li dir=3D"l=
tr" style=3D"list-style-type:disc;font-size:9.5pt;font-family:Arial,sans-se=
rif;color:rgb(0,0,0);background-color:transparent;font-variant:normal;verti=
cal-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.3=
8;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"fo=
nt-size:11pt;background-color:transparent;font-variant:normal;vertical-alig=
n:baseline;white-space:pre-wrap">Bug Triage meeting - Thursday 24th Sept. 7=
:30am PDT (</span><a href=3D"https://zoom.us/j/454367603?pwd=3DZGxoa2ZXL3Fk=
M3Y0bFd5aVpHVVZ6dz09" style=3D"text-decoration:none"><span style=3D"font-si=
ze:11pt;background-color:transparent;font-variant:normal;text-decoration:un=
derline;vertical-align:baseline;white-space:pre-wrap">https://zoom.us/j/454=
367603?pwd=3DZGxoa2ZXL3FkM3Y0bFd5aVpHVVZ6dz09</span></a><span style=3D"font=
-size:11pt;background-color:transparent;font-variant:normal;vertical-align:=
baseline;white-space:pre-wrap">)</span></p></li><li dir=3D"ltr" style=3D"li=
st-style-type:disc;font-size:9.5pt;font-family:Arial,sans-serif;color:rgb(0=
,0,0);background-color:transparent;font-variant:normal;vertical-align:basel=
ine;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0p=
t;margin-bottom:0pt" role=3D"presentation"><span style=3D"font-size:11pt;ba=
ckground-color:transparent;font-variant:normal;vertical-align:baseline;whit=
e-space:pre-wrap">Weekly Project Engineering Sync=C2=A0 - Tuesday 22nd Sept=
. 8am PDT (</span><a href=3D"https://zoom.us/j/990892712?pwd=3DcHU1MjhoM2x6=
ck81bkcrYjRrcmJsUT09" style=3D"text-decoration:none"><span style=3D"font-si=
ze:11pt;background-color:transparent;font-variant:normal;text-decoration:un=
derline;vertical-align:baseline;white-space:pre-wrap">https://zoom.us/j/990=
892712?pwd=3DcHU1MjhoM2x6ck81bkcrYjRrcmJsUT09</span></a><a href=3D"https://=
zoom.us/j/990892712" style=3D"text-decoration:none"><span style=3D"font-siz=
e:11pt;background-color:transparent;font-variant:normal;text-decoration:und=
erline;vertical-align:baseline;white-space:pre-wrap">)</span></a></p></li><=
li dir=3D"ltr" style=3D"list-style-type:disc;font-size:9.5pt;font-family:Ar=
ial,sans-serif;color:rgb(0,0,0);background-color:transparent;font-variant:n=
ormal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line=
-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span =
style=3D"font-size:11pt;background-color:transparent;font-variant:normal;ve=
rtical-align:baseline;white-space:pre-wrap">Yocto Project Patch Review - Th=
ursday 24th Sept. 10am GMT and Monday 28th Sept. 9am PDT (</span><a href=3D=
"https://zoom.us/j/97762397148?pwd=3D1xk0iC9hp9SjEonaTaONwTb6iWry4Eb.1" sty=
le=3D"text-decoration:none"><span style=3D"font-size:11pt;background-color:=
transparent;font-variant:normal;text-decoration:underline;vertical-align:ba=
seline;white-space:pre-wrap">https://zoom.us/j/97762397148?pwd=3D1xk0iC9hp9=
SjEonaTaONwTb6iWry4Eb.1</span></a><span style=3D"font-size:11pt;background-=
color:transparent;font-variant:normal;vertical-align:baseline;white-space:p=
re-wrap">)</span></p></li></ul><br><p dir=3D"ltr" style=3D"line-height:1.38=
;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-famil=
y:Arial,sans-serif;color:rgb(0,0,0);background-color:transparent;font-varia=
nt:normal;vertical-align:baseline;white-space:pre-wrap">Project data dashbo=
ard: </span><a href=3D"https://dashboard.yoctoproject.org/" style=3D"text-d=
ecoration:none"><span style=3D"font-size:11pt;font-family:Arial,sans-serif;=
background-color:transparent;font-variant:normal;text-decoration:underline;=
vertical-align:baseline;white-space:pre-wrap">https://dashboard.yoctoprojec=
t.org/</span></a><span style=3D"font-size:11pt;font-family:Arial,sans-serif=
;color:rgb(0,0,0);background-color:transparent;font-variant:normal;vertical=
-align:baseline;white-space:pre-wrap">=C2=A0</span></p><br><p dir=3D"ltr" s=
tyle=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"f=
ont-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-colo=
r:transparent;font-variant:normal;vertical-align:baseline;white-space:pre-w=
rap">Key Status/Updates:</span></p><ul style=3D"margin-top:0px;margin-botto=
m:0px"><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-fa=
mily:Arial,sans-serif;color:rgb(0,0,0);background-color:transparent;font-va=
riant:normal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=
=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation=
"><span style=3D"font-size:11pt;background-color:transparent;font-variant:n=
ormal;vertical-align:baseline;white-space:pre-wrap">YP 5.0.20 was released<=
/span></p></li><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt=
;font-family:Arial,sans-serif;color:rgb(0,0,0);background-color:transparent=
;font-variant:normal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr=
" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"prese=
ntation"><span style=3D"font-size:11pt;background-color:transparent;font-va=
riant:normal;vertical-align:baseline;white-space:pre-wrap">YP 6.1 M3 is due=
 for release</span></p></li><li dir=3D"ltr" style=3D"list-style-type:disc;f=
ont-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-colo=
r:transparent;font-variant:normal;vertical-align:baseline;white-space:pre">=
<p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" =
role=3D"presentation"><span style=3D"font-size:11pt;background-color:transp=
arent;font-variant:normal;vertical-align:baseline;white-space:pre-wrap">Our=
 plan is to build M4 within the next week unless significant problems becom=
e known as we=E2=80=99re not aware of anyone working on any major fixes whi=
ch would delay it.</span></p></li><li dir=3D"ltr" style=3D"list-style-type:=
disc;font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);backgroun=
d-color:transparent;font-variant:normal;vertical-align:baseline;white-space=
:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom=
:0pt" role=3D"presentation"><span style=3D"font-size:11pt;background-color:=
transparent;font-variant:normal;vertical-align:baseline;white-space:pre-wra=
p">If there are release blocking issues, please report ASAP.</span></p></li=
><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-family:A=
rial,sans-serif;color:rgb(0,0,0);background-color:transparent;font-variant:=
normal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"lin=
e-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span=
 style=3D"font-size:11pt;background-color:transparent;font-variant:normal;v=
ertical-align:baseline;white-space:pre-wrap">We have made progress on the b=
uild architecture reproducibility issues, thanks in particular to Alejandro=
 and Sunil and team at Windriver for getting the major rust issues resolved=
. There are around 30 issues left as shown by the autobuilder tests (down f=
rom ~90) so great progress.</span></p></li><li dir=3D"ltr" style=3D"list-st=
yle-type:disc;font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);=
background-color:transparent;font-variant:normal;vertical-align:baseline;wh=
ite-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;marg=
in-bottom:0pt" role=3D"presentation"><span style=3D"font-size:11pt;backgrou=
nd-color:transparent;font-variant:normal;vertical-align:baseline;white-spac=
e:pre-wrap">python3-six recipe moved to meta-oe, it provides python 2.x era=
 support so nothing should be needing that now - references are a sign that=
 dependencies probably need updating but it is still available if needed.</=
span></p></li><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;=
font-family:Arial,sans-serif;color:rgb(0,0,0);background-color:transparent;=
font-variant:normal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr"=
 style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presen=
tation"><span style=3D"font-size:11pt;background-color:transparent;font-var=
iant:normal;vertical-align:baseline;white-space:pre-wrap">There are issues =
which are in a position where others could now help:</span></p></li><ul sty=
le=3D"margin-top:0px;margin-bottom:0px"><li dir=3D"ltr" style=3D"list-style=
-type:circle;font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);b=
ackground-color:transparent;font-variant:normal;vertical-align:baseline;whi=
te-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margi=
n-bottom:0pt" role=3D"presentation"><span style=3D"font-size:11pt;backgroun=
d-color:transparent;font-variant:normal;vertical-align:baseline;white-space=
:pre-wrap">Matchbox-wm segfault/xserver restart</span></p></li><li dir=3D"l=
tr" style=3D"list-style-type:circle;font-size:11pt;font-family:Arial,sans-s=
erif;color:rgb(0,0,0);background-color:transparent;font-variant:normal;vert=
ical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.=
38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"f=
ont-size:11pt;background-color:transparent;font-variant:normal;vertical-ali=
gn:baseline;white-space:pre-wrap">aarch64/x86-64 build host contamination/r=
eproducibility issue - thanks for the work and fixes so far on this.</span>=
</p></li><li dir=3D"ltr" style=3D"list-style-type:circle;font-size:11pt;fon=
t-family:Arial,sans-serif;color:rgb(0,0,0);background-color:transparent;fon=
t-variant:normal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" st=
yle=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentat=
ion"><span style=3D"font-size:11pt;background-color:transparent;font-varian=
t:normal;vertical-align:baseline;white-space:pre-wrap">See Richard=E2=80=99=
s email on the list </span><a href=3D"https://lists.openembedded.org/g/open=
embedded-core/topic/areas_we_could_do_with/121159956" style=3D"text-decorat=
ion:none"><span style=3D"font-size:11pt;background-color:transparent;font-v=
ariant:normal;text-decoration:underline;vertical-align:baseline;white-space=
:pre-wrap">https://lists.openembedded.org/g/openembedded-core/topic/areas_w=
e_could_do_with/121159956</span></a><span style=3D"font-size:11pt;backgroun=
d-color:transparent;font-variant:normal;vertical-align:baseline;white-space=
:pre-wrap"> which details some others too</span></p></li></ul></ul><p dir=
=3D"ltr" style=3D"line-height:1.38;margin-left:36pt;margin-top:0pt;margin-b=
ottom:0pt"><span style=3D"font-size:11pt;font-family:Arial,sans-serif;color=
:rgb(0,0,0);background-color:transparent;font-variant:normal;vertical-align=
:baseline;white-space:pre-wrap">We get a lot of comments about these being =
hard to reproduce or work on, in both cases, these have specific well defin=
ed things which need to be done and a basic understanding of what the issue=
 relates to, if not the actual fix.</span></p><br><p dir=3D"ltr" style=3D"l=
ine-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:=
11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-color:transpa=
rent;font-variant:normal;vertical-align:baseline;white-space:pre-wrap">Want=
 to contribute? We would appreciate help with the following areas:</span></=
p><ul style=3D"margin-top:0px;margin-bottom:0px"><li dir=3D"ltr" style=3D"l=
ist-style-type:disc;font-size:11pt;font-family:Arial,sans-serif;color:rgb(0=
,0,0);background-color:transparent;font-variant:normal;vertical-align:basel=
ine;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0p=
t;margin-bottom:0pt" role=3D"presentation"><span style=3D"font-size:11pt;ba=
ckground-color:transparent;font-variant:normal;vertical-align:baseline;whit=
e-space:pre-wrap">We have several open issues for pseudo and limited mainta=
iner time to work on them. Help from someone familiar with systems programm=
ing in C would be greatly appreciated. </span><a href=3D"https://bugzilla.y=
octoproject.org/buglist.cgi?list_id=3D661406&amp;priority=3DHigh&amp;priori=
ty=3DMedium%2B&amp;product=3DPseudo&amp;query_format=3Dadvanced&amp;resolut=
ion=3D---" style=3D"text-decoration:none"><span style=3D"font-size:11pt;bac=
kground-color:transparent;font-variant:normal;text-decoration:underline;ver=
tical-align:baseline;white-space:pre-wrap">https://bugzilla.yoctoproject.or=
g/buglist.cgi?list_id=3D661406&amp;priority=3DHigh&amp;priority=3DMedium%2B=
&amp;product=3DPseudo&amp;query_format=3Dadvanced&amp;resolution=3D---</spa=
n></a></p></li><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt=
;font-family:Arial,sans-serif;color:rgb(0,0,0);background-color:transparent=
;font-variant:normal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr=
" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"prese=
ntation"><span style=3D"font-size:11pt;background-color:transparent;font-va=
riant:normal;vertical-align:baseline;white-space:pre-wrap">There are a larg=
e number of intermittent failures on our autobuilder, any help with investi=
gating, reproducing or solving these issues would be welcome! </span><a hre=
f=3D"https://valkyrie.yocto.io/pub/non-release/abint/" style=3D"text-decora=
tion:none"><span style=3D"font-size:11pt;background-color:transparent;font-=
variant:normal;text-decoration:underline;vertical-align:baseline;white-spac=
e:pre-wrap">https://valkyrie.yocto.io/pub/non-release/abint/</span></a></p>=
</li><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-fami=
ly:Arial,sans-serif;color:rgb(0,0,0);background-color:transparent;font-vari=
ant:normal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D=
"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><=
span style=3D"font-size:11pt;background-color:transparent;font-variant:norm=
al;vertical-align:baseline;white-space:pre-wrap">Many recipes in openembedd=
ed-core would benefit from a new recipe maintainer. Please look at </span><=
a href=3D"https://git.openembedded.org/openembedded-core/tree/meta/conf/dis=
tro/include/maintainers.inc" style=3D"text-decoration:none"><span style=3D"=
font-size:11pt;background-color:transparent;font-variant:normal;text-decora=
tion:underline;vertical-align:baseline;white-space:pre-wrap">https://git.op=
enembedded.org/openembedded-core/tree/meta/conf/distro/include/maintainers.=
inc</span></a><span style=3D"font-size:11pt;background-color:transparent;fo=
nt-variant:normal;vertical-align:baseline;white-space:pre-wrap"> and see if=
 you can adopt any of the unassigned recipes.</span></p></li><li dir=3D"ltr=
" style=3D"list-style-type:disc;font-size:11pt;font-family:Arial,sans-serif=
;color:rgb(0,0,0);background-color:transparent;font-variant:normal;vertical=
-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;m=
argin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"font-=
size:11pt;background-color:transparent;font-variant:normal;vertical-align:b=
aseline;white-space:pre-wrap">For more ways to contribute, see </span><a hr=
ef=3D"https://docs.google.com/document/d/18oxKWxLorfF813h82mK6yKTIHeBp_-9ow=
FuCWbzgjOk/edit?usp=3Dsharing" style=3D"text-decoration:none"><span style=
=3D"font-size:11pt;background-color:transparent;font-variant:normal;text-de=
coration:underline;vertical-align:baseline;white-space:pre-wrap">https://do=
cs.google.com/document/d/18oxKWxLorfF813h82mK6yKTIHeBp_-9owFuCWbzgjOk/edit?=
usp=3Dsharing</span></a></p></li></ul><br><p dir=3D"ltr" style=3D"line-heig=
ht:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;fon=
t-family:Arial,sans-serif;color:rgb(0,0,0);background-color:transparent;fon=
t-variant:normal;vertical-align:baseline;white-space:pre-wrap">New to the p=
roject?</span></p><ul style=3D"margin-top:0px;margin-bottom:0px"><li dir=3D=
"ltr" style=3D"list-style-type:disc;font-size:11pt;font-family:Arial,sans-s=
erif;color:rgb(0,0,0);background-color:transparent;font-variant:normal;vert=
ical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.=
38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"f=
ont-size:11pt;background-color:transparent;font-variant:normal;vertical-ali=
gn:baseline;white-space:pre-wrap">We have a list of issues we think are goo=
d places to start contributing: </span><a href=3D"https://bugzilla.yoctopro=
ject.org/buglist.cgi?quicksearch=3DNEWCOMER" style=3D"text-decoration:none"=
><span style=3D"font-size:11pt;background-color:transparent;font-variant:no=
rmal;text-decoration:underline;vertical-align:baseline;white-space:pre-wrap=
">https://bugzilla.yoctoproject.org/buglist.cgi?quicksearch=3DNEWCOMER</spa=
n></a></p></li></ul><br><p dir=3D"ltr" style=3D"line-height:1.38;margin-top=
:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-family:Arial,san=
s-serif;color:rgb(0,0,0);background-color:transparent;font-variant:normal;v=
ertical-align:baseline;white-space:pre-wrap">Tracking Metrics:</span></p><u=
l style=3D"margin-top:0px;margin-bottom:0px"><li dir=3D"ltr" style=3D"list-=
style-type:disc;font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0=
);background-color:transparent;font-variant:normal;vertical-align:baseline;=
white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;ma=
rgin-bottom:0pt" role=3D"presentation"><span style=3D"font-size:11pt;backgr=
ound-color:transparent;font-variant:normal;vertical-align:baseline;white-sp=
ace:pre-wrap">WDD 2640 (last week 2647) </span><span style=3D"font-size:11p=
t;font-family:Consolas,sans-serif;background-color:transparent;font-variant=
:normal;vertical-align:baseline;white-space:pre-wrap">(</span><a href=3D"ht=
tps://wiki.yoctoproject.org/charts/combo.html" style=3D"text-decoration:non=
e"><span style=3D"font-size:11pt;background-color:transparent;font-variant:=
normal;text-decoration:underline;vertical-align:baseline;white-space:pre-wr=
ap">https://wiki.yoctoproject.org/charts/combo.html</span></a><span style=
=3D"font-size:11pt;font-family:Consolas,sans-serif;background-color:transpa=
rent;font-variant:normal;vertical-align:baseline;white-space:pre-wrap">)</s=
pan></p></li><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;f=
ont-family:Consolas,sans-serif;color:rgb(0,0,0);background-color:transparen=
t;font-variant:normal;vertical-align:baseline;white-space:pre"><p dir=3D"lt=
r" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"pres=
entation"><span style=3D"font-size:11pt;font-family:Arial,sans-serif;backgr=
ound-color:transparent;font-variant:normal;vertical-align:baseline;white-sp=
ace:pre-wrap">OE-Core/Poky Patch Metrics</span></p></li><ul style=3D"margin=
-top:0px;margin-bottom:0px"><li dir=3D"ltr" style=3D"list-style-type:circle=
;font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-co=
lor:transparent;font-variant:normal;vertical-align:baseline;white-space:pre=
"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt=
" role=3D"presentation"><span style=3D"font-size:11pt;background-color:tran=
sparent;font-variant:normal;vertical-align:baseline;white-space:pre-wrap">T=
otal patches found: 1055 (last week 1054)</span></p></li><li dir=3D"ltr" st=
yle=3D"list-style-type:circle;font-size:11pt;font-family:Arial,sans-serif;c=
olor:rgb(0,0,0);background-color:transparent;font-variant:normal;vertical-a=
lign:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;mar=
gin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"font-si=
ze:11pt;background-color:transparent;font-variant:normal;vertical-align:bas=
eline;white-space:pre-wrap">Patches in the Pending State: 137 (13%) [last w=
eek 135 (13%)]</span></p></li><li dir=3D"ltr" style=3D"list-style-type:circ=
le;font-size:11pt;font-family:Consolas,sans-serif;color:rgb(0,0,0);backgrou=
nd-color:transparent;font-variant:normal;vertical-align:baseline;white-spac=
e:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-botto=
m:0pt" role=3D"presentation"><a href=3D"https://valkyrie.yocto.io/pub/non-r=
elease/patchmetrics/" style=3D"text-decoration:none"><span style=3D"font-si=
ze:11pt;font-family:Arial,sans-serif;background-color:transparent;font-vari=
ant:normal;text-decoration:underline;vertical-align:baseline;white-space:pr=
e-wrap">https://valkyrie.yocto.io/pub/non-release/patchmetrics/</span></a><=
/p></li></ul></ul><br><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0=
pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-family:Arial,sans-=
serif;color:rgb(0,0,0);background-color:transparent;font-variant:normal;ver=
tical-align:baseline;white-space:pre-wrap">Upcoming development releases</s=
pan></p><ul style=3D"margin-top:0px;margin-bottom:0px"><li dir=3D"ltr" styl=
e=3D"list-style-type:disc;font-size:11pt;font-family:Arial,sans-serif;color=
:rgb(0,0,0);background-color:transparent;font-variant:normal;vertical-align=
:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-=
top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"font-size:1=
1pt;background-color:transparent;font-variant:normal;vertical-align:baselin=
e;white-space:pre-wrap">6.1 M3: is due for release</span></p></li><li dir=
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
seline;white-space:pre-wrap">YP 6.0.4</span></p></li><ul style=3D"margin-to=
p:0px;margin-bottom:0px"><li dir=3D"ltr" style=3D"list-style-type:circle;fo=
nt-size:11pt;font-family:Arial,sans-serif;background-color:transparent;font=
-variant:normal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" sty=
le=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentati=
on"><span style=3D"font-size:11pt;font-variant:normal;vertical-align:baseli=
ne;white-space:pre-wrap">Build Date w/c 2026-09-28</span></p></li><li dir=
=3D"ltr" style=3D"list-style-type:circle;font-size:11pt;font-family:Arial,s=
ans-serif;background-color:transparent;font-variant:normal;vertical-align:b=
aseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-to=
p:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"font-size:11p=
t;font-variant:normal;vertical-align:baseline;white-space:pre-wrap">Release=
 Date w/c 2026-10-12</span></p></li></ul><li dir=3D"ltr" style=3D"list-styl=
e-type:disc;font-size:11pt;font-family:Arial,sans-serif;background-color:tr=
ansparent;font-variant:normal;vertical-align:baseline;white-space:pre"><p d=
ir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=
=3D"presentation"><span style=3D"font-size:11pt;font-variant:normal;vertica=
l-align:baseline;white-space:pre-wrap">YP 5.0.21</span></p></li><ul style=
=3D"margin-top:0px;margin-bottom:0px"><li dir=3D"ltr" style=3D"list-style-t=
ype:circle;font-size:11pt;font-family:Arial,sans-serif;background-color:tra=
nsparent;font-variant:normal;vertical-align:baseline;white-space:pre"><p di=
r=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=
=3D"presentation"><span style=3D"font-size:11pt;font-variant:normal;vertica=
l-align:baseline;white-space:pre-wrap">Build Date w/c 2026-10-05</span></p>=
</li><li dir=3D"ltr" style=3D"list-style-type:circle;font-size:11pt;font-fa=
mily:Arial,sans-serif;background-color:transparent;font-variant:normal;vert=
ical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.=
38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"f=
ont-size:11pt;font-variant:normal;vertical-align:baseline;white-space:pre-w=
rap">Release Date w/c 2026-10-19</span></p></li></ul><li dir=3D"ltr" style=
=3D"list-style-type:disc;font-size:11pt;font-family:Arial,sans-serif;color:=
rgb(0,0,0);background-color:transparent;font-variant:normal;vertical-align:=
baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-t=
op:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"font-size:11=
pt;background-color:transparent;font-variant:normal;vertical-align:baseline=
;white-space:pre-wrap">For future release dates, see </span><a href=3D"http=
s://wiki.yoctoproject.org/wiki/Release_calendar" style=3D"text-decoration:n=
one"><span style=3D"font-size:11pt;background-color:transparent;font-varian=
t:normal;text-decoration:underline;vertical-align:baseline;white-space:pre-=
wrap">https://wiki.yoctoproject.org/wiki/Release_calendar</span></a></p></l=
i></ul><br><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-b=
ottom:0pt"><span style=3D"font-size:11pt;font-family:Arial,sans-serif;color=
:rgb(0,0,0);background-color:transparent;font-variant:normal;vertical-align=
:baseline;white-space:pre-wrap">The Yocto Project=E2=80=99s technical gover=
nance is through its Technical Steering Committee, more information is avai=
lable at:</span></p><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt=
;margin-bottom:0pt"><a href=3D"https://wiki.yoctoproject.org/wiki/TSC" styl=
e=3D"text-decoration:none"><span style=3D"font-size:11pt;font-family:Arial,=
sans-serif;background-color:transparent;font-variant:normal;text-decoration=
:underline;vertical-align:baseline;white-space:pre-wrap">https://wiki.yocto=
project.org/wiki/TSC</span></a></p><br><p dir=3D"ltr" style=3D"line-height:=
1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-f=
amily:Arial,sans-serif;color:rgb(0,0,0);background-color:transparent;font-v=
ariant:normal;vertical-align:baseline;white-space:pre-wrap">The Status repo=
rts are stored on the wiki at: </span><a href=3D"https://wiki.yoctoproject.=
org/wiki/Weekly_Status" style=3D"text-decoration:none"><span style=3D"font-=
size:11pt;font-family:Arial,sans-serif;background-color:transparent;font-va=
riant:normal;text-decoration:underline;vertical-align:baseline;white-space:=
pre-wrap">https://wiki.yoctoproject.org/wiki/Weekly_Status</span></a></p><b=
r><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt=
"><span style=3D"font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,=
0);background-color:transparent;font-variant:normal;vertical-align:baseline=
;white-space:pre-wrap">[If anyone has suggestions for other information you=
=E2=80=99d like to see on this weekly status update, let us know!]</span></=
p></span><br class=3D"gmail-Apple-interchange-newline"></div><div dir=3D"lt=
r" class=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div dir=3D=
"ltr"><div dir=3D"ltr"><p class=3D"MsoNormal" style=3D"background-image:ini=
tial;background-position:initial;background-repeat:initial"><span style=3D"=
font-size:12pt;font-family:Arial,sans-serif">Thanks,<span></span></span></p=
>

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

--0000000000001ec9a1065c137530--

