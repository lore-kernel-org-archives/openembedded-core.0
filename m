Return-Path: <alex.kiernan@gmail.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id A6AD17DE6F
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 May 2019 15:57:46 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id v10so2655356wrt.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 May 2019 08:57:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=iXzhoG012yHgAF0q8DYNl21wliZrhSpIc32XDcAGDgo=;
	b=iUPDiqkSpPcWk8iKZAZASxekXSmg9JEkHe89FYJe/sbIV/X29qO9hsvqy5HEntMOr/
	wijtNuj0sTnHkTFiptAVpXB0vGTnvkrEKrKO4OnMVsqD8hcEiGs+upoZGlaxreNwDesW
	bPanES2G6ePpPqNguiain168hu1I8gm5t9fSE85++FMVuPx89IyOqqBzLZT5ArluTCHc
	fRhD7hvyBCOKUJNYZ2SqGQLh37MnCVh/nN+fhMC/TIslE5ij5UI7mE1s7rUq0FUF9L/K
	EmYVzKjeGG6kedFm6UFmuJXXzMo8YLd76Xl9R9ESWCPFVkP4rC700TNtsIHZxIavbZov
	SA/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=iXzhoG012yHgAF0q8DYNl21wliZrhSpIc32XDcAGDgo=;
	b=YiTlsjWsQM6BkJ0mAQgYwuA1ateblKhgJikrOI5g9CdSEI3L0LS0v+OomjB6307dK8
	6Fl9qeNMV3ZIgJ/wHEwjO25NWwK58udR1ZJUpZ5sA2N+BEhJMwxoRs0LdrnM/tARMEqF
	ydHy5Ot4fFfC2youyddCIZvAOPuGqa5z7NmOZ8A2cFhrxnZDG1FGbTzR5PwiKYQ4moE1
	Kbn3Fauvpk4Oc0p507PxH2M+4mMSefr7AvkCV1oYjXEisTIAQNdXFOovq1Alk3GPgVie
	16Jm81ybe8rDck01FwsKm8Iyug8FshBrtoI9z2dL8vkCjJ65ap0+b0qcKN58feZ8RkQC
	4pdg==
X-Gm-Message-State: APjAAAVymuxhYQNQxH8IHiZYGlvMkGJbqje5ag39GOBGAxxKX1s5emyB
	r8hT6gjJtgO6GZgegyth1/+eKX/A
X-Google-Smtp-Source: APXvYqyCY6+5D4kit122KExjgjH1tp648pJzos5opLpVvj2dQOS/i8oFio+9KxGt4FKVjYQlN+4iKA==
X-Received: by 2002:adf:e44b:: with SMTP id t11mr6158657wrm.151.1557331067385; 
	Wed, 08 May 2019 08:57:47 -0700 (PDT)
Received: from localhost.localdomain (193.164.125.18.ip.redstone-isp.net.
	[193.164.125.18])
	by smtp.gmail.com with ESMTPSA id m6sm4027175wmc.32.2019.05.08.08.57.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 08 May 2019 08:57:46 -0700 (PDT)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  8 May 2019 16:57:26 +0100
Message-Id: <20190508155728.66729-2-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190508155728.66729-1-alex.kiernan@gmail.com>
References: <20190508155728.66729-1-alex.kiernan@gmail.com>
Subject: [PATCH v2 1/3] systemd: Default to non-stateless images
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
X-List-Received-Date: Wed, 08 May 2019 15:57:47 -0000

When creating images, for anything other than the explicitly stateless
case, touch /etc/machine-id so that the images can be booted without an
initramfs and with `ro` set on the kernel command line, otherwise system
refuses to start:

  [    7.222134] systemd[1]: No hostname configured.
  [    7.227266] systemd[1]: Set hostname to <localhost>.
  [    7.232622] systemd[1]: System cannot boot: Missing /etc/machine-id and /etc is mounted read-only.
  [    7.241750] systemd[1]: Booting up is supported only when:
  [    7.247362] systemd[1]: 1) /etc/machine-id exists and is populated.
  [    7.253752] systemd[1]: 2) /etc/machine-id exists and is empty.
  [    7.259757] systemd[1]: 3) /etc/machine-id is missing and /etc is writable.

If IMAGE_FEATURES includes `stateless-rootfs` then systemctl-native is
not run on the image leaving the image for population at runtime by
systemd.

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

Changes in v2:
- use stateless-rootfs in IMAGE_FEATURES, not DISTRO_FEATURES

 meta/classes/image.bbclass                            | 9 ++++-----
 meta/recipes-core/systemd/systemd-systemctl/systemctl | 9 +++++++++
 2 files changed, 13 insertions(+), 5 deletions(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index a23403c0827a..d2b2fb979e5f 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -33,7 +33,7 @@ INHIBIT_DEFAULT_DEPS = "1"
 # IMAGE_FEATURES may contain any available package group
 IMAGE_FEATURES ?= ""
 IMAGE_FEATURES[type] = "list"
-IMAGE_FEATURES[validitems] += "debug-tweaks read-only-rootfs empty-root-password allow-empty-password allow-root-login post-install-logging"
+IMAGE_FEATURES[validitems] += "debug-tweaks read-only-rootfs stateless-rootfs empty-root-password allow-empty-password allow-root-login post-install-logging"
 
 # Generate companion debugfs?
 IMAGE_GEN_DEBUGFS ?= "0"
@@ -665,12 +665,11 @@ reproducible_final_image_task () {
     fi
 }
 
-IMAGE_EXTRADEPENDS += "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd-systemctl-native', '', d)}"
-
 systemd_preset_all () {
-	systemctl --root="${IMAGE_ROOTFS}" --preset-mode=enable-only preset-all
+    systemctl --root="${IMAGE_ROOTFS}" --preset-mode=enable-only preset-all
 }
 
-IMAGE_PREPROCESS_COMMAND_append = " ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd_preset_all;', '', d)} reproducible_final_image_task; "
+IMAGE_EXTRADEPENDS += "${@ 'systemd-systemctl-native' if bb.utils.contains('DISTRO_FEATURES', 'systemd', True, False, d) and not bb.utils.contains('IMAGE_FEATURES', 'stateless-rootfs', True, False, d) else ''}"
+IMAGE_PREPROCESS_COMMAND_append = " ${@ 'systemd_preset_all;' if bb.utils.contains('DISTRO_FEATURES', 'systemd', True, False, d) and not bb.utils.contains('IMAGE_FEATURES', 'stateless-rootfs', True, False, d) else ''} reproducible_final_image_task; "
 
 CVE_PRODUCT = ""
diff --git a/meta/recipes-core/systemd/systemd-systemctl/systemctl b/meta/recipes-core/systemd/systemd-systemctl/systemctl
index d7d4e0d29a09..7fdaf8ce03d9 100755
--- a/meta/recipes-core/systemd/systemd-systemctl/systemctl
+++ b/meta/recipes-core/systemd/systemd-systemctl/systemctl
@@ -241,6 +241,15 @@ def preset_all(root):
         if state == "enable" or state is None:
             enable(root, service, location, services)
 
+    # If we populate the systemd links we also create /etc/machine-id, which
+    # allows systemd to boot with the filesystem read-only before generating
+    # a real value and then committing it back.
+    #
+    # For the stateless configuration, where /etc is generated at runtime
+    # (for example on a tmpfs), this script shouldn't run at all and we
+    # allow systemd to completely populate /etc.
+    (root / SYSCONFDIR / "machine-id").touch()
+
 
 def mask(root, *services):
     systemdir = root / SYSCONFDIR / "systemd" / "system"
-- 
2.17.1


