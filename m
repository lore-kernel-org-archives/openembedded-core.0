Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 209D578359
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Aug 2017 11:52:41 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v7GBqhlD028944
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Aug 2017 04:52:43 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.167) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.361.1; Wed, 16 Aug 2017 04:52:42 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 16 Aug 2017 19:57:17 +0800
Message-ID: <dca9f0c58dd4da6c14feecf0e8167dfdfe1a45a5.1502884438.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1502884438.git.Qi.Chen@windriver.com>
References: <cover.1502884438.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/4] initscripts: support persistent /var/log
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
X-List-Received-Date: Wed, 16 Aug 2017 11:52:42 -0000
Content-Type: text/plain

Respect VOLATILE_VAR_LOG variable so that if it's set to any valid boolean
false value, we could have persistent /var/log on the final image.

[YOCTO #6132]

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-core/initscripts/initscripts-1.0/volatiles | 1 -
 meta/recipes-core/initscripts/initscripts_1.0.bb        | 3 +++
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/initscripts/initscripts-1.0/volatiles b/meta/recipes-core/initscripts/initscripts-1.0/volatiles
index bc17c45..2011066 100644
--- a/meta/recipes-core/initscripts/initscripts-1.0/volatiles
+++ b/meta/recipes-core/initscripts/initscripts-1.0/volatiles
@@ -27,7 +27,6 @@ d root root 1777 /run/lock none
 d root root 0755 /var/volatile/log none
 d root root 1777 /var/volatile/tmp none
 l root root 1777 /var/lock /run/lock
-l root root 0755 /var/log /var/volatile/log
 l root root 0755 /var/run /run
 l root root 1777 /var/tmp /var/volatile/tmp
 l root root 1777 /tmp /var/tmp
diff --git a/meta/recipes-core/initscripts/initscripts_1.0.bb b/meta/recipes-core/initscripts/initscripts_1.0.bb
index a65f1b2..7ab0d2b 100644
--- a/meta/recipes-core/initscripts/initscripts_1.0.bb
+++ b/meta/recipes-core/initscripts/initscripts_1.0.bb
@@ -102,6 +102,9 @@ do_install () {
 	install -m 0755    ${WORKDIR}/read-only-rootfs-hook.sh ${D}${sysconfdir}/init.d
 	install -m 0755    ${WORKDIR}/save-rtc.sh	${D}${sysconfdir}/init.d
 	install -m 0644    ${WORKDIR}/volatiles		${D}${sysconfdir}/default/volatiles/00_core
+	if [ ${@ oe.types.boolean('${VOLATILE_LOG_DIR}') } = True ]; then
+		echo "l root root 0755 /var/log /var/volatile/log" >> ${D}${sysconfdir}/default/volatiles/00_core
+	fi
 	install -m 0755    ${WORKDIR}/dmesg.sh		${D}${sysconfdir}/init.d
 	install -m 0644    ${WORKDIR}/logrotate-dmesg.conf ${D}${sysconfdir}/
 
-- 
1.9.1


