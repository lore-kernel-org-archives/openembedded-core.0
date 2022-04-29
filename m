Return-Path: <davidegarde2000@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29125C433EF
	for <webhook@archiver.kernel.org>; Fri, 29 Apr 2022 08:22:46 +0000 (UTC)
Subject: cve-check: building world doesn't create the manifest
To: openembedded-core@lists.openembedded.org
From: "Davide Gardenal" <davidegarde2000@gmail.com>
X-Originating-Location: Mira, Veneto, IT (82.60.178.66)
X-Originating-Platform: Linux Firefox 99
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Fri, 29 Apr 2022 01:22:40 -0700
Message-ID: <7kxD.1651220560041636184.iS66@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="13fMIyQPzudRzE7GgpnJ"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Apr 2022 08:22:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165002

--13fMIyQPzudRzE7GgpnJ
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Greetings,

In the current version of cve-check there is no way of creating the manifes=
t when building world. The reason why is due to these two lines:
>=20
>=20
> ROOTFS_POSTPROCESS_COMMAND:prepend =3D "${@'cve_check_write_rootfs_manife=
st;
> ' if d.getVar('CVE_CHECK_CREATE_MANIFEST') =3D=3D '1' else ''}"
> do_rootfs[recrdeptask] +=3D "${@'do_cve_check' if
> d.getVar('CVE_CHECK_CREATE_MANIFEST') =3D=3D '1' else ''}"

The problem is that in world there is no do_rootfs so the function cve_chec=
k_write_rootfs_manifest is never executed hence the manifest is not created=
.
My idea was to convert cve_check_write_rootfs_manifest to a handler listeni=
ng for BuildCompleted but then if someone builds more than one image the ou=
tput is broken.
Any suggestions are welcome and appreciated, thanks!

Davide

--13fMIyQPzudRzE7GgpnJ
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Greetings,<br /><br />In the current version of cve-check there is no way o=
f creating the manifest when building world. The reason why is due to these=
 two lines:
<blockquote>ROOTFS_POSTPROCESS_COMMAND:prepend =3D "${@'cve_check_write_roo=
tfs_manifest; ' if d.getVar('CVE_CHECK_CREATE_MANIFEST') =3D=3D '1' else ''=
}"<br />do_rootfs[recrdeptask] +=3D "${@'do_cve_check' if d.getVar('CVE_CHE=
CK_CREATE_MANIFEST') =3D=3D '1' else ''}"</blockquote>
The problem is that in world there is no do_rootfs so the function cve_chec=
k_write_rootfs_manifest is never executed hence the manifest is not created=
.<br />My idea was to convert cve_check_write_rootfs_manifest to a handler =
listening for BuildCompleted but then if someone builds more than one image=
 the output is broken.<br />Any suggestions are welcome and appreciated, th=
anks!<br /><br />Davide

--13fMIyQPzudRzE7GgpnJ--

