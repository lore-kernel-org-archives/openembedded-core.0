Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web11.5188.1617791496807741925
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Apr 2021 03:31:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linux.microsoft.com header.s=default header.b=ndvvIsB+;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182, mailfrom: pemorrow@linux.microsoft.com)
Received: from linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net (linux.microsoft.com [13.77.154.182])
	by linux.microsoft.com (Postfix) with ESMTPSA id 1DEB320B5680;
	Wed,  7 Apr 2021 03:31:36 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 1DEB320B5680
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1617791496;
	bh=hfWEyMsU1HPQWDRyaCa5CESPnbBuIw0Q7CZHctbXtxg=;
	h=From:To:Cc:Subject:Date:From;
	b=ndvvIsB+HxBZ9/M3QaLlWpvHQQvFy4jfWsZ5l7SjvlQimX/GlvmXbAZO3MUdD7be+
	 Ae0xQcpBQVMSHtbdKPXujO5H16phdWULYd8tnQX6bRYhhvaD9z74Gl91rkQR1lH4+U
	 equnNOifiJAhXNZu+KSXJhm0QIxRZSsJlcSvsz1s=
From: "Peter Morrow" <pemorrow@linux.microsoft.com>
To: openembedded-core@lists.openembedded.org
Cc: peter.morrow@microsoft.com,
	jpewhacker@gmail.com
Subject: [meta-mingw][PATCH] go: add environment setup batch file for go
Date: Wed,  7 Apr 2021 03:31:07 -0700
Message-Id: <1617791467-4066-1-git-send-email-pemorrow@linux.microsoft.com>
X-Mailer: git-send-email 1.8.3.1

When building the nativesdk for mingw we need to set GOROOT in order to build
anything out of the box.

Signed-off-by: Peter Morrow <pemorrow@linux.microsoft.com>
---
 recipes-devtools/go/go_%.bbappend | 9 +++++++++
 1 file changed, 9 insertions(+)
 create mode 100644 recipes-devtools/go/go_%.bbappend

diff --git a/recipes-devtools/go/go_%.bbappend b/recipes-devtools/go/go_%.bbappend
new file mode 100644
index 0000000..9933108
--- /dev/null
+++ b/recipes-devtools/go/go_%.bbappend
@@ -0,0 +1,9 @@
+do_install_append_class-nativesdk_mingw32() {
+    install -d ${D}${SDKPATHNATIVE}/environment-setup.d
+
+    cat <<EOF > ${D}${SDKPATHNATIVE}/environment-setup.d/go.bat
+set GOROOT=%OECORE_NATIVE_SYSROOT%\\usr\\lib\\${BPN}
+EOF
+}
+
+FILES_${PN}_append_class-nativesdk_mingw32 = " ${SDKPATHNATIVE}/environment-setup.d"
-- 
1.8.3.1

