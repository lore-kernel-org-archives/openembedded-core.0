Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41710CC6B34
	for <webhook@archiver.kernel.org>; Thu, 15 Oct 2026 05:03:50 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.32814.1792040620011206514
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Oct 2026 22:03:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=0iccKiwP;
 spf=pass (domain: smile.fr, ip: 209.85.128.41, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-49e73611928so42318435e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Oct 2026 22:03:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1792040618; x=1792645418; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=WIRXCdXZVc9WzMbUN4i/LNEtKjG/94kmifWRBM2z2og=;
        b=0iccKiwPqBDuLqHpmAbinNRzxPiyrRujwy//yYTDePk0cnWvbp5R/GEAt3tOkYeorM
         kaPjGBr+BLzKAgFdu+oVadrQLzrPVURk0T011J9vKNKH07oIedYImP+s5PdK9YARxqSe
         zVyKqGELbp8DawnWPTRg/1SQdJaLI7rvLJ2r8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792040618; x=1792645418;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=WIRXCdXZVc9WzMbUN4i/LNEtKjG/94kmifWRBM2z2og=;
        b=uUN2hqGXVJsro9RrECq686IdwI7+wKsWmMQ36neFhGWAGSYWivFLoSBL9LtfBReeUO
         pvNIs+y2QmuUyC39Pms5NNhEYOitmueEmx4nv+ujgJaEzFftxWbIF2kjGxC4XBjGtSaG
         BFInI+/2IkRDVMZzuyiONkDXPFKr/P+KfSwyQvnGbkYvmCswNEaR6vaEItYt0KUAmJXt
         oUSQU6skQ27ZSGsMEiQc3WIGL7ATIfAAgktGTzvPaSURntthkhyoD37dSsoH+Ki31wxE
         58wpKMg+hwsdPu/TMbigD8oMhlnDocxfJ3cdywo4gVJ5IkGeW6AhYNaeUB3GxGm72fvh
         mtsA==
X-Gm-Message-State: AFq9FYLVhVJpTPW5Q63fcDlx3WzN/kVL9IvuHxzpP0k8tR2vTi4TwxKU
	JQ42KQCwCpWYt+zNNyadpUS0/eriOEYe9P52MYdeVOxzZw3knlx+6l/zHSToeUJRty19FcK/OZh
	lfhpQlhY=
X-Gm-Gg: AYBFou2zBiJ92YoWtwzEy8AOIlYk5BYvLnNL3Yy4z40Pj1McSKFuWRJJ1UljE6ykZcA
	yJALTvDcsARjOPVgpcQrZ99vrvFdUfhT1ikwf8jvDUFRvqcUAddNg1Q6yCb+0DE5HBJAUaZsrPD
	epyFQRJpwepAQJj8v+mEzs6Yz/sNsFqCQwVtUF1yab5TA4xMqKnOxQsCQQQzF++elqoUhoVpXV4
	4FY+ycJM0ATdnfbMqAJbaiWL2LZNRaBLq6Fwo0AXVnZNTXJGJYr+5TG7jMmCiQ+YDf6Vla1AgSx
	yYg5x4wIsBhOrAHAuIQ8TIwAvut2Nm4wEMMHEQ6KWrk9bhKcmvU4Ia8Az8WgOU13EZXNCdSRaOl
	7GL5N8WdN2wUYyG5z8W7zzCrNUTuZylMpeAVnbyr4kpoLaqeS7IC+vnFZZk3gvi8VTaGZLcA88w
	1w38sybp3Sg+QWP8aVF5cvHdgkhpVatMRRc1SxKOsKRUcthWD+631OtsDmXujgHGpueZz4e+YTR
	1NAXYvawJDPGK7agB7LD5yaJYJ8m1ERU6QQdsalY814O9M0iVox3IjMi0m0KSqkNCucwZWWarpO
	1ZacCr9R
X-Received: by 2002:a05:600c:5254:b0:4a0:20b4:ba93 with SMTP id 5b1f17b1804b1-4a18e4aa11dmr360573415e9.16.1792040618016;
        Wed, 14 Oct 2026 22:03:38 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bd972aebsm46376245e9.1.2026.10.14.22.03.37
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 22:03:37 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 02/55] gnutls: fix CVE-2026-42012
Date: Thu, 15 Oct 2026 07:02:25 +0200
Message-ID: <f1ca2d85bf3ad8f7b31450c38627f48942fc9380.1792020605.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1792020605.git.yoann.congal@smile.fr>
References: <cover.1792020605.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Oct 2026 05:03:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247800

