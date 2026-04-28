Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3B15FF8868
	for <webhook@archiver.kernel.org>; Tue, 28 Apr 2026 15:23:42 +0000 (UTC)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.90.1777389818973265353
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Apr 2026 08:23:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=UmYQB5t4;
 spf=pass (domain: mvista.com, ip: 209.85.128.175, mailfrom: hprajapati@mvista.com)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-794719afcd4so122468857b3.1
        for <openembedded-core@lists.openembedded.org>; Tue, 28 Apr 2026 08:23:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777389818; cv=none;
        d=google.com; s=arc-20240605;
        b=TuEcm93KKLaMYFsTMcdb/+8wYSp7KVjX0CwuHiXJxn4PK7Phj0PGxh/2jf94Po0+pw
         FM0p0xCtvVbEQ2ubxDo27LJoz6afdjMBw8uID2chEQE15eLY0WSmvNmVc3IW9kBbNUy3
         d8aZNXiC5exYgzP3Z8v+u21pUvvQIA2Us4j3lNe5tGJEpvFxkZ21ERpf25ma0z590bYb
         hlDjFoXdlktzrbx+DLMDfp7u5rRtxif58J05oevHNb4/MfU3gkIsZB9FnrJc7uryFRsG
         M7bYL6iqs7wsBqsrz3gruxC5FWgB3CsU0Oxuk6pxTvgro6fcByWANQNbdpUMW2S7HEKp
         6Zpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=u3BEpEWTh90jQeYyhpa1IIkAfjaUFkK+YMFx22wbNXw=;
        fh=pPCZLadEnHSSNqpbdMoTRaQ3O6r9Sm3FEzXJm+M1zj8=;
        b=IoEhjZWb6WUU59PTl0OzIsekKx2+ykSflFez6xRANQax8GzdXZYVFV2JrNUo86Of0p
         HwTmvCdjRSvfXgjFIlrf0XjC6KNGBAt85P7qby3N3qPdoJ2+VoXVvoBirb+WGaBhM51B
         iYeqtQf9Xr6WQsmVCSR4Rauva4W8fDlAbJll4bRBwsrjLTI5ZbK7HFfwdDxaxeTcL5eg
         an0zd9DX57W04blEqLXlD9dBmH9u2/rcxyD9vTXTyQfs5F4RXvBygilIMgmJTJ4R4MWn
         nLwDoeeZ1Yoncn7xRuodFPvFQ/WsnRisFZ1eFW3mxcFMWi5hamAUVKjbDSVW8TNfMB9g
         LdSQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1777389818; x=1777994618; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=u3BEpEWTh90jQeYyhpa1IIkAfjaUFkK+YMFx22wbNXw=;
        b=UmYQB5t4fWV9hfeLkyrz1V2V1rAQpik0izH+OWSyPN1wUHeYQGO3hcoJPWnVAqqGX5
         EgwRkiBmRAQ24k0FTCVGCOF055ZHh+RUtrEHIqyvUQ4Kz56+WH9oybByHJ8PezqghJgg
         oYn0jdb0PFWaseAJMdPPFeK61o/roqAihQWew=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777389818; x=1777994618;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u3BEpEWTh90jQeYyhpa1IIkAfjaUFkK+YMFx22wbNXw=;
        b=CXMZRFnjyW1RJ0yGjSnx8dbb181+U1zFbBgd8S+HgYI0rw9UJ6YmqBypGCDpVoxNfB
         DaALiM06+dhKfSJXOoupd3q8IVV71kXKimFc5Fse8Z/GgmCcnbZithUk3ypUzy4gj76O
         lmxPe2nQanVmNBZmraDFRzn1lNwKkgKxI0LH/XOK8ZnTWvD1XJAhJFKa+nqo9HV0idUU
         4Tle+A8NUdMNlJPAhOfXnNLSTWXZ9OKbG6Ooa0e2+Z1TJN1hL522cm8e9etNDl1fENc6
         uFM2/MiDblr9NW8GecXEtUxFk9OLwESWVtpTa4VzqeKMltiCf3EUvyPwEIl2/+d4LvVu
         eWqw==
