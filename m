Received: from mail-vc0-f173.google.com ([209.85.220.173])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1TsiXw-0005ex-Hi
	for openembedded-core@lists.openembedded.org;
	Wed, 09 Jan 2013 00:25:31 +0100
Received: by mail-vc0-f173.google.com with SMTP id f13so990320vcb.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Jan 2013 15:10:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:x-originating-ip:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:x-gm-message-state;
	bh=LPHNdZ+nQk5UVhj9cRhYHvEKLJz1GI/X4XSJn6p4Ejg=;
	b=l4e0NGUPlwuocl3fKO6xdetAxc2XVAn9lCM/c3Ug0jqHZGzqHe4p8cvt/osGPXocaC
	ce4rtOxb6viDriBEayG9Lm/JPBnzbaWcv8QrGiPZXPeeXJNw789EkNeUdp+OCN6nyHam
	KS9zR9FqAMr6dVZyB5kOlJGpCq5Of5Yn3LP1NnGYvJIwxRbB0Uh/rfTnRZZO3qUGa49z
	3jXvJ2f62uwW3CN/Z6PkV4JHcOoUNeOpUzVSeKVEsydDhZVKygjzCPk+F9AJBX2KaFvz
	iQv8/WptnYni8lx8DJ/3qMfA1TIwunXyrgk1UGd80FE7iIce+vJ9eq+Ko88B3UqRWwdI
	8oww==
Received: by 10.220.155.84 with SMTP id r20mr6340611vcw.19.1357686616800; Tue,
	08 Jan 2013 15:10:16 -0800 (PST)
MIME-Version: 1.0
Received: by 10.58.102.132 with HTTP; Tue, 8 Jan 2013 15:09:56 -0800 (PST)
X-Originating-IP: [5.13.212.252]
In-Reply-To: <1357684790-1477-1-git-send-email-sgw@linux.intel.com>
References: <1357684790-1477-1-git-send-email-sgw@linux.intel.com>
From: Andrei Gherzan <andrei@gherzan.ro>
Date: Wed, 9 Jan 2013 01:09:56 +0200
Message-ID: <CAK18fxFy52e_X8RSMOxu41-bwb8nW7kKLNTbx==FBYLat0tHxA@mail.gmail.com>
To: Saul Wold <sgw@linux.intel.com>
X-Gm-Message-State: ALoCoQnYil+G686kV0/prLLcbHBMoAIKUjkf5+m3N8JK0Sh5OozSrYj7KeDqQar8z9rHuvsnCPVa
Cc: openembedded <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] bash: fix mkbuiltins build failure
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 08 Jan 2013 23:25:31 -0000
Content-Type: multipart/alternative; boundary=f46d0438913582bd2b04d2cf0c57

--f46d0438913582bd2b04d2cf0c57
Content-Type: text/plain; charset=ISO-8859-1

ack



*Andrei Gherzan*
mobile +40.744.478.414  fax +40.31.816.28.12
Email: andrei@gherzan.ro
Email: andrei.gherzan@windriver.com
Romania


On Wed, Jan 9, 2013 at 12:39 AM, Saul Wold <sgw@linux.intel.com> wrote:

