Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id DD6CA754FE
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Jun 2018 12:49:48 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id p11-v6so4856483wmc.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Jun 2018 05:49:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=I5HxXpHrH/xkhCPSvLNtJv/sNTpw+YWGX9ZTvkT2PJE=;
	b=K/RdVUDjJfrGpsaYy9SJdaFvRE/3nvVeBqutXn+egONR4wZPaVm04TAMwBi0wSYWKj
	ITOefplFimXsMz9JROsPvyvL/zE5XG/mK95xdbfQXBsOovNYN7fJuJd0QQLK+kuTCKfC
	4OAjikUvJ+qdRFpSeAibEac1BcAg66U4JU1IrAZfxmprigFRlLuT6LftxI8nJnv88IM1
	98kahEc6s7qjZ6RDVqnmXOIRJyyCRNHlBU71+4oOnfUs19dpzWmoUyFKg1Sj5957rJGH
	GlXv7bE3/5/SdqWu54ndpls/TBuH9FXYHipXxthcs6eNuS5Bt41d//1PiQdtwjZPpQkp
	4eFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=I5HxXpHrH/xkhCPSvLNtJv/sNTpw+YWGX9ZTvkT2PJE=;
	b=qLNtPCbXl+1H+/mVnw7PH8Z1Ug+jI2vGIA1D/Fcns5DqxKY/na9CbTH73/ltV9Hjtf
	8sWx+5SCCi2EuIhH5NlXZd/JlRaFAJ5xM44+Ko7KXhEVtOq0W0yBl72v44cxMQIGx5kQ
	ZPjVbxZVGKkZTFA2qVVjwywHFLZFA7FUluZyIGwo7SnAnr01Gll5TEFKPiDngsNSNKRz
	J4dDrMz9DnO8X6su1Odk2pn6OsQfNMNLOUNeoQj2D4B4hhewbo/zKkctBnDESA0HRSrQ
	m6L+yW5DAwnLqvX8Qx3oZS6+Q+BN8k1+OaId4d9/waRG7Quuyl2AFOZ2Om2RTU+wJh8u
	sQFg==
X-Gm-Message-State: APt69E2BUyH5905wQQ7arjaqTjUZOo9dP8Ise/Si0nsGLibCvDJP8f+d
	nYqE/b5agjAbQCYO+CCcY3J04jKH
X-Google-Smtp-Source: ADUXVKKOBbBMmxE8TfYd1Yt540MjIQeK1zIvmcwrKmjDpPcufuNmgoWn91XcIlZTwg4z2LVDgWK/WQ==
X-Received: by 2002:a1c:da4e:: with SMTP id
	r75-v6mr4647428wmg.64.1528202989331; 
	Tue, 05 Jun 2018 05:49:49 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	l5-v6sm31056419wrn.92.2018.06.05.05.49.48
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 05 Jun 2018 05:49:48 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 Jun 2018 13:49:43 +0100
Message-Id: <20180605124945.15313-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH 1/3] qemu: only build SDL UI if X11 is enabled
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
X-List-Received-Date: Tue, 05 Jun 2018 12:49:49 -0000

The SDL UI now assumes that it is using X11 because it includes X headers, so
only enable it if X11 is enabled.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-devtools/qemu/qemu.inc | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index faaea781cd7..2f73b21c30e 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -74,11 +74,12 @@ do_install_append() {
 # END of qemu-mips workaround
 
 PACKAGECONFIG ??= " \
-    fdt sdl kvm \
+    fdt kvm \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'sdl', '', d)} \
     ${@bb.utils.filter('DISTRO_FEATURES', 'alsa xen', d)} \
 "
 PACKAGECONFIG_class-native ??= "fdt alsa kvm"
-PACKAGECONFIG_class-nativesdk ??= "fdt sdl kvm"
+PACKAGECONFIG_class-nativesdk ??= "fdt kvm ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'sdl', '', d)}"
 
 # Handle distros such as CentOS 5 32-bit that do not have kvm support
 PACKAGECONFIG_class-native_remove = "${@'kvm' if not os.path.exists('/usr/include/linux/kvm.h') else ''}"
-- 
2.11.0


