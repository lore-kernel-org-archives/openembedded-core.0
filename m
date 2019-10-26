Return-Path: <akuster808@gmail.com>
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
	[209.85.128.46])
	by mail.openembedded.org (Postfix) with ESMTP id C4A2B7FC18
	for <openembedded-core@lists.openembedded.org>;
	Sat, 26 Oct 2019 06:50:18 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id q130so4147766wme.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Oct 2019 23:50:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=FftV8yu9YPMh/7YLUiyBehdsSZNE5Ip+U2FIIzQGFZQ=;
	b=q68paloW1lSGC3G2u+1F0Sx1CtomXzlnOhy/XRo7PUOuANgD2Ic1P1zX8dTaN+vXlK
	ip1u01UyIpnHInT4B0Q59fm1QLDhMaQpMnl/cylXG4QDFQj2qouYPaEDrC7xtsq3M5zJ
	sqMhXMg1beAs2a3f/coAP9/Vb7KJBjfPrc278B7UnTAilN9n1G9i+U5ZWuK8i2oHv+2S
	gXW8KBGfDESJwsbwvawZWfq/lnq1DPugZDjaeVN7W5SPEO1nBzr06y7jbXktB3cQwD+w
	hT9FSj9KBDbH4yNCmq3JNJSYnS5wiGONfgRO7HddinCgURX82hDPwz8zTEAj1hdzLLt/
	dPVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=FftV8yu9YPMh/7YLUiyBehdsSZNE5Ip+U2FIIzQGFZQ=;
	b=UUeMAaDDOSRUfXQWrgJyl3DbHCaQ1DwVNhm2vxP6a4FYNRcwf4qk2xUcJ8nbRZCD8s
	jFtleIPTeACjw/80fqBAhyyhaUp4iZlNjTb46irJ99C7SzGjeHN8/r3jSoLnU907gxpJ
	tRIoj/e2Pyd1EtJg0zlacooaayaVw1JHfF6XDO12mNxOC5ZyrsVHrHBnBNY87HGQ6uFh
	FGUSouOLHaOMZzWYoLkM36aDfTuy6Tbsw4/ULdnZE11a+6DEExeNmgnuclSxPMmeVoTD
	MX4V0lHPgHLkKeGh19FtQ/u/abTuhf6wggq17QGcV1G6iEfXz+ydxsMw1oN4xRlEq37+
	RHww==
X-Gm-Message-State: APjAAAVdi1s44nkwIib+4QElJ7zCPejZ2q5eYKAQSv2WlHF4buJ6caxg
	+9j1xGVRQ2n+t4H+fI9wQy7vJtqStxM=
X-Google-Smtp-Source: APXvYqyonJNzNtNY7hTBZzjqJGcBn7lpzYtdVqtyXJAHYzfoowY5Uv9JcmsG359F+SmnTtRPYW7GKQ==
X-Received: by 2002:a7b:c313:: with SMTP id k19mr7038051wmj.6.1572072619217;
	Fri, 25 Oct 2019 23:50:19 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.controleur.wifipass.org ([178.18.58.186])
	by smtp.gmail.com with ESMTPSA id v6sm4807911wru.72.2019.10.25.23.50.18
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 25 Oct 2019 23:50:18 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 25 Oct 2019 23:49:50 -0700
Message-Id: <beec8a52a8738b0a88cc81dc7898fa38b5088b68.1572072422.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1572072421.git.akuster808@gmail.com>
References: <cover.1572072421.git.akuster808@gmail.com>
Subject: [zeus 18/28] cmake.bbclass: add HOSTTOOLS_DIR to CMAKE_FIND_ROOT_PATH
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
X-List-Received-Date: Sat, 26 Oct 2019 06:50:19 -0000

From: Michael Ho <Michael.Ho@bmw.de>

The find_program command will fail if it is used on a tool that is listed in
ASSUME_PROVIDED. This is because these tools are in the hosttools directory
which is not listed in CMAKE_FIND_ROOT_PATH so cmake will not find them.

Adding the directory HOSTTOOLS_DIR to the CMAKE_FIND_ROOT_PATH variable fixes
the initial issue of needing to search for tools in ASSUME_PROVIDED.

Note that this change alone does not fix the issue because find_program will
by default only look into the subdirectories bin and usr/bin under the paths
in CMAKE_FIND_ROOT_PATH to find the programs and the hosttools directory has
instead the symlinks directly present without these subdirectories.

Set CMAKE_PROGRAM_PATH to by default include the root directory so
find_program can search the hosttools directory without needing the prefix
directories.

Signed-off-by: Ross Burton <ross.burton@intel.com>
(cherry picked from commit 7847f431cd8db59fce8c9401a603c4b0678ee16d)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/classes/cmake.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes/cmake.bbclass b/meta/classes/cmake.bbclass
index 2b317c8..291f1e8 100644
--- a/meta/classes/cmake.bbclass
+++ b/meta/classes/cmake.bbclass
@@ -106,11 +106,12 @@ set( CMAKE_CXX_LINK_FLAGS "${OECMAKE_CXX_LINK_FLAGS}" CACHE STRING "LDFLAGS" )
 
 # only search in the paths provided so cmake doesnt pick
 # up libraries and tools from the native build machine
-set( CMAKE_FIND_ROOT_PATH ${STAGING_DIR_HOST} ${STAGING_DIR_NATIVE} ${CROSS_DIR} ${OECMAKE_PERLNATIVE_DIR} ${OECMAKE_EXTRA_ROOT_PATH} ${EXTERNAL_TOOLCHAIN})
+set( CMAKE_FIND_ROOT_PATH ${STAGING_DIR_HOST} ${STAGING_DIR_NATIVE} ${CROSS_DIR} ${OECMAKE_PERLNATIVE_DIR} ${OECMAKE_EXTRA_ROOT_PATH} ${EXTERNAL_TOOLCHAIN} ${HOSTTOOLS_DIR})
 set( CMAKE_FIND_ROOT_PATH_MODE_PACKAGE ONLY )
 set( CMAKE_FIND_ROOT_PATH_MODE_PROGRAM ${OECMAKE_FIND_ROOT_PATH_MODE_PROGRAM} )
 set( CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY )
 set( CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY )
+set( CMAKE_PROGRAM_PATH "/" )
 
 # Use qt.conf settings
 set( ENV{QT_CONF_PATH} ${WORKDIR}/qt.conf )
-- 
2.7.4


