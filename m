Received: from outbound5.mail.transip.nl (outbound5.mail.transip.nl [136.144.136.9])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6813.1793220703212162797
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Oct 2026 13:51:45 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@myspectrum.nl header.s=transip-a header.b=XNJOhcUj;
 spf=pass (domain: myspectrum.nl, ip: 136.144.136.9, mailfrom: jeroen@myspectrum.nl)
Received: from submission0.mail.transip.nl (unknown [10.100.4.69])
	by outbound5.mail.transip.nl (Postfix) with ESMTP id 4jFKKS3gH2zHVMl
	for <openembedded-core@lists.openembedded.org>; Wed, 28 Oct 2026 21:51:40 +0100 (CET)
Received: from yellow.myspectrum.nl (unknown [IPv6:2a01:7c8:bb0c:45:5054:ff:fe01:854])
	by submission0.mail.transip.nl (Postfix) with ESMTPSA id 4jFKKR5D5JzZyxrw;
	Wed, 28 Oct 2026 21:51:39 +0100 (CET)
Received: from yellow.myspectrum.nl (212-204-162-136.cable.dynamic.v4.ziggo.nl [212.204.162.136])
	(Authenticated sender: sendmail@myspectrum.nl)
	by yellow.myspectrum.nl (Postfix) with ESMTPSA id 750DA2016D;
	Wed, 28 Oct 2026 20:51:37 +0000 (UTC)
Authentication-Results: yellow.myspectrum.nl;
	auth=pass smtp.auth=sendmail@myspectrum.nl smtp.mailfrom=jeroen@myspectrum.nl
Received: by yellow.myspectrum.nl (sSMTP sendmail emulation); Wed, 28 Oct 2026 21:51:36 +0100
From: jeroen@myspectrum.nl
To: openembedded-core@lists.openembedded.org
Cc: Jeroen Hofstee <jhofstee@victronenergy.com>,
	Paul Barker <paul@pbarker.dev>
Subject: [wrynose][PATCH] python3-pip: patch the vendored python3-certifi
Date: Wed, 28 Oct 2026 21:50:34 +0100
Message-ID: <20261028205033.617954-2-jeroen@myspectrum.nl>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Scanned-By: ClueGetter at submission0.mail.transip.nl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=transip-a; d=myspectrum.nl; t=1793220699; h=from:subject:to:cc:date:
 mime-version; bh=teZ4ppBrVZw4zMnl00K+9rF39cGrtK61EOHwBIPbknw=;
 b=XNJOhcUjiammrnrcJ4xgK57MFNSPTB846CeLSYxjSX1CeCYnDzVGsz0UJ1Ba+9+r8/f+nZ
 1RaD8LfsRkwE3hu1OTpAik84tA9JwRBna06qL8vjBPJtAzM8TlUKxx4wpjyyknmkmqMGyc
 4XFzJZF22Fz/e8f7cI7RMEwBVSr3pxgU4/0u04ZWNLF+l/UOKLKiJ9SElkyhUH9zuuO7xR
 FtDy5WtfwHfZcCkbdS/sYNZrC/fB4W9lPIhGO1vV6DvD+ORD4iAZzuvO6MxlGzh6ZTwBqf
 SB/72lh8c+SN6XGs68Z3XCruC3btH80ZH2hTvu1lbt/BRTuZpG5HYpDUJ0GpNA==
X-Report-Abuse-To: abuse@transip.nl
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 28 Oct 2026 20:51:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248828
Content-Type: text/plain; charset="utf-8"

From: Jeroen Hofstee <jhofstee@victronenergy.com>

Like python3-certifi: remove emSign CAs.

See https://emudhra.we-have-a-problem.com.

Signed-off-by: Jeroen Hofstee <jhofstee@victronenergy.com>
---
 .../python3-pip/0001-Remove-emsign-437.patch  | 141 ++++++++++++++++++
 ...tore-unaffected-emSign-roots-439-440.patch | 106 +++++++++++++
 .../python/python3-pip_26.0.1.bb              |   2 +
 3 files changed, 249 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-pip/0001-Remove-=
emsign-437.patch
 create mode 100644 meta/recipes-devtools/python/python3-pip/0002-Restore=
-unaffected-emSign-roots-439-440.patch

