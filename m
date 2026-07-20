Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAF70C4452D
	for <webhook@archiver.kernel.org>; Mon, 20 Jul 2026 11:41:18 +0000 (UTC)
Received: from rcdn-iport-1.cisco.com (rcdn-iport-1.cisco.com [173.37.86.72])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6974.1784547672722101030
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Jul 2026 04:41:12 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=S0Oz2Y4Y;
 spf=pass (domain: cisco.com, ip: 173.37.86.72, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=8482; q=dns/txt;
  s=iport01; t=1784547672; x=1785757272;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=EvQIfegro0tB3jkxMJ2mOnq+A+7wk838YvRWsQV5Ju0=;
  b=S0Oz2Y4YSBFcyIqAsgSqssuRp0lO+X4wPePV8Wy75NTyqA6KlWCweU0v
   E5t2dS7jnSJJtL60fKoDGbWx8xUvT1KJWmMrAFxzwYvX20M+uJ1jY+WWB
   ExPbx724PXVn8bFO2NtuV7yt8sElD3TAvgq+6TzuDOTFM64H9FqNxtRS6
   37mTMEa0AK2Bu4iRgb2wxM5EXaJXYFLT3Xv96r7hhwb2wLwqDv9dv3SCw
   VcRzK4sa577ynzt0/9D0SL1yCm6ccRAiUoaSw7/FT5hvfvJptAWv/rPRB
   rk+3HLtomzQfiRXuB1bFym/VctPxbIi6PotECL0wsR3pi9qIReYLB/xmn
   w==;
X-CSE-ConnectionGUID: 7ojaBCZrR0OGEzJfkkq3fA==
X-CSE-MsgGUID: ar8hbBIPRamxAfZujZXVrA==
X-IPAS-Result: =?us-ascii?q?A0AaAADXCF5q/5L/Ja1aHAEBAQEBAQcBARIBAQQEAQGBf?=
 =?us-ascii?q?AcBAQsBglZ0X0JJA4xvhzeCIQOeG4F+DwEBAQ9EDQQBAYUFAo1TAiY0CQ4BA?=
 =?us-ascii?q?gQDAgMBAQEBAQEBAQEBAQsBAQUBAQECAQcFgQ4Thk8NhloBAgEDMgEYAT0cA?=
 =?us-ascii?q?wECLysjCBEIgwIBgnQDEbxrgiyBAYMoATEFCQJDUNsuAQsUAYE4AYU+iCBcG?=
 =?us-ascii?q?AGEfCcbG4FygRWDaYEFgVwBgUmGXQSCIoEMgVoej25IgR4DWSwBVRMNCgsHB?=
 =?us-ascii?q?YFmAzUSKhVuMh2BIz4XgQwbBwWBHYE6gQKEdCMfAzl/gS91SnctahIXgSaCE?=
 =?us-ascii?q?gKBOwIHAwsYDUgRLDcUGQQ+bgeNPCOBTXACAVgiEwEbDwEETDVnQAoEAxOTU?=
 =?us-ascii?q?5F8oRIKKIN1jCGVOhozqmyZCI4KllCEaYFoPIFHCwdwFYMiCUoZD444g2uBf?=
 =?us-ascii?q?4MUgT3EAzw1AgkDLwEBBwIHDgMLgWiQAAImAgVvYAEB?=
IronPort-Data: A9a23:S16Yp62PJTsJjy6vZ/bD5YJwkn2cJEfYwER7XKvMYLTBsI5bpz0Gz
 2EZWW6POq6OMWXzfo0jaYjg/BgGvZKEm9ZjTANs3Hw8FHgiRegpqji6wuYcGwvIc6UvmWo+t
 512huHodZ5yFjmH4E/xbtANlFEkvYmQXL3wFeXYDS54QA5gWU8JhAlq8wIDqtYAbeORXUXX5
 Lsen+WFYAX7g2EuajpJg06+gEoHUMra6WtwUmMWPZinjHeG/1EJAZQWI72GLneQauF8Au6gS
 u/f+6qy92Xf8g1FIovNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ajs7XAMEhhXJ/0F1lqTzeJ
 OJl7vRcQS9xVkHFdX90vxNwS0mSNoUekFPLzOTWXcG7lyX7n3XQL/pGU0Y0NKczyPxNWUZh2
 O46JjMOd0uNrrfjqF67YrEEasULNsLnOsYb/3pn1zycVadgSpHYSKKM7thdtNsyrpkRRrCFO
 IxDNGcpNUieC/FMEg9/5JYWkOqlnHDjczpwo1OOrq1x6G/WpOB0+OW0aoaLJofTG625mG6Rv
 DLG9U7YOisTMcy2xwiY8ECcuPXmyHaTtIU6UefQGuRRqFqLy2oeDRcbWVe2rbyyjVSzc9ZeM
 FAPvC02oK4/8UamQtXwU1u/unHsg/IHc8BbH+t/7ESGzbDZpl7IQGMFVTVGLtchsafaWAAX6
 7NApPuxbRQHjVFfYSv1Gmu8xd9qBRUoEA==
IronPort-HdrOrdr: A9a23:TT+iIqglJnBKjBpp8m6YkPeianBQXvYji2hC6mlwRA09TyX+rb
 HLoB1173HJYVoqNU3I3OrwW5VoIkmskKKdn7NxAV7KZmCP0wGVxcNZnOnfKlbbdBEWmNQw6U
 4ZSchDIey1K0RmhsDn5wT9OdMhzN6btJ2Mv47lvhBQpcUAUdAY0++/YTzrdHFLeA==
X-Talos-CUID: 9a23:OeijO29DCwouSVMGLAuVvxETGMkPWU/H9i/3DGKqK2hqS6TOR3bFrQ==
X-Talos-MUID: 9a23:u0atIAULetEHahDq/Db21DFoHuZQ2a2rGGkDo4gEifm6LwUlbg==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,174,1779148800"; 
   d="scan'208";a="512464316"
Received: from rcdn-l-core-09.cisco.com ([173.37.255.146])
  by rcdn-iport-1.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 20 Jul 2026 11:41:11 +0000
Received: from bgl-ads-3413.cisco.com (bgl-ads-3413.cisco.com [173.39.60.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-09.cisco.com (Postfix) with ESMTPS id 61C0018000238
	for <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2026 11:41:11 +0000 (GMT)
Received: by bgl-ads-3413.cisco.com (Postfix, from userid 1795984)
	id 789DDCC037D; Mon, 20 Jul 2026 17:11:09 +0530 (IST)
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)" <deeratho@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose][PATCH v2 1/2] gnutls: Fix CVE-2026-3832
Date: Mon, 20 Jul 2026 17:10:45 +0530
Message-Id: <20260720114046.2487998-1-deeratho@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260720110548.2458865-1-deeratho@cisco.com>
References: <20260720110548.2458865-1-deeratho@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;bgl-ads-3413.cisco.com [173.39.60.50];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 173.39.60.50, bgl-ads-3413.cisco.com
X-Outbound-Node: rcdn-l-core-09.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2026 11:41:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241371

From: Deepak Rathore <deeratho@cisco.com>

This patch applies the upstream fix [1] and test coverage [2], as
referenced in [3], to address multi-record OCSP response handling where
GnuTLS could check revocation status from the wrong OCSP entry.

[1] https://gitlab.com/gnutls/gnutls/-/commit/731861b9de8dccaf7d3b0c1446833051e48670c2
[2] https://gitlab.com/gnutls/gnutls/-/commit/d52d5f4f383e8c5d8e9a03334f2421ff35d37d2e
[3] https://security-tracker.debian.org/tracker/CVE-2026-3832

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2026-3832

Signed-off-by: Deepak Rathore <deeratho@cisco.com>
---
- Changes from v1 to v2: Refresh the patch on top of the latest wrynose
branch merged commit.
 .../gnutls/gnutls/CVE-2026-3832_p1.patch      |  52 ++++++++
 .../gnutls/gnutls/CVE-2026-3832_p2.patch      | 114 ++++++++++++++++++
 meta/recipes-support/gnutls/gnutls_3.8.12.bb  |   2 +
 3 files changed, 168 insertions(+)
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2026-3832_p1.patch
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2026-3832_p2.patch

diff --git a/meta/recipes-support/gnutls/gnutls/CVE-2026-3832_p1.patch b/meta/recipes-support/gnutls/gnutls/CVE-2026-3832_p1.patch
new file mode 100644
index 0000000000..3786c578b9
--- /dev/null
+++ b/meta/recipes-support/gnutls/gnutls/CVE-2026-3832_p1.patch
@@ -0,0 +1,52 @@
+From 141c9b6015fc56cd05db3a853f08d03fcbd9b0f4 Mon Sep 17 00:00:00 2001
+From: Alexander Sosedkin <asosedkin@redhat.com>
+Date: Thu, 12 Mar 2026 09:48:57 +0100
+Subject: [PATCH] cert-session: fix multi-entry OCSP revocation bypass
+
+In check_ocsp_response(), the code first searched
+for the SingleResponse that matches the certificate being validated.
+But later, the status was retrieved from entry 0 unconditionally,
+rather than from the matched resp_indx.
+As a result, if entry 0 corresponded to a different certificate and was good,
+while the matched entry for the peer certificate is revoked,
+the revocation check could've mistakenly accept the certificate.
+
+Reported-by: Oleh Konko (1seal) <security@1seal.org>
+Reported-by: Joshua Rogers of AISLE Research Team <joshua@joshua.hu>
+Fixes: #1801
+Fixes: #1812
+Fixes: CVE-2026-3832
+Fixes: GNUTLS-SA-2026-04-29-12
+CVSS: 3.7 Low CVSS:3.1/AV:N/AC:H/PR:N/UI:N/S:U/C:L/I:N/A:N
+Introduced-in: ae404fe8488dee424876b5963c00d7e041672415 3.8.9
+
+CVE: CVE-2026-3832
+Upstream-Status: Backport [https://gitlab.com/gnutls/gnutls/-/commit/731861b9de8dccaf7d3b0c1446833051e48670c2]
+
+Signed-off-by: Alexander Sosedkin <asosedkin@redhat.com>
+(cherry picked from commit 731861b9de8dccaf7d3b0c1446833051e48670c2)
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
+---
+ lib/cert-session.c | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/lib/cert-session.c b/lib/cert-session.c
+index 963f797ee..f48c7a1fb 100644
+--- a/lib/cert-session.c
++++ b/lib/cert-session.c
+@@ -343,9 +343,9 @@ static int check_ocsp_response(gnutls_session_t session, gnutls_x509_crt_t cert,
+ 		goto cleanup;
+ 	}
+ 
+-	ret = gnutls_ocsp_resp_get_single(resp, 0, NULL, NULL, NULL, NULL,
+-					  &cert_status, &vtime, &ntime, &rtime,
+-					  NULL);
++	ret = gnutls_ocsp_resp_get_single(resp, resp_indx, NULL, NULL, NULL,
++					  NULL, &cert_status, &vtime, &ntime,
++					  &rtime, NULL);
+ 	if (ret < 0) {
+ 		_gnutls_audit_log(
+ 			session,
+-- 
+2.51.0
+
diff --git a/meta/recipes-support/gnutls/gnutls/CVE-2026-3832_p2.patch b/meta/recipes-support/gnutls/gnutls/CVE-2026-3832_p2.patch
new file mode 100644
index 0000000000..54ea38fe69
--- /dev/null
+++ b/meta/recipes-support/gnutls/gnutls/CVE-2026-3832_p2.patch
@@ -0,0 +1,114 @@
+From ac357f76abeaf59429bc15b8764ad01920df0ef1 Mon Sep 17 00:00:00 2001
+From: Alexander Sosedkin <asosedkin@redhat.com>
+Date: Thu, 12 Mar 2026 15:25:24 +0100
+Subject: [PATCH] tests/ocsp-tests/ocsp-must-staple-connection: test
+ CVE-2026-3832
+
+CVE: CVE-2026-3832
+Upstream-Status: Backport [https://gitlab.com/gnutls/gnutls/-/commit/d52d5f4f383e8c5d8e9a03334f2421ff35d37d2e]
+
+Signed-off-by: Alexander Sosedkin <asosedkin@redhat.com>
+(cherry picked from commit d52d5f4f383e8c5d8e9a03334f2421ff35d37d2e)
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
+---
+ .../ocsp-tests/ocsp-must-staple-connection.sh | 70 +++++++++++++++++++
+ 1 file changed, 70 insertions(+)
+
+diff --git a/tests/ocsp-tests/ocsp-must-staple-connection.sh b/tests/ocsp-tests/ocsp-must-staple-connection.sh
+index 94d41ce24..5e100b9d9 100755
+--- a/tests/ocsp-tests/ocsp-must-staple-connection.sh
++++ b/tests/ocsp-tests/ocsp-must-staple-connection.sh
+@@ -85,6 +85,7 @@ OCSP_RESPONSE_FILE="$testdir/ms-resp.tmp"
+ OCSP_REQ_FILE="$testdir/ms-req.tmp"
+ INDEXFILE="$testdir/ocsp_index.txt"
+ ATTRFILE="${INDEXFILE}.attr"
++SERVER_CERT_BAD_FILE="$testdir/ms-cert-bad.pem.tmp"
+ 
+ stop_servers ()
+ {
+@@ -118,6 +119,20 @@ ${CERTTOOL} \
+ 	--load-privkey "${srcdir}/ocsp-tests/certs/server_good.key" \
+ 	--template "${TEMPLATE_FILE}" --outfile "${SERVER_CERT_FILE}" 2>/dev/null
+ 
++echo "=== Generating bad server certificate ==="
++
++rm -f "$TEMPLATE_FILE"
++cp "${srcdir}/ocsp-tests/certs/server_bad.template" "$TEMPLATE_FILE"
++chmod u+w "$TEMPLATE_FILE"
++echo "ocsp_uri=http://localhost:${OCSP_PORT}/ocsp/" >>"$TEMPLATE_FILE"
++
++${CERTTOOL} \
++	--attime "${CERTDATE}" \
++	--generate-certificate --load-ca-privkey "${srcdir}/ocsp-tests/certs/ca.key" \
++	--load-ca-certificate "${srcdir}/ocsp-tests/certs/ca.pem" \
++	--load-privkey "${srcdir}/ocsp-tests/certs/server_bad.key" \
++	--template "${TEMPLATE_FILE}" --outfile "${SERVER_CERT_BAD_FILE}" 2>/dev/null
++
+ echo "=== Bringing OCSP server up ==="
+ 
+ cp "${srcdir}/ocsp-tests/certs/ocsp_index.txt" ${INDEXFILE}
+@@ -486,6 +501,61 @@ kill "${TLS_SERVER_PID}"
+ wait "${TLS_SERVER_PID}"
+ unset TLS_SERVER_PID
+ 
++echo "=== Test 10: Server with revoked certificate - CVE-2026-3832 ==="
++
++# The revocation status was always mistakenly checked for the first cert.
++# Check a pair of responses: (irrelevant good unrevoked, relevant bad revoked).
++
++rm -f "${OCSP_RESPONSE_FILE}"
++
++"$FAKETIME" "${TESTDATE}" \
++    ${OPENSSL} ocsp -index "${INDEXFILE}" \
++    -issuer "${srcdir}/ocsp-tests/certs/ca.pem" \
++    -CA "${srcdir}/ocsp-tests/certs/ca.pem" \
++    -rsigner "${srcdir}/ocsp-tests/certs/ocsp-server.pem" \
++    -rkey "${srcdir}/ocsp-tests/certs/ocsp-server.key" \
++    -cert "${SERVER_CERT_FILE}" \
++    -cert "${SERVER_CERT_BAD_FILE}" \
++    -respout "${OCSP_RESPONSE_FILE}"
++
++eval "${GETPORT}"
++# Port for gnutls-serv
++TLS_SERVER_PORT=$PORT
++PORT=${TLS_SERVER_PORT}
++launch_bare_server \
++    "${SERV}" --attime "${TESTDATE}" --echo --disable-client-cert \
++    --x509keyfile="${srcdir}/ocsp-tests/certs/server_bad.key" \
++    --x509certfile="${SERVER_CERT_BAD_FILE}" \
++    --port="${TLS_SERVER_PORT}" \
++    --ocsp-response="${OCSP_RESPONSE_FILE}" --ignore-ocsp-response-errors
++TLS_SERVER_PID="${!}"
++wait_server $TLS_SERVER_PID
++
++wait_for_port "${TLS_SERVER_PORT}"
++
++out=$(
++    echo "test 123456" | \
++        "${CLI}" -d1 --attime "${TESTDATE}" --ocsp \
++        --x509cafile "${srcdir}/ocsp-tests/certs/ca.pem" \
++        --port "${TLS_SERVER_PORT}" localhost \
++        2>&1
++    rc=$?
++)
++printf '%s\n' "$out"
++
++if test "${rc}" = "0"; then
++    echo 'ERROR: client accepted a revoked leaf (CVE-2026-3832)'
++    exit 1
++fi
++if ! echo "${out}" | grep "The certificate was revoked via OCSP" >/dev/null
++then
++    echo '"The certificate was revoked via OCSP" not found in output'
++    exit 1
++fi
++
++kill "${TLS_SERVER_PID}"
++wait "${TLS_SERVER_PID}"
++unset TLS_SERVER_PID
+ 
+ kill ${OCSP_PID}
+ wait ${OCSP_PID}
+-- 
+2.51.0
+
diff --git a/meta/recipes-support/gnutls/gnutls_3.8.12.bb b/meta/recipes-support/gnutls/gnutls_3.8.12.bb
index b92470768c..03eee5c50e 100644
--- a/meta/recipes-support/gnutls/gnutls_3.8.12.bb
+++ b/meta/recipes-support/gnutls/gnutls_3.8.12.bb
@@ -32,6 +32,8 @@ SRC_URI = "https://www.gnupg.org/ftp/gcrypt/gnutls/v${SHRT_VER}/gnutls-${PV}.tar
            file://0006-buffers-match-DTLS-datagrams-by-sequence-number.patch \
            file://0007-tests-mini-dtls-fragments-1839-mismatching-message_s.patch \
            file://0008-tests-mini-dtls-framents-link-to-gnulib.patch \
+           file://CVE-2026-3832_p1.patch \
+           file://CVE-2026-3832_p2.patch \
            "
 
 SRC_URI[sha256sum] = "a7b341421bfd459acf7a374ca4af3b9e06608dcd7bd792b2bf470bea012b8e51"
-- 
2.35.6