From: Jakub Szczudlo (Nokia) <jakub.szczudlo@nokia.com>

Backport patch to fix CVE-2026-42012.

References:
  https://nvd.nist.gov/vuln/detail/CVE-2026-42012

Upstream fix:
  https://gitlab.com/gnutls/gnutls/-/commit/8dcc6a1f48945997666ac9f10896819edd01a03b

Tested with ptest
Pre patches taken from upstream so CVE fix will land cleanly

Signed-off-by: Jakub Szczudlo <jakub.szczudlo@nokia.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
[YC: fixed patch format]
---
 .../gnutls/gnutls/CVE-2026-42012-pre1.patch   |  69 ++++++++
 .../gnutls/gnutls/CVE-2026-42012-pre2.patch   | 162 ++++++++++++++++++
 .../gnutls/gnutls/CVE-2026-42012-pre3.patch   | 129 ++++++++++++++
 .../gnutls/gnutls/CVE-2026-42012.patch        |  48 ++++++
 meta/recipes-support/gnutls/gnutls_3.8.4.bb   |   4 +
 5 files changed, 412 insertions(+)
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2026-42012-pre1.patch
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2026-42012-pre2.patch
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2026-42012-pre3.patch
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2026-42012.patch

diff --git a/meta/recipes-support/gnutls/gnutls/CVE-2026-42012-pre1.patch b/meta/recipes-support/gnutls/gnutls/CVE-2026-42012-pre1.patch
new file mode 100644
index 00000000000..9b2a5d16cab
--- /dev/null
+++ b/meta/recipes-support/gnutls/gnutls/CVE-2026-42012-pre1.patch
@@ -0,0 +1,69 @@
+From 6133fb459b74a9dcfa2d0ff010a4e03c56822d39 Mon Sep 17 00:00:00 2001
+From: Alexander Sosedkin <asosedkin@redhat.com>
+Date: Fri, 13 Mar 2026 17:00:03 +0100
+Subject: [PATCH] x509/hostname-verify: refactor and simplify CN fallback logic
+
+Signed-off-by: Alexander Sosedkin <asosedkin@redhat.com>
+CVE: CVE-2026-42012
+Upstream-Status: Backport [https://gitlab.com/gnutls/gnutls/-/commit/6133fb459b74a9dcfa2d0ff010a4e03c56822d39]
+
+Signed-off-by: Jakub Szczudlo <jakub.szczudlo@nokia.com>
+---
+ lib/x509/hostname-verify.c | 15 ++++++---------
+ 1 file changed, 6 insertions(+), 9 deletions(-)
+
+diff --git a/lib/x509/hostname-verify.c b/lib/x509/hostname-verify.c
+--- a/lib/x509/hostname-verify.c
++++ b/lib/x509/hostname-verify.c
+@@ -108,7 +108,7 @@ unsigned gnutls_x509_crt_check_ip(gnutls
+  * that we do not fallback to CN-ID if we encounter a supported name
+  * type.
+  */
+-#define IS_SAN_SUPPORTED(san) \
++#define PRECLUDES_CN_FALLBACK(san) \
+ 	(san == GNUTLS_SAN_DNSNAME || san == GNUTLS_SAN_IPADDRESS)
+ 
+ /**
+@@ -151,13 +151,12 @@ unsigned gnutls_x509_crt_check_hostname2
+ {
+ 	char dnsname[MAX_CN];
+ 	size_t dnsnamesize;
+-	int found_dnsname = 0;
+ 	int ret = 0;
+ 	int i = 0;
+ 	struct in_addr ipv4;
+ 	char *p = NULL;
+ 	char *a_hostname;
+-	unsigned have_other_addresses = 0;
++	bool cn_fallback_allowed = true;
+ 	gnutls_datum_t out;
+ 
+ 	/* check whether @hostname is an ip address */
+@@ -213,9 +212,10 @@ hostname_fallback:
+ 		ret = gnutls_x509_crt_get_subject_alt_name(cert, i, dnsname,
+ 							   &dnsnamesize, NULL);
+ 
+-		if (ret == GNUTLS_SAN_DNSNAME) {
+-			found_dnsname = 1;
++		if (PRECLUDES_CN_FALLBACK(ret))
++			cn_fallback_allowed = false;
+ 
++		if (ret == GNUTLS_SAN_DNSNAME) {
+ 			if (memchr(dnsname, '\0', dnsnamesize)) {
+ 				_gnutls_debug_log(
+ 					"certificate has %s with embedded null in name\n",
+@@ -236,13 +236,10 @@ hostname_fallback:
+ 				ret = 1;
+ 				goto cleanup;
+ 			}
+-		} else {
+-			if (IS_SAN_SUPPORTED(ret))
+-				have_other_addresses = 1;
+ 		}
+ 	}
+ 
+-	if (!have_other_addresses && !found_dnsname &&
++	if (cn_fallback_allowed &&
+ 	    _gnutls_check_key_purpose(cert, GNUTLS_KP_TLS_WWW_SERVER, 0) != 0) {
+ 		/* did not get the necessary extension, use CN instead, if the
+ 		 * certificate would have been acceptable for a TLS WWW server purpose.
diff --git a/meta/recipes-support/gnutls/gnutls/CVE-2026-42012-pre2.patch b/meta/recipes-support/gnutls/gnutls/CVE-2026-42012-pre2.patch
new file mode 100644
index 00000000000..323b0e80d21
--- /dev/null
+++ b/meta/recipes-support/gnutls/gnutls/CVE-2026-42012-pre2.patch
@@ -0,0 +1,162 @@
+From 5cc003b9688378f6c7934b1df0aa147e80006be4 Mon Sep 17 00:00:00 2001
+From: Alexander Sosedkin <asosedkin@redhat.com>
+Date: Fri, 13 Mar 2026 17:41:33 +0100
+Subject: [PATCH] x509: add bare-bones awareness of SRV virtual SAN
+
+There's no support for constraints, no certtool support, no nothing.
+Just added what's easy to add because I needed a virtual SAN for them.
+
+Signed-off-by: Alexander Sosedkin <asosedkin@redhat.com>
+CVE: CVE-2026-42012
+Upstream-Status: Backport [https://gitlab.com/gnutls/gnutls/-/commit/5cc003b9688378f6c7934b1df0aa147e80006be4]
+
+Backport Changes:
+- common.h context updated for 3.8.4 (PKIX1_RSA_OAEP_P_SPECIFIED_OID).
+- virt-san.c: use _gnutls_steal_datum instead of upstream _gnutls_take_datum
+  (steal_datum comes from CVE-2026-42012-pre3).
+
+Signed-off-by: Jakub Szczudlo <jakub.szczudlo@nokia.com>
+---
+ lib/includes/gnutls/gnutls.h.in |  4 +++-
+ lib/x509/common.h               |  1 +
+ lib/x509/name_constraints.c     |  3 ++-
+ lib/x509/output.c               |  6 ++++++
+ lib/x509/virt-san.c             | 23 +++++++++++++++++++++++
+ lib/x509/x509.c                 |  3 ++-
+ 6 files changed, 37 insertions(+), 3 deletions(-)
+
+diff --git a/lib/includes/gnutls/gnutls.h.in b/lib/includes/gnutls/gnutls.h.in
+--- a/lib/includes/gnutls/gnutls.h.in
++++ b/lib/includes/gnutls/gnutls.h.in
+@@ -2646,6 +2646,7 @@ void gnutls_psk_set_server_params_functi
+  * @GNUTLS_SAN_OTHERNAME_XMPP: Virtual SAN, used by certain functions for convenience.
+  * @GNUTLS_SAN_OTHERNAME_KRB5PRINCIPAL: Virtual SAN, used by certain functions for convenience.
+  * @GNUTLS_SAN_OTHERNAME_MSUSERPRINCIPAL: Virtual SAN, used by certain functions for convenience.
++ * @GNUTLS_SAN_OTHERNAME_SRV: Virtual SAN, used by certain functions for convenience.
+  *
+  * Enumeration of different subject alternative names types.
+  */
+@@ -2663,7 +2664,8 @@ typedef enum gnutls_x509_subject_alt_nam
+ 	   Used by gnutls_x509_crt_get_subject_alt_othername_oid.  */
+ 	GNUTLS_SAN_OTHERNAME_XMPP = 1000,
+ 	GNUTLS_SAN_OTHERNAME_KRB5PRINCIPAL,
+-	GNUTLS_SAN_OTHERNAME_MSUSERPRINCIPAL
++	GNUTLS_SAN_OTHERNAME_MSUSERPRINCIPAL,
++	GNUTLS_SAN_OTHERNAME_SRV
+ } gnutls_x509_subject_alt_name_t;
+ 
+ struct gnutls_openpgp_crt_int;
+diff --git a/lib/x509/common.h b/lib/x509/common.h
+--- a/lib/x509/common.h
++++ b/lib/x509/common.h
+@@ -107,6 +107,7 @@
+ #define XMPP_OID "1.3.6.1.5.5.7.8.5"
+ #define KRB5_PRINCIPAL_OID "1.3.6.1.5.2.2"
+ #define MSUSER_PRINCIPAL_NAME_OID "1.3.6.1.4.1.311.20.2.3"
++#define SRV_OID "1.3.6.1.5.5.7.8.7"
+ #define PKIX1_RSA_PSS_MGF1_OID "1.2.840.113549.1.1.8"
+ #define PKIX1_RSA_OAEP_P_SPECIFIED_OID "1.9"
+ 
+diff --git a/lib/x509/name_constraints.c b/lib/x509/name_constraints.c
+--- a/lib/x509/name_constraints.c
++++ b/lib/x509/name_constraints.c
+@@ -516,7 +516,8 @@ static int validate_name_constraints_nod
+ 	if (type != GNUTLS_SAN_DNSNAME && type != GNUTLS_SAN_RFC822NAME &&
+ 	    type != GNUTLS_SAN_DN && type != GNUTLS_SAN_URI &&
+ 	    type != GNUTLS_SAN_IPADDRESS &&
+-	    type != GNUTLS_SAN_OTHERNAME_MSUSERPRINCIPAL) {
++	    type != GNUTLS_SAN_OTHERNAME_MSUSERPRINCIPAL &&
++	    type != GNUTLS_SAN_OTHERNAME_SRV) {
+ 		return gnutls_assert_val(GNUTLS_E_X509_UNKNOWN_SAN);
+ 	}
+ 
+diff --git a/lib/x509/output.c b/lib/x509/output.c
+--- a/lib/x509/output.c
++++ b/lib/x509/output.c
+@@ -121,6 +121,7 @@ static void print_name(gnutls_buffer_st
+ 	if ((type == GNUTLS_SAN_DNSNAME || type == GNUTLS_SAN_OTHERNAME_XMPP ||
+ 	     type == GNUTLS_SAN_OTHERNAME_KRB5PRINCIPAL ||
+ 	     type == GNUTLS_SAN_OTHERNAME_MSUSERPRINCIPAL ||
++	     type == GNUTLS_SAN_OTHERNAME_SRV ||
+ 	     type == GNUTLS_SAN_RFC822NAME || type == GNUTLS_SAN_URI) &&
+ 	    sname != NULL && strlen(sname) != name->size) {
+ 		adds(str, _("warning: SAN contains an embedded NUL, "
+@@ -180,6 +181,11 @@ static void print_name(gnutls_buffer_st
+ 		     name->size, NON_NULL(name->data));
+ 		break;
+ 
++	case GNUTLS_SAN_OTHERNAME_SRV:
++		addf(str, _("%sSRVName: %.*s\n"), prefix, name->size,
++		     NON_NULL(name->data));
++		break;
++
+ 	default:
+ 		addf(str, _("%sUnknown name: "), prefix);
+ 		_gnutls_buffer_hexprint(str, name->data, name->size);
+diff --git a/lib/x509/virt-san.c b/lib/x509/virt-san.c
+--- a/lib/x509/virt-san.c
++++ b/lib/x509/virt-san.c
+@@ -45,6 +45,9 @@ static int san_othername_to_virtual(cons
+ 			 memcmp(oid, MSUSER_PRINCIPAL_NAME_OID,
+ 				sizeof(MSUSER_PRINCIPAL_NAME_OID) - 1) == 0)
+ 			return GNUTLS_SAN_OTHERNAME_MSUSERPRINCIPAL;
++		else if ((unsigned)size == (sizeof(SRV_OID) - 1) &&
++			 memcmp(oid, SRV_OID, sizeof(SRV_OID) - 1) == 0)
++			return GNUTLS_SAN_OTHERNAME_SRV;
+ 	}
+ 
+ 	return GNUTLS_SAN_OTHERNAME;
+@@ -59,6 +62,8 @@ static const char *virtual_to_othername_
+ 		return KRB5_PRINCIPAL_OID;
+ 	case GNUTLS_SAN_OTHERNAME_MSUSERPRINCIPAL:
+ 		return MSUSER_PRINCIPAL_NAME_OID;
++	case GNUTLS_SAN_OTHERNAME_SRV:
++		return SRV_OID;
+ 	default:
+ 		return NULL;
+ 	}
+@@ -126,6 +131,15 @@ int _gnutls_alt_name_assign_virt_type(st
+ 			name->type = GNUTLS_SAN_OTHERNAME;
+ 			break;
+ 
++		case GNUTLS_SAN_OTHERNAME_SRV:
++			ret = _gnutls_x509_encode_string(ASN1_ETYPE_IA5_STRING,
++							 san->data, san->size,
++							 &encoded);
++			if (ret < 0)
++				return gnutls_assert_val(ret);
++			name->san = _gnutls_steal_datum(&encoded);
++			break;
++
+ 		default:
+ 			return gnutls_assert_val(GNUTLS_E_INVALID_REQUEST);
+ 		}
+@@ -187,6 +201,15 @@ int gnutls_x509_othername_to_virtual(con
+ 						 othername->data,
+ 						 othername->size, virt, 0);
+ 		if (ret < 0) {
++			gnutls_assert();
++			return ret;
++		}
++		return 0;
++	case GNUTLS_SAN_OTHERNAME_SRV:
++		ret = _gnutls_x509_decode_string(ASN1_ETYPE_IA5_STRING,
++						 othername->data,
++						 othername->size, virt, 0);
++		if (ret < 0) {
+ 			gnutls_assert();
+ 			return ret;
+ 		}
+diff --git a/lib/x509/x509.c b/lib/x509/x509.c
+--- a/lib/x509/x509.c
++++ b/lib/x509/x509.c
+@@ -1554,7 +1554,8 @@ inline static int is_type_printable(int
+ {
+ 	if (type == GNUTLS_SAN_DNSNAME || type == GNUTLS_SAN_RFC822NAME ||
+ 	    type == GNUTLS_SAN_URI || type == GNUTLS_SAN_OTHERNAME_XMPP ||
+-	    type == GNUTLS_SAN_OTHERNAME || type == GNUTLS_SAN_REGISTERED_ID)
++	    type == GNUTLS_SAN_OTHERNAME_SRV || type == GNUTLS_SAN_OTHERNAME ||
++	    type == GNUTLS_SAN_REGISTERED_ID)
+ 		return 1;
+ 	else
+ 		return 0;
diff --git a/meta/recipes-support/gnutls/gnutls/CVE-2026-42012-pre3.patch b/meta/recipes-support/gnutls/gnutls/CVE-2026-42012-pre3.patch
new file mode 100644
index 00000000000..7ed76d03660
--- /dev/null
+++ b/meta/recipes-support/gnutls/gnutls/CVE-2026-42012-pre3.patch
@@ -0,0 +1,129 @@
+From 9f635788da50eb1285cae5c8d787b12bda01ae4d Mon Sep 17 00:00:00 2001
+From: Daiki Ueno <ueno@gnu.org>
+Date: Wed, 22 Jan 2025 07:45:46 +0900
+Subject: [PATCH] datum, mem, str: add helper functions to steal pointers
+
+This introduces 3 new inline functions, namely _gnutls_steal_datum,
+_gnutls_steal_buffer, and _gnutls_steal_pointer, to return a copy of
+data structure and reset the original pointer. Those would enable to
+return a populated data structure upon success; otherwise free the
+partially filled data structure in a single code path, e.g.,
+
+```c
+  gnutls_datum_t tmp_result = { NULL, 0 };
+
+  // Calculate tmp_result
+  ...
+  if (error)
+    goto cleanup;
+
+  // Propagate tmp_result to *result
+  *result = _gnutls_steal_datum(&tmp_result);
+
+cleanup:
+  _gnutls_free_datum(&tmp_result);
+  return ret;
+```
+
+Signed-off-by: Daiki Ueno <ueno@gnu.org>
+CVE: CVE-2026-42012
+Upstream-Status: Backport [https://gitlab.com/gnutls/gnutls/-/commit/9f635788da50eb1285cae5c8d787b12bda01ae4d]
+
+Signed-off-by: Jakub Szczudlo <jakub.szczudlo@nokia.com>
+---
+ lib/datum.h | 11 +++++++++++
+ lib/mem.h   |  9 +++++++++
+ lib/str.h   | 23 +++++++++++++++--------
+ 3 files changed, 35 insertions(+), 8 deletions(-)
+
+diff --git a/lib/datum.h b/lib/datum.h
+--- a/lib/datum.h
++++ b/lib/datum.h
+@@ -68,4 +68,15 @@ inline static ATTRIBUTE_NONNULL() void _
+ 	dat->size = 0;
+ }
+ 
++inline static ATTRIBUTE_NONNULL() gnutls_datum_t
++	_gnutls_steal_datum(gnutls_datum_t *src)
++{
++	gnutls_datum_t dst = *src;
++
++	src->data = NULL;
++	src->size = 0;
++
++	return dst;
++}
++
+ #endif /* GNUTLS_LIB_DATUM_H */
+diff --git a/lib/mem.h b/lib/mem.h
+--- a/lib/mem.h
++++ b/lib/mem.h
+@@ -33,6 +33,8 @@
+ #include <valgrind/memcheck.h>
+ #endif
+ 
++#include "attribute.h"
++
+ /* These realloc functions will return ptr if size==0, and will free
+  * the ptr if the new allocation failed.
+  */
+@@ -78,4 +80,11 @@ static inline void _gnutls_memory_mark_d
+ #endif
+ }
+ 
++static inline ATTRIBUTE_NONNULL() void *_gnutls_steal_pointer(void **src)
++{
++	void *dst = *src;
++	*src = NULL;
++	return dst;
++}
++
+ #endif /* GNUTLS_LIB_MEM_H */
+diff --git a/lib/str.h b/lib/str.h
+--- a/lib/str.h
++++ b/lib/str.h
+@@ -30,6 +30,7 @@
+ #include "datum.h"
+ #include <c-ctype.h>
+ #include "errors.h"
++#include "attribute.h"
+ 
+ #ifdef HAVE_DCGETTEXT
+ #include "gettext.h"
+@@ -97,6 +98,19 @@ inline static void _gnutls_buffer_reset(
+ 	buf->length = 0;
+ }
+ 
++inline static ATTRIBUTE_NONNULL() gnutls_buffer_st
++	_gnutls_steal_buffer(gnutls_buffer_st *src)
++{
++	gnutls_buffer_st dst = *src;
++
++	src->allocd = NULL;
++	src->data = NULL;
++	src->max_length = 0;
++	src->length = 0;
++
++	return dst;
++}
++
+ int _gnutls_buffer_resize(gnutls_buffer_st *, size_t new_size);
+ 
+ int _gnutls_buffer_append_str(gnutls_buffer_st *, const char *str);
+@@ -161,15 +175,8 @@ int _gnutls_buffer_append_escape(gnutls_
+ 				 size_t data_size, const char *invalid_chars);
+ int _gnutls_buffer_unescape(gnutls_buffer_st *dest);
+ 
+-#ifndef __attribute__
+-/* This feature is available in gcc versions 2.5 and later.  */
+-#if __GNUC__ < 2 || (__GNUC__ == 2 && __GNUC_MINOR__ < 5)
+-#define __attribute__(Spec) /* empty */
+-#endif
+-#endif
+-
+ int _gnutls_buffer_append_printf(gnutls_buffer_st *dest, const char *fmt, ...)
+-	__attribute__((format(printf, 2, 3)));
++	ATTRIBUTE_FORMAT((printf, 2, 3));
+ 
+ void _gnutls_buffer_hexprint(gnutls_buffer_st *str, const void *data,
+ 			     size_t len);
diff --git a/meta/recipes-support/gnutls/gnutls/CVE-2026-42012.patch b/meta/recipes-support/gnutls/gnutls/CVE-2026-42012.patch
new file mode 100644
index 00000000000..1f43efc1222
--- /dev/null
+++ b/meta/recipes-support/gnutls/gnutls/CVE-2026-42012.patch
@@ -0,0 +1,48 @@
+From 8dcc6a1f48945997666ac9f10896819edd01a03b Mon Sep 17 00:00:00 2001
+From: Alexander Sosedkin <asosedkin@redhat.com>
+Date: Fri, 13 Mar 2026 17:02:07 +0100
+Subject: [PATCH] x509/hostname-verify: make URI/SRV SAN preclude CN fallback
+
+URI/SRV SAN did not suppress CN fallback as required by RFC 6125 6.4.4:
+> a client MUST NOT seek a match for a reference identifier of CN-ID
+> if the presented identifiers include a DNS-ID, *SRV-ID*, *URI-ID*,
+> or any application-specific identifier types supported by the client.
+
+With this change, certificates containing URI or SRV SAN
+no longer pass DNS hostname checks via CN fallback
+to avoid potential misuse of such certificates
+beyond their original purpose.
+
+Reported-by: Oleh Konko <security@1seal.org>
+Fixes: #1802
+Fixes: CVE-2026-42012
+Fixes: GNUTLS-SA-2026-04-29-7
+CVSS: 6.5 Medium CVSS:3.1/AV:N/AC:H/PR:N/UI:N/S:U/C:L/I:H/A:N
+Signed-off-by: Alexander Sosedkin <asosedkin@redhat.com>
+CVE: CVE-2026-42012
+Upstream-Status: Backport [https://gitlab.com/gnutls/gnutls/-/commit/8dcc6a1f48945997666ac9f10896819edd01a03b]
+
+Signed-off-by: Jakub Szczudlo <jakub.szczudlo@nokia.com>
+---
+ lib/x509/hostname-verify.c | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/lib/x509/hostname-verify.c b/lib/x509/hostname-verify.c
+index e7597ad3b0..d989bb1abc 100644
+--- a/lib/x509/hostname-verify.c
++++ b/lib/x509/hostname-verify.c
+@@ -108,8 +108,9 @@ unsigned gnutls_x509_crt_check_ip(gnutls_x509_crt_t cert,
+  * that we do not fallback to CN-ID if we encounter a supported name
+  * type.
+  */
+-#define PRECLUDES_CN_FALLBACK(san) \
+-	(san == GNUTLS_SAN_DNSNAME || san == GNUTLS_SAN_IPADDRESS)
++#define PRECLUDES_CN_FALLBACK(san)                                   \
++	(san == GNUTLS_SAN_DNSNAME || san == GNUTLS_SAN_IPADDRESS || \
++	 san == GNUTLS_SAN_URI || san == GNUTLS_SAN_OTHERNAME_SRV)
+ 
+ /**
+  * gnutls_x509_crt_check_hostname2:
+-- 
+GitLab
+
diff --git a/meta/recipes-support/gnutls/gnutls_3.8.4.bb b/meta/recipes-support/gnutls/gnutls_3.8.4.bb
index 641289be134..646cc350d9d 100644
--- a/meta/recipes-support/gnutls/gnutls_3.8.4.bb
+++ b/meta/recipes-support/gnutls/gnutls_3.8.4.bb
@@ -52,6 +52,10 @@ SRC_URI = "https://www.gnupg.org/ftp/gcrypt/gnutls/v${SHRT_VER}/gnutls-${PV}.tar
            file://CVE-2026-33846.patch \
            file://CVE-2026-33845.patch \
            file://CVE-2026-5419.patch \
+           file://CVE-2026-42012-pre1.patch \
+           file://CVE-2026-42012-pre2.patch \
+           file://CVE-2026-42012-pre3.patch \
+           file://CVE-2026-42012.patch \
            "
 
 SRC_URI[sha256sum] = "2bea4e154794f3f00180fa2a5c51fe8b005ac7a31cd58bd44cdfa7f36ebc3a9b"

