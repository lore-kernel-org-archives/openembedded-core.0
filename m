Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-qt0-f179.google.com (mail-qt0-f179.google.com
	[209.85.216.179])
	by mail.openembedded.org (Postfix) with ESMTP id 154CF77D49
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Apr 2017 12:59:48 +0000 (UTC)
Received: by mail-qt0-f179.google.com with SMTP id v3so53718341qtd.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Apr 2017 05:59:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=2MoQT+BlX8vPGDhWiIFXCgL99UFvTsvwHMooGMthyJQ=;
	b=TIBk4zM3kaRmDZeCxS7TVw1yPEfKnSrl6klUTIA41JGFvXL1eVRZ9HjVJzQDu6WNVB
	P8S5+J4SLHNo5cg4Wo8MGHe1XtYjCUgxL8WlRnPjZjCfGvAZR+6CqSgqMycURAo6sTNO
	0mbl/HYA4tk2ZvcQyO9DwZH4awPyf9+D+jjBMnWNfFTzONAQR0yNqKw5S21kw3obiotp
	kyLFFsUPf013eY6bbAKRO8grNbuquPt9+gNg5e6T+5B8lLA1RVQ5ozNOV5kRxoJ7Q2UD
	Usc2LBUk3Vvt01GTI4owueIlS6cTUDx05+KAEULeq3T2irvrfphXD+rAAnXQApLqPCQ6
	BYJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=2MoQT+BlX8vPGDhWiIFXCgL99UFvTsvwHMooGMthyJQ=;
	b=A3VkGR4YqANeONLeXNO246Ka9hCzr3H9P0W5VQfPWdCVC/VYHVjNUP1bq2pwMRNm3k
	4Js9K72fjoAgBFYiHsgGJ9aZo1J1C0YEz/4pGDt9p+XkazMnqiyXpvBXH0/gSF70fEwq
	R5hGbyypm1hjfU7JrpHlRg5v3ai7E+T8qucVqcpkE2NGL8kISlYzq04eCCr8Vuv5HkBp
	aLuw536dYkMK34/XItgjWf+6HV46e6SPDu8LMkKhW2FQNrYRj6bb9e2MTBne4/4aSbh1
	1m7luR/U6RCOpsm5FkjrtMQh7hFLpyH+da04iDlT4AE7xqaDefT7TBCrPKCHCybh+CPm
	4e0Q==
X-Gm-Message-State: AN3rC/4rbfo/+J7rJDRDB7hWp9PdmoTscEr6dF9wABKoX5efdLAeU7j3dfDwNnE52E8MSnYS+tJNoIKgTOZnvg==
X-Received: by 10.200.54.136 with SMTP id a8mr11128422qtc.87.1491829189795;
	Mon, 10 Apr 2017 05:59:49 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.12.163.69 with HTTP; Mon, 10 Apr 2017 05:59:49 -0700 (PDT)
In-Reply-To: <1491828558.10884.112.camel@intel.com>
References: <1491828558.10884.112.camel@intel.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 10 Apr 2017 08:59:49 -0400
Message-ID: <CADkTA4PQHE0w9=kvr5EyeQvG-Vm8SPQFh9NqM2Jofp_Ec99fKA@mail.gmail.com>
To: Patrick Ohly <patrick.ohly@intel.com>
Cc: OpenEmbedded <openembedded-core@lists.openembedded.org>
Subject: Re: go-cross: incorrect dependency on tune-specific libgcc
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
X-List-Received-Date: Mon, 10 Apr 2017 12:59:49 -0000
Content-Type: multipart/alternative; boundary=001a1142833cec66ce054ccf8c3a

--001a1142833cec66ce054ccf8c3a
Content-Type: text/plain; charset=UTF-8

On Mon, Apr 10, 2017 at 8:49 AM, Patrick Ohly <patrick.ohly@intel.com>
wrote:

> Hello!
>
> I'm currently extending the yocto-compat-layer.py so that it can detect
> invalid signature changes when changing MACHINE. go-cross-x86_64 shows
> up as broken when comparing signatures for MACHINE=intel-corei7-64 and
> MACHINE=qemux86-64.
>
> Both machines share the same go-cross-x86_64, but that DEPENDS on
> libgcc:
>
> meta/recipes-devtools/go/go.inc:# libgcc is required for the target
> specific libraries to build properly
> meta/recipes-devtools/go/go.inc:DEPENDS += "go-bootstrap-native libgcc"
>
> And libgcc itself depends on the tune flags for the target architecture
> and thus is different for these two machines:
>
> $ bitbake-diffsigs -t go-cross-x86_64 do_prepare_recipe_sysroot -s
> 563f419e3854c2351e2cbbf33a9025f6 64e378fd9853a6cd6a4e7f684f52d2fc
> Hash for dependent task gcc/libgcc_6.3.bb.do_populate_sysroot changed
> from afb6b55c0e2b7d2e816b3d2d214a7326 to 208fac5ae428b07a4aa491b130879e4a
>   Hash for dependent task gcc/libgcc_6.3.bb.do_multilib_install changed
> from 596e1612d7b84b7a9c1b409ee78cca89 to d41e2e835d0abe7646e53e3d63ce00cd
>     Hash for dependent task gcc/libgcc_6.3.bb.do_install changed from
> 9ca4126c69fcceb410253a0603c3d76b to cb0c49687a91ea17f1027c6394baacab
>       Hash for dependent task gcc/libgcc_6.3.bb.do_compile changed from
> ab80902424c73af49257cc3f6fe049aa to 436f978a703476968bd5ae1c1915ee5a
>         Hash for dependent task gcc/libgcc_6.3.bb.do_configure changed
> from eb0c36d87f32ce1ceb7d1e42609578fb to f62c98806faf3a28c2144919b89d3460
>           Hash for dependent task gcc/libgcc_6.3.bb.do_prepare_recipe_sysroot
> changed from b037b950e346bef71a4f8fd2c6a2195c to
> d4564b5730941279392932e3c670a5a5
>             Hash for dependent task gcc/libgcc_6.3.bb.do_fetch changed
> from e64cd9e029ed63ba3a09e5fe085b7057 to ea4d3f9d10544219ceb8591d5a5a4041
>               basehash changed from 8744593af2eddb60244788f2b9476e2d to
> dabeb22478ef501e35311af75119a2cf
>               Variable TUNE_CCARGS value changed:
>               " -m64 [--march=corei7 -mtune=corei7-] {+-march=core2
> -mtune=core2 -msse3+} -mfpmath=sse [--msse4.2-]"
>
> Does this fix look correct? It turns go-cross into a package that is
> specific to the tune flags for the target. That fixes the signature
> check, and go-helloworld for both machines still builds okay (haven't
> tested anything else):
>
> diff --git a/meta/classes/go.bbclass b/meta/classes/go.bbclass
> index 85f71a2e9a6..ac41c80d377 100644
> --- a/meta/classes/go.bbclass
> +++ b/meta/classes/go.bbclass
> @@ -26,7 +26,7 @@ export CGO_CPPFLAGS = "${TARGET_CPPFLAGS}"
>  export CGO_CXXFLAGS = "${TARGET_CC_ARCH}${TOOLCHAIN_OPTIONS}
> ${TARGET_CXXFLAGS}"
>  export CGO_LDFLAGS = "${TARGET_CC_ARCH}${TOOLCHAIN_OPTIONS}
> ${TARGET_LDFLAGS}"
>
> -DEPENDS += "go-cross-${TARGET_ARCH}"
> +DEPENDS += "go-cross-${TUNE_PKGARCH}"
>  DEPENDS_class-native += "go-native"
>
>  FILES_${PN}-staticdev += "${GOSRC_FINAL}/${GO_IMPORT}"
> diff --git a/meta/recipes-devtools/go/go-cross.inc
> b/meta/recipes-devtools/go/go-cross.inc
> index 68f5efd6c09..83015b49a99 100644
> --- a/meta/recipes-devtools/go/go-cross.inc
> +++ b/meta/recipes-devtools/go/go-cross.inc
> @@ -2,7 +2,7 @@ inherit cross
>
>  DEPENDS += "gcc-cross-${TARGET_ARCH}"
>
> -PN = "go-cross-${TARGET_ARCH}"
> +PN = "go-cross-${TUNE_PKGARCH}"
>


