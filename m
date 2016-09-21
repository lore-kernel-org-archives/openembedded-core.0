Return-Path: <maciej.borzecki@rndity.com>
Received: from mail-lf0-f41.google.com (mail-lf0-f41.google.com
	[209.85.215.41])
	by mail.openembedded.org (Postfix) with ESMTP id CFD7865CB6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Sep 2016 08:20:05 +0000 (UTC)
Received: by mail-lf0-f41.google.com with SMTP id b71so7247535lfg.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Sep 2016 01:20:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=rndity-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=XNKq4hM2+Fm+W+opzhxIGk33pnKDVT/cljyJPcJI+e4=;
	b=pLohBae+k+Dmz1xoFEPei1qxy0lmcLUK93g4Zd3/juxL0+AIhXUlLcFsCSTBuezhIE
	VgUaQqDccBKhsTvcy9ZpjSPoMkPNl1GwsE+CmCoSJmDp82FzHYNMTLM5V/LHlYgjRVCj
	7vvWOsfE+AbT0lsQnIkpI8cBneEevS+W0n+xM71ZdB1hcyiDBNSZmGckixNEwZk49agY
	QnzlMSRuGkGTlUB68aENXWwQNmzLY7ZLW+e02gEOQqgc22RNzsdlGIu0mFwv79653M2n
	ENkRbUx52/C5f/g0n/JMIm35YKMvmGu+BTvoxjh5lFxXnwgQf3k3GyeVNA079RPb+2rq
	vUvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=XNKq4hM2+Fm+W+opzhxIGk33pnKDVT/cljyJPcJI+e4=;
	b=a4CoX2px3+0ekpCUztWkLQQ7kQd47BvB0guss4CCwKnMdGsJKT+j8qx5xBka/iUMSt
	TTPKLwRU6/dxlcFbvk22MsTwEpk+X53P31oER3tcdErJ7voLPI9CE5EtvuEN046WZ7wG
	jjfdgKvXlcghd05coUqrPlzPqqg3Ik2+RL7ZqopWK8Ryi1haAhR4mY9vEvzhPLkyWbYT
	fmF+Q0oPCE8nSt49Ay/MM33QVEpf6wI98DXy+bSx2fpqcPavhqkJjde2EEE6qJNA5J4D
	MD+WWIqnqP0GIZug51C2K9zWEhMDnGENYD3QXAFUCm4RVZaEC28IQcspPELKHyUv7sKv
	Je7w==
X-Gm-Message-State: AE9vXwMvhvPtdCYmo3npsL2dAXwLpNhq/nkcRnCdUciwrbFXSMFX6KX/kAM+vX8/Y6vjcQ==
X-Received: by 10.46.32.205 with SMTP id g74mr13489958lji.1.1474446006369;
	Wed, 21 Sep 2016 01:20:06 -0700 (PDT)
Received: from comp_016_pc_buildenv.localdomain
	(staticline-31-182-60-238.toya.net.pl. [31.182.60.238])
	by smtp.gmail.com with ESMTPSA id s2sm6494252lja.35.2016.09.21.01.20.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 21 Sep 2016 01:20:05 -0700 (PDT)
From: Maciej Borzecki <maciej.borzecki@rndity.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 21 Sep 2016 10:19:59 +0200
Message-Id: <f07e3e1e57b5a8b9c9a7b9fe69c47596d28267bc.1474444047.git.maciej.borzecki@rndity.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1474444047.git.maciej.borzecki@rndity.com>
References: <cover.1474444047.git.maciej.borzecki@rndity.com>
In-Reply-To: <cover.1474444047.git.maciej.borzecki@rndity.com>
References: <cover.1474444047.git.maciej.borzecki@rndity.com>
Subject: [PATCH 2/2] systemd: use nss-resolve by default if resolved is enabled
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 21 Sep 2016 08:20:06 -0000

Add nss-resolve to NSS hosts resolution service if systemd-resolved is
enabled via PACKAGECONFIG. This enabled routing all DNS requests through
systemd-networkd by default.

Apply the following patches:
- 0023-nss-install-nss-modules-into-lib - makes sure that libnss_resolve
  and other nss modules end up in ${rootlibdir}
- 0024-resolved-when-processing-auxiliary-DNSSEC-transactio - backport
  v231 patch that fixes SERVFAIL handling, required for name resolution
  under qemu or in containers.

Signed-off-by: Maciej Borzecki <maciej.borzecki@rndity.com>
---
 .../0023-nss-install-nss-modules-into-lib.patch    | 64 ++++++++++++++++++++++
 ...en-processing-auxiliary-DNSSEC-transactio.patch | 49 +++++++++++++++++
 meta/recipes-core/systemd/systemd_230.bb           | 18 +++++-
 3 files changed, 129 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-core/systemd/systemd/0023-nss-install-nss-modules-into-lib.patch
 create mode 100644 meta/recipes-core/systemd/systemd/0024-resolved-when-processing-auxiliary-DNSSEC-transactio.patch

