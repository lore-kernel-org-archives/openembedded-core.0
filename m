Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D18A9C433FE
	for <webhook@archiver.kernel.org>; Fri, 21 Oct 2022 16:17:28 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.11874.1666369048038264967
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Oct 2022 09:17:28 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 31CD81063;
	Fri, 21 Oct 2022 09:17:33 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7D2233F792;
	Fri, 21 Oct 2022 09:17:26 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH][langdale] lighttpd: fix CVE-2022-41556
Date: Fri, 21 Oct 2022 17:17:22 +0100
Message-Id: <20221021161722.1181704-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Oct 2022 16:17:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172031

Backport the fix from upstream to fix this CVE.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../lighttpd/lighttpd/CVE-2022-41556.patch    | 31 +++++++++++++++++++
 .../lighttpd/lighttpd_1.4.66.bb               |  1 +
 2 files changed, 32 insertions(+)
 create mode 100644 meta/recipes-extended/lighttpd/lighttpd/CVE-2022-4155=
6.patch

diff --git a/meta/recipes-extended/lighttpd/lighttpd/CVE-2022-41556.patch=
 b/meta/recipes-extended/lighttpd/lighttpd/CVE-2022-41556.patch
new file mode 100644
index 00000000000..284a5a3ea97
--- /dev/null
+++ b/meta/recipes-extended/lighttpd/lighttpd/CVE-2022-41556.patch
@@ -0,0 +1,31 @@
+CVE: CVE-2022-41556
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+From b18de6f9264f914f7bf493abd3b6059343548e50 Mon Sep 17 00:00:00 2001
+From: Glenn Strauss <gstrauss@gluelogic.com>
+Date: Sun, 11 Sep 2022 22:31:34 -0400
+Subject: [PATCH] [core] handle RDHUP when collecting chunked body
+
+handle RDHUP as soon as RDHUP detected when collecting HTTP/1.1 chunked
+request body (and when not streaming request body to backend)
+
+x-ref:
+  https://github.com/lighttpd/lighttpd1.4/pull/115
+---
+ src/gw_backend.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/gw_backend.c b/src/gw_backend.c
+index df9d8217..5db56287 100644
+--- a/src/gw_backend.c
++++ b/src/gw_backend.c
+@@ -2228,7 +2228,7 @@ handler_t gw_handle_subrequest(request_st * const =
r, void *p_d) {
+                  *  and module is flagged to stream request body to bac=
kend) */
+                 return (r->conf.stream_request_body & FDEVENT_STREAM_RE=
QUEST)
+                   ? http_response_reqbody_read_error(r, 411)
+-                  : HANDLER_WAIT_FOR_EVENT;
++                  : (rc =3D=3D HANDLER_GO_ON) ? HANDLER_WAIT_FOR_EVENT =
: rc;
+             }
+=20
+             if (hctx->wb_reqlen < -1 && r->reqbody_length >=3D 0) {
diff --git a/meta/recipes-extended/lighttpd/lighttpd_1.4.66.bb b/meta/rec=
ipes-extended/lighttpd/lighttpd_1.4.66.bb
index 801162867c7..78978105b27 100644
--- a/meta/recipes-extended/lighttpd/lighttpd_1.4.66.bb
+++ b/meta/recipes-extended/lighttpd/lighttpd_1.4.66.bb
@@ -14,6 +14,7 @@ RRECOMMENDS:${PN} =3D "lighttpd-module-access \
                      lighttpd-module-accesslog"
=20
 SRC_URI =3D "http://download.lighttpd.net/lighttpd/releases-1.4.x/lightt=
pd-${PV}.tar.xz \
+           file://CVE-2022-41556.patch \
            file://index.html.lighttpd \
            file://lighttpd.conf \
            file://lighttpd \
--=20
2.34.1


