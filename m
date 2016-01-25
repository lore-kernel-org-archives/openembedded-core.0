Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f175.google.com (mail-qk0-f175.google.com
	[209.85.220.175])
	by mail.openembedded.org (Postfix) with ESMTP id 086CD6FFCD
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jan 2016 19:15:22 +0000 (UTC)
Received: by mail-qk0-f175.google.com with SMTP id x1so58393358qkc.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jan 2016 11:15:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=9VZRqClQx5Eejuk5LLJGxMFTAJtdZAE6l70M4uNBG40=;
	b=jAhxMnrICLFY96Xigwy7JVm36gxrM0zAP59femIqcC3hcTW5RTPO+VcmIjSc+AqAdu
	FYyObsOQwJ3OUDYd1Fa/oWoB68/63d2X4eCEZH/tSAZenArd8OUECe1nUathKipWbFEP
	A/C3OZN2wYSKNh7IIQLEHSgheuK+mToWAcHTh4zsL2LASa3wf+tRI8TuAjTEPqS2XcbE
	IGF2OsYQhMnT/F8t0jKevhsR8HDvrR8qrOIvafAFie0AUDXy2ythL9qrZbZia/uoxSHk
	AaJ4K/nLmFTHDmLoCOSN3pFt04yfQpF0RlbiX0BFKZArSzf1L9Zq/d+iZxz3PqCwNArD
	A2kA==
X-Gm-Message-State: AG10YORRj0MP+PBp8VH3Rw0Nv4+mxLey5diRV05zhoAglp4wIwJQrdbgyKOR5klZAmzYjw==
X-Received: by 10.55.73.68 with SMTP id w65mr22778668qka.68.1453749323271;
	Mon, 25 Jan 2016 11:15:23 -0800 (PST)
Received: from build-slave.star.lab (c-73-172-178-168.hsd1.md.comcast.net.
	[73.172.178.168]) by smtp.gmail.com with ESMTPSA id
	d65sm9281657qgf.30.2016.01.25.11.15.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 25 Jan 2016 11:15:22 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-core@lists.openembedded.org
Date: Mon, 25 Jan 2016 14:15:09 -0500
Message-Id: <1453749309-17301-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 1.9.1
Cc: Derek Straka <derek@asterius.io>
Subject: [fido,dizzy][PATCH] bind: CVE-2015-8704
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 25 Jan 2016 19:15:23 -0000

CVE-2015-8704
Allows remote authenticated users to cause a denial of service via a malformed Address Prefix List record

[YOCTO 8966]

References:
https://kb.isc.org/article/AA-01346/0/BIND-9.10.3-P3-Release-Notes.html
https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2015-8704

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../bind/bind/CVE-2015-8704.patch                  | 38 ++++++++++++++++++++++
 meta/recipes-connectivity/bind/bind_9.9.5.bb       |  1 +
 2 files changed, 39 insertions(+)
 create mode 100644 meta/recipes-connectivity/bind/bind/CVE-2015-8704.patch

diff --git a/meta/recipes-connectivity/bind/bind/CVE-2015-8704.patch b/meta/recipes-connectivity/bind/bind/CVE-2015-8704.patch
new file mode 100644
index 0000000..e05327e
--- /dev/null
+++ b/meta/recipes-connectivity/bind/bind/CVE-2015-8704.patch
@@ -0,0 +1,38 @@
+a buffer size check can cause denial of service under certain circumstances 
+
+[security]
+The following flaw in BIND was reported by ISC:
+
+A buffer size check used to guard against overflow could cause named to exit with an INSIST failure In apl_42.c.
+
+A server could exit due to an INSIST failure in apl_42.c when performing certain string formatting operations.
+
+Upstream-Status: Backport
+CVE: CVE-2015-8704
+
+[The patch is taken from BIND 9.9.8:
+https://bugzilla.redhat.com/show_bug.cgi?id=CVE-2015-8704]
+
+Signed-off-by: Derek Straka <derek@asterius.io>
+diff --git a/lib/dns/rdata/in_1/apl_42.c b/lib/dns/rdata/in_1/apl_42.c
+index bedd38e..28eb7f2 100644
+--- a/lib/dns/rdata/in_1/apl_42.c
++++ b/lib/dns/rdata/in_1/apl_42.c
+@@ -116,7 +116,7 @@ totext_in_apl(ARGS_TOTEXT) {
+ 	isc_uint8_t len;
+ 	isc_boolean_t neg;
+ 	unsigned char buf[16];
+-	char txt[sizeof(" !64000")];
++	char txt[sizeof(" !64000:")];
+ 	const char *sep = "";
+ 	int n;
+ 
+@@ -140,7 +140,7 @@ totext_in_apl(ARGS_TOTEXT) {
+ 		isc_region_consume(&sr, 1);
+ 		INSIST(len <= sr.length);
+ 		n = snprintf(txt, sizeof(txt), "%s%s%u:", sep,
+-			     neg ? "!": "", afi);
++			     neg ? "!" : "", afi);
+ 		INSIST(n < (int)sizeof(txt));
+ 		RETERR(str_totext(txt, target));
+ 		switch (afi) {
diff --git a/meta/recipes-connectivity/bind/bind_9.9.5.bb b/meta/recipes-connectivity/bind/bind_9.9.5.bb
index 79b0397..e367172 100644
--- a/meta/recipes-connectivity/bind/bind_9.9.5.bb
+++ b/meta/recipes-connectivity/bind/bind_9.9.5.bb
@@ -26,6 +26,7 @@ SRC_URI = "ftp://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.gz \
            file://CVE-2015-4620.patch \
            file://CVE-2015-5722.patch \
            file://CVE-2015-8000.patch \
+           file://CVE-2015-8704.patch \ 
 	   "
 
 SRC_URI[md5sum] = "e676c65cad5234617ee22f48e328c24e"
-- 
1.9.1


