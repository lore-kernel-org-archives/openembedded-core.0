Subject: [PATCH] qemuboot: move QB_MEM to default in qemuboot
To: openembedded-core@lists.openembedded.org
From: brett.warren@arm.com
X-Originating-Location: Manchester, England, GB (188.210.212.247)
X-Originating-Platform: Linux Firefox 81
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Thu, 01 Oct 2020 05:46:29 -0700
Message-ID: <Po14.1601556389979380134.H3Ii@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="juAOgLZP7xdSVRt9D4hh"

--juAOgLZP7xdSVRt9D4hh
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Previously, to satisfy opengl's requirement for at least 512MB
of memory, QB_MEM was overriden by core-image-sato. This made it
impossible for machine configurations to specify their own values,
so this clause was moved to qemuboot instead and rewritten as a
default to allow other recipes to state their own values if
needed.

Signed-off-by: Brett Warren <brett.warren@arm.com>
---
meta/classes/qemuboot.bbclass =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| 2 +-
meta/recipes-sato/images/core-image-sato.bb | 1 -
2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/classes/qemuboot.bbclass b/meta/classes/qemuboot.bbclass
index d8f62ef6ea..3a51fc5b5e 100644
--- a/meta/classes/qemuboot.bbclass
+++ b/meta/classes/qemuboot.bbclass
@@ -73,7 +73,7 @@
# IMAGE_CLASSES +=3D "qemuboot"
# See "runqemu help" for more info

-QB_MEM ?=3D "-m 256"
+QB_MEM ?=3D '${@bb.utils.contains("DISTRO_FEATURES", "opengl", "-m 512", =
"-m 256", d)}'
QB_SERIAL_OPT ?=3D "-serial mon:stdio -serial null"
QB_DEFAULT_KERNEL ?=3D "${KERNEL_IMAGETYPE}"
QB_DEFAULT_FSTYPE ?=3D "ext4"
diff --git a/meta/recipes-sato/images/core-image-sato.bb b/meta/recipes-sa=
to/images/core-image-sato.bb
index 673106eb6d..640313d6f7 100644
--- a/meta/recipes-sato/images/core-image-sato.bb
+++ b/meta/recipes-sato/images/core-image-sato.bb
@@ -11,5 +11,4 @@ inherit core-image
TOOLCHAIN_HOST_TASK_append =3D " nativesdk-intltool nativesdk-glib-2.0"
TOOLCHAIN_HOST_TASK_remove_task-populate-sdk-ext =3D " nativesdk-intltool =
nativesdk-glib-2.0"

-QB_MEM =3D '${@bb.utils.contains("DISTRO_FEATURES", "opengl", "-m 512", "=
-m 256", d)}'
QB_MEM_qemumips =3D "-m 256"
--
2.17.1

--juAOgLZP7xdSVRt9D4hh
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<span style=3D"font-family: monospace;"><span style=3D"font-family: monospa=
ce;"><span style=3D"color: #000000; background-color: #ffffff;">Previously,=
 to satisfy opengl's requirement for at least 512MB </span><br />of memory,=
 QB_MEM was overriden by core-image-sato. This made it <br />impossible for=
 machine configurations to specify their own values, <br />so this clause w=
as moved to qemuboot instead and rewritten as a <br />default to allow othe=
r recipes to state their own values if <br />needed. <br /><br />Signed-off=
-by: Brett Warren &lt;brett.warren@arm.com&gt; <br />--- <br />meta/classes=
/qemuboot.bbclass &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;| 2 +- <br />meta/recipes-sato/images/core-image=
-sato.bb | 1 - <br />2 files changed, 1 insertion(+), 2 deletions(-) <br />=
<br />diff --git a/meta/classes/qemuboot.bbclass b/meta/classes/qemuboot.bb=
class <br />index d8f62ef6ea..3a51fc5b5e 100644 <br />--- a/meta/classes/qe=
muboot.bbclass <br />+++ b/meta/classes/qemuboot.bbclass <br />@@ -73,7 +73=
,7 @@ <br /># IMAGE_CLASSES +=3D "qemuboot" <br /># See "runqemu help" for =
more info <br />&nbsp;<br />-QB_MEM ?=3D "-m 256" <br />+QB_MEM ?=3D '${@bb=
.utils.contains("DISTRO_FEATURES", "opengl", "-m 512", "-m 256", d)}' <br /=
>QB_SERIAL_OPT ?=3D "-serial mon:stdio -serial null" <br />QB_DEFAULT_KERNE=
L ?=3D "${KERNEL_IMAGETYPE}" <br />QB_DEFAULT_FSTYPE ?=3D "ext4" <br />diff=
 --git a/meta/recipes-sato/images/core-image-sato.bb b/meta/recipes-sato/im=
ages/core-image-sato.bb <br />index 673106eb6d..640313d6f7 100644 <br />---=
 a/meta/recipes-sato/images/core-image-sato.bb <br />+++ b/meta/recipes-sat=
o/images/core-image-sato.bb <br />@@ -11,5 +11,4 @@ inherit core-image <br =
/>TOOLCHAIN_HOST_TASK_append =3D " nativesdk-intltool nativesdk-glib-2.0" <=
br />TOOLCHAIN_HOST_TASK_remove_task-populate-sdk-ext =3D " nativesdk-intlt=
ool nativesdk-glib-2.0" <br />&nbsp;<br />-QB_MEM =3D '${@bb.utils.contains=
("DISTRO_FEATURES", "opengl", "-m 512", "-m 256", d)}' <br />QB_MEM_qemumip=
s =3D "-m 256" <br />-- &nbsp;<br />2.17.1<br /></span><span style=3D"color=
: #000000; background-color: #ffffff;"> </span><br /><br /></span>

--juAOgLZP7xdSVRt9D4hh--
