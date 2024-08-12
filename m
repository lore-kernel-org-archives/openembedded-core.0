Return-Path: <soumya.sambu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FCBDC52D7C
	for <webhook@archiver.kernel.org>; Mon, 12 Aug 2024 12:09:34 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.44684.1723464573390603804
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Aug 2024 05:09:33 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=8954b4bde7=soumya.sambu@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47CBcIfb015951
	for <openembedded-core@lists.openembedded.org>; Mon, 12 Aug 2024 05:09:33 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 40x3g01kw3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 12 Aug 2024 05:09:32 -0700 (PDT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 12 Aug 2024 05:09:30 -0700
From: ssambu <soumya.sambu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][kirkstone][PATCH 1/1] python3-certifi: Fix CVE-2024-39689
Date: Mon, 12 Aug 2024 12:09:12 +0000
Message-ID: <20240812120912.1468679-1-soumya.sambu@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (147.11.82.252) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-ORIG-GUID: Jw_lSqcX7DrwgWQKhJ6Wpav1hXQ9kK2U
X-Proofpoint-GUID: Jw_lSqcX7DrwgWQKhJ6Wpav1hXQ9kK2U
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-12_02,2024-08-12_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxlogscore=812
 impostorscore=0 mlxscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 priorityscore=1501 spamscore=0 phishscore=0
 clxscore=1011 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2407110000 definitions=main-2408120092
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Aug 2024 12:09:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203222

From: Soumya Sambu <soumya.sambu@windriver.com>

Certifi is a curated collection of Root Certificates for validating the
trustworthiness of SSL certificates while verifying the identity of TLS
hosts. Certifi starting in 2021.05.30 and prior to 2024.07.4 recognized
root certificates from `GLOBALTRUST`. Certifi 2024.07.04 removes root
certificates from `GLOBALTRUST` from the root store. These are in the
process of being removed from Mozilla's trust store. `GLOBALTRUST`'s root
certificates are being removed pursuant to an investigation which
identified "long-running and unresolved compliance issues."Certifi is a
curated collection of Root Certificates for validating the trustworthiness
of SSL certificates while verifying the identity of TLS hosts. Certifi
starting in 2021.05.30 and prior to 2024.07.4 recognized root certificates
from `GLOBALTRUST`. Certifi 2024.07.04 removes root certificates from
`GLOBALTRUST` from the root store. These are in the process of being removed
from Mozilla's trust store. `GLOBALTRUST`'s root certificates are being
removed pursuant to an investigation which identified "long-running and
unresolved compliance issues."

References:
https://nvd.nist.gov/vuln/detail/CVE-2024-39689

Upstream-patch:
https://github.com/certifi/python-certifi/commit/bd8153872e9c6fc98f4023df9c2deaffea2fa463

Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
---
 .../python3-certifi/CVE-2024-39689.patch      | 69 +++++++++++++++++++
 .../python/python3-certifi_2021.10.8.bb       |  1 +
 2 files changed, 70 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-certifi/CVE-2024-39689.patch

