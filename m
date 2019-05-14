Return-Path: <liu.ming50@gmail.com>
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com
	[209.85.208.68])
	by mail.openembedded.org (Postfix) with ESMTP id 48AD47DE7C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 May 2019 18:32:18 +0000 (UTC)
Received: by mail-ed1-f68.google.com with SMTP id w11so293652edl.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 May 2019 11:32:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=l6z3zRdX9TIeeNvaUqIMno577EfJBplY4CkcO5EyvIQ=;
	b=DeO7WcxvkIag+RmqKbmnNW1gRCArQ+qaGc/7UWLnyWEK0HKLodj0vqdtzu+zUd2hR2
	BrLuOqB2/lCWl97/abe0bSj0sFIlFwXqBUVypfngZgcoZ2ORKqFGEHjCCk6WA/GCOwOr
	NRV1neAsQ7DYY3oElZONVhzSgX6e2KejBQE2zhOF2p+Wj0Oo3X4Y2gnS55dh4vuoExtB
	zEItnByfrhbbTzJR7M8xNEHXZCe77rHEayWmMUd60N8uWGbveyxLHDDymxD8xtf9KJ5U
	wCTZUbPAmHNMKLz8Tx/NrA23ZyCiHHhH3O7g7+n4jeYhWITt7x5AFxLyu/kkSZW0PYuo
	R3rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=l6z3zRdX9TIeeNvaUqIMno577EfJBplY4CkcO5EyvIQ=;
	b=FRlOPSs3RU8MnMiFkSzRuB0520LxNsv1ZRVtRBlwqQBV/nTQW3mekf0xj8UNecJXNx
	cUgvta1U0eMT8cfkbilvPEQPE5mctbzTQjcKTwlwFN9ueqLEkKG04gt+fNwataKKdLyK
	iZpVFlpSZJuN9YnJSBvm0uogzfvGKGyG6/nyE+2yJ8YqUXf83NbGLTxUbR4iyB6+D20U
	kjWl7t0K+Zci/OWwiglvXt5vhF48BO+dVQdrkWb3gmb1HIQP/e2n+jrhIQNPDopcIRyb
	/j7uIfla+7BoBBSKYweJjIKHdLH3yRl7B99lEp4mYapgRhCjY9QoslQzfliLksHyg5VG
	CMag==
X-Gm-Message-State: APjAAAUpJHAR7Ba4PFqGcFR/G/8okIZsKu/t0mfCbxG8TjigxHmDoXAD
	nrAj3B1hwf6WtoeJvnekf3IC9dlPfZGxEg==
X-Google-Smtp-Source: APXvYqyOycRNxyyz1clqvc3AeaLkkqB1Bp1UgLhey1uTkdUAWTs3z9HNxyYaV39TQhWy5hBy380dDg==
X-Received: by 2002:a17:906:f19a:: with SMTP id
	gs26mr22187715ejb.78.1557858738837; 
	Tue, 14 May 2019 11:32:18 -0700 (PDT)
Received: from peterliu-Precision-M4800.toradex.int
	(c-b09ee253.022-417-73746f13.bbcust.telenor.se. [83.226.158.176])
	by smtp.gmail.com with ESMTPSA id
	hb11sm1553719ejb.43.2019.05.14.11.32.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 14 May 2019 11:32:18 -0700 (PDT)
From: liu.ming50@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 May 2019 20:32:13 +0200
Message-Id: <1557858733-3194-1-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: Ming Liu <liu.ming50@gmail.com>
Subject: [PATCH] dhcp: fix a NSUPDATE compiling issue
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
X-List-Received-Date: Tue, 14 May 2019 18:32:18 -0000

From: Ming Liu <liu.ming50@gmail.com>

