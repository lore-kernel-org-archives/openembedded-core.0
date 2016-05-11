Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id 0ADB675EE7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2016 17:36:11 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id r187so5033280pfr.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2016 10:36:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=dQY4ffkPYc9gRVv78jHft9y5AZo7WDsdhvfIswNY+28=;
	b=k3+LsXdPpRJFsVsczK7aNlMFXvtWmwSDjB5mwxaODwH7AuBuiLWKXlkKLPNK9NPVSc
	ikeq3pxckVtkUnkxCAv3SSX8Ir0sYZJDEEHoysbo3mkWBTPWD3CmTZrgk78el+Z5sEDE
	nfHX5AKNnEKY2K+4ksNj89zRG/Wds0ArwW+92fakpVELkdiHlXkKHp66vFKQ+eUjpVEh
	QNa+LzItUUW6yT9pLkMoYzNKSVVGDWGFEF48zDELN3KhXiISUyS7v/b14kMzF9s1+LUE
	nzYZxB/hQrHJtVRLrszBy242E0h9OSFhemvuLfslamNqRFlIZDSz1fM3Yy1hUCbKzO82
	ODBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=dQY4ffkPYc9gRVv78jHft9y5AZo7WDsdhvfIswNY+28=;
	b=RQAmhwl4oBNjszQ09MsbncQDZZfWacXTp1kzNB9vucGBlr5xd19uRtCLmjLph4CgLG
	kxVPQ5jr3/n3YZoKORmpBmxrz1UpMZiSrHu4yL5t5cBvXBaOeeQnF/QaJC3zINu/MrjN
	R/y9RR8/Bk8T1EIcLAX3/y13a+u6Ies80zFPm3AhpEh7sEsP5Mh2wK7LMVxsvT0xYDdP
	cSIWd4t7Yibu1YfV7GnHTq66Bit1tFiEO9nQCpr+1A8ZLtrdXmeqd4fUnIML22mAfzHD
	sikTCQ2J4FSMR+lsz5OTHQNLOGuXiwGMLa0gqfERcPPk2/nZ6ha+s67eulBe5Ak1d7r3
	p0VQ==
X-Gm-Message-State: AOPr4FUDfSsi0yryJe6SXl4eSm8Cqe8S6EOmaPvHuqJ9xsRgTzL5mvSPKZ+mkKpoWsn06g==
X-Received: by 10.98.19.151 with SMTP id 23mr6742704pft.62.1462988172079;
	Wed, 11 May 2016 10:36:12 -0700 (PDT)
Received: from haswell.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	a5sm13669903pat.19.2016.05.11.10.36.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 11 May 2016 10:36:11 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 May 2016 10:35:22 -0700
Message-Id: <5a9b3251f88611b241b8ef714465ff283a68d62d.1462987863.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.8.2
In-Reply-To: <2e51e9b5fb3911436afc1becd5feb9351b896fa4.1462987863.git.raj.khem@gmail.com>
References: <2e51e9b5fb3911436afc1becd5feb9351b896fa4.1462987863.git.raj.khem@gmail.com>
In-Reply-To: <cover.1462987863.git.raj.khem@gmail.com>
References: <cover.1462987863.git.raj.khem@gmail.com>
Subject: [PATCH 19/42] systemd: Create missing sysusers offline
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
X-List-Received-Date: Wed, 11 May 2016 17:36:11 -0000

Some system users which are needed by systemd components were missing
create these users knobbed with relevant packageconfig

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/systemd/systemd_229.bb | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd_229.bb b/meta/recipes-core/systemd/systemd_229.bb
index c23c749..a2d35f8 100644
--- a/meta/recipes-core/systemd/systemd_229.bb
+++ b/meta/recipes-core/systemd/systemd_229.bb
@@ -319,10 +319,16 @@ PACKAGES =+ "\
 SYSTEMD_PACKAGES = "${@bb.utils.contains('PACKAGECONFIG', 'binfmt', '${PN}-binfmt', '', d)}"
 SYSTEMD_SERVICE_${PN}-binfmt = "systemd-binfmt.service"
 
-USERADD_PACKAGES = "${PN}"
+USERADD_PACKAGES = "${PN} ${PN}-extra-utils"
 USERADD_PARAM_${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'microhttpd', '--system -d / -M --shell /bin/nologin systemd-journal-gateway;', '', d)}"
+USERADD_PARAM_${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'microhttpd', '--system -d / -M --shell /bin/nologin systemd-journal-remote;', '', d)}"
+USERADD_PARAM_${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'journal-upload', '--system -d / -M --shell /bin/nologin systemd-journal-upload;', '', d)}"
 USERADD_PARAM_${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'timesyncd', '--system -d / -M --shell /bin/nologin systemd-timesync;', '', d)}"
+USERADD_PARAM_${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'networkd', '--system -d / -M --shell /bin/nologin systemd-network;', '', d)}"
+USERADD_PARAM_${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'coredump', '--system -d / -M --shell /bin/nologin systemd-coredump;', '', d)}"
+USERADD_PARAM_${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'resolved', '--system -d / -M --shell /bin/nologin systemd-resolve;', '', d)}"
 GROUPADD_PARAM_${PN} = "-r lock; -r systemd-journal"
+USERADD_PARAM_${PN}-extra-utils += "--system -d / -M --shell /bin/nologin systemd-bus-proxy;"
 
 FILES_${PN}-analyze = "${bindir}/systemd-analyze"
 
-- 
2.8.2


