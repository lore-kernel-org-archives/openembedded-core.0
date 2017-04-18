Return-Path: <bkylerussell@gmail.com>
Received: from mail-io0-f195.google.com (mail-io0-f195.google.com
	[209.85.223.195])
	by mail.openembedded.org (Postfix) with ESMTP id CC8F871C54
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Apr 2017 15:02:14 +0000 (UTC)
Received: by mail-io0-f195.google.com with SMTP id x86so33669100ioe.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Apr 2017 08:02:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=5TiMt3Z1vnQcic0g+x4W5vCpdJ1mgibAOModcJQ00xk=;
	b=qjcpBuHvHuPG756M4vSHZxWPfb0b73CCgCMpGUKRlHa9tYGlqP2ZIhChRyzUU3OuX5
	Gb1xCPRiNDM74GDE6v9Y9pW0A9AbUgy07601/KBV+vwTx6t7lJkl/cNe03QeWKd+018/
	/djFDU6TuIGaN1wtkhXEFyYnIGqkMhMVwq+MMS4Rg5XFeQPwG6B7aunbfWuJXieMDtTO
	HASMXNNMRoCJhkQp/hwT/TGWbN/Ykv2x2sxYUIBjK+gxTOW1yC85pFTt4uhNxZ9+/zOR
	y+Ua71macPIXxNdHlMgwjV0OBukYBHunYYqgzHtLrSFKvyfyGe1kTCwaHp4zS5gh00NU
	gHDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=5TiMt3Z1vnQcic0g+x4W5vCpdJ1mgibAOModcJQ00xk=;
	b=iuhYv5Wch5Tbf7LwC23ca1upwBm0iqgGxljtzxO/czL+0VDZz6qL9UMgv0ZLkpv5Dw
	fA7FODMzTMP+5JhAj3D1tqQBj/EA0dcjPxFhEpHB07zMlYo26Y7LRF07ZsKb69ZICD0f
	0QrpvkYIuHRSLAltjVDG1ZZQxdeC1kkjSLQqzvonau78vqD4ZbVz/4AvukzamlS6doSY
	eVpl8uie3VaAO8u5yqkFSZ6fmKqVjrSMl0hPVqg2AflhLAaM3A5CwFZorB0GdTicYMzk
	X82htKypq8rVFPlhQcewcy8wQhmE8WhlcBIa0FrFgn+OcyZO5h1HhX83/q5fdT0J8lc5
	GW9A==
X-Gm-Message-State: AN3rC/65NzQwHkL5T1HT1hNKXdo36VPV/Lxi+jQu0pc+6xaHgMP7SGMD
	h4xmHAnSHiGaUuTRErQ=
X-Received: by 10.107.148.3 with SMTP id w3mr7181986iod.60.1492527736347;
	Tue, 18 Apr 2017 08:02:16 -0700 (PDT)
Received: from localhost.localdomain ([172.56.10.124])
	by smtp.gmail.com with ESMTPSA id
	q200sm6537988iod.21.2017.04.18.08.02.15
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 18 Apr 2017 08:02:15 -0700 (PDT)
From: Kyle Russell <bkylerussell@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 18 Apr 2017 11:02:04 -0400
Message-Id: <1492527724-26361-1-git-send-email-bkylerussell@gmail.com>
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
X-List-Received-Date: Tue, 18 Apr 2017 15:02:17 -0000

If CMAKE_SYSTEM_NAME is defined, CMake assumes we're cross-compiling,
which is not necessarily the case.
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


