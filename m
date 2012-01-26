Received: from mail-vw0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1RqJPU-0001Ct-DR
	for openembedded-core@lists.openembedded.org;
	Thu, 26 Jan 2012 08:06:19 +0100
Received: by vbnl22 with SMTP id l22so171149vbn.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jan 2012 22:58:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=yNpSoFaZwGkQC7K2sNE9gT4oJ+2qEzXfPFcGFfPqqdI=;
	b=UqnreNofzzHKNL8AGogFzyoGzOTcFgiSby5o3fJOeqfs1HFT0GlYFfiziy44iaZByH
	WS/gkv90iI5KjAUdUV+tQ1XgyLiGnzR9w6dNHmnHJnE9+oITSVfe5/tyPEHf1wbMA2OA
	DxDTaggxE58I/NWVdGbPLJihVw043gjNNfcKs=
MIME-Version: 1.0
Received: by 10.52.26.206 with SMTP id n14mr399713vdg.51.1327560742674; Wed,
	25 Jan 2012 22:52:22 -0800 (PST)
Received: by 10.52.67.171 with HTTP; Wed, 25 Jan 2012 22:52:22 -0800 (PST)
Date: Thu, 26 Jan 2012 07:52:22 +0100
Message-ID: <CACW_hTb9UZACKZ+acn2jp-PZzrk1YkbmohyFxoi2deJdRvJpKw@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: should recipes be distro agnostic?
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 26 Jan 2012 07:06:19 -0000
Content-Type: multipart/alternative; boundary=20cf3079bd4e7c200a04b768d20b

--20cf3079bd4e7c200a04b768d20b
Content-Type: text/plain; charset=ISO-8859-1

By coincidence I bumped into this in oe-core:

./meta/recipes-devtools/apt/apt.inc:EXTRA_OECONF_append_angstrom = "
ac_cv_glibc_ver=libc6.4"

That also triggered me to do this:

frans@frans-desktop:~/workspace/openembedded-core$ grep -r _poky .
./meta/recipes-sato/pcmanfm/pcmanfm_0.9.10.bb:DEPENDS_append_poky = "
libowl"
./meta/recipes-sato/pcmanfm/pcmanfm_0.9.10.bb:SRC_URI_append_poky = "
file://owl-window-menu.patch"
./meta/recipes-sato/leafpad/leafpad_0.8.18.1.bb:DEPENDS_append_poky = "
libowl"
./meta/recipes-sato/leafpad/leafpad_0.8.18.1.bb:SRC_URI_append_poky += "
file://owl-menu.patch;apply=yes "
./meta/recipes-sato/pimlico/dates.inc:OWL_poky = "--enable-owl
--disable-dnd"
./meta/recipes-sato/pimlico/dates.inc:DEPENDS_append_poky = " libowl"
./meta/recipes-sato/pimlico/dates.inc:SRC_URI_append_poky = "
file://dates-owl-window-menu.patch;apply=yes "
./meta/recipes-sato/pimlico/tasks_0.19.bb:OWL_poky = "--with-owl"
./meta/recipes-sato/pimlico/contacts.inc:DEPENDS_append_poky = " libowl"
./meta/recipes-sato/pimlico/contacts.inc:OWL_poky = "--enable-owl"
./meta/recipes-sato/pimlico/contacts.inc:SRC_URI_append_poky = "
file://contacts-owl-window-menu.patch;apply=yes "
./meta/recipes-sato/pimlico/tasks.inc:DEPENDS_append_poky = " libowl"
./meta/recipes-sato/pimlico/tasks.inc:OWL_poky ?= "--enable-owl"
./meta/recipes-sato/puzzles/oh-puzzles_git.bb:DEPENDS_append_poky = "
libowl"
./meta/recipes-sato/puzzles/oh-puzzles_git.bb:SRC_URI_append_poky = "
file://oh-puzzles-owl-menu.patch;striplevel=0 "
./meta/recipes-devtools/gcc/gcc-runtime_4.6.bb:EXTRA_OECONF_append_poky-lsb
= " --enable-clocale=gnu"

I'd hoped oe-core to be core and not know things about distro's etc.
E.g. the first case with apt, this should probably be fixed with a
.bbappend in the angstrom layer, shouldn't it.
And the poky things in a poky layer.

(at least that is what I expected/hoped)

