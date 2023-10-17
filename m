Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DC27CDB483
	for <webhook@archiver.kernel.org>; Tue, 17 Oct 2023 18:43:01 +0000 (UTC)
Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
 by mx.groups.io with SMTP id smtpd.web11.238377.1697568175023020096
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Oct 2023 11:42:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=lq6JywMQ;
 spf=softfail (domain: sakoman.com, ip: 209.85.161.41, mailfrom: steve@sakoman.com)
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-581cb88f645so739418eaf.1
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Oct 2023 11:42:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1697568174; x=1698172974; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WAlmfYCoxlVN703j8lUCzDfcE7TrCsf6LeeKczeGuzQ=;
        b=lq6JywMQLcbjXczGyrHNzbICE9X2+qXHf+LIKWJEmZQ1sdVyM1Fwu0/cQu+ImyiWHl
         83qSp03JvCav/RvCJbdvulHO0BF0NwFZCF9VWap2IsRsq4qSgFyyc4TF5qKHbqvDkARz
         yOOaOUahqE1XcHYQAq6TpGOu8GSvM07dHvIqcI+lwZczitMQE6/r68oBS5tae+wW8FGb
         +fJ0C6eqhY2Vml3fD+0/7mzwPlo/zFBhnFow1S5XSkOuN5jjfHyZ9psZAGf9WFReU2zb
         ZNm3WYaaBe1HPoQQypmB5qcDRyRCbYL5iitfRuGgcU9MVTOncJsjZGVnSvxAb8RMuZ50
         Qheg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697568174; x=1698172974;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WAlmfYCoxlVN703j8lUCzDfcE7TrCsf6LeeKczeGuzQ=;
        b=Mw2yYGuNXl89WUVj4ji2HT1cMAOu1jgTflSBQRffsJTipfl7WgIpBdAqMhupydD9Gc
         ABohZ+TfAGWcGxhZ1dLzdBr6tAk4+Goh6KdR3UxW3J9Z24AqipZ3mym/NcYIN6aASxAi
         Ur4+a6mLQBT2b4wi5Qy/PwxKffmFv6PilhWB0HuBbjrOW5FKgsqseyFlS7DophVNgch1
         NGrJHxjPoiWl06hSZwM1noB6mzkh7OvJdGNN4bhsedOGZaGzedEWWwgc1lhxZg3HV3gR
         ThwdZ6bh2n4xpuyOPJ7ycrwv+T3sJKCo3l9vlzdEnauUDBTUW5SZQ/U0WTCZI66slgms
         l+7g==
X-Gm-Message-State: AOJu0Yxb7v17NOsJWqhYumac6bi3sZw2Bj4EJEoa5eLQwZEI5f7Gwe3l
	+I0q66DxCeoLo2cZn7zUzZxRNjqHRl1jdF5ibtY=
X-Google-Smtp-Source: AGHT+IErWGyVueiw4ImMqzLsU4dQ4FScOJfTMyW6RGZpLLcxzYeftsprcUjfV1lajcn3BUJSpf/BsA==
X-Received: by 2002:a05:6359:3107:b0:135:57d0:d171 with SMTP id rh7-20020a056359310700b0013557d0d171mr3136372rwb.15.1697568173842;
        Tue, 17 Oct 2023 11:42:53 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id w123-20020a626281000000b0066a31111cc5sm1838715pfb.152.2023.10.17.11.42.53
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Oct 2023 11:42:53 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 10/10] systemd: Backport systemd-resolved: use hostname for certificate validation in DoT
Date: Tue, 17 Oct 2023 08:42:30 -1000
Message-Id: <6b4a583169ae40a8d51e7ffa33785409b5111a81.1697567211.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1697567211.git.steve@sakoman.com>
References: <cover.1697567211.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Oct 2023 18:43:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189361

From: Marek Vasut <marex@denx.de>

