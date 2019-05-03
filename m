Return-Path: <alex.kiernan@gmail.com>
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
	[209.85.221.47])
	by mail.openembedded.org (Postfix) with ESMTP id A7BBD7DDE0
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 May 2019 16:48:52 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id l2so8680183wrb.9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 03 May 2019 09:48:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=CCr1KLrcUuMH0CIsUdLQIIfXssCw6iHUYuqOotoJsgI=;
	b=lm4fkR3eM6/cHx9ZKVWGWcwzSRAXy1nwreGfKkm+DZBJdKZGnkcfPT6fCfUQTsa1cz
	cw3qVlZw813AAud8HYsOvuI+5WOkLn0vdBKzZhPnniq3HlaHtajGPHQ4qeSFjQ/sMJR2
	BiDkyEwtTrKfuK6Pw55hcTqolmbzAyIK6d8jmPiB7gMkDlbrEOts7eNYcVIzLXJ5snsC
	e+ILPTs1N58Pe+yiEsp8Cnv5MAlBBjQKr+889v+OrYfOROs2VVz3vA4RFQZsYCtoG8YL
	y3BeEPvXdP8VSsJzXlwOfLpCFZZBLlnksmj/9ymo5LLNw8Iij3L++kD9V81jb3QoQN/h
	orLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=CCr1KLrcUuMH0CIsUdLQIIfXssCw6iHUYuqOotoJsgI=;
	b=bfvvuSRR5V6ZAY7vXt3koAHcKfW5A5Uw0bHRh3EkhGL4ziq3pbwuq8lGxGy0168Izt
	cC9QaO73IW3vkvgOrkkj+iDNF3Ruh02XTsTnKyNwxRPDs6qzKOBXWw0JUodc2OQ76Rei
	YdhIZOZx7Qk/eJP5qWmLOpYJ459xCTJgqMkiKuj1G/hX8gAd5rD7JXwjvxQ5yESoRiqx
	wfN7+CPWNWAtwqMxCyecx1YwvG+FqWTlXFPalZ4KkRx4vwz9LLoffN315tHLQpQpGPXp
	CB61bepqlbOcvd4OQuWZwMZjFoVtW9kJrD9UtkHw/lt1fsNSnPD0VeAldnZkToGpGorI
	PbrQ==
X-Gm-Message-State: APjAAAVCnl1uVx5xB7XSGRjpDmILP+EsWN8VB07WeidbcIf406UH7t1j
	SwVC6kFIkQ3X5C4zyPiZ2UUzVMbg
X-Google-Smtp-Source: APXvYqxfGaUzHOefxwzVzf0tiOIyHgwlcxjrCCjhwFPgSgQ8r+5tc1a1N+zljvf70Yvjm+Rq1xzchQ==
X-Received: by 2002:a5d:69cb:: with SMTP id s11mr7576174wrw.315.1556902133059; 
	Fri, 03 May 2019 09:48:53 -0700 (PDT)
Received: from localhost.localdomain (193.164.125.18.ip.redstone-isp.net.
	[193.164.125.18])
	by smtp.gmail.com with ESMTPSA id 10sm3785321wmn.4.2019.05.03.09.48.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 03 May 2019 09:48:52 -0700 (PDT)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  3 May 2019 17:48:50 +0100
Message-Id: <20190503164850.130865-1-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] systemd: Default to non-stateless images
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
X-List-Received-Date: Fri, 03 May 2019 16:48:53 -0000

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

If DISTRO_FEATURES includes `stateless` then systemctl-native is not run
on the image leaving the image for population at runtime by systemd.

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

 meta/classes/image.bbclass                            | 7 +++----
 meta/recipes-core/systemd/systemd-systemctl/systemctl | 8 ++++++++
 2 files changed, 11 insertions(+), 4 deletions(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index a23403c0827a..3cb185dd2045 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
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
+IMAGE_EXTRADEPENDS += "${@ 'systemd-systemctl-native' if bb.utils.contains('DISTRO_FEATURES', 'systemd', True, False, d) and not bb.utils.contains('DISTRO_FEATURES', 'stateless', True, False, d) else ''}"
+IMAGE_PREPROCESS_COMMAND_append = " ${@ 'systemd_preset_all;' if bb.utils.contains('DISTRO_FEATURES', 'systemd', True, False, d) and not bb.utils.contains('DISTRO_FEATURES', 'stateless', True, False, d) else ''} reproducible_final_image_task; "
 
 CVE_PRODUCT = ""
diff --git a/meta/recipes-core/systemd/systemd-systemctl/systemctl b/meta/recipes-core/systemd/systemd-systemctl/systemctl
index d7d4e0d29a09..7da8f23ab893 100755
--- a/meta/recipes-core/systemd/systemd-systemctl/systemctl
+++ b/meta/recipes-core/systemd/systemd-systemctl/systemctl
@@ -241,6 +241,14 @@ def preset_all(root):
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
 
 def mask(root, *services):
     systemdir = root / SYSCONFDIR / "systemd" / "system"
-- 
2.17.1


