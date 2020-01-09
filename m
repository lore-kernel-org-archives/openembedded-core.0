Return-Path: <alex.kiernan@gmail.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id A86507FEA3
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Jan 2020 14:46:11 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id q10so7632942wrm.11
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 Jan 2020 06:46:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=BZlQJFzGdptwamoJKQU5evYuZi0UEKT4HAaW/qelxYQ=;
	b=tarP7HidTtIdZtrd9tbWN02kI4ZsKPMpIyvJQYitSWhEWLuLdBicSr0WAbaTTlzPKn
	0PryD1kPSl5hPKfOmS0yrTtqhzW7EH1zb60tFIo5ff9+3wz1pavaVEgT2o/7fBCTeZMv
	oSUnkHJU4vtMD+q6kdnIgLRhHnUeWsMhFjC5rHa2jcWy+EQnQZSBePAPdqSR4owWPxUF
	8OtedL7i7hoIkQOvVFZvFnM15MsqSvex2zFgru8lQsNqNbe+Ji2SdRdXjxovykeBpQY9
	zwiX0MAwZCpJtQeAbhCwbn8AOKktu7SHx28YrkQvYbFtLsLnZbcD6xFYV9tD7fnE+dyT
	+fVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=BZlQJFzGdptwamoJKQU5evYuZi0UEKT4HAaW/qelxYQ=;
	b=JpVMjM8xgoQooCB8H9F9VohJ9NQKitoa29205WEEfneVBPnEZr0gEzSB18bDlVFN/S
	R3tkHQ00YtvyUdCV10SEubirwDhLuCOb23L9edDcoAxkMXJPb/XAD72+mFpP6FKTl9Xr
	tjQNrW198yvgZhITTMqQ9w2vPuQoV+sG3Fr2TKoLL04FKWwy4ucBEJeBtixyrHJlhTc5
	VDfx1tT+SPeV0WIbMaFigBfDqcSgPAUy5+bu5hsriGYKTqkBKk2vJU5Lh/emYyZd78qL
	l5Y+K8FSrlCkbuuULQKyBKDqTrmXm/Zo3EgOaj6lVm3xParBYg4bhbfIwXwc94Mqm0v7
	GWHw==
X-Gm-Message-State: APjAAAUHPe624PBhNd66u1CY7LdSMR2kkjQBNqP7XnDmK9oG04TG/oXE
	HcNizv4rsnO/wxXSGBICIuyaiT0H
X-Google-Smtp-Source: APXvYqzLh0aSDcbmY3LL5DipeaQnwyMczbxVG8vk0HfV7nm4frmM07GEPsLuBMolFxHmaD7DL1qITQ==
X-Received: by 2002:a5d:640d:: with SMTP id z13mr11476951wru.181.1578581172180;
	Thu, 09 Jan 2020 06:46:12 -0800 (PST)
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net.
	[91.135.6.246]) by smtp.gmail.com with ESMTPSA id
	f16sm8341064wrm.65.2020.01.09.06.46.11
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 09 Jan 2020 06:46:11 -0800 (PST)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  9 Jan 2020 14:45:59 +0000
Message-Id: <20200109144559.35181-1-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [RESEND PATCH] manpages.bbclass: Fix rootfs host corruption
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
X-List-Received-Date: Thu, 09 Jan 2020 14:46:12 -0000

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


