Return-Path: <jacob.kroon@gmail.com>
Received: from mail-la0-f50.google.com (mail-la0-f50.google.com
	[209.85.215.50])
	by mail.openembedded.org (Postfix) with ESMTP id E648C60167
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Jul 2014 16:00:43 +0000 (UTC)
Received: by mail-la0-f50.google.com with SMTP id gf5so4775363lab.37
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Jul 2014 09:00:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=fYToOxl2pFHBh4/HmfMj/okkYjiqZUlGilDvcwxOmQE=;
	b=gVEgN13/D6XkMbVk78La8bWDUc8j+7H4/Ui/CiWioBZZDE/yZ5JfSUJGq81XQMJjlx
	3rTJ5ScOiPEyMzK99iCqjcHTEfndU9yc6HZNUHQf7WufPRTrS2z+8vyx6fF3OJFdI3o0
	foEiKqUUq+3PG9GskLktG+MjTCeiJcv0zNYodmlDmi4yxNDEvrAKd2qwxsn6zjSwsKM6
	o3/QozoW8kD7Cauzs8H70c5L4Meq22XnRwqg2P6jVmyF6ynsugIwXeR9NPlwNpM0FH1A
	Jm7Em3jaaumy//qytlgN3LK0exdvTfrl+SuCHTpjOXQK2p9jIDNFILqSA+ZRSQGEObbs
	aFqA==
MIME-Version: 1.0
X-Received: by 10.112.151.164 with SMTP id ur4mr25307371lbb.13.1405958443459; 
	Mon, 21 Jul 2014 09:00:43 -0700 (PDT)
Received: by 10.112.26.210 with HTTP; Mon, 21 Jul 2014 09:00:43 -0700 (PDT)
In-Reply-To: <CAJTo0Lafck2hOcUfpqYTnARMuzLOfNbA-GnnLcHF-oUBnc9zwA@mail.gmail.com>
References: <1405946349-16124-1-git-send-email-jacob.kroon@mikrodidakt.se>
	<CAJTo0Lafck2hOcUfpqYTnARMuzLOfNbA-GnnLcHF-oUBnc9zwA@mail.gmail.com>
Date: Mon, 21 Jul 2014 18:00:43 +0200
Message-ID: <CAPbeDCkjmKsTHFpKjd4CXBr8LuNP2bKSrQM7zpvCH-GwQzXMaA@mail.gmail.com>
From: Jacob Kroon <jacob.kroon@gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Jacob Kroon <jacob.kroon@mikrodidakt.se>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] pixbufcache: Add missing dependency on jpeg-native
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
X-List-Received-Date: Mon, 21 Jul 2014 16:00:50 -0000
Content-Type: multipart/alternative; boundary=047d7beb9ff4976ade04feb63515

--047d7beb9ff4976ade04feb63515
Content-Type: text/plain; charset=UTF-8

Hi Ross,

On Mon, Jul 21, 2014 at 2:49 PM, Burton, Ross <ross.burton@intel.com> wrote:

> On 21 July 2014 13:39, Jacob Kroon <jacob.kroon@mikrodidakt.se> wrote:
> > gdk-pixbuf-native uses png and jpeg loaders. When updating the
> > loader-cache, these needs to be already populated in the sysroot.
> >
> > Although png was present, the jpeg dependency was missing, so add it.
>
> But those dependencies are dependent on a PACKAGECONFIG setting, so
> you'll potentially be forcing a build of libjpeg purely to satisfy a
> fetch from sstate of a JPEG-disabled gdk-pixbuf.  Also, libtiff and
> libjasper are missing.
>
> If we can't change the sysroot creation order so that the order is
> zlib, libpng, libjpeg, and then gdk-pixbuf then I think this needs to
> be pulled out to a function that can do neater logic, such as iterate
> through PACKAGECONFIG and add the required dependencies (for each
> enabled option, turn the build depends into
> %s-native:do_populate_sysroot_setscene).
>
>
What about something like the patch below. It looks at the package's
DEPENDS,
and for native packages just adds them to

do_populate_sysroot[depends]
do_populate_sysroot_setscene[depends]

