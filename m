Return-Path: <f.bauer@igi-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68ABFC7EE31
	for <webhook@archiver.kernel.org>; Fri, 27 Jun 2025 13:09:47 +0000 (UTC)
Subject: psplash: Do not mount PSPLASH_FIFO_DIR if the env variable is  empty
To: openembedded-core@lists.openembedded.org
From: "falk bauer" <f.bauer@igi-systems.com>
X-Originating-Location: =?UTF-8?B?RMO8c3NlbGRvcmYsIE5vcnRoIFJoaW5lLVdlc3RwaGFsaWEsIERF?= (80.152.229.14)
X-Originating-Platform: Linux Firefox 139
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Fri, 27 Jun 2025 06:09:43 -0700
Message-ID: <Sn6p.1751029783474271995.Z24t@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="9UM5TH661jAJFxTK2z85"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 27 Jun 2025 13:09:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219408

--9UM5TH661jAJFxTK2z85
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The script file psplash.sh tries to mount the PSPLASH_FIFO_DIR variable.
If the variable is empty, the mountpoint command returns a usage text
(busybox mountpoint here, util-linux mountpoint behaves the same):

BusyBox v1.37.0 () multi-call binary.
Usage: mountpoint [-q] { [-dn] DIR | -x DEVICE } :~# BusyBox v1.37.0
() multi-call binary

The return code with this console output is 0 and the mount command in the
if statement is executed.
Then this mount also fails with an empty mountpoint argument.
The source code of psplash respects an empty PSPLASH_FIFO_DIR variable
(see psplash.c) and makes a fallback to "/run". So the psplash.sh script sh=
ould
also respect the empty var.

Try to mount the PSPLASH_FIFO_DIR only if the variable is not empty.

Signed-off-by: Falk Bauer <f.bauer@igi-systems.com>
---
meta/recipes-core/psplash/files/psplash-init | 8 +++++---
1 file changed, 5 insertions(+), 3 deletions(-)
diff --git a/meta/recipes-core/psplash/files/psplash-init b/meta/recipes-co=
re/psplash/files/psplash-init
index e0f80bcdc03..69496a48bf6 100644
--- a/meta/recipes-core/psplash/files/psplash-init
+++ b/meta/recipes-core/psplash/files/psplash-init
@@ -26,9 +26,11 @@ for x in $CMDLINE; do
esac
done

-[ -d $PSPLASH_FIFO_DIR ] || mkdir -p $PSPLASH_FIFO_DIR
-if ! mountpoint -q $PSPLASH_FIFO_DIR; then
- =C2=A0 =C2=A0mount tmpfs -t tmpfs $PSPLASH_FIFO_DIR -o,size=3D40k
+if [ -n "${PSPLASH_FIFO_DIR}" ]; then
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0[ -d $PSPLASH_FIFO_DIR ] || mkdir -p $PSPLASH_=
FIFO_DIR
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0if ! mountpoint -q $PSPLASH_FIFO_DIR ; then
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mount tmpfs -t tmp=
fs $PSPLASH_FIFO_DIR -o,size=3D40k
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0fi
fi

rotation=3D0

--9UM5TH661jAJFxTK2z85
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>
<div>The script file psplash.sh tries to mount the PSPLASH_FIFO_DIR variabl=
e.<br />If the variable is empty, the mountpoint command returns a usage te=
xt<br />(busybox mountpoint here, util-linux mountpoint behaves the same):<=
br />&nbsp;<br />BusyBox v1.37.0 () multi-call binary.<br />Usage: mountpoi=
nt [-q] { [-dn] DIR | -x DEVICE } :~# BusyBox v1.37.0<br />() multi-call bi=
nary<br />&nbsp;<br />The return code with this console output is 0 and the=
 mount command in the<br />if statement is executed.<br />Then this mount a=
lso fails with an empty mountpoint argument.<br />The source code of psplas=
h respects an empty PSPLASH_FIFO_DIR variable<br />(see psplash.c) and make=
s a fallback to "/run". So the psplash.sh script should<br />also respect t=
he empty var.<br />&nbsp;<br />Try to mount the PSPLASH_FIFO_DIR only if th=
e variable is not empty.<br />&nbsp;<br />Signed-off-by: Falk Bauer &lt;f.b=
auer@igi-systems.com&gt;<br />---<br />&nbsp;meta/recipes-core/psplash/file=
s/psplash-init | 8 +++++---<br />&nbsp;1 file changed, 5 insertions(+), 3 d=
eletions(-)</div>
<div>diff --git a/meta/recipes-core/psplash/files/psplash-init b/meta/recip=
es-core/psplash/files/psplash-init<br />index e0f80bcdc03..69496a48bf6 1006=
44<br />--- a/meta/recipes-core/psplash/files/psplash-init<br />+++ b/meta/=
recipes-core/psplash/files/psplash-init<br />@@ -26,9 +26,11 @@ for x in $C=
MDLINE; do<br />&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;esac<br />&nbsp;done<br /=
>&nbsp;<br />-[ -d $PSPLASH_FIFO_DIR ] || mkdir -p $PSPLASH_FIFO_DIR<br />-=
if ! mountpoint -q $PSPLASH_FIFO_DIR; then<br />- &nbsp; &nbsp;mount tmpfs =
-t tmpfs $PSPLASH_FIFO_DIR -o,size=3D40k<br />+if [ -n "${PSPLASH_FIFO_DIR}=
" ]; then<br />+ &nbsp; &nbsp; &nbsp; &nbsp;[ -d $PSPLASH_FIFO_DIR ] || mkd=
ir -p $PSPLASH_FIFO_DIR<br />+ &nbsp; &nbsp; &nbsp; &nbsp;if ! mountpoint -=
q $PSPLASH_FIFO_DIR ; then<br />+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp;mount tmpfs -t tmpfs $PSPLASH_FIFO_DIR -o,size=3D40k<br />+ &=
nbsp; &nbsp; &nbsp; &nbsp;fi<br />&nbsp;fi<br />&nbsp;<br />&nbsp;rotation=
=3D0</div>
</div>

--9UM5TH661jAJFxTK2z85--

