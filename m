Return-Path: <francescogiancane8@gmail.com>
Received: from mail-wm0-f51.google.com (mail-wm0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id D601A6025F
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 May 2018 21:32:50 +0000 (UTC)
Received: by mail-wm0-f51.google.com with SMTP id l1so26915252wmb.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 May 2018 14:32:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=2LsP4WNF50GnyEAxIBIzpkn7KY9xNLwB96KalyFbBSs=;
	b=PDE26K5PkCqRtZozvqztI9mloO21o2Y9vBhCo3Kt2LnMnsdsPdvfJwQQnfLaZ8SxEF
	PZ4KCxFYvVYzIg9JqUyAeQPDajnBanrIALUrpNHzchf7eUBzSIq6F5j04oiNnJsOejDL
	4sroq4HoDGDRHZqxjCt9bfUKbZ/eDJtIGFsc2f4tCxUZdoJMhVS4CUHdydPrSQEoDBCP
	dAH3Ck0AvRaV7w8UgBv87qRad5Acn52nKKqQnRoOk+ND755LYdZW1lZib9+vWZiVXEZ4
	Mgs+JKLSWIi8ccazktkgF0O7dj32ATzC/B0DzMj46jYbuuj+T0g14f2j7enKkNgE0B3k
	1HUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=2LsP4WNF50GnyEAxIBIzpkn7KY9xNLwB96KalyFbBSs=;
	b=a84OBOEPq3z2mBdKTOmlkxXqwsudA38gmFibOKfWW8Utx+aHWvj2pV9uzAEpWlM4M+
	iaY0qSXc4jGLSeAOyW/4pQvPZifXgifFkoUKcwaUmY8b1MpLNy0LiPvPJouxotLDZoX5
	Xh3tSe+cIFzplRtIr/hOAEwgFaZ3O31qJQlynoZ9hvy1tqZoXRaM8KXmDNXrVe1jiJBU
	JmylrwDKAuB3Wb4V2WsgPtE0aRSVGYrHXtsz+AU7twH+uxDxXKBQiBMTscvbctMfxQmr
	Ejud5haV+RAiaA0zJaUJUSk0X/Y/MeOEqRddTkY/OXaMGKnrbdotQdYWKRIvFIrHaPqE
	oR9w==
X-Gm-Message-State: ALQs6tBqNNBt3Gvanjb1iDQhLqYAo+tTuGu5io/yjGSDYk6nl5Kl6zY4
	/iaQRZGRt5/x3I/PuwVDc2aq/eeI8ezlPrKuQPCq7jOZ
X-Google-Smtp-Source: AB8JxZpuz/DO74NHehG6NfeohOfyNLGSaMjqPEdmLHjj0aQBp+PJsnhzI7Vxn/sp8G+uynmwzAgBjaZed6ZU7O0E50E=
X-Received: by 2002:a50:a926:: with SMTP id
	l35-v6mr15075222edc.106.1525296770756; 
	Wed, 02 May 2018 14:32:50 -0700 (PDT)
MIME-Version: 1.0
From: Francesco Giancane <francescogiancane8@gmail.com>
Date: Wed, 02 May 2018 21:32:40 +0000
Message-ID: <CAEQ58sjQvtnCH1h20y8D6H3NVSbnCTqLe=pSLj6X8=xTL6KWbQ@mail.gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>
Subject: python recipes with extensions fail to find/link with proper libraries
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
X-List-Received-Date: Wed, 02 May 2018 21:32:51 -0000
Content-Type: multipart/alternative; boundary="00000000000032b405056b3fd4a6"

--00000000000032b405056b3fd4a6
Content-Type: text/plain; charset="UTF-8"

Hi Everyone,
I found a problem working with python(3) and C extensions.

The use-case is the recipe for python(3)-numpy, which can be linked against
a BLAS/LAPACK library to use accelerated matricial and vectorial operations.

As it is currently shipped, the recipe fails to find any proper library and
then does not use extensions.

I wrote a custom recipe for openblas which is correctly built & deploy
using standard commands.
openblas is also added as a DEPENDS in a bbappend file for numpy.

However, the do_compile phase cannot find the aforementioned library.

Log attached:

DEBUG: Executing shell function do_compile
blas_opt_info:
blas_mkl_info:
customize UnixCCompiler
  libraries mkl_rt not found in
['/home/fgp/poky/rpi3_64/tmp/work/cortexa7hf-neon-vfpv4-poky-linux-gnueabi/python3-numpy/1.14.2-r0/recipe-sysroot-native/usr/lib']
  NOT AVAILABLE

blis_info:
customize UnixCCompiler
  libraries blis not found in
['/home/fgp/poky/rpi3_64/tmp/work/cortexa7hf-neon-vfpv4-poky-linux-gnueabi/python3-numpy/1.14.2-r0/recipe-sysroot-native/usr/lib']
  NOT AVAILABLE

openblas_info:
customize UnixCCompiler
customize UnixCCompiler
  libraries openblas not found in
['/home/fgp/poky/rpi3_64/tmp/work/cortexa7hf-neon-vfpv4-poky-linux-gnueabi/python3-numpy/1.14.2-r0/recipe-sysroot-native/usr/lib']
  NOT AVAILABLE

atlas_3_10_blas_threads_info:
Setting PTATLAS=ATLAS
customize UnixCCompiler
  libraries tatlas not found in
['/home/fgp/poky/rpi3_64/tmp/work/cortexa7hf-neon-vfpv4-poky-linux-gnueabi/python3-numpy/1.14.2-r0/recipe-sysroot-native/usr/lib']
  NOT AVAILABLE

atlas_3_10_blas_info:
customize UnixCCompiler
  libraries satlas not found in
['/home/fgp/poky/rpi3_64/tmp/work/cortexa7hf-neon-vfpv4-poky-linux-gnueabi/python3-numpy/1.14.2-r0/recipe-sysroot-native/usr/lib']
  NOT AVAILABLE

atlas_blas_threads_info:
Setting PTATLAS=ATLAS
customize UnixCCompiler
  libraries ptf77blas,ptcblas,atlas not found in
['/home/fgp/poky/rpi3_64/tmp/work/cortexa7hf-neon-vfpv4-poky-linux-gnueabi/python3-numpy/1.14.2-r0/recipe-sysroot-native/usr/lib']
  NOT AVAILABLE

atlas_blas_info:
customize UnixCCompiler
  libraries f77blas,cblas,atlas not found in
['/home/fgp/poky/rpi3_64/tmp/work/cortexa7hf-neon-vfpv4-poky-linux-gnueabi/python3-numpy/1.14.2-r0/recipe-sysroot-native/usr/lib']
  NOT AVAILABLE

blas_info:
customize UnixCCompiler
  libraries blas not found in
['/home/fgp/poky/rpi3_64/tmp/work/cortexa7hf-neon-vfpv4-poky-linux-gnueabi/python3-numpy/1.14.2-r0/recipe-sysroot-native/usr/lib']
  NOT AVAILABLE

blas_src_info:
  NOT AVAILABLE

  NOT AVAILABLE

...And it is correct for it to fail as it is searching for openblas in the
wrong path (sysroot-native vs sysroot).

I would assume that this is a setuptools.bbclass issue, does anyone know
what to do? Is it trivial to fix?

I noticed that all the shipped python extensions were built as if we were
building for x86, even though the MACHINE is an arm target.

Thank you for your attention,

Francesco Giancane

--00000000000032b405056b3fd4a6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Everyone,<div>I found a problem working with python(3) =
and C extensions.</div><div><br></div><div>The use-case is the recipe for p=
ython(3)-numpy, which can be linked against a BLAS/LAPACK library to use ac=
celerated matricial and vectorial operations.</div><div><br></div><div>As i=
t is currently shipped, the recipe fails to find any proper library and the=
n does not use extensions.</div><div><br></div><div>I wrote a custom recipe=
 for openblas which is correctly built &amp; deploy using standard commands=
.</div><div>openblas is also added as a DEPENDS in a bbappend file for nump=
y.</div><div><br></div><div>However, the do_compile phase cannot find the a=
forementioned library.</div><div><br></div><div>Log attached:</div><div><br=
></div><div><div>DEBUG: Executing shell function do_compile</div><div>blas_=
opt_info:</div><div>blas_mkl_info:</div><div>customize UnixCCompiler</div><=
div>=C2=A0 libraries mkl_rt not found in [&#39;/home/fgp/poky/rpi3_64/tmp/w=
ork/cortexa7hf-neon-vfpv4-poky-linux-gnueabi/python3-numpy/1.14.2-r0/recipe=
-sysroot-native/usr/lib&#39;]</div><div>=C2=A0 NOT AVAILABLE</div><div><br>=
</div><div>blis_info:</div><div>customize UnixCCompiler</div><div>=C2=A0 li=
braries blis not found in [&#39;/home/fgp/poky/rpi3_64/tmp/work/cortexa7hf-=
neon-vfpv4-poky-linux-gnueabi/python3-numpy/1.14.2-r0/recipe-sysroot-native=
/usr/lib&#39;]</div><div>=C2=A0 NOT AVAILABLE</div><div><br></div><div>open=
blas_info:</div><div>customize UnixCCompiler</div><div>customize UnixCCompi=
ler</div><div>=C2=A0 libraries openblas not found in [&#39;/home/fgp/poky/r=
pi3_64/tmp/work/cortexa7hf-neon-vfpv4-poky-linux-gnueabi/python3-numpy/1.14=
.2-r0/recipe-sysroot-native/usr/lib&#39;]</div><div>=C2=A0 NOT AVAILABLE</d=
iv><div><br></div><div>atlas_3_10_blas_threads_info:</div><div>Setting PTAT=
LAS=3DATLAS</div><div>customize UnixCCompiler</div><div>=C2=A0 libraries ta=
tlas not found in [&#39;/home/fgp/poky/rpi3_64/tmp/work/cortexa7hf-neon-vfp=
v4-poky-linux-gnueabi/python3-numpy/1.14.2-r0/recipe-sysroot-native/usr/lib=
&#39;]</div><div>=C2=A0 NOT AVAILABLE</div><div><br></div><div>atlas_3_10_b=
las_info:</div><div>customize UnixCCompiler</div><div>=C2=A0 libraries satl=
as not found in [&#39;/home/fgp/poky/rpi3_64/tmp/work/cortexa7hf-neon-vfpv4=
-poky-linux-gnueabi/python3-numpy/1.14.2-r0/recipe-sysroot-native/usr/lib&#=
39;]</div><div>=C2=A0 NOT AVAILABLE</div><div><br></div><div>atlas_blas_thr=
eads_info:</div><div>Setting PTATLAS=3DATLAS</div><div>customize UnixCCompi=
ler</div><div>=C2=A0 libraries ptf77blas,ptcblas,atlas not found in [&#39;/=
home/fgp/poky/rpi3_64/tmp/work/cortexa7hf-neon-vfpv4-poky-linux-gnueabi/pyt=
hon3-numpy/1.14.2-r0/recipe-sysroot-native/usr/lib&#39;]</div><div>=C2=A0 N=
OT AVAILABLE</div><div><br></div><div>atlas_blas_info:</div><div>customize =
UnixCCompiler</div><div>=C2=A0 libraries f77blas,cblas,atlas not found in [=
&#39;/home/fgp/poky/rpi3_64/tmp/work/cortexa7hf-neon-vfpv4-poky-linux-gnuea=
bi/python3-numpy/1.14.2-r0/recipe-sysroot-native/usr/lib&#39;]</div><div>=
=C2=A0 NOT AVAILABLE</div><div><br></div><div>blas_info:</div><div>customiz=
e UnixCCompiler</div><div>=C2=A0 libraries blas not found in [&#39;/home/fg=
p/poky/rpi3_64/tmp/work/cortexa7hf-neon-vfpv4-poky-linux-gnueabi/python3-nu=
mpy/1.14.2-r0/recipe-sysroot-native/usr/lib&#39;]</div><div>=C2=A0 NOT AVAI=
LABLE</div><div><br></div><div>blas_src_info:</div><div>=C2=A0 NOT AVAILABL=
E</div><div><br></div><div>=C2=A0 NOT AVAILABLE</div><div><br></div><div>..=
.And it is correct for it to fail as it is searching for openblas in the wr=
ong path (sysroot-native vs sysroot).</div><div><br></div><div>I would assu=
me that this is a setuptools.bbclass issue, does anyone know what to do? Is=
 it trivial to fix?</div><div><br></div><div>I noticed that all the shipped=
 python extensions were built as if we were building for x86, even though t=
he MACHINE is an arm target.</div><div><br></div><div>Thank you for your at=
tention,</div><div><br clear=3D"all"><div><div dir=3D"ltr" class=3D"gmail_s=
ignature"><div dir=3D"ltr"><div dir=3D"ltr"><div><div dir=3D"ltr">Francesco=
 Giancane</div></div><div><dd style=3D"margin:0px;padding:0px;border:0px;fo=
nt-style:inherit;font-family:inherit;vertical-align:top;line-height:inherit=
;display:inline-block"><span style=3D"margin:0px;padding:0px;border:0px;fon=
t-style:inherit;font-family:inherit;vertical-align:baseline;line-height:inh=
erit;direction:ltr"><br></span></dd></div></div></div></div></div></div></d=
iv></div>

--00000000000032b405056b3fd4a6--
