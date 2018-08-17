Return-Path: <Quanyang.Wang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6883A6FFA1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Aug 2018 15:01:49 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w7HF1oa1028795
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Aug 2018 08:01:50 -0700 (PDT)
Received: from pek-lpggp3.wrs.com (128.224.153.76) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.399.0;
	Fri, 17 Aug 2018 08:01:49 -0700
From: <quanyang.wang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 17 Aug 2018 11:01:37 -0400
Message-ID: <1534518097-24981-1-git-send-email-quanyang.wang@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: weston-init: run login before start weston.service
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
X-List-Received-Date: Fri, 17 Aug 2018 15:01:49 -0000
Content-Type: text/plain

From: Wang Quanyang <quanyang.wang@windriver.com>

When systemd start the weston.service, the script "weston-start" will
check if the dir "XDG_RUNTIME_DIR" (usually is /run/user/0) exits and
create it. Then weston will create a socket file "wayland-0" for communications
with clients in this dir.

If systemd is built with enabling "pam" feature, the login will call "run-user-0.mount"
to mount tmpfs at the dir "/run/user/0", then the socket file "wayland-0" will be
missing since it is created in the old "/run/user/0".

So add "PAMName=login" to let weston.service call login first, once tmpfs is mounted at
"/run/user/0", then call weston-start to create a socket file in it.

Signed-off-by: Quanyang Wang <quanyang.wang@windriver.com>
---
 meta/recipes-graphics/wayland/weston-init/weston.service | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-graphics/wayland/weston-init/weston.service b/meta/recipes-graphics/wayland/weston-init/weston.service
index 689ce41..18f7262 100644
--- a/meta/recipes-graphics/wayland/weston-init/weston.service
+++ b/meta/recipes-graphics/wayland/weston-init/weston.service
@@ -4,6 +4,7 @@ RequiresMountsFor=/run
 
 [Service]
 User=root
+PAMName=login
 EnvironmentFile=-/etc/default/weston
 ExecStart=/usr/bin/weston-start -v -e -- $OPTARGS
 
-- 
1.9.1