X-Gm-Message-State: AOJu0Yyk2YI9PqT8nWDi//0JrXv89IMJFGV8co3KwOYSHRKD69UiNMJD
	OrRKqL52c8FD0mj0W4JwdpLjVXB+NkFP8n6GPOlXgSq6J86R/WnwceQovrCvBkyxyddaAffINwM
	gQd6DvrPUS5Eo9KhzHdYflyxifApYCKeknnfhyve4nm/pPVTJfBFC
X-Gm-Gg: AeBDiesu9zNbsFC6ufxU9FY8smMJCsuyXvBSMMVTEGzzvtLFFu/1iUJAZVBauKCQuBJ
	W8keYkpkfGRcWudqbZu+IpLkjppEFBrG6/ji9WwmXIlH1IfKeCy3odPNbypUW1wf5EG56JQCmdw
	KJ7HoylFbawUQBaun9SIqDWQQlDuiSlWljzCxXtjAlqq26R+NqMJXRfdOBe7L71RsQKTSGOsmTt
	Rx1P1UnWcG9nBMkp3fIKSdnt3/9Z3mPPPkQuEhSoukzHNTJvTL6Pv0xNR8UgL1oDQdx4UZuQTLY
	2dsuK+fG+cKTgGj+wu/AdPFgVnR6rNMZQrs=
X-Received: by 2002:a05:690c:3606:b0:7ba:f784:579a with SMTP id
 00721157ae682-7bcf546932emr31499367b3.24.1777389817924; Tue, 28 Apr 2026
 08:23:37 -0700 (PDT)
MIME-Version: 1.0
References: <20260424084956.214345-1-hprajapati@mvista.com> <DI4W0MH446S5.1PZMW524MSN7V@smile.fr>
In-Reply-To: <DI4W0MH446S5.1PZMW524MSN7V@smile.fr>
From: Hitendra Prajapati <hprajapati@mvista.com>
Date: Tue, 28 Apr 2026 20:53:26 +0530
X-Gm-Features: AVHnY4IxBB-YW3TT2tHMHy5E34lu5AMD5LUA6vHI-r4JmymcJ5XtM7qBMNwBRWk
Message-ID: <CACVbggGCsRNGDKPxboSovbq1tnyJfD=fiRh1bk7+JPg14dnUYg@mail.gmail.com>
Subject: Re: [OE-core] [scarthgap][PATCH] rsync: fix for CVE-2026-41035
To: Fabien Thomas <fabien.thomas@smile.fr>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000b99e41065086d0b9"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Apr 2026 15:23:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236068

--000000000000b99e41065086d0b9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Fabien,

Understood. I will submit the backport for master first.

Regards,
Hitendra

On Tue, 28 Apr, 2026, 8:49=E2=80=AFpm Fabien Thomas, <fabien.thomas@smile.f=
r> wrote:

