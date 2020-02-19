Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
	[209.85.128.48])
	by mail.openembedded.org (Postfix) with ESMTP id 43ABD613C9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Feb 2020 14:41:46 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id a9so924383wmj.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Feb 2020 06:41:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=E+O+Gu+rlclW30m/GDZUz/+oze+0N/EQWyIkp5guBF4=;
	b=bmppf+w1FFWIoIWPQJgj97HH+IHFcDCCNjnTKP3Cr9jRHyHx5vWthzd3L35UBs7x0V
	sbRmMGdJcMv/ilQ4fc+64HSowzW62bjw3WlwZUiGK2MJCKuNvd+ghIEZ835hWHHFWxHK
	9sJ+CggJ2bfqvU389W/ZbREI7w+5ZcVTTDcE0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=E+O+Gu+rlclW30m/GDZUz/+oze+0N/EQWyIkp5guBF4=;
	b=gLPb2j4j0DsKrOBRdxu8zFAp9xLm0Lnz/sMiwFq8vKxSW0kWJHJxqZLYn9rFN6cAdc
	rxMd3DC0Rwbg0pVC3FV+w22JEVd/WKcTvQUx5z5LQ9jTRHKorshBvxSg9Gck6Vou/JEF
	hKIID8anCIi7anLYUDwbsKytVQaRJWvWlhIKBnbeqy2KPG8NrOsv3Hx+iYfc5BOWnWHl
	SLFAghK6fUm3xziJxJaXb4ycwPf0vYMhKmGPxHyidYEETwydkLROLQwpdA0GzanWz+wZ
	AkYePIdXgHV8zCXcLpFDV8yq1iEVT7lhXIv3hIq0C6Jc0U9ek7+aIK9XcmAVmf1KBB+t
	/Vbg==
X-Gm-Message-State: APjAAAWVDNygHCQoD7nQRYLJl+/SMFt7Xyk0F8PsYHc+hqVabKjK6raR
	wTXetmLZSw5hYAvQESQXPS4t3vYIGQs=
X-Google-Smtp-Source: APXvYqzJzf55Leaxs0Bj/iSyF/XZ+mp0wEC4J9BOb950GR47Gsvc9y+rXhQn4U2HQXDqtvh/vxcDsA==
X-Received: by 2002:a1c:1d13:: with SMTP id d19mr10940594wmd.163.1582123306754;
	Wed, 19 Feb 2020 06:41:46 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id k7sm71552wmi.19.2020.02.19.06.41.45
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 19 Feb 2020 06:41:46 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 19 Feb 2020 14:41:44 +0000
Message-Id: <20200219144144.121102-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Subject: [PATCH] perl: Fix makefile race causing configuration differences
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
X-List-Received-Date: Wed, 19 Feb 2020 14:41:47 -0000
Content-Transfer-Encoding: 8bit

Add a missing makefile dependency which can cause differences in
configuration (submitted upstream).

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../recipes-devtools/perl/files/racefix.patch | 24 +++++++++++++++++++
 meta/recipes-devtools/perl/perl_5.30.1.bb     |  1 +
 2 files changed, 25 insertions(+)
 create mode 100644 meta/recipes-devtools/perl/files/racefix.patch

diff --git a/meta/recipes-devtools/perl/files/racefix.patch b/meta/recipes-devtools/perl/files/racefix.patch
new file mode 100644
index 00000000000..bac42d26ae0
--- /dev/null
+++ b/meta/recipes-devtools/perl/files/racefix.patch
@@ -0,0 +1,24 @@
+In our builds Config_heavy.pl sometimes has lines:
+cwarnflags=XXX
+ccstdflags=XXX
+and sometimes does not.
+The reason is that this information is pulled from cflags by configpm and yet
+there is no dependency in the Makefile. Add one to fix this.
+
+Upstream-Status: Submitted [https://github.com/arsv/perl-cross/pull/89]
+RP 2020/2/19
+Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
+
+Index: perl-5.30.1/Makefile
+===================================================================
+--- perl-5.30.1.orig/Makefile
++++ perl-5.30.1/Makefile
+@@ -204,7 +204,7 @@ configpod: $(CONFIGPOD)
+ git_version.h lib/Config_git.pl: make_patchnum.pl | miniperl$X
+ 	./miniperl_top make_patchnum.pl
+ 
+-lib/Config.pm lib/Config_heavy.pl lib/Config.pod: config.sh \
++lib/Config.pm lib/Config_heavy.pl lib/Config.pod: config.sh cflags \
+ 		lib/Config_git.pl Porting/Glossary | miniperl$X
+ 	./miniperl_top configpm
+ 
diff --git a/meta/recipes-devtools/perl/perl_5.30.1.bb b/meta/recipes-devtools/perl/perl_5.30.1.bb
index b37f175f973..4869012b1a2 100644
--- a/meta/recipes-devtools/perl/perl_5.30.1.bb
+++ b/meta/recipes-devtools/perl/perl_5.30.1.bb
@@ -22,6 +22,7 @@ SRC_URI = "https://www.cpan.org/src/5.0/perl-${PV}.tar.gz;name=perl \
            file://0002-Constant-Fix-up-shebang.patch \
            file://0001-tests-adjust-to-correctly-exclude-unbuilt-extensions.patch \
            file://determinism.patch  \
+           file://racefix.patch \
            "
 SRC_URI_append_class-native = " \
            file://perl-configpm-switch.patch \
-- 
2.25.0


