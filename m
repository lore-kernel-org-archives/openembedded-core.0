Return-Path: <ross.burton@intel.com>
Received: from mail-wr0-f174.google.com (mail-wr0-f174.google.com
	[209.85.128.174])
	by mail.openembedded.org (Postfix) with ESMTP id 8B27A77A46
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Mar 2017 09:33:57 +0000 (UTC)
Received: by mail-wr0-f174.google.com with SMTP id u1so95323604wra.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Mar 2017 02:33:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=0i11ksVxuowiJTwd/Y9Yl/m+mA3KxOiJC58t0iEKdLU=;
	b=KmhNhjeA3F+Ujxn84q74rQYR4Q/48TYnj4jB6y90SbJbEiXEAoJalCXuZJO1CpexcY
	eizz5xF61p/s/BihEYNdQUgOXSjQIZIBsU/i/8eS6gS2XfbHAxoeQ3zYC830A/1J3NGy
	qoA3ag+LZ7u8Mwz9FDYV8129zmmHlUbQ3DazLGPQRM6WdXCd5qEXLh/sbl9Or6b0sM7c
	25j2YKW+U8Eopcp4MHvSdGTExxFcS5KYJa5LjPUTdiDNnr/9P8uSeBxRTJblNSoPAOqI
	XT7mQco+cWX78PvxJozOXZ+T+XkiwwgCFfd/vW5X8Rqwwc6Zv9eTuMdWXRZTkA6TT+8B
	fpww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=0i11ksVxuowiJTwd/Y9Yl/m+mA3KxOiJC58t0iEKdLU=;
	b=hJXu6qQIKG7RUSmz1D3jelBCwvmUB9eaP6LZuzPQJULvWpf658dqUyBcEeqOxb3fy/
	RVT3W+U5X0GSqVkX1qIaLwCUFyimg7DM5NFzmU6ra60dby1GLKbZEYIOICa7XbuK7ZTJ
	0+W+0tAz+fCpPDjZRJ0P/aHMUZDwfl1lSWAlxosoV6lHX9zE64j9wJvV3jLzq0BD2xD7
	AqvqKrPmPg/LpNCID66Y/W+ywUzLbktw9xIDjIu7othPkXMc4WP7A9Ux+y/M5NMZHh1u
	b6bDm0QU/gTW2wea5Q8pLPNS4vwIhRqldoCtY009kBfR863MGAbcrArgiqbDX7tbdNYc
	ni/w==
X-Gm-Message-State: AFeK/H0gLyUA+JsAV1OZUygeIfnyeGgkT9/VuR9fIPIXFaQ/Cjiej+gK7O90E2jqrYU8DJjT
X-Received: by 10.28.23.194 with SMTP id 185mr3096578wmx.52.1490693638018;
	Tue, 28 Mar 2017 02:33:58 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	m14sm4081975wrb.22.2017.03.28.02.33.56
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 28 Mar 2017 02:33:56 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 28 Mar 2017 10:33:54 +0100
Message-Id: <1490693634-29673-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.1
Subject: [PATCH] dnf: remove systemd units in nativesdk builds
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
X-List-Received-Date: Tue, 28 Mar 2017 09:33:58 -0000

If the DISTRO_FEATURES contain systemd then the systemd class won't delete the
units for us. Until the class is fixed to do this automatically, delete them
explicitly.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-devtools/dnf/dnf_git.bb | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/recipes-devtools/dnf/dnf_git.bb b/meta/recipes-devtools/dnf/dnf_git.bb
index 7d7f597..b6b6cea 100644
--- a/meta/recipes-devtools/dnf/dnf_git.bb
+++ b/meta/recipes-devtools/dnf/dnf_git.bb
@@ -42,6 +42,12 @@ do_install_append_class-native() {
                 RPM_NO_CHROOT_FOR_SCRIPTS=1
 }
 
+# If the distro uses systemd then these won't be deleted by systemd.bbclass
+do_install_append_class-nativesdk() {
+    rm -rf ${D}/${systemd_unitdir}
+    rmdir --ignore-fail-on-non-empty ${D}${nonarch_base_libdir}
+}
+
 SYSTEMD_SERVICE_${PN} = "dnf-makecache.service dnf-makecache.timer \
                          dnf-automatic-download.service dnf-automatic-download.timer \
                          dnf-automatic-install.service dnf-automatic-install.timer \
-- 
2.8.1


