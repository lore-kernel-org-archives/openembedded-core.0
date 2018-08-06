Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
	[209.85.221.48])
	by mail.openembedded.org (Postfix) with ESMTP id A18EA7884B
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Aug 2018 15:22:52 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id h15-v6so12755398wrs.7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Aug 2018 08:22:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=v2pHrhQsQOExm0qCcqUM2YnpWK7Ljf4P9p9D1jmfh7Y=;
	b=BFpLFzh1p3fI3xRd6LXMRoSS500jWUdulTP4aPMrYky6UVrZX8QdNkb1DHqPcugSkn
	wgvzvo3g4hvPLp2iidfx4NsKkaDp0npT2UT46a6M1Y/6AlvtZoEuYLs+7nQu2+kVCNBK
	KWjUxPYpCa6v7CjXyx3hV5j7ciE5VlySxW19w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=v2pHrhQsQOExm0qCcqUM2YnpWK7Ljf4P9p9D1jmfh7Y=;
	b=BEUZL4IYJVkQC+zJ/T4mDsWh8cAv+XjZzBDhyRfYPCSoSekcolOO9FgeYtdXFc9MDo
	Wkk1ehidlyNzM7T2W5SzvLcRGsoj7AXFsfMoXtOkjoD/oDgP4ACEOzbAiIT16mOtq7EE
	K4i+aSNVIlnjwxj7By56uAFkLYrObzUO0HREqOngOf1Oh+XNRooOMFriMsW8jP4tbbHN
	FvuEYSaC2U0ConmhirH0CV8q3tuMHJzbttI0PKxQEQfct0c/zNbRk0q5pkLPw7O65c4C
	JY41rnYeuQQmnhT4gPMg8lGVkxcli7XGzEIkohMED52ktpMzO58zoLgSyHS5ZNOI1lXl
	6+Fw==
X-Gm-Message-State: AOUpUlEEhyV7Q64tMmURX2g2O/407UN39X4fUhS5/YCrIEF5Pj8nmyFa
	Ac+XiLxU1/FNCotEp3vqwWlXbg==
X-Google-Smtp-Source: AAOMgpfmLxmLkB9hr+di+VyBIxTtd5vhQGP7NuYSpfB4knelTemecaWHpK2ihJYBhk6KkaEJ7nP87g==
X-Received: by 2002:a5d:5201:: with SMTP id
	j1-v6mr9813949wrv.198.1533568973206; 
	Mon, 06 Aug 2018 08:22:53 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	z11-v6sm18644518wrm.94.2018.08.06.08.22.51
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 06 Aug 2018 08:22:52 -0700 (PDT)
Message-ID: <6b107e710448191ecc7f638891dbf1837dbd8e8d.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: Jens Rehsack <rehsack@gmail.com>, openembedded-core@lists.openembedded.org
Date: Mon, 06 Aug 2018 16:22:50 +0100
In-Reply-To: <33B9AF0C-D9AF-4714-B28C-F45A66E398E7@gmail.com>
References: <33B9AF0C-D9AF-4714-B28C-F45A66E398E7@gmail.com>
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
Subject: Re: [PATCH 2/2] libxml-parser-perl: fix "...contains bad RPATH"
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
X-List-Received-Date: Mon, 06 Aug 2018 15:22:52 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2018-08-02 at 10:21 +0200, Jens Rehsack wrote:
> The perl distribution "XML-Parser" relies for configuration
> on the tooling of Devel::CheckLib - which is not aware of
> sysroot locations nor of reasonable compiler/link definitions
> from outside.
>=20
> This causes
>=20
>     ERROR: libxml-parser-perl-2.44-r0 do_package_qa: QA Issue: package li=
bxml-parser-perl contains bad RPATH ${BUILDDIR}/tmp/work/core2-64-poky-linu=
x/libxml-parser-perl/2.44-r0/recipe-sysroot/usr/lib in file ${BUILDDIR}/tmp=
/work/core2-64-poky-linux/libxml-parser-perl/2.44-r0/packages-split/libxml-=
parser-perl/usr/lib/perl/vendor_perl/5.24.4/auto/XML/Parser/Expat/Expat.so
>     package libxml-parser-perl contains bad RPATH ${BUILDDIR}/tmp/work/co=
re2-64-poky-linux/libxml-parser-perl/2.44-r0/recipe-sysroot/usr/lib in file=
 ${BUILDDIR}/tmp/work/core2-64-poky-linux/libxml-parser-perl/2.44-r0/packag=
