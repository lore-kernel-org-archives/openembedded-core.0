Received: from mail-wg0-f53.google.com ([74.125.82.53])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UQKfv-0000k6-2K
	for openembedded-core@lists.openembedded.org;
	Thu, 11 Apr 2013 18:48:39 +0200
Received: by mail-wg0-f53.google.com with SMTP id c11so1888508wgh.32
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Apr 2013 09:31:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references:x-gm-message-state;
	bh=7P2wr+8cAo/LVq+t+bVLmfTnt0Twq+81/qEUBUnfQvA=;
	b=oH6iPafSzOP2XYR8iz8I+A5XVWtkVpYp/e0jJSl299NQaeya/HTEA0DcVucYIE6LwZ
	vK35RTR9artSjAsMgavYKGWV/UrheOXufxwIj/LdVWlYkPCb/hwP6eNofgkBNjsoTNk/
	Nixcm0NMusm/mpCHnf+HotEyq6XoOmCStZ530kqspGx2Q4ls8zWwjcE5H0I57+zilama
	2rzkkCVjH6yC22lnXt4UZHley6HSct5DIw7s6H0xiH8nrz9RqB512NESVrDCMuQ3D5gb
	ko9rYQXfRQQgt3m0M761CPARHMsQD5Vsrue4raY0aIMvIOb0IVeIHMB8ViaqUN2GXAI7
	SiHg==
X-Received: by 10.194.219.162 with SMTP id pp2mr12052700wjc.27.1365697876071; 
	Thu, 11 Apr 2013 09:31:16 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id q13sm4179375wie.0.2013.04.11.09.31.14
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 11 Apr 2013 09:31:15 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 11 Apr 2013 17:28:26 +0100
Message-Id: <0154334c32234d70dc064fb7dac6b499ca91cf3a.1365697555.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1365697555.git.ross.burton@intel.com>
References: <cover.1365697555.git.ross.burton@intel.com>
In-Reply-To: <cover.1365697555.git.ross.burton@intel.com>
References: <cover.1365697555.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQkB7Kkdleu8gbyJt63jM2Lwmjfgs297pNzSzG9xpLKlHwO730xi7SRW3mRt/a2z6yClUU8s
Subject: [PATCH 2/2] initrdscripts: look for new systemd-udevd location
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
X-List-Received-Date: Thu, 11 Apr 2013 16:48:39 -0000

As per the previous commit, systemd-udevd is now in /sbin/systemd/.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-core/initrdscripts/files/init-live.sh       |    2 +-
 meta/recipes-core/initrdscripts/initramfs-framework/udev |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/initrdscripts/files/init-live.sh b/meta/recipes-core/initrdscripts/files/init-live.sh
index 9fe1cd6..4bd1b52 100644
--- a/meta/recipes-core/initrdscripts/files/init-live.sh
+++ b/meta/recipes-core/initrdscripts/files/init-live.sh
@@ -12,7 +12,7 @@ UNIONFS="no"
 # Copied from initramfs-framework. The core of this script probably should be
 # turned into initramfs-framework modules to reduce duplication.
 udev_daemon() {
-	OPTIONS="/sbin/udev/udevd /sbin/udevd /lib/udev/udevd /lib/systemd/systemd-udevd"
+	OPTIONS="/sbin/udev/udevd /sbin/udevd /lib/udev/udevd /sbin/systemd/systemd-udevd /lib/systemd/systemd-udevd"
 
 	for o in $OPTIONS; do
 		if [ -x "$o" ]; then
diff --git a/meta/recipes-core/initrdscripts/initramfs-framework/udev b/meta/recipes-core/initrdscripts/initramfs-framework/udev
index bb462dc..18d44a5 100644
--- a/meta/recipes-core/initrdscripts/initramfs-framework/udev
+++ b/meta/recipes-core/initrdscripts/initramfs-framework/udev
@@ -11,7 +11,7 @@ udev_shutdown_hook_handler() {
 }
 
 udev_daemon() {
-	OPTIONS="/sbin/udev/udevd /sbin/udevd /lib/udev/udevd /lib/systemd/systemd-udevd"
+	OPTIONS="/sbin/udev/udevd /sbin/udevd /lib/udev/udevd /sbin/systemd/systemd-udevd /lib/systemd/systemd-udevd"
 
 	for o in $OPTIONS; do
 		if [ -x "$o" ]; then
-- 
1.7.10.4



