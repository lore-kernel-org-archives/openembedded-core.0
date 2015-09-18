Return-Path: <jussi.kukkonen@intel.com>
Received: from mail-wi0-f176.google.com (mail-wi0-f176.google.com
	[209.85.212.176])
	by mail.openembedded.org (Postfix) with ESMTP id 65A7C77024
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Sep 2015 09:23:02 +0000 (UTC)
Received: by wicgb1 with SMTP id gb1so23918257wic.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Sep 2015 02:23:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=Bk5UgIlry95NtFxOd5u6ncxa+wL1mSzBI2qE40t7sRo=;
	b=XaomvgZZ54Jeg5W/4nQ8C7WFrPP+Ou5mXzRHqpjTeqU27FSaVFWCjyDDHvw1eYcuKC
	Sil6JN0ShepHsMaWTSB/tco0hBwc6voo9ZjxxXkTUa19EraTiqv+wFAs1beGUcwDMJn1
	OUXKJRuErQ2t8Kp5Ngb3IWJOoxtlb3VJDlV6K7ns+Fy+BIW36IQYWVbiVA8rc1tqrouC
	jpjuTwCdBg1GiBKX2vUpTak/LPfq5EuSt1YdM96O/wHK2ldlkTU8523TbXPSxfdO31KW
	80Tyz5/0hmxt31bWNI46454Zl5NxGevNN0NJpg1HYi2v7+CG74/MxNyqOxumsjGxPcuv
	Nwhw==
X-Gm-Message-State: ALoCoQk0oW5DkFjDfaSuVFjqcUdADmLtuEmPijoDHa5r66+ODs9ZK5BXxqDWSSILpvvlqIWRjeDa
X-Received: by 10.180.76.177 with SMTP id l17mr1602838wiw.16.1442568182094;
	Fri, 18 Sep 2015 02:23:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.27.77.212 with HTTP; Fri, 18 Sep 2015 02:22:32 -0700 (PDT)
In-Reply-To: <1442502208.12473.4.camel@intel.com>
References: <1442502208.12473.4.camel@intel.com>
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Fri, 18 Sep 2015 12:22:32 +0300
Message-ID: <CAHiDW_Hm+TyZtTQ=sPeOd1OjEyxjLCDwiv7o47vAmyU44XVfqw@mail.gmail.com>
To: "Kinsella, Ray" <ray.kinsella@intel.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] openssl: remove lock data_word from x86cpuid.pl
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 18 Sep 2015 09:23:07 -0000
Content-Type: multipart/alternative; boundary=f46d0438937b0ef4940520021467

--f46d0438937b0ef4940520021467
Content-Type: text/plain; charset=UTF-8

On 17 September 2015 at 18:03, Kinsella, Ray <ray.kinsella@intel.com> wrote:

> The cmpxchg instruction is encoded in functions such as OPENSSL_atomic_add
> as a perlasm data_word. This has the effect of hiding the instruction from
> the assembler. Stripping the LOCK prefix on cmpxchg via the assembler with
> --momit-lock-prefix=yes then becomes impossible (required on the Intel
> X1000).
> This patch converts the data_word into perlasm instructions.
>

Could you resend this following the advice here:
http://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines : mainly
the patch file you add needs a message explaining the change as well as
headers Upstream-Status & Signed-off-by.

Thanks,
  Jussi


