Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
	[209.85.221.53])
	by mail.openembedded.org (Postfix) with ESMTP id 5AB8E7FE9B
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Jan 2020 13:28:07 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id q10so3331275wrm.11
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Jan 2020 05:28:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=j/GeB4vbgbRLt6xyxcCLzQJiTTW0ljzNDsLWsDMv/1w=;
	b=FoJnPWUhkJfEI4j3H6Y/7BmFaPENO4nStQyu1MlGvnvqRGZk6E6u2v3ZrUpqHz5/yY
	DuW3/Aceeh9NeAvw91av/4cZvt6N6asGN64xPNl5+l9nrf1wOl1BUKQaUCImpubNtXXU
	byKb8XgUNgI5i7Uff7EUX9mHV/0dhQMfD1mF3f7EI1EQFxkzfuSTTtUuco0fN8xGikhf
	a8O7usO8w7Ex5b+SGWzuJPtFK4wDutK5HGoS7NiysAJj7nnC2Tk1NwPdEx2RjoiWxYJB
	jlLVP0Cw6DI16nO5yHbmfFQbeewjX1TBgzAHa0vsmrWxQa+6FPDsxlWGtbWOagceZo1m
	vrqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=j/GeB4vbgbRLt6xyxcCLzQJiTTW0ljzNDsLWsDMv/1w=;
	b=BN7YyrXJgtNXPulLukKNJdSQSsCFIz7RXEYnlQCIdi+AeTNT9+tXEwR9fvbiYoDJe6
	96Pu2CjsJ1oulg/gckCMXsqOpuxcbRAJWNJEgDGV0b7231CrCrQBTrV8gakRasGMX9Qi
	p5LtLj8r9ssHS/gBKvulaiQMyxIjL6A2X0zCaaAm5dQd+03c4pFqRkrg7lm/jS3NpoIs
	cXb6+Su26BhL6zVsA1rJ+KT3OVMoXDaPP+vRXa5CFCLRheKbt7RShnYjnan/z04z0Bhp
	AeFcGp4XZr10iKT58O13mIedO2aC6uIpX3sbDMCzltPDQbM/aIUGWZ41SMYXa0z9CZVk
	MQGg==
X-Gm-Message-State: APjAAAU1GsJKvuY4HgXF2ufzIO6oN6agZUYuBSPe2hileqN9D9nKeMih
	QEc2ngEhjXDS+H7Ah+n2zvaq7ry5ovE=
X-Google-Smtp-Source: APXvYqxbKeBt7OKf0livgoliHVZ9U3bgSaXco2wA0gGbGYBuh84A733N+iB1BXY545K2xMVq/ccCKg==
X-Received: by 2002:adf:e641:: with SMTP id b1mr4624165wrn.34.1578490087861;
	Wed, 08 Jan 2020 05:28:07 -0800 (PST)
Received: from alexander-box.rd.corpintra.net ([141.113.66.202])
	by smtp.gmail.com with ESMTPSA id
	x10sm4607028wrp.58.2020.01.08.05.28.06
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 08 Jan 2020 05:28:07 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  8 Jan 2020 14:27:34 +0100
Message-Id: <20200108132759.95603-3-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200108132759.95603-1-alex.kanavin@gmail.com>
References: <20200108132759.95603-1-alex.kanavin@gmail.com>
Subject: [PATCH 03/28] rpm: fix with musl and latest elfutils.
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
X-List-Received-Date: Wed, 08 Jan 2020 13:28:07 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...lugins.c-call-dlerror-prior-to-dlsym.patch | 29 +++++++++++++++++++
 meta/recipes-devtools/rpm/rpm_4.15.1.bb       |  1 +
 2 files changed, 30 insertions(+)
 create mode 100644 meta/recipes-devtools/rpm/files/0001-rpmplugins.c-call-dlerror-prior-to-dlsym.patch

diff --git a/meta/recipes-devtools/rpm/files/0001-rpmplugins.c-call-dlerror-prior-to-dlsym.patch b/meta/recipes-devtools/rpm/files/0001-rpmplugins.c-call-dlerror-prior-to-dlsym.patch
new file mode 100644
index 00000000000..8842e3ebd71
--- /dev/null
+++ b/meta/recipes-devtools/rpm/files/0001-rpmplugins.c-call-dlerror-prior-to-dlsym.patch
@@ -0,0 +1,29 @@
+From 6878a83f9bac015c64d83cee42530a20a264cc5a Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Tue, 7 Jan 2020 12:02:06 +0100
+Subject: [PATCH] rpmplugins.c: call dlerror() prior to dlsym()
+
+This is the recommended way in the manpage; if there is
+a lingering error from an unrelated dl*() call that was
+never obtained via dlerror(), it needs to be cleared
+prior to calling dlsym().
+
+Upstream-Status: Submitted [https://github.com/rpm-software-management/rpm/pull/998]
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ lib/rpmplugins.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/lib/rpmplugins.c b/lib/rpmplugins.c
+index 65e684e84..b950f85cf 100644
+--- a/lib/rpmplugins.c
++++ b/lib/rpmplugins.c
+@@ -68,6 +68,8 @@ static rpmPlugin rpmPluginNew(const char *name, const char *path,
+ 
+     /* make sure the plugin has the supported hooks flag */
+     hooks_name = rstrscat(NULL, name, "_hooks", NULL);
++    /* clear out any old errors that weren't fetched */
++    dlerror();
+     hooks = dlsym(handle, hooks_name);
+     if ((error = dlerror()) != NULL) {
+ 	rpmlog(RPMLOG_ERR, _("Failed to resolve symbol %s: %s\n"),
diff --git a/meta/recipes-devtools/rpm/rpm_4.15.1.bb b/meta/recipes-devtools/rpm/rpm_4.15.1.bb
index 0a6d412a1b8..b8764751939 100644
--- a/meta/recipes-devtools/rpm/rpm_4.15.1.bb
+++ b/meta/recipes-devtools/rpm/rpm_4.15.1.bb
@@ -38,6 +38,7 @@ SRC_URI = "git://github.com/rpm-software-management/rpm;branch=rpm-4.15.x \
            file://0001-rpm-rpmio.c-restrict-virtual-memory-usage-if-limit-s.patch \
            file://0016-rpmscript.c-change-logging-level-around-scriptlets-t.patch \
            file://0001-rpmfc.c-do-not-run-file-classification-in-parallel.patch \
+           file://0001-rpmplugins.c-call-dlerror-prior-to-dlsym.patch \
            "
 
 PE = "1"
-- 
2.17.1


