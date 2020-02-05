Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
	[209.85.160.196])
	by mail.openembedded.org (Postfix) with ESMTP id 87D50605F2
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Feb 2020 23:12:54 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id t13so3040081qto.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Feb 2020 15:12:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=2VGBnk0YT4Kge5zsqfBdYha5J/A7F/DUk8FlDNW/+WA=;
	b=dV0uiWMOzX54b5e4pkFpXr8vLp5HKVOu+JMD+fKLonsz1+X/KJB4LQlAGGhwiWF7eW
	pXI8mncminPXbgvqo1Tnhc/F5ecmG5iSexpecf9iwxDk9EBFYAA0dVpqskiQEqVdTyGH
	mMybIEb4HMO5a7372VHV3l/PWDkm2eY6nq7PkJowX5LSiEh8wpjcxQD2/KOKglZosoUW
	uRRmDq2A0OmEdDmVCbcLV3aMHleCOpHSf0gFj8ew2+RokvB1oYXGmYgqc+wjt5dIYOPo
	dFBUhwZQwYCflpkiNXGnXUG2tcZg+1oAv4Xmw1TWkDPJKof10huOJcgd6MsUHtus3e5/
	VUtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=2VGBnk0YT4Kge5zsqfBdYha5J/A7F/DUk8FlDNW/+WA=;
	b=dTJsIImjeaEgUHyA/+rM/Ki+1Ng2Ps2tozDDJv08e3epGQ9OJ5WvNRiesMMqwqHA51
	zV2JO8J05NT6KgRy6qR0CqwoCYKiZbU7Dl032kgcRROK8P17sGZ4lKYDoNsUKwCeqVT0
	6YhfxCunLRn7QlGGjYItenTNinnOEO3A4aUDSMFa53xKAeOUtX2PrzTxcIijF/yyI7Do
	6Ry4nXPRuzL8KRDPOsSSBIzuUwlLbg9Sf04FxKsnLOHcJI9CPfC+VBKgvCyJidIWcqR/
	biTOrCaf3iH873fdFTbXgXytU3ogTdB7neHMuYWe49f6QYtKbRavTaupkzBYiVmyDj7t
	QtDA==
X-Gm-Message-State: APjAAAWs0P3LeYpRdWZco11Tjs4U0rfmsxNlmSz1ZDYHCtnO4UUU4GiO
	IOHK3hvs0utkldfEsJ+BtdjkdBoSexn6Fg==
X-Google-Smtp-Source: APXvYqzSOEs/CRPFosUpppwAbQGZTXcKdia+brMBQxVTMaQJ4UaK6zTQCmZ0+Wht70yEFfvD95ehhA==
X-Received: by 2002:ac8:6694:: with SMTP id d20mr190134qtp.60.1580944375465;
	Wed, 05 Feb 2020 15:12:55 -0800 (PST)
Received: from localhost.localdomain
	(CPEe8de27b71faa-CM64777d5e8820.cpe.net.cable.rogers.com.
	[174.113.11.95])
	by smtp.gmail.com with ESMTPSA id o17sm696332qtj.80.2020.02.05.15.12.54
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 05 Feb 2020 15:12:54 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Date: Wed,  5 Feb 2020 18:12:43 -0500
Message-Id: <380f2a65d776b678f454c8dd4b2722aeb41da081.1580944129.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1580944129.git.bruce.ashfield@gmail.com>
References: <cover.1580944129.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/9] kern-tools: integrate merge_config fix for gold linker
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
X-List-Received-Date: Wed, 05 Feb 2020 23:12:54 -0000
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Bumping the SRCREV to pickup the following fix:

   Author: Martin Jansa <Martin.Jansa@gmail.com>
   Date:   Wed Feb 5 03:26:57 2020 +0100

       merge_config.sh: pass LD variable from shell environment to make

       * since 5.4 kernel Kconfig will fail immediately when it detects
         that LD points to gold linker:

         scripts/Kconfig.include:39:  gold linker 'i686-oe-linux-ld' not supported

       * in OE we already pass bfd linker in KERNEL_LD variable to merge_config.sh
         but we need to pass it also into the make call here

       Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/kern-tools/kern-tools-native_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
index 57ec1abc6d..3f9cfe7fe5 100644
--- a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
+++ b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://git/tools/kgit;beginline=5;endline=9;md5=9c30e971d435
 
 DEPENDS = "git-native"
 
-SRCREV = "5358eb293399867db05fd73d04ce908d69a03bed"
+SRCREV = "388b67974deb2176c06994a325676cbf23e5fce8"
 PR = "r12"
 PV = "0.2+git${SRCPV}"
 
-- 
2.19.1


