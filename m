Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 6551572F43
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Mar 2017 08:26:19 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id x124so14959395wmf.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Mar 2017 01:26:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=vkGVjD41kv9nHN+AwWnIOlQ7VIS8/FHfK4EtstNVsg8=;
	b=C92ZFM+DMHouNXobF4Bm60krFW+l7Hmlqhu32uyHJ+KlYAufhBZ/FyIyt5kp+GyfAF
	FlitYtoQZ3r43/S1MrnaTKqH+N9ppbyTp0Q5sOBAY8lXeO1rFvNAfKQ06W1L+SjUEwwz
	xYWVnyE1ZHgjJgoN2L9azmtmvNzjynxXjmQezpFi9jlVzct3+xer+1Jmx5WV9+5dUhRF
	fpkglVTSTDA+Kl5ZaXPEQuUOuZ0OQ09SWgsmDNHFWm4o52Eq3LzrldclUJdh8ZxTzMb2
	Rb2r+CqLCBnbpiU0N9lCaS5OUEdzz0JhWV2v2upF7nQib+vHm3TusXRzhbVPUobW7tct
	zpCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=vkGVjD41kv9nHN+AwWnIOlQ7VIS8/FHfK4EtstNVsg8=;
	b=MhlBOyhxZNMefRapsnTL7dC5VZbzQ469nByplgNo2oCXSDnA7hKfb92K6pOXAqTO8U
	YSYKWjbGXsuLn2wHMUCEKw+ATKql7B5tbjLDnLPQm/yA4Rfgo1hsU4Cw6Wcnb+7ajjGd
	I//Aepvf3/TucVTXgdZvBxhhVxrjq5gZWVpeWPWBFo405RoZBJVOF2Me6u12dmnAJVsa
	F7CwHF920AMVwkOYkvIr/rm2qfsToFleonCrdtZ2pBLbp5FrO2/+G8Q5wB4qIxZENnHH
	jbikgsxYaMoPssk//wPZrDMDxp9HgIvDtFR5hd774q1xKjwwG652F3yXIWC0lvCW2AYQ
	9cqw==
X-Gm-Message-State: AFeK/H3SpqddcLT2G7UpDd/4il2bWEQfxtRMzY7+X6DC+0O7NE4H8L0aIk7Rdlkz8GiyB8uqjlhXZgF+5TI8VQ==
X-Received: by 10.28.4.10 with SMTP id 10mr1465630wme.124.1490257579892; Thu,
	23 Mar 2017 01:26:19 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.145.24 with HTTP; Thu, 23 Mar 2017 01:26:19 -0700 (PDT)
In-Reply-To: <4fc23dd9c0d1dc198d2dec0a8277e2b96f014c32.1490028304.git.raj.khem@gmail.com>
References: <cover.1490028304.git.raj.khem@gmail.com>
	<4fc23dd9c0d1dc198d2dec0a8277e2b96f014c32.1490028304.git.raj.khem@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 23 Mar 2017 09:26:19 +0100
Message-ID: <CA+chaQfEoP3sybT01_BkywgHAfQV=_aEkgFAap6Gf_V=4zJZpw@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/4] openssl: Fix build with clang
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
X-List-Received-Date: Thu, 23 Mar 2017 08:26:20 -0000
Content-Type: multipart/alternative; boundary=001a1141e416ac65e3054b61a12b

--001a1141e416ac65e3054b61a12b
Content-Type: text/plain; charset=UTF-8

This breaks build with default gcc with thumb enabled:

arm-oe-linux-gnueabi-gcc  -march=armv7-a -mthumb -mfpu=neon
 -mfloat-abi=softfp -mcpu=cortex-a9 -mtune=cortex-a9 -funwind-tables
