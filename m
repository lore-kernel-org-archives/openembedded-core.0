Return-Path: <diego.rondini@kynetics.com>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id 9C0247F168
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Sep 2019 09:35:42 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id r195so2095979wme.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Sep 2019 02:35:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kynetics-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=b7sOEjYeDhGfr7F7WYpj9xkonDcpbPwk+iCPMy0Yjfo=;
	b=XzcfAC7G38weP3h3xPF525sTPNnBLJ6fd/B2sGpSrlY4/Auyyi1U+cLdfvIxvvMWif
	8RfDEG6KmIKGQkYBKdZBHU4VucdeSho+2KixnlDCkCQxv9dOIu8L8Xi8BfAvXdeePXhi
	F15Ne5ZT0ETZ8GPPBg686A+Ay2dB3VxNfcqujNUi3Zm6fYj6GG7f0T2Q5wPMZprDgw5g
	0wgnmSF1qzJHjk17IRw/037/BDr0XOF9YZpLJGBvoaCVuiqnOvFuFGTRb+akppXe5xrs
	oGu15H3rCW/xompQkceEyH4Luib+DBqiDVG6c3I4n1uKByERz0KkQTMvlVJmBNiUGDHB
	EteQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=b7sOEjYeDhGfr7F7WYpj9xkonDcpbPwk+iCPMy0Yjfo=;
	b=SmUgUQk4x9pxT4klRuXJRVtShGcjadEteT2qcmc2mkO2GH980XtwK5ZW33xjEGINqP
	lCpRW+Im5Wwyr2Ge/20DzWjUWeN4F0IkeMu5SFqjsx6DA0rtzpzFLGi1o8w+MYx5n9Y0
	4mskpB56F869J1ceLfc+JE+AfnZGFb/GriremOIjVnMFRYzFKORJmxDZAiEc9sHAV29E
	uTgCqyz8MZVt+sGxeyZuQhyljWbvVq6Y2DD9JBIfJKfzEIt09q5tSM1ECZq/hxS05I25
	IHkuII+KzQIK9nJCH2s7ciXsyk++kUP8s9WfMkpWmV6b1ZIFnqkS7tJknNkbNTgkYTKS
	8cFg==
X-Gm-Message-State: APjAAAXWAjnWsjjeJ5HTg6+cpNx8g1JwEYnoUCB0VEQFPk78ij5A7PwS
	SSqEC8V+azcTUDY5UZNR4S2KEEnu9twz7mH0rtQ=
X-Google-Smtp-Source: APXvYqzFKsk45tEt2TVt357PSPf0mbZwTH0MON9EMPM3P4IbgC8VbDQaP4ucjH8aDejNHnWisM7A3g==
X-Received: by 2002:a1c:f607:: with SMTP id w7mr2195510wmc.84.1567676142881;
	Thu, 05 Sep 2019 02:35:42 -0700 (PDT)
Received: from ip-172-31-11-87.eu-west-1.compute.internal
	(ec2-18-202-30-185.eu-west-1.compute.amazonaws.com. [18.202.30.185])
	by smtp.gmail.com with ESMTPSA id
	e15sm1331836wrj.74.2019.09.05.02.35.42
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 05 Sep 2019 02:35:42 -0700 (PDT)
From: Diego Rondini <diego.rondini@kynetics.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Sep 2019 09:35:37 +0000
Message-Id: <1567676137-18355-1-git-send-email-diego.rondini@kynetics.com>
X-Mailer: git-send-email 2.7.4
Cc: Jack Mitchell <jack@embed.me.uk>,
	Diego Rondini <diego.rondini@kynetics.com>
Subject: [PATCH v2] iptables: add systemd helper unit to load/restore rules
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
X-List-Received-Date: Thu, 05 Sep 2019 09:35:42 -0000

From: Jack Mitchell <jack@embed.me.uk>

There is currently no way to automatically load iptables rules in OE.
Add a systemd unit file to automatically load rules on network
connection. This is cribbed from the way ArchLinux handles iptables with
some minor modifications for OE.
New rules can be generated directly on the target using:
# iptables-save -f /etc/iptables/iptables.rules
Good documentation for writing rules offline is lacking, but the basics
are explained here:
https://unix.stackexchange.com/q/400163/49405

