Return-Path: <martin.jansa@gmail.com>
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com
	[209.85.208.50])
	by mail.openembedded.org (Postfix) with ESMTP id DDD0F60017
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Sep 2019 14:26:04 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id c4so205844edl.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Sep 2019 07:26:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=VG75+CbOnKqNLYynW7d3dzDUBQeDQE3K7T8G0tMkWMg=;
	b=KtkdQ14jzAkV0NTOko5pKrGqW3jJCZQFBiEqeGJrOzRv3d4+ova1SlvVHSVSCanOBS
	5PREf8YSX8d5qbZZdIyUlOanrXb2xEXkhytapEsVTB5rFKTnsQQI2tAvP9JmXiIhX+LS
	QLEXONw9ahwnwAqxCV8raFYUZHQ90B9IBkqBxNCXH7JTe526xFhhDZeXP8D3wwOTDAal
	MegogiL6WstPEfNMWXTQ30y3HymgM/An2Cq+ZiPN67P6egtW0p6WU+yrQXY/dUFwzEH6
	D5JXIX0q+NRtwRJLvnwSrSkevHSc1pr7FNmysnwTvYMKlmS2X/+FAVeZ5d54w1fGA5V3
	n1ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=VG75+CbOnKqNLYynW7d3dzDUBQeDQE3K7T8G0tMkWMg=;
	b=bZuDJDh6Etn5edBuGiqc1n9W3hhMe27Iz0Bct+tXuuxxQbeljr4q+jTR9SNM764W9o
	jb5NdJ5DTPFReepQTqWnwiGmdGrEGr9BIjdugU3IusUU1cRzfNY2EBsb2XtnGuMutglY
	cXjmffQOmhpwBcjX3vbbufXgzOAe43UAMZXncgQm1fJDDwYTV+OvNTm9pVP17ueqUGxT
	5v39Tq6ZY5A1eyhxu4szi1iZyG48PCeCeB1MQuMHqo9gsUeRH1UMnrIOVjQT8x5/ioz0
	/VUiPUGz4q/5kZPhqyzwriVSppnVRvd4/8qKr8zV4LlecR7glcP1cLs+ZdYevajVK/rc
	xWTg==
X-Gm-Message-State: APjAAAXE5uKdDy3QH5EBIi34LSl57vNWfg7R1xL2MA/wK0/xcuJRhMWe
	PG7rZaI13k8lteiPufglfwFRqWXPvBWb6IruGy4=
X-Google-Smtp-Source: APXvYqyiSzEtH9SVY0wo8NnyUt9E9cEmG/jeMPzdYk4qgNi6X7GJ0Hnt6khq/CEh4tST9FtrN2BINjAmjgOF6M0q858=
X-Received: by 2002:a05:6402:696:: with SMTP id
	f22mr8830226edy.216.1568816765389; 
	Wed, 18 Sep 2019 07:26:05 -0700 (PDT)
MIME-Version: 1.0
References: <20190917184947.2244823-1-raj.khem@gmail.com>
In-Reply-To: <20190917184947.2244823-1-raj.khem@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 18 Sep 2019 16:25:53 +0200
Message-ID: <CA+chaQesFedLAhbp0KfnPBFymy09tv8o9H-sy5PGGxGzZ9o52Q@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Adrian Bunk <bunk@stusta.de>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] openssl: Enable os option for with-rand-seed as well
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
X-List-Received-Date: Wed, 18 Sep 2019 14:26:05 -0000
Content-Type: multipart/alternative; boundary="00000000000004cf830592d49ebf"

--00000000000004cf830592d49ebf
Content-Type: text/plain; charset="UTF-8"

Thanks for fix, I was seeing these issues in couple components using
nodejs-native (example bellow) and can confirm that this is now fixed.

internal/crypto/random.js:118
  if (ex) throw ex;
          ^

Error: error:2406C06E:random number generator:RAND_DRBG_instantiate:error
retrieving entropy
    at handleError (internal/crypto/random.js:117:14)
    at Object.randomBytes (internal/crypto/random.js:52:19)
    at
TOPDIR/BUILD/work/x86_64-linux/node-gyp-native/0.12.2+gitAUTOINC+7e98c99ce7-r4/recipe-sysroot-native/usr/lib/node_modules/npm/lib/npm.js:424:32
    at Object.<anonymous>