This requires any layers with existing DEPENDS on go-cross-${TARGET} to be
updated, so
if it is correct .. it would be best to get it in sooner rather than later,
and have some way to
notify when it is actually merged.

Bruce


>
>  FILESEXTRAPATHS =. "${FILE_DIRNAME}/go-cross:"
>
> The alternative would be to drop the libgcc dependency, but I have no
> idea whether that would work at all.
>
> --
> Best Regards, Patrick Ohly
>
> The content of this message is my personal opinion only and although
> I am an employee of Intel, the statements I make here in no way
> represent Intel's position on the issue, nor am I authorized to speak
> on behalf of Intel on this matter.
>
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--001a1142833cec66ce054ccf8c3a
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Mon, Apr 10, 2017 at 8:49 AM, Patrick Ohly <span dir=3D"ltr">&lt;<a =
href=3D"mailto:patrick.ohly@intel.com" target=3D"_blank">patrick.ohly@intel=
.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Hello!<br>
<br>
I&#39;m currently extending the yocto-compat-layer.py so that it can detect=
<br>
invalid signature changes when changing MACHINE. go-cross-x86_64 shows<br>
up as broken when comparing signatures for MACHINE=3Dintel-corei7-64 and<br=
>
MACHINE=3Dqemux86-64.<br>
<br>
Both machines share the same go-cross-x86_64, but that DEPENDS on<br>
libgcc:<br>
<br>
meta/recipes-devtools/go/go.<wbr>inc:# libgcc is required for the target sp=
ecific libraries to build properly<br>
meta/recipes-devtools/go/go.<wbr>inc:DEPENDS +=3D &quot;go-bootstrap-native=
 libgcc&quot;<br>
