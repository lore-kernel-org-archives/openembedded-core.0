Return-Path: <armccurdy@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id 1931378542
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Nov 2017 19:39:43 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id u70so10352087pfa.7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Nov 2017 11:39:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=xqFfjsaFUkcvmRF8SLrWRQo0+Kmc1sGrzIkzD/bI7EY=;
	b=kWTPmaT3aUhUk2Gybcvc6WfaHurWQ8gTYZH8JDjBW1M3TYkO0EkOdM+E1vTZzF/is0
	ozqvokPjYg6tyGviMl+ZCuEvioZif5phj5d4pAg3GO0nsIM93pg3BMPbPxB3BGEucA2U
	YAUz8M96oMu3J7vAjJ6niq+wblohYhVuGXs/cxnVX/RzP2BHLNX3+z0feQpCBUj5vYjq
	S6fYTrFtjJiLUX1GfDecxpiAeILVhq6voTE8SJH70KE+HbhFwMjNE/3n1sQ0cko7upRS
	TJLPY56sjZRLlPrIBqzAAqg6IG89obfl69WHb7DCB12TgNS2i0yX1HB2beZD03JuE5cs
	DtYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=xqFfjsaFUkcvmRF8SLrWRQo0+Kmc1sGrzIkzD/bI7EY=;
	b=Gbgb6wHRxHhN0QDMS39hDEMWFPnTBlL+5vlMN5JcLKdA/CHAWBWIDQZsuE46yfjyW1
	4TGk7eqyemwfaYcP7vc3cKK1EQBuH0qofTnM5U8W+qc4IA4d4AFDVbAP66GRUfmo8eaG
	piQhNi7Tp9w1xrAgAYB0talagoa7MkEgIbk7E/y31OSS4duSy4CcMFjPwzdKtye3vvmi
	lC62eKKql/kZY7MLSGRGunRVJ6X4fPGZ+IbjxDNvnj/qojjtO7saqMs8Wpjg5rnXJMSH
	4hNtfkFZT2dMb1lWBwIogySYXFWUO1wmnrBBhvasKWhyuO1hsOiJ1QSKNKX08vuyNZAo
	YhBQ==
X-Gm-Message-State: AJaThX5tg6UTW31OVLfmWGke/CHbrFbhJlUJBGL6/XT0V4/D2qWA+mjN
	kJeS+ThB6Ytu++u1uCVzsiZJMg==
X-Google-Smtp-Source: AGs4zMbRxVQfltOTOvP83MjchrDtz+RBKISPx0cdaDOqlrN5NDgaVLZwTsBWduSsmw8XVfVgxVUZJA==
X-Received: by 10.84.208.227 with SMTP id c32mr12938036plj.91.1510688380997;
	Tue, 14 Nov 2017 11:39:40 -0800 (PST)
Received: from e6520.guest-wifi.scl.liberty.com ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	f4sm30804162pgs.30.2017.11.14.11.39.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 14 Nov 2017 11:39:40 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Nov 2017 11:39:21 -0800
Message-Id: <1510688364-32667-4-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1510688364-32667-1-git-send-email-armccurdy@gmail.com>
References: <1510688364-32667-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 3/6] systemd: use consistent approach for musl PACKAGECONFIG options
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
X-List-Received-Date: Tue, 14 Nov 2017 19:39:44 -0000

Consistently use PACKAGECONFIG_remove_libc-musl to disable options
which are not compatible with musl.

Also sort the default PACKAGECONFIG list.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-core/systemd/systemd_234.bb | 67 ++++++++++++++++++--------------
 1 file changed, 38 insertions(+), 29 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd_234.bb b/meta/recipes-core/systemd/systemd_234.bb
index 6946538..b7968b1 100644
--- a/meta/recipes-core/systemd/systemd_234.bb
+++ b/meta/recipes-core/systemd/systemd_234.bb
@@ -50,36 +50,45 @@ PAM_PLUGINS = " \
     pam-plugin-keyinit \
 "
 
-PACKAGECONFIG ??= "xz \
-                   ${@bb.utils.filter('DISTRO_FEATURES', 'efi pam selinux ldconfig usrmerge', d)} \
-                   ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'xkbcommon', '', d)} \
-                   ${@bb.utils.contains('DISTRO_FEATURES', 'wifi', 'rfkill', '', d)} \
-                   binfmt \
-                   randomseed \
-                   machined \
-                   backlight \
-                   vconsole \
-                   quotacheck \
-                   hostnamed \
-                   ${@bb.utils.contains('TCLIBC', 'glibc', 'myhostname sysusers utmp', '', d)} \
-                   nss \
-                   hibernate \
-                   timedated \
-                   timesyncd \
-                   localed \
-                   ima \
-                   smack \
-                   logind \
-                   firstboot \
-                   polkit \
-                   resolved \
-                   networkd \
+PACKAGECONFIG ??= " \
+    ${@bb.utils.filter('DISTRO_FEATURES', 'efi ldconfig pam selinux usrmerge', d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'wifi', 'rfkill', '', d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'xkbcommon', '', d)} \
+    backlight \
+    binfmt \
+    firstboot \
+    hibernate \
+    hostnamed \
+    ima \
+    localed \
+    logind \
+    machined \
+    myhostname \
+    networkd \
+    nss \
+    polkit \
+    quotacheck \
+    randomseed \
+    resolved \
+    smack \
+    sysusers \
+    timedated \
+    timesyncd \
+    utmp \
+    vconsole \
+    xz \
+"
+
+PACKAGECONFIG_remove_libc-musl = " \
+    localed \
+    myhostname \
+    nss \
+    resolved \
+    selinux \
+    smack \
+    sysusers \
+    utmp \
 "
-PACKAGECONFIG_remove_libc-musl = "selinux"
-PACKAGECONFIG_remove_libc-musl = "smack"
-PACKAGECONFIG_remove_libc-musl = "resolved"
-PACKAGECONFIG_remove_libc-musl = "nss"
-PACKAGECONFIG_remove_libc-musl = "localed"
 
 # Use the upstream systemd serial-getty@.service and rely on
 # systemd-getty-generator instead of using the OE-core specific
-- 
1.9.1


