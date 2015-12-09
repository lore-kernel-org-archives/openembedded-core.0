Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f173.google.com (mail-io0-f173.google.com
	[209.85.223.173])
	by mail.openembedded.org (Postfix) with ESMTP id 093926FF77
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Dec 2015 18:14:35 +0000 (UTC)
Received: by iouu10 with SMTP id u10so69846478iou.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 Dec 2015 10:14:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=NqDSk+PsJymugkm9XJQKwRxOkFbO1tt3dIUpcUAUPfw=;
	b=uDoU/ivKYgGuq3xI+hsggdzp16skb8g6r6so0gSIiWp2uOeAQFYXI1TOMKC7RW+XRD
	0AyXQ19P7epmMCpfxREo2xc4C1XhJWgpqPrh3Yw/MDgpfdn/PbCVIYzBTVVEu00oxnFY
	AsItPvG759I+uH+kLx6FUwsI+AuqkbVEAEUy3+ychQLrsQpRGHhtBPIvjXsJZY9x95Ar
	/NJR6Myd4XqvBHa+cw83pRiBTVjvAvf0oer1/126EtL2mMfUlgTUkXQa9llY0tLtBcyk
	WMzmxp+5rSNOMkp210j5gtzNjv3WapCCcSfi61B4k3Syh7CnW1RQZfczAnGhrqtou1I0
	uWLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=NqDSk+PsJymugkm9XJQKwRxOkFbO1tt3dIUpcUAUPfw=;
	b=NJO+6OPG0ddtYUHsY6sVT8169vhxJJPGYh7n8D802/Fq6OG+2RFzfyd4F4NGyW9P80
	wTj2zWoFN/NQrt2UHIONN00z1ZwuObcVntZMBZCPUswC4jPWOeyfynChnCKFPCLvjxdx
	6a4GvCbmQQ1uc7H+xVZRvN+Y9qRY5Rq4ZRrPzJV9ZeHBHbQ66PlvZg/FFohfy3oATk8K
	YDi08lXA7vB6T7m4PVO/AjQNOvNaaMYKQJm9Cbz1SfOi0Alft1bXxGdF1artIvTJv+4j
	PfYeL4IePY6G7vCAW15USfKGpUaxemluJStXKXhttGhMi8Bx7rZm8PeUNx34bc+kjkTW
	4fNQ==
X-Gm-Message-State: ALoCoQn00CivymD3fJdbbL+pwYjFOQPlSShG6pHBpdRJfPa7E4RoQbm2KhDIK3yQjW/2wMxqb71h3Gv1it9f6luemb94fi8Anw==
X-Received: by 10.107.8.142 with SMTP id h14mr8231205ioi.116.1449684876455;
	Wed, 09 Dec 2015 10:14:36 -0800 (PST)
Received: from pohly-desktop.fritz.box (p57A560AC.dip0.t-ipconnect.de.
	[87.165.96.172])
	by smtp.gmail.com with ESMTPSA id 79sm3710213ioh.19.2015.12.09.10.14.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 09 Dec 2015 10:14:36 -0800 (PST)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  9 Dec 2015 20:14:31 +0100
Message-Id: <2ea29a4f98ec8d0f083596edddfc8e36535fbd55.1449683756.git.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1449683756.git.patrick.ohly@intel.com>
References: <cover.1449683756.git.patrick.ohly@intel.com>
In-Reply-To: <cover.1449683756.git.patrick.ohly@intel.com>
References: <cover.1449683756.git.patrick.ohly@intel.com>
Subject: [PATCH 3/3] busybox_%.bbappend: run ping and traceroute with file capabilities
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
X-List-Received-Date: Wed, 09 Dec 2015 18:14:38 -0000

ping, ping6 and traceroute are installed now so that when invoked by
normal users, the resulting process runs only with the new_raw
capability and not as root. This mitigates the effect when normal
invocations of these commands run into problems. A hardlink is used
to create the additional copy of the busybox binary, so the increase
in disk space is minimal.

However, a local attacker can still run these commands as root by
symlinking to the original busybox.suid. Fixing that would require
building busybox differently, which would cost more disk space.

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---
 meta/recipes-core/busybox/busybox_%.bbappend | 41 ++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)
 create mode 100644 meta/recipes-core/busybox/busybox_%.bbappend

diff --git a/meta/recipes-core/busybox/busybox_%.bbappend b/meta/recipes-core/busybox/busybox_%.bbappend
new file mode 100644
index 0000000..c27b0cd
--- /dev/null
+++ b/meta/recipes-core/busybox/busybox_%.bbappend
@@ -0,0 +1,41 @@
+inherit capabilities
+
+# This .bbappend  lowers privileges of certain commands from "runs as
+# root via suid" to "runs with a limited set of privileges via file
+# capabilities".
+#
+# The original list of symlinks to busybox.suid is, with (*) marking
+# commands which now can get executed with less privileges:
+#    /bin/ping (*)
+#    /bin/ping6 (*)
+#    /bin/login
+#    /usr/bin/passwd
+#    /bin/su
+#    /usr/bin/traceroute (*)
+#    /usr/bin/vock
+#
+# As it stands now, this change still leaves the "ping" and "traceroute"
+# code in the busybox.suid binary, where it can be executed as root by
+# a normal user by symlinking to it ("ln -s /bin/busybox.suid /tmp/ping;
+# /tmp/ping ...").
+#
+# To fix this, one would have to split up busybox even further, which
+# (somewhat) negates the space saving coming from implementing several
+# commands in the same binary.
+
+CAPABILITIES_${PN} = " \
+    ${base_bindir}/busybox.net_raw=net_raw \
+"
+
+do_install_append () {
+    ln ${D}/${base_bindir}/busybox.suid ${D}/${base_bindir}/busybox.net_raw
+    grep \
+       -e ping \
+       -e traceroute \
+       ${D}/${sysconfdir}/busybox.links.suid >${D}/${sysconfdir}/busybox.links.net_raw
+    grep -v \
+       -e ping \
+       -e traceroute \
+       ${D}/${sysconfdir}/busybox.links.suid >${D}/${sysconfdir}/busybox.links.suid.tmp
+    mv ${D}/${sysconfdir}/busybox.links.suid.tmp ${D}/${sysconfdir}/busybox.links.suid
+}
-- 
2.1.4


