Return-Path: <armccurdy@gmail.com>
Received: from mail-pf0-f173.google.com (mail-pf0-f173.google.com
	[209.85.192.173])
	by mail.openembedded.org (Postfix) with ESMTP id 22EC174D5E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 May 2018 21:29:59 +0000 (UTC)
Received: by mail-pf0-f173.google.com with SMTP id x9-v6so7897411pfm.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 May 2018 14:30:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=ZrC8I9zavDpA+i9S37wc+vODHB9hkWPBuDfLVNpNfSo=;
	b=AtkXvGrdfQ0r9+ka0rQRlMFlHE9H9bpFeLIieDW+LuOhyZpER+j8t6cUcf1j9Vdx6c
	UJnljrUJxa8RgW5xyz5iydWl9eU+0kCuJfD78SF4IZ34LFrIJ0BvFp05/cAA2rpwMybG
	v+Gtm+1ksVF4YgHyNptTtZ8nc06uC0EZYA4xIg1KWNUI8MhY/gvi1fttE82MqHie9w0v
	s0s13y4kr2SsgBrBnAu/m7BYNcavI1ZlUSx45gWfn0Z6fGhdE9hLSfA/sV5Db5I71d9m
	uvD24odRJe1OlcfFXu47wXNlr3o1OxSZWcwkbDiq5NZYHClMdLl/l+EEWobpqgHRhf9/
	3PIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=ZrC8I9zavDpA+i9S37wc+vODHB9hkWPBuDfLVNpNfSo=;
	b=XrJXc5Z7JFAIXKyVT9ELgKxEvAe5eBBqXSufGpTtWfdyK2CIAOA9CXs+v7RCmNKcyt
	bhmF5f2Qi5vw6AqeXzLvf/YLxcpm32FR45aqqli8D3/VeKmGGXG90TXUPIuBwiz6AMFb
	I10EOHGNGV9BadTpk/Qzh91TudjXKVcnY7v/3emYrS83bJbHqMRYkidM4nMXHhH8Ncux
	u8+TYUx39C098CdughSpjVLUOw6JPaVWLkknERyxnm8ubeMuavBZBQzf8QDoPPXHZU7V
	+GIXQJ1aPh6IwYFz+/t9E0bRPUysfJ26PZ7xgPKUY57YjTc7Z6NfpbQZF5w+k5TOIHx2
	eeEw==
X-Gm-Message-State: ALKqPweE9f0FBiGlkd0ekI6i+FDhbWgE/tP2X2LngAMrcDh75D8Rv1mL
	ocJrqFS2aak3WE82ksYKAYWK1w==
X-Google-Smtp-Source: ADUXVKJDdoYd7DEv+SRNLx+e04+xZjn1tiXYOqJ2tLqlb3/WoakI4U4UMKLq6lH75p2FZINLJ2vXhQ==
X-Received: by 2002:a62:2f44:: with SMTP id v65-v6mr85592pfv.83.1527629400712; 
	Tue, 29 May 2018 14:30:00 -0700 (PDT)
Received: from e6520.cablelabs.com ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	i7-v6sm24362pfa.34.2018.05.29.14.29.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 29 May 2018 14:30:00 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 29 May 2018 14:29:47 -0700
Message-Id: <1527629388-3808-5-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1527629388-3808-1-git-send-email-armccurdy@gmail.com>
References: <1527629388-3808-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH v2 4/5] bitbake.conf: include ASNEEDED in TARGET_LDFLAGS directly
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
X-List-Received-Date: Tue, 29 May 2018 21:30:00 -0000

Previously, ASNEEDED was appended to TARGET_LDFLAGS from
as-needed.inc via tcmode-default.inc and so may not have been enabled
for external toolchain builds or other configurations which over-ride
TCMODE (ie builds which do not include tcmode-default.inc).

Include ASNEEDED in TARGET_LDFLAGS directly from bitbake.conf to
ensure that the optimisation is applied to all builds (and for
consistency with the way that TARGET_LINK_HASH_STYLE is handled).

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/conf/bitbake.conf                      | 4 +++-
 meta/conf/distro/include/as-needed.inc      | 4 ----
 meta/conf/distro/include/tcmode-default.inc | 3 ---
 3 files changed, 3 insertions(+), 8 deletions(-)
 delete mode 100644 meta/conf/distro/include/as-needed.inc

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 15f6da7..fab3dcc 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -585,8 +585,10 @@ LINKER_HASH_STYLE_mipsarch = "sysv"
 
 TARGET_LINK_HASH_STYLE ?= "${@['-Wl,--hash-style=gnu',''][d.getVar('LINKER_HASH_STYLE') != 'gnu']}"
 
+ASNEEDED ?= "-Wl,--as-needed"
+
 export LDFLAGS = "${TARGET_LDFLAGS}"
-export TARGET_LDFLAGS = "-Wl,-O1 ${TARGET_LINK_HASH_STYLE}"
+export TARGET_LDFLAGS = "-Wl,-O1 ${TARGET_LINK_HASH_STYLE} ${ASNEEDED}"
 
 # Pass parallel make options to the compile task
 EXTRA_OEMAKE_prepend_task-compile = "${PARALLEL_MAKE} "
diff --git a/meta/conf/distro/include/as-needed.inc b/meta/conf/distro/include/as-needed.inc
deleted file mode 100644
index b163fef..0000000
--- a/meta/conf/distro/include/as-needed.inc
+++ /dev/null
@@ -1,4 +0,0 @@
-
-ASNEEDED = "-Wl,--as-needed"
-
-TARGET_LDFLAGS += "${ASNEEDED}"
diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
index 4b58df0..d85fd1e 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -65,12 +65,9 @@ PREFERRED_VERSION_glibc-initial            ?= "${GLIBCVERSION}"
 PREFERRED_VERSION_nativesdk-glibc-initial  ?= "${GLIBCVERSION}"
 PREFERRED_VERSION_cross-localedef-native   ?= "${GLIBCVERSION}"
 
-
 PREFERRED_VERSION_qemu ?= "${QEMUVERSION}"
 PREFERRED_VERSION_qemu-native ?= "${QEMUVERSION}"
 PREFERRED_VERSION_nativesdk-qemu ?= "${QEMUVERSION}"
-# Setup suitable toolchain flags
-require conf/distro/include/as-needed.inc
 
 GOVERSION ?= "1.9%"
 PREFERRED_VERSION_virtual/${TARGET_PREFIX}go ?= "${GOVERSION}"
-- 
1.9.1


