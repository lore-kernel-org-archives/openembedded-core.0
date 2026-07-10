Return-Path: <sudumbha@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70B35C44501
	for <webhook@archiver.kernel.org>; Fri, 10 Jul 2026 09:54:18 +0000 (UTC)
Received: from rcdn-iport-4.cisco.com (rcdn-iport-4.cisco.com [173.37.86.75])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9215.1783677248150512529
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Jul 2026 02:54:08 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=Kkj9qw1l;
 spf=pass (domain: cisco.com, ip: 173.37.86.75, mailfrom: sudumbha@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=8308; q=dns/txt;
  s=iport01; t=1783677248; x=1784886848;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=IC4n6+KgtEYFEtYBoq7Ocvf2qyKPn99RWINhyHXrOmI=;
  b=Kkj9qw1lpNAnypWo3cNb+wzo3y8uwFulQrsIVKOwbLFbrODS0wNpWNWX
   9ptmQHGZ7gb9sG8vEtVTHkO1NbezReed7H/tJtfSn9kSwahD1XZMwvOcO
   CtoFiVWW+B/kXx1uxQx3gwXgpW0XU8gMUFQfCAjpt7ZI3zVQY7ReI/yOx
   I6I2xo3FniuH5CxGuOng+IGi4iGhZaGmlQEB1SAW6QNHljPP8a0chKFYW
   LBuMEDG0KzGLPhcx2ycbU2vE+CqIR73/gWbxLuDdI0cf/c+vn+1yhtDIS
   1AKnaIkvoovWdTbesH1dJ6B2ImZEsXKIG1Zq4qy39h/oZJLc7Xx7mRZqs
   Q==;
X-CSE-ConnectionGUID: +n01qieKSIO857jwmqbwqg==
X-CSE-MsgGUID: 1lMdCr7lTZuSyuUw3SGXzA==
X-IPAS-Result: =?us-ascii?q?A0BDAgDFwFBq/4//Ja1aglmCV3RfQkkDlCaCIZ4egX4PA?=
 =?us-ascii?q?QEBD0QNBAEBklQCJjQJDgECBAMCAwEBAQEBAQEBAQEBCwEBBQEBAQIBBwWBD?=
 =?us-ascii?q?hOGTw2GWgE4ARgBWQMBAlojIYMCAYJzAgERulqCLIEBgygBMQUJAkNQ2y4BC?=
 =?us-ascii?q?xQBgTiFP4gfWxgBhHwnGxuBcoEVg2mBBYFcAYFJhl0EgiKBDIFaHo93SIEeA?=
 =?us-ascii?q?1ksAVUTDQoLBwWBZgM1EioVbjIdgSM+F4EMGwcFgR2BWYEChHkjHwM5f4Ewd?=
 =?us-ascii?q?Up5LYEBEh4KgVKCFgJVAwsYDUgRLDcUGwQ+bgeNRRcPgUxwAgFYIhMBGw8BB?=
 =?us-ascii?q?IFoQAoEAxOTU5F/oQ8KKIN1jCGVOhozqmyZCI4KllCEaYFoPIFHCwdwFYMiC?=
 =?us-ascii?q?UoZD444g2uBf4MUgT3ICiQ1AgkDLwEBBwIHDgMLgWiQAAImAgVvYAEB?=
IronPort-Data: A9a23:gwkk06g0uKg+EjGrhY3L5uNIX161MREKZh0ujC45NGQN5FlHY01je
 htvWmDVa/uOZWLweI1+PITn9EgCsMKGxt5hQFA5rCg3Fn9jpJueD7x1DKtf0wB+jyHnZBg6h
 ynLQoCYdKjYdleF+FH1dOOn9SUgvU2xbuKUIPbePSxsThNTRi4kiBZy88Y0mYcAbeKRW2thg
 vus5ZeCULOZ82QsaDxMtPrT8EoHUMna4Vv0gHRvPZing3eG/5UlJMp3Db28KXL+Xr5VEoaSL
 87fzKu093/u5BwkDNWoiN7TKiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JAAatjsAhlqvgqo
 Dl7WTNcfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQqflO0q8iCAn3aMqVb/L4uGGBD1
 sc5D2BQMRKcgvu836u0H7wEasQLdKEHPasFsX1miDWcBvE8TNWbHePB5MRT23E7gcUm8fT2P
 pVCL2EwKk6dPlsWZgx/5JEWxI9EglHkbjFFrViVrII84nPYy0p6172F3N/9J4TVGp4OzhbFz
 o7A1z39Jx0xLoOb9QiYyWOxu/CUpgzLSqtHQdVU8dYv2jV/3Fc7DwUbU1a+q/S1hkOyHtlYM
 UE8/is1sbN081SmSNT4VRC0rHOI+BkGVLJt//YS8gqBzO/Qpg2eHGVBFmAHY909v8hwTjsvv
 rOUo+7U6fVUmOX9YRqgGn2891te5QB9wbc+WBI5
IronPort-HdrOrdr: A9a23:W6+IxaEKdPTGhwkSpLqE2MeALOsnbusQ8zAXPidKOH5om6Oj+f
 xG8M536faWskdzZJhDo7G90cC7KBu2n6KdirN/AV7NZmXbUROTTL1K3M/F3yDqHTH4+6p20K
 dtdLU7NfjLZGIK6PoTJGKDYrEdKB7tytHNudvj
X-Talos-CUID: 9a23:r6nhDm66zaXVjXbujtsst0hMQ9kkf17m7VCAfhC6FmNwQqKMRgrF
X-Talos-MUID: 9a23:qLNmZggoRsCKCT89Fi8qnsMpbcNN74+0V0Qxo4g9qtS5KndLFAePpWHi
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,154,1779148800"; 
   d="scan'208";a="507733885"
Received: from rcdn-l-core-06.cisco.com ([173.37.255.143])
  by rcdn-iport-4.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 10 Jul 2026 09:54:07 +0000
Received: from sjc-ads-12007.cisco.com (sjc-ads-12007.cisco.com [171.70.97.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-06.cisco.com (Postfix) with ESMTPS id 014BE1800025B
	for <openembedded-core@lists.openembedded.org>; Fri, 10 Jul 2026 09:54:07 +0000 (GMT)
Received: by sjc-ads-12007.cisco.com (Postfix, from userid 1840713)
	id 50CB6CAF087; Fri, 10 Jul 2026 02:54:06 -0700 (PDT)
From: "Sudhir Dumbhare -X (sudumbha - E INFOCHIPS PRIVATE LIMITED at Cisco)" <sudumbha@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose][PATCH 1/2] gnutls: Fix CVE-2026-3832
Date: Fri, 10 Jul 2026 02:53:55 -0700
Message-ID: <20260710095356.3039570-1-sudumbha@cisco.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;sjc-ads-12007.cisco.com [171.70.97.7];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.70.97.7, sjc-ads-12007.cisco.com
X-Outbound-Node: rcdn-l-core-06.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Jul 2026 09:54:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240625

From: Sudhir Dumbhare <sudumbha@cisco.com>

This patch applies the upstream fix [1] and test coverage [2], as referenced in [3],
to address an OCSP multi-record response flaw where GnuTLS could check the status
from the wrong response entry and incorrectly accept a revoked server certificate.

[1] https://gitlab.com/gnutls/gnutls/-/commit/731861b9de8dccaf7d3b0c1446833051e48670c2
[2] https://gitlab.com/gnutls/gnutls/-/commit/d52d5f4f383e8c5d8e9a03334f2421ff35d37d2e
[3] https://security-tracker.debian.org/tracker/CVE-2026-3832

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2026-3832

Signed-off-by: Sudhir Dumbhare <sudumbha@cisco.com>
---
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
+Signed-off-by: Sudhir Dumbhare <sudumbha@cisco.com>
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
+Signed-off-by: Sudhir Dumbhare <sudumbha@cisco.com>
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
index 8554ab943d..c6cbc9f46c 100644
--- a/meta/recipes-support/gnutls/gnutls_3.8.12.bb
+++ b/meta/recipes-support/gnutls/gnutls_3.8.12.bb
@@ -24,6 +24,8 @@ SRC_URI = "https://www.gnupg.org/ftp/gcrypt/gnutls/v${SHRT_VER}/gnutls-${PV}.tar
            file://run-ptest \
            file://Add-ptest-support.patch \
            file://c99.patch \
+           file://CVE-2026-3832_p1.patch \
+           file://CVE-2026-3832_p2.patch \
            "
 
 SRC_URI[sha256sum] = "a7b341421bfd459acf7a374ca4af3b9e06608dcd7bd792b2bf470bea012b8e51"
-- 
2.51.0


