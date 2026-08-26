Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 061F8C61DBD
	for <webhook@archiver.kernel.org>; Wed, 26 Aug 2026 14:56:00 +0000 (UTC)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14417.1787756150724085955
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Aug 2026 07:55:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=cgNzYIri;
 spf=pass (domain: mvista.com, ip: 209.85.208.41, mailfrom: vanusuri@mvista.com)
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6a5f1d0af69so713430a12.0
        for <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2026 07:55:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787756149; cv=none;
        d=google.com; s=arc-20260327;
        b=jt4ir3/Gj89SFKlL+yElzFpL0+psu1WAN/5aXJQpRoLkPKKgpi3qnYhLOuH93QMFqw
         R2BuzEdtPDT9y9XliwVTDhrNHPTvhKCyvrbJnHeNbq3GsgIxI4aPuidiG3jOTfmo8qMu
         qeJlJj1iwhXIDKOLHwo7eoLsW3tugnN0z7z92HhcQB6nYdQ/d1ESzNYSl8BD4jVTg8Iu
         krW/eaiKngvKwhgqnlFVqMxpooQ8udBg6o1Gjf8NKzQQYRivFcKygwlxnv3+K2h0rv/9
         iIm2iuCnEt5mp04dZV3JXogtS3CSX9vURLmFciKfBSqtUZ9YH7B9ojHR+igNJ00TULtE
         0Vpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=e3qJN0vnGDgNZ2rb0A5FpR/YkUMkQbcpQJtImL/Qr5s=;
        fh=/vFUMe0xD1Sr2+UhesJzT/dwMLfiLwFA72dDU9/3RVE=;
        b=dZQ/11Oqo8CSpPE9Eyje3J1k+KGyECk9mYsOJhvzAjgkNcjtUpYtCAeqtdKmlH5AmX
         +QlWpAz7+93l1krgzhNPlPS+Kf/X3gVZ/DseaQJLKVMxSVH06jxPbdW0p9gvaLPhel3e
         7AG2rGeaMsdH6/O9WboPv15QyGElO0Te1daiG8dKVK8tlD75ym5Wxpk/B96gmluwvd3v
         Xn6OzPBVVCMiVl5+87OL4+mEU6AWeOy3adlAsXaYmrUYOMP8ix0y6K2sL91b98jwIKDg
         0Cj3MKs5Wf/Ml7Eu/gDI7UAzDZuc1vL/dXZ9ykq5bp3ofxPevZ73FYN5SldZxr0DpVBJ
         ojjA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1787756149; x=1788360949; darn=lists.openembedded.org;
        h=content-type:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=e3qJN0vnGDgNZ2rb0A5FpR/YkUMkQbcpQJtImL/Qr5s=;
        b=cgNzYIriW38poPLm2PpwptQAo5n+I1/ajbgyA8t1AokOiOlQCwtDDRq0xI2PX+5vXr
         U/9ajz8YAT1cFGOSUSlJvZOl1kJJ/Fixs0xa+44iEjZmG4dyxYq64gh9xRDHV96pM6ar
         D2oB6OV8RAn9PMmB9kt4N2cKjnTLv8Fa5esy0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787756149; x=1788360949;
        h=content-type:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=e3qJN0vnGDgNZ2rb0A5FpR/YkUMkQbcpQJtImL/Qr5s=;
        b=R880DcYWF0aGM5CJpBMhM+JdTTo8vLMPZ318Ny5YiZbKcgd6pE2DqBGqv39DxXPpqv
         Z8u6+cB8NC2g8c+b7HcA160l6+w4PeC3ecBaWpc4GaCJsZw0yXqWc6H7kLLRcFi+oik3
         vU49//NqJ+68bWMIOtQnl1kCS3Lf4Kkd+E5loWenXRJz0NK2XmQhtHNsNcudxb/BI3s7
         EtKBeNONzsSUfKlp4l/T8+otzTeJXF7po3vK05UHMUZmoA0r7qJVgAUN3+TsYfr5XgEp
         VOmSVXO/WiAsX03IpVWOVxEtb/Vf1tWhfUF85RRk1DfrxaT8lUZwvTXr/wIReRjFs7Zn
         tD3w==
X-Gm-Message-State: AFuF++mE5UD+y7aZvoCcMXR8R6kIJ0XEb2A4kITUpL/1+WwPloQrpBj3
	Ockq6e2goTU6ILEjqO/BxbqXIzlU3jgTH3GBcfGfJYlKrDi9zn69I1AVnzkumEAcOFDB0RBERJh
	EcdkAK83dSf94HxnBsn9VMtpxuNv/Rj07AgXvGAUWJrRpxC6nEc1A
