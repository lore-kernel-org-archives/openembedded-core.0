Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 1EDBD6B50B
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Oct 2019 21:28:16 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id p14so4898559wro.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 Oct 2019 14:28:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=0eHZSTZzkRaYDudbddVxoUl+uS+daI/Gs06kVERd1gY=;
	b=FYfvxgmUparafCvVM4oK7cl2mDYs44QDtPiMPKbToEGY76/ULMfdnh9LroPEtbjHJ4
	ob/Bk+JmSsnGNHPMqqak+frtWJ4XpmkzUGfVnK1jtC5EGz2fV7NyNatGFpBpz+deFmwp
	eIvnvH9b/2qjAZN3HPtzQKvNxRywqzMdSoXXY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=0eHZSTZzkRaYDudbddVxoUl+uS+daI/Gs06kVERd1gY=;
	b=s0XWW2SNf08cL3AQxnuFfoERee9MR69BmcWn4f47OTfgJFsd3eJHV0ES324nEaCKaN
	c7OJLO7HN8y1dK+Ca93r/rXuiTPqC94stsgi2F5PRIWYiWsKuCvHODWuo1QOsv+TV8/I
	d60NKY8RnjpeeTRlt2TsD/y5JfTS+rC+iIH6nY02CPpVrv6C66h0G83el4C+Pcyp310t
	++iW8bpQY6kiUHnAXuUNU4StiWb0u1/Tko7XZoatWUILI5s+Y90NNphJUpUaSErv8nLZ
	2Srp3QthX9ozDJ4RmNwbfdyPA6Xn8tUifXcogXhMsmm8VSk4HgdzQPklSLZAqEebarbC
	xJoQ==
X-Gm-Message-State: APjAAAUws/8LNcxoRPPLnEiDsaYQxqssz6ZJTiSHp7OZQM7eZiA5zLHQ
	tUPjmr1R0m1c9DJ58xl+9eeivoEUmcY=
X-Google-Smtp-Source: APXvYqwIdTjG6GpYHJjptBPrqMEXu6x4sLdkBwux0rgt0CcEEhoaI3BDY+Y0PSPjEHfW1wz0MfzX5A==
X-Received: by 2002:adf:e750:: with SMTP id c16mr4617641wrn.244.1570656497373; 
	Wed, 09 Oct 2019 14:28:17 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	u68sm5226094wmu.12.2019.10.09.14.28.16
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 09 Oct 2019 14:28:16 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Wed,  9 Oct 2019 22:28:15 +0100
Message-Id: <20191009212815.17621-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] readline-native: Fix builds on tumbleweed
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
X-List-Received-Date: Wed, 09 Oct 2019 21:28:17 -0000
Content-Transfer-Encoding: 8bit

OpenSuse's libreadline has extra symbol information which upsets our uninative
loader as our libreadline is missing symbols with the appropriate versions.

The simplest solution is to add the version information as they're harmless.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../recipes-core/readline/readline-8.0/rl-native.map | 12 ++++++++++++
 meta/recipes-core/readline/readline.inc              |  5 +++++
 2 files changed, 17 insertions(+)
 create mode 100644 meta/recipes-core/readline/readline-8.0/rl-native.map

diff --git a/meta/recipes-core/readline/readline-8.0/rl-native.map b/meta/recipes-core/readline/readline-8.0/rl-native.map
new file mode 100644
index 00000000000..5e7d49cdd22
--- /dev/null
+++ b/meta/recipes-core/readline/readline-8.0/rl-native.map
@@ -0,0 +1,12 @@
+READLINE_6.3 {
+    rl_change_environment;
+    rl_clear_history;
+    rl_executing_key;
+    rl_executing_keyseq;
+    rl_filename_stat_hook;
+    rl_history_substr_search_backward;
+    rl_history_substr_search_forward;
+    rl_input_available_hook;
+    rl_print_last_kbd_macro;
+    rl_signal_event_hook;
+};
diff --git a/meta/recipes-core/readline/readline.inc b/meta/recipes-core/readline/readline.inc
index e9665228dc2..07f54a76f18 100644
--- a/meta/recipes-core/readline/readline.inc
+++ b/meta/recipes-core/readline/readline.inc
@@ -43,3 +43,8 @@ do_install_append () {
 BBCLASSEXTEND = "native nativesdk"
 
 CONFFILES_${PN} += "${sysconfdir}/inputrc"
+
+# OpenSuse injects versions into libreadline leading to conficits between our native one and theirs
+# see their spec file for where this is injected. Extra versioning is harmless so we just do the same.
+SRC_URI_append_class-native = " file://rl-native.map"
+LDFLAGS_append_class-native = " -Wl,--version-script=${WORKDIR}/rl-native.map"
\ No newline at end of file
-- 
2.20.1


