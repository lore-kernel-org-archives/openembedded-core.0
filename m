Received: from mail-wi0-f179.google.com ([209.85.212.179])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UAi7b-0003eH-0a
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Feb 2013 15:36:57 +0100
Received: by mail-wi0-f179.google.com with SMTP id ez12so721229wid.12
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Feb 2013 06:20:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references:x-gm-message-state;
	bh=zZq5m7Mp51/eUZkcaXwgwZ39WKtc44yDlJz2hUmBlPU=;
	b=B493Etbdz9zkTkgdjjOglmgh8J7vnBqSl2uvJYJRQnoTtrSPrzZFkU6UlUJw8+B5/+
	rL49AWalDIYT72QAUh2TvWqOdcRocWKPSB/vXQZWR4wJyz+CCMAkBhuCPZ/CXzSfq3xx
	jy8WZc6EDm4kHnFqn0gzEeBgP8cpvH5iLwQ5Vsc3qGS727LQ15JXMXhG/KxcfClV+Jyn
	RMXbG30fP5e5amRex1vOhpOs1lZ6SAPAy+3K66tMOQGUG/eyvYwDUBRvgb/ImQP752K9
	9P+iid/hkih07757pNldBUfT0C84Ip2yf8RzDE8wOyoQYaPe/lOVui3z6BvrCS62twW3
	oTSA==
X-Received: by 10.194.6.2 with SMTP id w2mr4361326wjw.10.1361974817249;
	Wed, 27 Feb 2013 06:20:17 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id bs6sm9053829wib.4.2013.02.27.06.20.15
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 27 Feb 2013 06:20:16 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Feb 2013 14:17:44 +0000
Message-Id: <6eb9f87bd871b294ec0bef6744bd71a651ff8d10.1361974597.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1361974597.git.ross.burton@intel.com>
References: <cover.1361974597.git.ross.burton@intel.com>
In-Reply-To: <cover.1361974597.git.ross.burton@intel.com>
References: <cover.1361974597.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQkCxJJ2TMKYepiSAcnwbhaSRq4Nty01SZorttIcXN/qiRNQEG4qba8ZEa+SUvi12JEqzwoM
Subject: [PATCH 5/7] systemd: make xz support (compressed journal) optional
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
X-List-Received-Date: Wed, 27 Feb 2013 14:37:11 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-core/systemd/systemd_197.bb |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd_197.bb b/meta/recipes-core/systemd/systemd_197.bb
index 7a11c8c..0e13d78 100644
--- a/meta/recipes-core/systemd/systemd_197.bb
+++ b/meta/recipes-core/systemd/systemd_197.bb
@@ -11,7 +11,7 @@ PROVIDES = "udev"
 PE = "1"
 PR = "r4"
 
-DEPENDS = "xz kmod docbook-sgml-dtd-4.1-native intltool-native gperf-native acl readline dbus libcap libcgroup tcp-wrappers glib-2.0"
+DEPENDS = "kmod docbook-sgml-dtd-4.1-native intltool-native gperf-native acl readline dbus libcap libcgroup tcp-wrappers glib-2.0"
 DEPENDS += "${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 
 SECTION = "base/shell"
@@ -48,6 +48,8 @@ GTKDOC_DOCDIR = "${S}/docs/"
 PACKAGECONFIG ??= ""
 # Sign the journal for anti-tampering
 PACKAGECONFIG[gcrypt] = "--enable-gcrypt,--disable-gcrypt,libgcrypt"
+# Compress the journal
+PACKAGECONFIG[xz] = "--enable-xz,--disable-xz,xz"
 
 # The gtk+ tools should get built as a separate recipe e.g. systemd-tools
 EXTRA_OECONF = " --with-distro=${SYSTEMDDISTRO} \
-- 
1.7.10.4



