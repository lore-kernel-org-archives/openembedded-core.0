Return-Path: <kergoth@gmail.com>
Received: from mail-pa0-f42.google.com (mail-pa0-f42.google.com
	[209.85.220.42])
	by mail.openembedded.org (Postfix) with ESMTP id AB82976BDE
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Aug 2015 22:18:48 +0000 (UTC)
Received: by pacdd16 with SMTP id dd16so106431495pac.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Aug 2015 15:18:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=8f7G/vTs69HBSJNU4n40MIUVAAJDjvlQx1hzXWa0UMQ=;
	b=ikhq6QP/Rc31Gcd4mpS7FmFljvJxM6g08hqO7ebyC5B2OQ529edJJVGD86cBKkjt1n
	NrGuaKMGgpx57AucN8FyxVNtKSO2LHBcZny2Whr3nMoYe3wW0A+zes5aJYkdgY/al7TX
	+zNqDMwAJtNvKISsw0xquTnSuGm+1r9G/C/x/vomdrWQxFZkxAA71RgLcyCo05dmMoes
	GLI4hquGEVpZDhX8yz6XvYasGs8qs8cILKeAFeF+zrppVu1Y+FYpHpyFhVwVchSJJ8rf
	iberjSB1Ec/mw6sg4jhl1Uckf+r9R8E4ecGCxb6V0jlj+rJLbzuFibp1P/5e6VkCDDQ5
	JdVA==
X-Received: by 10.66.248.72 with SMTP id yk8mr48676852pac.112.1440454728670;
	Mon, 24 Aug 2015 15:18:48 -0700 (PDT)
Received: from amyr.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by smtp.gmail.com with ESMTPSA id
	mc1sm18565465pdb.14.2015.08.24.15.18.47
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 24 Aug 2015 15:18:47 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 24 Aug 2015 15:18:34 -0700
Message-Id: <ca7446426bd9e8855331f9b61733745582bc62a8.1440454289.git.chris_larson@mentor.com>
X-Mailer: git-send-email 2.2.1
In-Reply-To: <88f419e3f0f9c1a3fa5619641be68b9832de9196.1440454289.git.chris_larson@mentor.com>
References: <88f419e3f0f9c1a3fa5619641be68b9832de9196.1440454289.git.chris_larson@mentor.com>
In-Reply-To: <cover.1440454289.git.chris_larson@mentor.com>
References: <cover.1440454289.git.chris_larson@mentor.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH 2/7] update-rc.d.bbclass: explicitly dep on initscripts
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
X-List-Received-Date: Mon, 24 Aug 2015 22:18:48 -0000

From: Christopher Larson <chris_larson@mentor.com>

update-rc.d doesn't just want an initscripts package, it wants
initscripts-functions. In the case where VIRTUAL-RUNTIME_initscripts is set to
nothing, update-rc.d still needs initscripts-functions to satisfy its runtime
dependencies. Further, we shouldn't be using a *runtime* virtual in a *build
time* variable. This should resolve image creation failures with
configurations without sysv initscripts when a recipe inherits update-rc.d and
doesn't inherit systemd.

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta/classes/update-rc.d.bbclass | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta/classes/update-rc.d.bbclass b/meta/classes/update-rc.d.bbclass
index 6a08315..2a0a74a 100644
--- a/meta/classes/update-rc.d.bbclass
+++ b/meta/classes/update-rc.d.bbclass
@@ -1,8 +1,6 @@
 UPDATERCPN ?= "${PN}"
 
-DEPENDS_append_class-target = " update-rc.d-native update-rc.d"
-VIRTUAL-RUNTIME_initscripts ?= "initscripts"
-DEPENDS_append_class-target = " ${VIRTUAL-RUNTIME_initscripts}"
+DEPENDS_append_class-target = " update-rc.d-native update-rc.d initscripts"
 UPDATERCD = "update-rc.d"
 UPDATERCD_class-cross = ""
 UPDATERCD_class-native = ""
-- 
2.2.1


