Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3E39CA9EC9
	for <webhook@archiver.kernel.org>; Sun, 11 Oct 2026 08:41:17 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.23439.1791708076542510648
 for <openembedded-core@lists.openembedded.org>;
 Sun, 11 Oct 2026 01:41:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=uYF4YYLf;
 spf=pass (domain: smile.fr, ip: 209.85.221.41, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48c411d6615so542345f8f.3
        for <openembedded-core@lists.openembedded.org>; Sun, 11 Oct 2026 01:41:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1791708075; x=1792312875; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=KvWLtCgLmZHJsK8WRlJvQkKvRp6HcXvE6CMTooHGl/U=;
        b=uYF4YYLfPRMuGQYCwoE/WmX6NJYQaByBr3LAAogZ0f3NAUnQFBig0VwtbtgZsyK81Y
         0H28otr9+FjLwdkKc7dqmbVkkMDP6LoZxlLBk3FCaKXGLRN5k9MIENteGhwL5O3ylb9F
         CqjKzpxUd9mM9o7PmQY9XqKkeNAkKKpu8DnPI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791708075; x=1792312875;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=KvWLtCgLmZHJsK8WRlJvQkKvRp6HcXvE6CMTooHGl/U=;
        b=vjpOF2oYJLup0XL/Bd2EVduaQCyGrMCVk8afj4ssIM3NimTMTja+iPDdYJPfJSoN+d
         93ibSFqIrlpeDQkzHqwKHtgQ904sXYIEs9tncOg73K/NpDwwSF0un2ll3Evg16rmqv6a
         f3/BgcQWeY3TyPNUImyFPUsyRUk4k1LqRIuFWNoZkkkEh+8FOI/qIPh5ddwA0j4iclKM
         jwfOHla7HIZUugGSraLBC+jnXKanpnnPFpF1KOMZITY1Ufi9lHrEsc53ZZHY/v8SVK1x
         8u7EoVNxhrpyHI/hwAVkRPx1/Ic+z2Iv5Xr8FiQWcS33Mj4P4Ng9Hozz4fPX1oA/W+SV
         4RQw==
X-Gm-Message-State: AFq9FYKCEne2FlR0TzYtkvisJn4Qk9LTQhQqCgSRRei3o0NyBM/rJjrD
	GaJ4EDTpqmppa9T7ETQjzS5n58xuLV5Wja8fNUYSFfqkPyG6qJee1FudWk04WRzh5FaZ6J/F61e
	DQ+wwsu0=
X-Gm-Gg: AYBFou2tABHQQS0eB3tCJjoHXhQgsIa6QOtxzx8mNAabc1zKtvupm+WK7x8qQRiv5CJ
	5iu8wBmHzqUG4UvEEsfvW+bwLdy1nkcnlstbWweamvbcd0xaymt6UnLs+jI0JOCengW2VtJ3GEf
	fA+TL0Zi+sL53FtRPIsWCsX+2IDZhBHYe7EDt8QQI2hkHagHEXUKH0C82dikNLTwbBGpZBjRHRZ
	4hzlgrZcwokiXN1bkihMc++1zaJtKbX02ZAgdbskW2wDBkwdPGdiC5hZD+KRPU6R24oDJY4HjOD
	Lx17cg7k9oUSOlbslWng8SOov+yb71TKS04kDlCzUkdUzP3o1dZVBdu7s839mE8q8y400P3IixU
	4BFxLM9xr72RY9kJ/loQgE5TTxK/Br4shprdR04nl4KNOweX6+SKETghrb4vcIFL5xaGe/of29L
	hLo59XNYzKdIxFULuBXZqvkt/2Tyx09PDTgjf7Q77X8u8auc8d9Olpmojc+EXDMlwvy6JM/Yohj
	RjUIczZwCdgvQKM5Lt9Ir12Jvf+GhvxQPKkG7OKlvnH5yGZwcujM5lV7U3pj2G+FOZRCt0PLEtI
	9+xcY4mt
X-Received: by 2002:a05:6000:29c3:b0:48d:c15c:94a5 with SMTP id ffacd0b85a97d-48dc15c964amr5888215f8f.14.1791708074562;
        Sun, 11 Oct 2026 01:41:14 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9acfa28sm13481734f8f.51.2026.10.11.01.41.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 01:41:14 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 22/60] gnutls: fix CVE-2026-42012
