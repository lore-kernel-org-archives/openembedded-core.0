Received: from mailrelay-b-egress6.pub.mailoutpod2-cph3.one.com (mailrelay-b-egress6.pub.mailoutpod2-cph3.one.com [193.202.110.165])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5034.1792755380288508566
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Oct 2026 04:36:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@embetrix.com header.s=rsa1 header.b=bANO6meu;
 dkim=pass header.i=@embetrix.com header.s=ed1 header.b=CqeBdnaO;
 spf=none, err=permanent DNS error (domain: embetrix.com, ip: 193.202.110.165, mailfrom: ayoub.zaki@embetrix.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1792755378; x=1793360178;
	d=embetrix.com; s=rsa1;
	h=content-transfer-encoding:mime-version:message-id:date:subject:cc:to:from:
	 from;
	bh=big5HHWA9XV1AsjZrJTJ24HYMJ9+TiCQFjyEnGWBMWc=;
	b=bANO6meuHrpQ7KnA+aMWp0+M1dkvrLnJAN9Tm4NdYsz59vRN7LQrniQl56lPwm5VOKt8DGSzrFJrX
	 5ESlzq5TVie6EXfAuCtHVEB158drMGkrfm5lZITxMs8rg4NppFv/5CcN502vXVsSVLTJUNq3ITWcE8
	 n7344yzHTC91Xg+xhb1Bqe1noceHwJCBmjnq8lhmFBvouguxqxHwehnI0N1eeTSC7ADLhZqwIvOnoY
	 qKTQuwCQFAf37b2AQltv9e/HBzLtFQKK7nc4q2jQycQgl+LDHacCwfo3rD0/HFfQdGKybirVdkfTXO
	 7xEnWhgEc0QLxpSC+egUAzUFqHABTSw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1792755378; x=1793360178;
	d=embetrix.com; s=ed1;
	h=content-transfer-encoding:mime-version:message-id:date:subject:cc:to:from:
	 from;
	bh=big5HHWA9XV1AsjZrJTJ24HYMJ9+TiCQFjyEnGWBMWc=;
	b=CqeBdnaOtU7SDGQi7npP44MLnL7pHJ9oP6Ui6WDJA4H8eaHHSdd3NnVVIMOHERZic+9ysuJYNBoPy
	 NqiadSTBg==
X-HalOne-ID: f533b16a-ced5-11f1-9414-adacc84a9bfa
Received: from xps-13.fritz.box (dynamic-2a02-3102-8c10-1ae0-7233-a9ee-ebe1-8fdc.310.pool.telefonica.de [2a02:3102:8c10:1ae0:7233:a9ee:ebe1:8fdc])
	by mailrelay2.pub.mailoutpod3-cph3.one.com (Halon) with ESMTPSA
	id f533b16a-ced5-11f1-9414-adacc84a9bfa;
	Fri, 23 Oct 2026 11:36:18 +0000 (UTC)
From: "Ayoub Zaki" <ayoub.zaki@embetrix.com>
To: openembedded-core@lists.openembedded.org
Cc: Paul Barker <paul@pbarker.dev>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Ayoub Zaki <ayoub.zaki@embetrix.com>
Subject: [scarthgap][PATCH] ca-certificates: Disable compromised CA certificates
Date: Fri, 23 Oct 2026 13:36:14 +0200
Message-ID: <20261023113614.178667-3-ayoub.zaki@embetrix.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 23 Oct 2026 13:40:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248553
Content-Type: text/plain; charset="utf-8"

From: Paul Barker <paul@pbarker.dev>

Backported a patch to address the eMudhra Intermediate CA Compromise
disclosed at https://emudhra.we-have-a-problem.com. As this is a
certificate authority compromise rather than a software flaw it doesn't
have a CVE number, but this should be treated like a CVE fix.

This is a backport rather than a version bump as Debian did a
"non-maintainer upload" 20260816+nmu1 instead of a typical new version
release.

(cherry picked from commit c5098a7074996258e448bc6cf3d4fb1a708f7a42)

Signed-off-by: Paul Barker <paul@pbarker.dev>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Ayoub Zaki <ayoub.zaki@embetrix.com>
---
 ...-ECC-Root-CA-G3-and-Comodo-AAA-Servi.patch | 35 +++++++++++++++++++
 .../ca-certificates_20260816.bb               |  1 +
 2 files changed, 36 insertions(+)
 create mode 100644 meta/recipes-support/ca-certificates/ca-certificates/0001-Blacklist-emSign-ECC-Root-CA-G3-and-Comodo-AAA-Servi.patch

diff --git a/meta/recipes-support/ca-certificates/ca-certificates/0001-Blacklist-emSign-ECC-Root-CA-G3-and-Comodo-AAA-Servi.patch b/meta/recipes-support/ca-certificates/ca-certificates/0001-Blacklist-emSign-ECC-Root-CA-G3-and-Comodo-AAA-Servi.patch
new file mode 100644
index 0000000000..9a0258919a
--- /dev/null
+++ b/meta/recipes-support/ca-certificates/ca-certificates/0001-Blacklist-emSign-ECC-Root-CA-G3-and-Comodo-AAA-Servi.patch
@@ -0,0 +1,35 @@
+From d5e08f63b1ca6746a51e62cda4df5483c0d3e2ec Mon Sep 17 00:00:00 2001
+From: Paul Barker <paul@pbarker.dev>
+Date: Wed, 21 Oct 2026 07:16:23 +0100
+Subject: [PATCH] Blacklist "emSign ECC Root CA - G3" and "Comodo AAA Services
+ root"
+
+[PB: Backported to address the eMudhra Intermediate CA Compromise
+     disclosed at https://emudhra.we-have-a-problem.com. As this is a
+     certificate authority compromise rather than a software flaw it
+     doesn't have a CVE number, but this should be treated like a CVE
+     fix.]
+
+Upstream-Status: Backport [https://salsa.debian.org/debian/ca-certificates/-/commit/4a0203e5ce4ce1a064b97387f52ca6a00c97185c]
+Signed-off-by: Paul Barker <paul@pbarker.dev>
+---
+ mozilla/blacklist.txt | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/mozilla/blacklist.txt b/mozilla/blacklist.txt
+index d84ceb919906..ba3635f7af87 100644
+--- a/mozilla/blacklist.txt
++++ b/mozilla/blacklist.txt
+@@ -3,4 +3,9 @@
+ # Blacklist explicitly distrusted certificates to explicitly ignore them and prevent build errors
+ "Explicitly Distrust DigiNotar Root CA"
+ 
++# Blacklist "emSign ECC Root CA - G3" (cf. #1151413)
++"emSign ECC Root CA - G3"
++# Blacklist "Comodo AAA Services root" (cf. #1151413)
++"Comodo AAA Services root"
++
+ # Expired CAs
+-- 
+2.43.0
+
diff --git a/meta/recipes-support/ca-certificates/ca-certificates_20260816.bb b/meta/recipes-support/ca-certificates/ca-certificates_20260816.bb
index 33ca9291f4..6291fab0a1 100644
--- a/meta/recipes-support/ca-certificates/ca-certificates_20260816.bb
+++ b/meta/recipes-support/ca-certificates/ca-certificates_20260816.bb
@@ -19,6 +19,7 @@ SRC_URI = "${DEBIAN_MIRROR}/main/c/ca-certificates/${BPN}_${PV}.tar.xz \
            file://0001-update-ca-certificates-don-t-use-Debianisms-in-run-p.patch \
            file://0003-update-ca-certificates-use-relative-symlinks-from-ET.patch \
            file://0001-Revert-mozilla-certdata2pem.py-print-a-warning-for-e.patch \
+           file://0001-Blacklist-emSign-ECC-Root-CA-G3-and-Comodo-AAA-Servi.patch \
            "
 S = "${WORKDIR}/ca-certificates"
 inherit allarch

base-commit: c9b000059a37241c5b97426f0aadc012b13bd20f
-- 
2.53.0

