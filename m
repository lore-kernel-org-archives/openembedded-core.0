Return-Path: <armccurdy@gmail.com>
Received: from mail-ie0-f176.google.com (mail-ie0-f176.google.com
	[209.85.223.176])
	by mail.openembedded.org (Postfix) with ESMTP id 13FFB737A3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Jul 2015 01:58:30 +0000 (UTC)
Received: by iecuq6 with SMTP id uq6so46600508iec.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jul 2015 18:58:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=xlp1h9/K6Ur0VVopG71eUuR8Nz7MLxRGP9mrzsgO9HE=;
	b=X7xls8z2dYbMWuCIkfTqbqsaE0fnjMkUE1aA6lJQI1Xvze6+fvU8T1EkkV1v7mLQ/X
	cgVh65q09J8POxzi1KVN6RVXQ4ReAGf6BN2Rtm/MoLRtK4cfnp6KjjAwKtEfCOhpWWwN
	lihSLEcPUvYGVw5npRTSeXrntLsE6I7f6qBQeTQbfOU2EnKg2v5g45FNhbKI8uHSXrMg
	+8uWbfLh8zrEIDafulaF9AcgyNnzJAGP7tpXYk/J4eoqJCOXoblv//UJhII6yd/5bikr
	wEnSgfXL32EdIE0wvGuLI3hSOiSs5HXJGxOM+JsVrDnVxVbZBi0hutS3ph6ky1T5bS5V
	kotA==
X-Received: by 10.50.64.147 with SMTP id o19mr1257843igs.33.1437011910871;
	Wed, 15 Jul 2015 18:58:30 -0700 (PDT)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id x4sm4042784iod.26.2015.07.15.18.58.29
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 15 Jul 2015 18:58:30 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 15 Jul 2015 18:58:08 -0700
Message-Id: <1437011888-12736-4-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1437011888-12736-1-git-send-email-armccurdy@gmail.com>
References: <1437011888-12736-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 3/3] libcap: control attr PACKAGECONFIG via xattr DISTRO feature
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
X-List-Received-Date: Thu, 16 Jul 2015 01:58:32 -0000

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-support/libcap/libcap_2.24.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-support/libcap/libcap_2.24.bb b/meta/recipes-support/libcap/libcap_2.24.bb
index 161bb70..36b94ee 100644
--- a/meta/recipes-support/libcap/libcap_2.24.bb
+++ b/meta/recipes-support/libcap/libcap_2.24.bb
@@ -26,7 +26,8 @@ do_configure() {
 	sed -e '/shell gperf/cifeq (,yes)' -i libcap/Makefile
 }
 
-PACKAGECONFIG ??= "attr ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam', '', d)}"
+PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam', '', d)} \
+                   ${@bb.utils.contains('DISTRO_FEATURES', 'xattr', 'attr', '', d)}"
 PACKAGECONFIG_class-native ??= ""
 
 PACKAGECONFIG[attr] = "LIBATTR=yes,LIBATTR=no,attr"
-- 
1.9.1


