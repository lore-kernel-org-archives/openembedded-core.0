Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1T28kT-0005Ch-7o
	for openembedded-core@lists.openembedded.org;
	Fri, 17 Aug 2012 00:41:05 +0200
Received: by wibhn17 with SMTP id hn17so989714wib.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Aug 2012 15:29:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references:x-gm-message-state;
	bh=erQoxxAVZZB1+8CGOpKG5Ap3KXJv/8IholFUyjjv4ko=;
	b=OtlEAjvBOxZ/LHGtxiXFiGbsgNA1hwLKeban6Vn3e64ZZD/FfzVLWMiPSp9NwHWvFm
	VLoNP4GbCEhEFTNS7zeQnp6+lbXZhpAYw8PXpyvaMEUEa5RErxbliNJKUvVwlQXhYFeH
	hPtFYKQRrUIaNafBmhrH09DqyQICg+iJytKVa21eUJKFLHELbeqDj78Mvr2lvzepa7Ez
	FVDccYYqUkAJSpfqOIjJgJr6pUG3in3llLNQiaCQ2c7Wvn67JpA6PFdOb5QWKapFU168
	z2xi8tZjQGyqldPFiw/3lnffJmXyl1zNYkSVC+vw9AxT5cQqUdl7Rum21SlWgQpEd3oF
	ALxw==
Received: by 10.217.1.195 with SMTP id n45mr1243099wes.179.1345156147558;
	Thu, 16 Aug 2012 15:29:07 -0700 (PDT)
Received: from localhost.localdomain ([79.115.110.29])
	by mx.google.com with ESMTPS id cu1sm6321240wib.6.2012.08.16.15.29.06
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 16 Aug 2012 15:29:06 -0700 (PDT)
From: Andrei Gherzan <andrei@gherzan.ro>
To: openembedded-core@lists.openembedded.org
Date: Fri, 17 Aug 2012 01:28:51 +0300
Message-Id: <2c0055c43eae1489aee3e5e3fa2b8481d10fe0ce.1345155936.git.andrei@gherzan.ro>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <754a26c722091d5922d1ef095def13f1cf57f27f.1345155936.git.andrei@gherzan.ro>
References: <754a26c722091d5922d1ef095def13f1cf57f27f.1345155936.git.andrei@gherzan.ro>
In-Reply-To: <cover.1345155936.git.andrei@gherzan.ro>
References: <cover.1345155936.git.andrei@gherzan.ro>
X-Gm-Message-State: ALoCoQlPWlwwyV3XTzPrLlRrUmJnedoU/kN7wIuvBjO06Hzf30MHOqQQlFpST/8ZxIFy8GHMSllO
Subject: [V2 PATCH 5/6] task-core-boot: Add busybox-hwclock if MACHINE_FEATURES contains rtc
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
X-List-Received-Date: Thu, 16 Aug 2012 22:41:05 -0000

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



