Return-Path: <douglas.royds@taitradio.com>
Received: from smtp1.taitradio.net (unknown [202.37.96.23])
	by mail.openembedded.org (Postfix) with SMTP id 5C41F744C5
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Oct 2018 02:43:11 +0000 (UTC)
Received: from [172.16.169.141] (unknown [172.16.169.141])
	by smtp1.taitradio.net (Postfix) with ESMTP id B7C561C0010
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Oct 2018 15:43:11 +1300 (NZDT)
From: Douglas Royds <douglas.royds@taitradio.com>
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
References: <2f47bda4-deb2-9603-a151-8330f0d52e08@taitradio.com>
	<c5a520ffbff2e4b1f12355b7605b5f5988228101.camel@linuxfoundation.org>
	<4f206827-9c6e-608a-409f-a66edcfcec2d@taitradio.com>
Message-ID: <8738d389-5361-272b-f329-63c6538bb9ed@taitradio.com>
Date: Wed, 3 Oct 2018 15:43:11 +1300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <4f206827-9c6e-608a-409f-a66edcfcec2d@taitradio.com>
Subject: Re: glibc binary reproducibility
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
X-List-Received-Date: Wed, 03 Oct 2018 02:43:13 -0000
Content-Type: multipart/alternative;
	boundary="------------75A127D05BB4484DE4963E8D"
Content-Language: en-GB

--------------75A127D05BB4484DE4963E8D
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 03/10/18 15:37, Douglas Royds wrote:

> I added "realpath" to the HOSTTOOLS, and precomputed a relative path=20
> to the csu/ dir in git/Makerules.
>
>     csu-objpfx-relative =3D $(shell realpath --relative-to=3D`pwd`
>     $(csu-objpfx))/
>
> Seems to do the trick. I'll send a patch(ish) separately.=20


Richard, this patch (perhaps) applies on top of your poky-contrib=20
branch. I've used `realpath` instead of your python oe-relpaths script,=20
just because it was there. Requires coreutils 8.23 or later, I believe=20
(Ubuntu 16.04 or later).


Subject: [PATCH] glibc: Fix non-IA reproducibility for shared libraries

Compute a relative path to build-arm-tait-linux-gnueabi/csu/
for each library subdirectory.

Signed-off-by: Douglas Royds <douglas.royds@taitradio.com>
---
 =C2=A0meta/conf/bitbake.conf=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0 2 +-
 =C2=A0...34-reproducible-makehack-shared-libs.patch | 48 +++++++++++++++=
++++
 =C2=A0meta/recipes-core/glibc/glibc_2.28.bb=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0 1 +
 =C2=A03 files changed, 50 insertions(+), 1 deletion(-)
 =C2=A0create mode 100644=20
meta/recipes-core/glibc/glibc/0034-reproducible-makehack-shared-libs.patc=
h

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 1941633a54..aa759b19a3 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -482,7 +482,7 @@ HOSTTOOLS +=3D " \
 =C2=A0=C2=A0=C2=A0=C2=A0 fgrep file find flock g++ gawk gcc getconf geto=
pt git grep gunzip=20
gzip \
 =C2=A0=C2=A0=C2=A0=C2=A0 head hostname id install ld ldd ln ls make make=
info md5sum mkdir=20
mknod \
 =C2=A0=C2=A0=C2=A0=C2=A0 mktemp mv nm objcopy objdump od patch perl pod2=
man pr printf pwd=20
python python2 \
-=C2=A0=C2=A0=C2=A0 python2.7 python3 ranlib readelf readlink rm rmdir rp=
cgen sed sh=20
sha256sum \
+=C2=A0=C2=A0=C2=A0 python2.7 python3 ranlib readelf readlink realpath rm=
 rmdir rpcgen=20
sed sh sha256sum \
 =C2=A0=C2=A0=C2=A0=C2=A0 sleep sort split stat strings strip tail tar te=
e test touch tr=20
true uname \
 =C2=A0=C2=A0=C2=A0=C2=A0 uniq wc wget which xargs \
 =C2=A0"
