Return-Path: <marex@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 824CBCD98CB
	for <webhook@archiver.kernel.org>; Tue, 10 Oct 2023 22:48:26 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web11.3828.1696978097634950556
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Oct 2023 15:48:19 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@denx.de header.s=phobos-20191101 header.b=peRLNq9e;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: marex@denx.de)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 90DE280834;
	Wed, 11 Oct 2023 00:48:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1696978092;
	bh=o1hZARIXThnduxKa/xMoAxjCg44BlG7uTIyO3/0c8cU=;
	h=From:To:Cc:Subject:Date:From;
	b=peRLNq9eVeUA0Vkg2dgHJI+zb55rn+RYu7fPHtVLnkjCkqq29whhwoQLzlgLBLAlz
	 uGeJ94UdAPvyo2euyzoX8aU6OBXizJZ3zCY+JvXJx7iJQFdwS44sVKbw0apL63FTha
	 xr/9Cbwa/wOshma/QzvWv9wsnC04q4nOA1f0WmGcF3QzOjy2sEDcrICEKRQVhho+Hk
	 SMhkaWqf2PTA9rPo4bqY7Ky2ASIkWiwE1KcMAiI7bvG0T3My7b2p2BPkEWpSTPyxPy
	 tKvtyw9fiviXipp13L8VwTxJLeg3KfzeoWDPwLugH3CuJB+dnWptZb5MIqjswtnTTy
	 jnLiMIwWslysw==
From: Marek Vasut <marex@denx.de>
To: steve@sakoman.com,
	openembedded-core@lists.openembedded.org
Cc: Marek Vasut <marex@denx.de>,
	Alban Bedel <alban.bedel@aerq.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Jermain Horsman <jermain.horsman@nedap.com>
Subject: [dunfell][PATCH] systemd: Backport systemd-resolved: use hostname for certificate validation in DoT
Date: Wed, 11 Oct 2023 00:47:48 +0200
Message-Id: <20231010224748.267388-1-marex@denx.de>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Oct 2023 22:48:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188917

Widely accepted certificates for IP addresses are expensive and only
affordable for larger organizations. Therefore if the user provides
the hostname in the DNS=3D option, we should use it instead of the IP
address.

This fixes https://nvd.nist.gov/vuln/detail/CVE-2018-21029 per
suggestion https://github.com/systemd/systemd-stable/issues/72 .

CVE: CVE-2018-21029
Signed-off-by: Marek Vasut <marex@denx.de>
---
NOTE: Here it would be good if someone took a close look at this backport=
.
---
Cc: Alban Bedel <alban.bedel@aerq.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Jermain Horsman <jermain.horsman@nedap.com>
Cc: Steve Sakoman <steve@sakoman.com>
---
 .../systemd/systemd/CVE-2018-21029.patch      | 120 ++++++++++++++++++
 meta/recipes-core/systemd/systemd_244.5.bb    |   1 +
 2 files changed, 121 insertions(+)
 create mode 100644 meta/recipes-core/systemd/systemd/CVE-2018-21029.patc=
h

