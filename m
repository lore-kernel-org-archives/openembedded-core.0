Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07B8FC5DF97
	for <webhook@archiver.kernel.org>; Wed, 26 Aug 2026 14:51:40 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14334.1787755897909890751
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Aug 2026 07:51:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=HBtolhjy;
 spf=pass (domain: mvista.com, ip: 209.85.208.50, mailfrom: vanusuri@mvista.com)
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6a1a546a6bbso1766996a12.1
        for <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2026 07:51:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787755896; cv=none;
        d=google.com; s=arc-20260327;
        b=SCcAuXPWJW7vE8xFYq0aPVTOwG7tU8jiIJOD36XK1DncbYymyUskhQM0xirQygBdR6
         2V81wVIIYD91ZvV0j+gXPHMKu0GMsI9CdsLwMNmS9BQbKtNRFuJZ5vvApmdbPuTs0dYI
         gq6Q2CytKCK9nZ9hDsHDD5Prs6/YvH7nKokdcjlTiBubWA0QYUWTNmbv6J9zrp6kqDKg
         +6Mx+tRRPWhZYx3OHSXuxbniGMXTrXE7IgoqAOhaOxdr+mJAIY/b0p51y6y8tbqxLVzW
         wru7jWeT1WumfAnm7uMbBOQ8GBIZ1U6i2/3izA9KawUjrtoeSljuIw4lQ3zmv/M//0p/
         LIZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=OtY77A58G9CKi6ffYlFsJ+KTetOj7SqU++jk7kw4Rd8=;
        fh=4jHtUY8FkbZN51VanG3eLeQMWMUYb71rMM5Tl3SixN4=;
        b=UIC18A1EF93lo2FUMo8S8nisGAqkolDvrni5ufmMTDKKHxcGFjOZcCMpv6TdiXtXnQ
         2lgT4pDMq/i6DPMTbhgh4dCZuRVEYActK+BykgXeQJZo/U8SH0ojT7YqeR27LBnthhET
         3q8sfIkNNyIOgGceSfJcGAF15v7MoZkD5bmHfzJbaTGEzcJyvxoD3VOXAfzeLNsN3GBN
         qPWUV9AkWcOX5Tih0Aki3ryEfCxmprrwnBkD8BI3ScqDCYebjq2GPw4mx0FV9GnNIL0R
         OMBGQTxvVLX0IH10ionV7yNhT/GtBmFz5G0q9K+bYSSF59h8mOnSAAKxc3GlubuhsAbQ
         QOjg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1787755896; x=1788360696; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OtY77A58G9CKi6ffYlFsJ+KTetOj7SqU++jk7kw4Rd8=;
        b=HBtolhjywyWqYCYwTI8/9YSMQ9RR0JBp41biCzedHMdgV/P0JqQAVvCQsgzMhDGz0k
         vLmpcW6xKKOgWytwra3Ee+7rgnRy/jC3yYkqYo2Y/J1RJKgY5Uzt7YfJDHUbLpRR3YAC
         oC89ra/50VwuPadBGKOsAu9jQrTVR0WtzucMc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787755896; x=1788360696;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=OtY77A58G9CKi6ffYlFsJ+KTetOj7SqU++jk7kw4Rd8=;
        b=ecvigdP+xlGk3KJ27sLsNbKqtRZt2ku/CqBxNpNfztc1hAGNv5etj7GoTsLo7qbL7t
         +0OYrZID9BfbgoJIAe8Q1hLp1zWipBJfRCy2oyGMR3tRIRX2q/a0UqEgoFOQD6nRGR07
         ECFAJtIfje8hZ/D6gLKhtLwoETRsqZF7qjxxPDQsyRcul1WvzYGy9PxSgclZYavtA8lm
         naJYYdIjXluhcfo/3VfY+zU1URHypj1EM8nr9LwsRUf/Ul9Bf+5z6XxytQ/PM3TevTc6
         c3udVFQiDUG79kMTgSQ6w5YEBB+hKg45eWRStERPHAWkXiYKt77HlHNOSwwTaxAtAj2H
         ORtQ==
