Return-Path: <jpuhlman@gmail.com>
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com
	[209.85.216.53])
	by mail.openembedded.org (Postfix) with ESMTP id 10E0561BEF
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Mar 2020 22:25:56 +0000 (UTC)
Received: by mail-pj1-f53.google.com with SMTP id l41so1733600pjb.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Mar 2020 15:25:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=wIT3ysLxlt6dn9fkJUFNAdTttJJCLpdshwRvTwaJ3G8=;
	b=XmtJa6T6SOeMUr7KqKp5OsM0O5zzl43rcCOPZxwBbDUqE9s3WPj4REFweF6Utr0SIo
	60WuaVV4HrCpWRRccdSC1BqPJVVl+GUtakagxom21CyinjBFr39SlLv2I551E1uZybzx
	L/8OXQ6+zqKWeSvTqxngxiEYCUr7G6n8OYm7kir7EhGhYgDUkffDDhUSMvgenzvQ5kgV
	heWk9pthzOZ5oGCCGufi8+gLr81rro9KwqgbMztA1YAaDr9m4ycHa7OnErAPhP9mRv4s
	h6ffgKZXOIWyFIrmLJF8fYzDR4AcFICm/2ZoMFLLT7TUfmL7FqrDb8jRUHZydbjH6Uuy
	YA1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references;
	bh=wIT3ysLxlt6dn9fkJUFNAdTttJJCLpdshwRvTwaJ3G8=;
	b=htA4BsYzFcfQetdF1dQTxLURrLF1CT6iN6e87upJ3cSaKkPpWjYX5PwPB9SYlrjDXr
	FW3hD3bbG6g3eEm05dgvUGQp+v3JDsD+lvvu8RezkE9jUHE04gqX1rv4XGq69s4nc4Sx
	4q6zbUbFSSJsU1xaDQ8An6UXcOJx1I20bn59hqM2j2Xe5EzS6bLkcWjm10IBuhO3qF//
	uMgtvU7ojFjz98QgOaZelV75GBnH4P/AA3Ov7dp36Feq8z9qRWmZUqlJh/YPz1oVi/Vl
	x8HuRckSDp6KJQLOg3gVEPDdyI423Cid7ltCyRMngfKShpMwLa0VRoV4yEb/Y3O+eREj
	Hf+A==
X-Gm-Message-State: ANhLgQ1ljpRLxvSpWs1rTTfJI3uYzeqiVoq0Ncnozn3y4TFZ1ewXUjX2
	OoQdeGPKJFprL6NdwLDEcxawryyJ5Wo=
X-Google-Smtp-Source: ADFU+vvPBu1468K23FTkUZn2dBKNmPmZOvbBe2MQNVJhDfodY9dBPe9Vk08Qs8peEm9BTmOHRarzhA==
X-Received: by 2002:a17:902:8303:: with SMTP id
	bd3mr5213864plb.171.1583965557926; 
	Wed, 11 Mar 2020 15:25:57 -0700 (PDT)
Received: from workhorse.localdomain
	(99-14-97-149.lightspeed.frokca.sbcglobal.net. [99.14.97.149])
	by smtp.gmail.com with ESMTPSA id q8sm6678669pje.2.2020.03.11.15.25.57
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 11 Mar 2020 15:25:57 -0700 (PDT)
Sender: Jeremy Puhlman <jpuhlman@gmail.com>
Received: by workhorse.localdomain (Postfix, from userid 1000)
	id B4FC52A05B0; Wed, 11 Mar 2020 15:25:56 -0700 (PDT)
From: "Jeremy A. Puhlman" <jpuhlman@mvista.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 Mar 2020 15:25:45 -0700
Message-Id: <20200311222546.30284-5-jpuhlman@mvista.com>
X-Mailer: git-send-email 2.13.3
In-Reply-To: <20200311222546.30284-1-jpuhlman@mvista.com>
References: <20200311222546.30284-1-jpuhlman@mvista.com>
Subject: [PATCH 5/6] dnf: fix reproducibilty issue
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
X-List-Received-Date: Wed, 11 Mar 2020 22:25:57 -0000

From: Jeremy Puhlman <jpuhlman@mvista.com>

Script points to native python3

Signed-off-by: Jeremy A. Puhlman <jpuhlman@mvista.com>
---
 ...001-set-python-path-for-completion_helper.patch | 24 ++++++++++++++++++++++
 meta/recipes-devtools/dnf/dnf_4.2.2.bb             |  1 +
 2 files changed, 25 insertions(+)
 create mode 100644 meta/recipes-devtools/dnf/dnf/0001-set-python-path-for-completion_helper.patch

diff --git a/meta/recipes-devtools/dnf/dnf/0001-set-python-path-for-completion_helper.patch b/meta/recipes-devtools/dnf/dnf/0001-set-python-path-for-completion_helper.patch
new file mode 100644
index 0000000000..448f6408bc
--- /dev/null
+++ b/meta/recipes-devtools/dnf/dnf/0001-set-python-path-for-completion_helper.patch
@@ -0,0 +1,24 @@
+From 7e79b3b67fd5cecd7380e7e365fd88eca63b5bfa Mon Sep 17 00:00:00 2001
+From: Jeremy Puhlman <jpuhlman@mvista.com>
+Date: Wed, 11 Mar 2020 22:10:02 +0000
+Subject: [PATCH] set python path for completion_helper
+
+Upstream-Status: Inappropriate [oe-core specific]
+Signed-off-by: Jeremy Puhlman <jpuhlman@mvista.com>
+---
+ dnf/cli/completion_helper.py.in | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/dnf/cli/completion_helper.py.in b/dnf/cli/completion_helper.py.in
+index 351226759..2835cd3b6 100644
+--- a/dnf/cli/completion_helper.py.in
++++ b/dnf/cli/completion_helper.py.in
+@@ -1,4 +1,4 @@
+-#!@PYTHON_EXECUTABLE@
++#!/usr/bin/env python3
+ #
+ # This file is part of dnf.
+ #
+-- 
+2.23.0
+
diff --git a/meta/recipes-devtools/dnf/dnf_4.2.2.bb b/meta/recipes-devtools/dnf/dnf_4.2.2.bb
index 5244e10cfc..a046ffc05d 100644
--- a/meta/recipes-devtools/dnf/dnf_4.2.2.bb
+++ b/meta/recipes-devtools/dnf/dnf_4.2.2.bb
@@ -14,6 +14,7 @@ SRC_URI = "git://github.com/rpm-software-management/dnf.git \
            file://0029-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch \
            file://0030-Run-python-scripts-using-env.patch \
            file://Fix-SyntaxWarning.patch \
+           file://0001-set-python-path-for-completion_helper.patch \
            "
 
 SRCREV = "9947306a55271b8b7c9e2b6e3b7d582885b6045d"
-- 
2.13.3