Signed-off-by: Jack Mitchell <jack@embed.me.uk>
Signed-off-by: Diego Rondini <diego.rondini@kynetics.com>
---
Changes in v2: fixed missing line about rules generation on target.

Original patch has been posted 3 years ago, but never got approved. I'm posting
a rebased patch, including the changes requested in the comments.
https://patchwork.openembedded.org/patch/131285/

 meta/recipes-extended/iptables/iptables/iptables.rules  |  0
 .../recipes-extended/iptables/iptables/iptables.service | 13 +++++++++++++
 meta/recipes-extended/iptables/iptables_1.8.3.bb        | 17 ++++++++++++++++-
 3 files changed, 29 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-extended/iptables/iptables/iptables.rules
 create mode 100644 meta/recipes-extended/iptables/iptables/iptables.service

diff --git a/meta/recipes-extended/iptables/iptables/iptables.rules b/meta/recipes-extended/iptables/iptables/iptables.rules
new file mode 100644
index 0000000..e69de29
diff --git a/meta/recipes-extended/iptables/iptables/iptables.service b/meta/recipes-extended/iptables/iptables/iptables.service
new file mode 100644
index 0000000..041316e
--- /dev/null
+++ b/meta/recipes-extended/iptables/iptables/iptables.service
@@ -0,0 +1,13 @@
+[Unit]
+Description=Packet Filtering Framework
+Before=network-pre.target
+Wants=network-pre.target
+
+[Service]
+Type=oneshot
+ExecStart=@SBINDIR@/iptables-restore /etc/iptables/iptables.rules
+ExecReload=@SBINDIR@/iptables-restore /etc/iptables/iptables.rules
+RemainAfterExit=yes
+
+[Install]
+WantedBy=multi-user.target
diff --git a/meta/recipes-extended/iptables/iptables_1.8.3.bb b/meta/recipes-extended/iptables/iptables_1.8.3.bb
index 6ac3fc6..ff9fcb1 100644
--- a/meta/recipes-extended/iptables/iptables_1.8.3.bb
+++ b/meta/recipes-extended/iptables/iptables_1.8.3.bb
@@ -10,12 +10,14 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263\
 SRC_URI = "http://netfilter.org/projects/iptables/files/iptables-${PV}.tar.bz2 \
            file://0001-configure-Add-option-to-enable-disable-libnfnetlink.patch \
            file://0002-configure.ac-only-check-conntrack-when-libnfnetlink-enabled.patch \
+           file://iptables.service \
+           file://iptables.rules \
 "
 
 SRC_URI[md5sum] = "29de711d15c040c402cf3038c69ff513"
 SRC_URI[sha256sum] = "a23cac034181206b4545f4e7e730e76e08b5f3dd78771ba9645a6756de9cdd80"
 
-inherit autotools pkgconfig
+inherit autotools pkgconfig systemd
 
 EXTRA_OECONF = "--with-kernel=${STAGING_INCDIR}"
 
@@ -56,6 +58,19 @@ INSANE_SKIP_${PN}-module-xt-ct = "dev-so"
 
 ALLOW_EMPTY_${PN}-modules = "1"
 
+do_install_append() {
+
+        install -d ${D}${sysconfdir}/iptables
+        install -m 0644 ${WORKDIR}/iptables.rules ${D}${sysconfdir}/iptables
+
+        install -d ${D}${systemd_system_unitdir}
+        install -m 0644 ${WORKDIR}/iptables.service ${D}${systemd_system_unitdir}
+
+	sed -i -e 's,@SBINDIR@,${sbindir},g' ${D}${systemd_system_unitdir}/iptables.service
+}
+
+SYSTEMD_SERVICE_${PN} = "iptables.service"
+
 RDEPENDS_${PN} = "${PN}-module-xt-standard"
 RRECOMMENDS_${PN} = " \
     ${PN}-modules \
-- 
2.7.4


