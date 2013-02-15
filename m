Received: from mail-we0-f181.google.com ([74.125.82.181])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1U6LKL-0003Cn-Cr
	for openembedded-core@lists.openembedded.org;
	Fri, 15 Feb 2013 14:27:47 +0100
Received: by mail-we0-f181.google.com with SMTP id t44so2819271wey.26
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Feb 2013 05:11:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references:x-gm-message-state;
	bh=sq+Qsbj2y2z0tt1JELSDG0mCC8z3p2OisNaVg5HhbNo=;
	b=fINyLpJGNarme9yC//3JyS3TtrFxem0ThcNPPYnNiN/fttpDK1Q0inhNJdsGoQf1wi
	3XkoN/wKZeTXXdCryRmP7sivoEbRmRu4cbXq7GleusXayyFQ7QyXAjMuRAH6opS9tYMD
	5WYl/pbebvF/0dr201xtYGeY8ccHrCJkIleEtV59dsIaeYCqMLdLsLcoo6Xl3MrhYIjA
	dh3KFupO2Y8/9mUK8VOJ4BD4q3ukZHfvUCieQKpKfHADqcosDm2l0VPqGvDNEHG252Ug
	OckE3dFhyV+a9M4iwsiQZ547Nt/7m5nvlES78u6d181e1UzVh0xD8f3Dvf746gc9BBJ9
	uboQ==
X-Received: by 10.194.109.102 with SMTP id hr6mr4140164wjb.24.1360933901775;
	Fri, 15 Feb 2013 05:11:41 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id j4sm2923857wiz.10.2013.02.15.05.11.40
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 15 Feb 2013 05:11:41 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 15 Feb 2013 13:09:20 +0000
Message-Id: <4b35088697c40ccae6bc7aca5f304c49ad29ff84.1360933659.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1360933659.git.ross.burton@intel.com>
References: <cover.1360933659.git.ross.burton@intel.com>
In-Reply-To: <cover.1360933659.git.ross.burton@intel.com>
References: <cover.1360933659.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQlenu/5NW/xsm420Y3d6xhkjGjcxBfCLU1P3M8oDuubQ7Np8BwyqL+KepoqnG3u30NUZHb6
Subject: [PATCH 3/4] xserver-xf86-config: don't ship empty xorg.conf
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
X-List-Received-Date: Fri, 15 Feb 2013 13:27:50 -0000

Many hardware platforms can autodetect their hardware and don't need a xorg.conf
at all.  Make it easy for BSPs to not ship a xorg.conf by not installing empty
xorg.conf files.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb |   10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb b/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb
index 3c29f8b..90d6f56 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb
@@ -7,12 +7,14 @@ PR = "r11"
 
 SRC_URI = "file://xorg.conf"
 
-CONFFILES_${PN} += "${sysconfdir}/X11/xorg.conf"
+CONFFILES_${PN} = "${sysconfdir}/X11/xorg.conf"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
+ALLOW_EMPTY_${PN} = "1"
 
 do_install () {
-	install -d ${D}/${sysconfdir}/X11
-	install -m 0644 ${WORKDIR}/xorg.conf ${D}/${sysconfdir}/X11/
+	if test -s ${WORKDIR}/xorg.conf; then
+		install -d ${D}/${sysconfdir}/X11
+		install -m 0644 ${WORKDIR}/xorg.conf ${D}/${sysconfdir}/X11/
+	fi
 }
-
-- 
1.7.10.4



