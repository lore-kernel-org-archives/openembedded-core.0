Received: from mail-wi0-f178.google.com ([209.85.212.178])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UAi7W-0003eB-MT
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Feb 2013 15:36:57 +0100
Received: by mail-wi0-f178.google.com with SMTP id hq4so720992wib.11
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Feb 2013 06:20:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references:x-gm-message-state;
	bh=ZRmayC1U2EVsoaupiMj6Hwll3Djwk8A7nk1KjpakG3E=;
	b=narJPMAf9gHaKlgbEhxWAQcfRWp/ai9Klhck1ylhBiQuJ2fW9eYEcDR7B9jFARnCbn
	FRAF+Uqw1cwNt8C5hSCKxpZIZbXlKJ94mv/HdUEZIR7N5rlOBReCstEfbCExrAfXIX1e
	pfhyFj5CELIadF0BZWPi03jERWZyfwL/EZExYUl870ugmG4xqE6eb4EIpf1LT16sorZQ
	mr3UYD/WnbwahYW0imUAjRea6qcJlQiOPapPVqORnE23Qrr+1bkHMVy98RZ3MkMJ52js
	eW4hFZyVG9pMR+c7+sEm/f0KkiEe04mWJhnQOQoU4pV8nIm5B8gWD+M671grnnkmh6kJ
	TpQQ==
X-Received: by 10.194.84.8 with SMTP id u8mr4319799wjy.29.1361974814242;
	Wed, 27 Feb 2013 06:20:14 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id bs6sm9053829wib.4.2013.02.27.06.20.12
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 27 Feb 2013 06:20:13 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Feb 2013 14:17:42 +0000
Message-Id: <74fdcfba8943824f77aa877fbe72de270974ae59.1361974597.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1361974597.git.ross.burton@intel.com>
References: <cover.1361974597.git.ross.burton@intel.com>
In-Reply-To: <cover.1361974597.git.ross.burton@intel.com>
References: <cover.1361974597.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQnnNQwUOzOkqVm4NyVwns10cp7Z3t/vFzVuUU00kld8hEOfiG3LRNZD9faAdF7SkpkHkM4U
Subject: [PATCH 3/7] systemd: make gcrypt support (for signing the journal) optional
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
 meta/recipes-core/systemd/systemd_197.bb |    6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd_197.bb b/meta/recipes-core/systemd/systemd_197.bb
index c871bb5..2232b60 100644
--- a/meta/recipes-core/systemd/systemd_197.bb
+++ b/meta/recipes-core/systemd/systemd_197.bb
@@ -11,7 +11,7 @@ PROVIDES = "udev"
 PE = "1"
 PR = "r4"
 
-DEPENDS = "xz kmod docbook-sgml-dtd-4.1-native intltool-native gperf-native acl readline dbus libcap libcgroup tcp-wrappers glib-2.0 libgcrypt"
+DEPENDS = "xz kmod docbook-sgml-dtd-4.1-native intltool-native gperf-native acl readline dbus libcap libcgroup tcp-wrappers glib-2.0"
 DEPENDS += "${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 
 SECTION = "base/shell"
@@ -49,6 +49,10 @@ CACHED_CONFIGUREVARS = "ac_cv_file__usr_share_pci_ids=no \
 
 GTKDOC_DOCDIR = "${S}/docs/"
 
+PACKAGECONFIG ??= ""
+# Sign the journal for anti-tampering
+PACKAGECONFIG[gcrypt] = "--enable-gcrypt,--disable-gcrypt,libgcrypt"
+
 # The gtk+ tools should get built as a separate recipe e.g. systemd-tools
 EXTRA_OECONF = " --with-distro=${SYSTEMDDISTRO} \
                  --with-rootprefix=${base_prefix} \
-- 
1.7.10.4