> On Fri Apr 24, 2026 at 10:49 AM CEST, Hitendra Prajapati via
> lists.openembedded.org wrote:
> > Pick patch from [1] also mentioned at Debian report in [2]
> >
> > [1]
> https://github.com/RsyncProject/rsync/commit/bb0a8118c2d2ab01140bac5e4e32=
7e5e1ef90c9c
> > [2] https://security-tracker.debian.org/tracker/CVE-2026-41035
> > [3] https://nvd.nist.gov/vuln/detail/CVE-2026-41035
> >
> > Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
> > ---
> >  .../rsync/files/CVE-2026-41035.patch          | 39 +++++++++++++++++++
> >  meta/recipes-devtools/rsync/rsync_3.2.7.bb    |  1 +
> >  2 files changed, 40 insertions(+)
> >  create mode 100644
> meta/recipes-devtools/rsync/files/CVE-2026-41035.patch
> >
> > diff --git a/meta/recipes-devtools/rsync/files/CVE-2026-41035.patch
> b/meta/recipes-devtools/rsync/files/CVE-2026-41035.patch
> > new file mode 100644
> > index 0000000000..66b1b93672
> > --- /dev/null
> > +++ b/meta/recipes-devtools/rsync/files/CVE-2026-41035.patch
> > @@ -0,0 +1,39 @@
> > +From bb0a8118c2d2ab01140bac5e4e327e5e1ef90c9c Mon Sep 17 00:00:00 2001
> > +From: Andrew Tridgell <andrew@tridgell.net>
> > +Date: Wed, 22 Apr 2026 09:57:45 +1000
> > +Subject: [PATCH] xattrs: fixed count in qsort
> > +
> > +this fixes the count passed to the sort of the xattr list. This issue
> > +was reported here:
> > +
> > +https://www.openwall.com/lists/oss-security/2026/04/16/2
> > +
> > +the bug is not exploitable due to the fork-per-connection design of
> > +rsync, the attack is the equivalent of the user closing the socket
> > +themselves.
> > +
> > +CVE: CVE-2026-41035
> > +Upstream-Status: Backport [
> https://github.com/RsyncProject/rsync/commit/bb0a8118c2d2ab01140bac5e4e32=
7e5e1ef90c9c
> ]
> > +Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
> > +---
> > + xattrs.c | 4 ++--
> > + 1 file changed, 2 insertions(+), 2 deletions(-)
> > +
> > +diff --git a/xattrs.c b/xattrs.c
> > +index 26e50a6..65166ee 100644
> > +--- a/xattrs.c
> > ++++ b/xattrs.c
> > +@@ -860,8 +860,8 @@ void receive_xattr(int f, struct file_struct *file=
)
> > +             rxa->num =3D num;
> > +     }
> > +
> > +-    if (need_sort && count > 1)
> > +-            qsort(temp_xattr.items, count, sizeof (rsync_xa),
> rsync_xal_compare_names);
> > ++    if (need_sort && temp_xattr.count > 1)
> > ++            qsort(temp_xattr.items, temp_xattr.count, sizeof
> (rsync_xa), rsync_xal_compare_names);
> > +
> > +     ndx =3D rsync_xal_store(&temp_xattr); /* adds item to rsync_xal_l=
 */
> > +
> > +--
> > +2.50.1
> > +
> > diff --git a/meta/recipes-devtools/rsync/rsync_3.2.7.bb
> b/meta/recipes-devtools/rsync/rsync_3.2.7.bb
> > index 14beafb681..2a1c3d9d56 100644
> > --- a/meta/recipes-devtools/rsync/rsync_3.2.7.bb
> > +++ b/meta/recipes-devtools/rsync/rsync_3.2.7.bb
> > @@ -28,6 +28,7 @@ SRC_URI =3D "
> https://download.samba.org/pub/${BPN}/src/${BP}.tar.gz \
> >             file://CVE-2024-12088.patch \
> >             file://CVE-2024-12747.patch \
> >             file://CVE-2025-10158.patch \
> > +           file://CVE-2026-41035.patch \
> >             "
> >  SRC_URI[sha256sum] =3D
> "4e7d9d3f6ed10878c58c5fb724a67dacf4b6aac7340b13e488fb2dc41346f2bb"
> >
> Hi Hitendra,
>
> Since this fix has been merged into the rsync v3.4.2, and
> openembedded-core
> master branch use currently rsync v3.4.1, I cannot accept this directly
> for
> scarthgap yet because of the "master-first" policy we follow.
>
> Could you please submit a backport for the master branch first?
> Once received, I can move forward with this backport for scarthgap.
>
> Thanks,
> Regards.
>
> --
> Fabien Thomas
> Smile ECS
>
>

