Return-Path: <prvs=122d025a4=Michael.Ho@bmw.de>
X-Greylist: delayed 427 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 14 Aug 2019 15:12:29 UTC
Received: from esa1.bmw.c3s2.iphmx.com (esa1.bmw.c3s2.iphmx.com
	[68.232.133.201])
	by mail.openembedded.org (Postfix) with ESMTP id BB8407EC64
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Aug 2019 15:12:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
	t=1565795552; x=1597331552;
	h=from:to:cc:subject:date:message-id:in-reply-to:
	references:mime-version;
	bh=9i77A1njWImQ+TY4wEcYQl+NBGaz2EvE5s45Pu5cI18=;
	b=E+B+8x5DMR2TYFI3niYhRPaHihLJ2IAfhiYclb6k4WWQc65k8P2Qky2J
	8kvS1A1vgvboBYl6Qo7xc5yIZ4za7zekYRwFjbbwkxnKBTUahCWdpi0kt
	48wl/GPipEfpU74Q6iP1+jo+De4K04WxKDR9TkBEcSjZhqlrUbSvIcDQw Y=;
IronPort-SDR: 67N9xtn9LGrgI8LB/72JDphMjOBexn/JCxBXBQehxUkscNBicOwbddQu2tTo//nrSlqBKNGtdj
	8ttybQoCZS7kBPdgJh+LT+wTHZAxWiQy2m9BPGV2JuunahoDJhGVzid+ObOKPksZRfsHLUH8kl
	9T6mFrdA7g8lHVUEK2xbTf46auqmyJQcF86DcLPWua6U8ul+ZxA8IY9wE64oosU+93Alvq2yUn
	rYU1SwoNReVcrX0PJkFCclG/mNWVN955zh/DY1VfYC6obxJtGxgBpewpviV6olk5OMcnX+sUCM
	mcw=
Received: from esagw5.bmwgroup.com (HELO esagw5.muc) ([160.46.252.46]) by
	esa1.bmw.c3s2.iphmx.com with ESMTP/TLS; 14 Aug 2019 17:05:24 +0200
Received: from esabb1.muc ([160.50.100.31])  by esagw5.muc with ESMTP/TLS;
	14 Aug 2019 17:05:22 +0200
Received: from smucm09k.bmwgroup.net (HELO smucm09k.europe.bmw.corp)
	([160.48.96.43])
	by esabb1.muc with ESMTP/TLS; 14 Aug 2019 17:05:22 +0200
Received: from michael-pc.bmw-carit.intra (192.168.221.45) by
	smucm09k.europe.bmw.corp
	(160.48.96.43) with Microsoft SMTP Server (TLS;
	Wed, 14 Aug 2019 17:05:22 +0200
From: Michael Ho <Michael.Ho@bmw.de>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 14 Aug 2019 17:05:15 +0200
Message-ID: <1565795115-1581-2-git-send-email-Michael.Ho@bmw.de>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1565795115-1581-1-git-send-email-Michael.Ho@bmw.de>
References: <1565795115-1581-1-git-send-email-Michael.Ho@bmw.de>
MIME-Version: 1.0
X-Originating-IP: [192.168.221.45]
X-ClientProxiedBy: smucm19k.europe.bmw.corp (160.48.96.83) To
	smucm09k.europe.bmw.corp (160.48.96.43)
Cc: Michael Ho <Michael.Ho@bmw.de>
Subject: [PATCH] cmake.bbclass: add HOSTTOOLS_DIR to CMAKE_FIND_ROOT_PATH
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
X-List-Received-Date: Wed, 14 Aug 2019 15:12:30 -0000
Content-Type: text/plain

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
---
 meta/classes/cmake.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes/cmake.bbclass b/meta/classes/cmake.bbclass
index d3f0d70..f41eb8d 100644
--- a/meta/classes/cmake.bbclass
+++ b/meta/classes/cmake.bbclass
@@ -99,11 +99,12 @@ set( CMAKE_CXX_LINK_FLAGS "${OECMAKE_CXX_LINK_FLAGS}" CACHE STRING "LDFLAGS" )
 
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