diff --git a/meta/classes/pixbufcache.bbclass
b/meta/classes/pixbufcache.bbclass
index b8d75bd..86cadad 100644
--- a/meta/classes/pixbufcache.bbclass
+++ b/meta/classes/pixbufcache.bbclass
@@ -47,6 +47,8 @@ python populate_packages_append() {

 #
 # Add an sstate postinst hook to update the cache for native packages.
+# For this to work, the dependencies of the package itself need to be
+# populated first.
 # An error exit during populate_sysroot_setscene allows bitbake to
 # try to recover by re-building the package.
 #
@@ -59,14 +61,15 @@ pixbufcache_sstate_postinst() {
     fi
 }

-# Add all of the dependencies of gdk-pixbuf as dependencies of
-# do_populate_sysroot_setscene so that pixbufcache_sstate_postinst can work
-# (otherwise gdk-pixbuf-query-loaders may not exist or link). Only add
-# gdk-pixbuf-native if we're not building gdk-pixbuf itself.
-#
-# Packages that use this class should extend this variable with their
runtime
-# dependencies.
-PIXBUFCACHE_SYSROOT_DEPS = ""
-PIXBUFCACHE_SYSROOT_DEPS_class-native =
"${@['gdk-pixbuf-native:do_populate_sysroot_setscene', '']['${BPN}' ==
'gdk-pixbuf']} glib-2.0-native:do_populate_sysroot_setscene
libffi-native:do_populate_sysroot_setscene
libpng-native:do_populate_sysroot_setscene
zlib-native:do_populate_sysroot_setscene"
-do_populate_sysroot_setscene[depends] += "${PIXBUFCACHE_SYSROOT_DEPS}"
-do_populate_sysroot[depends] += "${@d.getVar('PIXBUFCACHE_SYSROOT_DEPS',
True).replace('_setscene','')}"
+python () {
+    pn = d.getVar('PN', True)
+    if not pn.endswith('-native'):
+        return
+    for pkg in d.getVar('DEPENDS', True).split():
+        d.appendVarFlag('do_populate_sysroot',
+                        'depends',
+                        ' ' + pkg + ':do_populate_sysroot')
+        d.appendVarFlag('do_populate_sysroot_setscene',
+                        'depends',
+                        ' ' + pkg + ':do_populate_sysroot_setscene')
+}
diff --git a/meta/recipes-gnome/librsvg/librsvg_2.40.2.bb
b/meta/recipes-gnome/librsvg/librsvg_2.40.2.bb
index 34d8ca1..27659aa 100644
--- a/meta/recipes-gnome/librsvg/librsvg_2.40.2.bb
+++ b/meta/recipes-gnome/librsvg/librsvg_2.40.2.bb
@@ -51,5 +51,3 @@ FILES_rsvg = "${bindir}/rsvg* \
 FILES_librsvg-gtk = "${libdir}/gdk-pixbuf-2.0/*/*/*.so"

 PIXBUF_PACKAGES = "librsvg-gtk"
-
-PIXBUFCACHE_SYSROOT_DEPS_append_class-native = "
harfbuzz-native:do_populate_sysroot_setscene
pango-native:do_populate_sysroot_setscene
icu-native:do_populate_sysroot_setscene"
-- 
1.9.3

--047d7beb9ff4976ade04feb63515
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">Hi R=
oss,<br><br>On Mon, Jul 21, 2014 at 2:49 PM, Burton, Ross <span dir=3D"ltr"=
>&lt;<a href=3D"mailto:ross.burton@intel.com" target=3D"_blank">ross.burton=
@intel.com</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex"><div class=3D"">On 21 Jul=
y 2014 13:39, Jacob Kroon &lt;<a href=3D"mailto:jacob.kroon@mikrodidakt.se"=
>jacob.kroon@mikrodidakt.se</a>&gt; wrote:<br>