--000000000000b99e41065086d0b9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><span class=3D"smart_draft_text">Hi Fabien,<br><br>Unders=
tood. I will submit the backport for master first.<br><br>Regards,<br>Hiten=
dra</span></div><br><div class=3D"gmail_quote gmail_quote_container"><div d=
ir=3D"ltr" class=3D"gmail_attr">On Tue, 28 Apr, 2026, 8:49=E2=80=AFpm Fabie=
n Thomas, &lt;<a href=3D"mailto:fabien.thomas@smile.fr">fabien.thomas@smile=
.fr</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On Fri Apr 24, 2=
026 at 10:49 AM CEST, Hitendra Prajapati via <a href=3D"http://lists.openem=
bedded.org" rel=3D"noreferrer noreferrer" target=3D"_blank">lists.openembed=
ded.org</a> wrote:<br>
&gt; Pick patch from [1] also mentioned at Debian report in [2]<br>
&gt;<br>
&gt; [1] <a href=3D"https://github.com/RsyncProject/rsync/commit/bb0a8118c2=
d2ab01140bac5e4e327e5e1ef90c9c" rel=3D"noreferrer noreferrer" target=3D"_bl=
ank">https://github.com/RsyncProject/rsync/commit/bb0a8118c2d2ab01140bac5e4=
e327e5e1ef90c9c</a><br>
&gt; [2] <a href=3D"https://security-tracker.debian.org/tracker/CVE-2026-41=
035" rel=3D"noreferrer noreferrer" target=3D"_blank">https://security-track=
er.debian.org/tracker/CVE-2026-41035</a><br>
&gt; [3] <a href=3D"https://nvd.nist.gov/vuln/detail/CVE-2026-41035" rel=3D=
"noreferrer noreferrer" target=3D"_blank">https://nvd.nist.gov/vuln/detail/=
CVE-2026-41035</a><br>
&gt;<br>
&gt; Signed-off-by: Hitendra Prajapati &lt;<a href=3D"mailto:hprajapati@mvi=
sta.com" target=3D"_blank" rel=3D"noreferrer">hprajapati@mvista.com</a>&gt;=
<br>
&gt; ---<br>
&gt;=C2=A0 .../rsync/files/CVE-2026-41035.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 | 39 +++++++++++++++++++<br>
&gt;=C2=A0 meta/recipes-devtools/rsync/<a href=3D"http://rsync_3.2.7.bb" re=
l=3D"noreferrer noreferrer" target=3D"_blank">rsync_3.2.7.bb</a>=C2=A0 =C2=
=A0 |=C2=A0 1 +<br>
&gt;=C2=A0 2 files changed, 40 insertions(+)<br>
&gt;=C2=A0 create mode 100644 meta/recipes-devtools/rsync/files/CVE-2026-41=
035.patch<br>
&gt;<br>
&gt; diff --git a/meta/recipes-devtools/rsync/files/CVE-2026-41035.patch b/=
meta/recipes-devtools/rsync/files/CVE-2026-41035.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..66b1b93672<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-devtools/rsync/files/CVE-2026-41035.patch<br>
&gt; @@ -0,0 +1,39 @@<br>
&gt; +From bb0a8118c2d2ab01140bac5e4e327e5e1ef90c9c Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Andrew Tridgell &lt;<a href=3D"mailto:andrew@tridgell.net" targ=
et=3D"_blank" rel=3D"noreferrer">andrew@tridgell.net</a>&gt;<br>
&gt; +Date: Wed, 22 Apr 2026 09:57:45 +1000<br>
&gt; +Subject: [PATCH] xattrs: fixed count in qsort<br>
&gt; +<br>
&gt; +this fixes the count passed to the sort of the xattr list. This issue=
<br>
&gt; +was reported here:<br>
&gt; +<br>
&gt; +<a href=3D"https://www.openwall.com/lists/oss-security/2026/04/16/2" =
rel=3D"noreferrer noreferrer" target=3D"_blank">https://www.openwall.com/li=
sts/oss-security/2026/04/16/2</a><br>
&gt; +<br>
&gt; +the bug is not exploitable due to the fork-per-connection design of<b=
r>
&gt; +rsync, the attack is the equivalent of the user closing the socket<br=
>
&gt; +themselves.<br>
&gt; +<br>
&gt; +CVE: CVE-2026-41035<br>
&gt; +Upstream-Status: Backport [<a href=3D"https://github.com/RsyncProject=
/rsync/commit/bb0a8118c2d2ab01140bac5e4e327e5e1ef90c9c" rel=3D"noreferrer n=
oreferrer" target=3D"_blank">https://github.com/RsyncProject/rsync/commit/b=
b0a8118c2d2ab01140bac5e4e327e5e1ef90c9c</a>]<br>
&gt; +Signed-off-by: Hitendra Prajapati &lt;<a href=3D"mailto:hprajapati@mv=
ista.com" target=3D"_blank" rel=3D"noreferrer">hprajapati@mvista.com</a>&gt=
;<br>
&gt; +---<br>
&gt; + xattrs.c | 4 ++--<br>
&gt; + 1 file changed, 2 insertions(+), 2 deletions(-)<br>
&gt; +<br>
&gt; +diff --git a/xattrs.c b/xattrs.c<br>
&gt; +index 26e50a6..65166ee 100644<br>
&gt; +--- a/xattrs.c<br>
&gt; ++++ b/xattrs.c<br>
&gt; +@@ -860,8 +860,8 @@ void receive_xattr(int f, struct file_struct *fil=
e)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rxa-&gt;num =3D num;<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; + <br>
&gt; +-=C2=A0 =C2=A0 if (need_sort &amp;&amp; count &gt; 1)<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qsort(temp_xattr.items, co=
unt, sizeof (rsync_xa), rsync_xal_compare_names);<br>
&gt; ++=C2=A0 =C2=A0 if (need_sort &amp;&amp; temp_xattr.count &gt; 1)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qsort(temp_xattr.items, te=
mp_xattr.count, sizeof (rsync_xa), rsync_xal_compare_names);<br>
&gt; + <br>
&gt; +=C2=A0 =C2=A0 =C2=A0ndx =3D rsync_xal_store(&amp;temp_xattr); /* adds=
 item to rsync_xal_l */<br>
