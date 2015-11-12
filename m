Return-Path: <kergoth@gmail.com>
Received: from mail-pa0-f42.google.com (mail-pa0-f42.google.com
	[209.85.220.42])
	by mail.openembedded.org (Postfix) with ESMTP id 1CB5F77280
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Nov 2015 23:41:53 +0000 (UTC)
Received: by pabfh17 with SMTP id fh17so79795388pab.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Nov 2015 15:41:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=wCuOFPh5KBhVTGXhK3GPsR8wE8dwaWk5m+Ot7Ogug3U=;
	b=HJEane01HWUM+RaRf9/vfSBfXNtHZA7ivaBIHMmWSfQOm/oVX9QiBevAuIa6h26+re
	Ltu5IrShTJFYRdL4J/7pgseW5UFDMvv5PsaiNi1VLTm1wfnfPOade0OjNUTXLthbnEtc
	yninQXszRayOIaEvP7qKtnMehMiLiIY8oup31BnVNwF45ctABr2NceySkLZsIbTS9VjW
	JzYFefbRmgauj5rRO4hA5wIG3Sovi29OuhrAhSvBMftAlMwOGnNGYYy7vd35fZvFJYxc
	x9dMwRwIclyh65lK1muAAm71N7pUulYsCEAls1gToqlrqYOgnZwgga9meUUdvBtjrfM5
	/SmQ==
X-Received: by 10.68.198.101 with SMTP id jb5mr1659942pbc.119.1447371713661;
	Thu, 12 Nov 2015 15:41:53 -0800 (PST)
Received: from amyr.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by smtp.gmail.com with ESMTPSA id
	it10sm16733638pbc.14.2015.11.12.15.41.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 12 Nov 2015 15:41:52 -0800 (PST)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 12 Nov 2015 16:41:31 -0700
Message-Id: <b13cbf19a553ab7b8ec0afd7901d2982cb543a3d.1447371049.git.chris_larson@mentor.com>
X-Mailer: git-send-email 2.2.1
In-Reply-To: <130d9a6c1f4ecea86748a44b73f51d8ddb2e63da.1447371049.git.chris_larson@mentor.com>
References: <130d9a6c1f4ecea86748a44b73f51d8ddb2e63da.1447371049.git.chris_larson@mentor.com>
In-Reply-To: <cover.1447371049.git.chris_larson@mentor.com>
References: <cover.1447371049.git.chris_larson@mentor.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH 4/4] systemd: arrange for volatile /etc/resolv.conf
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
X-List-Received-Date: Thu, 12 Nov 2015 23:41:53 -0000

From: Christopher Larson <chris_larson@mentor.com>

On sysvinit systems, volatiles is configured to make /etc/resolv.conf symlink
to a file in a volatile path, which lets us write to /etc/resolv.conf for
read-only-rootfs. For systemd, this isn't set up unless we enable
systemd-resolved, which we don't by default. When it's not enabled, create the
/etc/resolv.conf symlink and ensure the volatile path is created on boot with
tmpfiles.d.

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta/recipes-core/systemd/systemd_225.bb | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta/recipes-core/systemd/systemd_225.bb b/meta/recipes-core/systemd/systemd_225.bb
index 20515f5..095448d 100644
--- a/meta/recipes-core/systemd/systemd_225.bb
+++ b/meta/recipes-core/systemd/systemd_225.bb
@@ -196,6 +196,13 @@ do_install() {
 	if [ -s ${D}${exec_prefix}/lib/tmpfiles.d/systemd.conf ]; then
 		${@bb.utils.contains('PACKAGECONFIG', 'networkd', ':', 'sed -i -e "\$ad /run/systemd/netif/links 0755 root root -" ${D}${exec_prefix}/lib/tmpfiles.d/systemd.conf', d)}
 	fi
+	if ! ${@bb.utils.contains('PACKAGECONFIG', 'resolved', 'true', 'false', d)}; then
+		# if resolved is disabled, it won't handle the link of resolv.conf, so
+		# set it up ourselves
+		ln -s ../run/resolv.conf ${D}${sysconfdir}/resolv.conf
+		echo 'L! ${sysconfdir}/resolv.conf - - - - ../run/resolv.conf' >>${D}${exec_prefix}/lib/tmpfiles.d/etc.conf
+		echo 'f /run/resolv.conf 0644 root root' >>${D}${exec_prefix}/lib/tmpfiles.d/systemd.conf
+	fi
 	install -Dm 0755 ${S}/src/systemctl/systemd-sysv-install.SKELETON ${D}${systemd_unitdir}/systemd-sysv-install
 }
 
@@ -290,6 +297,7 @@ FILES_${PN} = " ${base_bindir}/* \
                 ${sysconfdir}/tmpfiles.d/ \
                 ${sysconfdir}/xdg/ \
                 ${sysconfdir}/init.d/README \
+                ${sysconfdir}/resolv.conf \
                 ${rootlibexecdir}/systemd/* \
                 ${systemd_unitdir}/* \
                 ${base_libdir}/security/*.so \
-- 
2.2.1


