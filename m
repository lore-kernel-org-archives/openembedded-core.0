Return-Path: <danismostlikely@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 4D1A778289
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 May 2018 20:11:53 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id o78-v6so5256822wmg.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 May 2018 13:11:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=gVUXdLpS8pVXsFOCnbgLZmeB7fCdBHNtvyHka+jtU/g=;
	b=X+OwXtSi83g6xPfx4EM1kT1Kn90d+XQVcJbo/rDK6UThwzqWLZSfhFfzMmdoGoA4/I
	rG6PheZQ1buad7TRf2vfgCrtrrtPBIpZx/BGGVYhiTATW8Wne3yceaOD5QtwcCA5ngaK
	VuXxrOWrzdBBKKwXYmM/HpqVgT4Rl5sD2Z6NlK0nqZnhPBSBIqL7m2WbzXvBFg428SXh
	UFFzCqwXH+MZH4PKdWWiLlXK0Lj6Ht1KZ6DzAZ3OvzpqM6JQfxsJKEMGxCYe/lim4M7X
	Tij1u1SIEfaM8i9M5nCiC3uS2Q667DaliY+xwfeYwbyiB3xREGF17z6qBRC1DUTyL4sf
	u9ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=gVUXdLpS8pVXsFOCnbgLZmeB7fCdBHNtvyHka+jtU/g=;
	b=NbkvVXDWseVlvaDaYZmz5aOHbw0BMPSPkaQ9rT6D4GqOErOxYR61LnvyIwjbpmAQs2
	YYxCtomhcQuvkVNGTjMT+WOwar/9V9uPOv2PV+TFJYFK62459GOBEx+oARaoNveLyctQ
	/42GTDvCxh+ykFA/RRudIzbkaTTx6eb3fQAAyo0w3incIBOTFA3t8+lIm7D9gbg/RgtY
	/dHqJ40zWroP8Gkmi0qJIbPuWtdV6aLJZCFswg8Yimdr9PHU5fdrFaqp4j0uagil/xm9
	qJn1zCI1sEN60qGucFS9mvdG7K0Eo6HzpSHRKxRv2vC457CAqqIJjeiIQttkWUuFksRx
	mdnA==
X-Gm-Message-State: ALKqPwfAKZKi81kjlDC2rCRTmhO1Il11SUwcprvgYRdX4UoEWJYnh46s
	RBg00hxnk7KQIMwR/S19pXDlaoWS
X-Google-Smtp-Source: AB8JxZpan/jSz7qkRr26RNRioMmbbvcp8xRg4Yw4Zp+FFRgyvE2m38ioWDaZaSf/6ZFwYs4eYyt7JQ==
X-Received: by 2002:a1c:e60b:: with SMTP id
	d11-v6mr2993732wmh.128.1526069514407; 
	Fri, 11 May 2018 13:11:54 -0700 (PDT)
Received: from mediabox.local ([2001:470:30f3:1:922b:34ff:fe5d:d4b3])
	by smtp.gmail.com with ESMTPSA id
	o20-v6sm4692147wro.67.2018.05.11.13.11.52
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 11 May 2018 13:11:53 -0700 (PDT)
From: Dan McGregor <danismostlikely@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 11 May 2018 14:10:53 -0600
Message-Id: <20180511201055.15463-1-danismostlikely@gmail.com>
X-Mailer: git-send-email 2.18.0-dev
Subject: [PATCH 1/3] base-files: change permissions on /sys and /proc
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
X-List-Received-Date: Fri, 11 May 2018 20:11:54 -0000

From: Dan McGregor <dan.mcgregor@usask.ca>

Fedora uses permissions of 555 for /proc and /sys. Debian doesn't
seem to explicitly set their permissions. In addition they're mounted
555.  Having them be 755 causes permission issues on upgrades inside a
container when the guest does not have the permission to change their
modes.

So, just bite the bullet and force them to be 555.

Signed-off-by: Dan McGregor <dan.mcgregor@usask.ca>
---
 meta/recipes-core/base-files/base-files_3.0.14.bb | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/base-files/base-files_3.0.14.bb b/meta/recipes-core/base-files/base-files_3.0.14.bb
index 1c0863b1c7b..a6963ba24d6 100644
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
2.18.0-dev


