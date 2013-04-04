Received: from mail-wi0-f173.google.com ([209.85.212.173])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UNnVQ-0006c5-Sl
	for openembedded-core@lists.openembedded.org;
	Thu, 04 Apr 2013 18:59:23 +0200
Received: by mail-wi0-f173.google.com with SMTP id ez12so4908365wid.12
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Apr 2013 09:42:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=Xed36G/DrdIQRD32SeCC9AioIDVjSAcW+tYnIzbY7ug=;
	b=zkzI6uNStS7PYr1pH2b9oxLkj/9YMLruhQGCp81cp1H0kSvjd9nAq1wObHEt3KuXdl
	gdc0pwvwczqJKv/oK9Is4OwQb/E8KKX5o5wmTK/6lxqAaBBE/8EEIQU/g6ZxvweWwVJY
	/sDS9zpCnRkNnpw5JYvUlCt/l+kSAaHHyEn1nU2ZUVjsPmzf1Satf0vvNb/i69sZb/Kv
	vwV+g7vNGiUlQZ1Z56KzlcbgSApcaPjKo4ObsWhuIY98KmGNkNY87k7OLosQ2m+LbRVP
	ifAlZvaHgcS/T8RxBFxkwIceaBHMHP31TaTVn9dnsGMdpPmfvhjyHeMSiV6LfNDALIcg
	cvrQ==
X-Received: by 10.195.12.133 with SMTP id eq5mr10802088wjd.52.1365093728156;
	Thu, 04 Apr 2013 09:42:08 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id ed6sm17254665wib.9.2013.04.04.09.42.07
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 04 Apr 2013 09:42:07 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  4 Apr 2013 18:42:13 +0200
Message-Id: <1365093733-31674-2-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.1.5
In-Reply-To: <1365093733-31674-1-git-send-email-Martin.Jansa@gmail.com>
References: <1365093733-31674-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCH 2/2] dbus: set INHIBIT_UPDATERCD_BBCLASS without sysvinit in features
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
X-List-Received-Date: Thu, 04 Apr 2013 16:59:25 -0000

* fixes udev configure in run-postinsts failing with:
  update-rc.d: /etc/init.d/dbus-1: file does not exist
  because dbus-udev is installed only with sysvinit in features
  but update-rc.d was always called from PN postinst

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-core/dbus/dbus.inc | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/recipes-core/dbus/dbus.inc b/meta/recipes-core/dbus/dbus.inc
index bfd1167..2be5bda 100644
--- a/meta/recipes-core/dbus/dbus.inc
+++ b/meta/recipes-core/dbus/dbus.inc
@@ -24,6 +24,12 @@ inherit useradd autotools pkgconfig gettext update-rc.d
 INITSCRIPT_NAME = "dbus-1"
 INITSCRIPT_PARAMS = "start 02 5 3 2 . stop 20 0 1 6 ."
 
+python __anonymous() {
+    features = d.getVar("DISTRO_FEATURES", True).split()
+    if "sysvinit" not in features:
+        d.setVar("INHIBIT_UPDATERCD_BBCLASS", "1")
+}
+
 USERADD_PACKAGES = "${PN}"
 GROUPADD_PARAM_${PN} = "-r netdev"
 USERADD_PARAM_${PN} = "--system --home ${localstatedir}/lib/dbus \
-- 
1.8.1.5



