Return-Path: <alex.kiernan@gmail.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id AE29260844
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Feb 2020 07:22:04 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id k11so10846384wrd.9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Feb 2020 23:22:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=RdOuwWbasDlBHKWV3NL+BNzz4AyrKpDAbyrw22GHJ50=;
	b=VB0ObUzTyTNGbAUehp/xEhY0nMeVsqtwVLi9NRwIxCXqpsfGjufpBJuQMNdFBreSe7
	quvtM8sSMrEPXoKzpB0efxHiTMhQPzRDBAKRHU2AD6PGIu1krr5GEoDFKbmOjoRpuKsa
	yWygL3mAI+vVtFM/fMF5KklfrQSKEEj+CM8DDG/VC7tZmAzG9kbjmqwys4Rtwz8h02TJ
	D6xLg4eFjd35SQrVHnJSjtnP8xiB6aiNvVhq1EhYn+8DGwVm/XNGsGbn+mpCXmcwQx9f
	j6GSJZTpHeS57wGR0Oo+XH/RDPCYaMiU6ZUe0XRzMAipa6SGzjml55L63nGtAUDWkYdL
	+Pvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=RdOuwWbasDlBHKWV3NL+BNzz4AyrKpDAbyrw22GHJ50=;
	b=BfCEQUxhS/X4DaxZCFABoRPP3NysjW8upBw+E5+uMgSao4ma0w/232UTDNt3ZNAru9
	OnXCE4fiDYtsU3MZk12ddjVwjInjX55A6tg57mlmviUjWH5Idp9F3yxr/hsc49p4axtM
	TD7+4vLRj5FUY67yQlbAMXS70rE108jZy4CCvXMmlXB5T3uA5sCiLUTd2ucv+1/PptUs
	UPgdCp9bVGjM8QQKpuS09Y38pCOijPusVJXWbL3fKRIRy7BGCfcmUN4EPJvKp5O/LfP/
	7aI88CNf4Gnt9lhVqA9JYDZLhxKOgBnmgQfSjNQ3gV5xwqRmWfar+YDU2f5+NYeHTD42
	ltuA==
X-Gm-Message-State: APjAAAX2tzVQacDpr14kXx0AF9k20mbHI/JsYHcW9jo0Kbu/ojl9mUu7
	cHi3h+ijl9tMUT1rjo8+YyZnjeuc
X-Google-Smtp-Source: APXvYqxG2qdh/KFFZEDbrVYyA5F3K4MhcAUmMDnhFbzhJZ8MlqTdvwQEm6MjUiWMleeWvkI8HkIFkw==
X-Received: by 2002:adf:fd87:: with SMTP id d7mr7205616wrr.226.1581405724666; 
	Mon, 10 Feb 2020 23:22:04 -0800 (PST)
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net.
	[91.135.6.246]) by smtp.gmail.com with ESMTPSA id
	a22sm2528284wmd.20.2020.02.10.23.22.03
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 10 Feb 2020 23:22:03 -0800 (PST)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 11 Feb 2020 07:22:01 +0000
Message-Id: <20200211072201.80498-1-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] iputils: Fix systemd and ipv6 detection
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
X-List-Received-Date: Tue, 11 Feb 2020 07:22:05 -0000

When systemd is enabled, ensure iputils detects it correctly. Split out
IPv6 only features based on ipv6 enabled in DISTRO_FEATURES.

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

 .../iputils/iputils_s20190709.bb              | 21 +++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-extended/iputils/iputils_s20190709.bb b/meta/recipes-extended/iputils/iputils_s20190709.bb
index e0d2ae160ee0..e671130e4933 100644
--- a/meta/recipes-extended/iputils/iputils_s20190709.bb
+++ b/meta/recipes-extended/iputils/iputils_s20190709.bb
@@ -23,16 +23,20 @@ UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>s\d+)"
 # breaks the version order.
 CVE_CHECK_WHITELIST += "CVE-2000-1213 CVE-2000-1214"
 
