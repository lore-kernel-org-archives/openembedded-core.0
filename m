Return-Path: <david.c.nystrom@gmail.com>
Received: from mail-we0-f172.google.com (mail-we0-f172.google.com
	[74.125.82.172])
	by mail.openembedded.org (Postfix) with ESMTP id 9A5576D2D5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Oct 2013 15:35:57 +0000 (UTC)
Received: by mail-we0-f172.google.com with SMTP id q58so1000410wes.17
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Oct 2013 08:35:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=uZDgAbg6adJNq6LcE040ALG7Uti3MukHS6sJOCZ15rw=;
	b=XhqZ9PFrR6X5LGYSvw+2ogm7sXNRLFKibCPsyAvlBSfV0Exk1HCXy6iKCbsX3Cr629
	0i+6RVpYzoF1ByjbjhxQ69tjm4irqsHtf6Kux7bn1m2PIBMWSGCens3/4Zqw9fRHtcxv
	djK2EqPCQZ5Qgg8Ox4GtHaDNTJOdhCB4Cs5PdUTsxS5lNPh9QQuvrdPSy+PTmklouunl
	rgBVFLfB4FaPnerWrENC7wYWEuvp4V4AkLvGLYiobcjSoGQxgU40kFGZYYnS2l5PDbys
	NZ58bEQbhUmPa8ymXKvv4nFmWfN3vydmK/YkyYhT2CVrBqv9I52k4KXbjddYhZ+zRpVy
	86nw==
X-Received: by 10.180.89.225 with SMTP id br1mr2129791wib.50.1382542558532;
	Wed, 23 Oct 2013 08:35:58 -0700 (PDT)
Received: from nysan (ed03490-ge-0-0-0.mgdfwr.lumison.net. [212.20.242.100])
	by mx.google.com with ESMTPSA id y20sm18049440wib.0.2013.10.23.08.35.57
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 23 Oct 2013 08:35:58 -0700 (PDT)
Received: by nysan (Postfix, from userid 1000)
	id 1748D40060D; Wed, 23 Oct 2013 16:35:57 +0100 (BST)
From: "=?UTF-8?q?David=20Nystr=C3=B6m?=" <david.c.nystrom@gmail.com>
To: openembedded-core@lists.openembedded.org,
	yocto@yoctoproject.org
Date: Wed, 23 Oct 2013 16:35:55 +0100
Message-Id: <1382542555-12171-2-git-send-email-david.nystrom@enea.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <1382542555-12171-1-git-send-email-david.nystrom@enea.com>
References: <1382542555-12171-1-git-send-email-david.nystrom@enea.com>
MIME-Version: 1.0
Subject: [PATCHv2] nativesdk-packagegroup-sdk-host: Add new DISTRO_FEATURE, sdk-pms
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
X-List-Received-Date: Wed, 23 Oct 2013 15:35:58 -0000
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