es-split/libxml-parser-perl/usr/lib/perl/vendor_perl/5.24.4/auto/XML/Parser=
/Expat/Expat.so [rpaths]
>     ERROR: libxml-parser-perl-2.44-r0 do_package_qa: QA run found fatal e=
rrors. Please consider fixing them.
>     ERROR: libxml-parser-perl-2.44-r0 do_package_qa: Function failed: do_=
package_qa
>=20
> It's strongly encouraged to the maintainer @toddr to rework the
> toolchain for up to date environments.
>=20
> Signed-off-by: Jens Rehsack <sno@netbsd.org>
> ---
>  meta/recipes-devtools/perl/libxml-parser-perl_2.44.bb | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-devtools/perl/libxml-parser-perl_2.44.bb b/meta=
/recipes-devtools/perl/libxml-parser-perl_2.44.bb
> index c5e0ae6769..2ca8d506f4 100644
> --- a/meta/recipes-devtools/perl/libxml-parser-perl_2.44.bb
> +++ b/meta/recipes-devtools/perl/libxml-parser-perl_2.44.bb
> @@ -19,7 +19,11 @@ inherit cpan ptest-perl
>  # fix up sub MakeMaker project as arguments don't get propagated though
>  # see https://rt.cpan.org/Public/Bug/Display.html?id=3D28632
>  do_configure_append() {
> -	sed 's:--sysroot=3D.*\(\s\|$\):--sysroot=3D${STAGING_DIR_TARGET} :g' -i=
 Makefile Expat/Makefile
> +	sed -E \
> +	    -e 's:--sysroot=3D.*\(\s\|$\):--sysroot=3D${STAGING_DIR_TARGET} :g'=
 \
> +	    -e 's:-L${STAGING_LIBDIR}::g' -e 's:-I${STAGING_INCDIR}::g' \
> +	    -e 's:LD_RUN_PATH ?=3D ?"?[^"]*"?::g' \
> +	    -i Makefile Expat/Makefile
>  	sed 's:^FULL_AR =3D .*:FULL_AR =3D ${AR}:g' -i Expat/Makefile
>  	# make sure these two do not build in parallel
>  	sed 's!^$(INST_DYNAMIC):!$(INST_DYNAMIC): $(BOOTSTRAP)!' -i Expat/Makef=
ile

Hi Jens,

Thanks for looking into this. Unfortunately its still not working, see
the error below for the -native version.

Cheers,

Richard


NOTE: recipe libtest-needs-perl-0.002005-r0: task do_compile: Started
ERROR: libxml-parser-perl-native-2.44-r0 do_compile: oe_runmake failed
ERROR: libxml-parser-perl-native-2.44-r0 do_compile: Function failed: do_co=
mpile (log file is located at /home/pokybuild/yocto-autobuilder/yocto-worke=
r/nightly-mips-lsb/build/build/tmp/work/x86_64-linux/libxml-parser-perl-nat=
ive/2.44-r0/temp/log.do_compile.34225)
NOTE: recipe librepo-1.8.1-r0: task do_patch: Succeeded
NOTE: recipe libxml-namespacesupport-perl-1.12-r0: task do_configure: Succe=
eded
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-autobuilder/yoct=
o-worker/nightly-mips-lsb/build/build/tmp/work/x86_64-linux/libxml-parser-p=
erl-native/2.44-r0/temp/log.do_compile.34225
Log data follows:
| DEBUG: Executing shell function do_compile
| NOTE: make -j 28 PASTHRU_INC=3D-isystem/home/pokybuild/yocto-autobuilder/=
yocto-worker/nightly-mips-lsb/build/build/tmp/work/x86_64-linux/libxml-pars=
er-perl-native/2.44-r0/recipe-sysroot-native/usr/include -O2 -pipe LD=3Dgcc
| make[1]: Entering directory '/home/pokybuild/yocto-autobuilder/yocto-work=
er/nightly-mips-lsb/build/build/tmp/work/x86_64-linux/libxml-parser-perl-na=
tive/2.44-r0/XML-Parser-2.44/Expat'
| "/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-mips-lsb/build/bu=
ild/tmp/work/x86_64-linux/libxml-parser-perl-native/2.44-r0/recipe-sysroot-=
native/usr/bin/perl-native/perl" "/home/pokybuild/yocto-autobuilder/yocto-w=
orker/nightly-mips-lsb/build/build/tmp/work/x86_64-linux/libxml-parser-perl=
-native/2.44-r0/recipe-sysroot-native/usr/lib/perl-native/perl/5.24.4/ExtUt=
ils/xsubpp" -noprototypes -typemap "/home/pokybuild/yocto-autobuilder/yocto=
-worker/nightly-mips-lsb/build/build/tmp/work/x86_64-linux/libxml-parser-pe=
rl-native/2.44-r0/recipe-sysroot-native/usr/lib/perl-native/perl/5.24.4/Ext=
Utils/typemap" -typemap "typemap"  Expat.xs > Expat.xsc && mv Expat.xsc Exp=
at.c
| gcc  -c -isystem/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-mi=
ps-lsb/build/build/tmp/work/x86_64-linux/libxml-parser-perl-native/2.44-r0/=
recipe-sysroot-native/usr/include -O2 -pipe  -D_REENTRANT -D_GNU_SOURCE -fw=
rapv -fno-strict-aliasing -pipe -I/usr/local/include -D_LARGEFILE_SOURCE -D=
_FILE_OFFSET_BITS=3D64 -D_FORTIFY_SOURCE=3D2 -O2   -DVERSION=3D\"2.44\" -DX=
S_VERSION=3D\"2.44\" -fPIC "-I/home/pokybuild/yocto-autobuilder/yocto-worke=
r/nightly-mips-lsb/build/build/tmp/work/x86_64-linux/libxml-parser-perl-nat=
ive/2.44-r0/recipe-sysroot-native/usr/lib/perl-native/perl/5.24.4/CORE"   E=
xpat.c
| cp Expat.pm ../blib/lib/XML/Parser/Expat.pm
| Running Mkbootstrap for XML::Parser::Expat ()
| cp Parser/Style/Debug.pm blib/lib/XML/Parser/Style/Debug.pm
| cp Parser/LWPExternEnt.pl blib/lib/XML/Parser/LWPExternEnt.pl
| cp Parser/Encodings/x-sjis-unicode.enc blib/lib/XML/Parser/Encodings/x-sj=
is-unicode.enc
| cp Parser/Encodings/windows-1251.enc blib/lib/XML/Parser/Encodings/window=
s-1251.enc
| cp Parser/Encodings/Japanese_Encodings.msg blib/lib/XML/Parser/Encodings/=
Japanese_Encodings.msg
| cp Parser/Encodings/big5.enc blib/lib/XML/Parser/Encodings/big5.enc
| cp Parser/Encodings/x-sjis-jisx0221.enc blib/lib/XML/Parser/Encodings/x-s=
jis-jisx0221.enc
| cp Parser/Encodings/README blib/lib/XML/Parser/Encodings/README
| cp Parser/Encodings/x-euc-jp-unicode.enc blib/lib/XML/Parser/Encodings/x-=
euc-jp-unicode.enc
| cp Parser/Encodings/iso-8859-4.enc blib/lib/XML/Parser/Encodings/iso-8859=
-4.enc
| cp Parser/Encodings/ibm866.enc blib/lib/XML/Parser/Encodings/ibm866.enc
| cp Parser/Encodings/iso-8859-7.enc blib/lib/XML/Parser/Encodings/iso-8859=
-7.enc
| cp Parser/Encodings/iso-8859-8.enc blib/lib/XML/Parser/Encodings/iso-8859=
-8.enc
| cp Parser/Style/Subs.pm blib/lib/XML/Parser/Style/Subs.pm
| cp Parser/Encodings/iso-8859-9.enc blib/lib/XML/Parser/Encodings/iso-8859=
-9.enc
| cp Parser/Encodings/iso-8859-3.enc blib/lib/XML/Parser/Encodings/iso-8859=
-3.enc
| cp Parser/Encodings/euc-kr.enc blib/lib/XML/Parser/Encodings/euc-kr.enc
| cp Parser/Encodings/windows-1252.enc blib/lib/XML/Parser/Encodings/window=
s-1252.enc
| cp Parser/Encodings/x-sjis-jdk117.enc blib/lib/XML/Parser/Encodings/x-sji=
s-jdk117.enc
| cp Parser/Encodings/iso-8859-5.enc blib/lib/XML/Parser/Encodings/iso-8859=
-5.enc
| cp Parser.pm blib/lib/XML/Parser.pm
| cp Parser/Style/Tree.pm blib/lib/XML/Parser/Style/Tree.pm
| cp Parser/Encodings/windows-1250.enc blib/lib/XML/Parser/Encodings/window=
s-1250.enc
| cp Parser/Style/Stream.pm blib/lib/XML/Parser/Style/Stream.pm
| cp Parser/Encodings/x-euc-jp-jisx0221.enc blib/lib/XML/Parser/Encodings/x=
-euc-jp-jisx0221.enc
| cp Parser/Encodings/iso-8859-2.enc blib/lib/XML/Parser/Encodings/iso-8859=
-2.enc
| cp Parser/Style/Objects.pm blib/lib/XML/Parser/Style/Objects.pm
| cp Parser/Encodings/x-sjis-cp932.enc blib/lib/XML/Parser/Encodings/x-sjis=
-cp932.enc
| cp Parser/Encodings/koi8-r.enc blib/lib/XML/Parser/Encodings/koi8-r.enc
| cp Parser/Encodings/windows-1255.enc blib/lib/XML/Parser/Encodings/window=
s-1255.enc
| chmod 644 "Expat.bs"
| rm -f ../blib/arch/auto/XML/Parser/Expat/Expat.so
| gcc   -L/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-mips-lsb/b=
uild/build/tmp/work/x86_64-linux/libxml-parser-perl-native/2.44-r0/recipe-s=
ysroot-native/lib -Wl,-rpath-link,/home/pokybuild/yocto-autobuilder/yocto-w=
orker/nightly-mips-lsb/build/build/tmp/work/x86_64-linux/libxml-parser-perl=
-native/2.44-r0/recipe-sysroot-native/usr/lib -Wl,-rpath-link,/home/pokybui=
ld/yocto-autobuilder/yocto-worker/nightly-mips-lsb/build/build/tmp/work/x86=
_64-linux/libxml-parser-perl-native/2.44-r0/recipe-sysroot-native/lib -Wl,-=
rpath,/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-mips-lsb/build=
/build/tmp/work/x86_64-linux/libxml-parser-perl-native/2.44-r0/recipe-sysro=
ot-native/usr/lib -Wl,-rpath,/home/pokybuild/yocto-autobuilder/yocto-worker=
/nightly-mips-lsb/build/build/tmp/work/x86_64-linux/libxml-parser-perl-nati=
ve/2.44-r0/recipe-sysroot-native/lib -Wl,-O1 -Wl,--allow-shlib-undefined -W=
l,--dynamic-linker=3D/home/pokybuild/yocto-autobuilder/yocto-worker/nightly=
-arm/build/build/tmp/sysroots-uninative/x86_64-linux/lib/ld-linux-x86-64.so=
.2 -shared -L/usr/local/lib Expat.o  -o ../blib/arch/auto/XML/Parser/Expat/=
Expat.so 	\
|    -lexpat  	\
|=20
| /usr/lib64/gcc/x86_64-suse-linux/8/../../../../x86_64-suse-linux/bin/ld: =
cannot find -lexpat
| collect2: error: ld returned 1 exit status
| make[1]: *** [Makefile:462: ../blib/arch/auto/XML/Parser/Expat/Expat.so] =
Error 1
| make[1]: Leaving directory '/home/pokybuild/yocto-autobuilder/yocto-worke=
r/nightly-mips-lsb/build/build/tmp/work/x86_64-linux/libxml-parser-perl-nat=
ive/2.44-r0/XML-Parser-2.44/Expat'
| make: *** [Makefile:594: subdirs] Error 2
| ERROR: oe_runmake failed
| WARNING: /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-mips-lsb/=
build/build/tmp/work/x86_64-linux/libxml-parser-perl-native/2.44-r0/temp/ru=
n.do_compile.34225:1 exit 1 from 'exit 1'
| ERROR: Function failed: do_compile (log file is located at /home/pokybuil=
d/yocto-autobuilder/yocto-worker/nightly-mips-lsb/build/build/tmp/work/x86_=
64-linux/libxml-parser-perl-native/2.44-r0/temp/log.do_compile.34225)
NOTE: recipe libxml-parser-perl-native-2.44-r0: task do_compile: Failed