diff --git a/meta/recipes-core/systemd/systemd/CVE-2018-21029.patch b/met=
a/recipes-core/systemd/systemd/CVE-2018-21029.patch
new file mode 100644
index 0000000000..8d3801a248
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/CVE-2018-21029.patch
@@ -0,0 +1,120 @@
+From 3f9d9289ee8730a81a0464539f4e1ba2d23d0ce9 Mon Sep 17 00:00:00 2001
+From: =3D?UTF-8?q?J=3DC3=3DB6rg=3D20Thalheim?=3D <joerg@thalheim.io>
+Date: Tue, 3 Mar 2020 23:31:25 +0000
+Subject: [PATCH] systemd-resolved: use hostname for certificate validati=
on in
+ DoT
+
+Widely accepted certificates for IP addresses are expensive and only
+affordable for larger organizations. Therefore if the user provides
+the hostname in the DNS=3D option, we should use it instead of the IP
+address.
+
+(cherry picked from commit eec394f10bbfcc3d2fc8504ad8ff5be44231abd5)
+
+CVE: CVE-2018-21029
+Upstream-Status: Backport [ff26d281aec0877b43269f18c6282cd79a7f5529]
+Signed-off-by: Marek Vasut <marex@denx.de>
+---
+ man/resolved.conf.xml                 | 16 +++++++++++-----
+ src/resolve/resolved-dnstls-gnutls.c  | 20 ++++++++++++--------
+ src/resolve/resolved-dnstls-openssl.c | 15 +++++++++++----
+ 3 files changed, 34 insertions(+), 17 deletions(-)
+
+diff --git a/man/resolved.conf.xml b/man/resolved.conf.xml
+index 818000145b..37161ebcbc 100644
+--- a/man/resolved.conf.xml
++++ b/man/resolved.conf.xml
+@@ -193,11 +193,17 @@
+       <varlistentry>
+         <term><varname>DNSOverTLS=3D</varname></term>
+         <listitem>
+-        <para>Takes a boolean argument or <literal>opportunistic</liter=
al>.
+-        If true all connections to the server will be encrypted. Note t=
hat
+-        this mode requires a DNS server that supports DNS-over-TLS and =
has
+-        a valid certificate for it's IP. If the DNS server does not sup=
port
+-        DNS-over-TLS all DNS requests will fail. When set to <literal>o=
pportunistic</literal>
++        <para>Takes a boolean argument or <literal>opportunistic</liter=
al>. If
++        true all connections to the server will be encrypted. Note that=
 this
++        mode requires a DNS server that supports DNS-over-TLS and has a=
 valid
