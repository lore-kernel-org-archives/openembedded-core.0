Return-Path: <danismostlikely@gmail.com>
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com
	[209.85.160.195])
	by mail.openembedded.org (Postfix) with ESMTP id F0B4C79B7F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Oct 2018 21:22:43 +0000 (UTC)
Received: by mail-qt1-f195.google.com with SMTP id u34-v6so31885855qth.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Oct 2018 14:22:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=MZmQie4jL1DljGI+8xB/fbR9XfgBE/+N9s36iqV21Xg=;
	b=FvdcAS+QMefqwWT6jGGSdYFQnEw0SL1zLe4kDakqQK1YpKP19EH9N/Fq21dx9bTEdo
	acBzeFwPkHKq6ZpQzmv8xKKBbUt+TOdEZVLD60nGnQFZTMiX2LRJXcUVShDj+DtMwNDF
	pxfVI0LYoN5Wu0qf99hyFEkKeHyd/ktwcCWUR6/Cqaz/PgRfr9RTwo2udYyW4FsPUn6a
	PUiAVW8bOB7AWABCfHbgTkZyS6FnVhj1meMMVMJEtzvUHpTN6f7HSGyTNAzJhl5jmCaK
	glYqbMXrvNJkT3jqBpRnZPWlQsrB8yztn6jF1EKTg0geKDSQkR/6WER40wjoCFUWKdVn
	rRPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=MZmQie4jL1DljGI+8xB/fbR9XfgBE/+N9s36iqV21Xg=;
	b=BJWDAIeIKsb7QQX7o+oeaC0Lt+8kSCMRU2cMSeAShCa4ZCacjZ4VpY3D8Sek17L2SE
	CDJnZRlP90epON5EDLeCvDnofjb0SyQUg7urps2EP4n/RzfjtKhJUKfWwaUZq9MHVECo
	WQZahIgYvqinWOtqLDlG+2xrB0DpqwAjwFlwR98VdsabjBMzgE3uTuclrEibLdn7cFA1
	RKqyPRmwo6VXHKMpyyUU3xj4oOlHfqIsiRcmtzqGuATkMdyk6wIdSIsbbDaNULMyfpIt
	pb60XPt/gslW+NsjF4PziA6E2mXgZWRxnC8zQl1p5SQ0Ph8oprMcw7i9Gb+PUxuizuzJ
	5NfQ==
X-Gm-Message-State: ABuFfogrg+psZJ0T9wSVqGkoKeu9G3F478lBAzC/QVqYu5wu+B1L0C7y
	g2M4eloGmh0PopRK3QflTy2ASVp7
X-Google-Smtp-Source: ACcGV609edmO4C06HBtkbItu9qnOVMudoztJy3TXnQ0x5qr5KFB+UAo6lqL/ZcvDgPTUCAHnuvpSgg==
X-Received: by 2002:ac8:18e9:: with SMTP id
	o38-v6mr27040627qtk.256.1539811364642; 
	Wed, 17 Oct 2018 14:22:44 -0700 (PDT)
Received: from mediabox.local (204-83-204-143.prna.hsdb.sasknet.sk.ca.
	[204.83.204.143]) by smtp.gmail.com with ESMTPSA id
	h4-v6sm9799796qkg.95.2018.10.17.14.22.42
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 17 Oct 2018 14:22:43 -0700 (PDT)
From: Dan McGregor <danismostlikely@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 17 Oct 2018 15:22:35 -0600
Message-Id: <20181017212235.8453-4-danismostlikely@gmail.com>
X-Mailer: git-send-email 2.19.0-dev
In-Reply-To: <20181017212235.8453-1-danismostlikely@gmail.com>
References: <20181017212235.8453-1-danismostlikely@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 4/4] base-files: change permissions on /sys and /proc
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
X-List-Received-Date: Wed, 17 Oct 2018 21:22:44 -0000
Content-Transfer-Encoding: 8bit

From: Dan McGregor <dan.mcgregor@usask.ca>

The kernel mounts /proc and /sys with the mode 555. Fedora explicitly
sets this value in its filesystem setup package. Debian doesn't seem
to set it explictly.  Having them be 755 causes permission issues on
upgrades inside a container where the guest does not have the
permission to change the modes of the mount points.

So, just bite the bullet and force them to be 555.

Signed-off-by: Dan McGregor <dan.mcgregor@usask.ca>
---
 meta/recipes-core/base-files/base-files_3.0.14.bb | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/base-files/base-files_3.0.14.bb b/meta/recipes-core/base-files/base-files_3.0.14.bb
index 05c05626614..6e75652f152 100644
--- a/meta/recipes-core/base-files/base-files_3.0.14.bb
+++ b/meta/recipes-core/base-files/base-files_3.0.14.bb
@@ -32,15 +32,16 @@ INHIBIT_DEFAULT_DEPS = "1"
 docdir_append = "/${P}"
 dirs1777 = "/tmp ${localstatedir}/volatile/tmp"
 dirs2775 = ""
+dirs555 = "/sys /proc"
 dirs755 = "/boot /dev ${base_bindir} ${base_sbindir} ${base_libdir} \
            ${sysconfdir} ${sysconfdir}/default \
-           ${sysconfdir}/skel ${nonarch_base_libdir} /mnt /proc ${ROOT_HOME} /run \
+           ${sysconfdir}/skel ${nonarch_base_libdir} /mnt ${ROOT_HOME} /run \
            ${prefix} ${bindir} ${docdir} /usr/games ${includedir} \
            ${libdir} ${sbindir} ${datadir} \
            ${datadir}/common-licenses ${datadir}/dict ${infodir} \
            ${mandir} ${datadir}/misc ${localstatedir} \
            ${localstatedir}/backups ${localstatedir}/lib \
-           /sys ${localstatedir}/lib/misc ${localstatedir}/spool \
+           ${localstatedir}/lib/misc ${localstatedir}/spool \
            ${localstatedir}/volatile \
            ${localstatedir}/${@'volatile/' if oe.types.boolean('${VOLATILE_LOG_DIR}') else ''}log \
            /home ${prefix}/src ${localstatedir}/local \
@@ -93,6 +94,9 @@ pkg_preinst_${PN} () {
 }
 
 do_install () {
+	for d in ${dirs555}; do
+		install -m 0555 -d ${D}$d
+	done
 	for d in ${dirs755}; do
 		install -m 0755 -d ${D}$d
 	done
-- 
2.19.0-dev


