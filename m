Return-Path: <ross.burton@intel.com>
Received: from mail-wg0-f45.google.com (mail-wg0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id 5709C60E23
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Jun 2014 20:07:18 +0000 (UTC)
Received: by mail-wg0-f45.google.com with SMTP id m15so7227240wgh.28
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 Jun 2014 13:07:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=UIIT5O/uxD0Su49/rLv+XfosvcmfUz6TlpwMpVpJpg0=;
	b=fZeDVEdwFP3ETOED5jFKqqxHmPfPVOuCbxoK9MxqRSQJs5yqDBMJU5JjwiOS7Nlkzj
	ZqqnAe1Xs0YGr7bWZ4sJ5ibplFTcrdybn+P0LVKNEnkq3My3dxkVXIe89R9KbCi5FDsd
	KCpj0IiWP5DAOwhMgq7CKHJpps2SnaRL/FybK257jZ0kwjlI2KiJu4lA2XS0uWV7tinB
	buBBXY0CRqTRjzKOjEVhME/Q06E6Rp8fCRdiEHezevyga7BwkWwlGlqdWttYyd+4HVfQ
	6TxmfwAyLp/syZvJx6jw9rGVRIcizyseuLmxQWkDAWwY2niuWuwIrOxInsRJjXuJEJlK
	n5fg==
X-Gm-Message-State: ALoCoQnc8DnhmqFdrNM4TQ5dYqLdeQnEBFIdqpoO8mshVcLdNv0egSxTTf4WVHSZhKBNfZOdAEFS
X-Received: by 10.194.71.19 with SMTP id q19mr45504256wju.21.1401826039369;
	Tue, 03 Jun 2014 13:07:19 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id z14sm5610835wiu.6.2014.06.03.13.07.18
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 03 Jun 2014 13:07:18 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  3 Jun 2014 21:07:10 +0100
Message-Id: <1401826030-4161-2-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1401826030-4161-1-git-send-email-ross.burton@intel.com>
References: <1401826030-4161-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 2/2] readline-5.2: exclude autoheader
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
X-List-Received-Date: Tue, 03 Jun 2014 20:07:26 -0000

readline hand-maintains config.h.in so exclude autoheader and re-use a patch
from readline-6.3 to fix a typo in variable names.

See oe-core 8c37d32d6133c6ad2b9142e7a42775e7a979b570 against readline-6.3 for
further rationale.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../readline/{readline-6.3 => files}/config-dirent-symbols.patch    |    0
 meta/recipes-core/readline/readline_5.2.bb                          |    3 +++
 2 files changed, 3 insertions(+)
 rename meta/recipes-core/readline/{readline-6.3 => files}/config-dirent-symbols.patch (100%)

diff --git a/meta/recipes-core/readline/readline-6.3/config-dirent-symbols.patch b/meta/recipes-core/readline/files/config-dirent-symbols.patch
similarity index 100%
rename from meta/recipes-core/readline/readline-6.3/config-dirent-symbols.patch
rename to meta/recipes-core/readline/files/config-dirent-symbols.patch
diff --git a/meta/recipes-core/readline/readline_5.2.bb b/meta/recipes-core/readline/readline_5.2.bb
index 6a37849..fe610e3 100644
--- a/meta/recipes-core/readline/readline_5.2.bb
+++ b/meta/recipes-core/readline/readline_5.2.bb
@@ -28,6 +28,7 @@ SRC_URI = "${GNU_MIRROR}/readline/${BPN}-${PV}.tar.gz;name=archive \
            ${GNU_MIRROR}/readline/readline-5.2-patches/readline52-013;name=patch13;apply=yes;striplevel=0 \
            ${GNU_MIRROR}/readline/readline-5.2-patches/readline52-014;name=patch14;apply=yes;striplevel=0 \
            file://configure-fix.patch \
+           file://config-dirent-symbols.patch \
            file://fix-redundant-rpath.patch"
 
 SRC_URI[archive.md5sum] = "e39331f32ad14009b9ff49cc10c5e751"
@@ -66,6 +67,8 @@ S = "${WORKDIR}/${BPN}-${PV}"
 
 inherit autotools
 
+EXTRA_AUTORECONF += "--exclude=autoheader"
+
 LEAD_SONAME = "libreadline.so"
 
 do_configure_prepend () {
-- 
1.7.10.4