diff --git=20
a/meta/recipes-core/glibc/glibc/0034-reproducible-makehack-shared-libs.pa=
tch=20
b/meta/recipes-core/glibc/glibc/0034-reproducible-makehack-shared-libs.pa=
tch
new file mode 100644
index 0000000000..11902be523
--- /dev/null
+++=20
b/meta/recipes-core/glibc/glibc/0034-reproducible-makehack-shared-libs.pa=
tch
@@ -0,0 +1,48 @@
+diff --git a/Makerules b/Makerules
+index a10a0b4d70..cacddb8784 100644
+--- a/Makerules
++++ b/Makerules
+@@ -606,10 +606,11 @@ lib%.so: lib%_pic.a $(+preinit) $(+postinit)=20
$(link-libc-deps)
+ =C2=A0=C2=A0=C2=A0 $(build-shlib) $(link-libc-args)
+ =C2=A0=C2=A0=C2=A0 $(call after-link,$@)
+
++csu-objpfx-relative =3D $(shell realpath --relative-to=3D`pwd` $(csu-ob=
jpfx))/
+ define build-shlib-helper
+ $(LINK.o) -shared -static-libgcc -Wl,-O1 $(sysdep-LDFLAGS) \
+ =C2=A0=C2=A0=C2=A0 =C2=A0 $(if $($(@F)-no-z-defs)$(no-z-defs),,-Wl,-z,d=
efs) $(rtld-LDFLAGS) \
+-=C2=A0=C2=A0=C2=A0 =C2=A0 $(extra-B-$(@F:lib%.so=3D%).so) -B$(csu-objpf=
x) \
++=C2=A0=C2=A0=C2=A0 =C2=A0 $(extra-B-$(@F:lib%.so=3D%).so) -B$(csu-objpf=
x-relative) \
+ =C2=A0=C2=A0=C2=A0 =C2=A0 $(extra-B-$(@F:lib%.so=3D%).so) $(load-map-fi=
le) \
+ -Wl,-soname=3Dlib$(libprefix)$(@F:lib%.so=3D%).so$($(@F)-version) \
+ =C2=A0=C2=A0=C2=A0 =C2=A0 $(LDFLAGS.so) $(LDFLAGS-lib.so) $(LDFLAGS-$(@=
F:lib%.so=3D%).so) \
+@@ -662,13 +663,13 @@ endif
+
+ define build-shlib
+ $(build-shlib-helper) -o $@ $(shlib-lds-flags) \
+-=C2=A0=C2=A0=C2=A0 =C2=A0 $(csu-objpfx)abi-note.o $(build-shlib-objlist=
)
++=C2=A0=C2=A0=C2=A0 =C2=A0 $(csu-objpfx-relative)abi-note.o $(build-shli=
b-objlist)
+ endef
+
+ define build-module-helper
+ $(LINK.o) -shared -static-libgcc $(sysdep-LDFLAGS) $(rtld-LDFLAGS) \
+ =C2=A0=C2=A0=C2=A0 =C2=A0 $(if $($(@F)-no-z-defs)$(no-z-defs),,-Wl,-z,d=
efs) \
+-=C2=A0=C2=A0=C2=A0 =C2=A0 -B$(csu-objpfx) $(load-map-file) \
++=C2=A0=C2=A0=C2=A0 =C2=A0 -B$(csu-objpfx-relative) $(load-map-file) \
+ =C2=A0=C2=A0=C2=A0 =C2=A0 $(LDFLAGS.so) $(LDFLAGS-$(@F:%.so=3D%).so) \
+ =C2=A0=C2=A0=C2=A0 =C2=A0 -L$(subst :, -L,$(rpath-link)) -Wl,-rpath-lin=
k=3D$(rpath-link)
+ endef
+@@ -679,12 +680,12 @@ endef
+ # not for shared objects
+ define build-module
+ $(build-module-helper) -o $@ $(shlib-lds-flags) \
+-=C2=A0=C2=A0=C2=A0 =C2=A0 $(csu-objpfx)abi-note.o $(build-module-objlis=
t) $(link-libc-args)
++=C2=A0=C2=A0=C2=A0 =C2=A0 $(csu-objpfx-relative)abi-note.o $(build-modu=
le-objlist)=20
$(link-libc-args)
+ $(call after-link,$@)
+ endef
+ define build-module-asneeded
+ $(build-module-helper) -o $@ $(shlib-lds-flags) \
+-=C2=A0=C2=A0=C2=A0 =C2=A0 $(csu-objpfx)abi-note.o \
++=C2=A0=C2=A0=C2=A0 =C2=A0 $(csu-objpfx-relative)abi-note.o \
+ =C2=A0=C2=A0=C2=A0 =C2=A0 -Wl,--as-needed $(build-module-objlist) -Wl,-=
-no-as-needed \
+ =C2=A0=C2=A0=C2=A0 =C2=A0 $(link-libc-args)
+ $(call after-link,$@)
diff --git a/meta/recipes-core/glibc/glibc_2.28.bb=20
b/meta/recipes-core/glibc/glibc_2.28.bb
index 6ca89cbe2c..9d1d46bf28 100644
--- a/meta/recipes-core/glibc/glibc_2.28.bb
+++ b/meta/recipes-core/glibc/glibc_2.28.bb
@@ -46,6 +46,7 @@ SRC_URI =3D=20
"${GLIBC_GIT_URI};branch=3D${SRCBRANCH};name=3Dglibc \
file://0029-localedef-add-to-archive-uses-a-hard-coded-locale-pa.patch \
file://0030-intl-Emit-no-lines-in-bison-generated-files.patch \
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 file:=
//0033-reproducible-makehack.patch \
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 file://0034=
-reproducible-makehack-shared-libs.patch \
 =C2=A0"

 =C2=A0NATIVESDKFIXES ?=3D ""
