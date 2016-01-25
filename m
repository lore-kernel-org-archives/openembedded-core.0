Return-Path: <straka.derek@gmail.com>
Received: from mail-qg0-f47.google.com (mail-qg0-f47.google.com
	[209.85.192.47])
	by mail.openembedded.org (Postfix) with ESMTP id 138D4770A2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jan 2016 19:15:34 +0000 (UTC)
Received: by mail-qg0-f47.google.com with SMTP id b35so116364588qge.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jan 2016 11:15:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=0KcGT5i571NH5T61KeaeehNPaH+ga+D2Df9egZkl0AE=;
	b=fOba8Cpelt9ptcpEEzrjS4/LaSO/fg4Hr7bTJasPlXFxuOEPIT6Kh8J9cFuCxbjjEN
	4UAmqXsHkQokA7sKJkT++Aoedh1+xSHHwjOOPN8H1vWVYaAOTm1zFNSKYUfHwxHjiymk
	yijs6ukvK+0HwRaDi28ASWE+0F3h5fatBknRDM57QL98CSZLlAfM5L6zbRW0JNFrRcxW
	wiV9C0G9Ew9O5JO3L43CRkFxREA+nJtq66rS3WcZatmUOLbRnHb46yQw4jT8u1d3QkKX
	FNbZd18Fh7w0LcmB22AXxvrerhR7Bb4FYbyeuHlKT+ynxm7XiMCEPmpGAKTqCtvMEvOw
	gWkg==
X-Gm-Message-State: AG10YOSJTV0RtRaUt+DLWSKNapl24HFZTTwKy3Hth60OkzU5IwUwCx/KPaWurYn7lZTrWg==
X-Received: by 10.140.177.8 with SMTP id x8mr24654880qhx.38.1453749335283;
	Mon, 25 Jan 2016 11:15:35 -0800 (PST)
Received: from build-slave.star.lab (c-73-172-178-168.hsd1.md.comcast.net.
	[73.172.178.168]) by smtp.gmail.com with ESMTPSA id
	z138sm9227911qhb.7.2016.01.25.11.15.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 25 Jan 2016 11:15:34 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-core@lists.openembedded.org
Date: Mon, 25 Jan 2016 14:15:28 -0500
Message-Id: <1453749328-23041-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 1.9.1
Cc: Derek Straka <derek@asterius.io>
Subject: [jethro][PATCH] bind: CVE-2015-8704 and CVE-2015-8705
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
X-List-Received-Date: Mon, 25 Jan 2016 19:15:35 -0000

CVE-2015-8704:
Allows remote authenticated users to cause a denial of service via a malformed Address Prefix List record

CVE-2015-8705:
When debug logging is enabled, allows remote attackers to cause a denial of service or have possibly unspecified impact via OPT data or ECS option

[YOCTO 8966]

References:
https://kb.isc.org/article/AA-01346/0/BIND-9.10.3-P3-Release-Notes.html
https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2015-8704
https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2015-8705

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../bind/bind/CVE-2015-8704.patch                  | 28 ++++++++++++++
 .../bind/bind/CVE-2015-8705.patch                  | 44 ++++++++++++++++++++++
 meta/recipes-connectivity/bind/bind_9.10.2-P4.bb   |  2 +
 3 files changed, 74 insertions(+)
 create mode 100644 meta/recipes-connectivity/bind/bind/CVE-2015-8704.patch
 create mode 100644 meta/recipes-connectivity/bind/bind/CVE-2015-8705.patch