X-Gm-Gg: AR+sD106ZAckRbjrziB1uKqgvLIduPSSsZfQ+rSqm6Mj4TT02cQIiofLhudu5Vzz8Sg
	ykGDFDfnvZnRAbEW6Dgm3H6U2NTVgDJvV7J8E5zQ6k6xo98KeF0fqGpaDIaRXNNLwCsyXRbcYsU
	s210ukaD/uVsYFUvcKx1Pr9dcpVx8m5hs7pqldCYaV2ZSaBN6QyDU3ywUmSTDbUGT76y5K7nTjI
	w5veofvpDr8WnJrNltb11Qvmg1I+shQvHPs4QBquR3qHZ8AXfuWtB/8He8K3f8bBafmDXT0trNA
	kb4kSNRT1kvZsFookWsrU8l0tdU3G3dLqjg1V3Q0jyALXTmMox0TrCE+NqC1kbbtBRejuGl0Bv7
	InBU=
X-Received: by 2002:a17:907:6d17:b0:c21:72b:dec0 with SMTP id
 a640c23a62f3a-c250bb7e1c6mr811425366b.5.1787756148672; Wed, 26 Aug 2026
 07:55:48 -0700 (PDT)
MIME-Version: 1.0
References: <20260722123336.587556-1-vanusuri@mvista.com> <20260722123336.587556-10-vanusuri@mvista.com>
In-Reply-To: <20260722123336.587556-10-vanusuri@mvista.com>
From: Vijay Anusuri <vanusuri@mvista.com>
Date: Wed, 26 Aug 2026 20:25:36 +0530
X-Gm-Features: AcwNN1UT5ln5iPZ_LA0bMHF9DCvX6XHRdVBKzxqEiVLsTcbme762sQucQdBBHho
Message-ID: <CANQUz188VHSccnka7WW3zvA7e7kCu4ZPF+Jeutis3mk94Hfrzw@mail.gmail.com>
Subject: Re: [OE-core][wrynose][patch 10/10] vim: Fix CVE-2026-59858
To: openembedded-core@lists.openembedded.org, 
	Yoann Congal <yoann.congal@smile.fr>, Fabien Thomas <fabien.thomas@smile.fr>
Content-Type: multipart/alternative; boundary="0000000000002fdae20659f46a94"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2026 14:56:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244402

--0000000000002fdae20659f46a94
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Team,

Any update on this?

Thanks & Regards,
Vijay

On Wed, Jul 22, 2026 at 6:04=E2=80=AFPM Vijay Anusuri <vanusuri@mvista.com>=
 wrote:

> Pick patch per [1].
>
> [1] https://nvd.nist.gov/vuln/detail/CVE-2026-59858
> [2] https://security-tracker.debian.org/tracker/CVE-2026-59858
>
> Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> ---
>  .../vim/files/CVE-2026-59858.patch            | 134 ++++++++++++++++++
>  meta/recipes-support/vim/vim.inc              |   1 +
>  2 files changed, 135 insertions(+)
>  create mode 100644 meta/recipes-support/vim/files/CVE-2026-59858.patch
>
> diff --git a/meta/recipes-support/vim/files/CVE-2026-59858.patch
> b/meta/recipes-support/vim/files/CVE-2026-59858.patch
> new file mode 100644
> index 0000000000..a2b903be04
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
> +Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> +---
> + runtime/autoload/ccomplete.vim        |  2 +-
> + src/testdir/Make_all.mak              |  2 +
> + src/testdir/test_plugin_ccomplete.vim | 62 +++++++++++++++++++++++++++
> + 3 files changed, 65 insertions(+), 1 deletion(-)
> + create mode 100644 src/testdir/test_plugin_ccomplete.vim
> +
> +diff --git a/runtime/autoload/ccomplete.vim
> b/runtime/autoload/ccomplete.vim
> +index 51237be98b..dc3388b524 100644
> +--- a/runtime/autoload/ccomplete.vim
> ++++ b/runtime/autoload/ccomplete.vim
> +@@ -600,7 +600,7 @@ def StructMembers( # {{{1
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
> +index b5735b6c3c..0cf2c41102 100644
> +--- a/src/testdir/Make_all.mak
> ++++ b/src/testdir/Make_all.mak
> +@@ -243,6 +243,7 @@ NEW_TESTS =3D \
> +       test_partial \
> +       test_paste \
> +       test_perl \
> ++      test_plugin_ccomplete \
> +       test_plugin_comment \
> +       test_plugin_glvs \
> +       test_plugin_helpcurwin \
> +@@ -523,6 +524,7 @@ NEW_TESTS_RES =3D \
> +       test_partial.res \
> +       test_paste.res \
> +       test_perl.res \
> ++      test_plugin_ccomplete.res \
> +       test_plugin_comment.res \
> +       test_plugin_glvs.res \
> +       test_plugin_helpcurwin.res \
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
> +2.43.0
> +
> diff --git a/meta/recipes-support/vim/vim.inc
> b/meta/recipes-support/vim/vim.inc
> index ab7564c3b6..0642393db3 100644
> --- a/meta/recipes-support/vim/vim.inc
> +++ b/meta/recipes-support/vim/vim.inc
> @@ -32,6 +32,7 @@ SRC_URI =3D "git://
> github.com/vim/vim.git;branch=3Dmaster;protocol=3Dhttps;tag=3Dv${PV}
> <http://github.com/vim/vim.git;branch=3Dmaster;protocol=3Dhttps;tag=3Dv$%=
7BPV%7D>
>             file://CVE-2026-57456.patch \
>             file://CVE-2026-59856.patch \
>             file://CVE-2026-59857.patch \
> +           file://CVE-2026-59858.patch \
>             "
>
>  PV .=3D ".0340"
> --
> 2.43.0
>
>

--0000000000002fdae20659f46a94
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div><div>Hi Team,<br><br></div>Any update=C2=A0on th=
is?<br><br></div>Thanks &amp;=C2=A0Regards,<br></div>Vijay</div><br><div cl=
ass=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_a=
ttr">On Wed, Jul 22, 2026 at 6:04=E2=80=AFPM Vijay Anusuri &lt;<a href=3D"m=
ailto:vanusuri@mvista.com">vanusuri@mvista.com</a>&gt; wrote:<br></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex">Pick patch per [1].<br>
<br>
[1] <a href=3D"https://nvd.nist.gov/vuln/detail/CVE-2026-59858" rel=3D"nore=
ferrer" target=3D"_blank">https://nvd.nist.gov/vuln/detail/CVE-2026-59858</=
a><br>
[2] <a href=3D"https://security-tracker.debian.org/tracker/CVE-2026-59858" =
rel=3D"noreferrer" target=3D"_blank">https://security-tracker.debian.org/tr=
acker/CVE-2026-59858</a><br>
<br>
Signed-off-by: Vijay Anusuri &lt;<a href=3D"mailto:vanusuri@mvista.com" tar=
get=3D"_blank">vanusuri@mvista.com</a>&gt;<br>
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
index 0000000000..a2b903be04<br>
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
+Signed-off-by: Vijay Anusuri &lt;<a href=3D"mailto:vanusuri@mvista.com" ta=
rget=3D"_blank">vanusuri@mvista.com</a>&gt;<br>
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
+index 51237be98b..dc3388b524 100644<br>
+--- a/runtime/autoload/ccomplete.vim<br>
++++ b/runtime/autoload/ccomplete.vim<br>
+@@ -600,7 +600,7 @@ def StructMembers( # {{{1<br>
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
+index b5735b6c3c..0cf2c41102 100644<br>
+--- a/src/testdir/Make_all.mak<br>
++++ b/src/testdir/Make_all.mak<br>
+@@ -243,6 +243,7 @@ NEW_TESTS =3D \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0test_partial \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0test_paste \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0test_perl \<br>
++=C2=A0 =C2=A0 =C2=A0 test_plugin_ccomplete \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0test_plugin_comment \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0test_plugin_glvs \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0test_plugin_helpcurwin \<br>
+@@ -523,6 +524,7 @@ NEW_TESTS_RES =3D \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0test_partial.res \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0test_paste.res \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0test_perl.res \<br>
++=C2=A0 =C2=A0 =C2=A0 test_plugin_ccomplete.res \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0test_plugin_comment.res \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0test_plugin_glvs.res \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0test_plugin_helpcurwin.res \<br>
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
+2.43.0<br>
+<br>
diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vi=
m.inc<br>
index ab7564c3b6..0642393db3 100644<br>
--- a/meta/recipes-support/vim/vim.inc<br>
+++ b/meta/recipes-support/vim/vim.inc<br>
@@ -32,6 +32,7 @@ SRC_URI =3D &quot;git://<a href=3D"http://github.com/vim/=
vim.git;branch=3Dmaster;protocol=3Dhttps;tag=3Dv$%7BPV%7D" rel=3D"noreferre=
r" target=3D"_blank">github.com/vim/vim.git;branch=3Dmaster;protocol=3Dhttp=
s;tag=3Dv${PV}</a><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://CVE-2026-57456.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://CVE-2026-59856.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://CVE-2026-59857.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2026-59858.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
<br>
=C2=A0PV .=3D &quot;.0340&quot;<br>
-- <br>
2.43.0<br>
<br>
</blockquote></div>

--0000000000002fdae20659f46a94--