--=20
2.17.1



--------------75A127D05BB4484DE4963E8D
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html>
  <head>
    <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf=
-8">
  </head>
  <body text=3D"#000000" bgcolor=3D"#FFFFFF">
    <p>On 03/10/18 15:37, Douglas Royds wrote:
      <blockquote type=3D"cite">
        <meta http-equiv=3D"Content-Type" content=3D"text/html;
          charset=3Dutf-8">
        I added "realpath" to the HOSTTOOLS, and precomputed a relative
        path to the csu/ dir in git/Makerules.<br>
        <blockquote><tt>csu-objpfx-relative =3D $(shell realpath
            --relative-to=3D`pwd` $(csu-objpfx))/</tt><br>
        </blockquote>
        Seems to do the trick. I'll send a patch(ish) separately. </block=
quote>
    </p>
    <p><br>
    </p>
    <p>Richard, this patch (perhaps) applies on top of your poky-contrib
      branch. I've used `realpath` instead of your python oe-relpaths
      script, just because it was there. Requires coreutils 8.23 or
      later, I believe (Ubuntu 16.04 or later).<br>
    </p>
    <p><br>
    </p>
    <p>Subject: [PATCH] glibc: Fix non-IA reproducibility for shared
      libraries<br>
      <br>
      Compute a relative path to build-arm-tait-linux-gnueabi/csu/<br>
      for each library subdirectory.<br>
      <br>
      Signed-off-by: Douglas Royds <a class=3D"moz-txt-link-rfc2396E" hre=
f=3D"mailto:douglas.royds@taitradio.com">&lt;douglas.royds@taitradio.com&=
gt;</a><br>
      ---<br>
      =C2=A0meta/conf/bitbake.conf=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 +-<br>
      =C2=A0...34-reproducible-makehack-shared-libs.patch | 48
      +++++++++++++++++++<br>
      =C2=A0meta/recipes-core/glibc/glibc_2.28.bb=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 1 +<br>
      =C2=A03 files changed, 50 insertions(+), 1 deletion(-)<br>
      =C2=A0create mode 100644
meta/recipes-core/glibc/glibc/0034-reproducible-makehack-shared-libs.patc=
h<br>
      <br>
      diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf<br>
      index 1941633a54..aa759b19a3 100644<br>
      --- a/meta/conf/bitbake.conf<br>
      +++ b/meta/conf/bitbake.conf<br>
      @@ -482,7 +482,7 @@ HOSTTOOLS +=3D " \<br>
      =C2=A0=C2=A0=C2=A0=C2=A0 fgrep file find flock g++ gawk gcc getconf=
 getopt git grep
      gunzip gzip \<br>
      =C2=A0=C2=A0=C2=A0=C2=A0 head hostname id install ld ldd ln ls make=
 makeinfo md5sum
      mkdir mknod \<br>
      =C2=A0=C2=A0=C2=A0=C2=A0 mktemp mv nm objcopy objdump od patch perl=
 pod2man pr printf
      pwd python python2 \<br>
      -=C2=A0=C2=A0=C2=A0 python2.7 python3 ranlib readelf readlink rm rm=