> Same patch for non-gplv3 version:
>
>
> http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=1fd9a16d2a4594a4e9179dc7353ac51ce32eb712
>
> [YOCTO #3646]
>
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> ---
>  .../bash-3.2.48/mkbuiltins_have_stringize.patch    |   29
> ++++++++++++++++++++
>  meta/recipes-extended/bash/bash_3.2.48.bb          |    4 ++-
>  2 files changed, 32 insertions(+), 1 deletion(-)
>  create mode 100644
> meta/recipes-extended/bash/bash-3.2.48/mkbuiltins_have_stringize.patch
>
> diff --git
> a/meta/recipes-extended/bash/bash-3.2.48/mkbuiltins_have_stringize.patch
> b/meta/recipes-extended/bash/bash-3.2.48/mkbuiltins_have_stringize.patch
> new file mode 100644
> index 0000000..c4229a7
> --- /dev/null
> +++
> b/meta/recipes-extended/bash/bash-3.2.48/mkbuiltins_have_stringize.patch
> @@ -0,0 +1,29 @@
> +On hosts with FORTIFY_SOURCES, stringize support is required, as it's
> used by
> +the macros to wrap functions (e.g. read and open in unistd.h). Those
> wrappers
> +use the STRING() macro from unistd.h. A header in the bash sources
> overrides
> +the unistd.h macro to 'x' when HAVE_STRINGIZE is not defined, causing the
> +wrappers to generate calls to 'xread' and 'xopen', which do not exist,
> +resulting in a failure to link.
> +
> +Assume we have stringize support when cross-compiling, which works around
> the
> +issue.
> +
> +It may be best for upstream to either give up on supporting compilers
> without
> +stringize support, or to not define STRING() at all when FORTIFY_SOURCES
> is
> +defined, letting the unistd.h one be used, instead.
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Christopher Larson <chris_larson@mentor.com>
> +Signed-off-by: Saul Wold <sgw@linux.intel.com>
> +
> +--- bash-4.2.orig/builtins/mkbuiltins.c
> ++++ bash-4.2/builtins/mkbuiltins.c
> +@@ -28,6 +28,7 @@
> + #  define HAVE_STDLIB_H
> +
> + #  define HAVE_RENAME
> ++#  define HAVE_STRINGIZE
> + #endif /* CROSS_COMPILING */
> +
> + #if defined (HAVE_UNISTD_H)
> diff --git a/meta/recipes-extended/bash/bash_3.2.48.bbb/meta/recipes-extended/bash/
> bash_3.2.48.bb
> index 828d629..4e6f0f3 100644
> --- a/meta/recipes-extended/bash/bash_3.2.48.bb
> +++ b/meta/recipes-extended/bash/bash_3.2.48.bb
> @@ -8,7 +8,9 @@ PR = "r11"
>  SRC_URI = "${GNU_MIRROR}/bash/bash-${PV}.tar.gz;name=tarball \
>
> ${GNU_MIRROR}/bash/bash-3.2-patches/bash32-049;apply=yes;striplevel=0;name=patch001
> \
>
> ${GNU_MIRROR}/bash/bash-3.2-patches/bash32-050;apply=yes;striplevel=0;name=patch002
> \
> -
> ${GNU_MIRROR}/bash/bash-3.2-patches/bash32-051;apply=yes;striplevel=0;name=patch003"
> +
> ${GNU_MIRROR}/bash/bash-3.2-patches/bash32-051;apply=yes;striplevel=0;name=patch003
> \
> +           file://mkbuiltins_have_stringize.patch \
> +          "
>
>  SRC_URI[tarball.md5sum] = "338dcf975a93640bb3eaa843ca42e3f8"
>  SRC_URI[tarball.sha256sum] =
> "128d281bd5682ba5f6953122915da71976357d7a76490d266c9173b1d0426348"
> --
> 1.7.9.5
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>

--f46d0438913582bd2b04d2cf0c57
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">ack</div><div class=3D"gmail_extra"><br clear=3D"all"><div=
><div style=3D"text-align:center"></div><div style=3D"text-align:center"><d=
iv align=3D"left" style=3D"font-family:&#39;Times New Roman&#39;;font-size:=
medium"><font face=3D"Arial" color=3D"#333333" size=3D"-1"><br>

<br><strong>Andrei Gherzan</strong></font><br><font face=3D"Arial" color=3D=
"#333333" size=3D"-1">mobile +40.744.478.414=A0=A0fax +40.31.816.28.12</fon=
t><br><font face=3D"Arial" color=3D"#333333" size=3D"-1">Email: <a href=3D"=
mailto:andrei@gherzan.ro" target=3D"_blank">andrei@gherzan.ro</a></font><br=
>

<font face=3D"Arial" color=3D"#333333" size=3D"-1">Email: <a href=3D"mailto=
:andrei.gherzan@windriver.com" target=3D"_blank">andrei.gherzan@windriver.c=
om</a></font><br><font face=3D"Arial" color=3D"#333333" size=3D"-1">Romania=
</font></div>

</div></div>
<br><br><div class=3D"gmail_quote">On Wed, Jan 9, 2013 at 12:39 AM, Saul Wo=
ld <span dir=3D"ltr">&lt;<a href=3D"mailto:sgw@linux.intel.com" target=3D"_=
blank">sgw@linux.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gm=
ail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-le=
ft:1ex">

Same patch for non-gplv3 version:<br>
<br>
<a href=3D"http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=3D1fd9=
a16d2a4594a4e9179dc7353ac51ce32eb712" target=3D"_blank">http://git.yoctopro=
ject.org/cgit/cgit.cgi/poky/commit/?id=3D1fd9a16d2a4594a4e9179dc7353ac51ce3=
2eb712</a><br>


<br>
[YOCTO #3646]<br>
<br>
Signed-off-by: Saul Wold &lt;<a href=3D"mailto:sgw@linux.intel.com">sgw@lin=
ux.intel.com</a>&gt;<br>
---<br>
=A0.../bash-3.2.48/mkbuiltins_have_stringize.patch =A0 =A0| =A0 29 ++++++++=
++++++++++++<br>
=A0meta/recipes-extended/bash/<a href=3D"http://bash_3.2.48.bb" target=3D"_=
blank">bash_3.2.48.bb</a> =A0 =A0 =A0 =A0 =A0| =A0 =A04 ++-<br>
=A02 files changed, 32 insertions(+), 1 deletion(-)<br>
=A0create mode 100644 meta/recipes-extended/bash/bash-3.2.48/mkbuiltins_hav=
e_stringize.patch<br>
<br>
diff --git a/meta/recipes-extended/bash/bash-3.2.48/mkbuiltins_have_stringi=
ze.patch b/meta/recipes-extended/bash/bash-3.2.48/mkbuiltins_have_stringize=
.patch<br>
new file mode 100644<br>
index 0000000..c4229a7<br>
--- /dev/null<br>
+++ b/meta/recipes-extended/bash/bash-3.2.48/mkbuiltins_have_stringize.patc=
h<br>
@@ -0,0 +1,29 @@<br>
+On hosts with FORTIFY_SOURCES, stringize support is required, as it&#39;s =
used by<br>
+the macros to wrap functions (e.g. read and open in unistd.h). Those wrapp=
ers<br>
+use the STRING() macro from unistd.h. A header in the bash sources overrid=
es<br>
+the unistd.h macro to &#39;x&#39; when HAVE_STRINGIZE is not defined, caus=
ing the<br>
+wrappers to generate calls to &#39;xread&#39; and &#39;xopen&#39;, which d=
o not exist,<br>
+resulting in a failure to link.<br>
+<br>
+Assume we have stringize support when cross-compiling, which works around =
the<br>
+issue.<br>
+<br>
+It may be best for upstream to either give up on supporting compilers with=
out<br>
+stringize support, or to not define STRING() at all when FORTIFY_SOURCES i=
s<br>
+defined, letting the unistd.h one be used, instead.<br>
+<br>
+Upstream-Status: Pending<br>
+<br>
+Signed-off-by: Christopher Larson &lt;<a href=3D"mailto:chris_larson@mento=
r.com">chris_larson@mentor.com</a>&gt;<br>
+Signed-off-by: Saul Wold &lt;<a href=3D"mailto:sgw@linux.intel.com">sgw@li=
nux.intel.com</a>&gt;<br>
+<br>
+--- bash-4.2.orig/builtins/mkbuiltins.c<br>
++++ bash-4.2/builtins/mkbuiltins.c<br>
+@@ -28,6 +28,7 @@<br>
+ # =A0define HAVE_STDLIB_H<br>
+<br>
+ # =A0define HAVE_RENAME<br>
++# =A0define HAVE_STRINGIZE<br>
+ #endif /* CROSS_COMPILING */<br>
+<br>
+ #if defined (HAVE_UNISTD_H)<br>
diff --git a/meta/recipes-extended/bash/<a href=3D"http://bash_3.2.48.bb" t=
arget=3D"_blank">bash_3.2.48.bb</a> b/meta/recipes-extended/bash/<a href=3D=
"http://bash_3.2.48.bb" target=3D"_blank">bash_3.2.48.bb</a><br>
index 828d629..4e6f0f3 100644<br>
--- a/meta/recipes-extended/bash/<a href=3D"http://bash_3.2.48.bb" target=
=3D"_blank">bash_3.2.48.bb</a><br>
+++ b/meta/recipes-extended/bash/<a href=3D"http://bash_3.2.48.bb" target=
=3D"_blank">bash_3.2.48.bb</a><br>
@@ -8,7 +8,9 @@ PR =3D &quot;r11&quot;<br>
=A0SRC_URI =3D &quot;${GNU_MIRROR}/bash/bash-${PV}.tar.gz;name=3Dtarball \<=
br>
=A0 =A0 =A0 =A0 =A0 =A0 ${GNU_MIRROR}/bash/bash-3.2-patches/bash32-049;appl=
y=3Dyes;striplevel=3D0;name=3Dpatch001 \<br>
=A0 =A0 =A0 =A0 =A0 =A0 ${GNU_MIRROR}/bash/bash-3.2-patches/bash32-050;appl=
y=3Dyes;striplevel=3D0;name=3Dpatch002 \<br>
- =A0 =A0 =A0 =A0 =A0 ${GNU_MIRROR}/bash/bash-3.2-patches/bash32-051;apply=
=3Dyes;striplevel=3D0;name=3Dpatch003&quot;<br>
+ =A0 =A0 =A0 =A0 =A0 ${GNU_MIRROR}/bash/bash-3.2-patches/bash32-051;apply=
=3Dyes;striplevel=3D0;name=3Dpatch003 \<br>
+ =A0 =A0 =A0 =A0 =A0 file://mkbuiltins_have_stringize.patch \<br>
+ =A0 =A0 =A0 =A0 =A0&quot;<br>
<br>
=A0SRC_URI[tarball.md5sum] =3D &quot;338dcf975a93640bb3eaa843ca42e3f8&quot;=
<br>
=A0SRC_URI[tarball.sha256sum] =3D &quot;128d281bd5682ba5f6953122915da719763=
57d7a76490d266c9173b1d0426348&quot;<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
1.7.9.5<br>
<br>
<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded=
-core" target=3D"_blank">http://lists.linuxtogo.org/cgi-bin/mailman/listinf=
o/openembedded-core</a><br>
</font></span></blockquote></div><br></div>

--f46d0438913582bd2b04d2cf0c57--
