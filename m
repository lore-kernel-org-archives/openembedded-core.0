Return-Path: <armccurdy@gmail.com>
Received: from mail-ig0-f171.google.com (mail-ig0-f171.google.com
	[209.85.213.171])
	by mail.openembedded.org (Postfix) with ESMTP id 76E6575877
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Jul 2015 01:58:28 +0000 (UTC)
Received: by igvi1 with SMTP id i1so3513463igv.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jul 2015 18:58:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=3Qva6q9ilKiMm1bnBtOsOP/9O91KlhHQMko8f4h0QNQ=;
	b=mUc+ZELuJ7fvbDyeydj/lgoEU5CVByMVrCZb4MdqmTkl+ljmj7PEYZca6vUoDkyJm7
	BGVsIA7/Ik74lB3UBmodiM0uvuiBBmcuNUOii04ub4t/QNWHf7golpq/KohNZEDBZYHA
	CJ7uah5TL+MwxNuBMmz4nhcLkxklnxTXl1LomIiinzKitLxEF/4t2MkLGt+tz6Z2Phsi
	655yYzyJjjmJMN6+BCuQr/A+lr7AmxapCIX+a2t+8joGBRmWcse8bMHzlYwNj+UkVVhj
	ovdzvyeqmeeZ+pJHowrxLoL2PHLh1tY08uCUDzv2YloK6HjSNH+CgRAzStSWlehOlS7X
	MZ9A==
X-Received: by 10.50.142.69 with SMTP id ru5mr1230401igb.61.1437011908700;
	Wed, 15 Jul 2015 18:58:28 -0700 (PDT)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id x4sm4042784iod.26.2015.07.15.18.58.27
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 15 Jul 2015 18:58:28 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 15 Jul 2015 18:58:07 -0700
Message-Id: <1437011888-12736-3-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1437011888-12736-1-git-send-email-armccurdy@gmail.com>
References: <1437011888-12736-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 2/3] libcap: avoid losing default Large File Support CFLAGS
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
X-List-Received-Date: Thu, 16 Jul 2015 01:58:29 -0000

-D_LARGEFILE64_SOURCE and -D_FILE_OFFSET_BITS=64 are present in the
default libcap CFLAGS. Add them to the OE CFLAGS too, so that they
are still in effect when the OE CFLAGS over-ride the defaults.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-support/libcap/libcap_2.24.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-support/libcap/libcap_2.24.bb b/meta/recipes-support/libcap/libcap_2.24.bb
index e8ae7ce..161bb70 100644
--- a/meta/recipes-support/libcap/libcap_2.24.bb
+++ b/meta/recipes-support/libcap/libcap_2.24.bb
@@ -41,6 +41,9 @@ EXTRA_OEMAKE = " \
 
 EXTRA_OEMAKE_append_class-target = " SYSTEM_HEADERS=${STAGING_INCDIR}"
 
+# these are present in the libcap defaults, so include in our CFLAGS too
+CFLAGS += "-D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64"
+
 do_compile() {
 	oe_runmake ${EXTRA_OECONF}
 }
-- 
1.9.1


