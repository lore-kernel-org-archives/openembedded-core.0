Return-Path: <david.c.nystrom@gmail.com>
Received: from mail-lb0-f172.google.com (mail-lb0-f172.google.com
	[209.85.217.172])
	by mail.openembedded.org (Postfix) with ESMTP id F1E9E6D034
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Oct 2013 14:00:07 +0000 (UTC)
Received: by mail-lb0-f172.google.com with SMTP id c11so1636677lbj.31
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Oct 2013 07:00:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=uZDgAbg6adJNq6LcE040ALG7Uti3MukHS6sJOCZ15rw=;
	b=QAav7pxixO4SjfRlfO6nhrZ6c/NhjvGSAjxqOJdM+WUxqv44w5Pa5TRJWlkuq9Gquy
	2txViliqWk/L/gHeqJtopaeUaW6HNkoVpw6UluC9W3XDLa6b2r+GIaChYJZFE/5YO4B6
	YWAcp6Bqg1GRenNLdt4WylW0fGAGeKBNFAu8o6fH9iXMZFT6SX+4L5wLycmKaps/X5m+
	2GY74leEHOYiZ3WAjgDOSH10s/xJGBZN41517dToduOy327cbg7RA7FlkHv5CpZLc2/r
	blWGiZPC1z2FKVH2RlGyrKzVZ04dH9rKUh3i01mJN1Mm+LgJIMz7wewn81D/+yxeZGYc
	HkyQ==
X-Received: by 10.152.3.42 with SMTP id 10mr7533489laz.22.1382018408984;
	Thu, 17 Oct 2013 07:00:08 -0700 (PDT)
Received: from nysan (sestofw01.enea.se. [192.36.1.252])
	by mx.google.com with ESMTPSA id
	ap7sm75173534lac.10.1969.12.31.16.00.00
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 17 Oct 2013 07:00:07 -0700 (PDT)
Received: by nysan (Postfix, from userid 1000)
	id 22EEC400FB5; Thu, 17 Oct 2013 15:59:57 +0200 (CEST)
From: "=?UTF-8?q?David=20Nystr=C3=B6m?=" <david.c.nystrom@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 Oct 2013 15:59:45 +0200
Message-Id: <1382018386-25389-11-git-send-email-david.nystrom@enea.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <1382018386-25389-1-git-send-email-david.nystrom@enea.com>
References: <1382018386-25389-1-git-send-email-david.nystrom@enea.com>
MIME-Version: 1.0
Subject: [PATCH 10/11] nativesdk-packagegroup-sdk-host: Add new DISTRO_FEATURE, sdk-pms
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
X-List-Received-Date: Thu, 17 Oct 2013 14:00:08 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Added a new distro feature called sdk-pms, since smartpm rdepends
on the python runtime.
This to avoid bloating the SDK tarball for those who does not
want it.

Signed-off-by: David Nyström <david.nystrom@enea.com>
---
 meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb b/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb
index e298ff4..1f45c4c 100644
--- a/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb
+++ b/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb
@@ -16,7 +16,8 @@ RDEPENDS_${PN} = "\
     nativesdk-qemu-helper \
     nativesdk-pseudo \
     nativesdk-unfs-server \
-    nativesdk-opkg \
+    ${@base_contains('DISTRO_FEATURES', 'sdk-pms', 'nativesdk-opkg','', d)} \
+    ${@base_contains('DISTRO_FEATURES', 'sdk-pms', 'nativesdk-smartpm','', d)} \
     nativesdk-libtool \
     nativesdk-autoconf \
     nativesdk-automake \
-- 
1.8.3.2


