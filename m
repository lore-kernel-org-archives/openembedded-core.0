Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B465DCFA76E
	for <webhook@archiver.kernel.org>; Fri, 21 Nov 2025 10:35:55 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8560.1763721351077546940
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Nov 2025 02:35:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fzvB9VZr;
 spf=pass (domain: gmail.com, ip: 209.85.214.179, mailfrom: rybczynska@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2980d9b7df5so23886525ad.3
        for <openembedded-core@lists.openembedded.org>; Fri, 21 Nov 2025 02:35:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763721350; x=1764326150; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=taUQJ6m/TeFQpnEpkg00zBVKEOr8ormj7IEbbgu1b1A=;
        b=fzvB9VZrgLN1rmzhwyA4hlKer3mEujrjJur3pS7Sx6QcjLx+pLmGnJTfaUK7E1Oie6
         CXHIwC3PrGXgciBBojvp+++i4r7QFwocVArnDmI4EBZ0FWrV5fyH8pkR+SrxfOb/9tTJ
         5klemclz/fs80l/kYBKHgZiGPfPfyYt58F8fAOQjI+sQDh2NXAnNCVcM7Xl7iKIjqFZQ
         aUkikSlvce95hOjSaGZlF5ddKqZHyfog8RvVVDuU6vahbKd9jxOHr7YjPtd7lN16c5Uk
         rg00mAnoiy2+WLCaRAqOKntnI4WbdfrvYxs+gIfzNOYinm1IvTqzvA0tpIzI7x346g5X
         0UqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763721350; x=1764326150;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=taUQJ6m/TeFQpnEpkg00zBVKEOr8ormj7IEbbgu1b1A=;
        b=hkZYestWisyutgCOGHnf8QJ+wKmfcF+loPgGYuvTHQrTDgnjV0HoL0I0hUeaFfJC8/
         7mafA1NvFLw+6IKH7DFOV8vuLG70li0qKEcTHWAzuomZjKFLu3fDC8lu8Vhdwy9uh2nU
         saMjxJTAd2983o1E9mL7kUKJVUiTv8hNNeOUOujr+MsWrxQ6kof0l9mgirGSpNQc3uf9
         guneRTkCHAm9qittN4gqNVV6mMYPWv3CQiaAdQsjNxSdItMDkQ0wA7Js5tTS8WDVJGkr
         dvxK/U9Z00U9dRXbO2BbKAkhTnYQ8sJiPmh/hiqGvvAhlLS4yOtn5PIEMAEfNv9kcBPK
         qocQ==
X-Gm-Message-State: AOJu0YwBBIVgamIXVde3p6BUHfxxUjeTww7uO/FENc/y8EVGMVMh+bxB
	TUFClEuaiwzi8dU9El3a8opsTfsTbac7UiDX0EWJU3a77piWjgVvM6YVVeR/u1mBLIuVH/f+5k7
	NPbEe9HzUwwlyg8fbJJiL7Qlf6F9ZkO0=
X-Gm-Gg: ASbGncsv5Z9tiUMPjPJ3INQ/9FbEUeWdn9ySZorqLiwgQfzFkNfxX4EifvfqC/YCYCB
	ScBP6htR2ybNK2BSLCLjQiZeWkkuXQB8y8yRUTuMEFH5LvXWa/9XoOI++DTgO0qrnJCPFMMDXXx
	teHbhc8GuM1pj1QzuAIccqrKuiCRfumc6lD7KZ3wsU4GEwTN3xulrZKuKK+40lehP+Xk4qPcjHG
	hSZMLDLmcHZFgnjyCVJ9GHV1S4mmBSJiXz76LnHzDBDghz3sxyTyDFXpbKY2KoNrX1TKW6v
X-Google-Smtp-Source: AGHT+IHguEjU4mChbRiCbYMrPe6xESclX+zZ3SGPlh43nRq5HV9MwJGtYWPXqDJKZ1FRv95md03xjRQEv1ALLtSYSsA=
X-Received: by 2002:a05:7022:1a86:b0:11b:b179:6e17 with SMTP id
 a92af1059eb24-11c9d8635b1mr675920c88.34.1763721350130; Fri, 21 Nov 2025
 02:35:50 -0800 (PST)
MIME-Version: 1.0
References: <20251121095415.288301-1-benjamin.robin@bootlin.com>
In-Reply-To: <20251121095415.288301-1-benjamin.robin@bootlin.com>
From: Marta Rybczynska <rybczynska@gmail.com>
Date: Fri, 21 Nov 2025 11:35:38 +0100
X-Gm-Features: AWmQ_blG14vO4o4PXnN7IiFl5d9KXuH1JH01FscqkA8sYpywBobA5NuEVIsNydo
Message-ID: <CAApg2=SYhNKQrdSM6VNDYzqSbwBrGDB30Za1=TOruk8Dqa=Umw@mail.gmail.com>
Subject: Re: [OE-core] [scarthgap v2 0/5] backport: allow to extract all
 CVE_STATUS info
To: benjamin.robin@bootlin.com
Cc: openembedded-core@lists.openembedded.org, thomas.petazzoni@bootlin.com, 
	mathieu.dubois-briand@bootlin.com, miquel.raynal@bootlin.com, 
	antonin.godard@bootlin.com, kamel.bouhara@bootlin.com, pascal.eberhard@se.com, 
	jpewhacker@gmail.com
Content-Type: multipart/alternative; boundary="0000000000008eaeff0644186074"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Nov 2025 10:35:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226663

--0000000000008eaeff0644186074
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Benjamin,
Do you confirm that this time it is ready for review?

Kind regards,
Marta

On Fri, Nov 21, 2025 at 10:54=E2=80=AFAM Benjamin Robin via lists.openembed=
ded.org
<benjamin.robin=3Dbootlin.com@lists.openembedded.org> wrote:

> (I'm resending this series because it was blocked for spam, sorry for the
> noise)
>
> Currently only CVEs with "Patched" status are exported in SPDX 3.0 files.
> Moreover, CVE annotations provided by the CVE_STATUS_GROUPS variable are
> not
> exported, since previously this was only handled by cve-check.bbclass.
>
> Also the vex.bbclass is missing, which will helps users to extract all th=
e
> information needed to do a CVE analysis outside of Yocto.
>
> These changes are realized since scarthgap Long Term Support ends in Apri=
l
> 2028. Without these improvements, it is not possible to do a proper CVE
> analysis outside of Yocto, solely based on the SBOM, since there are
> missing
> CVE annotations in the artifact files. We want to be able to extract all
> CVE
> annotations provided by the CVE_STATUS and the CVE_STATUS_GROUPS variable=
s.
>
> With this backport, great care has been taken to avoid breaking
> compatibility.
> This is why the get_patched_cves() API was not changed. Everything that w=
as
> needed is implemented in the associated .bbclass:
>  - Patch 1/5 modifies spdx30_tasks to extract all CVE status. This commit
> was
>    not cherry-picked from master.
>  - Patch 2/5 backports the vex.bbclass, but modify it a bit to use the ol=
d
>    get_patched_cves() API.
>  - Patch 3/5 and 4/5 are cherry-picked, these commits move the extraction
> of
>    CVE_STATUS_GROUPS information to lib/oe/cve_check.py
>  - Patch 5/5 is cherry-picked to backport a vex.bbclass improvement
>
> This series should be applied on top of [1]:
> [scarthgap] spdx30: fix cve status for patch files in VEX
>
> [1]: https://patchwork.yoctoproject.org/project/oe-core/list/?series=3D40=
606
>
> Benjamin Robin (Schneider Electric) (5):
>   spdx30: provide all CVE_STATUS, not only Patched status
>   vex.bbclass: add a new class
>   cve-check: extract extending CVE_STATUS to library function
>   spdx: extend CVE_STATUS variables
>   vex: fix rootfs manifest
>
>  meta/classes/cve-check.bbclass   |  17 +-
>  meta/classes/spdx-common.bbclass |   5 +
>  meta/classes/vex.bbclass         | 319 +++++++++++++++++++++++++++++++
>  meta/lib/oe/cve_check.py         |  22 +++
>  meta/lib/oe/spdx30_tasks.py      |  31 +--
>  5 files changed, 365 insertions(+), 29 deletions(-)
>  create mode 100644 meta/classes/vex.bbclass
>
> --
> 2.51.2
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#226657):
> https://lists.openembedded.org/g/openembedded-core/message/226657
> Mute This Topic: https://lists.openembedded.org/mt/116405458/5827677
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> rybczynska@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000008eaeff0644186074
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello Benjamin,</div><div>Do you confirm that this ti=
me it is ready for review?</div><div><br></div><div>Kind regards,</div><div=
>Marta<br></div></div><br><div class=3D"gmail_quote gmail_quote_container">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Nov 21, 2025 at 10:54=E2=80=
=AFAM Benjamin Robin via <a href=3D"http://lists.openembedded.org">lists.op=
enembedded.org</a> &lt;benjamin.robin=3D<a href=3D"mailto:bootlin.com@lists=
.openembedded.org">bootlin.com@lists.openembedded.org</a>&gt; wrote:<br></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex">(I&#39;m resending thi=
s series because it was blocked for spam, sorry for the noise)<br>
<br>
Currently only CVEs with &quot;Patched&quot; status are exported in SPDX 3.=
0 files.<br>
Moreover, CVE annotations provided by the CVE_STATUS_GROUPS variable are no=
t<br>
exported, since previously this was only handled by cve-check.bbclass.<br>
<br>
Also the vex.bbclass is missing, which will helps users to extract all the<=
br>
information needed to do a CVE analysis outside of Yocto.<br>
<br>
These changes are realized since scarthgap Long Term Support ends in April<=
br>
2028. Without these improvements, it is not possible to do a proper CVE<br>
analysis outside of Yocto, solely based on the SBOM, since there are missin=
g<br>
CVE annotations in the artifact files. We want to be able to extract all CV=
E<br>
annotations provided by the CVE_STATUS and the CVE_STATUS_GROUPS variables.=
<br>
<br>
With this backport, great care has been taken to avoid breaking compatibili=
ty.<br>
This is why the get_patched_cves() API was not changed. Everything that was=
<br>
needed is implemented in the associated .bbclass:<br>
=C2=A0- Patch 1/5 modifies spdx30_tasks to extract all CVE status. This com=
mit was<br>
=C2=A0 =C2=A0not cherry-picked from master.<br>
=C2=A0- Patch 2/5 backports the vex.bbclass, but modify it a bit to use the=
 old<br>
=C2=A0 =C2=A0get_patched_cves() API.<br>
=C2=A0- Patch 3/5 and 4/5 are cherry-picked, these commits move the extract=
ion of<br>
=C2=A0 =C2=A0CVE_STATUS_GROUPS information to lib/oe/cve_check.py<br>
=C2=A0- Patch 5/5 is cherry-picked to backport a vex.bbclass improvement<br=
>
<br>
This series should be applied on top of [1]:<br>
[scarthgap] spdx30: fix cve status for patch files in VEX<br>
<br>
[1]: <a href=3D"https://patchwork.yoctoproject.org/project/oe-core/list/?se=
ries=3D40606" rel=3D"noreferrer" target=3D"_blank">https://patchwork.yoctop=
roject.org/project/oe-core/list/?series=3D40606</a><br>
<br>
Benjamin Robin (Schneider Electric) (5):<br>
=C2=A0 spdx30: provide all CVE_STATUS, not only Patched status<br>
=C2=A0 vex.bbclass: add a new class<br>
=C2=A0 cve-check: extract extending CVE_STATUS to library function<br>
=C2=A0 spdx: extend CVE_STATUS variables<br>
=C2=A0 vex: fix rootfs manifest<br>
<br>
=C2=A0meta/classes/cve-check.bbclass=C2=A0 =C2=A0|=C2=A0 17 +-<br>
=C2=A0meta/classes/spdx-common.bbclass |=C2=A0 =C2=A05 +<br>
=C2=A0meta/classes/vex.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 319 +++++=
++++++++++++++++++++++++++<br>
=C2=A0meta/lib/oe/cve_check.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 22 =
+++<br>
=C2=A0meta/lib/oe/spdx30_tasks.py=C2=A0 =C2=A0 =C2=A0 |=C2=A0 31 +--<br>
=C2=A05 files changed, 365 insertions(+), 29 deletions(-)<br>
=C2=A0create mode 100644 meta/classes/vex.bbclass<br>
<br>
-- <br>
2.51.2<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#226657): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/226657" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/226657</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/116405458/582=
7677" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/116405458/5827677</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:rybczynska@gmail.com" targ=
et=3D"_blank">rybczynska@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--0000000000008eaeff0644186074--

