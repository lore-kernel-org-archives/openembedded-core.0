Return-Path: <soumya.sambu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 126C0C3DA6F
	for <webhook@archiver.kernel.org>; Fri, 25 Aug 2023 07:42:04 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.8705.1692949317945220848
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Aug 2023 00:41:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=mFG+fVSz;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=76017e5574=soumya.sambu@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 37P4xvtu022631
	for <openembedded-core@lists.openembedded.org>; Fri, 25 Aug 2023 07:41:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=HdlZ7
	7yYXH03eQELuVWJuv8NHI2d5l80elDHq2Pr59E=; b=mFG+fVSzD03a/Fq3SJ4Td
	c2gLH46OoVqDplBAG5KIfly70AdZPEE0D+235FIONrawReLPpertk0UtlhrgoFYv
	3FX2Q2DHa2vM4cfxwuDHx83rvdSTY6s43MqEi1tGiRMuzR7rX2LZjX79zVwI2mAj
	bypcSCotO6rIfA/wdLQx/GY5er6EUmTBLcUePA7rNU1dsl8tQFobGG4PMMVRyWzO
	avtLEhjV5GwiUaLzn+PssHRiamvTtXWQ14yg0wyc5AmQK9xFrzpIU7fAJbAoq7SE
	Qwy6VC85fdrTUpYOzvmy2WU1tWqn4na8aJ+xkKpdUD18Z0vVFTRiCPgHJJ5iHe73
	Q==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3sn21mjxce-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 25 Aug 2023 07:41:56 +0000 (GMT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 25 Aug 2023 00:41:53 -0700
From: ssambu <soumya.sambu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][kirkstone][PATCH 1/1] go: Fix CVE-2023-29409
Date: Fri, 25 Aug 2023 07:41:38 +0000
Message-ID: <20230825074138.1538998-1-soumya.sambu@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (147.11.82.252) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-ORIG-GUID: zyjoVUzrV6e-mYZQelhySxKLAlBGPp1M
X-Proofpoint-GUID: zyjoVUzrV6e-mYZQelhySxKLAlBGPp1M
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-25_05,2023-08-24_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxlogscore=999
 spamscore=0 mlxscore=0 bulkscore=0 adultscore=0 malwarescore=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2308100000 definitions=main-2308250067
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Aug 2023 07:42:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186696

From: Soumya Sambu <soumya.sambu@windriver.com>

Extremely large RSA keys in certificate chains can cause a
client/server to expend significant CPU time verifying
signatures. With fix, the size of RSA keys transmitted
during handshakes is restricted to <= 8192 bits. Based on
a survey of publicly trusted RSA keys, there are currently
only three certificates in circulation with keys larger than
this, and all three appear to be test certificates that are
not actively deployed. It is possible there are larger keys
in use in private PKIs, but we target the web PKI, so causing
breakage here in the interests of increasing the default
safety of users of crypto/tls seems reasonable.

References:
https://nvd.nist.gov/vuln/detail/CVE-2023-29409

Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
---
 meta/recipes-devtools/go/go-1.17.13.inc       |   1 +
 .../go/go-1.19/CVE-2023-29409.patch           | 175 ++++++++++++++++++
 2 files changed, 176 insertions(+)
 create mode 100644 meta/recipes-devtools/go/go-1.19/CVE-2023-29409.patch

diff --git a/meta/recipes-devtools/go/go-1.17.13.inc b/meta/recipes-devtools/go/go-1.17.13.inc
index e0f02f3e28..91dd886cd0 100644
--- a/meta/recipes-devtools/go/go-1.17.13.inc
+++ b/meta/recipes-devtools/go/go-1.17.13.inc
@@ -42,6 +42,7 @@ SRC_URI += "\
     file://CVE-2023-24536_3.patch \
     file://CVE-2023-24531_1.patch \
     file://CVE-2023-24531_2.patch \
+    file://CVE-2023-29409.patch \
 "
 SRC_URI[main.sha256sum] = "a1a48b23afb206f95e7bbaa9b898d965f90826f6f1d1fc0c1d784ada0cd300fd"
 
