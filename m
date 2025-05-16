Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F4D0C3ABD8
	for <webhook@archiver.kernel.org>; Fri, 16 May 2025 09:30:54 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web11.9262.1747387844821103487
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 May 2025 02:30:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=ExSBMZ/E;
 spf=pass (domain: smile.fr, ip: 209.85.221.48, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3a1fb17bb8cso1414287f8f.0
        for <openembedded-core@lists.openembedded.org>; Fri, 16 May 2025 02:30:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1747387843; x=1747992643; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=fw4TbKx2smkS2M5r0FdInB3udmn0CkfzD6iyWP8Gxvg=;
        b=ExSBMZ/Eei/IKEqTOejCF+gtZG9TxRleQPe4XsV+rBt3GJCMoA/HuAb4nbpZ5IFyzN
         9w9SkaSwi62VT2XB5N+0xPgicKQQGBkMv66/ej4AYyXaenfL4gBcZzWr0W8StoZQuKwC
         17OPRNt9zdO4uG+ZiQ+VdM5X9bmec2Ofr9vu0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747387843; x=1747992643;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fw4TbKx2smkS2M5r0FdInB3udmn0CkfzD6iyWP8Gxvg=;
        b=ZOaxNRpzetl0zp3Q6tgUk703kjZeP5KYofj92izQ/6N1sSWT/aqFUOccPzi+B8sZXI
         kfh7U/PcW5MCj3t0JtO5Me9gK+YBPRFA9VpbR4DOaGx+ovHlRaQbaGjhyhX1HI6ZN5Wu
         HF+JBBG1hI/MN4xz1vqnodWCBEGiznBp4NQPxHxkRG4E2JSErKD6y+O+eFPAKJ1M4kmq
         3LyoSjzJd8wu+2YU7ZUevuHTacdS8xUeRebU4v2pNdaH8s75D0fqS29QHhlQ7UXacD0+
         22qRdFfW9iXTYoguSB1ltan5MSv7Je4Pjz23OBlF9Soq2tFf+97uXFYrxzI8DUsxqFCK
         Toug==
X-Gm-Message-State: AOJu0YwVwX+QUmzYmyoFkhyVYlSt2e0SPEegpuCGG4CuitgwfZztMMkt
	FTz0k7GfFD5XtQE1nVG2U9n/MK5aSZe6ssUaspEg70qZ1u+5/o9GcZ8Q4nwNIgGs2uLMC1Z7u50
	Iq9Pt+sdp3bUe6WtY34obfoyD6sE+qOzugGyClZRlXQ==
X-Gm-Gg: ASbGnctHIrNGkvhjfo2/hQBq6LUTsAA0EUMi7iHWDs5iDH3rheWS0q3fTz4Oo+qmwDi
	vJnq9Llo3gS/LGw5FgbsSAEr0mu/m4Jh39woDHIGt8jTwK1siIAbU3Q+kr1vFH2mmjQxehJ5sSZ
	C8htwNdS/DemDAUnsILCmCIi3jIOt7FPsF8MCf29d5VnPIP9vdUDLDIneuZL8T/G2xan0=
X-Google-Smtp-Source: AGHT+IGsi3oO5oV5e4IbUoRnNK29PSYW68FuG0a0bsXflUHSHCxMyYwsBSl34fCPBHEhcnUQ95z1KCfM+OnDgB/yvJE=
X-Received: by 2002:a05:6000:2012:b0:39c:1f0e:95af with SMTP id
 ffacd0b85a97d-3a35c821c15mr2668806f8f.3.1747387842673; Fri, 16 May 2025
 02:30:42 -0700 (PDT)
MIME-Version: 1.0
References: <20250516090910.972704-2-ines.kchelfi@smile.fr>
In-Reply-To: <20250516090910.972704-2-ines.kchelfi@smile.fr>
From: Yoann Congal <yoann.congal@smile.fr>
Date: Fri, 16 May 2025 11:30:16 +0200
X-Gm-Features: AX0GCFsTEVbIkPpTSvsXEEoydQvq9obHb_jrJ7vjq4-HoewQTehbL3Y31dJUdUY
Message-ID: <CAMSfU+4ijT-ebF-WzTKow58C6_nPabgvk7kJ1mwGfgcsv6AOVQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] insane.bbclass: Add unimplemented-ptest
 detection for cargo-based tests
To: ines.kchelfi@smile.fr
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000a5de7f06353d6f8c"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 May 2025 09:30:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216730