X-Gm-Message-State: AFuF++kSNmY64KkJwX4ttJNbzPnfz63QHb7aqA4MtUOhgmrXZVt53J7c
	c6eGdYcuOv2D0WK71VPMzDchJQrglvPQgaT3i5WlN6xhZ+RWFCFTcCQ2OuxH9G2EQ/BvdGil++1
	DaK5Jyg1dyXyzorD4Y21R067s2OfPUHXFUF4b5OtImg==
X-Gm-Gg: AR+sD10cCmkvCM9kI7gulVoOjVEDx2A0u0dkaKSsGoyx2Cst5uV99wcP40VAsAASSto
	GdPZcUKQacL2UIMsSfMtXNn4Q4vEtCs0KvisL0fDQrKjaR+34IeakZrfbJUtPCOA31GBbklg1F8
	XkZatOH7g35omrSlvspLH3Pl1UQ6q6QYoLCWXyqhFesi7MNjrS/6lDX7cckgFakjyj1XEILd0+H
	RvbIIQEdvch/gEY21s0DHvrSeccdy7JHi3nVzws6Cg/AdOlU1jW//G08or/L5pxl41vKIo7sErn
	hQvnlR4JRGDG5pelThaexNEY0AUp2eDVCssJ/GbvpHGv/Ooaxwy2xY8ZU2xsxFO/oOig9C9iZRY
	1x2U=
X-Received: by 2002:a05:6402:550f:b0:6a1:fb46:c405 with SMTP id
 4fb4d7f45d1cf-6a5df64d30emr10090305a12.14.1787755895848; Wed, 26 Aug 2026
 07:51:35 -0700 (PDT)
MIME-Version: 1.0
References: <20260723092354.54697-1-sdoshi@mvista.com> <20260723092354.54697-13-sdoshi@mvista.com>
In-Reply-To: <20260723092354.54697-13-sdoshi@mvista.com>
From: Vijay Anusuri <vanusuri@mvista.com>
Date: Wed, 26 Aug 2026 20:21:22 +0530
X-Gm-Features: AcwNN1Vf3siIsZ0vVMbQgmJCn30hslhcAGVgMevW0GefMwWzj3IEk6J2USwoM2g
Message-ID: <CANQUz18xEMFKxx9QpXjfBomaJkzJWyj1nkF_vp96fna=dG7LmA@mail.gmail.com>
Subject: Re: [OE-core][scarthgap][PATCHv2 13/13] vim: Security Fix for CVE-2026-59858
To: sdoshi@mvista.com, Fabien Thomas <fabien.thomas@smile.fr>, 
	Yoann Congal <yoann.congal@smile.fr>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000001e1efe0659f45b30"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2026 14:51:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244401

--0000000000001e1efe0659f45b30
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Team,

Any update on this?

Thanks & Regards,
Vijay

On Thu, Jul 23, 2026 at 2:56=E2=80=AFPM Siddharth Doshi via lists.openembed=
ded.org
<sdoshi=3Dmvista.com@lists.openembedded.org> wrote:

> From: Siddharth Doshi <sdoshi@mvista.com>
>
> Picking patch as per [1], and same patch is mentioned in [2]
>
> References:
> [1] https://nvd.nist.gov/vuln/detail/CVE-2026-59858
> [2] https://security-tracker.debian.org/tracker/CVE-2026-59858
>
> Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
> ---
>  .../vim/files/CVE-2026-59858.patch            | 134 ++++++++++++++++++
>  meta/recipes-support/vim/vim.inc              |   1 +
>  2 files changed, 135 insertions(+)
>  create mode 100644 meta/recipes-support/vim/files/CVE-2026-59858.patch
>
> diff --git a/meta/recipes-support/vim/files/CVE-2026-59858.patch
> b/meta/recipes-support/vim/files/CVE-2026-59858.patch
> new file mode 100644
> index 0000000000..0b754ec2d3
> --- /dev/null
> +++ b/meta/recipes-support/vim/files/CVE-2026-59858.patch
> @@ -0,0 +1,134 @@
> +From 6b611b0d15603c52ebdad17172b0232b4f65704e Mon Sep 17 00:00:00 2001
> +From: Hirohito Higashi <h.east.727@gmail.com>
> +Date: Fri, 26 Jun 2026 15:41:24 +0900
> +Subject: [PATCH] patch 9.2.0735: [security]: arbitrary Ex command
> execution
> + during C omni-completion
> +
> +Problem:  [security]: With C omni-completion, a crafted tags file can
> execute
> +          arbitrary Ex commands when completing a struct/union member
> +          (cipher-creator)
> +Solution: Escape the type field before inserting it into the :vimgrep
> +          pattern so it cannot close the pattern and start a new command
> +          (Hirohito Higashi).
> +
> +Github Security Advisory:
> +https://github.com/vim/vim/security/advisories/GHSA-mf92-v4xw-j45x
> +
> +Co-Authored-By: Claude Opus 4.8 (1M context) <noreply@anthropic.com>"
> +Signed-off-by: Hirohito Higashi <h.east.727@gmail.com>
> +Signed-off-by: Christian Brabandt <cb@256bit.org>
> +
> +Upstream-Status: Backport [
> https://github.com/vim/vim/commit/6b611b0d15603c52ebdad17172b0232b4f65704=
e
> ]
> +CVE: CVE-2026-59858
> +Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
> +---
> + runtime/autoload/ccomplete.vim        |  2 +-
> + src/testdir/Make_all.mak              |  2 +
> + src/testdir/test_plugin_ccomplete.vim | 62 +++++++++++++++++++++++++++
> + 3 files changed, 65 insertions(+), 1 deletion(-)
> + create mode 100644 src/testdir/test_plugin_ccomplete.vim
> +
> +diff --git a/runtime/autoload/ccomplete.vim
> b/runtime/autoload/ccomplete.vim
> +index cb4bb2c167..248d6f2e60 100644
> +--- a/runtime/autoload/ccomplete.vim
> ++++ b/runtime/autoload/ccomplete.vim
> +@@ -593,7 +593,7 @@ def StructMembers( # {{{1
> +         return []
> +       endif
> +       execute 'silent! keepjumps noautocmd '
> +-        .. n .. 'vimgrep ' .. '/\t' .. typename .. '\(\t\|$\)/j '
> ++        .. n .. 'vimgrep ' .. '/\t' .. escape(typename, '/\') ..
> '\(\t\|$\)/j '
> +         .. fnames
> +
> +       qflist =3D getqflist()
> +diff --git a/src/testdir/Make_all.mak b/src/testdir/Make_all.mak
> +index 7d57b2e727..681e9b3b2a 100644
> +--- a/src/testdir/Make_all.mak
> ++++ b/src/testdir/Make_all.mak
> +@@ -242,6 +242,7 @@ NEW_TESTS =3D \
> +       test_partial \
> +       test_paste \
> +       test_perl \
> ++      test_plugin_ccomplete \
> +       test_plugin_comment \
> +       test_plugin_glvs \
> +       test_plugin_helptoc \
> +@@ -516,6 +517,7 @@ NEW_TESTS_RES =3D \
> +       test_partial.res \
> +       test_paste.res \
> +       test_perl.res \
> ++      test_plugin_ccomplete.res \
> +       test_plugin_comment.res \
> +       test_plugin_glvs.res \
> +       test_plugin_helptoc.res \
> +diff --git a/src/testdir/test_plugin_ccomplete.vim
> b/src/testdir/test_plugin_ccomplete.vim
> +new file mode 100644
> +index 0000000000..a635bd50bd
> +--- /dev/null
> ++++ b/src/testdir/test_plugin_ccomplete.vim
> +@@ -0,0 +1,62 @@
> ++" Tests for the C omni-completion plugin
> (runtime/autoload/ccomplete.vim).
> ++
> ++func s:WriteTags(lines)
> ++  " Mark unsorted so lookup is a linear scan regardless of entry order.
> ++  let tagsfile =3D tempname()
> ++  call writefile(["!_TAG_FILE_SORTED\t0\t/0/"] + a:lines, tagsfile)
> ++  return tagsfile
> ++endfunc
> ++
> ++" A crafted typeref field is interpolated into the :vimgrep pattern in
> ++" StructMembers().  Without escaping, "/" closes the pattern and "|"
> starts a
> ++" new Ex command, so the field runs as an Ex command during completion.
> ++func Test_ccomplete_no_exec_via_typeref()
> ++  unlet! g:ccomplete_injected
> ++  let tagsfile =3D s:WriteTags([
> ++        \ "myvar\tmain.c\t/^x$/;\"\tv\ttyperef:x/|let
> g:ccomplete_injected =3D 1|\"",
> ++        \ ])
> ++
> ++  let save_tags =3D &tags
> ++  let &tags =3D tagsfile
> ++
> ++  new
> ++  call ccomplete#Complete(1, '')
> ++  call ccomplete#Complete(0, 'myvar.x')
> ++
> ++  call assert_false(exists('g:ccomplete_injected'),
> ++        \ 'typeref field was executed as an Ex command during
> omni-completion')
> ++
> ++  bwipe!
> ++  let &tags =3D save_tags
> ++  unlet! g:ccomplete_injected
> ++endfunc
> ++
> ++" A legitimate typeref must still drive struct-member completion:
> escaping the
> ++" field value must not break the normal path.
> ++func Test_ccomplete_typeref_completion_still_works()
> ++  let tagsfile =3D s:WriteTags([
> ++        \ "myvar\tmain.c\t/^x$/;\"\tv\ttyperef:struct:mystruct",
> ++        \ "alpha\tmain.c\t/^x$/;\"\tm\tstruct:mystruct",
> ++        \ "beta\tmain.c\t/^x$/;\"\tm\tstruct:mystruct",
> ++        \ ])
> ++
> ++  let save_tags =3D &tags
> ++  let &tags =3D tagsfile
> ++
> ++  new
> ++  call ccomplete#Complete(1, '')
> ++  let items =3D ccomplete#Complete(0, 'myvar.')
> ++
> ++  call assert_equal(type([]), type(items),
> ++        \ 'ccomplete#Complete did not return a list')
> ++  let names =3D map(copy(items), 'v:val.word')
> ++  call assert_true(index(names, 'alpha') >=3D 0,
> ++        \ 'struct member "alpha" missing from completion: ' .
> string(names))
> ++  call assert_true(index(names, 'beta') >=3D 0,
> ++        \ 'struct member "beta" missing from completion: ' .
> string(names))
> ++
> ++  bwipe!
> ++  let &tags =3D save_tags
> ++endfunc
> ++
> ++" vim: shiftwidth=3D2 sts=3D2 expandtab
> +--
> +2.44.4
> +
> diff --git a/meta/recipes-support/vim/vim.inc
> b/meta/recipes-support/vim/vim.inc
> index a484a5c840..6ef9745b57 100644
> --- a/meta/recipes-support/vim/vim.inc
> +++ b/meta/recipes-support/vim/vim.inc
> @@ -48,6 +48,7 @@ SRC_URI =3D "git://
> github.com/vim/vim.git;branch=3Dmaster;protocol=3Dhttps \
>             file://CVE-2026-57455.patch \
>             file://CVE-2026-59856.patch \
>             file://CVE-2026-59857.patch \
> +           file://CVE-2026-59858.patch \
>             "
>
>  PV .=3D ".1683"
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#241817):
> https://lists.openembedded.org/g/openembedded-core/message/241817
> Mute This Topic: https://lists.openembedded.org/mt/120408052/7301997
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> vanusuri@mvista.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000001e1efe0659f45b30
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div><div>Hi Team,<br><br></div>Any update on=C2=A0th=
is?<br><br></div>Thanks &amp;=C2=A0Regards,<br></div>Vijay</div><br><div cl=
ass=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_a=
ttr">On Thu, Jul 23, 2026 at 2:56=E2=80=AFPM Siddharth Doshi via <a href=3D=
"http://lists.openembedded.org">lists.openembedded.org</a> &lt;sdoshi=3D<a =
href=3D"mailto:mvista.com@lists.openembedded.org">mvista.com@lists.openembe=
dded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">From: Siddharth Doshi &lt;<a href=3D"mailto:sdoshi@mvista.com" targ=
et=3D"_blank">sdoshi@mvista.com</a>&gt;<br>
<br>
Picking patch as per [1], and same patch is mentioned in [2]<br>
<br>
References:<br>
[1] <a href=3D"https://nvd.nist.gov/vuln/detail/CVE-2026-59858" rel=3D"nore=
ferrer" target=3D"_blank">https://nvd.nist.gov/vuln/detail/CVE-2026-59858</=
a><br>
[2] <a href=3D"https://security-tracker.debian.org/tracker/CVE-2026-59858" =
rel=3D"noreferrer" target=3D"_blank">https://security-tracker.debian.org/tr=
acker/CVE-2026-59858</a><br>
<br>
Signed-off-by: Siddharth Doshi &lt;<a href=3D"mailto:sdoshi@mvista.com" tar=
get=3D"_blank">sdoshi@mvista.com</a>&gt;<br>
---<br>
=C2=A0.../vim/files/CVE-2026-59858.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 | 134 ++++++++++++++++++<br>
=C2=A0meta/recipes-support/vim/vim.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 =C2=A01 +<br>
=C2=A02 files changed, 135 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-support/vim/files/CVE-2026-59858.patc=
h<br>
<br>
diff --git a/meta/recipes-support/vim/files/CVE-2026-59858.patch b/meta/rec=
ipes-support/vim/files/CVE-2026-59858.patch<br>
new file mode 100644<br>
index 0000000000..0b754ec2d3<br>
--- /dev/null<br>
+++ b/meta/recipes-support/vim/files/CVE-2026-59858.patch<br>
@@ -0,0 +1,134 @@<br>
+From 6b611b0d15603c52ebdad17172b0232b4f65704e Mon Sep 17 00:00:00 2001<br>
+From: Hirohito Higashi &lt;<a href=3D"mailto:h.east.727@gmail.com" target=
=3D"_blank">h.east.727@gmail.com</a>&gt;<br>
+Date: Fri, 26 Jun 2026 15:41:24 +0900<br>
+Subject: [PATCH] patch 9.2.0735: [security]: arbitrary Ex command executio=
n<br>
+ during C omni-completion<br>
+<br>
+Problem:=C2=A0 [security]: With C omni-completion, a crafted tags file can=
 execute<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 arbitrary Ex commands when completing a=
 struct/union member<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (cipher-creator)<br>
+Solution: Escape the type field before inserting it into the :vimgrep<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pattern so it cannot close the pattern =
and start a new command<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (Hirohito Higashi).<br>
+<br>
+Github Security Advisory:<br>
+<a href=3D"https://github.com/vim/vim/security/advisories/GHSA-mf92-v4xw-j=
45x" rel=3D"noreferrer" target=3D"_blank">https://github.com/vim/vim/securi=
ty/advisories/GHSA-mf92-v4xw-j45x</a><br>
+<br>
+Co-Authored-By: Claude Opus 4.8 (1M context) &lt;<a href=3D"mailto:noreply=
@anthropic.com" target=3D"_blank">noreply@anthropic.com</a>&gt;&quot;<br>
+Signed-off-by: Hirohito Higashi &lt;<a href=3D"mailto:h.east.727@gmail.com=
" target=3D"_blank">h.east.727@gmail.com</a>&gt;<br>
+Signed-off-by: Christian Brabandt &lt;<a href=3D"mailto:cb@256bit.org" tar=
get=3D"_blank">cb@256bit.org</a>&gt;<br>
+<br>
+Upstream-Status: Backport [<a href=3D"https://github.com/vim/vim/commit/6b=
611b0d15603c52ebdad17172b0232b4f65704e" rel=3D"noreferrer" target=3D"_blank=
">https://github.com/vim/vim/commit/6b611b0d15603c52ebdad17172b0232b4f65704=
e</a>]<br>
+CVE: CVE-2026-59858<br>
+Signed-off-by: Siddharth Doshi &lt;<a href=3D"mailto:sdoshi@mvista.com" ta=
rget=3D"_blank">sdoshi@mvista.com</a>&gt;<br>
+---<br>
+ runtime/autoload/ccomplete.vim=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 +-<br=
>
+ src/testdir/Make_all.mak=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
|=C2=A0 2 +<br>
+ src/testdir/test_plugin_ccomplete.vim | 62 +++++++++++++++++++++++++++<br=
>
+ 3 files changed, 65 insertions(+), 1 deletion(-)<br>
+ create mode 100644 src/testdir/test_plugin_ccomplete.vim<br>
+<br>
+diff --git a/runtime/autoload/ccomplete.vim b/runtime/autoload/ccomplete.v=
im<br>
+index cb4bb2c167..248d6f2e60 100644<br>
+--- a/runtime/autoload/ccomplete.vim<br>
++++ b/runtime/autoload/ccomplete.vim<br>
+@@ -593,7 +593,7 @@ def StructMembers( # {{{1<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return []<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0endif<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0execute &#39;silent! keepjumps noautocmd &#39;<=
br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 .. n .. &#39;vimgrep &#39; .. &#39;/\t&#39; .=
. typename .. &#39;\(\t\|$\)/j &#39;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 .. n .. &#39;vimgrep &#39; .. &#39;/\t&#39; .=
. escape(typename, &#39;/\&#39;) .. &#39;\(\t\|$\)/j &#39;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.. fnames<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0qflist =3D getqflist()<br>
+diff --git a/src/testdir/Make_all.mak b/src/testdir/Make_all.mak<br>
+index 7d57b2e727..681e9b3b2a 100644<br>
+--- a/src/testdir/Make_all.mak<br>
++++ b/src/testdir/Make_all.mak<br>
+@@ -242,6 +242,7 @@ NEW_TESTS =3D \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0test_partial \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0test_paste \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0test_perl \<br>
++=C2=A0 =C2=A0 =C2=A0 test_plugin_ccomplete \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0test_plugin_comment \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0test_plugin_glvs \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0test_plugin_helptoc \<br>
+@@ -516,6 +517,7 @@ NEW_TESTS_RES =3D \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0test_partial.res \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0test_paste.res \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0test_perl.res \<br>
++=C2=A0 =C2=A0 =C2=A0 test_plugin_ccomplete.res \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0test_plugin_comment.res \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0test_plugin_glvs.res \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0test_plugin_helptoc.res \<br>
+diff --git a/src/testdir/test_plugin_ccomplete.vim b/src/testdir/test_plug=
in_ccomplete.vim<br>
+new file mode 100644<br>
+index 0000000000..a635bd50bd<br>
+--- /dev/null<br>
++++ b/src/testdir/test_plugin_ccomplete.vim<br>
+@@ -0,0 +1,62 @@<br>
++&quot; Tests for the C omni-completion plugin (runtime/autoload/ccomplete=
.vim).<br>
++<br>
++func s:WriteTags(lines)<br>
++=C2=A0 &quot; Mark unsorted so lookup is a linear scan regardless of entr=
y order.<br>
++=C2=A0 let tagsfile =3D tempname()<br>
++=C2=A0 call writefile([&quot;!_TAG_FILE_SORTED\t0\t/0/&quot;] + a:lines, =
tagsfile)<br>
++=C2=A0 return tagsfile<br>
++endfunc<br>
++<br>
++&quot; A crafted typeref field is interpolated into the :vimgrep pattern =
in<br>
++&quot; StructMembers().=C2=A0 Without escaping, &quot;/&quot; closes the =
pattern and &quot;|&quot; starts a<br>
++&quot; new Ex command, so the field runs as an Ex command during completi=
on.<br>
++func Test_ccomplete_no_exec_via_typeref()<br>
++=C2=A0 unlet! g:ccomplete_injected<br>
++=C2=A0 let tagsfile =3D s:WriteTags([<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 \ &quot;myvar\tmain.c\t/^x$/;\&quot;\tv\ttype=
ref:x/|let g:ccomplete_injected =3D 1|\&quot;&quot;,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 \ ])<br>
++<br>
++=C2=A0 let save_tags =3D &amp;tags<br>
++=C2=A0 let &amp;tags =3D tagsfile<br>
++<br>
++=C2=A0 new<br>
++=C2=A0 call ccomplete#Complete(1, &#39;&#39;)<br>
++=C2=A0 call ccomplete#Complete(0, &#39;myvar.x&#39;)<br>
++<br>
++=C2=A0 call assert_false(exists(&#39;g:ccomplete_injected&#39;),<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 \ &#39;typeref field was executed as an Ex co=
mmand during omni-completion&#39;)<br>
++<br>
++=C2=A0 bwipe!<br>
++=C2=A0 let &amp;tags =3D save_tags<br>
++=C2=A0 unlet! g:ccomplete_injected<br>
++endfunc<br>
++<br>
++&quot; A legitimate typeref must still drive struct-member completion: es=
caping the<br>
++&quot; field value must not break the normal path.<br>
++func Test_ccomplete_typeref_completion_still_works()<br>
++=C2=A0 let tagsfile =3D s:WriteTags([<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 \ &quot;myvar\tmain.c\t/^x$/;\&quot;\tv\ttype=
ref:struct:mystruct&quot;,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 \ &quot;alpha\tmain.c\t/^x$/;\&quot;\tm\tstru=
ct:mystruct&quot;,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 \ &quot;beta\tmain.c\t/^x$/;\&quot;\tm\tstruc=
t:mystruct&quot;,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 \ ])<br>
++<br>
++=C2=A0 let save_tags =3D &amp;tags<br>
++=C2=A0 let &amp;tags =3D tagsfile<br>
++<br>
++=C2=A0 new<br>
++=C2=A0 call ccomplete#Complete(1, &#39;&#39;)<br>
++=C2=A0 let items =3D ccomplete#Complete(0, &#39;myvar.&#39;)<br>
++<br>
++=C2=A0 call assert_equal(type([]), type(items),<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 \ &#39;ccomplete#Complete did not return a li=
st&#39;)<br>
++=C2=A0 let names =3D map(copy(items), &#39;v:val.word&#39;)<br>
++=C2=A0 call assert_true(index(names, &#39;alpha&#39;) &gt;=3D 0,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 \ &#39;struct member &quot;alpha&quot; missin=
g from completion: &#39; . string(names))<br>
++=C2=A0 call assert_true(index(names, &#39;beta&#39;) &gt;=3D 0,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 \ &#39;struct member &quot;beta&quot; missing=
 from completion: &#39; . string(names))<br>
++<br>
++=C2=A0 bwipe!<br>
++=C2=A0 let &amp;tags =3D save_tags<br>
++endfunc<br>
++<br>
++&quot; vim: shiftwidth=3D2 sts=3D2 expandtab<br>
+-- <br>
+2.44.4<br>
+<br>
diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vi=
m.inc<br>
index a484a5c840..6ef9745b57 100644<br>
--- a/meta/recipes-support/vim/vim.inc<br>
+++ b/meta/recipes-support/vim/vim.inc<br>
@@ -48,6 +48,7 @@ SRC_URI =3D &quot;git://<a href=3D"http://github.com/vim/=
vim.git;branch=3Dmaster;protocol=3Dhttps" rel=3D"noreferrer" target=3D"_bla=
nk">github.com/vim/vim.git;branch=3Dmaster;protocol=3Dhttps</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://CVE-2026-57455.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://CVE-2026-59856.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://CVE-2026-59857.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2026-59858.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
<br>
=C2=A0PV .=3D &quot;.1683&quot;<br>
-- <br>
2.34.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#241817): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/241817" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/241817</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/120408052/730=
1997" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/120408052/7301997</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:vanusuri@mvista.com" targe=
t=3D"_blank">vanusuri@mvista.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--0000000000001e1efe0659f45b30--

