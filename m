Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f179.google.com (mail-io0-f179.google.com
	[209.85.223.179])
	by mail.openembedded.org (Postfix) with ESMTP id 6CD4D78442
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jul 2017 11:58:19 +0000 (UTC)
Received: by mail-io0-f179.google.com with SMTP id g13so88872580ioj.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jul 2017 04:58:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=2V/XufVQbSdCck0t71ixmZ+mToJCj485ZAVipWVQAtM=;
	b=jqA48eCgEY8WTF1Hp77Pu2eGvFQ1gJCJcH8B24rq7wRyiArkliRUMPWC+8mqjyHYpV
	V/7jkhqJYn2UlWhmXpSUagB7YwxmxQTNKAxrIJnkTBZaYw26NP6ce7vLP8+/UbUzQoaJ
	5sbzy7PAs3h1PH6Kgp67culxCwesRyLSAlsVu0wTMsnq0XuAFrhCEHjnyRyMYsN8xW/g
	g6Jx6MbXEcJoEEjsYPgYVfaW7V/sssKRK1f5oQyKtpFPSnfthrfd+bL5LeEu6YOpGgDX
	fnTNzr1rdviU7hzJiVZTxByAGCX20W234cy/wYLpk88o/nD6t3YeHQ1y7T4Iuf5CXLRH
	kLvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=2V/XufVQbSdCck0t71ixmZ+mToJCj485ZAVipWVQAtM=;
	b=GoRrkiVBLpYKKA/RpYK9NnVcI2A79365QEfq1xPO68yKu5LZyW+orHYlTO3aHiU3X6
	gLR8aCA8ygmwdIe9Vusm32eT8psHfo8vhe/ZvbXr93JBltooK/W5hHlIv7IfnjhRqhpi
	zRovuWwz1MwsWZf+DWLV2AOeIXtvZFoLUDJvSkbuXTcleYX3LQJua5svMhKEBqJl5Xjk
	MOzxWx0m2+uOFl5rdJpPASznP7m4Ir+T9XIyaBeUfd1GB3xSJatsSPaY3ZKHLDCbbK+X
	K8fnbEm3cTYd8VkcJWwE3lFIs5vB7F5f3N9hDbKIarZWd9mI6qvzQVQnrevKVm/bMWvi
	ku6Q==
X-Gm-Message-State: AIVw112Xxm5VCMEqlbGaeG1s6xy5/JvyffqMK4x/uQpqa7/W2TVR94Tm
	DYeJQsrr1bOQNkY9YvMHDzDJJplQjzQXJ3Q=
X-Received: by 10.107.170.170 with SMTP id g42mr9422857ioj.19.1501243100779;
	Fri, 28 Jul 2017 04:58:20 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.135.234 with HTTP; Fri, 28 Jul 2017 04:58:00 -0700 (PDT)
In-Reply-To: <20170727144046.13124-1-alexander.kanavin@linux.intel.com>
References: <20170727144046.13124-1-alexander.kanavin@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 28 Jul 2017 12:58:00 +0100
Message-ID: <CAJTo0LbB7mbUmSjiXgnTBYi8G1uBoJ-i2-vCX79Jki7EYbwQGw@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv2] libcap: fix build with gperf 3.1
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
X-List-Received-Date: Fri, 28 Jul 2017 11:58:19 -0000
Content-Type: multipart/alternative; boundary="001a114260babe6f1505555f6582"

--001a114260babe6f1505555f6582
Content-Type: text/plain; charset="UTF-8"

This breaks systemd:

| In file included from ../git/src/basic/cap-list.c:31:0:
| ./src/basic/cap-from-name.h:141:1: error: conflicting types for
'lookup_capability'
|  lookup_capability (register const char *str, register size_t len)
|  ^~~~~~~~~~~~~~~~~
| ../git/src/basic/cap-list.c:29:38: note: previous declaration of
'lookup_capability' was here
|  static const struct capability_name* lookup_capability(register const
char *str, register unsigned int len);
|                                       ^~~~~~~~~~~~~~~~~

Ross

On 27 July 2017 at 15:40, Alexander Kanavin <
alexander.kanavin@linux.intel.com> wrote:

> Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
> ---
>  .../files/0001-Fix-build-with-gperf-3.1.patch      | 41
> ++++++++++++++++++++++
>  meta/recipes-support/libcap/libcap_2.25.bb         |  3 +-
>  2 files changed, 43 insertions(+), 1 deletion(-)
>  create mode 100644 meta/recipes-support/libcap/files/0001-Fix-build-with-
> gperf-3.1.patch
>
> diff --git a/meta/recipes-support/libcap/files/0001-Fix-build-with-gperf-3.1.patch
> b/meta/recipes-support/libcap/files/0001-Fix-build-with-gperf-3.1.patch
> new file mode 100644
> index 00000000000..110ef902da2
> --- /dev/null
> +++ b/meta/recipes-support/libcap/files/0001-Fix-build-with-
> gperf-3.1.patch
> @@ -0,0 +1,41 @@
> +From a05eba68c42222f02465d7ba376015926433c531 Mon Sep 17 00:00:00 2001
> +From: Alexander Kanavin <alex.kanavin@gmail.com>
> +Date: Wed, 26 Jul 2017 13:37:49 +0300
> +Subject: [PATCH] Fix build with gperf 3.1
> +
> +The generated gperf file refers to size_t which needs to be
> +provided by stddef.h include. Also, adjust the makefile
> +to match the declaration in the gperf file.
> +
> +Upstream-Status: Pending
> +Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> +
> +---
> + libcap/Makefile | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/libcap/Makefile b/libcap/Makefile
> +index d189777..1a57206 100644
> +--- a/libcap/Makefile
> ++++ b/libcap/Makefile
> +@@ -22,7 +22,7 @@ all: $(MINLIBNAME) $(STALIBNAME) libcap.pc
> +
> + ifeq ($(BUILD_GPERF),yes)
> + USE_GPERF_OUTPUT = $(GPERF_OUTPUT)
> +-INCLUDE_GPERF_OUTPUT = -include $(GPERF_OUTPUT)
> ++INCLUDE_GPERF_OUTPUT = -include stddef.h -include $(GPERF_OUTPUT)
> + endif
> +
> + libcap.pc: libcap.pc.in
> +@@ -41,7 +41,7 @@ cap_names.h: _makenames
> +       ./_makenames > cap_names.h
> +
> + $(GPERF_OUTPUT): cap_names.list.h
> +-      perl -e 'print "struct __cap_token_s { const char *name; int
> index; };\n%{\nconst struct __cap_token_s *__cap_lookup_name(const char *,
> unsigned int);\n%}\n%%\n"; while ($$l = <>) { $$l =~ s/[\{\"]//g; $$l =~
> s/\}.*// ; print $$l; }' < $< | gperf --ignore-case --language=ANSI-C
> --readonly --null-strings --global-table --hash-function-name=__cap_hash_name
> --lookup-function-name="__cap_lookup_name" -c -t -m20 $(INDENT) > $@
> ++      perl -e 'print "struct __cap_token_s { const char *name; int
> index; };\n%{\nconst struct __cap_token_s *__cap_lookup_name(const char *,
> register size_t);\n%}\n%%\n"; while ($$l = <>) { $$l =~ s/[\{\"]//g; $$l =~
> s/\}.*// ; print $$l; }' < $< | gperf --ignore-case --language=ANSI-C
> --readonly --null-strings --global-table --hash-function-name=__cap_hash_name
> --lookup-function-name="__cap_lookup_name" -c -t -m20 $(INDENT) > $@
> +
> + cap_names.list.h: Makefile $(KERNEL_HEADERS)/linux/capability.h
> +       @echo "=> making $@ from $(KERNEL_HEADERS)/linux/capability.h"
> +--
> +2.13.2
> +
> diff --git a/meta/recipes-support/libcap/libcap_2.25.bb
> b/meta/recipes-support/libcap/libcap_2.25.bb
> index 5c2765f343a..d619a2eb4cc 100644
> --- a/meta/recipes-support/libcap/libcap_2.25.bb
> +++ b/meta/recipes-support/libcap/libcap_2.25.bb
> @@ -9,7 +9,8 @@ DEPENDS = "hostperl-runtime-native gperf-native"
>
>  SRC_URI = "${KERNELORG_MIRROR}/linux/libs/security/linux-privs/${BPN}2/${BPN}-${PV}.tar.xz
> \
>             file://0001-ensure-the-XATTR_NAME_CAPS-is-defined-when-it-is-use.patch
> \
> -"
> +           file://0001-Fix-build-with-gperf-3.1.patch \
> +           "
>  SRC_URI[md5sum] = "6666b839e5d46c2ad33fc8aa2ceb5f77"
>  SRC_URI[sha256sum] = "693c8ac51e983ee678205571ef2724
> 39d83afe62dd8e424ea14ad9790bc35162"
>
> --
> 2.13.2
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a114260babe6f1505555f6582
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">This breaks systemd:<div><br></div><div><div>| In file inc=
luded from ../git/src/basic/cap-list.c:31:0:</div><div>| ./src/basic/cap-fr=
om-name.h:141:1: error: conflicting types for &#39;lookup_capability&#39;</=
div><div>| =C2=A0lookup_capability (register const char *str, register size=
_t len)</div><div>| =C2=A0^~~~~~~~~~~~~~~~~</div><div>| ../git/src/basic/ca=
p-list.c:29:38: note: previous declaration of &#39;lookup_capability&#39; w=
as here</div><div>| =C2=A0static const struct capability_name* lookup_capab=
ility(register const char *str, register unsigned int len);</div><div>| =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^~~~~~~~~~~~~~~~~</=
div></div><div><br></div><div>Ross</div></div><div class=3D"gmail_extra"><b=
r><div class=3D"gmail_quote">On 27 July 2017 at 15:40, Alexander Kanavin <s=
pan dir=3D"ltr">&lt;<a href=3D"mailto:alexander.kanavin@linux.intel.com" ta=
rget=3D"_blank">alexander.kanavin@linux.intel.com</a>&gt;</span> wrote:<br>=
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">Signed-off-by: Alexander Kanavin &lt;<a href=
=3D"mailto:alexander.kanavin@linux.intel.com">alexander.kanavin@linux.<wbr>=
intel.com</a>&gt;<br>
---<br>
=C2=A0.../files/0001-Fix-build-with-<wbr>gperf-3.1.patch=C2=A0 =C2=A0 =C2=
=A0 | 41 ++++++++++++++++++++++<br>
=C2=A0meta/recipes-support/libcap/<a href=3D"http://libcap_2.25.bb" rel=3D"=
noreferrer" target=3D"_blank">li<wbr>bcap_2.25.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 3 +-<br>
=C2=A02 files changed, 43 insertions(+), 1 deletion(-)<br>
=C2=A0create mode 100644 meta/recipes-support/libcap/<wbr>files/0001-Fix-bu=
ild-with-<wbr>gperf-3.1.patch<br>
<br>
diff --git a/meta/recipes-support/libcap/<wbr>files/0001-Fix-build-with-<wb=
r>gperf-3.1.patch b/meta/recipes-support/libcap/<wbr>files/0001-Fix-build-w=
ith-<wbr>gperf-3.1.patch<br>
new file mode 100644<br>
index 00000000000..110ef902da2<br>
--- /dev/null<br>
+++ b/meta/recipes-support/libcap/<wbr>files/0001-Fix-build-with-<wbr>gperf=
-3.1.patch<br>
@@ -0,0 +1,41 @@<br>
+From a05eba68c42222f02465d7ba376015<wbr>926433c531 Mon Sep 17 00:00:00 200=
1<br>
+From: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com">alex=
.kanavin@gmail.com</a>&gt;<br>
+Date: Wed, 26 Jul 2017 13:37:49 +0300<br>
+Subject: [PATCH] Fix build with gperf 3.1<br>
+<br>
+The generated gperf file refers to size_t which needs to be<br>
+provided by stddef.h include. Also, adjust the makefile<br>
+to match the declaration in the gperf file.<br>
+<br>
+Upstream-Status: Pending<br>
+Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.=
com">alex.kanavin@gmail.com</a>&gt;<br>
+<br>
+---<br>
+ libcap/Makefile | 4 ++--<br>
+ 1 file changed, 2 insertions(+), 2 deletions(-)<br>
+<br>
+diff --git a/libcap/Makefile b/libcap/Makefile<br>
+index d189777..1a57206 100644<br>
+--- a/libcap/Makefile<br>
++++ b/libcap/Makefile<br>
+@@ -22,7 +22,7 @@ all: $(MINLIBNAME) $(STALIBNAME) libcap.pc<br>
+<br>
+ ifeq ($(BUILD_GPERF),yes)<br>
+ USE_GPERF_OUTPUT =3D $(GPERF_OUTPUT)<br>
+-INCLUDE_GPERF_OUTPUT =3D -include $(GPERF_OUTPUT)<br>
++INCLUDE_GPERF_OUTPUT =3D -include stddef.h -include $(GPERF_OUTPUT)<br>
+ endif<br>
+<br>
+ libcap.pc: <a href=3D"http://libcap.pc.in" rel=3D"noreferrer" target=3D"_=
blank">libcap.pc.in</a><br>
+@@ -41,7 +41,7 @@ cap_names.h: _makenames<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0./_makenames &gt; cap_names.h<br>
+<br>
+ $(GPERF_OUTPUT): cap_names.list.h<br>
+-=C2=A0 =C2=A0 =C2=A0 perl -e &#39;print &quot;struct __cap_token_s { cons=
t char *name; int index; };\n%{\nconst struct __cap_token_s *__cap_lookup_n=
ame(const char *, unsigned int);\n%}\n%%\n&quot;; while ($$l =3D &lt;&gt;) =
{ $$l =3D~ s/[\{\&quot;]//g; $$l =3D~ s/\}.*// ; print $$l; }&#39; &lt; $&l=
t; | gperf --ignore-case --language=3DANSI-C --readonly --null-strings --gl=
obal-table --hash-function-name=3D__cap_<wbr>hash_name --lookup-function-na=
me=3D&quot;__cap_<wbr>lookup_name&quot; -c -t -m20 $(INDENT) &gt; $@<br>
++=C2=A0 =C2=A0 =C2=A0 perl -e &#39;print &quot;struct __cap_token_s { cons=
t char *name; int index; };\n%{\nconst struct __cap_token_s *__cap_lookup_n=
ame(const char *, register size_t);\n%}\n%%\n&quot;; while ($$l =3D &lt;&gt=
;) { $$l =3D~ s/[\{\&quot;]//g; $$l =3D~ s/\}.*// ; print $$l; }&#39; &lt; =
$&lt; | gperf --ignore-case --language=3DANSI-C --readonly --null-strings -=
-global-table --hash-function-name=3D__cap_<wbr>hash_name --lookup-function=
-name=3D&quot;__cap_<wbr>lookup_name&quot; -c -t -m20 $(INDENT) &gt; $@<br>
+<br>
+ cap_names.list.h: Makefile $(KERNEL_HEADERS)/linux/<wbr>capability.h<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0@echo &quot;=3D&gt; making $@ from $(KERNEL_HEA=
DERS)/linux/<wbr>capability.h&quot;<br>
+--<br>
+2.13.2<br>
+<br>
diff --git a/meta/recipes-support/libcap/<a href=3D"http://libcap_2.25.bb" =
rel=3D"noreferrer" target=3D"_blank"><wbr>libcap_2.25.bb</a> b/meta/recipes=
-support/libcap/<a href=3D"http://libcap_2.25.bb" rel=3D"noreferrer" target=
=3D"_blank"><wbr>libcap_2.25.bb</a><br>
index 5c2765f343a..d619a2eb4cc 100644<br>
--- a/meta/recipes-support/libcap/<a href=3D"http://libcap_2.25.bb" rel=3D"=
noreferrer" target=3D"_blank"><wbr>libcap_2.25.bb</a><br>
+++ b/meta/recipes-support/libcap/<a href=3D"http://libcap_2.25.bb" rel=3D"=
noreferrer" target=3D"_blank"><wbr>libcap_2.25.bb</a><br>
@@ -9,7 +9,8 @@ DEPENDS =3D &quot;hostperl-runtime-native gperf-native&quot=
;<br>
<br>
=C2=A0SRC_URI =3D &quot;${KERNELORG_MIRROR}/linux/<wbr>libs/security/linux-=
privs/${<wbr>BPN}2/${BPN}-${PV}.tar.xz \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-ensure-the-XATTR_<wbr=
>NAME_CAPS-is-defined-when-it-<wbr>is-use.patch \<br>
-&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Fix-build-with-<wbr>g=
perf-3.1.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
=C2=A0SRC_URI[md5sum] =3D &quot;<wbr>6666b839e5d46c2ad33fc8aa2ceb5f<wbr>77&=
quot;<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;<wbr>693c8ac51e983ee678205571ef2724<wbr>=
39d83afe62dd8e424ea14ad9790bc3<wbr>5162&quot;<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
2.13.2<br>
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

--001a114260babe6f1505555f6582--
