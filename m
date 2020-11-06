Received: from mga01.intel.com (mga01.intel.com [])
 by mx.groups.io with SMTP id smtpd.web10.8284.1604644110706190146
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Nov 2020 22:29:02 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: 1WPwu5t57iq8Q6wof0vpYvnNLz7Ig1HyqWYAFVIqeJcGrMNAbQdWrUqiKv5vfd+il76kQLyeE8
 W+SzHC9bhioQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9796"; a="187428925"
X-IronPort-AV: E=Sophos;i="5.77,455,1596524400"; 
   d="scan'208";a="187428925"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2020 22:29:01 -0800
IronPort-SDR: EvHg+h4rUfWFMwQqfJGRDNGDDBE4oMvLEX0lAo+Dujus+sRHr9u2dS1dmZN6ywnpPWkgG1Vgrr
 jOw5Ozb6+EaA==
X-IronPort-AV: E=Sophos;i="5.77,455,1596524400"; 
   d="scan'208";a="321490145"
Received: from gcquah-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.213.35.239])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2020 22:28:59 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 22/22] update_udev_hwdb: clean hwdb.bin
Date: Fri,  6 Nov 2020 14:28:20 +0800
Message-Id: <1bc33490ef6c48a3665bee69be398866ffd2d76a.1604643684.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <cover.1604643684.git.anuj.mittal@intel.com>
References: <cover.1604643684.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mingli Yu <mingli.yu@windriver.com>

Steps to reproduce:
echo "IMAGE_INSTALL_append = \" udev-hwdb lib32-udev-hwdb\"" >> conf/local.conf

When install both udev-hwdb and lib32-udev-hwdb as above,
there comes below do_populate_sdk error:
 $ bitbake core-image-sato  -c populate_sdk
 ERROR: Task (/path/core-image-sato.bb:do_populate_sdk) failed with exit code '134'
 NOTE: Tasks Summary: Attempted 5554 tasks of which 0 didn't need to be rerun and 1 failed.

 $ cat /path/tmp/work/qemux86_64-poky-linux/core-image-sato/1.0-r5/pseudo/pseudo.log
 [snip]
 inode mismatch: '/path/tmp/work/qemux86_64-poky-linux/core-image-sato/1.0-r5/sdk/image/usr/local/oecore-x86_64/sysroots/core2-64-poky-linux/lib/udev/hwdb.bin' ino 427383040 in db, 427383042 in request.
 [snip]

It is because both udev-hwdb and lib32-udev-hwdb will generate
${SDK_OUTPUT}/${SDKTARGETSYSROOT}/lib/udev/hwdb.bin during do_populate_sdk
and it triggers pseudo error.

So clean hwdb.bin before generate hwdb.bin to avoid conflict to
fix the above do_populate_sdk error.

(From OE-Core rev: c7472925feb53ce92c1799feba2b7a9104e3f38f)

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 994ca65e6f828dd38e0d7d09fb5243147ba4e36b)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 scripts/postinst-intercepts/update_udev_hwdb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/postinst-intercepts/update_udev_hwdb b/scripts/postinst-intercepts/update_udev_hwdb
index 102e99b947..8076b8ae6f 100644
--- a/scripts/postinst-intercepts/update_udev_hwdb
+++ b/scripts/postinst-intercepts/update_udev_hwdb
@@ -17,5 +17,6 @@ case "${PREFERRED_PROVIDER_udev}" in
 		;;
 esac
 
+rm -f $D${UDEVLIBDIR}/udev/hwdb.bin
 PSEUDO_UNLOAD=1 ${binprefix}qemuwrapper -L $D $D${libexecdir}/${binprefix}udevadm hwdb --update --root $D ${UDEV_EXTRA_ARGS}
 chown root:root $D${UDEVLIBDIR}/udev/hwdb.bin
-- 
2.28.0

