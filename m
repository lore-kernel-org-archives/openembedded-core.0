Return-Path: <alex.kiernan@gmail.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id EB0727FBA6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Dec 2019 22:17:51 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id w15so7560872wru.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Dec 2019 14:17:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=BZlQJFzGdptwamoJKQU5evYuZi0UEKT4HAaW/qelxYQ=;
	b=IPwEFuKVSMWNZuOUsMmiwF+yGTiCJb0EAU7iqpW4HrteSgc6aaabYsBXxsmeXhx8FW
	2B9EFXSAV2wOrVNDiq430FZy8mBJacA+/Z+Xeiq/vmWhQbrDMt8LUET9xQfyfjmnZRcn
	IuWLBg5Zm03gjJsGNaCCAYd+D+vTiH+U6baKlqQ6YOxc4zzap11r16s5edcjaZeCGIqb
	x/1NuQUUEnpX2Qf0ZoI1DsVIOdgJ3IA73bTRNKNzMpJOuxsCv6o9vGqIHLe8qbafXatb
	m+9OsoLIzt7Pr8OQAmc17XOEuoH1vTrnSpGDks8j0VvNCMrsXuYeOH5FMUXgQf9ZHdmu
	GPyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=BZlQJFzGdptwamoJKQU5evYuZi0UEKT4HAaW/qelxYQ=;
	b=cwf1+7pPyzHmkgSjJGsZUQ6y3kw4bI28L0KbhlAdxwhYUjzNQDy0KgcCvSW65zQKTW
	5YXn/dUpac6K3qfjbtaRfi02VSyVmxHMOeP3iT0L7gO7dlrCS17cJkNw4DhVLjGItRp/
	PLPHfpJsJr7NItpUd5gEHli6l0dOQoj+VEzcSldpiFvFvU/hetjG4ijSytDwkWoptfpw
	fbWoNvXsjllyT2082PK1aS12arylu6JRFe+9rETk03UehPQKaBKzOXEjIRTN9gZKJ2nt
	EUCjT/+LQGvQnsyIROPaPFFalWyeSes5+1Ibr8dSu52vzdj3dh53oL6ib9PxMfvMG2+F
	EJRQ==
X-Gm-Message-State: APjAAAVRGRndGkaFG+liSEWUhycD4L7wkf6DkcZiwaOBzFB3J5Fp9ufT
	3NISGnz8vkP89WJeZu2/CS1BRf2K
X-Google-Smtp-Source: APXvYqynwdzZVPMtky6tfdlpT5Dv2lwDC49gYNZ+Ol+dA1QQ8Gk+DyiC/II8DA56czzJJh+TrFG8dw==
X-Received: by 2002:a5d:4cc9:: with SMTP id c9mr11451582wrt.70.1576793872353; 
	Thu, 19 Dec 2019 14:17:52 -0800 (PST)
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net.
	[91.135.6.246]) by smtp.gmail.com with ESMTPSA id
	p15sm7501324wma.40.2019.12.19.14.17.51
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 19 Dec 2019 14:17:51 -0800 (PST)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Dec 2019 22:17:47 +0000
Message-Id: <20191219221748.27079-1-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH 1/2] manpages.bbclass: Fix rootfs host corruption
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
X-List-Received-Date: Thu, 19 Dec 2019 22:17:52 -0000

When running mandb we end up with files owned by the build user, correct
this. Also pick up non-default locales and relocate their index.db files
to /var/cache.

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

 meta/classes/manpages.bbclass | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/meta/classes/manpages.bbclass b/meta/classes/manpages.bbclass
index 50c254763e89..1e66780646ea 100644
--- a/meta/classes/manpages.bbclass
+++ b/meta/classes/manpages.bbclass
@@ -18,8 +18,15 @@ pkg_postinst_append_${MAN_PKG} () {
 		if test -n "$D"; then
 			if ${@bb.utils.contains('MACHINE_FEATURES', 'qemu-usermode', 'true','false', d)}; then
 				sed "s:\(\s\)/:\1$D/:g" $D${sysconfdir}/man_db.conf | ${@qemu_run_binary(d, '$D', '${bindir}/mandb')} -C - -u -q $D${mandir}
+				chown -R root:root $D${mandir}
 				mkdir -p $D${localstatedir}/cache/man
-				mv $D${mandir}/index.db $D${localstatedir}/cache/man
+				cd $D${mandir}
+				find . -name index.db | while read index; do
+					mkdir -p $D${localstatedir}/cache/man/$(dirname ${index})
+					mv ${index} $D${localstatedir}/cache/man/${index}
+					chown man:man $D${localstatedir}/cache/man/${index}
+				done
+				cd -
 			else
 				$INTERCEPT_DIR/postinst_intercept delay_to_first_boot ${PKG} mlprefix=${MLPREFIX}
 			fi
-- 
2.17.1