diff --git a/meta/recipes-devtools/python/python3-certifi/CVE-2024-39689.patch b/meta/recipes-devtools/python/python3-certifi/CVE-2024-39689.patch
new file mode 100644
index 0000000000..a2ecc15d2c
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-certifi/CVE-2024-39689.patch
@@ -0,0 +1,69 @@
+From bd8153872e9c6fc98f4023df9c2deaffea2fa463 Mon Sep 17 00:00:00 2001
+From: github-actions[bot] <41898282+github-actions[bot]@users.noreply.github.com>
+Date: Wed, 3 Jul 2024 21:34:29 -0400
+Subject: [PATCH] 2024.07.04 (#295)
+
+Co-authored-by: alex <772+alex@users.noreply.github.com>
+
+CVE: CVE-2024-39689
+
+Upstream-Status: Backport [https://github.com/certifi/python-certifi/commit/bd8153872e9c6fc98f4023df9c2deaffea2fa463]
+
+Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
+---
+ certifi/cacert.pem | 40 ----------------------------------------
+ 1 file changed, 40 deletions(-)
+
+diff --git a/certifi/cacert.pem b/certifi/cacert.pem
+index 1bec256..6bb8cf8 100644
+--- a/certifi/cacert.pem
++++ b/certifi/cacert.pem
+@@ -3857,46 +3857,6 @@ DgQWBBQxCpCPtsad0kRLgLWi5h+xEk8blTAKBggqhkjOPQQDAwNoADBlAjEA31SQ
+ +RHUjE7AwWHCFUyqqx0LMV87HOIAl0Qx5v5zli/altP+CAezNIm8BZ/3Hobui3A=
+ -----END CERTIFICATE-----
+
+-# Issuer: CN=GLOBALTRUST 2020 O=e-commerce monitoring GmbH
+-# Subject: CN=GLOBALTRUST 2020 O=e-commerce monitoring GmbH
+-# Label: "GLOBALTRUST 2020"
+-# Serial: 109160994242082918454945253
+-# MD5 Fingerprint: 8a:c7:6f:cb:6d:e3:cc:a2:f1:7c:83:fa:0e:78:d7:e8
+-# SHA1 Fingerprint: d0:67:c1:13:51:01:0c:aa:d0:c7:6a:65:37:31:16:26:4f:53:71:a2
+-# SHA256 Fingerprint: 9a:29:6a:51:82:d1:d4:51:a2:e3:7f:43:9b:74:da:af:a2:67:52:33:29:f9:0f:9a:0d:20:07:c3:34:e2:3c:9a
+------BEGIN CERTIFICATE-----
+-MIIFgjCCA2qgAwIBAgILWku9WvtPilv6ZeUwDQYJKoZIhvcNAQELBQAwTTELMAkG
+-A1UEBhMCQVQxIzAhBgNVBAoTGmUtY29tbWVyY2UgbW9uaXRvcmluZyBHbWJIMRkw
+-FwYDVQQDExBHTE9CQUxUUlVTVCAyMDIwMB4XDTIwMDIxMDAwMDAwMFoXDTQwMDYx
+-MDAwMDAwMFowTTELMAkGA1UEBhMCQVQxIzAhBgNVBAoTGmUtY29tbWVyY2UgbW9u
+-aXRvcmluZyBHbWJIMRkwFwYDVQQDExBHTE9CQUxUUlVTVCAyMDIwMIICIjANBgkq
+-hkiG9w0BAQEFAAOCAg8AMIICCgKCAgEAri5WrRsc7/aVj6B3GyvTY4+ETUWiD59b
+-RatZe1E0+eyLinjF3WuvvcTfk0Uev5E4C64OFudBc/jbu9G4UeDLgztzOG53ig9Z
+-YybNpyrOVPu44sB8R85gfD+yc/LAGbaKkoc1DZAoouQVBGM+uq/ufF7MpotQsjj3
+-QWPKzv9pj2gOlTblzLmMCcpL3TGQlsjMH/1WljTbjhzqLL6FLmPdqqmV0/0plRPw
+-yJiT2S0WR5ARg6I6IqIoV6Lr/sCMKKCmfecqQjuCgGOlYx8ZzHyyZqjC0203b+J+
+-BlHZRYQfEs4kUmSFC0iAToexIiIwquuuvuAC4EDosEKAA1GqtH6qRNdDYfOiaxaJ
+-SaSjpCuKAsR49GiKweR6NrFvG5Ybd0mN1MkGco/PU+PcF4UgStyYJ9ORJitHHmkH
+-r96i5OTUawuzXnzUJIBHKWk7buis/UDr2O1xcSvy6Fgd60GXIsUf1DnQJ4+H4xj0
+-4KlGDfV0OoIu0G4skaMxXDtG6nsEEFZegB31pWXogvziB4xiRfUg3kZwhqG8k9Me
+-dKZssCz3AwyIDMvUclOGvGBG85hqwvG/Q/lwIHfKN0F5VVJjjVsSn8VoxIidrPIw
+-q7ejMZdnrY8XD2zHc+0klGvIg5rQmjdJBKuxFshsSUktq6HQjJLyQUp5ISXbY9e2
+-nKd+Qmn7OmMCAwEAAaNjMGEwDwYDVR0TAQH/BAUwAwEB/zAOBgNVHQ8BAf8EBAMC
+-AQYwHQYDVR0OBBYEFNwuH9FhN3nkq9XVsxJxaD1qaJwiMB8GA1UdIwQYMBaAFNwu
+-H9FhN3nkq9XVsxJxaD1qaJwiMA0GCSqGSIb3DQEBCwUAA4ICAQCR8EICaEDuw2jA
+-VC/f7GLDw56KoDEoqoOOpFaWEhCGVrqXctJUMHytGdUdaG/7FELYjQ7ztdGl4wJC
+-XtzoRlgHNQIw4Lx0SsFDKv/bGtCwr2zD/cuz9X9tAy5ZVp0tLTWMstZDFyySCstd
+-6IwPS3BD0IL/qMy/pJTAvoe9iuOTe8aPmxadJ2W8esVCgmxcB9CpwYhgROmYhRZf
+-+I/KARDOJcP5YBugxZfD0yyIMaK9MOzQ0MAS8cE54+X1+NZK3TTN+2/BT+MAi1bi
+-kvcoskJ3ciNnxz8RFbLEAwW+uxF7Cr+obuf/WEPPm2eggAe2HcqtbepBEX4tdJP7
+-wry+UUTF72glJ4DjyKDUEuzZpTcdN3y0kcra1LGWge9oXHYQSa9+pTeAsRxSvTOB
+-TI/53WXZFM2KJVj04sWDpQmQ1GwUY7VA3+vA/MRYfg0UFodUJ25W5HCEuGwyEn6C
+-MUO+1918oa2u1qsgEu8KwxCMSZY13At1XrFP1U80DhEgB3VDRemjEdqso5nCtnkn
+-4rnvyOL2NSl6dPrFf4IFYqYK6miyeUcGbvJXqBUzxvd4Sj1Ce2t+/vdG6tHrju+I
+-aFvowdlxfv1k7/9nR4hYJS8+hge9+6jlgqispdNpQ80xiEmEU5LAsTkbOYMBMMTy
+-qfrQA71yN2BWHzZ8vTmR9W0Nv3vXkg==
+------END CERTIFICATE-----
+-
+ # Issuer: CN=ANF Secure Server Root CA O=ANF Autoridad de Certificacion OU=ANF CA Raiz
+ # Subject: CN=ANF Secure Server Root CA O=ANF Autoridad de Certificacion OU=ANF CA Raiz
+ # Label: "ANF Secure Server Root CA"
+--
+2.40.0
diff --git a/meta/recipes-devtools/python/python3-certifi_2021.10.8.bb b/meta/recipes-devtools/python/python3-certifi_2021.10.8.bb
index eb1574adf6..0d45041184 100644
--- a/meta/recipes-devtools/python/python3-certifi_2021.10.8.bb
+++ b/meta/recipes-devtools/python/python3-certifi_2021.10.8.bb
@@ -9,6 +9,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=67da0714c3f9471067b729eca6c9fbe8"
 
 SRC_URI += "file://CVE-2022-23491.patch \
             file://CVE-2023-37920.patch \
+            file://CVE-2024-39689.patch \
            "
 
 SRC_URI[sha256sum] = "78884e7c1d4b00ce3cea67b44566851c4343c120abd683433ce934a68ea58872"
-- 
2.40.0