--000000000000a5de7f06353d6f8c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le ven. 16 mai 2025 =C3=A0 11:09, Ines KCHELFI via lists.openembedded.org
<ines.kchelfi=3Dsmile.fr@lists.openembedded.org> a =C3=A9crit :

> From: Ines KCHELFI <ines.kchelfi@smile.fr>
>
> Extend unimplemented-ptest QA check to detect Rust tests.
> Note: To enable this QA check, add the following to your local.conf:
>   WARN_QA +=3D "unimplemented-ptest"
>
> Examples of Rust-based meta-oe packages triggering unimplemented-ptest:
>
> WARNING: cbindgen-0.28.0-r0 do_patch: QA Issue: cbindgen: cargo-based
> tests detected [unimplemented-ptest]
> WARNING: fdfindd-10.2-r0 do_patch: QA Issue: fdfindd: cargo-based tests
> detected [unimplemented-ptest]
> WARNING: deqp-runner-0.20.3-r0 do_patch: QA Issue: deqp-runner:
> cargo-based tests detected [unimplemented-ptest]
> WARNING: bindgen-cli-0.71.1-r0 do_patch: QA Issue: bindgen-cli:
> cargo-based tests detected [unimplemented-ptest]
> WARNING: python3-maturin-1.8.3-r0 do_patch: QA Issue: python3-maturin:
> cargo-based tests detected [unimplemented-ptest]
> WARNING: uutils-coreutils-0.0.30-r0 do_patch: QA Issue: uutils-coreutils:
> cargo-based tests detected [unimplemented-ptest]
>
> Signed-off-by: Ines KCHELFI <ines.kchelfi@smile.fr>
>

Reviewed-by: Yoann Congal <yoann.congal@smile.fr>