Signed-off-by: Ray Kinsella <ray.kinsella@intel.com>
> ---
>  .../openssl/remove-lock-data_word-from-x86cpuid.pl.patch   |   12
> ++++++++++++
>  meta/recipes-connectivity/openssl/openssl_1.0.2d.bb        |    1 +
>  2 files changed, 13 insertions(+)
>  create mode 100644
> meta/recipes-connectivity/openssl/openssl/remove-lock-data_word-from-x86cpuid.pl.patch
>
> diff --git
> a/meta/recipes-connectivity/openssl/openssl/remove-lock-data_word-from-x86cpuid.pl.patch
> b/meta/recipes-connectivity/openssl/openssl/remove-lock-data_word-from-x86cpuid.pl.patch
> new file mode 100644
> index 0000000..e969e91
> --- /dev/null
> +++
> b/meta/recipes-connectivity/openssl/openssl/remove-lock-data_word-from-x86cpuid.pl.patch
> @@ -0,0 +1,12 @@
> +--- openssl-1.0.2d/crypto/x86cpuid.pl.orig     2015-09-16
> 21:11:01.927322252 +0100
> ++++ openssl-1.0.2d/crypto/x86cpuid.pl  2015-09-16 21:14:45.795314992
> +0100
> +@@ -275,7 +275,8 @@
> + &set_label("spin");
> +       &lea    ("ebx",&DWP(0,"eax","ecx"));
> +       &nop    ();
> +-      &data_word(0x1ab10ff0); # lock; cmpxchg %ebx,(%edx)     # %eax is
> envolved and is always reloaded
> ++      &lock   ();
> ++      &cmpxchg(&DWP(0,"edx"), "ebx"); # %eax is envolved and is always
> reloaded
> +       &jne    (&label("spin"));
> +       &mov    ("eax","ebx");  # OpenSSL expects the new value
> +       &pop    ("ebx");
> diff --git a/meta/recipes-connectivity/openssl/openssl_1.0.2d.bb
> b/meta/recipes-connectivity/openssl/openssl_1.0.2d.bb
> index 32d8dce..de2ec1a 100644
> --- a/meta/recipes-connectivity/openssl/openssl_1.0.2d.bb
> +++ b/meta/recipes-connectivity/openssl/openssl_1.0.2d.bb
> @@ -33,6 +33,7 @@ SRC_URI += "file://configure-targets.patch \
>              file://openssl-fix-des.pod-error.patch \
>              file://Makefiles-ptest.patch \
>              file://ptest-deps.patch \
> +            file://remove-lock-data_word-from-x86cpuid.pl.patch \
>              file://run-ptest \
>              file://crypto_use_bigint_in_x86-64_perl.patch \
>              file://openssl-1.0.2a-x32-asm.patch \
> --
> 1.7.10.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--f46d0438937b0ef4940520021467
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On 1=
7 September 2015 at 18:03, Kinsella, Ray <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:ray.kinsella@intel.com" target=3D"_blank">ray.kinsella@intel.com</a>&=
gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);bord=
er-left-style:solid;padding-left:1ex">The cmpxchg instruction is encoded in=
 functions such as OPENSSL_atomic_add<br>
as a perlasm data_word. This has the effect of hiding the instruction from<=
br>
the assembler. Stripping the LOCK prefix on cmpxchg via the assembler with<=
br>
--momit-lock-prefix=3Dyes then becomes impossible (required on the Intel X1=
000).<br>
This patch converts the data_word into perlasm instructions.<br></blockquot=
e><div><br></div><div>Could you resend this following the advice here: <a h=
ref=3D"http://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines">ht=
tp://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines</a> : mainly=
 the patch file you add needs a message explaining the change as well as he=