(TOPDIR/BUILD/work/x86_64-linux/node-gyp-native/0.12.2+gitAUTOINC+7e98c99ce7-r4/recipe-sysroot-native/usr/lib/node_modules/npm/lib/npm.js:476:3)
    at Module._compile (internal/modules/cjs/loader.js:778:30)
    at Object.Module._extensions..js (internal/modules/cjs/loader.js:789:10)
    at Module.load (internal/modules/cjs/loader.js:653:32)
    at tryModuleLoad (internal/modules/cjs/loader.js:593:12)
    at Function.Module._load (internal/modules/cjs/loader.js:585:3)
    at Module.require (internal/modules/cjs/loader.js:692:17)

On Tue, Sep 17, 2019 at 8:50 PM Khem Raj <raj.khem@gmail.com> wrote:

> with openSSL 1.1.1d we start seeing errors like
>
> Error Generating Key
> 139979727451584:error:2406C06E:random number
> generator:RAND_DRBG_instantiate:error retrieving
> entropy:../openssl-1.1.1d/crypto/rand/drbg_lib.c:342:
>
> when using openssl from openssl-native on build hosts, this is due to
> limiting the random seed to devrandom, to support older hosts, since the
> option allows to have a comma separated list of methods to try, we can
> try the default first and if that fails then fallback to devrandom, this
> will ensure that it keeps working with build systems which dont support
> getrandom()
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Cc: Adrian Bunk <bunk@stusta.de>
> Cc: Alexander Kanavin <alex.kanavin@gmail.com>
> ---
>  meta/recipes-connectivity/openssl/openssl_1.1.1d.bb | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.1d.bb
> b/meta/recipes-connectivity/openssl/openssl_1.1.1d.bb
> index 080d1a8bb7..072f727e0b 100644
> --- a/meta/recipes-connectivity/openssl/openssl_1.1.1d.bb
> +++ b/meta/recipes-connectivity/openssl/openssl_1.1.1d.bb
> @@ -43,10 +43,10 @@ do_configure[cleandirs] = "${B}"
>  EXTRA_OECONF_append_libc-musl = " no-async"
>  EXTRA_OECONF_append_libc-musl_powerpc64 = " no-asm"
>
> -# This prevents openssl from using getrandom() which is not available on
> older glibc versions
> +# adding devrandom prevents openssl from using getrandom() which is not
> available on older glibc versions
>  # (native versions can be built with newer glibc, but then relocated onto
> a system with older glibc)
> -EXTRA_OECONF_class-native = "--with-rand-seed=devrandom"
> -EXTRA_OECONF_class-nativesdk = "--with-rand-seed=devrandom"
> +EXTRA_OECONF_class-native = "--with-rand-seed=os,devrandom"
> +EXTRA_OECONF_class-nativesdk = "--with-rand-seed=os,devrandom"
>
>  # Relying on hardcoded built-in paths causes openssl-native to not be
> relocateable from sstate.
>  CFLAGS_append_class-native = " -DOPENSSLDIR=/not/builtin
> -DENGINESDIR=/not/builtin"
> --
> 2.23.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--00000000000004cf830592d49ebf
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks for fix, I was seeing these issues in couple compon=
ents using nodejs-native (example bellow) and can confirm that this is now =
fixed.<div><br></div><div>internal/crypto/random.js:118<br>=C2=A0 if (ex) t=
hrow ex;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^<br><br>Error: error:2406C0=
6E:random number generator:RAND_DRBG_instantiate:error retrieving entropy<b=
r>=C2=A0 =C2=A0 at handleError (internal/crypto/random.js:117:14)<br>=C2=A0=
 =C2=A0 at Object.randomBytes (internal/crypto/random.js:52:19)<br>=C2=A0 =
=C2=A0 at TOPDIR/BUILD/work/x86_64-linux/node-gyp-native/0.12.2+gitAUTOINC+=
7e98c99ce7-r4/recipe-sysroot-native/usr/lib/node_modules/npm/lib/npm.js:424=
:32<br>=C2=A0 =C2=A0 at Object.&lt;anonymous&gt; (TOPDIR/BUILD/work/x86_64-=
linux/node-gyp-native/0.12.2+gitAUTOINC+7e98c99ce7-r4/recipe-sysroot-native=
/usr/lib/node_modules/npm/lib/npm.js:476:3)<br>=C2=A0 =C2=A0 at Module._com=
pile (internal/modules/cjs/loader.js:778:30)<br>=C2=A0 =C2=A0 at Object.Mod=
ule._extensions..js (internal/modules/cjs/loader.js:789:10)<br>=C2=A0 =C2=
=A0 at Module.load (internal/modules/cjs/loader.js:653:32)<br>=C2=A0 =C2=A0=
 at tryModuleLoad (internal/modules/cjs/loader.js:593:12)<br>=C2=A0 =C2=A0 =
