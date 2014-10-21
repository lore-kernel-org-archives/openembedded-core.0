Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f177.google.com (mail-wi0-f177.google.com
	[209.85.212.177])
	by mail.openembedded.org (Postfix) with ESMTP id 121A760097
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Oct 2014 14:37:36 +0000 (UTC)
Received: by mail-wi0-f177.google.com with SMTP id fb4so2050652wid.16
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Oct 2014 07:37:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=G9Y9fDoYj5Kok7vnFKw9A28fwwYkYEkA8RsfbpKT9j4=;
	b=MvdhR1CsPKFU55PW2vxjXZaNBKxrsYQBQlPRPYZRZXQSPUsKAssGb+XWvZkVNx6Shb
	lAwHYCBhvnv5+8GimSsGKkUGBU2RrvWZMdxUePQENr4QH+gPrk4zc49PvdmVSzhT7iaw
	R8S5rslE6gcikxAAKllbeQGurRUKsMyrWzKMI6ue3/KqCVdH7FgpQ8GHBr3jlSXz3z0p
	ozCOrSbzNVKi0qM7MHB3xD69sg6EBJGt49kvJesxRTpqxHnEVX/VvOUbKG8lnP3EJsw4
	fVsOZZgGqdlG4JS1biW2Znfpgy41R91b2cXSy2ZtrRUc0HrqFed5udzphIROphcqeQey
	OkEA==
X-Gm-Message-State: ALoCoQnJHoM4vg4/pGkK8pVb0YSTIMHqp+Le8rNNv15UPrvX9uG83aZCshKPtoHI6R7xOAjqi+tm
X-Received: by 10.194.109.226 with SMTP id hv2mr42780393wjb.45.1413902256382; 
	Tue, 21 Oct 2014 07:37:36 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id hc8sm15761714wib.1.2014.10.21.07.37.35
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 21 Oct 2014 07:37:35 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 21 Oct 2014 15:37:31 +0100
Message-Id: <1413902251-19519-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] native.bbclass: use BUILD_* variables
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
X-List-Received-Date: Tue, 21 Oct 2014 14:37:39 -0000

Instead of replicating the logic for the host compiler naming from bitbake.conf,
use the BUILD_* variables directly.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/native.bbclass |   21 +++++++++++----------
 1 file changed, 11 insertions(+), 10 deletions(-)

diff --git a/meta/classes/native.bbclass b/meta/classes/native.bbclass
index dcd364b..4acc936 100644
--- a/meta/classes/native.bbclass
+++ b/meta/classes/native.bbclass
@@ -61,16 +61,17 @@ PTEST_ENABLED = "0"
 export CONFIG_SITE = "${COREBASE}/meta/site/native"
 
 # set the compiler as well. It could have been set to something else
-export CC = "${CCACHE}${HOST_PREFIX}gcc ${HOST_CC_ARCH}"
-export CXX = "${CCACHE}${HOST_PREFIX}g++ ${HOST_CC_ARCH}"
-export FC = "${CCACHE}${HOST_PREFIX}gfortran ${HOST_CC_ARCH}"
-export CPP = "${HOST_PREFIX}gcc ${HOST_CC_ARCH} -E"
-export LD = "${HOST_PREFIX}ld ${HOST_LD_ARCH} "
-export CCLD = "${CC}"
-export AR = "${HOST_PREFIX}ar"
-export AS = "${HOST_PREFIX}as ${HOST_AS_ARCH}"
-export RANLIB = "${HOST_PREFIX}ranlib"
-export STRIP = "${HOST_PREFIX}strip"
+export CC = "${BUILD_CC}"
+export CXX = "${BUILD_CXX}"
+export FC = "${BUILD_FC}"
+export CPP = "${BUILD_CPP}"
+export LD = "${BUILD_LD}"
+export CCLD = "${BUILD_CCLD}"
+export AR = "${BUILD_AR}"
+export AS = "${BUILD_AS}"
+export RANLIB = "${BUILD_RANLIB}"
+export STRIP = "${BUILD_STRIP}"
+export NM = "${BUILD_NM}"
 
 # Path prefixes
 base_prefix = "${STAGING_DIR_NATIVE}"
-- 
1.7.10.4


