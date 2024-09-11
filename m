Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 318F2EE498B
	for <webhook@archiver.kernel.org>; Wed, 11 Sep 2024 10:05:43 +0000 (UTC)
Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
 by mx.groups.io with SMTP id smtpd.web10.18462.1726049134127872548
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Sep 2024 03:05:34 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.18, mailfrom: f_l_k@t-online.de)
Received: from fwd84.aul.t-online.de (fwd84.aul.t-online.de [10.223.144.110])
	by mailout04.t-online.de (Postfix) with SMTP id EF75B1E2;
	Wed, 11 Sep 2024 12:05:31 +0200 (CEST)
Received: from [192.168.178.67] ([84.163.35.60]) by fwd84.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1soKE2-4JwVdo0; Wed, 11 Sep 2024 12:05:26 +0200
Date: Wed, 11 Sep 2024 12:07:08 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe-core][PATCH] gtk4: update 4.14.5 -> 4.16.0
To: Ross Burton <Ross.Burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Message-Id: <W38NJS.9EHA9A6T5D4I3@t-online.de>
In-Reply-To: <2A003221-497E-487E-BF79-1BD16102A1F7@arm.com>
References: <20240909072859.1331936-1-f_l_k@t-online.de>
	<2A003221-497E-487E-BF79-1BD16102A1F7@arm.com>
X-Mailer: geary/46.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-WnqqPDTiRcKnIaki3EKw"
X-TOI-EXPURGATEID: 150726::1726049126-CD7F85E9-E1E5D4D8/0/0 CLEAN NORMAL
X-TOI-MSGID: 39b579d6-6c6f-4068-b983-352a65922dc0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Sep 2024 10:05:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204377

--=-WnqqPDTiRcKnIaki3EKw
Content-Type: text/plain; charset=iso-8859-13; format=flowed
Content-Transfer-Encoding: quoted-printable

Gtk 4.16.0 has some quite invasive changes. It sets vulkan by default.=20
This requires at least for hyprland to pass GSK_RENDERER=3Dopengl to=20
prevent segfault in gtk4 apps. Now, thats because hyprland does not=20
support vulkan but this will presumably also happen in gnome for  older=20
graphics that dont support vulkan at all.
Also the NEWS file recommends using mesa 24.2 with this release.

I added the missing release notes and sent this marked for master-next=20
to clarify that this should be post styhead

