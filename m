Return-Path: <wltu@google.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3B05C4332F
	for <webhook@archiver.kernel.org>; Fri, 21 Oct 2022 13:17:07 +0000 (UTC)
Subject: [PATCH] openssh: Install internal header/lib files
To: openembedded-core@lists.openembedded.org
From: "Willy Tu" <wltu@google.com>
X-Originating-Location: San Jose, California, US (75.52.94.15)
X-Originating-Platform: Mac Chrome 106
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Fri, 21 Oct 2022 06:17:06 -0700
Message-ID: <IAS2.1666358226748943797.wkAx@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="cVrzUsajyQLlvw2LrIE3"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Oct 2022 13:17:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172016

--cVrzUsajyQLlvw2LrIE3
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Install API only if opensshinternals is in DISTRO_FEATURES.

Install the OpenSSH header + lib files for other repo to build using it.
For example, https://github.com/google/hiba is dependent on those files
to build and this change is needed to meet that requirement.

https://github.com/openembedded/meta-openembedded/pull/597

Signed-off-by: Willy Tu <wltu@google.com>
---
meta/recipes-connectivity/openssh/openssh_9.0p1.bb | 11 +++++++++++
1 file changed, 11 insertions(+)

diff --git a/meta/recipes-connectivity/openssh/openssh_9.0p1.bb b/meta/reci=
pes-connectivity/openssh/openssh_9.0p1.bb
index b63ea2b137..84da118ca6 100644
--- a/meta/recipes-connectivity/openssh/openssh_9.0p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_9.0p1.bb
@@ -137,6 +137,17 @@ do_install:append () {
${D}${sysconfdir}/init.d/sshd

install -D -m 0755 ${WORKDIR}/sshd_check_keys ${D}${libexecdir}/${BPN}/sshd=
_check_keys
+
+ if ${@bb.utils.contains('DISTRO_FEATURES', 'opensshinternals', 'true', 'f=
alse', d)}; then
+ install -d ${D}${includedir}/ssh
+ install -d ${D}${includedir}/ssh/openbsd-compat
+ install -m0644 ${S}/*.h ${D}${includedir}/ssh
+ install -m0644 ${S}/openbsd-compat/*.h ${D}${includedir}/ssh/openbsd-comp=
at
+
+ install -d ${D}${libdir}
+ install -m0644 ${S}/libssh.a ${D}${libdir}
+ install -m0644 ${S}/openbsd-compat/libopenbsd-compat.a ${D}${libdir}
+ fi
}

do_install_ptest () {
--
2.38.0.135.g90850a2211-goog

--cVrzUsajyQLlvw2LrIE3
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>Install API only if opensshinternals is in DISTRO_FEATURES.</div>
<div>&nbsp;</div>
<div>Install the OpenSSH header + lib files for other repo to build using i=
t.</div>
<div>For example, https://github.com/google/hiba is dependent on those file=
s</div>
<div>to build and this change is needed to meet that requirement.</div>
<div>&nbsp;</div>
<div>https://github.com/openembedded/meta-openembedded/pull/597</div>
<div>&nbsp;</div>
<div>Signed-off-by: Willy Tu &lt;wltu@google.com&gt;</div>
<div>---</div>
<div>&nbsp;meta/recipes-connectivity/openssh/openssh_9.0p1.bb | 11 ++++++++=
+++</div>
<div>&nbsp;1 file changed, 11 insertions(+)</div>
<div>&nbsp;</div>
<div>diff --git a/meta/recipes-connectivity/openssh/openssh_9.0p1.bb b/meta=
/recipes-connectivity/openssh/openssh_9.0p1.bb</div>
<div>index b63ea2b137..84da118ca6 100644</div>
<div>--- a/meta/recipes-connectivity/openssh/openssh_9.0p1.bb</div>
<div>+++ b/meta/recipes-connectivity/openssh/openssh_9.0p1.bb</div>
<div>@@ -137,6 +137,17 @@ do_install:append () {</div>
<div>&nbsp;<span style=3D"white-space: pre;"> </span>${D}${sysconfdir}/init=
.d/sshd</div>
<div>&nbsp;</div>
<div>&nbsp;<span style=3D"white-space: pre;"> </span>install -D -m 0755 ${W=
ORKDIR}/sshd_check_keys ${D}${libexecdir}/${BPN}/sshd_check_keys</div>
<div>+</div>
<div>+<span style=3D"white-space: pre;"> </span>if ${@bb.utils.contains('DI=
STRO_FEATURES', 'opensshinternals', 'true', 'false', d)}; then</div>
<div>+<span style=3D"white-space: pre;"> </span>install -d ${D}${includedir=
}/ssh</div>
<div>+<span style=3D"white-space: pre;"> </span>install -d ${D}${includedir=
}/ssh/openbsd-compat</div>
<div>+<span style=3D"white-space: pre;"> </span>install -m0644 ${S}/*.h ${D=
}${includedir}/ssh</div>
<div>+<span style=3D"white-space: pre;"> </span>install -m0644 ${S}/openbsd=
-compat/*.h ${D}${includedir}/ssh/openbsd-compat</div>
<div>+</div>
<div>+<span style=3D"white-space: pre;"> </span>install -d ${D}${libdir}</d=
iv>
<div>+<span style=3D"white-space: pre;"> </span>install -m0644 ${S}/libssh.=
a ${D}${libdir}</div>
<div>+<span style=3D"white-space: pre;"> </span>install -m0644 ${S}/openbsd=
-compat/libopenbsd-compat.a ${D}${libdir}</div>
<div>+<span style=3D"white-space: pre;"> </span>fi</div>
<div>&nbsp;}</div>
<div>&nbsp;</div>
<div>&nbsp;do_install_ptest () {</div>
<div>--</div>
<div>2.38.0.135.g90850a2211-goog</div>
<div>&nbsp;</div>

--cVrzUsajyQLlvw2LrIE3--