Btw did the same thing on meta-oe:
no _poky's, two for _angstrom:
./meta-oe/recipes-core/systemd/systemd_git.bb:SYSTEMDDISTRO_angstrom =
"angstrom"
./meta-gnome/recipes-gnome/system-tools/system-tools-backends_2.10.2.bb:SRC_URI_append_angstrom
= " \

In general I expected recipes to be without distro or hw suffixes (such a
suffx is an indication that the recipe is probably not at the proper place)

Best regards, Frans

--20cf3079bd4e7c200a04b768d20b
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

By coincidence I bumped into this in oe-core:<br><br>./meta/recipes-devtool=
s/apt/apt.inc:EXTRA_OECONF_append_angstrom =3D &quot; ac_cv_glibc_ver=3Dlib=
c6.4&quot;<br><br>That also triggered me to do this:<br><br>frans@frans-des=
ktop:~/workspace/openembedded-core$ grep -r _poky .<br>
./meta/recipes-sato/pcmanfm/pcmanfm_0.9.10.bb:DEPENDS_append_poky =3D &quot=
; libowl&quot;<br>./meta/recipes-sato/pcmanfm/pcmanfm_0.9.10.bb:SRC_URI_app=
end_poky =3D &quot; file://owl-window-menu.patch&quot;<br>./meta/recipes-sa=
to/leafpad/leafpad_0.8.18.1.bb:DEPENDS_append_poky =3D &quot; libowl&quot;<=
br>
./meta/recipes-sato/leafpad/leafpad_0.8.18.1.bb:SRC_URI_append_poky +=3D &q=
uot; file://owl-menu.patch;apply=3Dyes &quot;<br>./meta/recipes-sato/pimlic=
o/dates.inc:OWL_poky =3D &quot;--enable-owl --disable-dnd&quot;<br>./meta/r=
ecipes-sato/pimlico/dates.inc:DEPENDS_append_poky =3D &quot; libowl&quot;<b=
r>
./meta/recipes-sato/pimlico/dates.inc:SRC_URI_append_poky =3D &quot; file:/=
/dates-owl-window-menu.patch;apply=3Dyes &quot;<br>./meta/recipes-sato/piml=
ico/tasks_0.19.bb:OWL_poky =3D &quot;--with-owl&quot;<br>./meta/recipes-sat=
o/pimlico/contacts.inc:DEPENDS_append_poky =3D &quot; libowl&quot;<br>
./meta/recipes-sato/pimlico/contacts.inc:OWL_poky =3D &quot;--enable-owl&qu=
ot;<br>./meta/recipes-sato/pimlico/contacts.inc:SRC_URI_append_poky =3D &qu=
ot; file://contacts-owl-window-menu.patch;apply=3Dyes &quot;<br>./meta/reci=
pes-sato/pimlico/tasks.inc:DEPENDS_append_poky =3D &quot; libowl&quot;<br>
./meta/recipes-sato/pimlico/tasks.inc:OWL_poky ?=3D &quot;--enable-owl&quot=
;<br>./meta/recipes-sato/puzzles/oh-puzzles_git.bb:DEPENDS_append_poky =3D =
&quot; libowl&quot;<br>./meta/recipes-sato/puzzles/oh-puzzles_git.bb:SRC_UR=
I_append_poky =3D &quot; file://oh-puzzles-owl-menu.patch;striplevel=3D0 &q=
uot;<br>
./meta/recipes-devtools/gcc/gcc-runtime_4.6.bb:EXTRA_OECONF_append_poky-lsb=
 =3D &quot; --enable-clocale=3Dgnu&quot;<br><br>I&#39;d hoped oe-core to be=
 core and not know things about distro&#39;s etc. <br>E.g. the first case w=
ith apt, this should probably be fixed with a .bbappend in the angstrom lay=
er, shouldn&#39;t it.<br>
And the poky things in a poky layer.<br><br>(at least that is what I expect=
ed/hoped)<br><br>Btw did the same thing on meta-oe:<br>no _poky&#39;s, two =
for _angstrom:<br>./meta-oe/recipes-core/systemd/systemd_git.bb:SYSTEMDDIST=
RO_angstrom =3D &quot;angstrom&quot;<br>
./meta-gnome/recipes-gnome/system-tools/system-tools-backends_2.10.2.bb:SRC=
_URI_append_angstrom =3D &quot; \<br><br>In general I expected recipes to b=
e without distro or hw suffixes (such a suffx is an indication that the rec=
ipe is probably not at the proper place)<br>
<br>Best regards, Frans<br>

--20cf3079bd4e7c200a04b768d20b--
