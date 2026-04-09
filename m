Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D6EEE9DE70
	for <webhook@archiver.kernel.org>; Thu,  9 Apr 2026 09:05:14 +0000 (UTC)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.127823.1775725508780723382
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Apr 2026 02:05:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=i3/D8sZ1;
 spf=pass (domain: mvista.com, ip: 209.85.128.175, mailfrom: hprajapati@mvista.com)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-7947cf097c1so5502857b3.2
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Apr 2026 02:05:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775725508; cv=none;
        d=google.com; s=arc-20240605;
        b=AEVOWLrpsI7OjWU6CMgqHMS844fc5gWbmiaeRgZpCT8G2wX6c+tVo0trzDSnBlxQd+
         yhrCzWDH12GPDLlENdzzgWHZSa4YMe9XcatZxdN8qCxl93axDdTUL3N1UxFD6EmgH0hG
         ey4+DO8zyWrkBBVFwByC0u9w57XHw8BUNHQqkSDybo/4EOE+gG7VMWF0x87MnZkUhxJb
         WPDNHnN+D3lwuKSDxQGqSk+Pce7MRbjtltn+BRYTsHPjuaQESeY82ezWDPMvDEcprKdb
         uhmwUYKUdBV+dpcEoeMIdRV5oEpKcYMx1kKRTxcIZP1Jx/NHh1uGwrHdkB4oABZVhnnF
         nR6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=t8LJ9/c9poQHLZWyBg1166qGGlt+I0OcJxGi/WHAPyA=;
        fh=5VpxgiaFCw99hmUxvV+/er63fRX0UWM338mat0ljUv0=;
        b=cf/a4oPRmFDvZXmm5Ei1wg/CJNFRT77VRpzfD77XT4WdMz0RjJVeGMSobOwJ8J5/xA
         o8X3AYAG5zN9WRaJhuc0EmtSOxUuDXRvHF6FrGLPBbHR6JzbiQJSDoP7fUV5ttiiXJVm
         7CfSOFpXEcYVn4Bw64xABrwTCOtDUbI4103xkXd5dhScWS4JoAedkJ25y1jY7UtHZknR
         AOfTvebqD1+MSB7k9JMlQPKbdAWNVuXdrjLPrKSPY7D+9tdxBG88OYIunIaeUYuZPjzw
         pciKRFn75KRhzniIHPtABSPABMQ5FF2QAU+org7JBou16flOygmoCaZrOHXYs11ZZK8V
         wlYw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1775725508; x=1776330308; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=t8LJ9/c9poQHLZWyBg1166qGGlt+I0OcJxGi/WHAPyA=;
        b=i3/D8sZ1ZaI7IwDuiCQyq35aY8yhImjFFJreENlMD5h2ezVEO4D6WF3rpf/hMsMIjN
         rfadrZyQ10b7qK4cQjpWy9P8df68qKAthJSwSYv5poGxubHaLx1lDoagmbF5kqMem6gi
         ybBtYX84YPkrrR5oAAdGn/2n05bzul4wKAFbU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775725508; x=1776330308;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t8LJ9/c9poQHLZWyBg1166qGGlt+I0OcJxGi/WHAPyA=;
        b=RrxDvmT4OPXst7fO3WHllu39Rvq5XH8OgdmgXqPmVHbdocgBHDvKwj6DZQPDnRToey
         Ndvu2y6LzRcq3MIffYOj8FiDN0ge8t+58y0Ul6Z+KWGf0JuuFVkB5b6MFFx2+fGsQEqh
         p69mr9ocybo31/LCmSZn6JUvmcQwlgpogMhUlKrZPNiNFGdc4e06F3i5pCBduGW/4Zyo
         ZV22hHOIt1iN2J56A2MHQq6thdFWdmDlHxR1bLOCSXqLyXHmLYS17CTGXByEqHAiyOqq
         UOiTCWsdTl/lG0RlLlGeYXi8PTvrhAym97wJdP4PKsrowxb/1mE85+1NfjkrFOJkniGe
         e6VA==
X-Gm-Message-State: AOJu0YyPqz8TUxcKWhsbAEh97FF/GJKQi/I1/pVN9SozN+poO5sGM7Y1
	v4aTsMh00G+h/MoLBBvJ6Ed5iMUhCOsmfBJ64HnbI7pOMRBHORsFW+0E0CKmF6UQ1FS+PhblVwX
	7jx70Ora1BBwsZX92GmtqcfoRw+eX9HZok9nwsbyINA==
