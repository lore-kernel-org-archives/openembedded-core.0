Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 616DAC433F5
	for <webhook@archiver.kernel.org>; Mon, 17 Jan 2022 11:21:02 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.9944.1642418460858349390
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Jan 2022 03:21:01 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EAE69101E
	for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Jan 2022 03:20:58 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9584E3F73D
	for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Jan 2022 03:20:58 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] lighttpd: backport a fix for CVE-2022-22707
Date: Mon, 17 Jan 2022 11:20:56 +0000
Message-Id: <20220117112056.455208-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220117112056.455208-1-ross.burton@arm.com>
References: <20220117112056.455208-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Jan 2022 11:21:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160640

Backport the fix for CVE-2022-22707, a buffer overflow in mod_extforward.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ...ix-out-of-bounds-OOB-write-fixes-313.patch | 97 +++++++++++++++++++
 .../lighttpd/lighttpd_1.4.63.bb               |  1 +
 2 files changed, 98 insertions(+)
 create mode 100644 meta/recipes-extended/lighttpd/lighttpd/0001-mod_extf=
orward-fix-out-of-bounds-OOB-write-fixes-313.patch

diff --git a/meta/recipes-extended/lighttpd/lighttpd/0001-mod_extforward-=
fix-out-of-bounds-OOB-write-fixes-313.patch b/meta/recipes-extended/light=
tpd/lighttpd/0001-mod_extforward-fix-out-of-bounds-OOB-write-fixes-313.pa=
tch
new file mode 100644
index 00000000000..f4e93d1065a
--- /dev/null
+++ b/meta/recipes-extended/lighttpd/lighttpd/0001-mod_extforward-fix-out=
-of-bounds-OOB-write-fixes-313.patch
@@ -0,0 +1,97 @@
+Upstream-Status: Backport
+CVE: CVE-2022-22707
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+From 27103f3f8b1a2857aa45b889e775435f7daf141f Mon Sep 17 00:00:00 2001
+From: povcfe <povcfe@qq.com>
+Date: Wed, 5 Jan 2022 11:11:09 +0000
+Subject: [PATCH] [mod_extforward] fix out-of-bounds (OOB) write (fixes #=
3134)
+
+(thx povcfe)
+
+(edited: gstrauss)
+
+There is a potential remote denial of service in lighttpd mod_extforward
+under specific, non-default and uncommon 32-bit lighttpd mod_extforward
+configurations.
+
+Under specific, non-default and uncommon lighttpd mod_extforward
+configurations, a remote attacker can trigger a 4-byte out-of-bounds
+write of value '-1' to the stack. This is not believed to be exploitable
+in any way beyond triggering a crash of the lighttpd server on systems
+where the lighttpd server has been built 32-bit and with compiler flags
+which enable a stack canary -- gcc/clang -fstack-protector-strong or
+-fstack-protector-all, but bug not visible with only -fstack-protector.
+
+With standard lighttpd builds using -O2 optimization on 64-bit x86_64,
+this bug has not been observed to cause adverse behavior, even with
+gcc/clang -fstack-protector-strong.
+
+For the bug to be reachable, the user must be using a non-default
+lighttpd configuration which enables mod_extforward and configures
+mod_extforward to accept and parse the "Forwarded" header from a trusted
+proxy. At this time, support for RFC7239 Forwarded is not common in CDN
+providers or popular web server reverse proxies. It bears repeating that
+for the user to desire to configure lighttpd mod_extforward to accept
+"Forwarded", the user must also be using a trusted proxy (in front of
+lighttpd) which understands and actively modifies the "Forwarded" header
+sent to lighttpd.
+
+lighttpd natively supports RFC7239 "Forwarded"
+hiawatha natively supports RFC7239 "Forwarded"
+
+nginx can be manually configured to add a "Forwarded" header
+https://www.nginx.com/resources/wiki/start/topics/examples/forwarded/
+
+A 64-bit build of lighttpd on x86_64 (not known to be affected by bug)
+in front of another 32-bit lighttpd will detect and reject a malicious
+"Forwarded" request header, thereby thwarting an attempt to trigger
+this bug in an upstream 32-bit lighttpd.
+
+The following servers currently do not natively support RFC7239 Forwarde=
d:
+nginx
+apache2
+caddy
+node.js
+haproxy
+squid
+varnish-cache
+litespeed
+
+Given the general dearth of support for RFC7239 Forwarded in popular
+CDNs and web server reverse proxies, and given the prerequisites in
+lighttpd mod_extforward needed to reach this bug, the number of lighttpd
+servers vulnerable to this bug is estimated to be vanishingly small.
+Large systems using reverse proxies are likely running 64-bit lighttpd,
+which is not known to be adversely affected by this bug.
+
+In the future, it is desirable for more servers to implement RFC7239
+Forwarded.  lighttpd developers would like to thank povcfe for reporting
+this bug so that it can be fixed before more CDNs and web servers
+implement RFC7239 Forwarded.
+
+x-ref:
+  "mod_extforward plugin has out-of-bounds (OOB) write of 4-byte -1"
+  https://redmine.lighttpd.net/issues/3134
+  (not yet written or published)
+  CVE-2022-22707
+---
+ src/mod_extforward.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/mod_extforward.c b/src/mod_extforward.c
+index ba957e04..fdaef7f6 100644
+--- a/src/mod_extforward.c
++++ b/src/mod_extforward.c
+@@ -715,7 +715,7 @@ static handler_t mod_extforward_Forwarded (request_s=
t * const r, plugin_data * c
+         while (s[i] =3D=3D ' ' || s[i] =3D=3D '\t') ++i;
+         if (s[i] =3D=3D ';') { ++i; continue; }
+         if (s[i] =3D=3D ',') {
+-            if (j >=3D (int)(sizeof(offsets)/sizeof(int))) break;
++            if (j >=3D (int)(sizeof(offsets)/sizeof(int))-1) break;
+             offsets[++j] =3D -1; /*("offset" separating params from nex=
t proxy)*/
+             ++i;
+             continue;
+--=20
+2.25.1
+
diff --git a/meta/recipes-extended/lighttpd/lighttpd_1.4.63.bb b/meta/rec=
ipes-extended/lighttpd/lighttpd_1.4.63.bb
index 41d6319e1be..6359310772b 100644
--- a/meta/recipes-extended/lighttpd/lighttpd_1.4.63.bb
+++ b/meta/recipes-extended/lighttpd/lighttpd_1.4.63.bb
@@ -14,6 +14,7 @@ RRECOMMENDS:${PN} =3D "lighttpd-module-access \
                      lighttpd-module-accesslog"
=20
 SRC_URI =3D "http://download.lighttpd.net/lighttpd/releases-1.4.x/lightt=
pd-${PV}.tar.xz \
+           file://0001-mod_extforward-fix-out-of-bounds-OOB-write-fixes-=
313.patch \
            file://index.html.lighttpd \
            file://lighttpd.conf \
            file://lighttpd \
--=20
2.25.1