Widely accepted certificates for IP addresses are expensive and only
affordable for larger organizations. Therefore if the user provides
the hostname in the DNS= option, we should use it instead of the IP
address.

This fixes https://nvd.nist.gov/vuln/detail/CVE-2018-21029 per
suggestion https://github.com/systemd/systemd-stable/issues/72 .

CVE: CVE-2018-21029
Signed-off-by: Marek Vasut <marex@denx.de>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../systemd/systemd/CVE-2018-21029.patch      | 120 ++++++++++++++++++
 meta/recipes-core/systemd/systemd_244.5.bb    |   1 +
 2 files changed, 121 insertions(+)
 create mode 100644 meta/recipes-core/systemd/systemd/CVE-2018-21029.patch

diff --git a/meta/recipes-core/systemd/systemd/CVE-2018-21029.patch b/meta/recipes-core/systemd/systemd/CVE-2018-21029.patch
new file mode 100644
index 0000000000..8d3801a248
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/CVE-2018-21029.patch
@@ -0,0 +1,120 @@
+From 3f9d9289ee8730a81a0464539f4e1ba2d23d0ce9 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?J=C3=B6rg=20Thalheim?= <joerg@thalheim.io>
+Date: Tue, 3 Mar 2020 23:31:25 +0000
+Subject: [PATCH] systemd-resolved: use hostname for certificate validation in
+ DoT
+
+Widely accepted certificates for IP addresses are expensive and only
+affordable for larger organizations. Therefore if the user provides
+the hostname in the DNS= option, we should use it instead of the IP
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
+         <term><varname>DNSOverTLS=</varname></term>
+         <listitem>
+-        <para>Takes a boolean argument or <literal>opportunistic</literal>.
+-        If true all connections to the server will be encrypted. Note that
+-        this mode requires a DNS server that supports DNS-over-TLS and has
+-        a valid certificate for it's IP. If the DNS server does not support
+-        DNS-over-TLS all DNS requests will fail. When set to <literal>opportunistic</literal>
++        <para>Takes a boolean argument or <literal>opportunistic</literal>. If
++        true all connections to the server will be encrypted. Note that this
++        mode requires a DNS server that supports DNS-over-TLS and has a valid
++        certificate. If the hostname was specified in <varname>DNS=</varname>
++        by using the format format <literal>address#server_name</literal> it
++        is used to validate its certificate and also to enable Server Name
++        Indication (SNI) when opening a TLS connection. Otherwise
++        the certificate is checked against the server's IP.
++        If the DNS server does not support DNS-over-TLS all DNS requests will fail.</para>
++
++        <para>When set to <literal>opportunistic</literal>
+         DNS request are attempted to send encrypted with DNS-over-TLS.
+         If the DNS server does not support TLS, DNS-over-TLS is disabled.
+         Note that this mode makes DNS-over-TLS vulnerable to "downgrade"
+diff --git a/src/resolve/resolved-dnstls-gnutls.c b/src/resolve/resolved-dnstls-gnutls.c
+index ed0a31e8bf..c7215723a7 100644
+--- a/src/resolve/resolved-dnstls-gnutls.c
++++ b/src/resolve/resolved-dnstls-gnutls.c
+@@ -56,15 +56,19 @@ int dnstls_stream_connect_tls(DnsStream *stream, DnsServer *server) {
+         }
+ 
+         if (server->manager->dns_over_tls_mode == DNS_OVER_TLS_YES) {
+-                stream->dnstls_data.validation.type = GNUTLS_DT_IP_ADDRESS;
+-                if (server->family == AF_INET) {
+-                        stream->dnstls_data.validation.data = (unsigned char*) &server->address.in.s_addr;
+-                        stream->dnstls_data.validation.size = 4;
+-                } else {
+-                        stream->dnstls_data.validation.data = server->address.in6.s6_addr;
+-                        stream->dnstls_data.validation.size = 16;
++                if (server->server_name)
++                        gnutls_session_set_verify_cert(gs, server->server_name, 0);
++                else {
++                        stream->dnstls_data.validation.type = GNUTLS_DT_IP_ADDRESS;
++                        if (server->family == AF_INET) {
++                                stream->dnstls_data.validation.data = (unsigned char*) &server->address.in.s_addr;
++                                stream->dnstls_data.validation.size = 4;
++                        } else {
++                                stream->dnstls_data.validation.data = server->address.in6.s6_addr;
++                                stream->dnstls_data.validation.size = 16;
++                        }
++                        gnutls_session_set_verify_cert2(gs, &stream->dnstls_data.validation, 1, 0);
+                 }
+-                gnutls_session_set_verify_cert2(gs, &stream->dnstls_data.validation, 1, 0);
+         }
+ 
+         gnutls_handshake_set_timeout(gs, GNUTLS_DEFAULT_HANDSHAKE_TIMEOUT);
+diff --git a/src/resolve/resolved-dnstls-openssl.c b/src/resolve/resolved-dnstls-openssl.c
+index 85e202ff74..007aedaa5b 100644
+--- a/src/resolve/resolved-dnstls-openssl.c
++++ b/src/resolve/resolved-dnstls-openssl.c
+@@ -6,6 +6,7 @@
+ 
+ #include <openssl/bio.h>
+ #include <openssl/err.h>
++#include <openssl/x509v3.h>
+ 
+ #include "io-util.h"
+ #include "resolved-dns-stream.h"
+@@ -78,13 +79,19 @@ int dnstls_stream_connect_tls(DnsStream *stream, DnsServer *server) {
+ 
+         if (server->manager->dns_over_tls_mode == DNS_OVER_TLS_YES) {
+                 X509_VERIFY_PARAM *v;
+-                const unsigned char *ip;
+ 
+                 SSL_set_verify(s, SSL_VERIFY_PEER, NULL);
+                 v = SSL_get0_param(s);
+-                ip = server->family == AF_INET ? (const unsigned char*) &server->address.in.s_addr : server->address.in6.s6_addr;
+-                if (!X509_VERIFY_PARAM_set1_ip(v, ip, FAMILY_ADDRESS_SIZE(server->family)))
+-                        return -ECONNREFUSED;
++                if (server->server_name) {
++                        X509_VERIFY_PARAM_set_hostflags(v, X509_CHECK_FLAG_NO_PARTIAL_WILDCARDS);
++                        if (X509_VERIFY_PARAM_set1_host(v, server->server_name, 0) == 0)
++                                return -ECONNREFUSED;
++                } else {
++                        const unsigned char *ip;
++                        ip = server->family == AF_INET ? (const unsigned char*) &server->address.in.s_addr : server->address.in6.s6_addr;
++                        if (X509_VERIFY_PARAM_set1_ip(v, ip, FAMILY_ADDRESS_SIZE(server->family)) == 0)
++                                return -ECONNREFUSED;
++                }
+         }
+ 
+         ERR_clear_error();
+-- 
+2.40.1
+
diff --git a/meta/recipes-core/systemd/systemd_244.5.bb b/meta/recipes-core/systemd/systemd_244.5.bb
index bd66d82932..8b2f47b92f 100644
--- a/meta/recipes-core/systemd/systemd_244.5.bb
+++ b/meta/recipes-core/systemd/systemd_244.5.bb
@@ -31,6 +31,7 @@ SRC_URI += "file://touchscreen.rules \
            file://network-fix-Link-reference-counter-issue.patch \
            file://rm-rf-refactor-rm-rf-children-split-out-body-of-directory.patch \
            file://rm-rf-optionally-fsync-after-removing-directory-tree.patch \
+           file://CVE-2018-21029.patch \
            file://CVE-2021-3997-1.patch \
            file://CVE-2021-3997-2.patch \
            file://CVE-2021-3997-3.patch \
-- 
2.34.1