X-Gm-Gg: AeBDiett0Ut2x1iGjeXP5UqBc1mOPR9LM8HCzUedAyoe6Fq8l1KVutuy9fl5tCwYwHi
	Wvx4TKrKbudC8GUMxxdZAxVZnoSNzD0JlAFywKcs7uUaLRm/ZTTLqt3O2Hn46aVwl9BMF/HrMd+
	GLa7UtEZYmXbPerZTHgYppYWB2EQT6rKigeD8nxnsglwciT/wt1B+/05x7rCuLdIDbPiIe/DFJ+
	uq3VT1ujHQV3f9dMLzC23J74ELWFKKVarc4q1FWWpLYrLW4jQmwzGgzVnGPivqAtLfJadGET9Ej
	j1IUFZiHfirHqoBTZv9OcBLsDR5kyhp32M8=
X-Received: by 2002:a05:690c:74ca:b0:79a:6ea2:f439 with SMTP id
 00721157ae682-7adf3256a24mr27139927b3.38.1775725507671; Thu, 09 Apr 2026
 02:05:07 -0700 (PDT)
MIME-Version: 1.0
References: <20260408112654.1029664-1-hprajapati@mvista.com> <DHOHF1H8G3WD.UP4M83OEJ4QI@smile.fr>
In-Reply-To: <DHOHF1H8G3WD.UP4M83OEJ4QI@smile.fr>
From: Hitendra Prajapati <hprajapati@mvista.com>
Date: Thu, 9 Apr 2026 14:34:56 +0530
X-Gm-Features: AQROBzCHTBDZ03QUyagzclWvk2Q_ed9L2pszFc_SwjC4QDkNIuIDOiOGIl0NaCs
Message-ID: <CACVbggGm5+EoVYHn0_tRgk0-+_tgWy-huqzrLe7=vPk7=9TJzQ@mail.gmail.com>
Subject: Re: [OE-core] [kirkstone][PATCH] vim: Fix CVE-2026-25749
To: Yoann Congal <yoann.congal@smile.fr>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000001a8843064f0350aa"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Apr 2026 09:05:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234898

--0000000000001a8843064f0350aa
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Yoann,

Thanks for the info. I understand it's too late for kirkstone.

Regards,
Hitendra

On Thu, 9 Apr, 2026, 2:00=E2=80=AFpm Yoann Congal, <yoann.congal@smile.fr> =
wrote:

> On Wed Apr 8, 2026 at 1:26 PM CEST, Hitendra Prajapati via
> lists.openembedded.org wrote:
> > Pick patch from [1] also mentioned in [2]
> >
> > [1]
> https://github.com/vim/vim/commit/0714b15940b245108e6e9d7aa2260dd849a26fa=
9
> > [2] https://nvd.nist.gov/vuln/detail/CVE-2026-25749
> >
> > Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
> > ---
>
> Hello,
>
> I'm sorry but this patch (and the other vim patches sent after this one)
> is too late to make it into the last kirkstone release.
> See: End of kirkstone LTS support
> https://lore.kernel.org/yocto/DH8I3C005I7I.EAFAABGT2FJL@smile.fr/T/#u
>
> Regards,
>
> >  .../vim/files/CVE-2026-25749.patch            | 64 +++++++++++++++++++
> >  meta/recipes-support/vim/vim.inc              |  1 +
> >  2 files changed, 65 insertions(+)
> >  create mode 100644 meta/recipes-support/vim/files/CVE-2026-25749.patch
> >
> > diff --git a/meta/recipes-support/vim/files/CVE-2026-25749.patch
> b/meta/recipes-support/vim/files/CVE-2026-25749.patch
> > new file mode 100644
> > index 0000000000..8b04379b9b
> > --- /dev/null
> > +++ b/meta/recipes-support/vim/files/CVE-2026-25749.patch
> > @@ -0,0 +1,64 @@
> > +From e0065a61a42bdff9c75aa18104f8ff546938395f Mon Sep 17 00:00:00 2001
> > +From: Christian Brabandt <cb@256bit.org>
> > +Date: Thu, 5 Feb 2026 18:51:54 +0000
> > +Subject: [PATCH] patch 9.1.2132: [security]: buffer-overflow in
> 'helpfile'
> > + option handling
> > +
> > +Problem:  [security]: buffer-overflow in 'helpfile' option handling by
> > +          using strcpy without bound checks (Rahul Hoysala)
> > +Solution: Limit strncpy to the length of the buffer (MAXPATHL)
> > +
> > +Github Advisory:
> > +https://github.com/vim/vim/security/advisories/GHSA-5w93-4g67-mm43
> > +
> > +CVE: CVE-2026-25749
> > +Upstream-Status: Backport [
> https://github.com/vim/vim/commit/0714b15940b245108e6e9d7aa2260dd849a26fa=
9
> ]
> > +
> > +Backport Changes:
> > +- Excluded changes to src/version.c and runtime/doc/version9.txt
> > +  from this backport. This file only tracks upstream version increment=
s.
> > +  We are applying a security fix, not a version upgrade. These changes
> > +  were skipped to maintain current package versioning and avoid merge
> conflicts.
> > +
> > +Signed-off-by: Christian Brabandt <cb@256bit.org>
> > +(cherry picked from commit 0714b15940b245108e6e9d7aa2260dd849a26fa9)
> > +Signed-off-by: Anil Dongare <adongare@cisco.com>
> > +---
> > + src/tag.c                 | 2 +-
> > + src/testdir/test_help.vim | 9 +++++++++
> > + 2 files changed, 10 insertions(+), 1 deletion(-)
> > +
> > +diff --git a/src/tag.c b/src/tag.c
> > +index 6912e8743..a32bbb245 100644
> > +--- a/src/tag.c
> > ++++ b/src/tag.c
> > +@@ -3348,7 +3348,7 @@ get_tagfname(
> > +         if (tnp->tn_hf_idx > tag_fnames.ga_len || *p_hf =3D=3D NUL)
> > +             return FAIL;
> > +         ++tnp->tn_hf_idx;
> > +-        STRCPY(buf, p_hf);
> > ++        vim_strncpy(buf, p_hf, MAXPATHL - 1);
> > +         STRCPY(gettail(buf), "tags");
> > + #ifdef BACKSLASH_IN_FILENAME
> > +         slash_adjust(buf);
> > +diff --git a/src/testdir/test_help.vim b/src/testdir/test_help.vim
> > +index dac153d86..f9e4686bb 100644
> > +--- a/src/testdir/test_help.vim
> > ++++ b/src/testdir/test_help.vim
> > +@@ -222,4 +222,13 @@ func Test_helptag_navigation()
> > + endfunc
> > +
> > +
> > ++" This caused a buffer overflow
> > ++func Test_helpfile_overflow()
> > ++  let _helpfile =3D &helpfile
> > ++  let &helpfile =3D repeat('A', 5000)
> > ++  help
> > ++  helpclose
> > ++  let &helpfile =3D _helpfile
> > ++endfunc
> > ++
> > + " vim: shiftwidth=3D2 sts=3D2 expandtab
> > +--
> > +2.43.7
> > +
> > diff --git a/meta/recipes-support/vim/vim.inc
> b/meta/recipes-support/vim/vim.inc
> > index fc9b4db055..fa63689ef1 100644
> > --- a/meta/recipes-support/vim/vim.inc
> > +++ b/meta/recipes-support/vim/vim.inc
> > @@ -17,6 +17,7 @@ SRC_URI =3D "git://
> github.com/vim/vim.git;branch=3Dmaster;protocol=3Dhttps \
> >             file://0001-src-Makefile-improve-reproducibility.patch \
> >             file://no-path-adjust.patch \
> >             file://CVE-2026-33412.patch \
> > +           file://CVE-2026-25749.patch \
> >             "
> >
> >  PV .=3D ".1683"
>
>
> --
> Yoann Congal
> Smile ECS
>
>

--0000000000001a8843064f0350aa
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><span class=3D"smart_draft_text">Hi Yoann,<br><br>Thanks =
for the info. I understand it&#39;s too late for kirkstone.<br><br>Regards,=
<br>Hitendra</span></div><br><div class=3D"gmail_quote gmail_quote_containe=
r"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, 9 Apr, 2026, 2:00=E2=80=AF=
pm Yoann Congal, &lt;<a href=3D"mailto:yoann.congal@smile.fr">yoann.congal@=
smile.fr</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On Wed Apr =
8, 2026 at 1:26 PM CEST, Hitendra Prajapati via <a href=3D"http://lists.ope=
nembedded.org" rel=3D"noreferrer noreferrer" target=3D"_blank">lists.openem=
bedded.org</a> wrote:<br>
&gt; Pick patch from [1] also mentioned in [2]<br>
&gt;<br>
&gt; [1] <a href=3D"https://github.com/vim/vim/commit/0714b15940b245108e6e9=
d7aa2260dd849a26fa9" rel=3D"noreferrer noreferrer" target=3D"_blank">https:=
//github.com/vim/vim/commit/0714b15940b245108e6e9d7aa2260dd849a26fa9</a><br=
>
&gt; [2] <a href=3D"https://nvd.nist.gov/vuln/detail/CVE-2026-25749" rel=3D=
"noreferrer noreferrer" target=3D"_blank">https://nvd.nist.gov/vuln/detail/=
CVE-2026-25749</a><br>
&gt;<br>
&gt; Signed-off-by: Hitendra Prajapati &lt;<a href=3D"mailto:hprajapati@mvi=
sta.com" target=3D"_blank" rel=3D"noreferrer">hprajapati@mvista.com</a>&gt;=
<br>
&gt; ---<br>
<br>
Hello,<br>
<br>
I&#39;m sorry but this patch (and the other vim patches sent after this one=
)<br>
is too late to make it into the last kirkstone release.<br>
See: End of kirkstone LTS support<br>
<a href=3D"https://lore.kernel.org/yocto/DH8I3C005I7I.EAFAABGT2FJL@smile.fr=
/T/#u" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lore.kernel.=
org/yocto/DH8I3C005I7I.EAFAABGT2FJL@smile.fr/T/#u</a><br>
<br>
Regards,<br>
<br>
&gt;=C2=A0 .../vim/files/CVE-2026-25749.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 | 64 +++++++++++++++++++<br>
&gt;=C2=A0 meta/recipes-support/vim/vim.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 1 +<br>
&gt;=C2=A0 2 files changed, 65 insertions(+)<br>
&gt;=C2=A0 create mode 100644 meta/recipes-support/vim/files/CVE-2026-25749=
.patch<br>
&gt;<br>
&gt; diff --git a/meta/recipes-support/vim/files/CVE-2026-25749.patch b/met=
a/recipes-support/vim/files/CVE-2026-25749.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..8b04379b9b<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-support/vim/files/CVE-2026-25749.patch<br>
&gt; @@ -0,0 +1,64 @@<br>
&gt; +From e0065a61a42bdff9c75aa18104f8ff546938395f Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Christian Brabandt &lt;<a href=3D"mailto:cb@256bit.org" target=
=3D"_blank" rel=3D"noreferrer">cb@256bit.org</a>&gt;<br>
&gt; +Date: Thu, 5 Feb 2026 18:51:54 +0000<br>
&gt; +Subject: [PATCH] patch 9.1.2132: [security]: buffer-overflow in &#39;=
helpfile&#39;<br>
&gt; + option handling<br>
&gt; +<br>
&gt; +Problem:=C2=A0 [security]: buffer-overflow in &#39;helpfile&#39; opti=
on handling by<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 using strcpy without bound checks =
(Rahul Hoysala)<br>
&gt; +Solution: Limit strncpy to the length of the buffer (MAXPATHL)<br>
&gt; +<br>
&gt; +Github Advisory:<br>
&gt; +<a href=3D"https://github.com/vim/vim/security/advisories/GHSA-5w93-4=
g67-mm43" rel=3D"noreferrer noreferrer" target=3D"_blank">https://github.co=
m/vim/vim/security/advisories/GHSA-5w93-4g67-mm43</a><br>
&gt; +<br>
&gt; +CVE: CVE-2026-25749<br>
&gt; +Upstream-Status: Backport [<a href=3D"https://github.com/vim/vim/comm=
it/0714b15940b245108e6e9d7aa2260dd849a26fa9" rel=3D"noreferrer noreferrer" =
target=3D"_blank">https://github.com/vim/vim/commit/0714b15940b245108e6e9d7=
aa2260dd849a26fa9</a>]<br>
&gt; +<br>
&gt; +Backport Changes:<br>
&gt; +- Excluded changes to src/version.c and runtime/doc/version9.txt<br>
&gt; +=C2=A0 from this backport. This file only tracks upstream version inc=
rements.<br>
&gt; +=C2=A0 We are applying a security fix, not a version upgrade. These c=
hanges<br>
&gt; +=C2=A0 were skipped to maintain current package versioning and avoid =
merge conflicts.<br>
&gt; +<br>
&gt; +Signed-off-by: Christian Brabandt &lt;<a href=3D"mailto:cb@256bit.org=
" target=3D"_blank" rel=3D"noreferrer">cb@256bit.org</a>&gt;<br>
&gt; +(cherry picked from commit 0714b15940b245108e6e9d7aa2260dd849a26fa9)<=
br>
&gt; +Signed-off-by: Anil Dongare &lt;<a href=3D"mailto:adongare@cisco.com"=
 target=3D"_blank" rel=3D"noreferrer">adongare@cisco.com</a>&gt;<br>
