Return-Path: <kergoth@gmail.com>
Received: from mail-ob0-f171.google.com (mail-ob0-f171.google.com
	[209.85.214.171])
	by mail.openembedded.org (Postfix) with ESMTP id 083366A4E4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 May 2013 02:26:37 +0000 (UTC)
Received: by mail-ob0-f171.google.com with SMTP id dn14so2009695obc.16
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2013 19:26:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=XBZ7yFdXfHumCDV2UXkQgPbd8z/Cpf2J6yg8xTbj21s=;
	b=IW/XbdcY66zwo6HukkuOA7ovm2pdftC3YenYLi6SDDhGtYizIfYstcKuK6CEQp4wH4
	Bj+QCfyB95A1NSm/ktlHFcRN1X0cC/HNyVlVFfZpq96VSDa+nGtjDNi6qMchTEGJOnj4
	GcjriCWNXXhAi8itzXlpmlb7QhyfBX/9bwT6SYhCtcq+VojwX2ACBHpMxVC2wKJYjE57
	xvLlwSDKbuEQoFdnmiRBOih5/S81MRPnsB9+J5BD8dZAB8SyhwpHz+oa2SKWPw/tCNaQ
	wlZfAxU9HKV+yGoLifzUMzMCp0B9Bn435Szf1aHhhaOmrIQ2oNiJuSfb0mEV/eh+zsqm
	5iow==
X-Received: by 10.60.65.5 with SMTP id t5mr5202462oes.139.1369967199150;
	Thu, 30 May 2013 19:26:39 -0700 (PDT)
Received: from precise64.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by mx.google.com with ESMTPSA id sa2sm14397164oeb.1.2013.05.30.19.26.37
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 30 May 2013 19:26:38 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 30 May 2013 19:26:29 -0700
Message-Id: <2b0ada9e59fbb9271675b8dac7316b8ecea45514.1369967097.git.chris_larson@mentor.com>
X-Mailer: git-send-email 1.8.3
In-Reply-To: <cover.1369967097.git.chris_larson@mentor.com>
References: <cover.1369967097.git.chris_larson@mentor.com>
In-Reply-To: <cover.1369967097.git.chris_larson@mentor.com>
References: <cover.1369967097.git.chris_larson@mentor.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH 5/5] nfs-utils: obey 'tcp-wrappers' PACKAGECONFIG
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
X-List-Received-Date: Fri, 31 May 2013 02:26:38 -0000

From: Christopher Larson <chris_larson@mentor.com>

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta/recipes-connectivity/nfs-utils/nfs-utils_1.2.8.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils_1.2.8.bb b/meta/recipes-connectivity/nfs-utils/nfs-utils_1.2.8.bb
index 2f35094..40b897b 100644
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils_1.2.8.bb
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils_1.2.8.bb
@@ -8,7 +8,7 @@ LICENSE = "MIT & GPLv2+ & BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=95f3a93a5c3c7888de623b46ea085a84"
 
 # util-linux for libblkid
-DEPENDS = "libcap libnfsidmap libevent util-linux tcp-wrappers sqlite3"
+DEPENDS = "libcap libnfsidmap libevent util-linux sqlite3"
 RDEPENDS_${PN} = "rpcbind"
 RRECOMMENDS_${PN} = "kernel-module-nfsd"
 
@@ -45,6 +45,9 @@ EXTRA_OECONF = "--with-statduser=nobody \
                 --with-statdpath=/var/lib/nfs/statd \
                "
 
+PACKAGECONFIG ??= "tcp-wrappers"
+PACKAGECONFIG[tcp-wrappers] = "--with-tcp-wrappers,--without-tcp-wrappers,tcp-wrappers"
+
 INHIBIT_AUTO_STAGE = "1"
 
 PACKAGES =+ "${PN}-client ${PN}-stats"
-- 
1.8.3