-PACKAGECONFIG ??= "libcap libgcrypt rarpd traceroute6"
+PACKAGECONFIG ??= "libcap libgcrypt rarpd \
+                   ${@bb.utils.contains('DISTRO_FEATURES', 'ipv6', 'ninfod traceroute6', '', d)} \
+                   ${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}"
 PACKAGECONFIG[libcap] = "-DUSE_CAP=true, -DUSE_CAP=false, libcap"
 PACKAGECONFIG[libgcrypt] = "-DUSE_CRYPTO=gcrypt, -DUSE_CRYPTO=none, libgcrypt"
 PACKAGECONFIG[libidn] = "-DUSE_IDN=true, -DUSE_IDN=false, libidn2"
 PACKAGECONFIG[gettext] = "-DUSE_GETTEXT=true, -DUSE_GETTEXT=false, gettext"
+PACKAGECONFIG[ninfod] = "-DBUILD_NINFOD=true,-DBUILD_NINFOD=false,"
 PACKAGECONFIG[rarpd] = "-DBUILD_RARPD=true,-DBUILD_RARPD=false,"
+PACKAGECONFIG[systemd] = "-Dsystemdunitdir=${systemd_unitdir}/system,,systemd"
 PACKAGECONFIG[traceroute6] = "-DBUILD_TRACEROUTE6=true,-DBUILD_TRACEROUTE6=false,"
 PACKAGECONFIG[docs] = "-DBUILD_HTML_MANS=true -DBUILD_MANS=true,-DBUILD_HTML_MANS=false -DBUILD_MANS=false, libxslt"
 
-inherit meson update-alternatives
+inherit meson systemd update-alternatives
 
 # Have to disable setcap/suid as its not deterministic
 EXTRA_OEMESON += "--prefix=${root_prefix}/ -DNO_SETCAP_OR_SUID=true"
@@ -42,12 +46,12 @@ ALTERNATIVE_PRIORITY = "100"
 ALTERNATIVE_${PN}-ping = "ping"
 ALTERNATIVE_LINK_NAME[ping] = "${base_bindir}/ping"
 
-SPLITPKGS = "${PN}-ping ${PN}-arping ${PN}-tracepath ${PN}-traceroute6 ${PN}-clockdiff ${PN}-tftpd ${PN}-rarpd ${PN}-rdisc ${PN}-ninfod"
+SPLITPKGS = "${PN}-ping ${PN}-arping ${PN}-tracepath ${PN}-clockdiff ${PN}-tftpd ${PN}-rdisc \
+             ${@bb.utils.contains('PACKAGECONFIG', 'rarpd', '${PN}-rarpd', '', d)} \
+             ${@bb.utils.contains('DISTRO_FEATURES', 'ipv6', '${PN}-traceroute6 ${PN}-ninfod', '', d)}"
 PACKAGES += "${SPLITPKGS}"
 
 ALLOW_EMPTY_${PN} = "1"
-ALLOW_EMPTY_${PN}-rarpd = "1"
-ALLOW_EMPTY_${PN}-traceroute6 = "1"
 RDEPENDS_${PN} += "${SPLITPKGS}"
 
 FILES_${PN} = ""
@@ -57,6 +61,11 @@ FILES_${PN}-tracepath = "${base_bindir}/tracepath"
 FILES_${PN}-traceroute6	= "${base_bindir}/traceroute6"
 FILES_${PN}-clockdiff = "${base_bindir}/clockdiff"
 FILES_${PN}-tftpd = "${base_bindir}/tftpd"
-FILES_${PN}-rarpd = "${base_sbindir}/rarpd"
+FILES_${PN}-rarpd = "${base_sbindir}/rarpd  ${systemd_unitdir}/system/rarpd@.service"
 FILES_${PN}-rdisc = "${base_sbindir}/rdisc"
 FILES_${PN}-ninfod = "${base_sbindir}/ninfod ${sysconfdir}/init.d/ninfod.sh"
+
+SYSTEMD_PACKAGES = "${@bb.utils.contains('DISTRO_FEATURES', 'ipv6', '${PN}-ninfod', '', d)} \
+                    ${PN}-rdisc"
+SYSTEMD_SERVICE_${PN}-ninfod = "ninfod.service"
+SYSTEMD_SERVICE_${PN}-rdisc = "rdisc.service"
-- 
2.17.1