++        certificate. If the hostname was specified in <varname>DNS=3D</=
varname>
++        by using the format format <literal>address#server_name</litera=
l> it
++        is used to validate its certificate and also to enable Server N=
ame
++        Indication (SNI) when opening a TLS connection. Otherwise
++        the certificate is checked against the server's IP.
++        If the DNS server does not support DNS-over-TLS all DNS request=
s will fail.</para>
++
++        <para>When set to <literal>opportunistic</literal>
+         DNS request are attempted to send encrypted with DNS-over-TLS.
+         If the DNS server does not support TLS, DNS-over-TLS is disable=
d.
+         Note that this mode makes DNS-over-TLS vulnerable to "downgrade=
"
+diff --git a/src/resolve/resolved-dnstls-gnutls.c b/src/resolve/resolved=
-dnstls-gnutls.c
+index ed0a31e8bf..c7215723a7 100644
+--- a/src/resolve/resolved-dnstls-gnutls.c
++++ b/src/resolve/resolved-dnstls-gnutls.c
+@@ -56,15 +56,19 @@ int dnstls_stream_connect_tls(DnsStream *stream, Dns=
Server *server) {
+         }
+=20
+         if (server->manager->dns_over_tls_mode =3D=3D DNS_OVER_TLS_YES)=
 {
+-                stream->dnstls_data.validation.type =3D GNUTLS_DT_IP_AD=
DRESS;
+-                if (server->family =3D=3D AF_INET) {
+-                        stream->dnstls_data.validation.data =3D (unsign=
ed char*) &server->address.in.s_addr;
+-                        stream->dnstls_data.validation.size =3D 4;
+-                } else {
+-                        stream->dnstls_data.validation.data =3D server-=
>address.in6.s6_addr;
+-                        stream->dnstls_data.validation.size =3D 16;
++                if (server->server_name)
++                        gnutls_session_set_verify_cert(gs, server->serv=
er_name, 0);
++                else {
++                        stream->dnstls_data.validation.type =3D GNUTLS_=
DT_IP_ADDRESS;
++                        if (server->family =3D=3D AF_INET) {
++                                stream->dnstls_data.validation.data =3D=
 (unsigned char*) &server->address.in.s_addr;
++                                stream->dnstls_data.validation.size =3D=
 4;
++                        } else {
++                                stream->dnstls_data.validation.data =3D=
 server->address.in6.s6_addr;
++                                stream->dnstls_data.validation.size =3D=
 16;
++                        }
++                        gnutls_session_set_verify_cert2(gs, &stream->dn=
stls_data.validation, 1, 0);
+                 }
+-                gnutls_session_set_verify_cert2(gs, &stream->dnstls_dat=
a.validation, 1, 0);
+         }
+=20
+         gnutls_handshake_set_timeout(gs, GNUTLS_DEFAULT_HANDSHAKE_TIMEO=
UT);
+diff --git a/src/resolve/resolved-dnstls-openssl.c b/src/resolve/resolve=
d-dnstls-openssl.c
+index 85e202ff74..007aedaa5b 100644
+--- a/src/resolve/resolved-dnstls-openssl.c
++++ b/src/resolve/resolved-dnstls-openssl.c
+@@ -6,6 +6,7 @@
+=20
+ #include <openssl/bio.h>
+ #include <openssl/err.h>
++#include <openssl/x509v3.h>
+=20
+ #include "io-util.h"
+ #include "resolved-dns-stream.h"
+@@ -78,13 +79,19 @@ int dnstls_stream_connect_tls(DnsStream *stream, Dns=
Server *server) {
+=20
+         if (server->manager->dns_over_tls_mode =3D=3D DNS_OVER_TLS_YES)=
 {
+                 X509_VERIFY_PARAM *v;
+-                const unsigned char *ip;
+=20
+                 SSL_set_verify(s, SSL_VERIFY_PEER, NULL);
+                 v =3D SSL_get0_param(s);
+-                ip =3D server->family =3D=3D AF_INET ? (const unsigned =
char*) &server->address.in.s_addr : server->address.in6.s6_addr;
+-                if (!X509_VERIFY_PARAM_set1_ip(v, ip, FAMILY_ADDRESS_SI=
ZE(server->family)))
+-                        return -ECONNREFUSED;
++                if (server->server_name) {
++                        X509_VERIFY_PARAM_set_hostflags(v, X509_CHECK_F=
LAG_NO_PARTIAL_WILDCARDS);
++                        if (X509_VERIFY_PARAM_set1_host(v, server->serv=
er_name, 0) =3D=3D 0)
++                                return -ECONNREFUSED;
++                } else {
++                        const unsigned char *ip;
++                        ip =3D server->family =3D=3D AF_INET ? (const u=
nsigned char*) &server->address.in.s_addr : server->address.in6.s6_addr;
++                        if (X509_VERIFY_PARAM_set1_ip(v, ip, FAMILY_ADD=
RESS_SIZE(server->family)) =3D=3D 0)
++                                return -ECONNREFUSED;
++                }
+         }
+=20
+         ERR_clear_error();
+--=20
+2.40.1
+
diff --git a/meta/recipes-core/systemd/systemd_244.5.bb b/meta/recipes-co=
re/systemd/systemd_244.5.bb
index bd66d82932..8b2f47b92f 100644
--- a/meta/recipes-core/systemd/systemd_244.5.bb
+++ b/meta/recipes-core/systemd/systemd_244.5.bb
@@ -31,6 +31,7 @@ SRC_URI +=3D "file://touchscreen.rules \
            file://network-fix-Link-reference-counter-issue.patch \
            file://rm-rf-refactor-rm-rf-children-split-out-body-of-direct=
ory.patch \
            file://rm-rf-optionally-fsync-after-removing-directory-tree.p=
atch \
+           file://CVE-2018-21029.patch \
            file://CVE-2021-3997-1.patch \
            file://CVE-2021-3997-2.patch \
            file://CVE-2021-3997-3.patch \
--=20
2.40.1


