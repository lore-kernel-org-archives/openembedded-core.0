Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
 by mx.groups.io with SMTP id smtpd.web12.507.1617722512173809688
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Apr 2021 08:21:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=a9PKmPdS;
 spf=pass (domain: gmail.com, ip: 209.85.222.169, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f169.google.com with SMTP id v70so15287335qkb.8
        for <openembedded-core@lists.openembedded.org>; Tue, 06 Apr 2021 08:21:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=I9deu85PEnXT/SJHIeIaH2QGbPo3tUE2kzNsB0npF5g=;
        b=a9PKmPdSOiMba6Jek/ajgjZvgb6cWXByp5PBuSHO38NUAedyY954qR40t60SoL6+4Q
         h8ahSyDdxv4TKsPlnKRi6iFhmLZ7INiNK7fadjAsUNa5h/kUEHJAraMCwW7G1kVKR560
         xAcRss2e6pljleXmuqdpunkZs+0N7H20XybL/ESWDkfdiIxVN4SVZxDY24rQexDEZYBQ
         na1nlb875EPz3QDv5Ff6scrqH91RLyH1lyr/iekrzYvJZOeoiEnwOk3p7xwXUpI2vlbN
         kGuucatM+8lcC0ZD9fvbMQDAbYAXRvbRffGo45CO14UKV1LJBKHEipx3gfO4odrAc8u4
         FwRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=I9deu85PEnXT/SJHIeIaH2QGbPo3tUE2kzNsB0npF5g=;
        b=ukEAsgcWmKApky4P7yUGF1I7/obHgMgPQ9pOPiPsHsFz9n4QMrk3UeV2kOivm6oBnh
         JA0MVgAxiQ4R3dpu/nxm3J4hINWF8Q6qlH4I/yHVgGuT5PXInr0oKVPcuiSOy4JqYDsa
         9z5h0ahpOPoY78KmNWPto7c6scuCISQUz2edoou+jY7UjIOihIR5nCIqybbOEBixsjT0
         6KGT3fuQHH9K+ur/YK2skBXMAXSY0DagZQ+qFMNeVuY7u3kjpWH75Nu7zPkXse8SZSRA
         SY/bvtAKdQ2ra/16YbkneD0ysh2DMhjzos4zRB+cAu4r9ix0Xp1ocbBG4DlTtZtjv4gS
         JNrQ==
X-Gm-Message-State: AOAM532BHrap/IqdmlkS6lCFiNgUPyRAqE18Ipcjbv7cFlazxCkzgFRk
	RtuCuyOPlXhdYGNLGLqdbyCOA5/T7z80E5rI3+0=
X-Google-Smtp-Source: ABdhPJwdokA4pWQN3JDYLDHK7Z3o6mUrrqyUp8LDa3ZomKwfdDt9+ayz9GZ6nwvZkCLVD9JSm+6JkK6cKDx6Gifbyjo=
X-Received: by 2002:a05:620a:a12:: with SMTP id i18mr29818794qka.119.1617722511209;
 Tue, 06 Apr 2021 08:21:51 -0700 (PDT)
MIME-Version: 1.0
References: <1617714478-10348-1-git-send-email-pemorrow@linux.microsoft.com> <1617714478-10348-2-git-send-email-pemorrow@linux.microsoft.com>
In-Reply-To: <1617714478-10348-2-git-send-email-pemorrow@linux.microsoft.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Tue, 6 Apr 2021 08:21:39 -0700
Message-ID: <CAMKF1sokus=EgwQem-d5yRfd2vcROUDzv2mJddtj5fzZNZ4MoQ@mail.gmail.com>
Subject: Re: [dunfell][PATCH 2/2] go_1.14: don't set -buildmode=pie when building for windows targets
To: Peter Morrow <pemorrow@linux.microsoft.com>
Cc: openembedded-core@lists.openembedded.org, peter.morrow@microsoft.com
Content-Type: multipart/alternative; boundary="000000000000a038b505bf4f5f29"

--000000000000a038b505bf4f5f29
Content-Type: text/plain; charset="UTF-8"

This looks good to me

On Tue, Apr 6, 2021 at 6:08 AM Peter Morrow <pemorrow@linux.microsoft.com>
wrote:

> go 1.14 for windows targets does not support -buildmode=pie, disable it
> and use
> the default buildmode instead. Support for -buildmode=pie for windows
> targets
> is added with go 1.15 (https://golang.org/doc/go1.15) which is added to
> poky in
> gatesgarth.
>
> Signed-off-by: Peter Morrow <pemorrow@linux.microsoft.com>
> ---
>  meta/classes/go.bbclass             | 8 ++++----
>  meta/recipes-devtools/go/go_1.14.bb | 8 ++++----
>  2 files changed, 8 insertions(+), 8 deletions(-)
>
> diff --git a/meta/classes/go.bbclass b/meta/classes/go.bbclass
> index a9e31b5..8ff482b 100644
> --- a/meta/classes/go.bbclass
> +++ b/meta/classes/go.bbclass
> @@ -144,11 +144,11 @@ FILES_${PN}-staticdev = "${libdir}/go/pkg"
>
>  INSANE_SKIP_${PN} += "ldflags"
>
> -# Add -buildmode=pie to GOBUILDFLAGS to satisfy "textrel" QA checking,
> but mips
> -# doesn't support -buildmode=pie, so skip the QA checking for mips and its
> -# variants.
> +# Add -buildmode=pie to GOBUILDFLAGS to satisfy "textrel" QA checking, but
> +# windows/mips/riscv doesn't support -buildmode=pie, so skip the QA
> checking
> +# for windows/mips/riscv and their variants.
>  python() {
> -    if 'mips' in d.getVar('TARGET_ARCH') or 'riscv' in
> d.getVar('TARGET_ARCH'):
> +    if 'mips' in d.getVar('TARGET_ARCH') or 'riscv' in
> d.getVar('TARGET_ARCH') or 'windows' in d.getVar('TARGET_GOOS'):
>          d.appendVar('INSANE_SKIP_%s' % d.getVar('PN'), " textrel")
>      else:
>          d.appendVar('GOBUILDFLAGS', ' -buildmode=pie')
> diff --git a/meta/recipes-devtools/go/go_1.14.bb
> b/meta/recipes-devtools/go/go_1.14.bb
> index bc90a13..c175279 100644
> --- a/meta/recipes-devtools/go/go_1.14.bb
> +++ b/meta/recipes-devtools/go/go_1.14.bb
> @@ -3,11 +3,11 @@ require go-target.inc
>
>  export GOBUILDMODE=""
>  export CGO_ENABLED_riscv64 = ""
> -# Add pie to GOBUILDMODE to satisfy "textrel" QA checking, but mips/riscv
> -# doesn't support -buildmode=pie, so skip the QA checking for mips/riscv
> and its
> -# variants.
> +# Add pie to GOBUILDMODE to satisfy "textrel" QA checking, but
> +# windows/mips/riscv doesn't support -buildmode=pie, so skip the QA
> checking
> +# for windows/mips/riscv and their variants.
>  python() {
> -    if 'mips' in d.getVar('TARGET_ARCH',True) or 'riscv' in
> d.getVar('TARGET_ARCH',True):
> +    if 'mips' in d.getVar('TARGET_ARCH',True) or 'riscv' in
> d.getVar('TARGET_ARCH',True) or 'windows' in d.getVar('TARGET_GOOS', True):
>          d.appendVar('INSANE_SKIP_%s' % d.getVar('PN',True), " textrel")
>      else:
>          d.setVar('GOBUILDMODE', 'pie')
> --
> 1.8.3.1
>
>

--000000000000a038b505bf4f5f29
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">This looks good to me=C2=A0</div><div><br><div class=3D"g=
mail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Apr 6, 2021 at 6:=
08 AM Peter Morrow &lt;<a href=3D"mailto:pemorrow@linux.microsoft.com">pemo=
rrow@linux.microsoft.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail=
_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:=
1ex">go 1.14 for windows targets does not support -buildmode=3Dpie, disable=
 it and use<br>
the default buildmode instead. Support for -buildmode=3Dpie for windows tar=
gets<br>
is added with go 1.15 (<a href=3D"https://golang.org/doc/go1.15" rel=3D"nor=
eferrer" target=3D"_blank">https://golang.org/doc/go1.15</a>) which is adde=
d to poky in<br>
gatesgarth.<br>
<br>
Signed-off-by: Peter Morrow &lt;<a href=3D"mailto:pemorrow@linux.microsoft.=
com" target=3D"_blank">pemorrow@linux.microsoft.com</a>&gt;<br>
---<br>
=C2=A0meta/classes/go.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0| 8 ++++----<br>
=C2=A0meta/recipes-devtools/go/<a href=3D"http://go_1.14.bb" rel=3D"norefer=
rer" target=3D"_blank">go_1.14.bb</a> | 8 ++++----<br>
=C2=A02 files changed, 8 insertions(+), 8 deletions(-)<br>
<br>
diff --git a/meta/classes/go.bbclass b/meta/classes/go.bbclass<br>
index a9e31b5..8ff482b 100644<br>
--- a/meta/classes/go.bbclass<br>
+++ b/meta/classes/go.bbclass<br>
@@ -144,11 +144,11 @@ FILES_${PN}-staticdev =3D &quot;${libdir}/go/pkg&quot=
;<br>
<br>
=C2=A0INSANE_SKIP_${PN} +=3D &quot;ldflags&quot;<br>
<br>
-# Add -buildmode=3Dpie to GOBUILDFLAGS to satisfy &quot;textrel&quot; QA c=
hecking, but mips<br>
-# doesn&#39;t support -buildmode=3Dpie, so skip the QA checking for mips a=
nd its<br>
-# variants.<br>
+# Add -buildmode=3Dpie to GOBUILDFLAGS to satisfy &quot;textrel&quot; QA c=
hecking, but<br>
+# windows/mips/riscv doesn&#39;t support -buildmode=3Dpie, so skip the QA =
checking<br>
+# for windows/mips/riscv and their variants.<br>
=C2=A0python() {<br>
-=C2=A0 =C2=A0 if &#39;mips&#39; in d.getVar(&#39;TARGET_ARCH&#39;) or &#39=
;riscv&#39; in d.getVar(&#39;TARGET_ARCH&#39;):<br>
+=C2=A0 =C2=A0 if &#39;mips&#39; in d.getVar(&#39;TARGET_ARCH&#39;) or &#39=
;riscv&#39; in d.getVar(&#39;TARGET_ARCH&#39;) or &#39;windows&#39; in d.ge=
tVar(&#39;TARGET_GOOS&#39;):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0d.appendVar(&#39;INSANE_SKIP_%s&#39; % d.=
getVar(&#39;PN&#39;), &quot; textrel&quot;)<br>
=C2=A0 =C2=A0 =C2=A0else:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0d.appendVar(&#39;GOBUILDFLAGS&#39;, &#39;=
 -buildmode=3Dpie&#39;)<br>
diff --git a/meta/recipes-devtools/go/<a href=3D"http://go_1.14.bb" rel=3D"=
noreferrer" target=3D"_blank">go_1.14.bb</a> b/meta/recipes-devtools/go/<a =
href=3D"http://go_1.14.bb" rel=3D"noreferrer" target=3D"_blank">go_1.14.bb<=
/a><br>
index bc90a13..c175279 100644<br>
--- a/meta/recipes-devtools/go/<a href=3D"http://go_1.14.bb" rel=3D"norefer=
rer" target=3D"_blank">go_1.14.bb</a><br>
+++ b/meta/recipes-devtools/go/<a href=3D"http://go_1.14.bb" rel=3D"norefer=
rer" target=3D"_blank">go_1.14.bb</a><br>
@@ -3,11 +3,11 @@ require go-target.inc<br>
<br>
=C2=A0export GOBUILDMODE=3D&quot;&quot;<br>
=C2=A0export CGO_ENABLED_riscv64 =3D &quot;&quot;<br>
-# Add pie to GOBUILDMODE to satisfy &quot;textrel&quot; QA checking, but m=
ips/riscv<br>
-# doesn&#39;t support -buildmode=3Dpie, so skip the QA checking for mips/r=
iscv and its<br>
-# variants.<br>
+# Add pie to GOBUILDMODE to satisfy &quot;textrel&quot; QA checking, but<b=
r>
+# windows/mips/riscv doesn&#39;t support -buildmode=3Dpie, so skip the QA =
checking<br>
+# for windows/mips/riscv and their variants.<br>
=C2=A0python() {<br>
-=C2=A0 =C2=A0 if &#39;mips&#39; in d.getVar(&#39;TARGET_ARCH&#39;,True) or=
 &#39;riscv&#39; in d.getVar(&#39;TARGET_ARCH&#39;,True):<br>
+=C2=A0 =C2=A0 if &#39;mips&#39; in d.getVar(&#39;TARGET_ARCH&#39;,True) or=
 &#39;riscv&#39; in d.getVar(&#39;TARGET_ARCH&#39;,True) or &#39;windows&#3=
9; in d.getVar(&#39;TARGET_GOOS&#39;, True):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0d.appendVar(&#39;INSANE_SKIP_%s&#39; % d.=
getVar(&#39;PN&#39;,True), &quot; textrel&quot;)<br>
=C2=A0 =C2=A0 =C2=A0else:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0d.setVar(&#39;GOBUILDMODE&#39;, &#39;pie&=
#39;)<br>
-- <br>
1.8.3.1<br>
<br>
</blockquote></div></div>

--000000000000a038b505bf4f5f29--
