Return-Path: <bkylerussell@gmail.com>
Received: from mail-io0-f194.google.com (mail-io0-f194.google.com
	[209.85.223.194])
	by mail.openembedded.org (Postfix) with ESMTP id 61A8C600B3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Apr 2017 15:36:11 +0000 (UTC)
Received: by mail-io0-f194.google.com with SMTP id x86so97689ioe.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Apr 2017 08:36:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=dWNpneDHrU6glfslP6vYptDovffR6YVcpRsYcrv/x9g=;
	b=fAAj/B+7XubiFhWx4tcgraxpxU2MqByjUo/B5YS4XlIyYb/Cn6oMX6cNFQEa3DiolC
	xf1aYCQNTWZn6mHbZdPgHoaC6/3qjW6njpUxfqy/X0Arexdl/EaPBH5YRt6ahPILVJTA
	R2MLeUFKVURPmaB4ZCYx3nSpg7PFbEkEU35gD3Vn3v8fZWio7spLrELkhWJJ6lmCNliM
	/HfTGfG6Jvuqrc1Vv6QowKwFrlRoh9AUvAyQL53FTj0s5r6wjiscvY7abU2aWJkoPh+g
	5irUA8nYexDbX+PXWIVTyDRGRSgp6MQN+Nlp2s8LDBwXOY1wRKBwXxeGlnbUMK5sr2Ze
	MaUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=dWNpneDHrU6glfslP6vYptDovffR6YVcpRsYcrv/x9g=;
	b=CAxqr/6E8Ax7rjJI5QKwn9AikjaVjZskfp0rcDgb7vdWzIYlwtu6eOKWAHzd9hYJfK
	XeyI5A5UvYRH4r2ur38a3d7NGAuor7WqNDYPPH2F5ztsUtL2OGR4xYrvJTfqb46gdGTJ
	ldEiqqQhAUa7GhIj8Eu0aWnMGsdyEnor78ubuPvX8iOf1+/RW4hPZORk5aOVkiJtxrlZ
	UogJcbrKcHQn6+P78xwSawlL6bG3Wys4qqg1R3wSJcXye1qZF+bQsMmXwpQeKdBQs/ig
	aqDPiMkj0ipZuKOTq/N65o3khT/LipagydNSzWIC7nLByWZyHM4bHMQjUAF31lCokakb
	+UDw==
X-Gm-Message-State: AN3rC/6njGsZ8Rx4xQtHtPOcdixRprt4c05ADJdZIeIW7aUDx/ghv4xo
	GIICCHV4TillVw==
X-Received: by 10.107.19.65 with SMTP id b62mr15114236ioj.127.1492529773253;
	Tue, 18 Apr 2017 08:36:13 -0700 (PDT)
Received: from localhost.localdomain ([172.56.11.225])
	by smtp.gmail.com with ESMTPSA id
	i11sm5027773itf.10.2017.04.18.08.36.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 18 Apr 2017 08:36:12 -0700 (PDT)
From: Kyle Russell <bkylerussell@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 18 Apr 2017 11:36:05 -0400
Message-Id: <1492529765-27345-1-git-send-email-bkylerussell@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] cmake.bbclass: Set CMAKE_CROSSCOMPILING correctly
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
X-List-Received-Date: Tue, 18 Apr 2017 15:36:12 -0000

If CMAKE_SYSTEM_NAME is defined, CMake assumes we're cross-compiling,
which is not necessarily the case.

Signed-off-by: Kyle Russell <bkylerussell@gmail.com>
---
 meta/classes/cmake.bbclass | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/classes/cmake.bbclass b/meta/classes/cmake.bbclass
index 9e74599..2dbaa8c 100644
--- a/meta/classes/cmake.bbclass
+++ b/meta/classes/cmake.bbclass
@@ -42,9 +42,13 @@ def map_target_arch_to_uname_arch(target_arch):
     return target_arch
 
 cmake_do_generate_toolchain_file() {
+	if [ "${BUILD_SYS}" == "${HOST_SYS}" ]; then
+	    CMAKE_CROSSCOMPILING="set( CMAKE_CROSSCOMPILING FALSE )"
+	fi
 	cat > ${WORKDIR}/toolchain.cmake <<EOF
 # CMake system name must be something like "Linux".
 # This is important for cross-compiling.
+${CMAKE_CROSSCOMPILING}
 set( CMAKE_SYSTEM_NAME `echo ${TARGET_OS} | sed -e 's/^./\u&/' -e 's/^\(Linux\).*/\1/'` )
 set( CMAKE_SYSTEM_PROCESSOR ${@map_target_arch_to_uname_arch(d.getVar('TARGET_ARCH'))} )
 set( CMAKE_C_COMPILER ${OECMAKE_C_COMPILER} )
-- 
2.7.4


