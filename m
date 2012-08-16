Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1T27sD-0003YU-7X
	for openembedded-core@lists.openembedded.org;
	Thu, 16 Aug 2012 23:45:01 +0200
Received: by mail-we0-f175.google.com with SMTP id r6so2132406wey.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Aug 2012 14:33:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references:x-gm-message-state;
	bh=erQoxxAVZZB1+8CGOpKG5Ap3KXJv/8IholFUyjjv4ko=;
	b=QsLB2bC740h9nneKmIUwtmEmA2ddwXbXU4b23dM4YSHbkigpYXoUcOPnZkDb3jKwLC
	2RMtF2MPvWMrikPjKpO6Fs2xIOfeesp/1/7VY62MySzasBsiTL2SU3F1O0LTQxK6ihiE
	sv9CaDcFvPqF6v1OrUpiBEMwoDuspll+JbeJ4zfv26RefS2paOpz1Q0u40EFjmzUJZuT
	+UVfSXPjdrtovrdm7oVE6ft8gxRyxF2R7fhsIUyVWwaP2ZkRB1Oz7Y80+pJN2FnjvtWZ
	maKJro/P18y1Wp4ud46vARMqGmkZugVulBLAmbKxWnhTuQwWveTJpp8hxnufBJHV7+Hf
	md/g==
Received: by 10.216.162.141 with SMTP id y13mr1346755wek.14.1345152785760;
	Thu, 16 Aug 2012 14:33:05 -0700 (PDT)
Received: from localhost.localdomain ([79.115.110.29])
	by mx.google.com with ESMTPS id bc2sm8949894wib.0.2012.08.16.14.33.04
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 16 Aug 2012 14:33:05 -0700 (PDT)
From: Andrei Gherzan <andrei@gherzan.ro>
To: openembedded-core@lists.openembedded.org
Date: Fri, 17 Aug 2012 00:32:49 +0300
Message-Id: <2048a792acdd8f9cb95c8f90279a5b89a1267f61.1345152235.git.andrei@gherzan.ro>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <754a26c722091d5922d1ef095def13f1cf57f27f.1345152235.git.andrei@gherzan.ro>
References: <754a26c722091d5922d1ef095def13f1cf57f27f.1345152235.git.andrei@gherzan.ro>
In-Reply-To: <cover.1345152235.git.andrei@gherzan.ro>
References: <cover.1345152235.git.andrei@gherzan.ro>
X-Gm-Message-State: ALoCoQn1+gscz2G9nwWQHBlsa/yoVfnyZY/mlY+6OIuwJmApk9Am8tAe0JDkoYFdne6A5y2jRiMN
Subject: [PATCH 6/7] task-core-boot: Add busybox-hwclock if MACHINE_FEATURES contains rtc
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 16 Aug 2012 21:45:03 -0000

For machines with no hardware clock it makes no sense to have this
init stript. Moreover, we avoid a boot error in this way.

Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
---
 meta/recipes-core/tasks/task-core-boot.bb |    1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/tasks/task-core-boot.bb b/meta/recipes-core/tasks/task-core-boot.bb
index 6487436..2947509 100644
--- a/meta/recipes-core/tasks/task-core-boot.bb
+++ b/meta/recipes-core/tasks/task-core-boot.bb
@@ -34,6 +34,7 @@ RDEPENDS_task-core-boot = "\
     base-files \
     base-passwd \
     busybox \
+    ${@base_contains("MACHINE_FEATURES", "rtc", "busybox-hwclock", "", d)} \
     ${VIRTUAL-RUNTIME_initscripts} \
     ${@base_contains("MACHINE_FEATURES", "keyboard", "${VIRTUAL-RUNTIME_keymaps}", "", d)} \
     modutils-initscripts \
-- 
1.7.9.5