aders Upstream-Status &amp; Signed-off-by.=C2=A0</div><div><br></div><div>T=
hanks,</div><div>=C2=A0 Jussi</div><div><br></div><div><br></div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width=
:1px;border-left-color:rgb(204,204,204);border-left-style:solid;padding-lef=
t:1ex">
Signed-off-by: Ray Kinsella &lt;<a href=3D"mailto:ray.kinsella@intel.com">r=
ay.kinsella@intel.com</a>&gt;<br>
---<br>
=C2=A0.../openssl/remove-lock-data_word-from-x86cpuid.pl.patch=C2=A0 =C2=A0=
|=C2=A0 =C2=A012 ++++++++++++<br>
=C2=A0meta/recipes-connectivity/openssl/<a href=3D"http://openssl_1.0.2d.bb=
" rel=3D"noreferrer" target=3D"_blank">openssl_1.0.2d.bb</a>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 =C2=A0 1 +<br>
=C2=A02 files changed, 13 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-connectivity/openssl/openssl/remove-l=
ock-data_word-from-x86cpuid.pl.patch<br>
<br>
diff --git a/meta/recipes-connectivity/openssl/openssl/remove-lock-data_wor=
d-from-x86cpuid.pl.patch b/meta/recipes-connectivity/openssl/openssl/remove=
-lock-data_word-from-x86cpuid.pl.patch<br>
new file mode 100644<br>
index 0000000..e969e91<br>
--- /dev/null<br>
+++ b/meta/recipes-connectivity/openssl/openssl/remove-lock-data_word-from-=
x86cpuid.pl.patch<br>
@@ -0,0 +1,12 @@<br>
+--- openssl-1.0.2d/crypto/x86cpuid.pl.orig=C2=A0 =C2=A0 =C2=A02015-09-16 2=
1:11:01.927322252 +0100<br>
++++ openssl-1.0.2d/crypto/<a href=3D"http://x86cpuid.pl" rel=3D"noreferrer=
" target=3D"_blank">x86cpuid.pl</a>=C2=A0 2015-09-16 21:14:45.795314992 +01=
00<br>
+@@ -275,7 +275,8 @@<br>
+ &amp;set_label(&quot;spin&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;lea=C2=A0 =C2=A0 (&quot;ebx&quot;,&amp;DWP=
(0,&quot;eax&quot;,&quot;ecx&quot;));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;nop=C2=A0 =C2=A0 ();<br>
+-=C2=A0 =C2=A0 =C2=A0 &amp;data_word(0x1ab10ff0); # lock; cmpxchg %ebx,(%e=
dx)=C2=A0 =C2=A0 =C2=A0# %eax is envolved and is always reloaded<br>
++=C2=A0 =C2=A0 =C2=A0 &amp;lock=C2=A0 =C2=A0();<br>
++=C2=A0 =C2=A0 =C2=A0 &amp;cmpxchg(&amp;DWP(0,&quot;edx&quot;), &quot;ebx&=
quot;); # %eax is envolved and is always reloaded<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;jne=C2=A0 =C2=A0 (&amp;label(&quot;spin&qu=
ot;));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;mov=C2=A0 =C2=A0 (&quot;eax&quot;,&quot;eb=
x&quot;);=C2=A0 # OpenSSL expects the new value<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;pop=C2=A0 =C2=A0 (&quot;ebx&quot;);<br>
diff --git a/meta/recipes-connectivity/openssl/<a href=3D"http://openssl_1.=
0.2d.bb" rel=3D"noreferrer" target=3D"_blank">openssl_1.0.2d.bb</a> b/meta/=
recipes-connectivity/openssl/<a href=3D"http://openssl_1.0.2d.bb" rel=3D"no=
referrer" target=3D"_blank">openssl_1.0.2d.bb</a><br>
index 32d8dce..de2ec1a 100644<br>
--- a/meta/recipes-connectivity/openssl/<a href=3D"http://openssl_1.0.2d.bb=
" rel=3D"noreferrer" target=3D"_blank">openssl_1.0.2d.bb</a><br>
+++ b/meta/recipes-connectivity/openssl/<a href=3D"http://openssl_1.0.2d.bb=
" rel=3D"noreferrer" target=3D"_blank">openssl_1.0.2d.bb</a><br>
@@ -33,6 +33,7 @@ SRC_URI +=3D &quot;file://configure-targets.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://openssl-fix-des.pod-=
error.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://Makefiles-ptest.patc=
h \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://ptest-deps.patch \<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://remove-lock-data_word-fro=
m-x86cpuid.pl.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://run-ptest \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://crypto_use_bigint_in=
_x86-64_perl.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://openssl-1.0.2a-x32-a=
sm.patch \<br>
<span class=3D""><font color=3D"#888888">--<br>
1.7.10.4<br>
<br>
--<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</font></span></blockquote></div><br></div></div>

--f46d0438937b0ef4940520021467--
