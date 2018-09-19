Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
	[209.85.214.195])
	by mail.openembedded.org (Postfix) with ESMTP id 241A974AFA
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Sep 2018 18:55:52 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id w14-v6so3087169plp.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Sep 2018 11:55:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=lE7zo6QGoCcYuC63T7S7LHCh5Rg2ff/CPjPCbZA1ztM=;
	b=veHqE+aepQIvpdJk9PVrqFjiP0KVphgx65FQ+GFxMFjWvxuOH3gA2gdX/BLd1+1aHa
	vbyB3L5cgebGQuNL4wT8lgux1jpHwqqI/hJasQeEw3LGVd6SaEzLrCKOdPicrc1MK6U5
	A5dn8aHyEGrj/ZaAePxLsx9Zvj2DWQiDzwzNK0xoc+g4PaC/vQuTAfzBmfQIItJZMhTy
	DeAX7pxx8T0Bt8Bt5+vDmozFrH+gFCW+WlkLQ5upeff0AreJkGnAOflHYKXWKAWC0jLS
	P0puNAHDt3c6j/e9Gm2fSLXI6I96bbv9OcpxSZt040ruhP4NqRlqUBDDIZ7op6j6tZeF
	ijnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=lE7zo6QGoCcYuC63T7S7LHCh5Rg2ff/CPjPCbZA1ztM=;
	b=sE1922ce6mfFPlRVqF3mZ+hfzoEyGa144+2e1aZU5lKD3tyRlboWAnIIqoDP4enZBD
	s9aJ9VZa/cHXUZ9XyhLtbKOPyEn5hL1YeMsTyQk+gPGrbqHMvlKEY0r4TO18uvNf1NF1
	0OsYhuLeR0IWaE1BoPctSNBq/fi3Jtkpb35XUQYZ63rmvj+xe0VCD+SpETZ4PLjvXmJZ
	cwi503oNQJHYVwXzbCTt/eFRRmFiMcQd3zHhH9q5V78ryq3NV5+2oJtaFVTmhNHN8Yt3
	/oo6xkAJ0Lh7eP+6WfC5trB5foPdEpC10WqyKJgaVDGEwNaWWsLLKRGQ1hJyN0yZDpMB
	4jEw==
X-Gm-Message-State: APzg51A4RSi5l+pOBM3q4cmO6RPuy7lG/AFjgVy2L/IAEPAW6yaq0EWx
	BeUqxALD7+a3c7nn3Mp5MfOHOIsV9XI=
X-Google-Smtp-Source: ANB0VdajVU+AVjgIs1U0/4g46a9Ui/dwIhFZa+Muw548WxHvszM+xhw0liTma3HGmlMbE1Nybq5AiQ==
X-Received: by 2002:a17:902:7e45:: with SMTP id
	a5-v6mr35958053pln.151.1537383353604; 
	Wed, 19 Sep 2018 11:55:53 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::b1b1])
	by smtp.gmail.com with ESMTPSA id
	y3-v6sm35687083pfi.24.2018.09.19.11.55.52
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 19 Sep 2018 11:55:52 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 19 Sep 2018 11:55:41 -0700
Message-Id: <20180919185542.2329-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.19.0
MIME-Version: 1.0
Subject: [PATCH 1/2] mtools: Fix build with clang
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
X-List-Received-Date: Wed, 19 Sep 2018 18:55:53 -0000
Content-Transfer-Encoding: 8bit

Identify with __clang__ to undefine UNUSED

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../mtools/mtools/clang_UNUSED.patch            | 17 +++++++++++++++++
 meta/recipes-devtools/mtools/mtools_4.0.18.bb   |  1 +
 2 files changed, 18 insertions(+)
 create mode 100644 meta/recipes-devtools/mtools/mtools/clang_UNUSED.patch

diff --git a/meta/recipes-devtools/mtools/mtools/clang_UNUSED.patch b/meta/recipes-devtools/mtools/mtools/clang_UNUSED.patch
new file mode 100644
index 0000000000..6bb9d6a3da
--- /dev/null
+++ b/meta/recipes-devtools/mtools/mtools/clang_UNUSED.patch
@@ -0,0 +1,17 @@
+Undefine UNUSED macros with clang
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Index: mtools-4.0.18/sysincludes.h
+===================================================================
+--- mtools-4.0.18.orig/sysincludes.h
++++ mtools-4.0.18/sysincludes.h
+@@ -101,7 +101,7 @@ typedef void *caddr_t;
+ #if defined __GNUC__ && defined __STDC__
+ /* gcc -traditional doesn't have PACKED, UNUSED and NORETURN */
+ # define PACKED __attribute__ ((packed))
+-# if __GNUC__ == 2 && __GNUC_MINOR__ > 6 || __GNUC__ >= 3
++# if (__GNUC__ == 2 && __GNUC_MINOR__ > 6 || __GNUC__ >= 3) && !defined(__clang__)
+ /* gcc 2.6.3 doesn't have "unused" */		/* mool */
+ #  define UNUSED(x) x __attribute__ ((unused));x
+ #  define UNUSEDP __attribute__ ((unused))
diff --git a/meta/recipes-devtools/mtools/mtools_4.0.18.bb b/meta/recipes-devtools/mtools/mtools_4.0.18.bb
index 91f7b7c610..3c31aca3ad 100644
--- a/meta/recipes-devtools/mtools/mtools_4.0.18.bb
+++ b/meta/recipes-devtools/mtools/mtools_4.0.18.bb
@@ -32,6 +32,7 @@ SRC_URI = "${GNU_MIRROR}/mtools/mtools-${PV}.tar.bz2 \
            file://no-x11.gplv3.patch \
            file://0001-Continue-even-if-fs-size-is-not-divisible-by-sectors.patch \
            file://0001-remove-LOCK_NB-to-use-blocking-request.patch \
+           file://clang_UNUSED.patch \
            "
 
 SRC_URI_append_class-native = " file://disable-hardcoded-configs.patch"
-- 
2.19.0


