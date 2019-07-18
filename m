Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com
	[209.85.208.67])
	by mail.openembedded.org (Postfix) with ESMTP id BB9C47EF5A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jul 2019 19:46:22 +0000 (UTC)
Received: by mail-ed1-f67.google.com with SMTP id p15so31781201eds.8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jul 2019 12:46:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=jUGfGFZSc5eKIaJUeDmJRHAqjX84H5bSnPYUYDLq0zo=;
	b=rbascoROo+iNTVbEpjD8C7xgcLb5i6I5jM2O8531HBRh0AgEsa3RWOQobvJKPHa2ja
	x5As0h/imzkV8rVXn1WRXk/MU/paOJSJglMw9E9FRQ+o3Dkvp4sGHu2agjhhlazkyCiX
	8r4pGrNV3jgXtw69pNa77m131Dn/dIJB2YEszcbXKGkKkGQv0JtHfpu5WGpVuLfzU+Nr
	CqFdAzG4BQnTXapqVuIOTyQLclzsLwQvyQ4hwl5gp7T3teHUNfKyaxMeBM3//pW8w5ob
	KawzGOfiSt3bn8L3X1jID6KW6bRCCPyAjJlbUCksSy7LcqUM+YI1zQF+Uzp76MkLzORZ
	c2mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding;
	bh=jUGfGFZSc5eKIaJUeDmJRHAqjX84H5bSnPYUYDLq0zo=;
	b=LmCwvuD08ShdO+gzbTnB8OImXOjcIbQ06+KvuCVexCK74iIajllgzApAJDww0c84e0
	5yDMK4legoZd5xvTbNdUJWr46VLpD0j6oPkUs6Rs+hFF0Kfn8QRNrPxFjxJvqbPAOVZ2
	F7RMmd9MHB0EUhqGApYFyOC1zHnt7DFpPSJsWTsQJSiMifIpY4FoQj2lA5XAaZ09PXH+
	VVVUCy/eKprJO8SNioFYn39zHDvCoRG4342IYGMTm2Q2LRkFj9PVJOgUHzwbh9asLihT
	XErW9X0beK8Yu3kKfZ7ItXUu1vSsWYC46X2roL0t+yrZs5jrYeVCJlecEb0iDZfB8vET
	CzOw==
X-Gm-Message-State: APjAAAXFxoeGR6JuWtb5zRkIW9G/R7OtQFrXt+oMzdlkHCraMaeAzr8w
	BgAJN1LNPLbYey9TvETAFc2lcu4/6e0=
X-Google-Smtp-Source: APXvYqzPMSaaFVUVkN+/F0eOeKx8V7vHYhUrWwq6ao8p58idVXVmkPOsyIHYku/ZRG9wLtOX6RBm/A==
X-Received: by 2002:a50:b4cb:: with SMTP id x11mr43393593edd.284.1563479178824;
	Thu, 18 Jul 2019 12:46:18 -0700 (PDT)
Received: from piling.lan (80-71-134-83.u.parknet.dk. [80.71.134.83])
	by smtp.gmail.com with ESMTPSA id
	rv16sm5773879ejb.79.2019.07.18.12.46.17
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Thu, 18 Jul 2019 12:46:17 -0700 (PDT)
Sender: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
From: Ricardo Ribalda Delgado <ricardo@ribalda.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 18 Jul 2019 21:46:15 +0200
Message-Id: <20190718194615.6874-1-ricardo@ribalda.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: Ricardo Ribalda Delgado <ricardo@ribalda.com>
Subject: [PATCH] inetutils: Fix abort on invalid files
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
X-List-Received-Date: Thu, 18 Jul 2019 19:46:23 -0000
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