diff --git a/meta/recipes-devtools/go/go-1.19/CVE-2023-29409.patch b/meta/recipes-devtools/go/go-1.19/CVE-2023-29409.patch
new file mode 100644
index 0000000000..38451f7555
--- /dev/null
+++ b/meta/recipes-devtools/go/go-1.19/CVE-2023-29409.patch
@@ -0,0 +1,175 @@
+From 2300f7ef07718f6be4d8aa8486c7de99836e233f Mon Sep 17 00:00:00 2001
+From: Roland Shoemaker <bracewell@google.com>
+Date: Wed, 23 Aug 2023 12:03:43 +0000
+Subject: [PATCH] crypto/tls: restrict RSA keys in certificates to <= 8192 bits
+
+Extremely large RSA keys in certificate chains can cause a client/server
+to expend significant CPU time verifying signatures. Limit this by
+restricting the size of RSA keys transmitted during handshakes to <=
+8192 bits.
+
+Based on a survey of publicly trusted RSA keys, there are currently only
+three certificates in circulation with keys larger than this, and all
+three appear to be test certificates that are not actively deployed. It
+is possible there are larger keys in use in private PKIs, but we target
+the web PKI, so causing breakage here in the interests of increasing the
+default safety of users of crypto/tls seems reasonable.
+
+Thanks to Mateusz Poliwczak for reporting this issue.
+
+Updates #61460
+Fixes #61579
+Fixes CVE-2023-29409
+
+Change-Id: Ie35038515a649199a36a12fc2c5df3af855dca6c
+Reviewed-on: https://team-review.git.corp.google.com/c/golang/go-private/+/1912161
+Reviewed-by: Damien Neil <dneil@google.com>
+Reviewed-by: Tatiana Bradley <tatianabradley@google.com>
+Run-TryBot: Roland Shoemaker <bracewell@google.com>
+(cherry picked from commit d865c715d92887361e4bd5596e19e513f27781b7)
+Reviewed-on: https://team-review.git.corp.google.com/c/golang/go-private/+/1965487
+Reviewed-on: https://go-review.googlesource.com/c/go/+/514915
+Run-TryBot: David Chase <drchase@google.com>
+Reviewed-by: Matthew Dempsky <mdempsky@google.com>
+TryBot-Bypass: David Chase <drchase@google.com>
+
+CVE: CVE-2023-29409
+
+Upstream-Status: Backport [https://github.com/golang/go/commit/2300f7ef07718f6be4d8aa8486c7de99836e233f]
+
+Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
+---
+ src/crypto/tls/handshake_client.go      |  8 +++
+ src/crypto/tls/handshake_client_test.go | 78 +++++++++++++++++++++++++
+ src/crypto/tls/handshake_server.go      |  4 ++
+ 3 files changed, 90 insertions(+)
+
+diff --git a/src/crypto/tls/handshake_client.go b/src/crypto/tls/handshake_client.go
+index 85622f1..828d2cb 100644
+--- a/src/crypto/tls/handshake_client.go
++++ b/src/crypto/tls/handshake_client.go
+@@ -852,6 +852,10 @@ func (hs *clientHandshakeState) sendFinished(out []byte) error {
+	return nil
+ }
+
++// maxRSAKeySize is the maximum RSA key size in bits that we are willing
++// to verify the signatures of during a TLS handshake.
++const maxRSAKeySize = 8192
++
+ // verifyServerCertificate parses and verifies the provided chain, setting
+ // c.verifiedChains and c.peerCertificates or sending the appropriate alert.
+ func (c *Conn) verifyServerCertificate(certificates [][]byte) error {
+@@ -862,6 +866,10 @@ func (c *Conn) verifyServerCertificate(certificates [][]byte) error {
+			c.sendAlert(alertBadCertificate)
+			return errors.New("tls: failed to parse certificate from server: " + err.Error())
+		}
++		if cert.PublicKeyAlgorithm == x509.RSA && cert.PublicKey.(*rsa.PublicKey).N.BitLen() > maxRSAKeySize {
++			c.sendAlert(alertBadCertificate)
++			return fmt.Errorf("tls: server sent certificate containing RSA key larger than %d bits", maxRSAKeySize)
++		}
+		certs[i] = cert
+	}
+
+diff --git a/src/crypto/tls/handshake_client_test.go b/src/crypto/tls/handshake_client_test.go
+index 0228745..d581cb1 100644
+--- a/src/crypto/tls/handshake_client_test.go
++++ b/src/crypto/tls/handshake_client_test.go
+@@ -2595,3 +2595,81 @@ func TestClientHandshakeContextCancellation(t *testing.T) {
+		t.Error("Client connection was not closed when the context was canceled")
+	}
+ }
++
++// discardConn wraps a net.Conn but discards all writes, but reports that they happened.
++type discardConn struct {
++	net.Conn
++}
++
++func (dc *discardConn) Write(data []byte) (int, error) {
++	return len(data), nil
++}
++
++// largeRSAKeyCertPEM contains a 8193 bit RSA key
++const largeRSAKeyCertPEM = `-----BEGIN CERTIFICATE-----
++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
++u58=
++-----END CERTIFICATE-----`
++
++func TestHandshakeRSATooBig(t *testing.T) {
++	testCert, _ := pem.Decode([]byte(largeRSAKeyCertPEM))
++
++	c := &Conn{conn: &discardConn{}, config: testConfig.Clone()}
++
++	expectedErr := "tls: server sent certificate containing RSA key larger than 8192 bits"
++	err := c.verifyServerCertificate([][]byte{testCert.Bytes})
++	if err == nil || err.Error() != expectedErr {
++		t.Errorf("Conn.verifyServerCertificate unexpected error: want %q, got %q", expectedErr, err)
++	}
++
++	expectedErr = "tls: client sent certificate containing RSA key larger than 8192 bits"
++	err = c.processCertsFromClient(Certificate{Certificate: [][]byte{testCert.Bytes}})
++	if err == nil || err.Error() != expectedErr {
++		t.Errorf("Conn.processCertsFromClient unexpected error: want %q, got %q", expectedErr, err)
++	}
++}
+diff --git a/src/crypto/tls/handshake_server.go b/src/crypto/tls/handshake_server.go
+index 8d51e7e..a5d8f4a 100644
+--- a/src/crypto/tls/handshake_server.go
++++ b/src/crypto/tls/handshake_server.go
+@@ -812,6 +812,10 @@ func (c *Conn) processCertsFromClient(certificate Certificate) error {
+			c.sendAlert(alertBadCertificate)
+			return errors.New("tls: failed to parse client certificate: " + err.Error())
+		}
++		if certs[i].PublicKeyAlgorithm == x509.RSA && certs[i].PublicKey.(*rsa.PublicKey).N.BitLen() > maxRSAKeySize {
++			c.sendAlert(alertBadCertificate)
++			return fmt.Errorf("tls: client sent certificate containing RSA key larger than %d bits", maxRSAKeySize)
++		}
+	}
+
+	if len(certs) == 0 && requiresClientCert(c.config.ClientAuth) {
+--
+2.40.0
-- 
2.40.0


