Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
	[209.85.221.44])
	by mail.openembedded.org (Postfix) with ESMTP id 5E5037FA1A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jan 2020 14:00:13 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id c14so12271106wrn.7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jan 2020 06:00:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=2EvO/kSFTygDtJD9u94n6tjPo+9U7WNNdudzcmKG+Uo=;
	b=qOao+1EdsQ719ghUskJg3rKMay74hlmxgpY3zVtJ9C7HtEyiyDuM9KTxxYMhoE2SV3
	MuxYzCNuAQYiA31Km+DhcGDCxk3NcDu9lwMuPOZ5bCwxJqMbfexYPhBNkZPkt98EdSk/
	Y9M06ypz1BCBeehspCT33Tt6lk1Irw4/cYDJvu9wIjWs5OrxUcwR/YfWeujBLdSOIhSR
	IPc+S64bAX1sFYXMHyrEpYot0wOfKjaheODqlsU6b+AYnVccznayyXCultgFirajxXu5
	ucTVfBzBVSvxWjmAXgbaX8K1FwfxnSMA/k/24NNbP0YT6n5On5UYjJk3WWTbPxNCSaRb
	Fn7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=2EvO/kSFTygDtJD9u94n6tjPo+9U7WNNdudzcmKG+Uo=;
	b=czuFUNdg09gsgp6NdRcdMrJPAPlF4oIY/augqweyL2VYNfSxT8oDGiZ9XNCUPqBhdv
	ep9NxAokHpIC9CrlKoS7qhPOhWHJJTuMlqFsgu+yfXu3E02TZXRcgZ5/UeSnQelIXUUf
	icuN4FxvjTyOBycUN3KXQAr6IWVDv7vS7aEtedgob6IvOY4U3HYEUF7D1YLUtotMRHNv
	khxA3G78riQgKCe2xDrmvjIq4YydqbrCUZTTjurd/uweYO2cVug4EaH+ET9FQPtlqAe9
	zE/sQgVef1wpU5mwcFWgO0I4EN0D2kWt1Hkqi2Lr/bYbskAdiYVvV4kkT44tOhg/nPcv
	f+eg==
X-Gm-Message-State: APjAAAVAFVKebjFe9+hKk7tZV4309AS01YvQXodiSrgb2jFxjZRXaOaY
	xdwJWrVV3F9smWA9ybXoZz06olcx
X-Google-Smtp-Source: APXvYqxx6QXdkA5xoe+W50YWsxT2QXX3Sud4g9BxlWbSIgAr6yh6YS3oCPR0DR7AzI5F45qsZqWRDw==
X-Received: by 2002:a5d:6406:: with SMTP id z6mr23779343wru.294.1579010413633; 
	Tue, 14 Jan 2020 06:00:13 -0800 (PST)
Received: from alexander-box.rd.corpintra.net ([141.113.66.202])
	by smtp.gmail.com with ESMTPSA id
	r62sm20147333wma.32.2020.01.14.06.00.12
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 14 Jan 2020 06:00:13 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Jan 2020 14:59:49 +0100
Message-Id: <20200114140007.36622-2-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200114140007.36622-1-alex.kanavin@gmail.com>
References: <20200114140007.36622-1-alex.kanavin@gmail.com>
Subject: [PATCH 02/20] rpm: fix with musl and latest elfutils.
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
X-List-Received-Date: Tue, 14 Jan 2020 14:00:13 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...lugins.c-call-dlerror-prior-to-dlsym.patch | 29 +++++++++++++++++++
 meta/recipes-devtools/rpm/rpm_4.14.2.1.bb     |  1 +
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
diff --git a/meta/recipes-devtools/rpm/rpm_4.14.2.1.bb b/meta/recipes-devtools/rpm/rpm_4.14.2.1.bb
index 339bd7b8343..17255dc87a7 100644
--- a/meta/recipes-devtools/rpm/rpm_4.14.2.1.bb
+++ b/meta/recipes-devtools/rpm/rpm_4.14.2.1.bb
@@ -43,6 +43,7 @@ SRC_URI = "git://github.com/rpm-software-management/rpm;branch=rpm-4.14.x \
            file://0016-rpmscript.c-change-logging-level-around-scriptlets-t.patch \
            file://0001-mono-find-provides-requires-do-not-use-monodis-from-.patch \
            file://0001-Rip-out-partial-support-for-unused-MD2-and-RIPEMD160.patch \
+           file://0001-rpmplugins.c-call-dlerror-prior-to-dlsym.patch \
            "
 
 PE = "1"
-- 
2.17.1