&gt; gdk-pixbuf-native uses png and jpeg loaders. When updating the<br>
&gt; loader-cache, these needs to be already populated in the sysroot.<br>
&gt;<br>
&gt; Although png was present, the jpeg dependency was missing, so add it.<=
br>
<br>
</div>But those dependencies are dependent on a PACKAGECONFIG setting, so<b=
r>
you&#39;ll potentially be forcing a build of libjpeg purely to satisfy a<br=
>
fetch from sstate of a JPEG-disabled gdk-pixbuf. =C2=A0Also, libtiff and<br=
>
libjasper are missing.<br>
<br>
If we can&#39;t change the sysroot creation order so that the order is<br>
zlib, libpng, libjpeg, and then gdk-pixbuf then I think this needs to<br>
be pulled out to a function that can do neater logic, such as iterate<br>
through PACKAGECONFIG and add the required dependencies (for each<br>
enabled option, turn the build depends into<br>
%s-native:do_populate_sysroot_setscene).<br>
<span class=3D""><font color=3D"#888888"><br></font></span></blockquote><br=
></div><div class=3D"gmail_quote">What about something like the patch below=
. It looks at the package&#39;s DEPENDS,<br>and for native packages just ad=
ds them to <br>
<br>do_populate_sysroot[depends]<br>do_populate_sysroot_setscene[depends]<b=
r><br></div>diff --git a/meta/classes/pixbufcache.bbclass b/meta/classes/pi=
xbufcache.bbclass<br>index b8d75bd..86cadad 100644<br>--- a/meta/classes/pi=
xbufcache.bbclass<br>
+++ b/meta/classes/pixbufcache.bbclass<br>@@ -47,6 +47,8 @@ python populate=
_packages_append() {<br>=C2=A0<br>=C2=A0#<br>=C2=A0# Add an sstate postinst=
 hook to update the cache for native packages.<br>+# For this to work, the =
dependencies of the package itself need to be<br>
+# populated first.<br>=C2=A0# An error exit during populate_sysroot_setsce=
ne allows bitbake to<br>=C2=A0# try to recover by re-building the package.<=
br>=C2=A0#<br>@@ -59,14 +61,15 @@ pixbufcache_sstate_postinst() {<br>=C2=A0=
=C2=A0=C2=A0=C2=A0 fi<br>=C2=A0}<br>
=C2=A0<br>-# Add all of the dependencies of gdk-pixbuf as dependencies of<b=
r>-# do_populate_sysroot_setscene so that pixbufcache_sstate_postinst can w=
ork<br>-# (otherwise gdk-pixbuf-query-loaders may not exist or link). Only =
add<br>
-# gdk-pixbuf-native if we&#39;re not building gdk-pixbuf itself.<br>-#<br>=
-# Packages that use this class should extend this variable with their runt=
ime<br>-# dependencies.<br>-PIXBUFCACHE_SYSROOT_DEPS =3D &quot;&quot;<br>
-PIXBUFCACHE_SYSROOT_DEPS_class-native =3D &quot;${@[&#39;gdk-pixbuf-native=
:do_populate_sysroot_setscene&#39;, &#39;&#39;][&#39;${BPN}&#39; =3D=3D &#3=
9;gdk-pixbuf&#39;]} glib-2.0-native:do_populate_sysroot_setscene libffi-nat=
ive:do_populate_sysroot_setscene libpng-native:do_populate_sysroot_setscene=
 zlib-native:do_populate_sysroot_setscene&quot;<br>
-do_populate_sysroot_setscene[depends] +=3D &quot;${PIXBUFCACHE_SYSROOT_DEP=
S}&quot;<br>-do_populate_sysroot[depends] +=3D &quot;${@d.getVar(&#39;PIXBU=
FCACHE_SYSROOT_DEPS&#39;, True).replace(&#39;_setscene&#39;,&#39;&#39;)}&qu=
ot;<br>
+python () {<br>+=C2=A0=C2=A0=C2=A0 pn =3D d.getVar(&#39;PN&#39;, True)<br>=
+=C2=A0=C2=A0=C2=A0 if not pn.endswith(&#39;-native&#39;):<br>+=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return<br>+=C2=A0=C2=A0=C2=A0 for pkg in d.g=
etVar(&#39;DEPENDS&#39;, True).split():<br>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 d.appendVarFlag(&#39;do_populate_sysroot&#39;,<br>
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &#39;dep=
ends&#39;,<br>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 &#39; &#39; + pkg + &#39;:do_populate_sysroot&#39;)<br>+=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 d.appendVarFlag(&#39;do_populate_sysroot_setsce=
ne&#39;,<br>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 &#39;depends&#39;,<br>
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &#39; &#=
39; + pkg + &#39;:do_populate_sysroot_setscene&#39;)<br>+}<br>diff --git a/=
meta/recipes-gnome/librsvg/<a href=3D"http://librsvg_2.40.2.bb">librsvg_2.4=
0.2.bb</a> b/meta/recipes-gnome/librsvg/<a href=3D"http://librsvg_2.40.2.bb=
">librsvg_2.40.2.bb</a><br>
index 34d8ca1..27659aa 100644<br>--- a/meta/recipes-gnome/librsvg/<a href=
=3D"http://librsvg_2.40.2.bb">librsvg_2.40.2.bb</a><br>+++ b/meta/recipes-g=
nome/librsvg/<a href=3D"http://librsvg_2.40.2.bb">librsvg_2.40.2.bb</a><br>=
@@ -51,5 +51,3 @@ FILES_rsvg =3D &quot;${bindir}/rsvg* \<br>
=C2=A0FILES_librsvg-gtk =3D &quot;${libdir}/gdk-pixbuf-2.0/*/*/*.so&quot;<b=
r>=C2=A0<br>=C2=A0PIXBUF_PACKAGES =3D &quot;librsvg-gtk&quot;<br>-<br>-PIXB=
UFCACHE_SYSROOT_DEPS_append_class-native =3D &quot; harfbuzz-native:do_popu=
late_sysroot_setscene pango-native:do_populate_sysroot_setscene icu-native:=
do_populate_sysroot_setscene&quot;<br>
-- <br>1.9.3<br><br><br></div></div>

--047d7beb9ff4976ade04feb63515--