dir rpcgen sed
      sh sha256sum \<br>
      +=C2=A0=C2=A0=C2=A0 python2.7 python3 ranlib readelf readlink realp=
ath rm rmdir
      rpcgen sed sh sha256sum \<br>
      =C2=A0=C2=A0=C2=A0=C2=A0 sleep sort split stat strings strip tail t=
ar tee test touch
      tr true uname \<br>
      =C2=A0=C2=A0=C2=A0=C2=A0 uniq wc wget which xargs \<br>
      =C2=A0"<br>
      diff --git
a/meta/recipes-core/glibc/glibc/0034-reproducible-makehack-shared-libs.pa=
tch
b/meta/recipes-core/glibc/glibc/0034-reproducible-makehack-shared-libs.pa=
tch<br>
      new file mode 100644<br>
      index 0000000000..11902be523<br>
      --- /dev/null<br>
      +++
b/meta/recipes-core/glibc/glibc/0034-reproducible-makehack-shared-libs.pa=
tch<br>
      @@ -0,0 +1,48 @@<br>
      +diff --git a/Makerules b/Makerules<br>
      +index a10a0b4d70..cacddb8784 100644<br>
      +--- a/Makerules<br>
      ++++ b/Makerules<br>
      +@@ -606,10 +606,11 @@ lib%.so: lib%_pic.a $(+preinit)
      $(+postinit) $(link-libc-deps)<br>
      + =C2=A0=C2=A0=C2=A0 $(build-shlib) $(link-libc-args)<br>
      + =C2=A0=C2=A0=C2=A0 $(call after-link,$@)<br>
      + <br>
      ++csu-objpfx-relative =3D $(shell realpath --relative-to=3D`pwd`
      $(csu-objpfx))/<br>
      + define build-shlib-helper<br>
      + $(LINK.o) -shared -static-libgcc -Wl,-O1 $(sysdep-LDFLAGS) \<br>
      + =C2=A0=C2=A0=C2=A0 =C2=A0 $(if $($(@F)-no-z-defs)$(no-z-defs),,-W=
l,-z,defs)
      $(rtld-LDFLAGS) \<br>
      +-=C2=A0=C2=A0=C2=A0 =C2=A0 $(extra-B-$(@F:lib%.so=3D%).so) -B$(csu=
-objpfx) \<br>
      ++=C2=A0=C2=A0=C2=A0 =C2=A0 $(extra-B-$(@F:lib%.so=3D%).so) -B$(csu=
-objpfx-relative) \<br>
      + =C2=A0=C2=A0=C2=A0 =C2=A0 $(extra-B-$(@F:lib%.so=3D%).so) $(load-=
map-file) \<br>
      + =C2=A0=C2=A0=C2=A0 =C2=A0
      -Wl,-soname=3Dlib$(libprefix)$(@F:lib%.so=3D%).so$($(@F)-version) \=