diff --git a/meta/recipes-core/systemd/systemd/0023-nss-install-nss-modules-into-lib.patch b/meta/recipes-core/systemd/systemd/0023-nss-install-nss-modules-into-lib.patch
new file mode 100644
index 0000000000000000000000000000000000000000..747d848a3e3917a69872cf68d77e26d66506a18e
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0023-nss-install-nss-modules-into-lib.patch
@@ -0,0 +1,64 @@
+From eb76a59139c5ca6355cf1ef9594dab8b73b9b1f5 Mon Sep 17 00:00:00 2001
+Message-Id: <eb76a59139c5ca6355cf1ef9594dab8b73b9b1f5.1474443269.git.maciej.borzecki@rndity.com>
+In-Reply-To: <cover.1474443269.git.maciej.borzecki@rndity.com>
+References: <cover.1474443269.git.maciej.borzecki@rndity.com>
+From: Maciek Borzecki <maciek.borzecki@gmail.com>
+Date: Tue, 20 Sep 2016 21:24:45 +0200
+Subject: [PATCH 1/2] nss: install nss modules into /lib
+
+NSS modules (libnss_*.so.*) need to be installed into
+${rootlibdir} (typically /lib) in order to be used. Previously, the
+modules were installed into ${libdir} (usually ${prefix}/lib), where in
+case of a split /usr, this would typically resolve to /usr/lib.
+
+Signed-off-by: Maciek Borzecki <maciek.borzecki@gmail.com>
+Signed-off-by: Maciej Borzecki <maciej.borzecki@rndity.com>
+
+---
+Upstream-Status: Pending
+
+ Makefile.am | 7 ++++---
+ 1 file changed, 4 insertions(+), 3 deletions(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index dbd3386..0e2dca5 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -151,6 +151,7 @@ nodist_zshcompletion_DATA = $(nodist_zshcompletion_data)
+ endif
+ udevlibexec_PROGRAMS =
+ gperf_gperf_sources =
++rootlib_LTLIBRARIES =
+ 
+ in_files = $(filter %.in,$(EXTRA_DIST))
+ in_in_files = $(filter %.in.in, $(in_files))
+@@ -4931,7 +4932,7 @@ libnss_myhostname_la_LDFLAGS = \
+ libnss_myhostname_la_LIBADD = \
+ 	libsystemd-internal.la
+ 
+-lib_LTLIBRARIES += \
++rootlib_LTLIBRARIES += \
+ 	libnss_myhostname.la
+ endif
+ 
+@@ -5030,7 +5031,7 @@ libnss_mymachines_la_LDFLAGS = \
+ libnss_mymachines_la_LIBADD = \
+ 	libsystemd-internal.la
+ 
+-lib_LTLIBRARIES += \
++rootlib_LTLIBRARIES += \
+ 	libnss_mymachines.la
+ 
+ endif
+@@ -5321,7 +5322,7 @@ libnss_resolve_la_LIBADD = \
+ 	libsystemd-internal.la \
+         -ldl
+ 
+-lib_LTLIBRARIES += \
++rootlib_LTLIBRARIES += \
+ 	libnss_resolve.la
+ 
+ systemd_resolve_SOURCES = \
+-- 
+2.5.0
+
diff --git a/meta/recipes-core/systemd/systemd/0024-resolved-when-processing-auxiliary-DNSSEC-transactio.patch b/meta/recipes-core/systemd/systemd/0024-resolved-when-processing-auxiliary-DNSSEC-transactio.patch
new file mode 100644
index 0000000000000000000000000000000000000000..6924ce712ca4e8bb3d9e59178515b8bef4e381a5
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0024-resolved-when-processing-auxiliary-DNSSEC-transactio.patch
@@ -0,0 +1,49 @@
+From 44f04e32cb66676446b70895278348910f3666c3 Mon Sep 17 00:00:00 2001
+Message-Id: <44f04e32cb66676446b70895278348910f3666c3.1474443269.git.maciej.borzecki@rndity.com>
+In-Reply-To: <cover.1474443269.git.maciej.borzecki@rndity.com>
+References: <cover.1474443269.git.maciej.borzecki@rndity.com>
+From: Lennart Poettering <lennart@poettering.net>
+Date: Thu, 23 Jun 2016 23:46:56 +0200
+Subject: [PATCH 2/2] resolved: when processing auxiliary DNSSEC transactions,
+ accept those with SERVFAIL
+
+Some upstream DNS servers return SERVFAIL if we ask them for DNSSEC RRs, which
+some forwarding DNS servers pass on to us as SERVFAIL (other though as
+NOERROR...). This is should not be considered a problem, as long as the domain
+in question didn't have DNSSEC enabled. Hence: when making use of auxiliary
+transactions accept those that return SERVFAIL.
+
+Signed-off-by: Maciej Borzecki <maciej.borzecki@rndity.com>
+---
+Upstream-Status: Backport from 231
+
+ src/resolve/resolved-dns-transaction.c | 9 +++++----
+ 1 file changed, 5 insertions(+), 4 deletions(-)
+
+diff --git a/src/resolve/resolved-dns-transaction.c b/src/resolve/resolved-dns-transaction.c
+index a4a6762..aa49e65 100644
+--- a/src/resolve/resolved-dns-transaction.c
++++ b/src/resolve/resolved-dns-transaction.c
+@@ -626,14 +626,15 @@ static int dns_transaction_dnssec_ready(DnsTransaction *t) {
+                         return 0;
+ 
+                 case DNS_TRANSACTION_RCODE_FAILURE:
+-                        if (dt->answer_rcode != DNS_RCODE_NXDOMAIN) {
++                        if (!IN_SET(dt->answer_rcode, DNS_RCODE_NXDOMAIN, DNS_RCODE_SERVFAIL)) {
+                                 log_debug("Auxiliary DNSSEC RR query failed with rcode=%s.", dns_rcode_to_string(dt->answer_rcode));
+                                 goto fail;
+                         }
+ 
+-                        /* Fall-through: NXDOMAIN is good enough for us. This is because some DNS servers erronously
+-                         * return NXDOMAIN for empty non-terminals (Akamai...), and we need to handle that nicely, when
+-                         * asking for parent SOA or similar RRs to make unsigned proofs. */
++                        /* Fall-through: NXDOMAIN/SERVFAIL is good enough for us. This is because some DNS servers
++                         * erronously return NXDOMAIN/SERVFAIL for empty non-terminals (Akamai...) or missing DS
++                         * records (Facebook), and we need to handle that nicely, when asking for parent SOA or similar
++                         * RRs to make unsigned proofs. */
+ 
+                 case DNS_TRANSACTION_SUCCESS:
+                         /* All good. */
+-- 
+2.5.0
+
diff --git a/meta/recipes-core/systemd/systemd_230.bb b/meta/recipes-core/systemd/systemd_230.bb
index 1276316a0cddeefecb34cf9422c94c3ed12f5381..4a78ff2e867c6b2484443612114c87c75b56a50e 100644
--- a/meta/recipes-core/systemd/systemd_230.bb
+++ b/meta/recipes-core/systemd/systemd_230.bb
@@ -36,7 +36,9 @@ SRC_URI += " \
            file://0021-include-missing.h-for-getting-secure_getenv-definiti.patch \
            file://0022-socket-util-don-t-fail-if-libc-doesn-t-support-IDN.patch \
            file://udev-re-enable-mount-propagation-for-udevd.patch \
-"
+           file://0023-nss-install-nss-modules-into-lib.patch \
+           file://0024-resolved-when-processing-auxiliary-DNSSEC-transactio.patch \
+           "
 SRC_URI_append_libc-uclibc = "\
            file://0002-units-Prefer-getty-to-agetty-in-console-setup-system.patch \
 "
@@ -452,7 +454,7 @@ FILES_${PN} = " ${base_bindir}/* \
                 ${rootlibexecdir}/systemd/* \
                 ${systemd_unitdir}/* \
                 ${base_libdir}/security/*.so \
-                ${libdir}/libnss_* \
+                ${rootlibdir}/libnss_* \
                 /cgroup \
                 ${bindir}/systemd* \
                 ${bindir}/busctl \
@@ -562,12 +564,24 @@ pkg_postinst_${PN} () {
 	sed -e '/^hosts:/s/\s*\<myhostname\>//' \
 		-e 's/\(^hosts:.*\)\(\<files\>\)\(.*\)\(\<dns\>\)\(.*\)/\1\2 myhostname \3\4\5/' \
 		-i $D${sysconfdir}/nsswitch.conf
+
+	if ${@bb.utils.contains('PACKAGECONFIG', 'resolved', 'true', 'false', d)}; then
+			# replace dns with resolve
+			sed -e 's/^hosts:\(.*\)dns\(.*\)/hosts:\1 resolve \2/' \
+					-i $D${sysconfdir}/nsswitch.conf
+	fi
 }
 
 pkg_prerm_${PN} () {
 	sed -e '/^hosts:/s/\s*\<myhostname\>//' \
 		-e '/^hosts:/s/\s*myhostname//' \
 		-i $D${sysconfdir}/nsswitch.conf
+
+	if ${@bb.utils.contains('PACKAGECONFIG', 'resolved', 'true', 'false', d)}; then
+			# restore dns
+			sed -e 's/^hosts:\(.*\)resolve\(.*\)/hosts:\1 dns \2/' \
+					-i $D${sysconfdir}/nsswitch.conf
+	fi
 }
 
 pkg_postinst_udev-hwdb () {
-- 
2.5.0