diff --git a/meta/recipes-devtools/python/python3-pip/0001-Remove-emsign-=
437.patch b/meta/recipes-devtools/python/python3-pip/0001-Remove-emsign-4=
37.patch
new file mode 100644
index 0000000000..dc6a1b77f2
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-pip/0001-Remove-emsign-437.pat=
ch
@@ -0,0 +1,141 @@
+From 0802dcc6194b35b0eeb86e52248ace5eadc300cd Mon Sep 17 00:00:00 2001
+From: Alex Gaynor <alex.gaynor@gmail.com>
+Date: Sun, 18 Oct 2026 12:19:26 -0400
+Subject: [PATCH 1/2] Remove emsign (#437)
+
+* Remove emSign CAs
+
+Co-Authored-By: Claude Opus 5.5 <noreply@anthropic.com>
+
+* 2026.10.18
+
+Co-Authored-By: Claude Opus 5.5 <noreply@anthropic.com>
+
+---------
+
+Co-authored-by: Claude Opus 5.5 <noreply@anthropic.com>
+(cherry picked from commit 5cb238caeeb6c30ec1a7309ad3e16a5aa7b10ce8)
+
+Upstream-Status: Backport [https://github.com/certifi/python-certifi/com=
mit/5cb238caeeb6c30ec1a7309ad3e16a5aa7b10ce8]
+---
+ certifi/cacert.pem | 104 ---------------------------------------------
+ 1 file changed, 104 deletions(-)
+
+diff --git a/certifi/cacert.pem b/certifi/cacert.pem
+index fac3c31..d4e81a7 100644
+--- a/certifi/cacert.pem
++++ b/certifi/cacert.pem
+@@ -2954,110 +2954,6 @@ jWZSaX5LaAzHHjcng6WMxwLkFM1JAbBzs/3GkDpv0mztO+7s=
kb6iQ12LAEpmJURw
+ 3kAP+HwV96LOPNdeE4yBFxgX0b3xdxA61GU5wSesVywlVP+i2k+KYTlerj1KjL0=3D
+ -----END CERTIFICATE-----
+=20
+-# Issuer: CN=3DemSign Root CA - G1 O=3DeMudhra Technologies Limited OU=3D=
emSign PKI
+-# Subject: CN=3DemSign Root CA - G1 O=3DeMudhra Technologies Limited OU=
=3DemSign PKI
+-# Label: "emSign Root CA - G1"
+-# Serial: 235931866688319308814040
+-# MD5 Fingerprint: 9c:42:84:57:dd:cb:0b:a7:2e:95:ad:b6:f3:da:bc:ac
+-# SHA1 Fingerprint: 8a:c7:ad:8f:73:ac:4e:c1:b5:75:4d:a5:40:f4:fc:cf:7c:=
b5:8e:8c
+-# SHA256 Fingerprint: 40:f6:af:03:46:a9:9a:a1:cd:1d:55:5a:4e:9c:ce:62:c=
7:f9:63:46:03:ee:40:66:15:83:3d:c8:c8:d0:03:67
+------BEGIN CERTIFICATE-----
+-MIIDlDCCAnygAwIBAgIKMfXkYgxsWO3W2DANBgkqhkiG9w0BAQsFADBnMQswCQYD
+-VQQGEwJJTjETMBEGA1UECxMKZW1TaWduIFBLSTElMCMGA1UEChMcZU11ZGhyYSBU
+-ZWNobm9sb2dpZXMgTGltaXRlZDEcMBoGA1UEAxMTZW1TaWduIFJvb3QgQ0EgLSBH
+-MTAeFw0xODAyMTgxODMwMDBaFw00MzAyMTgxODMwMDBaMGcxCzAJBgNVBAYTAklO
+-MRMwEQYDVQQLEwplbVNpZ24gUEtJMSUwIwYDVQQKExxlTXVkaHJhIFRlY2hub2xv
+-Z2llcyBMaW1pdGVkMRwwGgYDVQQDExNlbVNpZ24gUm9vdCBDQSAtIEcxMIIBIjAN
+-BgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAk0u76WaK7p1b1TST0Bsew+eeuGQz
+-f2N4aLTNLnF115sgxk0pvLZoYIr3IZpWNVrzdr3YzZr/k1ZLpVkGoZM0Kd0WNHVO
+-8oG0x5ZOrRkVUkr+PHB1cM2vK6sVmjM8qrOLqs1D/fXqcP/tzxE7lM5OMhbTI0Aq
+-d7OvPAEsbO2ZLIvZTmmYsvePQbAyeGHWDV/D+qJAkh1cF+ZwPjXnorfCYuKrpDhM
+-tTk1b+oDafo6VGiFbdbyL0NVHpENDtjVaqSW0RM8LHhQ6DqS0hdW5TUaQBw+jSzt
+-Od9C4INBdN+jzcKGYEho42kLVACL5HZpIQ15TjQIXhTCzLG3rdd8cIrHhQIDAQAB
+-o0IwQDAdBgNVHQ4EFgQU++8Nhp6w492pufEhF38+/PB3KxowDgYDVR0PAQH/BAQD
+-AgEGMA8GA1UdEwEB/wQFMAMBAf8wDQYJKoZIhvcNAQELBQADggEBAFn/8oz1h31x
+-PaOfG1vR2vjTnGs2vZupYeveFix0PZ7mddrXuqe8QhfnPZHr5X3dPpzxz5KsbEjM
+-wiI/aTvFthUvozXGaCocV685743QNcMYDHsAVhzNixl03r4PEuDQqqE/AjSxcM6d
+-GNYIAwlG7mDgfrbESQRRfXBgvKqy/3lyeqYdPV8q+Mri/Tm3R7nrft8EI6/6nAYH
+-6ftjk4BAtcZsCjEozgyfz7MjNYBBjWzEN3uBL4ChQEKF6dk4jeihU80Bv2noWgby
+-RQuQ+q7hv53yrlc8pa6yVvSLZUDp/TGBLPQ5Cdjua6e0ph0VpZj3AYHYhX3zUVxx
+-iN66zB+Afko=3D
+------END CERTIFICATE-----
+-
+-# Issuer: CN=3DemSign ECC Root CA - G3 O=3DeMudhra Technologies Limited=
 OU=3DemSign PKI
+-# Subject: CN=3DemSign ECC Root CA - G3 O=3DeMudhra Technologies Limite=
d OU=3DemSign PKI
+-# Label: "emSign ECC Root CA - G3"
+-# Serial: 287880440101571086945156
+-# MD5 Fingerprint: ce:0b:72:d1:9f:88:8e:d0:50:03:e8:e3:b8:8b:67:40
+-# SHA1 Fingerprint: 30:43:fa:4f:f2:57:dc:a0:c3:80:ee:2e:58:ea:78:b2:3f:=
e6:bb:c1
+-# SHA256 Fingerprint: 86:a1:ec:ba:08:9c:4a:8d:3b:be:27:34:c6:12:ba:34:1=
d:81:3e:04:3c:f9:e8:a8:62:cd:5c:57:a3:6b:be:6b
+------BEGIN CERTIFICATE-----
+-MIICTjCCAdOgAwIBAgIKPPYHqWhwDtqLhDAKBggqhkjOPQQDAzBrMQswCQYDVQQG
+-EwJJTjETMBEGA1UECxMKZW1TaWduIFBLSTElMCMGA1UEChMcZU11ZGhyYSBUZWNo
+-bm9sb2dpZXMgTGltaXRlZDEgMB4GA1UEAxMXZW1TaWduIEVDQyBSb290IENBIC0g
+-RzMwHhcNMTgwMjE4MTgzMDAwWhcNNDMwMjE4MTgzMDAwWjBrMQswCQYDVQQGEwJJ
+-TjETMBEGA1UECxMKZW1TaWduIFBLSTElMCMGA1UEChMcZU11ZGhyYSBUZWNobm9s
+-b2dpZXMgTGltaXRlZDEgMB4GA1UEAxMXZW1TaWduIEVDQyBSb290IENBIC0gRzMw
+-djAQBgcqhkjOPQIBBgUrgQQAIgNiAAQjpQy4LRL1KPOxst3iAhKAnjlfSU2fySU0
+-WXTsuwYc58Byr+iuL+FBVIcUqEqy6HyC5ltqtdyzdc6LBtCGI79G1Y4PPwT01xyS
+-fvalY8L1X44uT6EYGQIrMgqCZH0Wk9GjQjBAMB0GA1UdDgQWBBR8XQKEE9TMipuB
+-zhccLikenEhjQjAOBgNVHQ8BAf8EBAMCAQYwDwYDVR0TAQH/BAUwAwEB/zAKBggq
+-hkjOPQQDAwNpADBmAjEAvvNhzwIQHWSVB7gYboiFBS+DCBeQyh+KTOgNG3qxrdWB
+-CUfvO6wIBHxcmbHtRwfSAjEAnbpV/KlK6O3t5nYBQnvI+GDZjVGLVTv7jHvrZQnD
+-+JbNR6iC8hZVdyR+EhCVBCyj
+------END CERTIFICATE-----
+-
+-# Issuer: CN=3DemSign Root CA - C1 O=3DeMudhra Inc OU=3DemSign PKI
+-# Subject: CN=3DemSign Root CA - C1 O=3DeMudhra Inc OU=3DemSign PKI
+-# Label: "emSign Root CA - C1"
+-# Serial: 825510296613316004955058
+-# MD5 Fingerprint: d8:e3:5d:01:21:fa:78:5a:b0:df:ba:d2:ee:2a:5f:68
+-# SHA1 Fingerprint: e7:2e:f1:df:fc:b2:09:28:cf:5d:d4:d5:67:37:b1:51:cb:=
86:4f:01
+-# SHA256 Fingerprint: 12:56:09:aa:30:1d:a0:a2:49:b9:7a:82:39:cb:6a:34:2=
1:6f:44:dc:ac:9f:39:54:b1:42:92:f2:e8:c8:60:8f
+------BEGIN CERTIFICATE-----
+-MIIDczCCAlugAwIBAgILAK7PALrEzzL4Q7IwDQYJKoZIhvcNAQELBQAwVjELMAkG
+-A1UEBhMCVVMxEzARBgNVBAsTCmVtU2lnbiBQS0kxFDASBgNVBAoTC2VNdWRocmEg
+-SW5jMRwwGgYDVQQDExNlbVNpZ24gUm9vdCBDQSAtIEMxMB4XDTE4MDIxODE4MzAw
+-MFoXDTQzMDIxODE4MzAwMFowVjELMAkGA1UEBhMCVVMxEzARBgNVBAsTCmVtU2ln
+-biBQS0kxFDASBgNVBAoTC2VNdWRocmEgSW5jMRwwGgYDVQQDExNlbVNpZ24gUm9v
+-dCBDQSAtIEMxMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAz+upufGZ
+-BczYKCFK83M0UYRWEPWgTywS4/oTmifQz/l5GnRfHXk5/Fv4cI7gklL35CX5VIPZ
+-HdPIWoU/Xse2B+4+wM6ar6xWQio5JXDWv7V7Nq2s9nPczdcdioOl+yuQFTdrHCZH
+-3DspVpNqs8FqOp099cGXOFgFixwR4+S0uF2FHYP+eF8LRWgYSKVGczQ7/g/IdrvH
+-GPMF0Ybzhe3nudkyrVWIzqa2kbBPrH4VI5b2P/AgNBbeCsbEBEV5f6f9vtKppa+c
+-xSMq9zwhbL2vj07FOrLzNBL834AaSaTUqZX3noleoomslMuoaJuvimUnzYnu3Yy1
+-aylwQ6BpC+S5DwIDAQABo0IwQDAdBgNVHQ4EFgQU/qHgcB4qAzlSWkK+XJGFehiq
+-TbUwDgYDVR0PAQH/BAQDAgEGMA8GA1UdEwEB/wQFMAMBAf8wDQYJKoZIhvcNAQEL
+-BQADggEBAMJKVvoVIXsoounlHfv4LcQ5lkFMOycsxGwYFYDGrK9HWS8mC+M2sO87
+-/kOXSTKZEhVb3xEp/6tT+LvBeA+snFOvV71ojD1pM/CjoCNjO2RnIkSt1XHLVip4
+-kqNPEjE2NuLe/gDEo2APJ62gsIq1NnpSob0n9CAnYuhNlCQT5AoE6TyrLshDCUrG
+-YQTlSTR+08TI9Q/Aqum6VF7zYytPT1DU/rl7mYw9wC68AivTxEDkigcxHpvOJpkT
+-+xHqmiIMERnHXhuBUDDIlhJu58tBf5E7oke3VIAb3ADMmpDqw8NQBmIMMMAVSKeo
+-WXzhriKi4gp6D/piq1JM4fHfyr6DDUI=3D
+------END CERTIFICATE-----
+-
+-# Issuer: CN=3DemSign ECC Root CA - C3 O=3DeMudhra Inc OU=3DemSign PKI
+-# Subject: CN=3DemSign ECC Root CA - C3 O=3DeMudhra Inc OU=3DemSign PKI
+-# Label: "emSign ECC Root CA - C3"
+-# Serial: 582948710642506000014504
+-# MD5 Fingerprint: 3e:53:b3:a3:81:ee:d7:10:f8:d3:b0:1d:17:92:f5:d5
+-# SHA1 Fingerprint: b6:af:43:c2:9b:81:53:7d:f6:ef:6b:c3:1f:1f:60:15:0c:=
ee:48:66
+-# SHA256 Fingerprint: bc:4d:80:9b:15:18:9d:78:db:3e:1d:8c:f4:f9:72:6a:7=
9:5d:a1:64:3c:a5:f1:35:8e:1d:db:0e:dc:0d:7e:b3
+------BEGIN CERTIFICATE-----
+-MIICKzCCAbGgAwIBAgIKe3G2gla4EnycqDAKBggqhkjOPQQDAzBaMQswCQYDVQQG
+-EwJVUzETMBEGA1UECxMKZW1TaWduIFBLSTEUMBIGA1UEChMLZU11ZGhyYSBJbmMx
+-IDAeBgNVBAMTF2VtU2lnbiBFQ0MgUm9vdCBDQSAtIEMzMB4XDTE4MDIxODE4MzAw
+-MFoXDTQzMDIxODE4MzAwMFowWjELMAkGA1UEBhMCVVMxEzARBgNVBAsTCmVtU2ln
+-biBQS0kxFDASBgNVBAoTC2VNdWRocmEgSW5jMSAwHgYDVQQDExdlbVNpZ24gRUND
+-IFJvb3QgQ0EgLSBDMzB2MBAGByqGSM49AgEGBSuBBAAiA2IABP2lYa57JhAd6bci
+-MK4G9IGzsUJxlTm801Ljr6/58pc1kjZGDoeVjbk5Wum739D+yAdBPLtVb4Ojavti
+-sIGJAnB9SMVK4+kiVCJNk7tCDK93nCOmfddhEc5lx/h//vXyqaNCMEAwHQYDVR0O
+-BBYEFPtaSNCAIEDyqOkAB2kZd6fmw/TPMA4GA1UdDwEB/wQEAwIBBjAPBgNVHRMB
+-Af8EBTADAQH/MAoGCCqGSM49BAMDA2gAMGUCMQC02C8Cif22TGK6Q04ThHK1rt0c
+-3ta13FaPWEBaLd4gTCKDypOofu4SQMfWh0/434UCMBwUZOR8loMRnLDRWmFLpg9J
+-0wD8ofzkpf9/rdcw0Md3f76BB1UwUCAU9Vc4CqgxUQ=3D=3D
+------END CERTIFICATE-----
+-
+ # Issuer: CN=3DHongkong Post Root CA 3 O=3DHongkong Post
+ # Subject: CN=3DHongkong Post Root CA 3 O=3DHongkong Post
+ # Label: "Hongkong Post Root CA 3"
+--=20
+2.53.0
+
diff --git a/meta/recipes-devtools/python/python3-pip/0002-Restore-unaffe=
cted-emSign-roots-439-440.patch b/meta/recipes-devtools/python/python3-pi=
p/0002-Restore-unaffected-emSign-roots-439-440.patch
new file mode 100644
index 0000000000..2bcb5b200f
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-pip/0002-Restore-unaffected-em=
Sign-roots-439-440.patch
@@ -0,0 +1,106 @@
+From e82ee82a34e70a4fbf5003ba6cf2fcd62a24d764 Mon Sep 17 00:00:00 2001
+From: Nathan Neulinger <nneul@neulinger.org>
+Date: Mon, 19 Oct 2026 21:10:51 -0500
+Subject: [PATCH 2/2] Restore unaffected emSign roots (#439) (#440)
+
+(cherry picked from commit 662df63d7906df66f1f07c0751a3dfe9da14d914)
+Upstream-Status: Backport [https://github.com/certifi/python-certifi/com=
mit/662df63d7906df66f1f07c0751a3dfe9da14d914]
+---
+ certifi/cacert.pem | 81 ++++++++++++++++++++++++++++++++++++++++++++++
+ 1 file changed, 81 insertions(+)
+
+diff --git a/certifi/cacert.pem b/certifi/cacert.pem
+index d4e81a7..4c74ecd 100644
+--- a/certifi/cacert.pem
++++ b/certifi/cacert.pem
+@@ -2954,6 +2954,87 @@ jWZSaX5LaAzHHjcng6WMxwLkFM1JAbBzs/3GkDpv0mztO+7sk=
b6iQ12LAEpmJURw
+ 3kAP+HwV96LOPNdeE4yBFxgX0b3xdxA61GU5wSesVywlVP+i2k+KYTlerj1KjL0=3D
+ -----END CERTIFICATE-----
+=20
++# Issuer: CN=3DemSign Root CA - G1 O=3DeMudhra Technologies Limited OU=3D=
emSign PKI
++# Subject: CN=3DemSign Root CA - G1 O=3DeMudhra Technologies Limited OU=
=3DemSign PKI
++# Label: "emSign Root CA - G1"
++# Serial: 235931866688319308814040
++# MD5 Fingerprint: 9c:42:84:57:dd:cb:0b:a7:2e:95:ad:b6:f3:da:bc:ac
++# SHA1 Fingerprint: 8a:c7:ad:8f:73:ac:4e:c1:b5:75:4d:a5:40:f4:fc:cf:7c:=
b5:8e:8c
++# SHA256 Fingerprint: 40:f6:af:03:46:a9:9a:a1:cd:1d:55:5a:4e:9c:ce:62:c=
7:f9:63:46:03:ee:40:66:15:83:3d:c8:c8:d0:03:67
++-----BEGIN CERTIFICATE-----
++MIIDlDCCAnygAwIBAgIKMfXkYgxsWO3W2DANBgkqhkiG9w0BAQsFADBnMQswCQYD
++VQQGEwJJTjETMBEGA1UECxMKZW1TaWduIFBLSTElMCMGA1UEChMcZU11ZGhyYSBU
++ZWNobm9sb2dpZXMgTGltaXRlZDEcMBoGA1UEAxMTZW1TaWduIFJvb3QgQ0EgLSBH
++MTAeFw0xODAyMTgxODMwMDBaFw00MzAyMTgxODMwMDBaMGcxCzAJBgNVBAYTAklO
++MRMwEQYDVQQLEwplbVNpZ24gUEtJMSUwIwYDVQQKExxlTXVkaHJhIFRlY2hub2xv
++Z2llcyBMaW1pdGVkMRwwGgYDVQQDExNlbVNpZ24gUm9vdCBDQSAtIEcxMIIBIjAN
++BgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAk0u76WaK7p1b1TST0Bsew+eeuGQz
++f2N4aLTNLnF115sgxk0pvLZoYIr3IZpWNVrzdr3YzZr/k1ZLpVkGoZM0Kd0WNHVO
++8oG0x5ZOrRkVUkr+PHB1cM2vK6sVmjM8qrOLqs1D/fXqcP/tzxE7lM5OMhbTI0Aq
++d7OvPAEsbO2ZLIvZTmmYsvePQbAyeGHWDV/D+qJAkh1cF+ZwPjXnorfCYuKrpDhM
++tTk1b+oDafo6VGiFbdbyL0NVHpENDtjVaqSW0RM8LHhQ6DqS0hdW5TUaQBw+jSzt
++Od9C4INBdN+jzcKGYEho42kLVACL5HZpIQ15TjQIXhTCzLG3rdd8cIrHhQIDAQAB
++o0IwQDAdBgNVHQ4EFgQU++8Nhp6w492pufEhF38+/PB3KxowDgYDVR0PAQH/BAQD
++AgEGMA8GA1UdEwEB/wQFMAMBAf8wDQYJKoZIhvcNAQELBQADggEBAFn/8oz1h31x
++PaOfG1vR2vjTnGs2vZupYeveFix0PZ7mddrXuqe8QhfnPZHr5X3dPpzxz5KsbEjM
++wiI/aTvFthUvozXGaCocV685743QNcMYDHsAVhzNixl03r4PEuDQqqE/AjSxcM6d
++GNYIAwlG7mDgfrbESQRRfXBgvKqy/3lyeqYdPV8q+Mri/Tm3R7nrft8EI6/6nAYH
++6ftjk4BAtcZsCjEozgyfz7MjNYBBjWzEN3uBL4ChQEKF6dk4jeihU80Bv2noWgby
++RQuQ+q7hv53yrlc8pa6yVvSLZUDp/TGBLPQ5Cdjua6e0ph0VpZj3AYHYhX3zUVxx
++iN66zB+Afko=3D
++-----END CERTIFICATE-----
++
++# Issuer: CN=3DemSign Root CA - C1 O=3DeMudhra Inc OU=3DemSign PKI
++# Subject: CN=3DemSign Root CA - C1 O=3DeMudhra Inc OU=3DemSign PKI
++# Label: "emSign Root CA - C1"
++# Serial: 825510296613316004955058
++# MD5 Fingerprint: d8:e3:5d:01:21:fa:78:5a:b0:df:ba:d2:ee:2a:5f:68
++# SHA1 Fingerprint: e7:2e:f1:df:fc:b2:09:28:cf:5d:d4:d5:67:37:b1:51:cb:=
86:4f:01
++# SHA256 Fingerprint: 12:56:09:aa:30:1d:a0:a2:49:b9:7a:82:39:cb:6a:34:2=
1:6f:44:dc:ac:9f:39:54:b1:42:92:f2:e8:c8:60:8f
++-----BEGIN CERTIFICATE-----
++MIIDczCCAlugAwIBAgILAK7PALrEzzL4Q7IwDQYJKoZIhvcNAQELBQAwVjELMAkG
++A1UEBhMCVVMxEzARBgNVBAsTCmVtU2lnbiBQS0kxFDASBgNVBAoTC2VNdWRocmEg
++SW5jMRwwGgYDVQQDExNlbVNpZ24gUm9vdCBDQSAtIEMxMB4XDTE4MDIxODE4MzAw
++MFoXDTQzMDIxODE4MzAwMFowVjELMAkGA1UEBhMCVVMxEzARBgNVBAsTCmVtU2ln
++biBQS0kxFDASBgNVBAoTC2VNdWRocmEgSW5jMRwwGgYDVQQDExNlbVNpZ24gUm9v
++dCBDQSAtIEMxMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAz+upufGZ
++BczYKCFK83M0UYRWEPWgTywS4/oTmifQz/l5GnRfHXk5/Fv4cI7gklL35CX5VIPZ
++HdPIWoU/Xse2B+4+wM6ar6xWQio5JXDWv7V7Nq2s9nPczdcdioOl+yuQFTdrHCZH
++3DspVpNqs8FqOp099cGXOFgFixwR4+S0uF2FHYP+eF8LRWgYSKVGczQ7/g/IdrvH
++GPMF0Ybzhe3nudkyrVWIzqa2kbBPrH4VI5b2P/AgNBbeCsbEBEV5f6f9vtKppa+c
++xSMq9zwhbL2vj07FOrLzNBL834AaSaTUqZX3noleoomslMuoaJuvimUnzYnu3Yy1
++aylwQ6BpC+S5DwIDAQABo0IwQDAdBgNVHQ4EFgQU/qHgcB4qAzlSWkK+XJGFehiq
++TbUwDgYDVR0PAQH/BAQDAgEGMA8GA1UdEwEB/wQFMAMBAf8wDQYJKoZIhvcNAQEL
++BQADggEBAMJKVvoVIXsoounlHfv4LcQ5lkFMOycsxGwYFYDGrK9HWS8mC+M2sO87
++/kOXSTKZEhVb3xEp/6tT+LvBeA+snFOvV71ojD1pM/CjoCNjO2RnIkSt1XHLVip4
++kqNPEjE2NuLe/gDEo2APJ62gsIq1NnpSob0n9CAnYuhNlCQT5AoE6TyrLshDCUrG
++YQTlSTR+08TI9Q/Aqum6VF7zYytPT1DU/rl7mYw9wC68AivTxEDkigcxHpvOJpkT
+++xHqmiIMERnHXhuBUDDIlhJu58tBf5E7oke3VIAb3ADMmpDqw8NQBmIMMMAVSKeo
++WXzhriKi4gp6D/piq1JM4fHfyr6DDUI=3D
++-----END CERTIFICATE-----
++
++# Issuer: CN=3DemSign ECC Root CA - C3 O=3DeMudhra Inc OU=3DemSign PKI
++# Subject: CN=3DemSign ECC Root CA - C3 O=3DeMudhra Inc OU=3DemSign PKI
++# Label: "emSign ECC Root CA - C3"
++# Serial: 582948710642506000014504
++# MD5 Fingerprint: 3e:53:b3:a3:81:ee:d7:10:f8:d3:b0:1d:17:92:f5:d5
++# SHA1 Fingerprint: b6:af:43:c2:9b:81:53:7d:f6:ef:6b:c3:1f:1f:60:15:0c:=
ee:48:66
++# SHA256 Fingerprint: bc:4d:80:9b:15:18:9d:78:db:3e:1d:8c:f4:f9:72:6a:7=
9:5d:a1:64:3c:a5:f1:35:8e:1d:db:0e:dc:0d:7e:b3
++-----BEGIN CERTIFICATE-----
++MIICKzCCAbGgAwIBAgIKe3G2gla4EnycqDAKBggqhkjOPQQDAzBaMQswCQYDVQQG
++EwJVUzETMBEGA1UECxMKZW1TaWduIFBLSTEUMBIGA1UEChMLZU11ZGhyYSBJbmMx
++IDAeBgNVBAMTF2VtU2lnbiBFQ0MgUm9vdCBDQSAtIEMzMB4XDTE4MDIxODE4MzAw
++MFoXDTQzMDIxODE4MzAwMFowWjELMAkGA1UEBhMCVVMxEzARBgNVBAsTCmVtU2ln
++biBQS0kxFDASBgNVBAoTC2VNdWRocmEgSW5jMSAwHgYDVQQDExdlbVNpZ24gRUND
++IFJvb3QgQ0EgLSBDMzB2MBAGByqGSM49AgEGBSuBBAAiA2IABP2lYa57JhAd6bci
++MK4G9IGzsUJxlTm801Ljr6/58pc1kjZGDoeVjbk5Wum739D+yAdBPLtVb4Ojavti
++sIGJAnB9SMVK4+kiVCJNk7tCDK93nCOmfddhEc5lx/h//vXyqaNCMEAwHQYDVR0O
++BBYEFPtaSNCAIEDyqOkAB2kZd6fmw/TPMA4GA1UdDwEB/wQEAwIBBjAPBgNVHRMB
++Af8EBTADAQH/MAoGCCqGSM49BAMDA2gAMGUCMQC02C8Cif22TGK6Q04ThHK1rt0c
++3ta13FaPWEBaLd4gTCKDypOofu4SQMfWh0/434UCMBwUZOR8loMRnLDRWmFLpg9J
++0wD8ofzkpf9/rdcw0Md3f76BB1UwUCAU9Vc4CqgxUQ=3D=3D
++-----END CERTIFICATE-----
++
+ # Issuer: CN=3DHongkong Post Root CA 3 O=3DHongkong Post
+ # Subject: CN=3DHongkong Post Root CA 3 O=3DHongkong Post
+ # Label: "Hongkong Post Root CA 3"
+--=20
+2.53.0
+
diff --git a/meta/recipes-devtools/python/python3-pip_26.0.1.bb b/meta/re=
cipes-devtools/python/python3-pip_26.0.1.bb
index b658157558..378fcd823e 100644
--- a/meta/recipes-devtools/python/python3-pip_26.0.1.bb
+++ b/meta/recipes-devtools/python/python3-pip_26.0.1.bb
@@ -29,6 +29,8 @@ SRC_URI +=3D "file://no_shebang_mangling.patch \
             file://CVE-2026-8643.patch \
             file://CVE-2026-8643-regression_p1.patch \
             file://CVE-2026-8643-regression_p2.patch \
+            file://0001-Remove-emsign-437.patch;patchdir=3Dsrc/pip/_vend=
or \
+            file://0002-Restore-unaffected-emSign-roots-439-440.patch;pa=
tchdir=3Dsrc/pip/_vendor \
            "
=20
 SRC_URI[sha256sum] =3D "c4037d8a277c89b320abe636d59f91e6d0922d08a05b60e8=
5e53b296613346d8"
--=20
2.53.0

