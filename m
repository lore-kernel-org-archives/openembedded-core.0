Return-Path: <Emmanuel.VAUTRIN@cpexterne.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BFB8C6FD1D
	for <webhook@archiver.kernel.org>; Wed, 15 Mar 2023 13:31:40 +0000 (UTC)
Subject: [PATCH] connman: Backports for security fixes (2) #poky 
To: openembedded-core@lists.openembedded.org
From: "VAUTRIN Emmanuel (Canal Plus Prestataire)" <Emmanuel.VAUTRIN@cpexterne.org>
X-Originating-Location: Pantin, Île-de-France, FR (194.4.243.22)
X-Originating-Platform: Linux Chrome 111
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Wed, 15 Mar 2023 06:31:36 -0700
Message-ID: <wpQl.1678887096623820376.VRAn@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="DeRLOfDsDGFzyCBBetxS"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Mar 2023 13:31:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178547

--DeRLOfDsDGFzyCBBetxS
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Fixes
CVE: CVE-2022-32293

Commit b33cf2d113d0 ("connman: Backports for security fixes")
---
.../connman/connman/CVE-2022-32293_p3.patch=C2=A0 =C2=A0| 67 ++++++++++++++=
+++++
.../connman/connman_1.41.bb=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0|=C2=A0 1 +
2 files changed, 68 insertions(+)
create mode 100644 meta/recipes-connectivity/connman/connman/CVE-2022-32293=
_p3.patch

