Return-Path: <alex.kiernan@gmail.com>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id 3F24A6062C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Mar 2020 15:28:56 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id g62so22512836wme.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Mar 2020 08:28:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=TQmUatPkSVXyUzlvKZGS0LuZeI6oaXdDixbO2rfFwkE=;
	b=H5SrQedOUMrTclcfeC6L7YvVcgVQnCX0O1IHm6kvFCWeHr2eeARi7MYs0wQf0sr45r
	nBwAJGkm6k0Rw9vjxV3NhaXptzGW0nrNL5vV20e02Pz5zrhO/t/lUPmU6X+LuDM3UtQ9
	fnLxJB12kG+pjOEsB9DcYlvOShc0t+DgHObQaiMJKMj0KaGdNTKXDlV3pLpZBXG0fHiZ
	7xz3VPDs7/xxEYapa5bc2piCaObV96nqgODVYqtGUSF3JJd6WcVkHhqgpjoEQmfbFrmt
	sybNbB5CQDX/2LuS6GmIi8YGAe0eAgYoQ0wBOJGnJjC4OsM+IwbkxhHVlKUzX6zmvkKW
	0WmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=TQmUatPkSVXyUzlvKZGS0LuZeI6oaXdDixbO2rfFwkE=;
	b=GSl+H+5g9APn8SytGOU7/6cParOOCj7E/xbArAhNOWdWUFtEYFTVtOvpxC9ruSqLyn
	Qkt1+MdWv5w+XKvRSC9qgV4TAIVQX0T8i//Ltfq3BdJfzqBatmfiQnAqOvErWVfoECaL
	UoaOk+pis+70tA3wbs9qALUwd+xv34vNYgXf62eB4bOJNeKXnGswzKZkNtLvmZ8fGUoN
	w2bvcib/HjWuu98e+fpj1M3LGiIFV+KVghkmsFzBjRLOQgSpz/GIcfQL8q8G2u7Q+Qow
	mz6xFwT5qmZU7cRTylgKGBHUDY2LG9IuvwLdpkfNgISLSdDRtpZU2W+6J6Tw8++DZKC9
	NNyA==
X-Gm-Message-State: ANhLgQ1RA2ecZArZwwsleCW4+KuCl5/bV+TvnQ4cw+LU8LWSCiICqPTw
	KX+dWSd04NLwNv/4izJaxwElp1rD
X-Google-Smtp-Source: ADFU+vtuGSddgXNYL4FWj3M+d5g+W6ROJRqb1tOgU1j60qKEJ0eK4u+dINf7r2OsWbKtX6d4MkeYnA==
X-Received: by 2002:a1c:e3c2:: with SMTP id a185mr5543995wmh.64.1584458935471; 
	Tue, 17 Mar 2020 08:28:55 -0700 (PDT)
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net.
	[91.135.6.246])
	by smtp.gmail.com with ESMTPSA id c2sm4307128wma.39.2020.03.17.08.28.54
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 17 Mar 2020 08:28:54 -0700 (PDT)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Mar 2020 15:22:56 +0000
Message-Id: <20200317152303.4600-5-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200317152303.4600-1-alex.kiernan@gmail.com>
References: <20200317152303.4600-1-alex.kiernan@gmail.com>
Subject: [RFC PATCH 04/11] systemd: Add PACKAGECONFIG for sysvinit
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
X-List-Received-Date: Tue, 17 Mar 2020 15:28:56 -0000

Add sysvinit PACKAGECONFIG which is bound to DISTRO_FEATURES, this
then disables all sysvinit handling in systemd if it isn't present.

Consolidate sysvinit handling so that when it's disabled we exclude all
sysvinit features.

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

 meta/recipes-core/systemd/systemd_244.3.bb | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd_244.3.bb b/meta/recipes-core/systemd/systemd_244.3.bb