&gt; + <br>
&gt; +-- <br>
&gt; +2.50.1<br>
&gt; +<br>
&gt; diff --git a/meta/recipes-devtools/rsync/<a href=3D"http://rsync_3.2.7=
.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">rsync_3.2.7.bb</a> b/m=
eta/recipes-devtools/rsync/<a href=3D"http://rsync_3.2.7.bb" rel=3D"norefer=
rer noreferrer" target=3D"_blank">rsync_3.2.7.bb</a><br>
&gt; index 14beafb681..2a1c3d9d56 100644<br>
&gt; --- a/meta/recipes-devtools/rsync/<a href=3D"http://rsync_3.2.7.bb" re=
l=3D"noreferrer noreferrer" target=3D"_blank">rsync_3.2.7.bb</a><br>
&gt; +++ b/meta/recipes-devtools/rsync/<a href=3D"http://rsync_3.2.7.bb" re=
l=3D"noreferrer noreferrer" target=3D"_blank">rsync_3.2.7.bb</a><br>
&gt; @@ -28,6 +28,7 @@ SRC_URI =3D &quot;<a href=3D"https://download.samba.=
org/pub/$%7BBPN%7D/src/$%7BBP%7D.tar.gz" rel=3D"noreferrer noreferrer" targ=
et=3D"_blank">https://download.samba.org/pub/${BPN}/src/${BP}.tar.gz</a> \<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2024-12088.p=
atch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2024-12747.p=
atch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2025-10158.p=
atch \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2026-41035.patch =
\<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
&gt;=C2=A0 SRC_URI[sha256sum] =3D &quot;4e7d9d3f6ed10878c58c5fb724a67dacf4b=
6aac7340b13e488fb2dc41346f2bb&quot;<br>
&gt;=C2=A0 <br>
Hi Hitendra,<br>
<br>
Since this fix has been merged into the rsync v3.4.2, and openembedded-core=
 <br>
master branch use currently rsync v3.4.1, I cannot accept this directly for=
 <br>
scarthgap yet because of the &quot;master-first&quot; policy we follow. <br=
>
<br>
Could you please submit a backport for the master branch first?<br>
Once received, I can move forward with this backport for scarthgap.<br>
<br>
Thanks,<br>
Regards.<br>
<br>
-- <br>
Fabien Thomas<br>
Smile ECS<br>
<br>
</blockquote></div>

--000000000000b99e41065086d0b9--