at Function.Module._load (internal/modules/cjs/loader.js:585:3)<br>=C2=A0 =
=C2=A0 at Module.require (internal/modules/cjs/loader.js:692:17)<br></div><=
/div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">O=
n Tue, Sep 17, 2019 at 8:50 PM Khem Raj &lt;<a href=3D"mailto:raj.khem@gmai=
l.com" target=3D"_blank">raj.khem@gmail.com</a>&gt; wrote:<br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex">with openSSL 1.1.1d we start see=
ing errors like<br>
<br>
Error Generating Key<br>
139979727451584:error:2406C06E:random number generator:RAND_DRBG_instantiat=
e:error retrieving entropy:../openssl-1.1.1d/crypto/rand/drbg_lib.c:342:<br=
>
<br>
when using openssl from openssl-native on build hosts, this is due to<br>
limiting the random seed to devrandom, to support older hosts, since the<br=
>
option allows to have a comma separated list of methods to try, we can<br>
try the default first and if that fails then fallback to devrandom, this<br=
>
will ensure that it keeps working with build systems which dont support<br>
getrandom()<br>
<br>
Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D=
"_blank">raj.khem@gmail.com</a>&gt;<br>
Cc: Adrian Bunk &lt;<a href=3D"mailto:bunk@stusta.de" target=3D"_blank">bun=
k@stusta.de</a>&gt;<br>
Cc: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com" target=
=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-connectivity/openssl/<a href=3D"http://openssl_1.1.1d.bb=
" rel=3D"noreferrer" target=3D"_blank">openssl_1.1.1d.bb</a> | 6 +++---<br>
=C2=A01 file changed, 3 insertions(+), 3 deletions(-)<br>
<br>
diff --git a/meta/recipes-connectivity/openssl/<a href=3D"http://openssl_1.=
1.1d.bb" rel=3D"noreferrer" target=3D"_blank">openssl_1.1.1d.bb</a> b/meta/=
recipes-connectivity/openssl/<a href=3D"http://openssl_1.1.1d.bb" rel=3D"no=
referrer" target=3D"_blank">openssl_1.1.1d.bb</a><br>
index 080d1a8bb7..072f727e0b 100644<br>
--- a/meta/recipes-connectivity/openssl/<a href=3D"http://openssl_1.1.1d.bb=
" rel=3D"noreferrer" target=3D"_blank">openssl_1.1.1d.bb</a><br>
+++ b/meta/recipes-connectivity/openssl/<a href=3D"http://openssl_1.1.1d.bb=
" rel=3D"noreferrer" target=3D"_blank">openssl_1.1.1d.bb</a><br>
@@ -43,10 +43,10 @@ do_configure[cleandirs] =3D &quot;${B}&quot;<br>
=C2=A0EXTRA_OECONF_append_libc-musl =3D &quot; no-async&quot;<br>
=C2=A0EXTRA_OECONF_append_libc-musl_powerpc64 =3D &quot; no-asm&quot;<br>
<br>
-# This prevents openssl from using getrandom() which is not available on o=
lder glibc versions<br>
+# adding devrandom prevents openssl from using getrandom() which is not av=
ailable on older glibc versions<br>
=C2=A0# (native versions can be built with newer glibc, but then relocated =
onto a system with older glibc)<br>
-EXTRA_OECONF_class-native =3D &quot;--with-rand-seed=3Ddevrandom&quot;<br>
-EXTRA_OECONF_class-nativesdk =3D &quot;--with-rand-seed=3Ddevrandom&quot;<=
br>
+EXTRA_OECONF_class-native =3D &quot;--with-rand-seed=3Dos,devrandom&quot;<=
br>
+EXTRA_OECONF_class-nativesdk =3D &quot;--with-rand-seed=3Dos,devrandom&quo=
t;<br>
<br>
=C2=A0# Relying on hardcoded built-in paths causes openssl-native to not be=
 relocateable from sstate.<br>
=C2=A0CFLAGS_append_class-native =3D &quot; -DOPENSSLDIR=3D/not/builtin -DE=
NGINESDIR=3D/not/builtin&quot;<br>
-- <br>
2.23.0<br>
<br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div>

--00000000000004cf830592d49ebf--