On Tue, Sep 10 2024 at 05:05:23 PM +00:00:00, Ross Burton=20
<Ross.Burton@arm.com> wrote:
> This is a major update so it=FFs too late for this to land in master.
>=20
> Can you change the release notes fragment to include the major=20
> changes in the 4.15.x releases instead of just the last few fixes=20
> that went into the 4.16.0 release?
>=20
> Ross
>=20
>>  On 9 Sep 2024, at 08:28, Markus Volk via lists.openembedded.org=20
>> <f_l_k=3Dt-online.de@lists.openembedded.org=20
>> <mailto:f_l_k=3Dt-online.de@lists.openembedded.org>> wrote:
>>=20
>>  - Add python3-docutils-native to provide rst2man and rst2html5
>>   Otherwise build fails if documentation is built
>>  - Remove duplicate gi-docgen dependency. Its already included
>>   by gi-docgen.bbclass
>>=20
>>  Note: This release changes the default GSK renderer to be Vulkan,
>>  on Wayland. Other platforms still use ngl. The intent of this change
>>  is to use the best available platform APIs. You can still override
>>  the renderer choice using the GSK_RENDERER environment variable.
>>=20
>>  We believe that most of the problems reported with the new renderers
>>  during the 4.13 and 4.15 development cycles have been addressed by=20
>> now.
>>=20
>>  But the new renderers and dmabuf support are using graphics drivers
>>  in different ways than the old gl renderer, and trigger new driver=20
>> bugs.
>>  Therefore, it is recommended to use the latest mesa release (24.2)
>>  with the new renderers.
>>=20
>>  * GtkScale:
>>  - Fix positioning of scale values
>>=20
>>  * GtkEmojiChooser:
>>  - Make Control-clicks work for the recent section
>>=20
>>  * GtkPopover:
>>  - Make sure focus lands on the right widget when cascading
>>=20
>>  * GtkSpinButton:
>>  - Disable Emoji input for numeric spin buttons
>>=20
>>  * GtkSingleSelection:
>>  - Implement unselect_all
>>=20
>>  * Accssibility:
>>  - Fix roles for radio buttons
>>  - Check if ATs are listening before exporting trees
>>  - Add a check for sandboxed accessibility bus
>>  - Fix handling of the error message relation
>>  - Turn criticals into debug messages
>>  - Set expanded states properly in menus
>>=20
>>  * CSS:
>>  - Fix a few issues on bigendian systems
>>  - Avoid a crash with relative colors
>>=20
>>  * GSK:
>>  - Use the right GL context when exporting textures
>>  - Don't let colors influence depth decisions
>>  - Allow uploading of mipmap levels when tiling textures
>>=20
>>  * GDK:
>>  - Update keysyms from libX11 1.8.10
>>  - Implement cpu-side mipmapping
>>  - Use a thread pool for color conversions and mipmapping
>>=20
>>  * Vulkan:
>>  - Fix drag surface offsets
>>=20
>>  * Wayland:
>>  - Fix a crash
>>  - Associate EGL windows with context later
>>=20
>>  * X11:
>>  - Fix initial EGL context creation
>>  - Fix a problem with GL context creation
>>=20
>>  * Broadway:
>>  - Implement compute_size and request_layout
>>=20
>>  * MacOS:
>>  - Set transparent backgroiund for toplevel windows
>>=20
>>  * Windows:
>>  - Improve debug output
>>  - Detect Mesas d3d12 driver and request GDI compat
>>=20
>>  * Demos:
>>  - Set window icons in demos
>>  - Add a 64k x 64k image to the image scaling demo
>>=20
>>  * Translation updates
>>  Belarusian
>>  Brazilian Portuguese
>>  Catalan
>>  Czech
>>  Galician
>>  German
>>  Hebrew
>>  Indonesian
>>  Korean
>>  Lithuanian
>>  Persian
>>  Polish
>>  Portuguese
>>  Slovenian
>>  Spanish
>>  Turkish
>>  Ukrainian
>>=20
>>  Signed-off-by: Markus Volk <f_l_k@t-online.de=20
>> <mailto:f_l_k@t-online.de>>
>>  ---
>>  meta/recipes-gnome/gtk+/{gtk4_4.14.5.bb =3D> gtk4_4.16.0.bb} | 6=20
>> +++---
>>  1 file changed, 3 insertions(+), 3 deletions(-)
>>  rename meta/recipes-gnome/gtk+/{gtk4_4.14.5.bb =3D> gtk4_4.16.0.bb}=20
>> (96%)
>>=20
>>  diff --git a/meta/recipes-gnome/gtk+/gtk4_4.14.5.bb=20
>> b/meta/recipes-gnome/gtk+/gtk4_4.16.0.bb
>>  similarity index 96%
>>  rename from meta/recipes-gnome/gtk+/gtk4_4.14.5.bb
>>  rename to meta/recipes-gnome/gtk+/gtk4_4.16.0.bb
>>  index 0b3d33f8eb..6331e86bf5 100644
>>  --- a/meta/recipes-gnome/gtk+/gtk4_4.14.5.bb
>>  +++ b/meta/recipes-gnome/gtk+/gtk4_4.16.0.bb
>>  @@ -11,7 +11,6 @@ DEPENDS =3D " \
>>      fribidi \
>>      gdk-pixbuf \
>>      gdk-pixbuf-native \
>>  -    gi-docgen \
>>      glib-2.0 \
>>      graphene \
>>      harfbuzz \
>>  @@ -22,6 +21,7 @@ DEPENDS =3D " \
>>      librsvg \
>>      libxkbcommon \
>>      pango \
>>  +    python3-docutils-native \
>>      tiff \
>>  "
>>=20
>>  @@ -38,7 +38,7 @@ MAJ_VER =3D "${@oe.utils.trim_version("${PV}", 2)}"
>>  UPSTREAM_CHECK_REGEX =3D=20
>> "gtk-(?P<pver>\d+\.(\d*[02468])+(\.\d+)+)\.tar.xz"
>>=20
>>  SRC_URI =3D=20
>> "http://ftp.gnome.org/pub/gnome/sources/gtk/${MAJ_VER}/gtk-${PV}.tar.xz=20
>> <http://ftp.gnome.org/pub/gnome/sources/gtk/$%7BMAJ_VER%7D/gtk-$%7BPV%7D=
.tar.xz>"
>>  -SRC_URI[sha256sum] =3D=20
>> "5547f2b9f006b133993e070b87c17804e051efda3913feaca1108fa2be41e24d"
>>  +SRC_URI[sha256sum] =3D=20
>> "8ef538778c82c09870a6cc325195049caec5593c1ca37df915a7b6b10f5524ea"
>>=20
>>  S =3D "${WORKDIR}/gtk-${PV}"
>>=20
>>  @@ -56,7 +56,7 @@ GSETTINGS_PACKAGE:class-native =3D ""
>>=20
>>  ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}"
>>  REQUIRED_DISTRO_FEATURES =3D "opengl"
>>  -GTKDOC_MESON_OPTION =3D "documentation"
>>  +GIDOCGEN_MESON_OPTION =3D "documentation"
>>  GIR_MESON_ENABLE_FLAG =3D 'enabled'
>>  GIR_MESON_DISABLE_FLAG =3D 'disabled'
>>=20
>>  --
>>  2.46.0
>>=20
>>=20
>>  -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>  Links: You receive all messages sent to this group.
>>  View/Reply Online (#204313):=20
>> <https://lists.openembedded.org/g/openembedded-core/message/204313>
>>  Mute This Topic:=20
>> <https://lists.openembedded.org/mt/108350342/6875888>
>>  Group Owner: openembedded-core+owner@lists.openembedded.org=20
>> <mailto:openembedded-core+owner@lists.openembedded.org>
>>  Unsubscribe:=20
>> <https://lists.openembedded.org/g/openembedded-core/unsub>=20
>> [ross.burton@arm.com <mailto:ross.burton@arm.com>]
>>  -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>=20
>=20


--=-WnqqPDTiRcKnIaki3EKw
Content-Type: text/html; charset=iso-8859-13
Content-Transfer-Encoding: quoted-printable

<div id=3D"geary-body" dir=3D"auto">Gtk 4.16.0 has some quite invasive chan=
ges. It sets vulkan by default. This requires at least for hyprland to pass=
&nbsp;GSK_RENDERER=3Dopengl to prevent segfault in gtk4 apps. Now, thats be=
cause hyprland does not support vulkan but this will presumably also happen=
 in gnome for &nbsp;older graphics that dont support vulkan at all.<div>Als=
o the NEWS file recommends using mesa 24.2 with this release.</div><div><br=
></div><div>I added the missing release notes and sent this marked for mast=
er-next to clarify that this should be post styhead</div></div><div id=3D"g=
eary-quote" dir=3D"auto"><br>On Tue, Sep 10 2024 at 05:05:23 PM +00:00:00, =
Ross Burton &lt;Ross.Burton@arm.com&gt; wrote:<br><blockquote type=3D"cite"=
><div class=3D"plaintext" style=3D"white-space: break-spaces;">This is a ma=
jor update so it=FFs too late for this to land in master.

Can you change the release notes fragment to include the major changes in t=
he 4.15.x releases instead of just the last few fixes that went into the 4.=
16.0 release?

Ross

<blockquote> On 9 Sep 2024, at 08:28, Markus Volk via lists.openembedded.or=
g &lt;<a href=3D"mailto:f_l_k=3Dt-online.de@lists.openembedded.org">f_l_k=
=3Dt-online.de@lists.openembedded.org</a>&gt; wrote:
=20
 - Add python3-docutils-native to provide rst2man and rst2html5
  Otherwise build fails if documentation is built
 - Remove duplicate gi-docgen dependency. Its already included
  by gi-docgen.bbclass
=20
 Note: This release changes the default GSK renderer to be Vulkan,
 on Wayland. Other platforms still use ngl. The intent of this change
 is to use the best available platform APIs. You can still override
 the renderer choice using the GSK_RENDERER environment variable.
=20
 We believe that most of the problems reported with the new renderers
 during the 4.13 and 4.15 development cycles have been addressed by now.
=20
 But the new renderers and dmabuf support are using graphics drivers
 in different ways than the old gl renderer, and trigger new driver bugs.
 Therefore, it is recommended to use the latest mesa release (24.2)
 with the new renderers.
=20
 * GtkScale:
 - Fix positioning of scale values
=20
 * GtkEmojiChooser:
 - Make Control-clicks work for the recent section
=20
 * GtkPopover:
 - Make sure focus lands on the right widget when cascading
=20
 * GtkSpinButton:
 - Disable Emoji input for numeric spin buttons
=20
 * GtkSingleSelection:
 - Implement unselect_all
=20
 * Accssibility:
 - Fix roles for radio buttons
 - Check if ATs are listening before exporting trees
 - Add a check for sandboxed accessibility bus
 - Fix handling of the error message relation
 - Turn criticals into debug messages
 - Set expanded states properly in menus
=20
 * CSS:
 - Fix a few issues on bigendian systems
 - Avoid a crash with relative colors
=20
 * GSK:
 - Use the right GL context when exporting textures
 - Don't let colors influence depth decisions
 - Allow uploading of mipmap levels when tiling textures
=20
 * GDK:
 - Update keysyms from libX11 1.8.10
 - Implement cpu-side mipmapping
 - Use a thread pool for color conversions and mipmapping
=20
 * Vulkan:
 - Fix drag surface offsets
=20
 * Wayland:
 - Fix a crash
 - Associate EGL windows with context later
=20
 * X11:
 - Fix initial EGL context creation
 - Fix a problem with GL context creation
=20
 * Broadway:
 - Implement compute_size and request_layout
=20
 * MacOS:
 - Set transparent backgroiund for toplevel windows
=20
 * Windows:
 - Improve debug output
 - Detect Mesas d3d12 driver and request GDI compat
=20
 * Demos:
 - Set window icons in demos
 - Add a 64k x 64k image to the image scaling demo
=20
 * Translation updates
 Belarusian
 Brazilian Portuguese
 Catalan
 Czech
 Galician
 German
 Hebrew
 Indonesian
 Korean
 Lithuanian
 Persian
 Polish
 Portuguese
 Slovenian
 Spanish
 Turkish
 Ukrainian
=20
 Signed-off-by: Markus Volk &lt;<a href=3D"mailto:f_l_k@t-online.de">f_l_k@=
t-online.de</a>&gt;
 ---
 meta/recipes-gnome/gtk+/{gtk4_4.14.5.bb =3D&gt; gtk4_4.16.0.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-gnome/gtk+/{gtk4_4.14.5.bb =3D&gt; gtk4_4.16.0.bb} (96=
%)
=20
 diff --git a/meta/recipes-gnome/gtk+/gtk4_4.14.5.bb b/meta/recipes-gnome/g=
tk+/gtk4_4.16.0.bb
 similarity index 96%
 rename from meta/recipes-gnome/gtk+/gtk4_4.14.5.bb
 rename to meta/recipes-gnome/gtk+/gtk4_4.16.0.bb
 index 0b3d33f8eb..6331e86bf5 100644
 --- a/meta/recipes-gnome/gtk+/gtk4_4.14.5.bb
 +++ b/meta/recipes-gnome/gtk+/gtk4_4.16.0.bb
 @@ -11,7 +11,6 @@ DEPENDS =3D " \
     fribidi \
     gdk-pixbuf \
     gdk-pixbuf-native \
 -    gi-docgen \
     glib-2.0 \
     graphene \
     harfbuzz \
 @@ -22,6 +21,7 @@ DEPENDS =3D " \
     librsvg \
     libxkbcommon \
     pango \
 +    python3-docutils-native \
     tiff \
 "
=20
 @@ -38,7 +38,7 @@ MAJ_VER =3D "${@oe.utils.trim_version("${PV}", 2)}"
 UPSTREAM_CHECK_REGEX =3D "gtk-(?P&lt;pver&gt;\d+\.(\d*[02468])+(\.\d+)+)\.=
tar.xz"
=20
 SRC_URI =3D "<a href=3D"http://ftp.gnome.org/pub/gnome/sources/gtk/${MAJ_V=
ER}/gtk-${PV}.tar.xz">http://ftp.gnome.org/pub/gnome/sources/gtk/${MAJ_VER}=
/gtk-${PV}.tar.xz</a>"
 -SRC_URI[sha256sum] =3D "5547f2b9f006b133993e070b87c17804e051efda3913feaca=
1108fa2be41e24d"
 +SRC_URI[sha256sum] =3D "8ef538778c82c09870a6cc325195049caec5593c1ca37df91=
5a7b6b10f5524ea"
=20
 S =3D "${WORKDIR}/gtk-${PV}"
=20
 @@ -56,7 +56,7 @@ GSETTINGS_PACKAGE:class-native =3D ""
=20
 ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}"
 REQUIRED_DISTRO_FEATURES =3D "opengl"
 -GTKDOC_MESON_OPTION =3D "documentation"
 +GIDOCGEN_MESON_OPTION =3D "documentation"
 GIR_MESON_ENABLE_FLAG =3D 'enabled'
 GIR_MESON_DISABLE_FLAG =3D 'disabled'
=20
 --=20
 2.46.0
=20
=20
 -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
 Links: You receive all messages sent to this group.
 View/Reply Online (#204313): <a href=3D"https://lists.openembedded.org/g/o=
penembedded-core/message/204313">https://lists.openembedded.org/g/openembed=
ded-core/message/204313</a>
 Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/108350342/68=
75888">https://lists.openembedded.org/mt/108350342/6875888</a>
 Group Owner: <a href=3D"mailto:openembedded-core+owner@lists.openembedded.=
org">openembedded-core+owner@lists.openembedded.org</a>
 Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core=
/unsub">https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a hr=
ef=3D"mailto:ross.burton@arm.com">ross.burton@arm.com</a>]
 -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
=20
</blockquote>
</div></blockquote></div>
--=-WnqqPDTiRcKnIaki3EKw--


