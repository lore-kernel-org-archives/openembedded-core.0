Received: from mail-ea0-f173.google.com ([209.85.215.173])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1UHcBD-0008IU-Hj
	for openembedded-core@lists.openembedded.org;
	Mon, 18 Mar 2013 16:40:55 +0100
Received: by mail-ea0-f173.google.com with SMTP id h14so2540948eak.18
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Mar 2013 08:24:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer
	:x-gm-message-state;
	bh=dtYUuD1qNz0F7AlwSkndY4n58opbk24sfzJ+i/pTIgQ=;
	b=U5FG29N3pDNACs5o9hrqtxqrnX6jFfItW7c7OYbRI3zlms6xqAzGQ0bsC6KOKHfWct
	liALU2Y4mk110v9nh1O5Jlj/EI1QXsDIOR52AT/aye1f6rcIBHlVh5ziRZA5u6oXCeVy
	ecIREkXGgvD0stPsQ0TGvc0+yTfmVYIaDNJ17tu1YGStltHPyVpVwaFvE8uq40jZ6Qjm
	76Jy0EnLOuN/tF4gS2Up/qHjdgdP8g6w2WXqOk8ZVfT04CKqfexyPXVpfuowWd89p5Tx
	2QL7v8ZbG1uHnsVcW26SBpIBGM8uZ+q+jcDdYLiqjq6uKw6Ja4j5DWqZNaifZ4uUaG3e
	Pifw==
X-Received: by 10.14.207.73 with SMTP id m49mr50180726eeo.24.1363620247450;
	Mon, 18 Mar 2013 08:24:07 -0700 (PDT)
Received: from localhost.localdomain (ip4da2a5ae.direct-adsl.nl.
	[77.162.165.174])
	by mx.google.com with ESMTPS id ca4sm27764020eeb.15.2013.03.18.08.24.05
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Mon, 18 Mar 2013 08:24:06 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 Mar 2013 16:23:55 +0100
Message-Id: <1363620235-21698-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.8.1.4
X-Gm-Message-State: ALoCoQm96mG/M1l/e/kS0DQMr8Ezn/6afKvTA8VsrVM3nDzrjG7pu/6QJ/qn7P+0397pSD+HKleT
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH] mkefidisk.sh: create a proper ESP
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 18 Mar 2013 15:40:56 -0000

The script was creating a FAT fs with EFI files in it, but wasn't setting the GPT GUID.

Using 'gummiboot install' natively failed because of the missing GPT GUID, so fix that. While we're there also set the name to "EFI System Partition".

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
Acked-by: Darren Hart <dvhart@linux.intel.com>
---
 scripts/contrib/mkefidisk.sh | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/scripts/contrib/mkefidisk.sh b/scripts/contrib/mkefidisk.sh
index 44ac130..b7db0a9 100755
--- a/scripts/contrib/mkefidisk.sh
+++ b/scripts/contrib/mkefidisk.sh
@@ -166,6 +166,14 @@ parted $DEVICE mklabel gpt
 echo "Creating boot partition on $BOOTFS"
 parted $DEVICE mkpart primary 0% $BOOT_SIZE
 
+# GPT doesn't have a real boot flag, parted will change the GUID to EFI System Partition, 
+# which is what we want
+echo "Enabling boot flag on $BOOTFS"
+parted $DEVICE set 1 boot on
+
+echo "Labeling $BOOTFS as EFI System Partition"
+parted $DEVICE name 1 "EFI System Partition"
+
 echo "Creating ROOTFS partition on $ROOTFS"
 parted $DEVICE mkpart primary $ROOTFS_START $ROOTFS_END
 
-- 
1.8.1.4



