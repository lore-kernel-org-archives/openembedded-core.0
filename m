Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f173.google.com (mail-wi0-f173.google.com
	[209.85.212.173])
	by mail.openembedded.org (Postfix) with ESMTP id 1514E737FC
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Feb 2015 15:00:20 +0000 (UTC)
Received: by widem10 with SMTP id em10so761540wid.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Feb 2015 07:00:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=Y9DrteEfJgD8w3464BQuatGBGeJyO0dUoRAQbB5Lts4=;
	b=aSDhHry/BdGO9qhae+GIBnkjIGO+i3gOA1EeQpQ39CPBLAjIq1KVLgeSY77SMSuKaP
	vTM00sq8HWQeNcaKrCCvWvkrEFvmcVPt1TnMKyh1cNWrRU2UXGPtfVBB/6rBWC6JTLGg
	CB2Jz3WHTYnpKwQIKi5JDO2sKtjuuVmLvUQcucuZs9qLpszraHKi+BEYi9htrTAnUMRS
	k3lH4AO6F3mgkcRDuT5GLFf3mVJc4uYmdPhOB0r554uZwdNXI/DCdY+0ODmGFUbYzQco
	7LsFn0btx17n1ARYitH7ySfce8BgHbetO6viDzL3KwR8lQ1zVXxfyUhGe1bRmjyEhSZ+
	L72g==
X-Gm-Message-State: ALoCoQnJx/w/zK8hWdRIGCNVnpA0JkJ5FtBt84TN8bYv8eORVTTpy/s5gBqz7pkR5DO0WUHvgTnq
X-Received: by 10.180.82.129 with SMTP id i1mr7117445wiy.77.1425049221786;
	Fri, 27 Feb 2015 07:00:21 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by mx.google.com with ESMTPSA id dt7sm3138905wib.19.2015.02.27.07.00.19
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 27 Feb 2015 07:00:20 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 27 Feb 2015 14:57:48 +0000
Message-Id: <1425049068-11139-3-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1425049068-11139-1-git-send-email-ross.burton@intel.com>
References: <1425049068-11139-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 3/3] systemd: add PACKAGECONFIG for xkbcommon and iptables
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
X-List-Received-Date: Fri, 27 Feb 2015 15:00:21 -0000

systemd has optional support for xkbcommon (verify keymaps when locale changes)
and iptables (configure NAT rules).

Add PACKAGECONFIG options for these, disabling iptables by default and
respecting the X11 DISTRO_FEATURE for libxkbcommon (as the code involves X11
keymaps).

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-core/systemd/systemd_219.bb |    9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd_219.bb b/meta/recipes-core/systemd/systemd_219.bb
index 747964e..f245239 100644
--- a/meta/recipes-core/systemd/systemd_219.bb
+++ b/meta/recipes-core/systemd/systemd_219.bb
@@ -55,7 +55,10 @@ LDFLAGS_append_libc-uclibc = " -lrt"
 
 GTKDOC_DOCDIR = "${S}/docs/"
 
-PACKAGECONFIG ??= "xz ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam', '', d)}"
+PACKAGECONFIG ??= "xz \
+                   ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam', '', d)} \
+                   ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'xkbcommon', '', d)}"
+
 PACKAGECONFIG[journal-upload] = "--enable-libcurl,--disable-libcurl,curl"
 # Sign the journal for anti-tampering
 PACKAGECONFIG[gcrypt] = "--enable-gcrypt,--disable-gcrypt,libgcrypt"
@@ -73,6 +76,10 @@ PACKAGECONFIG[libidn] = "--enable-libidn,--disable-libidn,libidn"
 PACKAGECONFIG[audit] = "--enable-audit,--disable-audit,audit"
 PACKAGECONFIG[manpages] = "--enable-manpages,--disable-manpages,libxslt-native xmlto-native docbook-xml-dtd4-native docbook-xsl-stylesheets-native"
 PACKAGECONFIG[pam] = "--enable-pam,--disable-pam,libpam"
+# Verify keymaps on locale change
+PACKAGECONFIG[xkbcommon] = "--enable-xkbcommon,--disable-xkbcommon,libxkbcommon"
+# Update NAT firewall rules
+PACKAGECONFIG[iptc] = "--enable-libiptc,--disable-libiptc,iptables"
 
 CACHED_CONFIGUREVARS = "ac_cv_path_KILL=${base_bindir}/kill"
 
-- 
1.7.10.4


