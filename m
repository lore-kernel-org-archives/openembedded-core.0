Return-Path: <alex.kiernan@gmail.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id EFB6D793BE
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Sep 2018 17:31:39 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id k5-v6so18165920wre.10
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Sep 2018 10:31:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=Gff0uXMt3P6BTLWYKWV7IGiRlpaBbZmQr1hOun/5Lyk=;
	b=EOJcLKCoQISSmMvyFRLDwVt7vX7czDEyoXJto/c+fP5FgGGdiBC2ZGd4fOd/TVUsEN
	KCIbBUwXoqgbZ1xrrBpUmTcQWdt2rJ0sm9Wcg+4KUq2y1fAIhA0oKowDF2KRxc/Nuov7
	XQA5eJ6hcXP8ctA9Y5nBpzXi4AEEQEq6ISoSgcvqhlfcrpuqzxD0JriEHFrheoL2tOmA
	6NFm/CgQGe4JJHQoOvru1hKlADlIsOFyXjbnHV6tlwe36R8xP/sks+U1dOOX09BZEv8O
	3uos/8MB4KWsGh7eK0YaO3jRBQaavGZMVCQLBR632Y5pJQfKc2BUUNonOQSOZ+ZlhR1x
	sRwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Gff0uXMt3P6BTLWYKWV7IGiRlpaBbZmQr1hOun/5Lyk=;
	b=fizQ7kO1Kp0Mqco3By7X/i9ecqIXaLbtvx1WgIpAE6nGUR2WrY/Us2vnu5WaIhA5Ue
	RpzRJ38zfiwkGvQ9GGC3XWfLpZE5bshbJwMs/xqnRSxlUG3Za8/B14X5B1vxptes4gKH
	QbneUGuMzwcSsWC+jL7IW0+lxsVPL6XtiZUEj9o56jXzDlE53CFLHmcq6a/1Rq91n5Uo
	0WV3eLtDbeD4zBQjDhOArJOOnBy0L+j/QSVgb3YUO+eH3pjPyzU9ZiJRk0l6jlSuOgrx
	sJlTtOZZrIZeDEnYVZj/yDsgN8XJ4vzmELURcd7TmgeYWMWCz16OTMjp//TmMnbUqJ+K
	908g==
X-Gm-Message-State: APzg51C3Ma/ZNE/sAqNcCKRi+f+2jYOVnv/9zziVtKfRmcrOsVU6AV9/
	CF4yJsbmkQFt1J0tzTD9DfUvY1oV
X-Google-Smtp-Source: ANB0VdYJ42DCYowYs+yMMmGApXwj+UVXZxjcAWjFJ/6yOPPG0RZpXqJUlGM6rerb8b4bOfN4d+WGmw==
X-Received: by 2002:adf:f7c4:: with SMTP id
	a4-v6mr20415018wrq.86.1537205499902; 
	Mon, 17 Sep 2018 10:31:39 -0700 (PDT)
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net.
	[91.135.6.246]) by smtp.gmail.com with ESMTPSA id
	q3-v6sm7185105wma.45.2018.09.17.10.31.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 17 Sep 2018 10:31:39 -0700 (PDT)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 17 Sep 2018 17:31:36 +0000
Message-Id: <1537205496-3070-1-git-send-email-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] systemd: Add util-linux-fsck to RDEPENDS
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
X-List-Received-Date: Mon, 17 Sep 2018 17:31:40 -0000

systemd-fsck expects util-linux-fsck passing a number of options that
busybox fsck doesn't interpret. It then continues silently when run, so
disks end up not having fsck run at all.

Move util-linux-fsck from RRECOMMENDS to RDEPENDS to ensure we have the
fsck which systemd expects.

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

 meta/recipes-core/systemd/systemd_239.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd_239.bb b/meta/recipes-core/systemd/systemd_239.bb
index 55e398693568..194efb5b9467 100644
--- a/meta/recipes-core/systemd/systemd_239.bb
+++ b/meta/recipes-core/systemd/systemd_239.bb
@@ -502,13 +502,13 @@ FILES_${PN} = " ${base_bindir}/* \
 
 FILES_${PN}-dev += "${base_libdir}/security/*.la ${datadir}/dbus-1/interfaces/ ${sysconfdir}/rpm/macros.systemd"
 
-RDEPENDS_${PN} += "kmod dbus util-linux-mount udev (= ${EXTENDPKGV}) util-linux-agetty"
+RDEPENDS_${PN} += "kmod dbus util-linux-mount udev (= ${EXTENDPKGV}) util-linux-agetty util-linux-fsck"
 RDEPENDS_${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'serial-getty-generator', '', 'systemd-serialgetty', d)}"
 RDEPENDS_${PN} += "volatile-binds update-rc.d"
 
 RRECOMMENDS_${PN} += "systemd-extra-utils \
                       systemd-compat-units udev-hwdb \
-                      util-linux-fsck e2fsprogs-e2fsck \
+                      e2fsprogs-e2fsck \
                       kernel-module-autofs4 kernel-module-unix kernel-module-ipv6 \
                       os-release \
 "
-- 
2.7.4


