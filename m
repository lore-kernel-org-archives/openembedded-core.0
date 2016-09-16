Return-Path: <armccurdy@gmail.com>
Received: from mail-pa0-f68.google.com (mail-pa0-f68.google.com
	[209.85.220.68])
	by mail.openembedded.org (Postfix) with ESMTP id 929EC73193
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Sep 2016 22:29:24 +0000 (UTC)
Received: by mail-pa0-f68.google.com with SMTP id my20so944193pab.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Sep 2016 15:29:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=kbm8YDd7wC9dqq9cjDJQOZt8LtDVoIgt9rlcR5RGhvs=;
	b=rb4jAXl5i2a3WwBIhIYd4rlt3FQrLgnhJltNzcik+XuxW0S2RI2XnM7qk9EK+g0I7z
	FORu1g6OUZOcV3SPoMGTFCEcIGXU6M1DY7TRQjxTeJMxdyKGLeilQxaPQM2JU9wxGTRI
	ITZeVtre84iWeZFsQeOdv4qdn9plFpQTQ93qEdLBpNJrYc3uj3oYMpQtgGurEfnf+ssx
	BMqDV99zz5HqBEa3bOkNsAsYcmaQGX/z4SkarkKGv3bt9cJVDR+3YehKvyd8tjyn95vx
	K9vdgZxBAarhb13wI5l9GeJ00A0aWdGsRxXn3iAkhaGCO+ozKcFJhMAIoa2pfBNTZ64y
	pBKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=kbm8YDd7wC9dqq9cjDJQOZt8LtDVoIgt9rlcR5RGhvs=;
	b=FyZrN/WN/7jDFBB2wNijuyBPc3mC4MrTWgvDjZi7wwkMK7w2F8Z6zvTdRJ+D0VnQTv
	OBROzCr7Fu78U1yWGA3KOEIXVb7xIFVt964NyMgyekkcVhJtR0TS5LfqEk9d6gLmHJHO
	W7uzXcbruOre1fOUBtRmzzCoGWBrGervu/N5AqXQ0Q6vAONv/UukUFb5PPxlxUUYanZ5
	q+4HQo9JIjK7ofWOxUoystmJfkauyVOGYCZ/OyOdXLGTMOLZKSxcefKrrdCqV5fuPsk8
	kHOdr/wnX6+L8Qck0J5eaD61qEVpIzRtKhCFkfVA3gpHGBuKvxJxMKRaHUtkMwmMPNnm
	rgzQ==
X-Gm-Message-State: AE9vXwODkBFlqoIh+mqY4zgrmAoC0ZGcDX/IZDIQDUbFXSFaWmgfPc6QCTEnW3GRHg7FKw==
X-Received: by 10.66.217.170 with SMTP id oz10mr26634153pac.61.1474064965172; 
	Fri, 16 Sep 2016 15:29:25 -0700 (PDT)
Received: from e6520.adbgroup.pl
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id
	c66sm54410269pfd.24.2016.09.16.15.29.24
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 16 Sep 2016 15:29:24 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 Sep 2016 15:29:12 -0700
Message-Id: <1474064952-21753-3-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1474064952-21753-1-git-send-email-armccurdy@gmail.com>
References: <1474064952-21753-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 2/2] dropbear: deterministic selection of system -vs- bundled libtom libs
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
X-List-Received-Date: Fri, 16 Sep 2016 22:29:25 -0000

Dropbear will use system versions of libtommath and libtomcrypt if
available. To make builds deterministic, add a PACKAGECONFIG option
to choose system libs or force use of the bundled versions.

Note that currently there are no libtommath or libtomcrypt recipes
in oe-core, so default to using the bundled versions.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-core/dropbear/dropbear.inc | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-core/dropbear/dropbear.inc b/meta/recipes-core/dropbear/dropbear.inc
index cdac7ec..bda7eb8 100644
--- a/meta/recipes-core/dropbear/dropbear.inc
+++ b/meta/recipes-core/dropbear/dropbear.inc
@@ -45,6 +45,10 @@ SYSTEMD_SERVICE_${PN} = "dropbear.socket"
 SBINCOMMANDS = "dropbear dropbearkey dropbearconvert"
 BINCOMMANDS = "dbclient ssh scp"
 EXTRA_OEMAKE = 'MULTI=1 SCPPROGRESS=1 PROGRAMS="${SBINCOMMANDS} ${BINCOMMANDS}"'
+
+PACKAGECONFIG ?= ""
+PACKAGECONFIG[system-libtom] = "--disable-bundled-libtom,--enable-bundled-libtom,libtommath libtomcrypt"
+
 EXTRA_OECONF += "\
  ${@bb.utils.contains('DISTRO_FEATURES', 'pam', '--enable-pam', '--disable-pam', d)}"
 
-- 
1.9.1