&gt; +---<br>
&gt; + src/tag.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0| 2 +-<br>
&gt; + src/testdir/test_help.vim | 9 +++++++++<br>
&gt; + 2 files changed, 10 insertions(+), 1 deletion(-)<br>
&gt; +<br>
&gt; +diff --git a/src/tag.c b/src/tag.c<br>
&gt; +index 6912e8743..a32bbb245 100644<br>
&gt; +--- a/src/tag.c<br>
&gt; ++++ b/src/tag.c<br>
&gt; +@@ -3348,7 +3348,7 @@ get_tagfname(<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (tnp-&gt;tn_hf_idx &gt; tag_fnam=
es.ga_len || *p_hf =3D=3D NUL)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return FAIL;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0++tnp-&gt;tn_hf_idx;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 STRCPY(buf, p_hf);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 vim_strncpy(buf, p_hf, MAXPATHL - 1);<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0STRCPY(gettail(buf), &quot;tags&quo=
t;);<br>
&gt; + #ifdef BACKSLASH_IN_FILENAME<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0slash_adjust(buf);<br>
&gt; +diff --git a/src/testdir/test_help.vim b/src/testdir/test_help.vim<br=
>
&gt; +index dac153d86..f9e4686bb 100644<br>
&gt; +--- a/src/testdir/test_help.vim<br>
&gt; ++++ b/src/testdir/test_help.vim<br>
&gt; +@@ -222,4 +222,13 @@ func Test_helptag_navigation()<br>
&gt; + endfunc<br>
&gt; + <br>
&gt; + <br>
&gt; ++&quot; This caused a buffer overflow<br>
&gt; ++func Test_helpfile_overflow()<br>
&gt; ++=C2=A0 let _helpfile =3D &amp;helpfile<br>
&gt; ++=C2=A0 let &amp;helpfile =3D repeat(&#39;A&#39;, 5000)<br>
&gt; ++=C2=A0 help<br>
&gt; ++=C2=A0 helpclose<br>
&gt; ++=C2=A0 let &amp;helpfile =3D _helpfile<br>
&gt; ++endfunc<br>
&gt; ++<br>
&gt; + &quot; vim: shiftwidth=3D2 sts=3D2 expandtab<br>
&gt; +-- <br>
&gt; +2.43.7<br>
&gt; +<br>
&gt; diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/v=
im/vim.inc<br>
&gt; index fc9b4db055..fa63689ef1 100644<br>
&gt; --- a/meta/recipes-support/vim/vim.inc<br>
&gt; +++ b/meta/recipes-support/vim/vim.inc<br>
&gt; @@ -17,6 +17,7 @@ SRC_URI =3D &quot;git://<a href=3D"http://github.com=
/vim/vim.git;branch=3Dmaster;protocol=3Dhttps" rel=3D"noreferrer noreferrer=
" target=3D"_blank">github.com/vim/vim.git;branch=3Dmaster;protocol=3Dhttps=
</a> \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-src-Makefil=
e-improve-reproducibility.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://no-path-adjust.p=
atch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2026-33412.p=
atch \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2026-25749.patch =
\<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 PV .=3D &quot;.1683&quot;<br>
<br>
<br>
-- <br>
Yoann Congal<br>
Smile ECS<br>
<br>
</blockquote></div>

--0000000000001a8843064f0350aa--