diff --git a/meta/recipes-connectivity/connman/connman/CVE-2022-32293_p3.pa=
tch b/meta/recipes-connectivity/connman/connman/CVE-2022-32293_p3.patch
new file mode 100644
index 000000000000..0fefe3e45408
--- /dev/null
+++ b/meta/recipes-connectivity/connman/connman/CVE-2022-32293_p3.patch
@@ -0,0 +1,67 @@
+From e6523511d736667e45877d588a64988e818a06fe Mon Sep 17 00:00:00 2001
+From: Daniel Wagner <wagi@monom.org>
+Date: Wed, 7 Sep 2022 20:52:20 +0200
+Subject: [PATCH] wispr: Fix context refcounting in
+ wispr_portal_request_portal()
+
+The wispr_portal_request_portal() function is expected to read until
+there is no data. Hence, the wp_context refcount is supposed to be
+hold on while reading.
+
+Furthermore, we should not return early when we read the
+X-ConnMan-Status header. Instead we are supposed to go through the
+normal return path so that we cleanup any added routing entries. Thus,
+we also don't need to update the refcount in this code path as we
+handle it at the main return path.
+
+Fixes: 416bfaff9888 ("wispr: Update portal context references")
+Upstream-Status: Backport [https://git.kernel.org/pub/scm/network/connman/=
connman.git/commit/?id=3De6523511d736667e45877d588a64988e818a06fe]
+---
+ src/wispr.c | 10 +++++-----
+ 1 file changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/src/wispr.c b/src/wispr.c
+index 9b27af5fff55..a7562e8462f3 100644
+--- a/src/wispr.c
++++ b/src/wispr.c
+@@ -537,7 +537,8 @@ static bool wispr_route_request(const char *address, i=
nt ai_family,
+ static void wispr_portal_request_portal(
+ struct connman_wispr_portal_context *wp_context)
+ {
+- DBG("");
++ DBG("wp_context %p %s", wp_context,
++ __connman_ipconfig_type2string(wp_context->type));
+
+ wispr_portal_context_ref(wp_context);
+ wp_context->request_id =3D g_web_request_get(wp_context->web,
+@@ -753,7 +754,7 @@ static bool wispr_portal_web_result(GWebResult *result=
, gpointer user_data)
+ if (length > 0) {
+ g_web_parser_feed_data(wp_context->wispr_parser,
+ chunk, length);
+- wispr_portal_context_unref(wp_context);
++ /* read more data */
+ return true;
+ }
+
+@@ -783,8 +784,6 @@ static bool wispr_portal_web_result(GWebResult *result=
, gpointer user_data)
+ if (g_web_result_get_header(result, "X-ConnMan-Status",
+ &str)) {
+ portal_manage_status(result, wp_context);
+- wispr_portal_context_unref(wp_context);
+- return false;
+ } else {
+ wispr_portal_context_ref(wp_context);
+ __connman_agent_request_browser(wp_context->service,
+@@ -996,7 +995,8 @@ int __connman_wispr_start(struct connman_service *serv=
ice,
+ struct connman_wispr_portal *wispr_portal =3D NULL;
+ int index, err;
+
+- DBG("service %p", service);
++ DBG("service %p %s", service,
++ __connman_ipconfig_type2string(type));
+
+ if (!wispr_portal_hash)
+ return -EINVAL;
+--
+2.25.1
+
diff --git a/meta/recipes-connectivity/connman/connman_1.41.bb b/meta/recip=
es-connectivity/connman/connman_1.41.bb
index 79542b2175dc..73ba673fd0a4 100644
--- a/meta/recipes-connectivity/connman/connman_1.41.bb
+++ b/meta/recipes-connectivity/connman/connman_1.41.bb
@@ -7,6 +7,7 @@ SRC_URI =3D "${KERNELORG_MIRROR}/linux/network/${BPN}/${BP}=
.tar.xz \
file://no-version-scripts.patch \
file://CVE-2022-32293_p1.patch \
file://CVE-2022-32293_p2.patch \
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2022-32293_p3.patch \
file://CVE-2022-32292.patch \
"

--
2.25.1

--DeRLOfDsDGFzyCBBetxS
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>Fixes</div>
<div>CVE: CVE-2022-32293</div>
<div>&nbsp;</div>
<div>Commit b33cf2d113d0 ("connman: Backports for security fixes")</div>
<div>---</div>
<div>&nbsp;.../connman/connman/CVE-2022-32293_p3.patch&nbsp; &nbsp;| 67 +++=
++++++++++++++++</div>
<div>&nbsp;.../connman/connman_1.41.bb&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp;|&nbsp; 1 +</div>
<div>&nbsp;2 files changed, 68 insertions(+)</div>
<div>&nbsp;create mode 100644 meta/recipes-connectivity/connman/connman/CVE=
-2022-32293_p3.patch</div>
<div>&nbsp;</div>
<div>diff --git a/meta/recipes-connectivity/connman/connman/CVE-2022-32293_=
p3.patch b/meta/recipes-connectivity/connman/connman/CVE-2022-32293_p3.patc=
h</div>
<div>new file mode 100644</div>
<div>index 000000000000..0fefe3e45408</div>
<div>--- /dev/null</div>
<div>+++ b/meta/recipes-connectivity/connman/connman/CVE-2022-32293_p3.patc=
h</div>
<div>@@ -0,0 +1,67 @@</div>
<div>+From e6523511d736667e45877d588a64988e818a06fe Mon Sep 17 00:00:00 200=
1</div>
<div>+From: Daniel Wagner &lt;wagi@monom.org&gt;</div>
<div>+Date: Wed, 7 Sep 2022 20:52:20 +0200</div>
<div>+Subject: [PATCH] wispr: Fix context refcounting in</div>
<div>+ wispr_portal_request_portal()</div>
<div>+</div>
<div>+The wispr_portal_request_portal() function is expected to read until<=
/div>
<div>+there is no data. Hence, the wp_context refcount is supposed to be</d=
iv>
<div>+hold on while reading.</div>
<div>+</div>
<div>+Furthermore, we should not return early when we read the</div>
<div>+X-ConnMan-Status header. Instead we are supposed to go through the</d=
iv>
<div>+normal return path so that we cleanup any added routing entries. Thus=
,</div>
<div>+we also don't need to update the refcount in this code path as we</di=
v>
<div>+handle it at the main return path.</div>
<div>+</div>
<div>+Fixes: 416bfaff9888 ("wispr: Update portal context references")</div>
<div>+Upstream-Status: Backport [https://git.kernel.org/pub/scm/network/con=
nman/connman.git/commit/?id=3De6523511d736667e45877d588a64988e818a06fe]</di=
v>
<div>+---</div>
<div>+ src/wispr.c | 10 +++++-----</div>
<div>+ 1 file changed, 5 insertions(+), 5 deletions(-)</div>
<div>+</div>
<div>+diff --git a/src/wispr.c b/src/wispr.c</div>
<div>+index 9b27af5fff55..a7562e8462f3 100644</div>
<div>+--- a/src/wispr.c</div>
<div>++++ b/src/wispr.c</div>
<div>+@@ -537,7 +537,8 @@ static bool wispr_route_request(const char *addre=
ss, int ai_family,</div>
<div>+ static void wispr_portal_request_portal(</div>
<div>+ <span style=3D"white-space: pre;"> </span>struct connman_wispr_porta=
l_context *wp_context)</div>
<div>+ {</div>
<div>+-<span style=3D"white-space: pre;"> </span>DBG("");</div>
<div>++<span style=3D"white-space: pre;"> </span>DBG("wp_context %p %s", wp=
_context,</div>
<div>++<span style=3D"white-space: pre;"> </span>__connman_ipconfig_type2st=
ring(wp_context-&gt;type));</div>
<div>+&nbsp;</div>
<div>+ <span style=3D"white-space: pre;"> </span>wispr_portal_context_ref(w=
p_context);</div>
<div>+ <span style=3D"white-space: pre;"> </span>wp_context-&gt;request_id =
=3D g_web_request_get(wp_context-&gt;web,</div>
<div>+@@ -753,7 +754,7 @@ static bool wispr_portal_web_result(GWebResult *r=
esult, gpointer user_data)</div>
<div>+ <span style=3D"white-space: pre;"> </span>if (length &gt; 0) {</div>
<div>+ <span style=3D"white-space: pre;"> </span>g_web_parser_feed_data(wp_=
context-&gt;wispr_parser,</div>
<div>+ <span style=3D"white-space: pre;"> </span>chunk, length);</div>
<div>+-<span style=3D"white-space: pre;"> </span>wispr_portal_context_unref=
(wp_context);</div>
<div>++<span style=3D"white-space: pre;"> </span>/* read more data */</div>
<div>+ <span style=3D"white-space: pre;"> </span>return true;</div>
<div>+ <span style=3D"white-space: pre;"> </span>}</div>
<div>+&nbsp;</div>
<div>+@@ -783,8 +784,6 @@ static bool wispr_portal_web_result(GWebResult *r=
esult, gpointer user_data)</div>
<div>+ <span style=3D"white-space: pre;"> </span>if (g_web_result_get_heade=
r(result, "X-ConnMan-Status",</div>
<div>+ <span style=3D"white-space: pre;"> </span>&amp;str)) {</div>
<div>+ <span style=3D"white-space: pre;"> </span>portal_manage_status(resul=
t, wp_context);</div>
<div>+-<span style=3D"white-space: pre;"> </span>wispr_portal_context_unref=
(wp_context);</div>
<div>+-<span style=3D"white-space: pre;"> </span>return false;</div>
<div>+ <span style=3D"white-space: pre;"> </span>} else {</div>
<div>+ <span style=3D"white-space: pre;"> </span>wispr_portal_context_ref(w=
p_context);</div>
<div>+ <span style=3D"white-space: pre;"> </span>__connman_agent_request_br=
owser(wp_context-&gt;service,</div>
<div>+@@ -996,7 +995,8 @@ int __connman_wispr_start(struct connman_service =
*service,</div>
<div>+ <span style=3D"white-space: pre;"> </span>struct connman_wispr_porta=
l *wispr_portal =3D NULL;</div>
<div>+ <span style=3D"white-space: pre;"> </span>int index, err;</div>
<div>+&nbsp;</div>
<div>+-<span style=3D"white-space: pre;"> </span>DBG("service %p", service)=
;</div>
<div>++<span style=3D"white-space: pre;"> </span>DBG("service %p %s", servi=
ce,</div>
<div>++<span style=3D"white-space: pre;"> </span>__connman_ipconfig_type2st=
ring(type));</div>
<div>+&nbsp;</div>
<div>+ <span style=3D"white-space: pre;"> </span>if (!wispr_portal_hash)</d=
iv>
<div>+ <span style=3D"white-space: pre;"> </span>return -EINVAL;</div>
<div>+--&nbsp;</div>
<div>+2.25.1</div>
<div>+</div>
<div>diff --git a/meta/recipes-connectivity/connman/connman_1.41.bb b/meta/=
recipes-connectivity/connman/connman_1.41.bb</div>
<div>index 79542b2175dc..73ba673fd0a4 100644</div>
<div>--- a/meta/recipes-connectivity/connman/connman_1.41.bb</div>
<div>+++ b/meta/recipes-connectivity/connman/connman_1.41.bb</div>
<div>@@ -7,6 +7,7 @@ SRC_URI =3D "${KERNELORG_MIRROR}/linux/network/${BPN}/=
${BP}.tar.xz \</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; file://no-version-scripts.pa=
tch \</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; file://CVE-2022-32293_p1.pat=
ch \</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; file://CVE-2022-32293_p2.pat=
ch \</div>
<div>+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;file://CVE-2022-32293_p3.pat=
ch \</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; file://CVE-2022-32292.patch =
\</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; "</div>
<div>&nbsp;</div>
<div>--&nbsp;</div>
<div>2.25.1</div>
<div>&nbsp;</div>

--DeRLOfDsDGFzyCBBetxS--

