Return-Path: <luca.boccassi@gmail.com>
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
	[209.85.221.46])
	by mail.openembedded.org (Postfix) with ESMTP id 3B5A37E04D
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 May 2019 21:40:14 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id r7so4358247wrr.13
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 May 2019 14:40:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=lYLgE8oDCblQM0nZlXOQN97a+Oz6CTb3WQw+XCboE2E=;
	b=J9z4S5TrATQKJfmaKEWQar5HU9XZwBvL1Laz39aS3Ng1J8mXVCRLcWKvB4q/M7pQFK
	VH1XlP9ZtEWaiUXy7FhN6WYbOmUfMnYgbwiRU32ck+SBAUSse+he21vinBdPRztpHyFB
	6qhNSIvqqH6p2RdS8WHYWLgnt5WeomXKMjurm/c2XkbI/XNot7859XcEWoHEgIxLlHzU
	REuEeW8vxFwQAX371i6fGL3TEZXRADkgSd4kts2GGyYB8xbrJlYKQxHFrhVxNE3SnxNK
	S2BQMGLTh4sZSs0bho8qZgBahDZ7odYlmhXoaoR4QGiI3454MRYO0dKCMRw9JqsfAabm
	2I/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=lYLgE8oDCblQM0nZlXOQN97a+Oz6CTb3WQw+XCboE2E=;
	b=Rp8TDIfD/fZsU/1BcS2Olku3Mb64Qt/jC/PrpzOAlD1RNHoftmwTsYQIfzfFavr7m+
	rkO2/G8jGCwa5r290qU+Cwy+Q49bj9NRw9fjgls20q73EDkYJp+mhn1Neyo2+Qh4BPis
	iINi9LmJdOX0RokRPivr8wes1ZZTHYrMLdRh0g6OidVtXsSGwfZ0ldhnCIXFcsDC6iaF
	d3j4uZEw2aJZbHS3ATMQV/OZtVrBKDQivm0v5UBJrZWGgktxfoaZVQKxEgkvd1bhLpgS
	/+jHZD6dNYf048QTcNKj4YWHWfO/hkV4VrBRUVM6h3e3JAQdyjsq8YzhB6PmAOlcczJ6
	lJ0w==
X-Gm-Message-State: APjAAAVY5SYokxqLpJJAk8noUTtrcvMu58efESyd65hcByrrZhLZXM0p
	nf2igLiZ8c4cr6RE54Sxp3of0AASMxY=
X-Google-Smtp-Source: APXvYqx4lIajCjB9vuqG6421SRNje5q+5MtJQApMEPJ+G4Pvgk/988RzCoe/0dHjFiUcF3rjJPfBbw==
X-Received: by 2002:adf:eb44:: with SMTP id u4mr4868122wrn.83.1557438015135;
	Thu, 09 May 2019 14:40:15 -0700 (PDT)
Received: from localhost ([88.98.246.218]) by smtp.gmail.com with ESMTPSA id
	k206sm7690619wmk.16.2019.05.09.14.40.13
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 09 May 2019 14:40:14 -0700 (PDT)
From: luca.boccassi@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Thu,  9 May 2019 22:40:07 +0100
Message-Id: <20190509214007.13927-1-luca.boccassi@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] systemd: enable portabled by default and install utilities in systemd-container
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
X-List-Received-Date: Thu, 09 May 2019 21:40:15 -0000
Content-Transfer-Encoding: 8bit

From: Luca Boccassi <luca.boccassi@microsoft.com>

portable services have been declared production ready with v241, so enable
by default and install the files in the container package.

Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
---
 meta/recipes-core/systemd/systemd_242.bb | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/meta/recipes-core/systemd/systemd_242.bb b/meta/recipes-core/systemd/systemd_242.bb
index 73e03c7a77..83b00ba785 100644
--- a/meta/recipes-core/systemd/systemd_242.bb
+++ b/meta/recipes-core/systemd/systemd_242.bb
@@ -81,6 +81,7 @@ PACKAGECONFIG ??= " \
     nss \
     nss-mymachines \
     nss-resolve \
+    portabled \
     quotacheck \
     randomseed \
     resolved \
@@ -403,8 +404,10 @@ SYSTEMD_SERVICE_${PN}-remote = "systemd-journal-remote.socket"
 
 FILES_${PN}-container = "${sysconfdir}/dbus-1/system.d/org.freedesktop.import1.conf \
                          ${sysconfdir}/dbus-1/system.d/org.freedesktop.machine1.conf \
+                         ${sysconfdir}/dbus-1/system.d/org.freedesktop.portable1.conf \
                          ${sysconfdir}/systemd/system/multi-user.target.wants/machines.target \
                          ${base_bindir}/machinectl \
+                         ${base_bindir}/portablectl \
                          ${bindir}/systemd-nspawn \
                          ${nonarch_libdir}/systemd/import-pubring.gpg \
                          ${systemd_system_unitdir}/busnames.target.wants/org.freedesktop.import1.busname \
@@ -418,21 +421,28 @@ FILES_${PN}-container = "${sysconfdir}/dbus-1/system.d/org.freedesktop.import1.c
                          ${systemd_system_unitdir}/org.freedesktop.machine1.busname \
                          ${systemd_system_unitdir}/systemd-importd.service \
                          ${systemd_system_unitdir}/systemd-machined.service \
+                         ${systemd_system_unitdir}/systemd-portabled.service \
                          ${systemd_system_unitdir}/dbus-org.freedesktop.machine1.service \
+                         ${systemd_system_unitdir}/dbus-org.freedesktop.portable1.service \
                          ${systemd_system_unitdir}/var-lib-machines.mount \
                          ${rootlibexecdir}/systemd/systemd-import \
                          ${rootlibexecdir}/systemd/systemd-importd \
                          ${rootlibexecdir}/systemd/systemd-machined \
+                         ${rootlibexecdir}/systemd/systemd-portabled \
                          ${rootlibexecdir}/systemd/systemd-pull \
+                         ${exec_prefix}/lib/tmpfiles.d/portables.conf \
                          ${exec_prefix}/lib/tmpfiles.d/systemd-nspawn.conf \
                          ${systemd_system_unitdir}/systemd-nspawn@.service \
                          ${libdir}/libnss_mymachines.so.2 \
                          ${datadir}/dbus-1/system-services/org.freedesktop.import1.service \
                          ${datadir}/dbus-1/system-services/org.freedesktop.machine1.service \
+                         ${datadir}/dbus-1/system-services/org.freedesktop.portable1.service \
                          ${datadir}/dbus-1/system.d/org.freedesktop.import1.conf \
                          ${datadir}/dbus-1/system.d/org.freedesktop.machine1.conf \
+                         ${datadir}/dbus-1/system.d/org.freedesktop.portable1.conf \
                          ${datadir}/polkit-1/actions/org.freedesktop.import1.policy \
                          ${datadir}/polkit-1/actions/org.freedesktop.machine1.policy \
+                         ${datadir}/polkit-1/actions/org.freedesktop.portable1.policy \
                         "
 
 RRECOMMENDS_${PN}-container += "\
-- 
2.20.1


