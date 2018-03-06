Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id B7FED78A57
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Mar 2018 15:10:11 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id 139so22951511wmn.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 06 Mar 2018 07:10:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=OSoDomsNgmE2mMAnBqyJQtRplAEd3KFz03SeoK35ypM=;
	b=J3fqgKshgrVfZPHXNb5M0kNnWiCigqj8GTeJk7Y62UIWjpTdtjtFJxqSd2RSaVK5Y0
	JrqXUdhZueTQCwRTeVCi3eh9dB8zCVx8LLYpFn5K1+5G3YjhSaEddf/9zKa/DlfosCqh
	OXEcTmnK9E0Zty02qE80lrIU85z2/TGWeWU7h2UGhojj0cT4awd7D0VX07Yx6GDVMH+n
	DzJKP6RTg+xlUjl7own/6yHChKtRzYWLiGttudOF18RhOa+ACLqedt4CmdQwBvDUKPcc
	t18vxSmelq/BFPADWRQbBpqN+we2jWbW1PH2cmViogGFgD2RR58q8nVfzGM0M8dnKFmG
	IXmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=OSoDomsNgmE2mMAnBqyJQtRplAEd3KFz03SeoK35ypM=;
	b=XjDGOkEHrCs19O3RmGwB8m0ztsvAU3HYQQR/5LaJ5VdsYLDVf5ksqtOIq5r/eDNri6
	U25otBjHLf5g5YSvRbnc+4tVQNjWy0t0+ktFq4yKTfJ0e6yRlwBDp2yIQWQcnaeHGXTu
	E0tyvZoL9/dcXynjb7+DBigGl30TDllGL/TSPLEaeqF7c7hVJIwiaQ60Xma4qRPSPkPO
	E1Q82Uiu0jV3y6D7xsPE9KN4bVwGHsVfc8o9Czw/T0YgPuZkyY23bNN+MLO6qZz9iNPw
	tGUTE5cex6VPYlbZFEfKE1kCpISinOIxwmxN24fAcDOE55/6+q3ujLCh+dDjPVPMJhbS
	srbg==
X-Gm-Message-State: AElRT7ECfVZQXBcsvSQxjFTqpG61ZW5hlS1HJZd7qxcyaYI5+2JSSwLC
	nzeo8ggT0EeNZai4NweSfnJGoCLd
X-Google-Smtp-Source: AG47ELutNBg0xTIzY0F73cy/rOlit2ficeSGOk2E69H++/v6dvoeu4SxJVt30nvn0N1zrovrajXsRg==
X-Received: by 10.28.195.133 with SMTP id t127mr11490426wmf.156.1520349012011; 
	Tue, 06 Mar 2018 07:10:12 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by smtp.gmail.com with ESMTPSA id 1sm1734235wmj.35.2018.03.06.07.10.10
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 06 Mar 2018 07:10:10 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  6 Mar 2018 15:10:06 +0000
Message-Id: <20180306151006.26952-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] dbus-glib: refresh patches
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
X-List-Received-Date: Tue, 06 Mar 2018 15:10:12 -0000

The patch tool will apply patches by default with "fuzz", which is where if the
hunk context isn't present but what is there is close enough, it will force the
patch in.

Whilst this is useful when there's just whitespace changes, when applied to
source it is possible for a patch applied with fuzz to produce broken code which
still compiles (see #10450).  This is obviously bad.

We'd like to eventually have do_patch() rejecting any fuzz on these grounds. For
that to be realistic the existing patches with fuzz need to be rebased and
reviewed.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-core/dbus/dbus-glib/no-examples.patch | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-core/dbus/dbus-glib/no-examples.patch b/meta/recipes-core/dbus/dbus-glib/no-examples.patch
index fbb49678282..32e76117188 100644
--- a/meta/recipes-core/dbus/dbus-glib/no-examples.patch
+++ b/meta/recipes-core/dbus/dbus-glib/no-examples.patch
@@ -5,11 +5,13 @@ Upstream-Status: Inappropriate [disable feature]
 Signed-off-by: Kevin Tian <kevin.tian@intel.com>
 Signed-off-by: Scott Garman <scott.a.garman@intel.com>
 
---- dbus-glib-0.70/dbus/Makefile.am.orig	2006-07-23 16:04:43.000000000 +0200
-+++ dbus-glib-0.70/dbus/Makefile.am	2006-07-23 16:04:52.000000000 +0200
+Index: dbus-glib-0.108/dbus/Makefile.am
+===================================================================
+--- dbus-glib-0.108.orig/dbus/Makefile.am
++++ dbus-glib-0.108/dbus/Makefile.am
 @@ -1,4 +1,4 @@
 -SUBDIRS = . examples
 +SUBDIRS = .
  
- INCLUDES=-I$(top_srcdir) $(DBUS_CFLAGS) $(DBUS_GLIB_CFLAGS) $(DBUS_GLIB_TOOL_CFLAGS) -DDBUS_COMPILATION=1 -DDBUS_LOCALEDIR=\"$(prefix)/@DATADIRNAME@/locale\" 
- 
+ AM_CPPFLAGS = \
+ 	-I$(top_srcdir)						\
-- 
2.11.0