-rdynamic --sysroot=WORKDIR/recipe-sysroot -I.. -I../.. -I../modes
-I../asn1 -I../evp -I../../include  -fPIC -DOPENSSL_PIC -DOPENSSL_THREADS
-D_REENTRANT -DDSO_DLFCN -DHAVE_DLFCN_H -DL_ENDIAN        -DTERMIO  -O2
-pipe -g -feliminate-unused-debug-types
-fdebug-prefix-map=WORKDIR=/usr/src/debug/openssl/1.0.2k-r0
-fdebug-prefix-map=WORKDIR/recipe-sysroot-native=
-fdebug-prefix-map=WORKDIR/recipe-sysroot=  -Wall -Wa,--noexecstack
-DHAVE_CRYPTODEV -DUSE_CRYPTODEV_DIGESTS -DOPENSSL_BN_ASM_MONT
-DOPENSSL_BN_ASM_GF2m -DSHA1_ASM -DSHA256_ASM -DSHA512_ASM -DAES_ASM
-DBSAES_ASM -DGHASH_ASM -c   -c -o ghash-armv4.o ghash-armv4.S
ghash-armv4.S: Assembler messages:
ghash-armv4.S:88: conditional infixes are deprecated in unified syntax
ghash-armv4.S:88: Error: thumb conditional instruction should be in IT
block -- `ldrplb r12,[r2,r3]'
ghash-armv4.S:98: conditional infixes are deprecated in unified syntax
ghash-armv4.S:98: Error: thumb conditional instruction should be in IT
block -- `ldrplb r8,[r0,r3]'
ghash-armv4.S:105: Error: thumb conditional instruction should be in IT
block -- `eorpl r12,r12,r8'
ghash-armv4.S:107: Error: thumb conditional instruction should be in IT
block -- `andpl r14,r12,#0xf0'
ghash-armv4.S:108: Error: thumb conditional instruction should be in IT
block -- `andpl r12,r12,#0x0f'
ghash-armv4.S:144: conditional infixes are deprecated in unified syntax
ghash-armv4.S:144: Error: thumb conditional instruction should be in IT
block -- `ldrneb r12,[r2,#15]'
ghash-armv4.S:231: conditional infixes are deprecated in unified syntax
ghash-armv4.S:231: Error: thumb conditional instruction should be in IT
block -- `ldrplb r12,[r0,r3]'
ghash-armv4.S:248: Error: thumb conditional instruction should be in IT
block -- `andpl r14,r12,#0xf0'
ghash-armv4.S:249: Error: thumb conditional instruction should be in IT
block -- `andpl r12,r12,#0x0f'
make[2]: *** [ghash-armv4.o] Error 1



On Mon, Mar 20, 2017 at 5:47 PM, Khem Raj <raj.khem@gmail.com> wrote:

> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  ...build-with-clang-using-external-assembler.patch | 49
> ++++++++++++++++++++++
>  .../recipes-connectivity/openssl/openssl_1.0.2k.bb |  5 ++-
>  2 files changed, 52 insertions(+), 2 deletions(-)
>  create mode 100644 meta/recipes-connectivity/openssl/openssl/0001-Fix-
> build-with-clang-using-external-assembler.patch
>
> diff --git a/meta/recipes-connectivity/openssl/openssl/0001-Fix-
> build-with-clang-using-external-assembler.patch
> b/meta/recipes-connectivity/openssl/openssl/0001-Fix-
> build-with-clang-using-external-assembler.patch
> new file mode 100644
> index 0000000000..47b83a5896
> --- /dev/null
> +++ b/meta/recipes-connectivity/openssl/openssl/0001-Fix-
> build-with-clang-using-external-assembler.patch
> @@ -0,0 +1,49 @@
> +From 2f6026cb8b16cf00726e3c5625c023f196680f07 Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Fri, 17 Mar 2017 12:52:08 -0700
> +Subject: [PATCH] Fix build with clang using external assembler
> +
> +Cherry-picked from
> +https://github.com/openssl/openssl/commit/11208dcfb9105e8afa37233185dece
> fd45e89e17
> +https://github.com/openssl/openssl/commit/fbab8baddef8d3346ae40ff068871e
> 2ddaf10270
> +https://github.com/openssl/openssl/commit/6cf412c473d8145562b76219ce3da7
> 3b201b3255
> +
> +Fixes
> +
> +| ghash-armv4.S: Assembler messages:
> +| ghash-armv4.S:81: Error: bad instruction `ldrbpl r12,[r2,r3]'
> +| ghash-armv4.S:91: Error: bad instruction `ldrbpl r8,[r0,r3]'
> +| ghash-armv4.S:137: Error: bad instruction `ldrbne r12,[r2,#15]'
> +| ghash-armv4.S:224: Error: bad instruction `ldrbpl r12,[r0,r3]'
> +| clang-4.0: error: assembler command failed with exit code 1 (use -v to
> see invocation)
> +| make[2]: *** [<builtin>: ghash-armv4.o] Error 1
> +
> +Upstream-Status: Backport
> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +---
> + crypto/modes/asm/ghash-armv4.pl | 7 +++++++
> + 1 file changed, 7 insertions(+)
> +
> +diff --git a/crypto/modes/asm/ghash-armv4.pl b/crypto/modes/asm/ghash-
> armv4.pl
> +index 8ccc963ef..442fed4da 100644
> +--- a/crypto/modes/asm/ghash-armv4.pl
> ++++ b/crypto/modes/asm/ghash-armv4.pl
> +@@ -124,7 +124,14 @@ $code=<<___;
> + #include "arm_arch.h"
> +
> + .text
> ++#if defined(__thumb2__) || defined(__clang__)
> ++.syntax       unified
> ++#endif
> ++#if defined(__thumb2__)
> ++.thumb
> ++#else
> + .code 32
> ++#endif
> +
> + #ifdef __clang__
> + #define ldrplb        ldrbpl
> +--
> +2.12.0
> +
> diff --git a/meta/recipes-connectivity/openssl/openssl_1.0.2k.bb
> b/meta/recipes-connectivity/openssl/openssl_1.0.2k.bb
> index 922819b3d5..1c1041428c 100644
> --- a/meta/recipes-connectivity/openssl/openssl_1.0.2k.bb
> +++ b/meta/recipes-connectivity/openssl/openssl_1.0.2k.bb
> @@ -37,12 +37,13 @@ SRC_URI += "file://find.pl;subdir=${BP}/util/ \
>              file://Makefiles-ptest.patch \
>              file://ptest-deps.patch \
>              file://openssl-1.0.2a-x32-asm.patch \
> -            file://ptest_makefile_deps.patch  \
> +            file://ptest_makefile_deps.patch \
>              file://configure-musl-target.patch \
>              file://parallel.patch \
>              file://openssl-util-perlpath.pl-cwd.patch \
>              file://Use-SHA256-not-MD5-as-default-digest.patch \
> -           "
> +            file://0001-Fix-build-with-clang-using-external-assembler.patch
> \
> +            "
>  SRC_URI[md5sum] = "f965fc0bf01bf882b31314b61391ae65"
>  SRC_URI[sha256sum] = "6b3977c61f2aedf0f96367dcfb5c6e
> 578cf37e7b8d913b4ecb6643c3cb88d8c0"
>
> --
> 2.12.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a1141e416ac65e3054b61a12b
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">This breaks build with default gcc with thumb enabled:<div=
><br><div><div>arm-oe-linux-gnueabi-gcc =C2=A0-march=3Darmv7-a -mthumb -mfp=
u=3Dneon =C2=A0-mfloat-abi=3Dsoftfp -mcpu=3Dcortex-a9 -mtune=3Dcortex-a9 -f=
unwind-tables -rdynamic --sysroot=3DWORKDIR/recipe-sysroot -I.. -I../.. -I.=
./modes -I../asn1 -I../evp -I../../include =C2=A0-fPIC -DOPENSSL_PIC -DOPEN=
SSL_THREADS -D_REENTRANT -DDSO_DLFCN -DHAVE_DLFCN_H -DL_ENDIAN =C2=A0 =C2=
=A0 =C2=A0 =C2=A0-DTERMIO =C2=A0-O2 -pipe -g -feliminate-unused-debug-types=
 -fdebug-prefix-map=3DWORKDIR=3D/usr/src/debug/openssl/1.0.2k-r0 -fdebug-pr=
efix-map=3DWORKDIR/recipe-sysroot-native=3D -fdebug-prefix-map=3DWORKDIR/re=
cipe-sysroot=3D =C2=A0-Wall -Wa,--noexecstack -DHAVE_CRYPTODEV -DUSE_CRYPTO=
DEV_DIGESTS -DOPENSSL_BN_ASM_MONT -DOPENSSL_BN_ASM_GF2m -DSHA1_ASM -DSHA256=
_ASM -DSHA512_ASM -DAES_ASM -DBSAES_ASM -DGHASH_ASM -c =C2=A0 -c -o ghash-a=
rmv4.o ghash-armv4.S</div><div>ghash-armv4.S: Assembler messages:</div><div=
>ghash-armv4.S:88: conditional infixes are deprecated in unified syntax</di=
v><div>ghash-armv4.S:88: Error: thumb conditional instruction should be in =
IT block -- `ldrplb r12,[r2,r3]&#39;</div><div>ghash-armv4.S:98: conditiona=
l infixes are deprecated in unified syntax</div><div>ghash-armv4.S:98: Erro=
r: thumb conditional instruction should be in IT block -- `ldrplb r8,[r0,r3=
]&#39;</div><div>ghash-armv4.S:105: Error: thumb conditional instruction sh=
ould be in IT block -- `eorpl r12,r12,r8&#39;</div><div>ghash-armv4.S:107: =
Error: thumb conditional instruction should be in IT block -- `andpl r14,r1=
2,#0xf0&#39;</div><div>ghash-armv4.S:108: Error: thumb conditional instruct=
ion should be in IT block -- `andpl r12,r12,#0x0f&#39;</div><div>ghash-armv=
4.S:144: conditional infixes are deprecated in unified syntax</div><div>gha=
sh-armv4.S:144: Error: thumb conditional instruction should be in IT block =
-- `ldrneb r12,[r2,#15]&#39;</div><div>ghash-armv4.S:231: conditional infix=
es are deprecated in unified syntax</div><div>ghash-armv4.S:231: Error: thu=
mb conditional instruction should be in IT block -- `ldrplb r12,[r0,r3]&#39=
;</div><div>ghash-armv4.S:248: Error: thumb conditional instruction should =
be in IT block -- `andpl r14,r12,#0xf0&#39;</div><div>ghash-armv4.S:249: Er=
ror: thumb conditional instruction should be in IT block -- `andpl r12,r12,=
#0x0f&#39;</div><div>make[2]: *** [ghash-armv4.o] Error 1</div></div><div><=
br></div><div><br></div></div></div><div class=3D"gmail_extra"><br><div cla=
ss=3D"gmail_quote">On Mon, Mar 20, 2017 at 5:47 PM, Khem Raj <span dir=3D"l=
tr">&lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gm=
ail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D=
"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Signed-off-=
by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</=
a>&gt;<br>
---<br>
=C2=A0...build-with-clang-using-<wbr>external-assembler.patch | 49 ++++++++=
++++++++++++++<br>
=C2=A0.../recipes-connectivity/<wbr>openssl/<a href=3D"http://openssl_1.0.2=
k.bb" rel=3D"noreferrer" target=3D"_blank">openssl_1.0.2k.bb</a> |=C2=A0 5 =
++-<br>
=C2=A02 files changed, 52 insertions(+), 2 deletions(-)<br>
=C2=A0create mode 100644 meta/recipes-connectivity/<wbr>openssl/openssl/000=
1-Fix-<wbr>build-with-clang-using-<wbr>external-assembler.patch<br>
<br>
diff --git a/meta/recipes-connectivity/<wbr>openssl/openssl/0001-Fix-<wbr>b=
uild-with-clang-using-<wbr>external-assembler.patch b/meta/recipes-connecti=
vity/<wbr>openssl/openssl/0001-Fix-<wbr>build-with-clang-using-<wbr>externa=
l-assembler.patch<br>
new file mode 100644<br>
index 0000000000..47b83a5896<br>
--- /dev/null<br>
+++ b/meta/recipes-connectivity/<wbr>openssl/openssl/0001-Fix-<wbr>build-wi=
th-clang-using-<wbr>external-assembler.patch<br>
@@ -0,0 +1,49 @@<br>
+From 2f6026cb8b16cf00726e3c5625c023<wbr>f196680f07 Mon Sep 17 00:00:00 200=
1<br>
+From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.co=
m</a>&gt;<br>
+Date: Fri, 17 Mar 2017 12:52:08 -0700<br>
+Subject: [PATCH] Fix build with clang using external assembler<br>
+<br>
+Cherry-picked from<br>
+<a href=3D"https://github.com/openssl/openssl/commit/11208dcfb9105e8afa372=
33185decefd45e89e17" rel=3D"noreferrer" target=3D"_blank">https://github.co=
m/openssl/<wbr>openssl/commit/<wbr>11208dcfb9105e8afa37233185dece<wbr>fd45e=
89e17</a><br>
+<a href=3D"https://github.com/openssl/openssl/commit/fbab8baddef8d3346ae40=
ff068871e2ddaf10270" rel=3D"noreferrer" target=3D"_blank">https://github.co=
m/openssl/<wbr>openssl/commit/<wbr>fbab8baddef8d3346ae40ff068871e<wbr>2ddaf=
10270</a><br>
+<a href=3D"https://github.com/openssl/openssl/commit/6cf412c473d8145562b76=
219ce3da73b201b3255" rel=3D"noreferrer" target=3D"_blank">https://github.co=
m/openssl/<wbr>openssl/commit/<wbr>6cf412c473d8145562b76219ce3da7<wbr>3b201=
b3255</a><br>
+<br>
+Fixes<br>
+<br>
+| ghash-armv4.S: Assembler messages:<br>
+| ghash-armv4.S:81: Error: bad instruction `ldrbpl r12,[r2,r3]&#39;<br>
+| ghash-armv4.S:91: Error: bad instruction `ldrbpl r8,[r0,r3]&#39;<br>
+| ghash-armv4.S:137: Error: bad instruction `ldrbne r12,[r2,#15]&#39;<br>
+| ghash-armv4.S:224: Error: bad instruction `ldrbpl r12,[r0,r3]&#39;<br>
+| clang-4.0: error: assembler command failed with exit code 1 (use -v to s=
ee invocation)<br>
+| make[2]: *** [&lt;builtin&gt;: ghash-armv4.o] Error 1<br>
+<br>
+Upstream-Status: Backport<br>
+<br>
+Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem=
@gmail.com</a>&gt;<br>
+---<br>
+ crypto/modes/asm/<a href=3D"http://ghash-armv4.pl" rel=3D"noreferrer" tar=
get=3D"_blank">ghash-armv4.<wbr>pl</a> | 7 +++++++<br>
+ 1 file changed, 7 insertions(+)<br>
+<br>
+diff --git a/crypto/modes/asm/<a href=3D"http://ghash-armv4.pl" rel=3D"nor=
eferrer" target=3D"_blank">ghash-<wbr>armv4.pl</a> b/crypto/modes/asm/<a hr=
ef=3D"http://ghash-armv4.pl" rel=3D"noreferrer" target=3D"_blank">ghash-<wb=
r>armv4.pl</a><br>
+index 8ccc963ef..442fed4da 100644<br>
+--- a/crypto/modes/asm/<a href=3D"http://ghash-armv4.pl" rel=3D"noreferrer=
" target=3D"_blank">ghash-<wbr>armv4.pl</a><br>
++++ b/crypto/modes/asm/<a href=3D"http://ghash-armv4.pl" rel=3D"noreferrer=
" target=3D"_blank">ghash-<wbr>armv4.pl</a><br>
+@@ -124,7 +124,14 @@ $code=3D&lt;&lt;___;<br>
+ #include &quot;arm_arch.h&quot;<br>
+<br>
+ .text<br>
++#if defined(__thumb2__) || defined(__clang__)<br>
++.syntax=C2=A0 =C2=A0 =C2=A0 =C2=A0unified<br>
++#endif<br>
++#if defined(__thumb2__)<br>
++.thumb<br>
++#else<br>
+ .code 32<br>
++#endif<br>
+<br>
+ #ifdef __clang__<br>
+ #define ldrplb=C2=A0 =C2=A0 =C2=A0 =C2=A0 ldrbpl<br>
+--<br>
+2.12.0<br>
+<br>
diff --git a/meta/recipes-connectivity/<wbr>openssl/<a href=3D"http://opens=
sl_1.0.2k.bb" rel=3D"noreferrer" target=3D"_blank">openssl_1.0.2k.bb</a> b/=
meta/recipes-connectivity/<wbr>openssl/<a href=3D"http://openssl_1.0.2k.bb"=
 rel=3D"noreferrer" target=3D"_blank">openssl_1.0.2k.bb</a><br>
index 922819b3d5..1c1041428c 100644<br>
--- a/meta/recipes-connectivity/<wbr>openssl/<a href=3D"http://openssl_1.0.=
2k.bb" rel=3D"noreferrer" target=3D"_blank">openssl_1.0.2k.bb</a><br>
+++ b/meta/recipes-connectivity/<wbr>openssl/<a href=3D"http://openssl_1.0.=
2k.bb" rel=3D"noreferrer" target=3D"_blank">openssl_1.0.2k.bb</a><br>
@@ -37,12 +37,13 @@ SRC_URI +=3D &quot;file://<a href=3D"http://find.pl" re=
l=3D"noreferrer" target=3D"_blank">find.pl</a>;subdir=3D${BP}/<wbr>util/ \<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://Makefiles-ptest.patc=
h \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://ptest-deps.patch \<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://openssl-1.0.2a-x32-a=
sm.<wbr>patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://ptest_makefile_deps.<wbr>=
patch=C2=A0 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://ptest_makefile_deps.<wbr>=
patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://configure-musl-targe=
t.<wbr>patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://parallel.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://openssl-util-perlpat=
h.<wbr>pl-cwd.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://Use-SHA256-not-MD5-a=
s-<wbr>default-digest.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-Fix-build-with-<wbr>=
clang-using-external-<wbr>assembler.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
=C2=A0SRC_URI[md5sum] =3D &quot;<wbr>f965fc0bf01bf882b31314b61391ae<wbr>65&=
quot;<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;<wbr>6b3977c61f2aedf0f96367dcfb5c6e<wbr>=
578cf37e7b8d913b4ecb6643c3cb88<wbr>d8c0&quot;<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
2.12.0<br>
<br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</font></span></blockquote></div><br></div>

--001a1141e416ac65e3054b61a12b--
