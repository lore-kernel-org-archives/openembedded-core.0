Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web08.62837.1606754957316637164
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Nov 2020 08:49:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=mS6OeaMR;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: luca.boccassi@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id 3so22254592wmg.4
        for <openembedded-core@lists.openembedded.org>; Mon, 30 Nov 2020 08:49:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kozcDjdG67to4aaIj/Ggp/CVW7Bc8EEpNhKL7yfUs+I=;
        b=mS6OeaMR1cdLoXiGXPUI4/Zk6/DEwdMjsPDpbSaTooVQqfW1glLraJw7eKiZI9QQ6p
         yaIwBN5rPAbAQgNAHwqdkMzOsTDDskclU0zm7CNRIkYShpG2I0Luecb7eYF2GSpKGm1B
         BRC+aGOzGLJUH81QFF+9QYkAfyts1KUm1iPt1DVStHrsQ2T+/Di6HhC6l1UQbuCVbOkY
         Jr0Nm98dQK3Xcn00WAEBIy9dTxbQi6cLNEnE0KazqZ8IgYQIF5gdGmKvmaJ55fgWllKx
         p3SqZCnAv58/Ee8xzu7TZ1yAifoiDyc5ihFZHXPwr8AQjN2qcCjF8l5Vze8hGsYiLca7
         qqcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kozcDjdG67to4aaIj/Ggp/CVW7Bc8EEpNhKL7yfUs+I=;
        b=rb+ZcgkCeRZwDta7l1SpxgEbySc6uLlhW85RL8pg7jrjTT2p1uMrHlOzKMNppbBiZ4
         pe2Fp28bKICW7/iCOqVztp6RE6Ve/6rvSK8cPV+dAbrvYKiJYyvlsVHL41/CFuC438do
         qwiiMISpBeIzJicu2gvlkl7MN/hzQ1pOW9exJHX0bXtdVKDR5+Kfy2ZarUDW1c+PY+fd
         6UJVZzWKJLWHpLW4JbACaiO9lNyfsoR5AiDBzpRX67fZb15w/5A5czJ/dFs86RuPaeVp
         cxmf5bL4mKCu6c0OIEI99K/DW3isg6iIa2JM0HoQw6lO+m8Fet85+rpuExdHMQ6cf5TD
         jk/g==
X-Gm-Message-State: AOAM533ebAFkcPMgYSqQMw+6qfHrE4DZdoFRsc7Kqb65ElT6DBu5wChz
	RF6AN0NqD8BpDvLI4HSfo0hvaaHZ7JPUCQ==
X-Google-Smtp-Source: ABdhPJzlGMNOE7+94iGD0+gqVfB0e0tjTACYHG+IKvlWb6r6tLjJijpnuWT/94tmYmCfdK5P/75H5Q==
X-Received: by 2002:a1c:f311:: with SMTP id q17mr23587688wmq.28.1606754955358;
        Mon, 30 Nov 2020 08:49:15 -0800 (PST)
Return-Path: <luca.boccassi@gmail.com>
Received: from localhost ([88.98.246.218])
        by smtp.gmail.com with ESMTPSA id s133sm25044728wmf.38.2020.11.30.08.49.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Nov 2020 08:49:14 -0800 (PST)
From: "Luca Bocassi" <luca.boccassi@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] dbus: move messagebus user to dbus-common package
Date: Mon, 30 Nov 2020 16:49:10 +0000
Message-Id: <20201130164910.989386-1-luca.boccassi@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Luca Boccassi <luca.boccassi@microsoft.com>

dbus-broker also uses the messagebus user, so move it
over from dbus to dbus-common
---
 meta/recipes-core/dbus/dbus_1.12.20.bb | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-core/dbus/dbus_1.12.20.bb b/meta/recipes-core/dbus/dbus_1.12.20.bb
index 4040fdb22a..09049301cc 100644
--- a/meta/recipes-core/dbus/dbus_1.12.20.bb
+++ b/meta/recipes-core/dbus/dbus_1.12.20.bb
@@ -24,17 +24,17 @@ python __anonymous() {
         d.setVar("INHIBIT_UPDATERCD_BBCLASS", "1")
 }
 
-USERADD_PACKAGES = "${PN}"
-USERADD_PARAM_${PN} = "--system --home ${localstatedir}/lib/dbus \
-                       --no-create-home --shell /bin/false \
-                       --user-group messagebus"
+PACKAGES =+ "${PN}-lib ${PN}-common ${PN}-tools"
+
+USERADD_PACKAGES = "dbus-common"
+USERADD_PARAM_dbus-common = "--system --home ${localstatedir}/lib/dbus \
+                             --no-create-home --shell /bin/false \
+                             --user-group messagebus"
 
 CONFFILES_${PN} = "${sysconfdir}/dbus-1/system.conf ${sysconfdir}/dbus-1/session.conf"
 
 DEBIANNAME_${PN} = "dbus-1"
 
-PACKAGES =+ "${PN}-lib ${PN}-common ${PN}-tools"
-
 OLDPKGNAME = "dbus-x11"
 OLDPKGNAME_class-nativesdk = ""
 
-- 
2.27.0

