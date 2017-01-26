Return-Path: <yannick.gicquel@iot.bzh>
Received: from mail-wm0-f48.google.com (mail-wm0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id 0AC5D7197C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jan 2017 09:58:53 +0000 (UTC)
Received: by mail-wm0-f48.google.com with SMTP id f73so3563730wmf.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jan 2017 01:58:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=iot-bzh.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=/2kFR/l0FzJYcDd6Gohd7qE5Jkk8n3zpzDcB+U0HqCc=;
	b=M8Kc1Tkr2Ko8+FMtnp3Uxb70iJSRRcACeEjcwpfJGyY1UTI5DxeZ04CwOQjUZul8Uo
	JUTgifNCBMyWWAy2YlrKyMcF98Lu/2U25qFrjCYi9wgkIQu721aTDwKpMV2D4i7jTfy7
	VCCnKT2lDhzyM8gPB0NnDQ/PusFTeXWrq2H6BlmLzxn2Kd9VRstXnnUEHXuc4gkmgPip
	NtNBQ5atjMaeVXhIMnOste16tIA49+esNAEG4LZ5hcK7gLdb7flOxwAx5Dr12TgyexHy
	B2B1AyLxqQQaKvujxDdlFwwG1hBWDr72eVYOo3wrM02cziNMmSlgB7CRum/sxE3jvCOs
	rzqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=/2kFR/l0FzJYcDd6Gohd7qE5Jkk8n3zpzDcB+U0HqCc=;
	b=c7DHERqIr3VQySEyoQKudtg3P9PDhyKqZtWbcfFfThmP6f5RisCFwH+Q0ne9se+oC8
	rqd3H07qkELiK5vAOLkHx/DrCVhu0W6bm5DQw5/pDbPp2iLxA56ZLpS7iRF3XR8WO66R
	71nMyCESzGye9wMjxVWn65bWuSdkeF6aod9xcYhcZ+2TuZM9JQiIAcv9ey1RkwRcQqH3
	zph6dNlXDD1FkpYNvD/eLEe4S+yk2q3fwleFdzhSbk9c9JmLnGxi+27jr1JH4qeyTB8X
	2e6yVmqRn11a7pth11i/XWQbp41/7Q+dhUS8uWCdsSAhqZ5h7aGL3Lr6G/ViIIptWjfe
	HHFg==
X-Gm-Message-State: AIkVDXL8R5fMNC7BQL637c1HUcJq4O0RNk2HWRauJq/pzh4UFDsytyUT2sSmWXrdSOSeZQ==
X-Received: by 10.28.236.149 with SMTP id h21mr1785871wmi.65.1485424732747;
	Thu, 26 Jan 2017 01:58:52 -0800 (PST)
Received: from eiger.ygl.iot (lns-bzn-38-82-253-123-24.adsl.proxad.net.
	[82.253.123.24]) by smtp.gmail.com with ESMTPSA id
	i73sm23912636wmd.11.2017.01.26.01.58.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 26 Jan 2017 01:58:51 -0800 (PST)
From: Yannick Gicquel <yannick.gicquel@iot.bzh>
To: openembedded-core@lists.openembedded.org
Date: Thu, 26 Jan 2017 10:57:43 +0100
Message-Id: <1485424663-18235-1-git-send-email-yannick.gicquel@iot.bzh>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] cmake.bbclass: enable usage of ccache
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
X-List-Received-Date: Thu, 26 Jan 2017 09:58:55 -0000

This allows ccache usage for recipes which inherit cmake.bbclass.
Since cmake v3.4, it can be enabled using some "-D" options.

Here below are some metrics while using it for webkitgtk recipe.
(machine is a 4x core i7 @ 3.4GHz)

$ bitbake -c fetchall webkitgtk
$ time bitbake webkitgtk
<snip>
real	56m25.191s
user	359m32.003s
sys	34m49.356s

$ bitbake -c clean webkitgtk
$ bitbake -c cleansstate webkitgtk
$ time bitbake webkitgtk
<snip>
real	25m19.298s
user	17m57.861s
sys	6m20.157s

Signed-off-by: Yannick Gicquel <yannick.gicquel@iot.bzh>
---
 meta/classes/cmake.bbclass | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/meta/classes/cmake.bbclass b/meta/classes/cmake.bbclass
index 9e74599..737a4e0 100644
--- a/meta/classes/cmake.bbclass
+++ b/meta/classes/cmake.bbclass
@@ -4,12 +4,9 @@ OECMAKE_SOURCEPATH ?= "${S}"
 DEPENDS_prepend = "cmake-native "
 B = "${WORKDIR}/build"
 
-# We need to unset CCACHE otherwise cmake gets too confused
-CCACHE = ""
-
 # C/C++ Compiler (without cpu arch/tune arguments)
-OECMAKE_C_COMPILER ?= "`echo ${CC} | sed 's/^\([^ ]*\).*/\1/'`"
-OECMAKE_CXX_COMPILER ?= "`echo ${CXX} | sed 's/^\([^ ]*\).*/\1/'`"
+OECMAKE_C_COMPILER ?= "${@'${CC}'.replace('${CCACHE}','',1).split(' ')[0]}"
+OECMAKE_CXX_COMPILER ?= "${@'${CXX}'.replace('${CCACHE}','',1).split(' ')[0]}"
 OECMAKE_AR ?= "${AR}"
 
 # Compiler flags
@@ -108,9 +105,16 @@ cmake_do_configure() {
 		OECMAKE_SITEFILE=""
 	fi
 
+	if [ -n "${CCACHE}" ]; then
+		OECMAKE_CCACHE="-DCMAKE_C_COMPILER_LAUNCHER=${CCACHE} -DCMAKE_CXX_COMPILER_LAUNCHER=${CCACHE}"
+	else
+		OECMAKE_CCACHE=""
+	fi
+
 	cmake \
 	  ${OECMAKE_SITEFILE} \
 	  ${OECMAKE_SOURCEPATH} \
+	  ${OECMAKE_CCACHE} \
 	  -DCMAKE_INSTALL_PREFIX:PATH=${prefix} \
 	  -DCMAKE_INSTALL_BINDIR:PATH=${@os.path.relpath(d.getVar('bindir'), d.getVar('prefix'))} \
 	  -DCMAKE_INSTALL_SBINDIR:PATH=${@os.path.relpath(d.getVar('sbindir'), d.getVar('prefix'))} \
-- 
1.9.1