index b26f3cb72d2b..7c33bde21a39 100644
--- a/meta/recipes-core/systemd/systemd_244.3.bb
+++ b/meta/recipes-core/systemd/systemd_244.3.bb
@@ -56,7 +56,7 @@ PAM_PLUGINS = " \
 "
 
 PACKAGECONFIG ??= " \
-    ${@bb.utils.filter('DISTRO_FEATURES', 'efi ldconfig pam selinux usrmerge polkit', d)} \
+    ${@bb.utils.filter('DISTRO_FEATURES', 'efi ldconfig pam selinux sysvinit usrmerge polkit', d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'wifi', 'rfkill', '', d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'xkbcommon', '', d)} \
     acl \
@@ -165,6 +165,7 @@ PACKAGECONFIG[seccomp] = "-Dseccomp=true,-Dseccomp=false,libseccomp"
 PACKAGECONFIG[selinux] = "-Dselinux=true,-Dselinux=false,libselinux,initscripts-sushell"
 PACKAGECONFIG[smack] = "-Dsmack=true,-Dsmack=false"
 PACKAGECONFIG[sysusers] = "-Dsysusers=true,-Dsysusers=false"
+PACKAGECONFIG[sysvinit] = "-Dsysvinit-path=${sysconfdir}/init.d -Dsysvrcnd-path=${sysconfdir},-Dsysvinit-path= -Dsysvrcnd-path="
 # When enabled use reproducble build timestamp if set as time epoch,
 # or build time if not. When disabled, time epoch is unset.
 def build_epoch(d):
@@ -198,7 +199,6 @@ EXTRA_OEMESON += "-Dnobody-user=nobody \
                   -Dnobody-group=nobody \
                   -Drootlibdir=${rootlibdir} \
                   -Drootprefix=${rootprefix} \
-                  -Dsysvrcnd-path=${sysconfdir} \
                   -Ddefault-locale=C \
                   "
 
@@ -234,6 +234,7 @@ do_install() {
 		install -d ${D}${sysconfdir}/init.d
 		install -m 0755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/systemd-udevd
 		sed -i s%@UDEVD@%${rootlibexecdir}/systemd/systemd-udevd% ${D}${sysconfdir}/init.d/systemd-udevd
+		install -Dm 0755 ${S}/src/systemctl/systemd-sysv-install.SKELETON ${D}${systemd_unitdir}/systemd-sysv-install
 	fi
 
 	chown root:systemd-journal ${D}/${localstatedir}/log/journal
@@ -273,7 +274,6 @@ do_install() {
 		sed -i -e "s%^L! /etc/resolv.conf.*$%L! /etc/resolv.conf - - - - ../run/systemd/resolve/resolv.conf%g" ${D}${exec_prefix}/lib/tmpfiles.d/etc.conf
 		ln -s ../run/systemd/resolve/resolv.conf ${D}${sysconfdir}/resolv-conf.systemd
 	fi
-	install -Dm 0755 ${S}/src/systemctl/systemd-sysv-install.SKELETON ${D}${systemd_unitdir}/systemd-sysv-install
 
 	# If polkit is setup fixup permissions and ownership
 	if ${@bb.utils.contains('PACKAGECONFIG', 'polkit', 'true', 'false', d)}; then
@@ -560,7 +560,8 @@ FILES_${PN}-dev += "${base_libdir}/security/*.la ${datadir}/dbus-1/interfaces/ $
 
 RDEPENDS_${PN} += "kmod dbus util-linux-mount util-linux-umount udev (= ${EXTENDPKGV}) util-linux-agetty util-linux-fsck"
 RDEPENDS_${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'serial-getty-generator', '', 'systemd-serialgetty', d)}"
-RDEPENDS_${PN} += "volatile-binds update-rc.d"
+RDEPENDS_${PN} += "${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'update-rc.d', '', d)}"
+RDEPENDS_${PN} += "volatile-binds"
 
 RRECOMMENDS_${PN} += "systemd-extra-utils \
                       systemd-compat-units udev-hwdb \
-- 
2.17.1