<br>
      + =C2=A0=C2=A0=C2=A0 =C2=A0 $(LDFLAGS.so) $(LDFLAGS-lib.so)
      $(LDFLAGS-$(@F:lib%.so=3D%).so) \<br>
      +@@ -662,13 +663,13 @@ endif<br>
      + <br>
      + define build-shlib<br>
      + $(build-shlib-helper) -o $@ $(shlib-lds-flags) \<br>
      +-=C2=A0=C2=A0=C2=A0 =C2=A0 $(csu-objpfx)abi-note.o $(build-shlib-o=
bjlist)<br>
      ++=C2=A0=C2=A0=C2=A0 =C2=A0 $(csu-objpfx-relative)abi-note.o $(buil=
d-shlib-objlist)<br>
      + endef<br>
      + <br>
      + define build-module-helper<br>
      + $(LINK.o) -shared -static-libgcc $(sysdep-LDFLAGS)
      $(rtld-LDFLAGS) \<br>
      + =C2=A0=C2=A0=C2=A0 =C2=A0 $(if $($(@F)-no-z-defs)$(no-z-defs),,-W=
l,-z,defs) \<br>
      +-=C2=A0=C2=A0=C2=A0 =C2=A0 -B$(csu-objpfx) $(load-map-file) \<br>
      ++=C2=A0=C2=A0=C2=A0 =C2=A0 -B$(csu-objpfx-relative) $(load-map-fil=
e) \<br>
      + =C2=A0=C2=A0=C2=A0 =C2=A0 $(LDFLAGS.so) $(LDFLAGS-$(@F:%.so=3D%).=
so) \<br>
      + =C2=A0=C2=A0=C2=A0 =C2=A0 -L$(subst :, -L,$(rpath-link))
      -Wl,-rpath-link=3D$(rpath-link)<br>
      + endef<br>
      +@@ -679,12 +680,12 @@ endef<br>
      + # not for shared objects<br>
      + define build-module<br>
      + $(build-module-helper) -o $@ $(shlib-lds-flags) \<br>
      +-=C2=A0=C2=A0=C2=A0 =C2=A0 $(csu-objpfx)abi-note.o $(build-module-=
objlist)
      $(link-libc-args)<br>
      ++=C2=A0=C2=A0=C2=A0 =C2=A0 $(csu-objpfx-relative)abi-note.o $(buil=
d-module-objlist)
      $(link-libc-args)<br>
      + $(call after-link,$@)<br>
      + endef<br>
      + define build-module-asneeded<br>
      + $(build-module-helper) -o $@ $(shlib-lds-flags) \<br>
      +-=C2=A0=C2=A0=C2=A0 =C2=A0 $(csu-objpfx)abi-note.o \<br>
      ++=C2=A0=C2=A0=C2=A0 =C2=A0 $(csu-objpfx-relative)abi-note.o \<br>
      + =C2=A0=C2=A0=C2=A0 =C2=A0 -Wl,--as-needed $(build-module-objlist)=
 -Wl,--no-as-needed
      \<br>
      + =C2=A0=C2=A0=C2=A0 =C2=A0 $(link-libc-args)<br>
      + $(call after-link,$@)<br>
      diff --git a/meta/recipes-core/glibc/glibc_2.28.bb
      b/meta/recipes-core/glibc/glibc_2.28.bb<br>
      index 6ca89cbe2c..9d1d46bf28 100644<br>
      --- a/meta/recipes-core/glibc/glibc_2.28.bb<br>
      +++ b/meta/recipes-core/glibc/glibc_2.28.bb<br>
      @@ -46,6 +46,7 @@ SRC_URI =3D
      "${GLIBC_GIT_URI};branch=3D${SRCBRANCH};name=3Dglibc \<br>
      =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
      <a class=3D"moz-txt-link-freetext" href=3D"file://0029-localedef-ad=
d-to-archive-uses-a-hard-coded-locale-pa.patch">file://0029-localedef-add=
-to-archive-uses-a-hard-coded-locale-pa.patch</a>
      \<br>
      =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
      <a class=3D"moz-txt-link-freetext" href=3D"file://0030-intl-Emit-no=
-lines-in-bison-generated-files.patch">file://0030-intl-Emit-no-lines-in-=
bison-generated-files.patch</a> \<br>
      =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
<a class=3D"moz-txt-link-freetext" href=3D"file://0033-reproducible-makeh=
ack.patch">file://0033-reproducible-makehack.patch</a> \<br>
      +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 <a cl=
ass=3D"moz-txt-link-freetext" href=3D"file://0034-reproducible-makehack-s=
hared-libs.patch">file://0034-reproducible-makehack-shared-libs.patch</a>=
 \<br>
      =C2=A0"<br>
      =C2=A0<br>
      =C2=A0NATIVESDKFIXES ?=3D ""<br>
      -- <br>
      2.17.1<br>
      <br>
      <br>
    </p>
  </body>
</html>

--------------75A127D05BB4484DE4963E8D--
