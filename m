Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com
	[209.85.222.195])
	by mail.openembedded.org (Postfix) with ESMTP id D06CD60AF1
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Feb 2020 17:35:56 +0000 (UTC)
Received: by mail-qk1-f195.google.com with SMTP id 21so6355469qky.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Feb 2020 09:35:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=2VGBnk0YT4Kge5zsqfBdYha5J/A7F/DUk8FlDNW/+WA=;
	b=vIfAYqvnraD/TlzHS8U4bAX3T3QgDeU+dtBPylsardpTTSjgaHYnA0edvtU+K6CjZa
	43qSJ/HPI9+7vim/ripqZvJ3bpEw2cOLPEwJpbhP5eo91McR8pn8XfwKB49QozvmoixV
	X+uqssX3fnVg0uBIQiwBsNC9b3/pWVgkwKgFDZDgLSValQ9Lhtc7TnwFIcNtvu7NJlSr
	aLOoh9NO6zJJTFsJpQLy2CnwUyNcZC4ZAxsDMEnBf1Eun1VTezPCL6b1aeip4H8aCILA
	BMFkvChmJcTPJShMjrjmKJXeONK4rj4cNsftR1KMYIqIqL12lawBedjdwKQun3E1MWtX
	Ez2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=2VGBnk0YT4Kge5zsqfBdYha5J/A7F/DUk8FlDNW/+WA=;
	b=k+k6WfyLIsxoQpdmeabhr8ohcrCk9k3xpGkWryJ5DdkNSnadxMzcB8kxaFICNPSTN8
	C2vdYf5l5s97AEOLFhVFF5MZ/Gl0Dj42bbWF0QxTm9SwsaBfhXfV5u0u/WslWIDf5dc6
	lSTqSIKRXl1jGMXYKSGE/S1QA8JOzP+GGZ4ZQ3Tna9Iw4yxSGQgiP5vAPNr+HgskNNTp
	32eI2CYX6LJPNGXhxf0BElKet6R0aSLOF5IN4RNaeCgWvRkQ0JYOhjz3eBydFFyCbzE6
	FSd5Wlt06TMqqqB2Tn52n4Sy8ttjxqFm79PTm2Ne9wxbLdSNb0OAFgpvkJglHlVk4DYf
	9l7w==
X-Gm-Message-State: APjAAAW71XqTgCM3vZUomjL7nr0GxaVxwjwvatpA7MthF6oIggzDZjnE
	2HRrKI3pqwi0s3hJ/cPlGQw=
X-Google-Smtp-Source: APXvYqypvbPLHxmpCIjMtVcID//jAGiSrAKUWEt3YQi51m427T5z4MYJJKlJXVZtzaPRBH9sLxhifw==
X-Received: by 2002:a05:620a:4db:: with SMTP id
	27mr3675586qks.146.1581010557732; 
	Thu, 06 Feb 2020 09:35:57 -0800 (PST)
Received: from localhost.localdomain
	(CPEe8de27b71faa-CM64777d5e8820.cpe.net.cable.rogers.com.
	[174.113.11.95]) by smtp.gmail.com with ESMTPSA id
	e26sm1715138qkm.80.2020.02.06.09.35.56
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 06 Feb 2020 09:35:57 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Date: Thu,  6 Feb 2020 12:35:45 -0500
Message-Id: <380f2a65d776b678f454c8dd4b2722aeb41da081.1581010425.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1581010425.git.bruce.ashfield@gmail.com>
References: <cover.1581010425.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 02/10] kern-tools: integrate merge_config fix for gold linker
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
X-List-Received-Date: Thu, 06 Feb 2020 17:35:57 -0000
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


