Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
	[209.85.210.194])
	by mail.openembedded.org (Postfix) with ESMTP id 86FF96B513
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Feb 2019 19:59:26 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id c123so433287pfb.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Feb 2019 11:59:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=oMxavh7HZmysUDECKJySGmNfiUdPZCMrTdT+a1+3ycs=;
	b=hitta0i/2IcQJNf5K+86bLh+jabZBdRlf9s9w0DVcF9agNC/K4O4LQRhY6eXEhQ8dl
	camQLghab1ifMSErEdOYKsvL6sxMOQpSh+TmtqzhFGG2lPIvkxgIeCSm+Yx1o8L4D+k8
	jkSK9SVJmpq1ME1fh33YvslRI4hNpEMud9E9E8QJ17y2IEiLO9k4aUKOS3r0Y0/LGfoX
	fdV3dWcBRbPdOl+4sM+S6DgqZhuppXeFu88pNxHN4g57+3iZGb9yTQpIt0c3zaGpJk9o
	CM3oJgCjVeZoh5gWnGsZC//1jLkEi08JYnWeiCy+72IgG95d3G/ec4HDroP76+/rdT+V
	tzrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=oMxavh7HZmysUDECKJySGmNfiUdPZCMrTdT+a1+3ycs=;
	b=TwWgU6VzpQvGFFUYMP58tiDc87Abz5rT/VsqEb6R7GlHji6Xdj/OUjZIYBRNxaN11t
	uNA4sAKsSY93vsgDQIludoqu5MxTZJ1pKp4EJh1A0ibYTZynfBCtb1I44SwEWwk4xctD
	3XRN18rQvjZx1gVprwLwTNQV9iqKHUoNYetQr3Z5irLmzFaJvN71RFyc+/cbVEZ8D0oa
	ySFc4U3iOqZcjRVPWKuvFXYuGbdN/EeV6SgEL1E+OVMXkeeFwrhpJyUhXWuufU1BKeji
	fTafZ3BkVSg+XKNjpqjok21WQw3DHyHp3+QLdFqqte3BwMl3YBOkPRLyaqizXRcMvk6t
	i5Fg==
X-Gm-Message-State: AHQUAubSwnOuVF5zhN91s+RivtNxIDpghv5DGOW/el9iycBE2CnNELmE
	HIhl0TmFvYrq2SEG43DgIRp9LxHz
X-Google-Smtp-Source: AHgI3IbLrbYe5RA7j3P6+vNTV5c2Rgfiv1e7zkElASsZ92Ye/X5Yms/1HXyqZsYSL1fl8hsoKy5EOQ==
X-Received: by 2002:a65:65c9:: with SMTP id y9mr1020300pgv.438.1549310367067; 
	Mon, 04 Feb 2019 11:59:27 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:6bc6::1609])
	by smtp.gmail.com with ESMTPSA id
	w128sm1307486pfw.79.2019.02.04.11.59.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 04 Feb 2019 11:59:26 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  4 Feb 2019 11:59:17 -0800
Message-Id: <20190204195918.8726-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH 1/2] glibc: Fix pthread_rwlock_try*lock stalls
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
X-List-Received-Date: Mon, 04 Feb 2019 19:59:26 -0000
Content-Transfer-Encoding: 8bit

Brings in a backport as described in
https://sourceware.org/git/?p=glibc.git;a=commit;h=86013ef5cea322b8f4b9c22f230c22cce369e947

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/glibc/cross-localedef-native_2.29.bb | 2 +-
 meta/recipes-core/glibc/glibc_2.29.bb                  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/glibc/cross-localedef-native_2.29.bb b/meta/recipes-core/glibc/cross-localedef-native_2.29.bb
index edb4fd40dc..8bc7cd649b 100644
--- a/meta/recipes-core/glibc/cross-localedef-native_2.29.bb
+++ b/meta/recipes-core/glibc/cross-localedef-native_2.29.bb
@@ -23,7 +23,7 @@ UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+\.\d+(\.(?!90)\d+)*)"
 
 PV = "2.29"
 
-SRCREV_glibc ?= "56c86f5dd516284558e106d04b92875d5b623b7a"
+SRCREV_glibc ?= "86013ef5cea322b8f4b9c22f230c22cce369e947"
 SRCREV_localedef ?= "cd9f958c4c94a638fa7b2b4e21627364f1a1a655"
 
 SRC_URI = "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
diff --git a/meta/recipes-core/glibc/glibc_2.29.bb b/meta/recipes-core/glibc/glibc_2.29.bb
index 362c172833..72db00cdb7 100644
--- a/meta/recipes-core/glibc/glibc_2.29.bb
+++ b/meta/recipes-core/glibc/glibc_2.29.bb
@@ -9,7 +9,7 @@ DEPENDS += "gperf-native bison-native make-native"
 
 PV = "2.29"
 
-SRCREV ?= "56c86f5dd516284558e106d04b92875d5b623b7a"
+SRCREV ?= "86013ef5cea322b8f4b9c22f230c22cce369e947"
 
 SRCBRANCH ?= "release/${PV}/master"
 
-- 
2.20.1


