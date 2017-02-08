Return-Path: <philip.balister@gmail.com>
Received: from mail-qt0-f195.google.com (mail-qt0-f195.google.com
	[209.85.216.195])
	by mail.openembedded.org (Postfix) with ESMTP id 4FC4571CF9
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Feb 2017 20:27:16 +0000 (UTC)
Received: by mail-qt0-f195.google.com with SMTP id h53so24738975qth.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Feb 2017 12:27:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id;
	bh=jB901ev8OjGQf6WhnZApcfIkT/DhKsFLEoRKF7fP+Ow=;
	b=aPcV1CJFn1j9o3ZVB1djRWCLtmXzlFWml+oI5adinVesduAeoaX9Bi2g5LmbemseHw
	m1yqwz6iUa4bWycZegTzaFoGoYbhBtZPfe7QCfMq8HippZd+nh2iY+fXWTG99+oLKqed
	QRwvjr7fXJeH8XLDDAX+fU6RXU6NaZk4ia0E1gGDtPSd3UXTx2MnXDijegFqVbJD6RVJ
	3vGq7a8BekXoOk7u6V14aX7BaSiYtuB2ecDK9XaRRd0hJIrRrfmSXHdRK4tvwGUqdhhr
	9r18rw8W6hQpvZBHZk4SlBVTpkAjcCkYLAtexorEbRf7kF5AMGk3aRrCfjkSjWT6Ca9a
	gKEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
	bh=jB901ev8OjGQf6WhnZApcfIkT/DhKsFLEoRKF7fP+Ow=;
	b=ogDPjYrhuHamvtPBSWhG3dYT7pICh4md3W6lS45i22WrnLF/VpiKSsSshwWsgOWMrZ
	V6VvLKLtFvtZCeObD/1WBAVxUY+rS6owtUg2cnepXCO8z0OgqQdNDvTX1jErEvYxZsMu
	PQavACtiVCdMVUjigqZJ+HRyTM+heN7++VXlL4fUv7pvDLi9lwGTA1B82zHpgPVAFquR
	IdmQ4IEEOhl+7JaB1J/X17cToL2+enQu6zh4Y9G8PVTSXDSX2z7Ayo+TGg0jUGPneMAH
	SMdNf/NnDtNvhKYKInXDf+8TKK4rs+F4sWa0uzjJVUJa/kqE2eWlr0lHBVwZ7HpY3JbA
	9Szw==
X-Gm-Message-State: AMke39meUceFsm227VxKRk71KAVhzXiNqQGA0/GrzCEkJ2ZGKElYeJZr8ghXYa8oGirjiA==
X-Received: by 10.200.1.2 with SMTP id e2mr20491138qtg.142.1486585636787;
	Wed, 08 Feb 2017 12:27:16 -0800 (PST)
Received: from thuvia.localdomain (pool-108-4-175-67.ronkva.east.verizon.net.
	[108.4.175.67]) by smtp.gmail.com with ESMTPSA id
	c141sm7126035qkb.10.2017.02.08.12.27.15
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 08 Feb 2017 12:27:15 -0800 (PST)
Sender: Philip Balister <philip.balister@gmail.com>
From: Philip Balister <philip@balister.org>
To: openembedded-core@lists.openembedded.org
Date: Wed,  8 Feb 2017 15:27:06 -0500
Message-Id: <1486585626-13662-1-git-send-email-philip@balister.org>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] sanity.bbclass: Add which to SANITY_REQUIRED_UTILITIES.
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
X-List-Received-Date: Wed, 08 Feb 2017 20:27:18 -0000

Using docker with the Fedora 23 container exposed an issue with
the rpm-native configure step. If which is not present the configure
script fork bombs. After much pain, I tracked this to which not being
present in the default container. Add a check for which so others
do not have to have this experience.

Signed-off-by: Philip Balister <philip@balister.org>
---
 meta/classes/sanity.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index 7bcceee..4ed501e 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -3,7 +3,7 @@
 #
 
 SANITY_REQUIRED_UTILITIES ?= "patch diffstat makeinfo git bzip2 tar \
-    gzip gawk chrpath wget cpio perl file"
+    gzip gawk chrpath wget cpio perl file which"
 
 def bblayers_conf_file(d):
     return os.path.join(d.getVar('TOPDIR'), 'conf/bblayers.conf')
-- 
2.7.4


