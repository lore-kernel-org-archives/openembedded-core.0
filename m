Return-Path: <diego.rondini@kynetics.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 6F2AD7CF88
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Sep 2019 09:31:10 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id w13so1870581wru.7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Sep 2019 02:31:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kynetics-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=1EYOAIRVwyNpusZmcqbf9DVyzB9mQc3XCFjN/BaUg88=;
	b=RIJhVQI0qkIgC3SxDzKV3Ba1uz8L0ssV6g+hr7HZSnpI+/f7dMU3bG5F4Q/tQfeRah
	xBoO57fgu9ki1rxNdEICMsi+vyCJ1uBtciG6sJ1Cl+5Y16K7bTE28mALGzhFfzvZc1e0
	1ha8+ZSQxtZBVkfzQICiSisjLZZn40K53AyXV7uKuv1hBzOFLVnDZL8JpqACzXjjGUQZ
	D6oiPaOMiw5R+9agX3bWxYYC4ttEmf+F4BEIrEovn70XMEYi8VVH4TrN1/nEKHjhi12Z
	ycYI4uGRs/esQN2FI5RRFEptwHQcM7miDj5X5eKrHj9XEg8yTz32Z36CkrlHITXN57Tn
	u+Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=1EYOAIRVwyNpusZmcqbf9DVyzB9mQc3XCFjN/BaUg88=;
	b=Arra2lFfo6wHLKM7sFlXpAxq0N/qgIjWsujYz0jfd7vgFQhneXQZIgTGtMXaSjZIES
	hbMOs3VU8By3xr1i3DZjKd0lbjR6l2Dfn6emes5PVGOF5DJiJCg7iOfrLA6uyCuN/L+p
	89ZMtv0lrz8Zc+/wcE3MwXhJVYL0vxvd82s+ncYTJZ5jhFN0YundcNsXg3ZYmP1pKVjd
	Syt+pNl1axaIjXwqIDtQZk3cx0oLQp4jU1Va2M0nUncK3bfSzGyP6ISEGD4dUjF9OQpa
	IY4xPVTd7XFks4duEAVWv66pCmG5xQb39MO2tIokZXXC4P81qSJzUu+S46SZAijASogb
	lYaA==
X-Gm-Message-State: APjAAAULBOttCPjRNIKNsLTLPmqz2ziNa93ZrMuRBxQZX3Ddopy1hAf5
	jAMnNVgdQWkM4R+e5HU2e5GokftkTIuisbvpcx0=
X-Google-Smtp-Source: APXvYqw6XGYG7vw3uaqIwzH03OBlT73Truy30jYznoLuIdAgHL02VBWA5+kjTSAWswFNIv9wG0qaAg==
X-Received: by 2002:a5d:49c7:: with SMTP id t7mr997959wrs.229.1567675870636;
	Thu, 05 Sep 2019 02:31:10 -0700 (PDT)
Received: from ip-172-31-11-87.eu-west-1.compute.internal
	(ec2-18-202-30-185.eu-west-1.compute.amazonaws.com. [18.202.30.185])
	by smtp.gmail.com with ESMTPSA id s9sm1041157wme.36.2019.09.05.02.31.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 05 Sep 2019 02:31:09 -0700 (PDT)
From: Diego Rondini <diego.rondini@kynetics.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Sep 2019 09:31:01 +0000
Message-Id: <1567675861-18282-1-git-send-email-diego.rondini@kynetics.com>
X-Mailer: git-send-email 2.7.4
Cc: Jack Mitchell <jack@embed.me.uk>,
	Diego Rondini <diego.rondini@kynetics.com>
Subject: [PATCH] iptables: add systemd helper unit to load/restore rules
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
X-List-Received-Date: Thu, 05 Sep 2019 09:31:10 -0000

From: Jack Mitchell <jack@embed.me.uk>

There is currently no way to automatically load iptables rules in OE.
Add a systemd unit file to automatically load rules on network
connection. This is cribbed from the way ArchLinux handles iptables with
some minor modifications for OE.
New rules can be generated directly on the target using:
Good documentation for writing rules offline is lacking, but the basics
are explained here:
https://unix.stackexchange.com/q/400163/49405

Signed-off-by: Jack Mitchell <jack@embed.me.uk>
Signed-off-by: Diego Rondini <diego.rondini@kynetics.com>
---
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


