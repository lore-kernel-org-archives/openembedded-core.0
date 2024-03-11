Return-Path: <enrico.scholz@sigma-chemnitz.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 158C5C54E58
	for <webhook@archiver.kernel.org>; Mon, 11 Mar 2024 17:19:12 +0000 (UTC)
Received: from smtpout.cvg.de (smtpout.cvg.de [87.128.211.67])
 by mx.groups.io with SMTP id smtpd.web11.624.1710177545754415177
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Mar 2024 10:19:08 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@sigma-chemnitz.de header.s=v2022040800 header.b=zx2W5+KJ;
 spf=pass (domain: sigma-chemnitz.de, ip: 87.128.211.67, mailfrom: enrico.scholz@sigma-chemnitz.de)
Received: from mail-mta-3.intern.sigma-chemnitz.de (mail-mta-3.intern.sigma-chemnitz.de [192.168.12.71])
	by mail-out-2.intern.sigma-chemnitz.de (8.17.1/8.17.1) with ESMTPS id 42BHJ3vm166679
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>; Mon, 11 Mar 2024 18:19:03 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sigma-chemnitz.de;
	s=v2022040800; t=1710177543;
	bh=5pS4uC4ictL1nG4AVp3kw+LDUJAODwhk30KVGmTMQ98=; l=2621;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=zx2W5+KJeRT84UZ3Fsnobi203zhPnUtVvuidawLUpn89KagRTQ7/OMq+oCrC4KcVK
	 PxX1o5Prnmtlvimwlkb+z4vFzlrWUCtoSGub7gesZGU8b5E6c/7GEXQJ73ue35fnxW
	 3WA5napYsLWHoNpeXZwpYlvn2gpz1B1RW1nbWMa9uMLSBLHiHFjLsggvufR1yy1cKA
	 +wkTo7Cqw1hAuofQmrcUswshE9Gn82377P74P/6NPmiLV897Vv/IRlFPSdJUxbUcO8
	 XignahVOGw7075PxhkOuK2pwbGQT9bGvZFYQnJ9vnjwi+CU1lDMRECC6aLyyIOUFxF
	 A5ipmxBdWkM2A==
Received: from reddoxx.intern.sigma-chemnitz.de (reddoxx.sigma.local [192.168.16.32])
	by mail-mta-3.intern.sigma-chemnitz.de (8.17.1/8.17.1) with ESMTP id 42BHJ0X7279260
	for <openembedded-core@lists.openembedded.org> from enrico.scholz@sigma-chemnitz.de; Mon, 11 Mar 2024 18:19:00 +0100
Received: from mail-msa-3.intern.sigma-chemnitz.de ([192.168.12.73])
	by reddoxx.intern.sigma-chemnitz.de with ESMTP
	id 0S4GN8JZDX; Mon, 11 Mar 2024 18:18:59 +0100
Received: from ensc-pc.intern.sigma-chemnitz.de (ensc-pc.intern.sigma-chemnitz.de [192.168.3.24])
	by mail-msa-3.intern.sigma-chemnitz.de (8.15.2/8.15.2) with ESMTPS id 42BHIxtr105398
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Mon, 11 Mar 2024 18:18:59 +0100
Received: from ensc by ensc-pc.intern.sigma-chemnitz.de with local (Exim 4.97.1)
	(envelope-from <ensc@sigma-chemnitz.de>)
	id 1rjjIh-00000008xuM-0yAS;
	Mon, 11 Mar 2024 18:18:59 +0100
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-core@lists.openembedded.org
Cc: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Subject: [PATCH 2/7] openssh-config: initial checkin
Date: Mon, 11 Mar 2024 18:18:43 +0100
Message-ID: <507a19c6164d34669ff09794134257835063af64.1710177387.git.enrico.scholz@sigma-chemnitz.de>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1710177387.git.enrico.scholz@sigma-chemnitz.de>
References: <cover.1710177387.git.enrico.scholz@sigma-chemnitz.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-REDDOXX-Id: 65ef3d03b121c496daa8ef76
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Mar 2024 17:19:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196953

From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>

Place OE specific openssh setup (which was removed in a previous
patch) in a configuration snippet.

Signed-off-by: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
---
 .../openssh/openssh-config.bb                 | 30 +++++++++++++++++++
 .../openssh/openssh-config/80-oe.conf         |  5 ++++
 .../openssh/openssh_9.6p1.bb                  |  2 ++
 3 files changed, 37 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssh/openssh-config.bb
 create mode 100644 meta/recipes-connectivity/openssh/openssh-config/80-oe.conf

diff --git a/meta/recipes-connectivity/openssh/openssh-config.bb b/meta/recipes-connectivity/openssh/openssh-config.bb
new file mode 100644
index 000000000000..2ef6a770fcfe
--- /dev/null
+++ b/meta/recipes-connectivity/openssh/openssh-config.bb
@@ -0,0 +1,30 @@
+SUMMARY = "OE openssh configuration"
+DESCRIPTION = "Provides openssh configuration snippets which correspond to IMAGE_FEATURE"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
+
+SRC_URI = "\
+    file://80-oe.conf \
+"
+
+do_install() {
+    d=${D}${sysconfdir}/ssh/sshd_config.d
+    install -d "$d"
+    install -p -m 0644 \
+        ${WORKDIR}/80-oe.conf \
+        "$d"/
+}
+
+python populate_packages:prepend() {
+    dir = d.expand('${sysconfdir}/ssh/sshd_config.d')
+
+    do_split_packages(d, dir, '^60-(.*)\.conf',
+                      output_pattern='${PN}-%s',
+                      description="openssh config for '%s' feature",
+                      extra_depends='',
+                      prepend=True)
+}
+
+PACKAGES_DYNAMIC = "${PN}-*"
+
+FILES:${PN} = "${sysconfdir}/ssh/sshd_config.d/80-oe.conf"
diff --git a/meta/recipes-connectivity/openssh/openssh-config/80-oe.conf b/meta/recipes-connectivity/openssh/openssh-config/80-oe.conf
new file mode 100644
index 000000000000..9a92d3c8d197
--- /dev/null
+++ b/meta/recipes-connectivity/openssh/openssh-config/80-oe.conf
@@ -0,0 +1,5 @@
+KbdInteractiveAuthentication no
+
+Compression no
+ClientAliveInterval 15
+ClientAliveCountMax 4
diff --git a/meta/recipes-connectivity/openssh/openssh_9.6p1.bb b/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
index d500ca6019fe..406b349f8283 100644
--- a/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
@@ -191,6 +191,8 @@ RCONFLICTS:${PN}-sshd = "dropbear"
 CONFFILES:${PN}-sshd = "${sysconfdir}/ssh/sshd_config"
 CONFFILES:${PN}-ssh = "${sysconfdir}/ssh/ssh_config"
 
+RRECOMMENDS:${PN} += "openssh-config"
+
 ALTERNATIVE_PRIORITY = "90"
 ALTERNATIVE:${PN}-scp = "scp"
 ALTERNATIVE:${PN}-ssh = "ssh"
-- 
2.44.0