<br>
And libgcc itself depends on the tune flags for the target architecture<br>
and thus is different for these two machines:<br>
<br>
$ bitbake-diffsigs -t go-cross-x86_64 do_prepare_recipe_sysroot -s 563f419e=
3854c2351e2cbbf33a9025<wbr>f6 64e378fd9853a6cd6a4e7f684f52d2<wbr>fc<br>
Hash for dependent task gcc/libgcc_6.3.bb.do_populate_<wbr>sysroot changed =
from afb6b55c0e2b7d2e816b3d2d214a73<wbr>26 to 208fac5ae428b07a4aa491b130879=
e<wbr>4a<br>
=C2=A0 Hash for dependent task gcc/libgcc_6.3.bb.do_multilib_<wbr>install c=
hanged from 596e1612d7b84b7a9c1b409ee78cca<wbr>89 to d41e2e835d0abe7646e53e=
3d63ce00<wbr>cd<br>
=C2=A0 =C2=A0 Hash for dependent task gcc/libgcc_6.3.bb.do_install changed =
from 9ca4126c69fcceb410253a0603c3d7<wbr>6b to cb0c49687a91ea17f1027c6394baa=
c<wbr>ab<br>
=C2=A0 =C2=A0 =C2=A0 Hash for dependent task gcc/libgcc_6.3.bb.do_compile c=
hanged from ab80902424c73af49257cc3f6fe049<wbr>aa to 436f978a703476968bd5ae=
1c1915ee<wbr>5a<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 Hash for dependent task gcc/libgcc_6.3.bb.do_co=
nfigure changed from eb0c36d87f32ce1ceb7d1e42609578<wbr>fb to f62c98806faf3=
a28c2144919b89d34<wbr>60<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Hash for dependent task gcc/libgcc_6.3.b=
b.do_prepare_<wbr>recipe_sysroot changed from b037b950e346bef71a4f8fd2c6a21=
9<wbr>5c to d4564b5730941279392932e3c670a5<wbr>a5<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Hash for dependent task gcc/libgc=
c_6.3.bb.do_fetch changed from e64cd9e029ed63ba3a09e5fe085b70<wbr>57 to ea4=
d3f9d10544219ceb8591d5a5a40<wbr>41<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 basehash changed from 8744=
593af2eddb60244788f2b9476e<wbr>2d to dabeb22478ef501e35311af75119a2<wbr>cf<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Variable TUNE_CCARGS value=
 changed:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot; -m64 [--march=3Dcor=
ei7 -mtune=3Dcorei7-] {+-march=3Dcore2 -mtune=3Dcore2 -msse3+} -mfpmath=3Ds=
se [--msse4.2-]&quot;<br>
<br>
Does this fix look correct? It turns go-cross into a package that is<br>
specific to the tune flags for the target. That fixes the signature<br>
check, and go-helloworld for both machines still builds okay (haven&#39;t<b=
r>
tested anything else):<br>
<br>
diff --git a/meta/classes/go.bbclass b/meta/classes/go.bbclass<br>
index 85f71a2e9a6..ac41c80d377 100644<br>
--- a/meta/classes/go.bbclass<br>
+++ b/meta/classes/go.bbclass<br>
@@ -26,7 +26,7 @@ export CGO_CPPFLAGS =3D &quot;${TARGET_CPPFLAGS}&quot;<br=
>
=C2=A0export CGO_CXXFLAGS =3D &quot;${TARGET_CC_ARCH}${TOOLCHAIN_<wbr>OPTIO=
NS} ${TARGET_CXXFLAGS}&quot;<br>
=C2=A0export CGO_LDFLAGS =3D &quot;${TARGET_CC_ARCH}${TOOLCHAIN_<wbr>OPTION=
S} ${TARGET_LDFLAGS}&quot;<br>
<br>
-DEPENDS +=3D &quot;go-cross-${TARGET_ARCH}&quot;<br>
+DEPENDS +=3D &quot;go-cross-${TUNE_PKGARCH}&quot;<br>
=C2=A0DEPENDS_class-native +=3D &quot;go-native&quot;<br>
<br>
=C2=A0FILES_${PN}-staticdev +=3D &quot;${GOSRC_FINAL}/${GO_IMPORT}&quot;<br=
>
diff --git a/meta/recipes-devtools/go/go-<wbr>cross.inc b/meta/recipes-devt=
ools/go/go-<wbr>cross.inc<br>
index 68f5efd6c09..83015b49a99 100644<br>
--- a/meta/recipes-devtools/go/go-<wbr>cross.inc<br>
+++ b/meta/recipes-devtools/go/go-<wbr>cross.inc<br>
@@ -2,7 +2,7 @@ inherit cross<br>
<br>
=C2=A0DEPENDS +=3D &quot;gcc-cross-${TARGET_ARCH}&quot;<br>
<br>
-PN =3D &quot;go-cross-${TARGET_ARCH}&quot;<br>
+PN =3D &quot;go-cross-${TUNE_PKGARCH}&quot;<br></blockquote><div><br><br><=
/div><div>This requires any layers with existing DEPENDS on go-cross-${TARG=
ET} to be updated, so<br></div><div>if it is correct .. it would be best to=
 get it in sooner rather than later, and have some way to <br></div><div>no=
tify when it is actually merged.<br><br></div><div>Bruce<br></div><div>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;borde=
r-left:1px #ccc solid;padding-left:1ex">
<br>
=C2=A0FILESEXTRAPATHS =3D. &quot;${FILE_DIRNAME}/go-cross:&quot;<br>
<br>
The alternative would be to drop the libgcc dependency, but I have no<br>
idea whether that would work at all.<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
Best Regards, Patrick Ohly<br>
<br>
The content of this message is my personal opinion only and although<br>
I am an employee of Intel, the statements I make here in no way<br>
represent Intel&#39;s position on the issue, nor am I authorized to speak<b=
r>
on behalf of Intel on this matter.<br>
<br>
<br>
<br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</font></span></blockquote></div><br><br clear=3D"all"><br>-- <br><div clas=
s=3D"gmail_signature" data-smartmail=3D"gmail_signature">&quot;Thou shalt n=
ot follow the NULL pointer, for chaos and madness await thee at its end&quo=
t;</div>
</div></div>

--001a1142833cec66ce054ccf8c3a--
