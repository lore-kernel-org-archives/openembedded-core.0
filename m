Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qg0-f49.google.com (mail-qg0-f49.google.com
	[209.85.192.49])
	by mail.openembedded.org (Postfix) with ESMTP id 1C4BF720C3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Nov 2014 10:33:35 +0000 (UTC)
Received: by mail-qg0-f49.google.com with SMTP id z60so8608905qgd.36
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Nov 2014 02:33:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:organization; bh=IJFqQnEPCpD/ER+JWJYxLhDJoBsSH9xavTqiZkOqMT8=;
	b=FV09FOCxkoIpoiEDO3bqi6FbDfZhAkGTr7+OsEj/7M97/VJqF3xfyqplOCg8RAIXbV
	QwAKewWkG/i7Gt19dG3Uvxxdh216bFaH+LTph31zNumoWvcf7s3RvCIZd6cExWqMiA0P
	qLL2EVVp1lGnsqr/lXlw+7I9anHqDUFwgWd6HrjCLRU+8IH6SnlLbTuinBMinZej9M0V
	PB4ahNj2xvt0PkujySOV2Hm78w1TZAV5WDtjCd9KjAX84yASMi9yNIMHAIxV75J92Yx1
	F0Y5vaUxO8PC1atoK7yEa8aVB/es2zwxRxl7DiPNSbmQKef+0nTxcGHdlGzwjae2CNGn
	YZhg==
X-Received: by 10.140.48.233 with SMTP id o96mr57978230qga.47.1415788416398;
	Wed, 12 Nov 2014 02:33:36 -0800 (PST)
Received: from nano.lab.ossystems.com.br ([177.194.193.50])
	by mx.google.com with ESMTPSA id d2sm20698383qab.24.2014.11.12.02.33.33
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 12 Nov 2014 02:33:34 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
Received: by nano.lab.ossystems.com.br (Postfix, from userid 1000)
	id EF59A1C86BEB6; Wed, 12 Nov 2014 08:33:30 -0200 (BRST)
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Wed, 12 Nov 2014 08:33:24 -0200
Message-Id: <1415788406-23120-2-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.1.1
In-Reply-To: <1415788406-23120-1-git-send-email-otavio@ossystems.com.br>
References: <1415788406-23120-1-git-send-email-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 2/4] toolchain-scripts.bbclass: Export KCFLAGS to ensure sysroot is provided
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
X-List-Received-Date: Wed, 12 Nov 2014 10:33:40 -0000

When building the U-Boot the lack of a proper sysroot can trigger
following error:

,----
| arm-poky-linux-gnueabi-ld.bfd: cannot find -lgcc
| make[2]: *** [examples/standalone/hello_world] Error 1
| make[1]: *** [examples/standalone] Error 2
| make: *** [examples] Error 2
`----

Guillaume Fournier has posted a very complete analysis of the
problem[1].

1. https://lists.yoctoproject.org/pipermail/meta-freescale/2014-November/011270.html

The use of KCFLAGS makes the build of U-Boot work out of box, now that
it uses the Linux kernel build system.

Reported-by: Guillaume Fournier <gfournier@brioconcept.com>
Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta/classes/toolchain-scripts.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/toolchain-scripts.bbclass b/meta/classes/toolchain-scripts.bbclass
index 2244cf7..cf99c73 100644
--- a/meta/classes/toolchain-scripts.bbclass
+++ b/meta/classes/toolchain-scripts.bbclass
@@ -68,6 +68,7 @@ toolchain_shared_env_script () {
 	echo 'export CXXFLAGS="${TARGET_CXXFLAGS}"' >> $script
 	echo 'export LDFLAGS="${TARGET_LDFLAGS}"' >> $script
 	echo 'export CPPFLAGS="${TARGET_CPPFLAGS}"' >> $script
+	echo 'export KCFLAGS="--sysroot=$SDKTARGETSYSROOT"' >> $script
 	echo 'export OECORE_DISTRO_VERSION="${DISTRO_VERSION}"' >> $script
 	echo 'export OECORE_SDK_VERSION="${SDK_VERSION}"' >> $script
 	echo 'export ARCH=${ARCH}' >> $script
-- 
2.1.1


