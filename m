Return-Path: <Muhammad_Hamza@mentor.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9146CC43334
	for <webhook@archiver.kernel.org>; Mon, 20 Jun 2022 13:18:37 +0000 (UTC)
Received: from esa2.mentor.iphmx.com (esa2.mentor.iphmx.com [68.232.141.98])
 by mx.groups.io with SMTP id smtpd.web12.30118.1655731108581725812
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Jun 2022 06:18:28 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: mentor.com, ip: 68.232.141.98, mailfrom: muhammad_hamza@mentor.com)
X-IronPort-AV: E=Sophos;i="5.92,306,1650960000";
   d="scan'208";a="77537455"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
  by esa2.mentor.iphmx.com with ESMTP; 20 Jun 2022 05:18:27 -0800
IronPort-SDR: 
 df8JcFo/9rf1oKJs95FuaAPznRKn9WW0U/2M9Z8m2d9a8OTaxQaiSHLSiv4VP7Ye4Vh2BMJlU9
 EQ0J6ducGoN43wRwiAK+FrZifWesH2Fhx9DsFRyh1CiE5fFv/lJzEB+VKw8TLMjf25xtbfzSTu
 0ths5UJN+8+aTx0GcCLyinKyR21b1bSoDTY+zwxXPYoRQR/FqqhffcnS6nNAKWgAqK0iIG7ZYF
 AYevU0ppMqyhM3qERHFsV8sR/2OJ3cWr1/RDlYFUtonR0uSzWIs3pLQzlyb1i9dPcAikBqzG0T
 ljM=
From: Muhammad Hamza <muhammad_hamza@mentor.com>
To: <openembedded-core@lists.openembedded.org>
CC: Muhammad Hamza <muhammad_hamza@mentor.com>, Awais Belal
	<awais_belal@mentor.com>
Subject: [PATCH 1/2] udev-extraconf/mount.sh: save mount name in our tmp
 filecache
Date: Mon, 20 Jun 2022 18:17:55 +0500
Message-ID: <20220620131756.269638-1-muhammad_hamza@mentor.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Jun 2022 13:18:37 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167106

Doing this will allow to fetch the exact name created by the
auto-mounter during the remove action where depending on the
scenario utilities such as the blkid might not be usable due
to actual device not being present on the system.

Signed-off-by: Awais Belal <awais_belal@mentor.com>
Signed-off-by: Muhammad Hamza <muhammad_hamza@mentor.com>
---
 meta/recipes-core/udev/udev-extraconf/mount.sh | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/udev/udev-extraconf/mount.sh b/meta/recipes-core/udev/udev-extraconf/mount.sh
index 12c6a5af22..994de75b28 100644
--- a/meta/recipes-core/udev/udev-extraconf/mount.sh
+++ b/meta/recipes-core/udev/udev-extraconf/mount.sh
@@ -140,7 +140,10 @@ automount() {
 		rm_dir "$MOUNT_BASE/$name"
 	else
 		logger "mount.sh/automount" "Auto-mount of [$MOUNT_BASE/$name] successful"
-		touch "/tmp/.automount-$name"
+		# The actual device might not be present in the remove event so blkid cannot
+		# be used to calculate what name was generated here. Simply save the mount
+		# name in our tmp file.
+		echo "$name" > "/tmp/.automount-$name"
 	fi
 }
 	
-- 
2.25.1


