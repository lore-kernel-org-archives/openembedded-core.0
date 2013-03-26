Received: from mail-wi0-f182.google.com ([209.85.212.182])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UKXOM-00079T-Pk
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Mar 2013 18:10:35 +0100
Received: by mail-wi0-f182.google.com with SMTP id hi18so1173374wib.9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Mar 2013 09:53:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references:x-gm-message-state;
	bh=LMRhxKGR0uEO4sWJakZWQT2vKdnv1NXwg16pkOgNuJ8=;
	b=LzFikbkILVjb3fxPkukniUY+zPztFcvG4e1nBCnnptjGzRaUNkbbbqOZGNB+FpnXkb
	TygNpQ9ZCTVFlNyvVZXKzWCJNwYwzXsAW1ZmfaLMxErrnPSPg5XtWg7zqDhjU7LDwyQo
	Ln10eNaizVyspgAHM9TD28NEthhxRIKsWBUWQf3AnePjxlpnmzJ/xw3Md/J4FDt0ivsc
	m/tjbh3e8wm6oAjpU6Zjo3qhznBtfoog8YRF4gN2xdJdrUvUS/3uGmuwCytWBs4+aKqL
	iDkiQhxFl2P3WHnxN5Q3cdqOINQeDJBqfLqJgNBFxQnkGtAIeRpNpyRTuIqJSE+lg6K4
	LS6Q==
X-Received: by 10.180.185.239 with SMTP id ff15mr4595384wic.2.1364316815110;
	Tue, 26 Mar 2013 09:53:35 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id bk1sm4522670wib.2.2013.03.26.09.53.33
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 26 Mar 2013 09:53:34 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 26 Mar 2013 16:50:22 +0000
Message-Id: <a56f9f8d95194dc4365e83488a34f37a4ee0bce1.1364316412.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1364316411.git.ross.burton@intel.com>
References: <cover.1364316411.git.ross.burton@intel.com>
In-Reply-To: <cover.1364316411.git.ross.burton@intel.com>
References: <cover.1364316411.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQkrbNeS1PVwLgo700PQ8AP1Dg/soIaSSrO9OJQWSQoBql5XYQuAkloHcKWbRBJHjNgKUxQy
Subject: [PATCH 24/24] udev: move /run volatile entry to udev instead of initscripts
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 26 Mar 2013 17:10:43 -0000

initscripts is generally installed on systemd-using images, but because it
specifies that /run is a symlink to /var/run managed by volatiles it totally
breaks systemd by copying/deleting /run from underneath systemd.  Deleting
sockets mid-boot doesn't leave systemd in a happy place.

As this volatile reference of /run was introduced by udev 182, move it's
reference to the udev recipe.  This way it will never be present on systemd
images, as systemd manages /run as a tmpfs itself.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-core/initscripts/initscripts-1.0/volatiles |    1 -
 meta/recipes-core/udev/udev.inc                         |    6 +++++-
 meta/recipes-core/udev/udev/volatiles                   |    1 +
 3 files changed, 6 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-core/udev/udev/volatiles

diff --git a/meta/recipes-core/initscripts/initscripts-1.0/volatiles b/meta/recipes-core/initscripts/initscripts-1.0/volatiles
index f0c796c..270f128 100644
--- a/meta/recipes-core/initscripts/initscripts-1.0/volatiles
+++ b/meta/recipes-core/initscripts/initscripts-1.0/volatiles
@@ -35,4 +35,3 @@ f root root 0664 /var/log/wtmp none
 f root root 0664 /var/run/utmp none
 l root root 0644 /etc/resolv.conf /var/run/resolv.conf
 f root root 0644 /var/run/resolv.conf none
-l root root 0755 /run /var/run
diff --git a/meta/recipes-core/udev/udev.inc b/meta/recipes-core/udev/udev.inc
index bd82c34..e358d2d 100644
--- a/meta/recipes-core/udev/udev.inc
+++ b/meta/recipes-core/udev/udev.inc
@@ -27,7 +27,8 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/kernel/hotplug/udev-${PV}.tar.gz \
            file://local.rules \
            file://udev-cache \
            file://udev-cache.default \
-           file://init"
+           file://init \
+           file://volatiles"
 
 inherit autotools pkgconfig update-rc.d
 
@@ -81,6 +82,9 @@ do_install_append () {
 	install -d ${D}${sysconfdir}/default
 	install -m 0755 ${WORKDIR}/udev-cache.default ${D}${sysconfdir}/default/udev-cache
 
+	install -d ${D}${sysconfdir}/default/volatiles
+	install -m 0644 ${WORKDIR}/volatiles ${D}${sysconfdir}/default/volatiles/00_udev
+
 	touch ${D}${sysconfdir}/udev/cache.data
 
 	install -d ${D}${sysconfdir}/udev/rules.d/
diff --git a/meta/recipes-core/udev/udev/volatiles b/meta/recipes-core/udev/udev/volatiles
new file mode 100644
index 0000000..e33561b
--- /dev/null
+++ b/meta/recipes-core/udev/udev/volatiles
@@ -0,0 +1 @@
+l root root 0755 /run /var/run
-- 
1.7.10.4



