Return-Path: <fabio.berton@ossystems.com.br>
Received: from mail-qg0-f67.google.com (mail-qg0-f67.google.com
	[209.85.192.67])
	by mail.openembedded.org (Postfix) with ESMTP id B119F60111
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Apr 2016 12:51:33 +0000 (UTC)
Received: by mail-qg0-f67.google.com with SMTP id j35so7340084qge.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Apr 2016 05:51:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:organization;
	bh=R318Zm3hk7HKqYAfcmCRb/HX0p3X84bjc3H8lADK6vk=;
	b=uW5bTSzGJNUtY+7ngwFml8t4JVMJQbg0NtEEKhh9EvrWtoFFrF6+XniFjCOyuRIrty
	+/VPH9IVHIRcgAfNkAhX8wO2UDgev9aLp/n8ov6NfLRbA0ZUIkyrfgpSN4l0eZHI5R3S
	6Swm9uyWKQk+UyZK7R8o7NSurAAMmvWecVVhiMTvCgdWBnmIVlgSaBrEbLM7raGhrVVU
	WJUpMV4zoVWIkCOq9M3MnxybiBwa/je9NuPorxHgAAbJVyaEaI8uzdkbgYlRMFfDu8NV
	HbGURRYECdEnFZzllUBqnIskKnv7zBlic14F3xqUzy0ZU8Oa/wGzOuBNab938lfE1y5T
	fiwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:organization;
	bh=R318Zm3hk7HKqYAfcmCRb/HX0p3X84bjc3H8lADK6vk=;
	b=HFJwI2VtLb8HSF6opF9vvw/Y0hI6EaGHNs80j/lAR6WNHLs4UvkHV9qYCvWJR+W5s5
	eNdGOQADSmY+hmbVu0qQP2flGhzGle60/5d3ggyUtzY17RfXC0qVpZLlTZW5wggQh5vu
	JD81OUtp4kSb/8SFcJtzNe96LxBdSWWVpzBLM1xD5qHr3kiEjPJfMcVrR+WfPUxobS6X
	upam/LUsvDn2TJFroWuWFyKReEQm2P9ijQ+tBgqsDFyyyg80CYeVyt9tc2dLLR43nXIL
	1jBJ8FdRvbfR9USqG1f6g2FOmSJMMZZaoMDOwvyEJv0c3vaFEpnGJgoBlBNzNtu2UBni
	ZL3Q==
X-Gm-Message-State: AOPr4FW6Ts3PQniOb+MxQOa7MzvZqWjoM73dcGeIMdvgPo+9j0q8ifMcks3Ji1YuOw81pg==
X-Received: by 10.140.93.9 with SMTP id c9mr17602315qge.74.1460638293851;
	Thu, 14 Apr 2016 05:51:33 -0700 (PDT)
Received: from monster.lab.ossystems.com.br ([187.23.154.250])
	by smtp.gmail.com with ESMTPSA id
	t32sm9171062qgd.43.2016.04.14.05.51.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 14 Apr 2016 05:51:32 -0700 (PDT)
From: Fabio Berton <fabio.berton@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Thu, 14 Apr 2016 09:51:06 -0300
Message-Id: <1460638266-19801-1-git-send-email-fabio.berton@ossystems.com.br>
X-Mailer: git-send-email 2.1.4
Organization: O.S. Systems Software LTDA.
Subject: [PATCH] dhcp: Enable update-rc.d service
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
X-List-Received-Date: Thu, 14 Apr 2016 12:51:34 -0000

do_install_append function installs init scripts but to enable this
service we need to inherit update-rc.d class and set INITSCRIPT name
and params.

Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
---
 meta/recipes-connectivity/dhcp/dhcp.inc | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/dhcp/dhcp.inc b/meta/recipes-connectivity/dhcp/dhcp.inc
index 5703f1e..5e396f1 100644
--- a/meta/recipes-connectivity/dhcp/dhcp.inc
+++ b/meta/recipes-connectivity/dhcp/dhcp.inc
@@ -24,7 +24,7 @@ SRC_URI = "ftp://ftp.isc.org/isc/dhcp/${PV}/dhcp-${PV}.tar.gz \
 UPSTREAM_CHECK_URI = "ftp://ftp.isc.org/isc/dhcp/"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+\.\d+\.(\d+?))/"
 
-inherit autotools systemd useradd
+inherit autotools systemd useradd update-rc.d
 
 USERADD_PACKAGES = "${PN}-server"
 USERADD_PARAM_${PN}-server = "--system --no-create-home --home-dir /var/run/${PN} --shell /bin/false --user-group ${PN}"
@@ -36,6 +36,10 @@ SYSTEMD_AUTO_ENABLE_${PN}-server = "disable"
 SYSTEMD_SERVICE_${PN}-relay = "dhcrelay.service"
 SYSTEMD_AUTO_ENABLE_${PN}-relay = "disable"
 
+INITSCRIPT_PACKAGES = "dhcp-server"
+INITSCRIPT_NAME_dhcp-server = "dhcp-server"
+INITSCRIPT_PARAMS_dhcp-server = "defaults"
+
 TARGET_CFLAGS += "-D_GNU_SOURCE"
 EXTRA_OECONF = "--with-srv-lease-file=${localstatedir}/lib/dhcp/dhcpd.leases \
                 --with-srv6-lease-file=${localstatedir}/lib/dhcp/dhcpd6.leases \
-- 
2.1.4


