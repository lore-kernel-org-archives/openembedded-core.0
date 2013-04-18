Received: from mail-we0-f178.google.com ([74.125.82.178])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1USqIq-0006BG-16
	for openembedded-core@lists.openembedded.org;
	Thu, 18 Apr 2013 16:59:12 +0200
Received: by mail-we0-f178.google.com with SMTP id z53so2345516wey.23
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Apr 2013 07:41:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer
	:x-gm-message-state;
	bh=eRiKNa3SDzwAcz5cplXyCQ40z9ui9TEk0KAwKgUh4e8=;
	b=ml0SQXyTAHm5Z6ZKnd/WhGJHXQKenfJSpYf6NyARbhIo3OSARzxgOzmTPa5AuBhaUV
	D7CwC53Vow6ODLvksUePENQnIQORYebBFbsJCxRIgv17M5UAxwGNgBjKiIFhIzpKZ9vw
	zXV37Kjo9dvqGhn/+AKJcPXYXQqrtmsRlap6XsqIHa8vRc31Fji7mAARx0FrKo+MtkOa
	0wjgkpY8IvFBvVfRQQEHo+WHz3zFn2uHLG/7HfSvPZpDMZTl/5axdFaSMejSvikG+0g+
	Ut+PD7v/iACfNnzT6goN7Nrd3AoPmnmj6gxjWZrRD27Q+sGrIe/Vn/OEKih3SfXuGakW
	QMHg==
X-Received: by 10.194.109.136 with SMTP id hs8mr19409271wjb.8.1366296095948;
	Thu, 18 Apr 2013 07:41:35 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id g4sm16530174wib.11.2013.04.18.07.41.34
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 18 Apr 2013 07:41:35 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 18 Apr 2013 15:38:43 +0100
Message-Id: <1366295923-29393-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
X-Gm-Message-State: ALoCoQmvsP+bNNEcx7Uu6a4vDt+gCvRPH40DgCT+xqfHVWkXDQNtHW5LmJh6Qw17dX0w/T+ZDeb/
Subject: [PATCH] udev: drop dependency on udev in libudev
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
X-List-Received-Date: Thu, 18 Apr 2013 14:59:13 -0000

libudev previously depended on udev, but this causes problems with multilib
if the user wants to install two variants of libudev as they'll pull in two
variants of udev, which will conflict.

Instead, remove the dependency and rely that the image pulls in udev in some
way, such as the commonly used packagegroup-core-boot.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-core/udev/udev.inc |    1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-core/udev/udev.inc b/meta/recipes-core/udev/udev.inc
index 7221a49..dd250f7 100644
--- a/meta/recipes-core/udev/udev.inc
+++ b/meta/recipes-core/udev/udev.inc
@@ -15,7 +15,6 @@ LDFLAGS += "-lrt"
 DEPENDS = "acl glib-2.0 libusb usbutils pciutils gperf-native libxslt-native util-linux"
 RPROVIDES_${PN} = "hotplug"
 RRECOMMENDS_${PN} += "udev-extraconf usbutils-ids pciutils-ids"
-RDEPENDS_libudev = "${PN} (= ${EXTENDPKGV})"
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/utils/kernel/hotplug/udev-${PV}.tar.gz \
            file://0001-Fixing-keyboard_force_release.sh-shell-script-path.patch \
-- 
1.7.10.4



