Return-Path: <andre.draszik@gmail.com>
Received: from mail-yw1-f66.google.com (mail-yw1-f66.google.com
	[209.85.161.66])
	by mail.openembedded.org (Postfix) with ESMTP id C7AD67997F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Feb 2019 12:04:35 +0000 (UTC)
Received: by mail-yw1-f66.google.com with SMTP id c67so4072341ywa.7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Feb 2019 04:04:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Ox+dIZ1K8EtlyK2rFVQwvko0SjyHwb7jJ++iye+qPpQ=;
	b=CMRuiYyiK0K5O4/UV/UAqUkPWDDRwycAG2wUPduE575dFomBSGnoeXm9xI1PB/rV+k
	fxAMcPipJJNnsvKuevTZ5U2v8VyodRVlC28HdHVaLqGlgJ0odY60IhrWenOAvgXZgCNp
	Zhp+3WmBbN3vhMVyG9NVbpmGAvyPRsoleAtHGCj2qCuW6AkpgHxUGXSrVk2Khh/VG2Js
	VPGenqN7T6KoZ5vcjxEvyNP8ObgRYVJQVermTym/8LsQoT2iIqsmojUOq50v//vckRu8
	PN9MRpKqrzH9YGDBL7UhjUPbXc/8rHacfPRrRKxO4AlZIquY8hbinRpm5mAxy94mPXTT
	vZpA==
X-Gm-Message-State: AHQUAuZAW3KHQC3uru71z2DSlTCM72SdRYulylaa45OUoAQ+/tdSodW9
	/R8p26K/AEAmy6VV6xEx7W7tZNst
X-Google-Smtp-Source: AHgI3IZmDgLZJAeGGCrFDvKR96Iwno1aCCpWq0aUrBmXLaprDXuCd9Jf0G/iNIJB6zVI8/bpoPR/mA==
X-Received: by 2002:a81:7383:: with SMTP id
	o125mr21029108ywc.285.1549886676503; 
	Mon, 11 Feb 2019 04:04:36 -0800 (PST)
Received: from tfsielt31850.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	b65sm3930436ywb.29.2019.02.11.04.04.35
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 11 Feb 2019 04:04:35 -0800 (PST)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Feb 2019 12:04:33 +0000
Message-Id: <20190211120433.16148-1-git@andred.net>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] systemd: RDEPENDS on util-linux-umount
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
X-List-Received-Date: Mon, 11 Feb 2019 12:04:36 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: André Draszik <andre.draszik@jci.com>

It looks like there is an implicit dependency on util-linux'
umount - as otherwise when using busybox' umount we see a
long delay on shutdown / reboot.

[YOCTO #13058]

Signed-off-by: André Draszik <andre.draszik@jci.com>

---
this should only be merged with or after the util-linux
packaging rework
---
 meta/recipes-core/systemd/systemd_239.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd_239.bb b/meta/recipes-core/systemd/systemd_239.bb
index f843f588bd..e2dfe639b3 100644
--- a/meta/recipes-core/systemd/systemd_239.bb
+++ b/meta/recipes-core/systemd/systemd_239.bb
@@ -556,7 +556,7 @@ FILES_${PN} = " ${base_bindir}/* \
 
 FILES_${PN}-dev += "${base_libdir}/security/*.la ${datadir}/dbus-1/interfaces/ ${sysconfdir}/rpm/macros.systemd"
 
-RDEPENDS_${PN} += "kmod dbus util-linux-mount udev (= ${EXTENDPKGV}) util-linux-agetty util-linux-fsck"
+RDEPENDS_${PN} += "kmod dbus util-linux-mount util-linux-umount udev (= ${EXTENDPKGV}) util-linux-agetty util-linux-fsck"
 RDEPENDS_${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'serial-getty-generator', '', 'systemd-serialgetty', d)}"
 RDEPENDS_${PN} += "volatile-binds update-rc.d systemd-conf"
 
-- 
2.20.1


