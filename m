Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A7A0C531C9
	for <webhook@archiver.kernel.org>; Wed, 22 Jul 2026 17:24:10 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5463.1784741045686506217
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jul 2026 10:24:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=KgJgIZMP;
 spf=pass (domain: smile.fr, ip: 209.85.128.49, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-49548aebcd8so38904215e9.3
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 10:24:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1784741044; x=1785345844; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=hkReuRC1N4+X0sunsm+8dJxzMC36TKs2HtimOp1MD+g=;
        b=KgJgIZMPn21qlsiE8IdvmeSSHu+wj5PKT4EVi/KAymvoYMfkX51Mu5XWaRuW+i9DcP
         9fH//grhzNs1bijUSHu7JmBNjOppPgW2srrs8CW4+i07Pf+y+fl7Jv6j5ijB9ZUFtkMG
         dX79uXPhpSv11h7cX362OmEalo4esPKJ95XU0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784741044; x=1785345844;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=hkReuRC1N4+X0sunsm+8dJxzMC36TKs2HtimOp1MD+g=;
        b=RGcefCsCIB5rFKcBb9TUwMefCtIypVY4lZBKT+yhgsH1M53drf9uJtjGMPlkC4j1Fn
         CSXAEXCh9KaoZouJFeuJahWhezpKUK4k3pd/lZUxsHi5LEuu/s6V2ntyAkqLqjkWca/9
         Urz/VnrWN8QZ3EIn1e/DNMhNjiN7fwvfjmGB2cwSRn4ZlhBsGWLJMTN68MDhkccgAYRU
         I5cTMgh78NxoJlV12pDAtAxEHYlU3SVdrl26CSFtpD+YMUgO2X3rRqKIzTsV8FW/kfNc
         R5ZEwOlwR3zoDmVACIoTxY7abj00UUmV6+zX9yobVsE6WgkjovNCezhejCiq5KBlskdB
         wZHA==
X-Gm-Message-State: AOJu0YwvCcOtv4DMqGzRamvromoC8zcXTCIisfI+TWIfTFejFy4hax/L
	FDAzgJJX6yLvGRDt0ocdB5Ha3Th++5g/tHDux8du3RFi3FCvPMhz/tN8mPOllOrQXNQdnSsHY2Q
	LueiXRyM=
X-Gm-Gg: AR+sD12Da4Vvp5KW9/e3Lj4kZaf+XdM91E0d5cIl9bAm/KjpHIFcGdQFhxvNJIQxxXu
	BD4L4TNuan7P+OaKmPiSmJ5TfjdJiI7okosYLw81JyEYhCoszJ/GeUvpFVCU/WAr5z/cbP7G8bn
	aaky5H6mxPfliefclLgnCcubKn7BQ61U6vyy/c0IGEhRKBCEUAapFgOi0z5DCCFTgFnlB3G0Ij3
	WGlgSEzjGKBJhWPN3vQOY+kMQxK1KmNTdQ/KxvkEQwB0JvNozG2EHCbIZHWH9dJ4GQMWUFUMJjx
	AniraIHchjyUtYOrHVexKsqc/jVvQvm+pyTpwZpZtYgofG9dfoBFuFs4c7g4TedQXW39WWaYT4W
	TzA8QXnhCdA1xTqZu+YCOk4pdMpn8yjXlCJHgQTYbu1CCe/dPWom4MAMO+3ChqZFq7ttR9Bkr0V
	8ZMXEBas3VoDAWaw9JqmSv5tDHsubW0pKVwktQ1Yts8NyY05+CmrUnLJQ8dD+DgWfpJ3Byyk9kK
	sQi2lFmd4Uw
X-Received: by 2002:a05:600c:3112:b0:495:472c:208d with SMTP id 5b1f17b1804b1-4954a41307cmr268246435e9.38.1784741043815;
        Wed, 22 Jul 2026 10:24:03 -0700 (PDT)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-495653c8760sm148275275e9.14.2026.07.22.10.24.03
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 10:24:03 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 11/27] gnutls: Fix CVE-2026-3832
Date: Wed, 22 Jul 2026 19:23:24 +0200
Message-ID: <1ca2345a93c623689563fca1b3d4101344222fe2.1784740870.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1784740870.git.yoann.congal@smile.fr>
References: <cover.1784740870.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 17:24:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241721

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
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../gnutls/gnutls/CVE-2026-3832_p1.patch      |  52 ++++++++
 .../gnutls/gnutls/CVE-2026-3832_p2.patch      | 114 ++++++++++++++++++
 meta/recipes-support/gnutls/gnutls_3.8.12.bb  |   2 +
 3 files changed, 168 insertions(+)
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2026-3832_p1.patch
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2026-3832_p2.patch

diff --git a/meta/recipes-support/gnutls/gnutls/CVE-2026-3832_p1.patch b/meta/recipes-support/gnutls/gnutls/CVE-2026-3832_p1.patch
new file mode 100644
index 00000000000..344a1d241a2
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
index 00000000000..4b8288ae54a
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
index b92470768c2..03eee5c50e9 100644
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

