Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com
	[209.85.208.42])
	by mail.openembedded.org (Postfix) with ESMTP id C0BD07F1BA
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Aug 2019 07:17:46 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id p15so85093738eds.8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 07 Aug 2019 00:17:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=jUGfGFZSc5eKIaJUeDmJRHAqjX84H5bSnPYUYDLq0zo=;
	b=kVimhrLIhQq38NRUp/8OSQ+Ze2nx/ZEC6xweIiA2FsInt5+ElNQofhQ7LiitjcSBaW
	cp6ImNzmOODCMEhcoVHac3LMUu9OAPvgsOJJUgK8EFIW2rcrVF+bNeuyojjZwOLaaen2
	u5Es2QGs7E8JUSoFl0zxSy/2L3uxfe1yQ8qwlrqB/iL9t+HXTo1Huox+REeAOvJA2OmU
	6SBA9JOcy/VxxC0hImF4hZil+rikH2mKt7iye/8u/j8ApiPNGkXcwqsZZnk2pMzcGz04
	q//Q7Cx4VJgHaLAU7se1jSvD2ZsiPCNAqhc+qhQ2QMWjk8xTpLreYhQEUzASPlh0SiFI
	2p2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding;
	bh=jUGfGFZSc5eKIaJUeDmJRHAqjX84H5bSnPYUYDLq0zo=;
	b=owG2zpZJ9h1NcNYouTdQg7EVH30fdSaWG62TmxDqprphrKbIyrGXoVQK8CM5sQDoV8
	8K/8UEm9bN+5NLNIUHn6UlMnrSS73vIySkOmH71E67omnXJOb/oVG/QYpcSFXaPdVHYI
	TEbYas5T4EXlRikQlBnF/gZehDPzyaYhYpw4hRF6BBzAHWs4onpPTzu0ByLs9x2prdwQ
	cXx5OlKgckPe6nkWfrQfyYLjPWLWi2VHIYGeJtuI5YiDQ3S4DNpzF2Pr7lkqin6tYmsE
	UlfuxPL0UGxybLbEqNnYpU57uBI+N3hHFxK4z6v1We/4cFwwDqdj0mpZfjcOyKuOdCUC
	XGEQ==
X-Gm-Message-State: APjAAAWNUIAy2sz5yrVMB5bIUBamBfYeleeLv9hTSCiW7Am585NkXJGG
	wKvUs5FaFneE6LtcRiGzP6iBAV6WylY=
X-Google-Smtp-Source: APXvYqySTFS9v1WPane8O0R02oRtnXLMixxo6NQmg+qEFj+GViGNMPUMBC1MZksyAKJ3er78Si8dfg==
X-Received: by 2002:aa7:c692:: with SMTP id n18mr7981765edq.220.1565162267233; 
	Wed, 07 Aug 2019 00:17:47 -0700 (PDT)
Received: from neopili.qtec.com
	(cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
	by smtp.gmail.com with ESMTPSA id
	q21sm15158204ejo.76.2019.08.07.00.17.46
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Wed, 07 Aug 2019 00:17:46 -0700 (PDT)
Sender: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
From: Ricardo Ribalda Delgado <ricardo@ribalda.com>
To: openembedded-core@lists.openembedded.org,
	raj.khem@gmail.com
Date: Wed,  7 Aug 2019 09:17:44 +0200
Message-Id: <20190807071744.15340-1-ricardo@ribalda.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: Ricardo Ribalda Delgado <ricardo@ribalda.com>
Subject: [PATCH v2] inetutils: Fix abort on invalid files
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
X-List-Received-Date: Wed, 07 Aug 2019 07:17:48 -0000
Content-Transfer-Encoding: 8bit

When the code is compiled with  "-fstack-protector-strong
-D_FORTIFY_SOURCE=2", everytime ftpfd is asked for a non existent file,
it crashes with the following error:

*** buffer overflow detected ***:
Aborted

This seems to be a bug/feature of gcc. A bug has been open on their
bugzilla, and also inetutils have been posted with the proposed patch.

Without this patch, pxelinux fails to boot because it keeps asking the
server for the pxelinux.cfg/00-01-02-03-04 and never jumps to /default.

Signed-off-by: Ricardo Ribalda Delgado <ricardo@ribalda.com>
---
 .../inetutils/fix-buffer-fortify-tfpt.patch   | 25 +++++++++++++++++++
 .../inetutils/inetutils_1.9.4.bb              |  1 +
 2 files changed, 26 insertions(+)
 create mode 100644 meta/recipes-connectivity/inetutils/inetutils/fix-buffer-fortify-tfpt.patch

diff --git a/meta/recipes-connectivity/inetutils/inetutils/fix-buffer-fortify-tfpt.patch b/meta/recipes-connectivity/inetutils/inetutils/fix-buffer-fortify-tfpt.patch
new file mode 100644
index 0000000000..a91913cb51
--- /dev/null
+++ b/meta/recipes-connectivity/inetutils/inetutils/fix-buffer-fortify-tfpt.patch
@@ -0,0 +1,25 @@
+tftpd: Fix abort on error path
+
+When trying to fetch a non existent file, the app crashes with:
+
+*** buffer overflow detected ***: 
+Aborted
+
+
+Upstream-Status: Submitted [https://www.mail-archive.com/bug-inetutils@gnu.org/msg03036.html https://gcc.gnu.org/bugzilla/show_bug.cgi?id=91205]
+Signed-off-by: Ricardo Ribalda Delgado <ricardo@ribalda.com>
+diff --git a/src/tftpd.c b/src/tftpd.c
+index 56002a0..144012f 100644
+--- a/src/tftpd.c
++++ b/src/tftpd.c
+@@ -864,9 +864,8 @@ nak (int error)
+       pe->e_msg = strerror (error - 100);
+       tp->th_code = EUNDEF;	/* set 'undef' errorcode */
+     }
+-  strcpy (tp->th_msg, pe->e_msg);
+   length = strlen (pe->e_msg);
+-  tp->th_msg[length] = '\0';
++  memcpy(tp->th_msg, pe->e_msg, length + 1);
+   length += 5;
+   if (sendto (peer, buf, length, 0, (struct sockaddr *) &from, fromlen) != length)
+     syslog (LOG_ERR, "nak: %m\n");
diff --git a/meta/recipes-connectivity/inetutils/inetutils_1.9.4.bb b/meta/recipes-connectivity/inetutils/inetutils_1.9.4.bb
index ac2e017d8b..684fbe09e1 100644
--- a/meta/recipes-connectivity/inetutils/inetutils_1.9.4.bb
+++ b/meta/recipes-connectivity/inetutils/inetutils_1.9.4.bb
@@ -22,6 +22,7 @@ SRC_URI = "${GNU_MIRROR}/inetutils/inetutils-${PV}.tar.gz \
            file://inetutils-1.9-PATH_PROCNET_DEV.patch \
            file://inetutils-only-check-pam_appl.h-when-pam-enabled.patch \
            file://0001-rcp-fix-to-work-with-large-files.patch \
+           file://fix-buffer-fortify-tfpt.patch \
 "
 
 SRC_URI[md5sum] = "04852c26c47cc8c6b825f2b74f191f52"
-- 
2.20.1


