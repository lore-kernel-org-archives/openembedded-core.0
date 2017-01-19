Return-Path: <yannick.gicquel@iot.bzh>
Received: from mail-wm0-f44.google.com (mail-wm0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id D617C719BA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jan 2017 15:02:23 +0000 (UTC)
Received: by mail-wm0-f44.google.com with SMTP id r144so81378249wme.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jan 2017 07:02:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=iot-bzh.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=/2kFR/l0FzJYcDd6Gohd7qE5Jkk8n3zpzDcB+U0HqCc=;
	b=N00uyhhTBjmPFBnILEG/qkk2lOotcMOB4gUNl4f9SGonlUIdkQfyax23zmIBhTUa0J
	moFP93IvnM0ZV23b770zU5bQt5Z5xbkbOR17Iu2UylYZOmX7/Bl43sBrbD2aNkqFOCHF
	cZjFuOfaH/ZhB9eTRrAjJbzcBWW7dRUN4tSOxwUYpnM7lYLst+aLdNtgVS5Q43PQXSVZ
	FtQ4+Fx/F8t+dT/xf3B+V22M2FW3bOfS82QWuIC4xdTM86DX0vu4l/X6oZ9qR878EQex
	0gNVYsuin/up+yXfYfEIP3Ej2HgB7r+nlogGJtygdRXcJc/PBBXLqJv9Nu2eHN/XOINr
	8Ixg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=/2kFR/l0FzJYcDd6Gohd7qE5Jkk8n3zpzDcB+U0HqCc=;
	b=YDhL5BLnoXwLaThUIPQryjRnJmoV6V6aP7Fi/WZI5hemYTfnE5XUAtHK99/lJWXF5z
	WGp0+qJcKO2Q2VmACKT+i0WQvgqlk7zcxdrTO6T2H/P4+xnzv2RTI9Lkb2Zi3A3QrUaI
	vdhypu3pOEo4s2JcDk2UZlg0F0nL+41eyNYg1mk2Ag/10ccJao3hTr/SL9AcGJEevNMa
	ASdje9VuTFBMVPQsyQShm139eMtngX/CPK+Ap+yJQnhhii5SRDnaBaZuAEuwWSdQr2av
	tPYdFK5vJyVA+J2p0E12m6rUBT5wEHNm3gqNQz1/h+WZcPzkdm86br/VbrQwuY7GMMmT
	cDnQ==
X-Gm-Message-State: AIkVDXLC/jl5d4TWVbZlT7V9yzLGiqAN82lk+05We8YzBfi/8Nq8ibwGlH3ZCusF+LlD6A==
X-Received: by 10.28.189.134 with SMTP id n128mr23810853wmf.77.1484838143641; 
	Thu, 19 Jan 2017 07:02:23 -0800 (PST)
Received: from pollux.vannes.iot (lns-bzn-38-82-253-123-24.adsl.proxad.net.
	[82.253.123.24]) by smtp.gmail.com with ESMTPSA id
	o132sm13329243wmo.17.2017.01.19.07.02.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 19 Jan 2017 07:02:22 -0800 (PST)
From: Yannick Gicquel <yannick.gicquel@iot.bzh>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Jan 2017 16:01:31 +0100
Message-Id: <1484838091-13265-3-git-send-email-yannick.gicquel@iot.bzh>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1484838091-13265-1-git-send-email-yannick.gicquel@iot.bzh>
References: <1484838091-13265-1-git-send-email-yannick.gicquel@iot.bzh>
Subject: [PATCH v2 3/3] cmake.bbclass: enable usage of ccache
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
X-List-Received-Date: Thu, 19 Jan 2017 15:02:24 -0000

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


