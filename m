Return-Path: <scott.branden@broadcom.com>
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com
	[209.85.215.178])
	by mail.openembedded.org (Postfix) with ESMTP id F041C61506
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Feb 2020 22:45:05 +0000 (UTC)
Received: by mail-pg1-f178.google.com with SMTP id z12so11685887pgl.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Feb 2020 14:45:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=broadcom.com; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=tZNJkO7wLlWtw7zPPIHBfs3OFNuRDFJVd5bneF+Ak38=;
	b=cY9ZKoTu4VJXPNAhvHkoT+9+W6xqJkoxpztRYp+/SVkdnNVaQc43bB+ID31k7MZt+I
	Tob9HYgR65hz3MCV9wifT6NHT1OVFK+15seS2pOnovcKIlovp/bszhObOPbCjh/OEkoj
	H2sX6+ahRMqA2ASL1AcM8CLffk4O38HmhirJI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=tZNJkO7wLlWtw7zPPIHBfs3OFNuRDFJVd5bneF+Ak38=;
	b=WMI3XpiJIeseBB/+gEbTufA0vFVcR1D2XDrPX6fAuyMskK6nGXEYukC0Ie4G8xbqZk
	hwYf4ILc9kslfbMDuJltG18gTUL/wlTFaLX6zsgB8F321OFtjPBbUDnWr3+tUwgy/6Vp
	pUF+fUutO5aru3B3T6UwKVCD+ff9OELONfNr2P/Tzq6yDoULkx5HxaoUgWygMlmjCWJ0
	SH0mzhCPpdAQaOMcP3ge1oW2DlXYKjEyAgfZTD0y95LC6K+8haTDH9jAE+Ac6Q1gXX6C
	1OPg0rc0Xa7f4Vdyvqk5n5hFOePDp5b06AOHgBN1ugrzfwL1MRIkPiR5MNIbOR7yMDik
	BgOA==
X-Gm-Message-State: APjAAAV8odHZB7h7Qcg44iYPFE3q7wKQRMu3INlA5YKKGqsDNtWg4YuU
	mOXvi1AbuvrEDQguhzJAqJFsedxAGOzj04WN04jiFGSDIyLmjQyKrst20oDZvsbSia+jHA1thWB
	C+Zep72hNs+uNFAIkU89d+cvohxtPrlcgSVjFwcMP3Vka9w58Ip1/I/IUPJH7uq1XAfVkjj5joO
	JDAkKszjK2zeEwS/FGBkop+9Q3oVY=
X-Google-Smtp-Source: APXvYqzph4aIkA+X1tsI/YAXFI2jqjp7y4qFJKXEvsD/UjLtfPNO0G0ysy4A7OF2WC3BNYfO/C/S3A==
X-Received: by 2002:a63:4d8:: with SMTP id 207mr25115913pge.269.1582065906559; 
	Tue, 18 Feb 2020 14:45:06 -0800 (PST)
Received: from lbrmn-lnxub113.broadcom.net ([192.19.228.250])
	by smtp.gmail.com with ESMTPSA id b18sm30400pfb.116.2020.02.18.14.45.04
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 18 Feb 2020 14:45:05 -0800 (PST)
From: Scott Branden <scott.branden@broadcom.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 18 Feb 2020 14:44:55 -0800
Message-Id: <20200218224455.14551-1-scott.branden@broadcom.com>
X-Mailer: git-send-email 2.17.1
Subject: [meta-oe][PATCH v2] iproute2: add devlink support to iproute2
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
X-List-Received-Date: Tue, 18 Feb 2020 22:45:06 -0000

Add devlink support to iproute2 recipe.

Signed-off-by: Scott Branden <scott.branden@broadcom.com>
---
 meta/recipes-connectivity/iproute2/iproute2.inc | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-connectivity/iproute2/iproute2.inc b/meta/recipes-connectivity/iproute2/iproute2.inc
index fc31b8444e..98793af88e 100644
--- a/meta/recipes-connectivity/iproute2/iproute2.inc
+++ b/meta/recipes-connectivity/iproute2/iproute2.inc
@@ -15,11 +15,13 @@ inherit update-alternatives bash-completion pkgconfig
 
 CLEANBROKEN = "1"
 
-PACKAGECONFIG ??= "tipc elf"
+PACKAGECONFIG ??= "tipc elf devlink"
 PACKAGECONFIG[tipc] = ",,libmnl,"
 PACKAGECONFIG[elf] = ",,elfutils,"
+PACKAGECONFIG[devlink] = ",,libmnl,"
 
 EXTRA_OEMAKE = "CC='${CC}' KERNEL_INCLUDE=${STAGING_INCDIR} DOCDIR=${docdir}/iproute2 SUBDIRS='lib tc ip bridge misc genl \
+                ${@bb.utils.contains('PACKAGECONFIG', 'devlink', 'devlink', '', d)}                                               \
                 ${@bb.utils.contains('PACKAGECONFIG', 'tipc', 'tipc', '', d)}' SBINDIR='${base_sbindir}' LIBDIR='${libdir}'"
 
 do_configure_append () {
@@ -46,7 +48,8 @@ PACKAGES =+ "${PN}-tc \
              ${PN}-rtacct \
              ${PN}-nstat \
              ${PN}-ss \
-             ${@bb.utils.contains('PACKAGECONFIG', 'tipc', '${PN}-tipc', '', d)}"
+             ${@bb.utils.contains('PACKAGECONFIG', 'tipc', '${PN}-tipc', '', d)} \
+             ${@bb.utils.contains('PACKAGECONFIG', 'devlink', '${PN}-devlink', '', d)}"
 FILES_${PN}-tc = "${base_sbindir}/tc* \
                   ${libdir}/tc/*.so"
 FILES_${PN}-lnstat = "${base_sbindir}/lnstat \
@@ -58,6 +61,7 @@ FILES_${PN}-rtacct = "${base_sbindir}/rtacct"
 FILES_${PN}-nstat = "${base_sbindir}/nstat"
 FILES_${PN}-ss = "${base_sbindir}/ss"
 FILES_${PN}-tipc = "${base_sbindir}/tipc"
+FILES_${PN}-devlink = "${base_sbindir}/devlink"
 
 ALTERNATIVE_${PN} = "ip"
 ALTERNATIVE_TARGET[ip] = "${base_sbindir}/ip.${BPN}"
-- 
2.17.1