This patch fixes a following issue:
| omapip/isclib.c: In function 'dns_client_init':
| omapip/isclib.c:356:18: error: 'dhcp_context_t {aka struct dhcp_context}' has no member named 'dnsclient'
|   if (dhcp_gbl_ctx.dnsclient == NULL) {
|                   ^
| omapip/isclib.c:363:24: error: 'dhcp_context_t {aka struct dhcp_context}' has no member named 'dnsclient'
|            &dhcp_gbl_ctx.dnsclient,
|                         ^
| omapip/isclib.c:364:24: error: 'dhcp_context_t {aka struct dhcp_context}' has no member named 'use_local4'
|            (dhcp_gbl_ctx.use_local4 ?
|                         ^
| omapip/isclib.c:365:25: error: 'dhcp_context_t {aka struct dhcp_context}' has no member named 'local4_sockaddr'
|             &dhcp_gbl_ctx.local4_sockaddr
|                          ^
| omapip/isclib.c:367:24: error: 'dhcp_context_t {aka struct dhcp_context}' has no member named 'use_local6'
|            (dhcp_gbl_ctx.use_local6 ?
|                         ^
| omapip/isclib.c:368:25: error: 'dhcp_context_t {aka struct dhcp_context}' has no member named 'local6_sockaddr'
|             &dhcp_gbl_ctx.local6_sockaddr

Signed-off-by: Ming Liu <liu.ming50@gmail.com>
---
 .../dhcp/0001-Fix-a-NSUPDATE-compiling-issue.patch | 68 ++++++++++++++++++++++
 meta/recipes-connectivity/dhcp/dhcp_4.4.1.bb       |  1 +
 2 files changed, 69 insertions(+)
 create mode 100644 meta/recipes-connectivity/dhcp/dhcp/0001-Fix-a-NSUPDATE-compiling-issue.patch

diff --git a/meta/recipes-connectivity/dhcp/dhcp/0001-Fix-a-NSUPDATE-compiling-issue.patch b/meta/recipes-connectivity/dhcp/dhcp/0001-Fix-a-NSUPDATE-compiling-issue.patch
new file mode 100644
index 0000000..f12a112
--- /dev/null
+++ b/meta/recipes-connectivity/dhcp/dhcp/0001-Fix-a-NSUPDATE-compiling-issue.patch
@@ -0,0 +1,68 @@
+From a59cb98a473caa2afd64d7ae368480b6e9f91b3f Mon Sep 17 00:00:00 2001
+From: Ming Liu <liu.ming50@gmail.com>
+Date: Tue, 14 May 2019 11:07:15 +0200
+Subject: [PATCH] Fix a NSUPDATE compiling issue
+
+Upstream-Status: Pending [Patch sent to: https://gitlab.isc.org/isc-projects/dhcp/issues/16]
+
+A following error was observed when NSUPDATE is not defined:
+| omapip/isclib.c: In function 'dns_client_init':
+| omapip/isclib.c:356:18: error: 'dhcp_context_t {aka struct dhcp_context}' has no member named 'dnsclient'
+|   if (dhcp_gbl_ctx.dnsclient == NULL) {
+|                   ^
+| omapip/isclib.c:363:24: error: 'dhcp_context_t {aka struct dhcp_context}' has no member named 'dnsclient'
+|            &dhcp_gbl_ctx.dnsclient,
+|                         ^
+| omapip/isclib.c:364:24: error: 'dhcp_context_t {aka struct dhcp_context}' has no member named 'use_local4'
+|            (dhcp_gbl_ctx.use_local4 ?
+|                         ^
+| omapip/isclib.c:365:25: error: 'dhcp_context_t {aka struct dhcp_context}' has no member named 'local4_sockaddr'
+|             &dhcp_gbl_ctx.local4_sockaddr
+|                          ^
+| omapip/isclib.c:367:24: error: 'dhcp_context_t {aka struct dhcp_context}' has no member named 'use_local6'
+|            (dhcp_gbl_ctx.use_local6 ?
+|                         ^
+| omapip/isclib.c:368:25: error: 'dhcp_context_t {aka struct dhcp_context}' has no member named 'local6_sockaddr'
+|             &dhcp_gbl_ctx.local6_sockaddr
+
+Fix it by adding NSUPDATE conditional checking.
+
+Signed-off-by: Ming Liu <liu.ming50@gmail.com>
+---
+ includes/omapip/isclib.h | 2 ++
+ omapip/isclib.c          | 2 ++
+ 2 files changed, 4 insertions(+)
+
+diff --git a/includes/omapip/isclib.h b/includes/omapip/isclib.h
+index 538b927..6c20584 100644
+--- a/includes/omapip/isclib.h
++++ b/includes/omapip/isclib.h
+@@ -141,6 +141,8 @@ void isclib_cleanup(void);
+ void dhcp_signal_handler(int signal);
+ extern int shutdown_signal;
+ 
++#if defined (NSUPDATE)
+ isc_result_t dns_client_init();
++#endif
+ 
+ #endif /* ISCLIB_H */
+diff --git a/omapip/isclib.c b/omapip/isclib.c
+index db3b895..ce4b4a1 100644
+--- a/omapip/isclib.c
++++ b/omapip/isclib.c
+@@ -351,6 +351,7 @@ void dhcp_signal_handler(int signal) {
+ 	}
+ }
+ 
++#if defined (NSUPDATE)
+ isc_result_t dns_client_init() {
+ 	isc_result_t result;
+ 	if (dhcp_gbl_ctx.dnsclient == NULL) {
+@@ -387,3 +388,4 @@ isc_result_t dns_client_init() {
+ 
+ 	return ISC_R_SUCCESS;
+ }
++#endif
+-- 
+2.7.4
+
diff --git a/meta/recipes-connectivity/dhcp/dhcp_4.4.1.bb b/meta/recipes-connectivity/dhcp/dhcp_4.4.1.bb
index e8cc731..19524cb 100644
--- a/meta/recipes-connectivity/dhcp/dhcp_4.4.1.bb
+++ b/meta/recipes-connectivity/dhcp/dhcp_4.4.1.bb
@@ -11,6 +11,7 @@ SRC_URI += "file://0001-define-macro-_PATH_DHCPD_CONF-and-_PATH_DHCLIENT_CON.pat
             file://0012-dhcp-correct-the-intention-for-xml2-lib-search.patch \
             file://0013-fixup_use_libbind.patch \
             file://0001-master-Added-includes-of-new-BIND9-compatibility-hea.patch \
+            file://0001-Fix-a-NSUPDATE-compiling-issue.patch \
 "
 
 SRC_URI[md5sum] = "18c7f4dcbb0a63df25098216d47b1ede"
-- 
2.7.4