Date: Sun, 11 Oct 2026 10:39:55 +0200
Message-ID: <46a5bd5e5e1c08791cfaf36d3a7f1df5dfcf4028.1791707817.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1791707817.git.yoann.congal@smile.fr>
References: <cover.1791707817.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 11 Oct 2026 08:41:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247531

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
---
 .../gnutls/gnutls/CVE-2026-42012-pre1.patch   |  69 ++++++++
 .../gnutls/gnutls/CVE-2026-42012-pre2.patch   | 161 ++++++++++++++++++
 .../gnutls/gnutls/CVE-2026-42012.patch        |  48 ++++++
 meta/recipes-support/gnutls/gnutls_3.8.12.bb  |   3 +
 4 files changed, 281 insertions(+)
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2026-42012-pre1.patch
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2026-42012-pre2.patch
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
index 00000000000..30ed2252c24
--- /dev/null
+++ b/meta/recipes-support/gnutls/gnutls/CVE-2026-42012-pre2.patch
@@ -0,0 +1,161 @@
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
+- virt-san.c: use _gnutls_steal_datum instead of upstream _gnutls_take_datum
+  (3.8.12 already provides steal_datum; take_datum is added later).
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
+@@ -2698,6 +2698,7 @@ void gnutls_psk_set_server_params_functi
+  * @GNUTLS_SAN_OTHERNAME_XMPP: Virtual SAN, used by certain functions for convenience.
+  * @GNUTLS_SAN_OTHERNAME_KRB5PRINCIPAL: Virtual SAN, used by certain functions for convenience.
+  * @GNUTLS_SAN_OTHERNAME_MSUSERPRINCIPAL: Virtual SAN, used by certain functions for convenience.
++ * @GNUTLS_SAN_OTHERNAME_SRV: Virtual SAN, used by certain functions for convenience.
+  *
+  * Enumeration of different subject alternative names types.
+  */
+@@ -2715,7 +2716,8 @@ typedef enum gnutls_x509_subject_alt_nam
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
+@@ -1562,7 +1562,8 @@ inline static int is_type_printable(int
+ {
+ 	if (type == GNUTLS_SAN_DNSNAME || type == GNUTLS_SAN_RFC822NAME ||
+ 	    type == GNUTLS_SAN_URI || type == GNUTLS_SAN_OTHERNAME_XMPP ||
+-	    type == GNUTLS_SAN_OTHERNAME || type == GNUTLS_SAN_REGISTERED_ID)
++	    type == GNUTLS_SAN_OTHERNAME_SRV || type == GNUTLS_SAN_OTHERNAME ||
++	    type == GNUTLS_SAN_REGISTERED_ID)
+ 		return 1;
+ 	else
+ 		return 0;
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
diff --git a/meta/recipes-support/gnutls/gnutls_3.8.12.bb b/meta/recipes-support/gnutls/gnutls_3.8.12.bb
index 92854eeaf9c..fd332ee8c55 100644
--- a/meta/recipes-support/gnutls/gnutls_3.8.12.bb
+++ b/meta/recipes-support/gnutls/gnutls_3.8.12.bb
@@ -42,6 +42,9 @@ SRC_URI = "https://www.gnupg.org/ftp/gcrypt/gnutls/v${SHRT_VER}/gnutls-${PV}.tar
            file://CVE-2026-42010.patch \
            file://CVE-2026-33845.patch \
            file://CVE-2026-5419.patch \
+           file://CVE-2026-42012-pre1.patch \
+           file://CVE-2026-42012-pre2.patch \
+           file://CVE-2026-42012.patch \
            "
 
 SRC_URI[sha256sum] = "a7b341421bfd459acf7a374ca4af3b9e06608dcd7bd792b2bf470bea012b8e51"