diff --git a/meta/recipes-connectivity/bind/bind/CVE-2015-8704.patch b/meta/recipes-connectivity/bind/bind/CVE-2015-8704.patch
new file mode 100644
index 0000000..d5bf740
--- /dev/null
+++ b/meta/recipes-connectivity/bind/bind/CVE-2015-8704.patch
@@ -0,0 +1,28 @@
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
+[The patch is taken from BIND 9.10.3:
+https://bugzilla.redhat.com/show_bug.cgi?id=CVE-2015-8704]
+
+Signed-off-by: Derek Straka <derek@asterius.io>
+diff --git a/lib/dns/rdata/in_1/apl_42.c b/lib/dns/rdata/in_1/apl_42.c
+index bedd38e..28eb7f2 100644
+--- a/lib/dns/rdata/in_1/apl_42.c
++++ b/lib/dns/rdata/in_1/apl_42.c
+@@ -116,7 +116,7 @@ totext_in_apl(ARGS_TOTEXT) {
+	isc_uint8_t len;
+	isc_boolean_t neg;
+	unsigned char buf[16];
+-	char txt[sizeof(" !64000")];
++	char txt[sizeof(" !64000:")];
+	const char *sep = "";
+	int n;
diff --git a/meta/recipes-connectivity/bind/bind/CVE-2015-8705.patch b/meta/recipes-connectivity/bind/bind/CVE-2015-8705.patch
new file mode 100644
index 0000000..c4a052d
--- /dev/null
+++ b/meta/recipes-connectivity/bind/bind/CVE-2015-8705.patch
@@ -0,0 +1,44 @@
+a crash or assertion failure can during format processing 
+
+[security]
+The following flaw in BIND was reported by ISC:
+
+In versions of BIND 9.10, errors can occur when OPT pseudo-RR data or ECS options are formatted to text. In 9.10.3 through 9.10.3-P2, the issue may result in a REQUIRE assertion failure in buffer.c.
+
+This issue can affect both authoritative and recursive servers if they are performing debug logging. (It may also crash related tools which use the same code, such as dig or delv.)
+
+A server could exit due to an INSIST failure in apl_42.c when performing certain string formatting operations.
+
+Upstream-Status: Backport
+CVE: CVE-2015-8705
+
+[The patch is taken from BIND 9.10.3:
+https://bugzilla.redhat.com/show_bug.cgi?id=CVE-2015-8705]
+
+Signed-off-by: Derek Straka <derek@asterius.io>
+diff --git a/lib/dns/message.c b/lib/dns/message.c
+index ea7b93a..810c58e 100644
+--- a/lib/dns/message.c
++++ b/lib/dns/message.c
+@@ -3310,9 +3310,19 @@
+ 			} else if (optcode == DNS_OPT_SIT) {
+ 				ADD_STRING(target, "; SIT");
+ 			} else if (optcode == DNS_OPT_CLIENT_SUBNET) {
++				isc_buffer_t ecsbuf;
+ 				ADD_STRING(target, "; CLIENT-SUBNET: ");
+-				render_ecs(&optbuf, target);
+-				ADD_STRING(target, "\n");
++				isc_buffer_init(&ecsbuf,
++							isc_buffer_current(&optbuf),
++							optlen);
++				isc_buffer_add(&ecsbuf, optlen);
++				result = render_ecs(&ecsbuf, target);
++				if (result == ISC_R_NOSPACE)
++					return (result);
++				if (result == ISC_R_SUCCESS) {
++					isc_buffer_forward(&optbuf, optlen);
++                                        ADD_STRING(target, "\n");
++                }
+ 				continue;
+ 			} else if (optcode == DNS_OPT_EXPIRE) {
+ 				if (optlen == 4) {
diff --git a/meta/recipes-connectivity/bind/bind_9.10.2-P4.bb b/meta/recipes-connectivity/bind/bind_9.10.2-P4.bb
index 1e1e726..c9a7acd 100644
--- a/meta/recipes-connectivity/bind/bind_9.10.2-P4.bb
+++ b/meta/recipes-connectivity/bind/bind_9.10.2-P4.bb
@@ -21,6 +21,8 @@ SRC_URI = "ftp://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.gz \
            file://bind-ensure-searching-for-json-headers-searches-sysr.patch \
            file://0001-gen.c-extend-DIRNAMESIZE-from-256-to-512.patch \
            file://0001-lib-dns-gen.c-fix-too-long-error.patch \
+           file://CVE-2015-8704.patch \
+           file://CVE-2015-8705.patch \
            "
 
 SRC_URI[md5sum] = "8b1f5064837756c938eadc1537dec5c7"
-- 
1.9.1


