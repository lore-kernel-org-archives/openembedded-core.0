Return-Path: <koen.kooi@linaro.org>
Received: from mail-wg0-f47.google.com (mail-wg0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id 2634D75C81
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jun 2015 13:19:08 +0000 (UTC)
Received: by wgqq4 with SMTP id q4so9546987wgq.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jun 2015 06:19:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=OuorJXzhTg0gsGRMcJG7Q+DCiS5cKLp0eYdiMRvmHV4=;
	b=U5vM+lF5/tSoh6beULAYguOh4J3MxLw5Q8LoCAUzueGI1yiNsXMR7cRPXm7SclHWBk
	WGqtuq7mWajt/6MnkRJEkabqzhMm1Ko9J6AW4KuIOM/ifselM/mPU+vzc79zBABAJtmp
	FWLMEUqLZKd5SKOJ4us5Hiw7xAhJTYFm0ORyySXRFov0JTib+dyaYArlk9/pHMqbPHtU
	64lXpLbIZKy7A7QXlEAbTyQcrKrzKB+jnwHmE4pBlTu/dgSbKWodVJYJNek2l8NI3Rhu
	Puxyci/1RLpZm/n3QB9uoGbxjxYYwfptSleuitqKirheS2b918k+H35DgNCnEc8Zb0YD
	PcCg==
X-Gm-Message-State: ALoCoQne9gXw17EgfpUzKQ5lDZ3JN8C1KzwOAFmeBa7W97uY3Xj1hzsOVRXQndVysRE32VvNPblx
X-Received: by 10.194.234.65 with SMTP id uc1mr30440269wjc.112.1435670349228; 
	Tue, 30 Jun 2015 06:19:09 -0700 (PDT)
Received: from localhost ([2001:610:612:0:2ad2:44ff:fe4b:bc17])
	by mx.google.com with ESMTPSA id k2sm16971469wif.4.2015.06.30.06.19.08
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 30 Jun 2015 06:19:08 -0700 (PDT)
From: Koen Kooi <koen.kooi@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 30 Jun 2015 15:18:56 +0200
Message-Id: <1435670336-17154-1-git-send-email-koen.kooi@linaro.org>
X-Mailer: git-send-email 1.9.3
Cc: Koen Kooi <koen.kooi@linaro.org>
Subject: [PATCH] cmake bbclass: fix support for native builds
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
X-List-Received-Date: Tue, 30 Jun 2015 13:19:13 -0000

For native builds  of recipes (e.g. mariadb-native) cmake *must* look outside of its sysroot to find the compiler, so instruct it to do so.

Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
---
 meta/classes/cmake.bbclass | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/classes/cmake.bbclass b/meta/classes/cmake.bbclass
index b0a3972..29a78e5 100644
--- a/meta/classes/cmake.bbclass
+++ b/meta/classes/cmake.bbclass
@@ -27,6 +27,9 @@ OECMAKE_RPATH ?= ""
 OECMAKE_PERLNATIVE_DIR ??= ""
 OECMAKE_EXTRA_ROOT_PATH ?= ""
 
+OECMAKE_PATHS ?= ""
+OECMAKE_PATHS_class-native = "set( CMAKE_FIND_ROOT_PATH_MODE_PROGRAM BOTH )"
+
 cmake_do_generate_toolchain_file() {
 	cat > ${WORKDIR}/toolchain.cmake <<EOF
 # CMake system name must be something like "Linux".
@@ -67,6 +70,8 @@ list(APPEND CMAKE_MODULE_PATH "${STAGING_DATADIR}/cmake/Modules/")
 # add for non /usr/lib libdir, e.g. /usr/lib64
 set( CMAKE_LIBRARY_PATH ${libdir} ${base_libdir})
 
+${OECMAKE_PATHS}
+
 EOF
 }
 
-- 
1.9.3


