Return-Path: <yannick.gicquel@iot.bzh>
Received: from mail-wm0-f45.google.com (mail-wm0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id DBDCB71D9A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Jan 2017 14:23:44 +0000 (UTC)
Received: by mail-wm0-f45.google.com with SMTP id f73so12378982wmf.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Jan 2017 06:23:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=iot-bzh.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=/2kFR/l0FzJYcDd6Gohd7qE5Jkk8n3zpzDcB+U0HqCc=;
	b=S0aO/caKGy18CcYarY0UPwoDlhqg+nGsSa0rlbQCfNLxnzX3Dr5hIgZYkbGUtszC+m
	+ZI2f8Ljw33SYhKKXCg4tyeB+MMPd+zswrbkxQ5oJm2UEtZT2+LZMCPbbObCIBFTPrEB
	kjqklqM2XCgjEMh4xQR9E+X89YCCgNUpYRaafGAK4aiwLb6TpBoSUW4eVtOmvYi0Tk81
	Nlfox97nQbIV9TLBKLhtTzGkYnjPtuzbEU2iDq+g6NJbPrABk2jT03ik5BBKVm8exYa7
	k+Uerqh7xjAYpOV1LYpiIilQpzk80bmZnzMeTMqm+41zTjEeBZ83YnrGaRLdR16B4kiB
	j+DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=/2kFR/l0FzJYcDd6Gohd7qE5Jkk8n3zpzDcB+U0HqCc=;
	b=cHnxE6D3juPkP+SwdkkmCxGSvInHlFgOsOXpy76Au4IxTEoVKS6AX0MFpQvoksmghy
	wsPr+HXmsbBFy+nmcu6Du0eksEn5Qh5sWM23JQHiBsKVbg1UdHBhD/wrxasZQF4/lw9u
	47+xtyhupg7IR8cIMHaBSvLXZEpq5BtHI5HN7z2mnJothmbcgSzQpwQ5tNOXzJzHEj9U
	ydKZe17UAMKxOx7w5OOhrMCs8rmfjjJGbjldx4SHQpfVM9wfjT3226VBXpVV1BqudcUQ
	tUc8UyznII0uoHAFusfYOg+kByx4zA63uPyfWm387A15eCKBoT8TdOsVe6M3Xh3uoQsf
	eI1Q==
X-Gm-Message-State: AIkVDXKwewD49SDAqSAgrvzeKUvXMIi9Im+Q/VvehPdP8WyQkG5o6/339dXdOeACoVnevA==
X-Received: by 10.223.163.199 with SMTP id m7mr12030012wrb.60.1484317424726;
	Fri, 13 Jan 2017 06:23:44 -0800 (PST)
Received: from pollux.vannes.iot (lns-bzn-38-82-253-123-24.adsl.proxad.net.
	[82.253.123.24])
	by smtp.gmail.com with ESMTPSA id 204sm4638837wmj.7.2017.01.13.06.23.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 13 Jan 2017 06:23:43 -0800 (PST)
From: Yannick Gicquel <yannick.gicquel@iot.bzh>
To: openembedded-core@lists.openembedded.org
Date: Fri, 13 Jan 2017 15:23:18 +0100
Message-Id: <1484317398-25452-2-git-send-email-yannick.gicquel@iot.bzh>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1484317398-25452-1-git-send-email-yannick.gicquel@iot.bzh>
References: <1484317398-25452-1-git-send-email-yannick.gicquel@iot.bzh>
Subject: [PATCH 2/2] cmake.bbclass: enable usage of ccache
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
X-List-Received-Date: Fri, 13 Jan 2017 14:23:45 -0000

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