> ---
>  meta/classes-global/insane.bbclass | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/meta/classes-global/insane.bbclass
> b/meta/classes-global/insane.bbclass
> index cd26bf5eb9..152bef8ad5 100644
> --- a/meta/classes-global/insane.bbclass
> +++ b/meta/classes-global/insane.bbclass
> @@ -1332,6 +1332,13 @@ python do_qa_patch() {
>      elif os.path.exists(os.path.join(srcdir, "Makefile.in")) and
> (match_line_in_files(srcdir, "**/Makefile.in", r'\s*TESTS\s*\+?=3D') or
> match_line_in_files(srcdir,"**/*.at",r'.*AT_INIT')):
>          oe.qa.handle_error("unimplemented-ptest", "%s: autotools-based
> tests detected" % d.getVar('PN'), d)
>
> +    # Detect cargo-based tests
> +    elif os.path.exists(os.path.join(srcdir, "Cargo.toml")) and (
> +        match_line_in_files(srcdir, "**/*.rs", r'\s*#\s*\[\s*test\s*\]')
> or
> +        match_line_in_files(srcdir, "**/*.rs",
> r'\s*#\s*\[\s*cfg\s*\(\s*test\s*\)\s*\]')
> +    ):
> +        oe.qa.handle_error("unimplemented-ptest", "%s: cargo-based tests
> detected" % d.getVar('PN'), d)
> +
>      # Last resort, detect a test directory in sources
>      elif os.path.exists(srcdir) and any(filename.lower() in ["test",
> "tests"] for filename in os.listdir(srcdir)):
>          oe.qa.handle_error("unimplemented-ptest", "%s: test subdirectory
> detected" % d.getVar('PN'), d)
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#216726):
> https://lists.openembedded.org/g/openembedded-core/message/216726
> Mute This Topic: https://lists.openembedded.org/mt/113142168/4316185
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> yoann.congal@smile.fr]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Yoann Congal
Smile ECS

--000000000000a5de7f06353d6f8c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0ven. 16=
 mai 2025 =C3=A0=C2=A011:09, Ines KCHELFI via <a href=3D"http://lists.opene=
mbedded.org">lists.openembedded.org</a> &lt;ines.kchelfi=3D<a href=3D"mailt=
o:smile.fr@lists.openembedded.org">smile.fr@lists.openembedded.org</a>&gt; =
a =C3=A9crit=C2=A0:<br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex">From: Ines KCHELFI &lt;<a href=3D"mailto:ines.kchelfi@smile.fr" target=
=3D"_blank">ines.kchelfi@smile.fr</a>&gt;<br>
<br>
Extend unimplemented-ptest QA check to detect Rust tests.<br>
Note: To enable this QA check, add the following to your local.conf:<br>
=C2=A0 WARN_QA +=3D &quot;unimplemented-ptest&quot;<br>
<br>
Examples of Rust-based meta-oe packages triggering unimplemented-ptest:<br>
<br>
WARNING: cbindgen-0.28.0-r0 do_patch: QA Issue: cbindgen: cargo-based tests=
 detected [unimplemented-ptest]<br>
WARNING: fdfindd-10.2-r0 do_patch: QA Issue: fdfindd: cargo-based tests det=
ected [unimplemented-ptest]<br>
WARNING: deqp-runner-0.20.3-r0 do_patch: QA Issue: deqp-runner: cargo-based=
 tests detected [unimplemented-ptest]<br>
WARNING: bindgen-cli-0.71.1-r0 do_patch: QA Issue: bindgen-cli: cargo-based=
 tests detected [unimplemented-ptest]<br>
WARNING: python3-maturin-1.8.3-r0 do_patch: QA Issue: python3-maturin: carg=
o-based tests detected [unimplemented-ptest]<br>
WARNING: uutils-coreutils-0.0.30-r0 do_patch: QA Issue: uutils-coreutils: c=
argo-based tests detected [unimplemented-ptest]<br>
<br>
Signed-off-by: Ines KCHELFI &lt;<a href=3D"mailto:ines.kchelfi@smile.fr" ta=
rget=3D"_blank">ines.kchelfi@smile.fr</a>&gt;<br></blockquote><div><br></di=
v><div>Reviewed-by: Yoann Congal &lt;<a href=3D"mailto:yoann.congal@smile.f=
r">yoann.congal@smile.fr</a>&gt;</div><div>=C2=A0</div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex">
---<br>
=C2=A0meta/classes-global/insane.bbclass | 7 +++++++<br>
=C2=A01 file changed, 7 insertions(+)<br>
<br>
diff --git a/meta/classes-global/insane.bbclass b/meta/classes-global/insan=
e.bbclass<br>
index cd26bf5eb9..152bef8ad5 100644<br>
--- a/meta/classes-global/insane.bbclass<br>
+++ b/meta/classes-global/insane.bbclass<br>
@@ -1332,6 +1332,13 @@ python do_qa_patch() {<br>
=C2=A0 =C2=A0 =C2=A0elif os.path.exists(os.path.join(srcdir, &quot;Makefile=
.in&quot;)) and (match_line_in_files(srcdir, &quot;**/Makefile.in&quot;, r&=
#39;\s*TESTS\s*\+?=3D&#39;) or match_line_in_files(srcdir,&quot;**/*.at&quo=
t;,r&#39;.*AT_INIT&#39;)):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0oe.qa.handle_error(&quot;unimplemented-pt=
est&quot;, &quot;%s: autotools-based tests detected&quot; % d.getVar(&#39;P=
N&#39;), d)<br>
<br>
+=C2=A0 =C2=A0 # Detect cargo-based tests<br>
+=C2=A0 =C2=A0 elif os.path.exists(os.path.join(srcdir, &quot;Cargo.toml&qu=
ot;)) and (<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 match_line_in_files(srcdir, &quot;**/*.rs&quot=
;, r&#39;\s*#\s*\[\s*test\s*\]&#39;) or <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 match_line_in_files(srcdir, &quot;**/*.rs&quot=
;, r&#39;\s*#\s*\[\s*cfg\s*\(\s*test\s*\)\s*\]&#39;)<br>
+=C2=A0 =C2=A0 ):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 oe.qa.handle_error(&quot;unimplemented-ptest&q=
uot;, &quot;%s: cargo-based tests detected&quot; % d.getVar(&#39;PN&#39;), =
d)<br>
+<br>
=C2=A0 =C2=A0 =C2=A0# Last resort, detect a test directory in sources<br>
=C2=A0 =C2=A0 =C2=A0elif os.path.exists(srcdir) and any(filename.lower() in=
 [&quot;test&quot;, &quot;tests&quot;] for filename in os.listdir(srcdir)):=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0oe.qa.handle_error(&quot;unimplemented-pt=
est&quot;, &quot;%s: test subdirectory detected&quot; % d.getVar(&#39;PN&#3=
9;), d)<br>
-- <br>
2.43.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#216726): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/216726" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/216726</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/113142168/431=
6185" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/113142168/4316185</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:yoann.congal@smile.fr" tar=
get=3D"_blank">yoann.congal@smile.fr</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><br><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr"><font face=3D"Raleway, regular">Yoann Congal</font><div><fon=
t face=3D"Raleway, regular">Smile ECS</font></div></div></div></div>

--000000000000a5de7f06353d6f8c--

