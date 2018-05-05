Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id 8262B74DC4
	for <openembedded-core@lists.openembedded.org>;
	Sat,  5 May 2018 00:14:48 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id q22so18606943pff.11
	for <openembedded-core@lists.openembedded.org>;
	Fri, 04 May 2018 17:14:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=oMbmqL98t8dcMNAS+W8mp86YEcqU7ruq4As7AUW/TKM=;
	b=Y5Nqv/RMneceg1muSIr3QiaSpbTYXN/ANYEaMcNqZBoJN4kTvR4shH2UQREe9ME1uB
	eA021rL1sFlypHizPIZqpoetlZSNwuzKCTdD+EMP0t0f7WADgbcC8lLq5gA1zxDNBKpd
	f6j/j50cb6PPrD7DInHLtKL1lYtIPdRwopdWdmdaEBqagnmrGr853W+Jw8LAklTvcoTO
	dX6TdlYs5GIc2pAterBaUmfZPgw6pkzPLtZatgD92dV6JIK4cClVc0f0ZXSegAHD/K1u
	usp7yK3I99Cib0H0uaKuGknaECSdxWDW8QkOAA5hxhq9DgsCy4utoHayllviej3EXEbS
	dAUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=oMbmqL98t8dcMNAS+W8mp86YEcqU7ruq4As7AUW/TKM=;
	b=fcpg0ax8b4r92VgsgOELSMPUtOYdXJp5Tsw8tF0nNQ1BDGAZrg3U69qGZSVJF6PLYG
	6cCmn0zhEG761Ug2Dnfw7YklQdz4848BGyE0hWKkXAM274KXwAPulU6jM3LpUUnTRbTO
	TOQ7FUBaYwBoKFUbBgC+nM4BYrLNLcP9WPlrjMQarUdzUQJ08taZSankT0LHevAU7LvJ
	3AlESMYZGo7rx84rltTVQ1huz7wQsD8VL9CPcLOjX5SqH9PtputwXKWlf8UgJcrzNTBb
	5lH8JjMv7VlBFbk47v0+0CpKq6FC2eMGsWpEZUF1gxWtBUL7GqwWe+hc4ulbE/qt2pIB
	EvhA==
X-Gm-Message-State: ALQs6tB5wyoV9TEhIMqACrK0Ew3GirhmLrV0QiuuRF79usXzb70Xodpu
	oGwceC63Kih39dV7mZBW3ESPrg==
X-Google-Smtp-Source: AB8JxZqTbTSGZswzWTlqMkRg9lYv59VaDDQWaFjMFSULv31WQstpypx8jkQ4Bcq2fjxXCpZpr2y5VA==
X-Received: by 2002:a63:6d41:: with SMTP id
	i62-v6mr23818829pgc.233.1525479289457; 
	Fri, 04 May 2018 17:14:49 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::c68])
	by smtp.gmail.com with ESMTPSA id
	o88sm36468559pfa.29.2018.05.04.17.14.48
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 04 May 2018 17:14:48 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  4 May 2018 17:14:17 -0700
Message-Id: <ba1dca24dda5c1318c54e06cd0c6de28d3a8a69e.1525478935.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <cover.1525478935.git.raj.khem@gmail.com>
References: <cover.1525478935.git.raj.khem@gmail.com>
Subject: [PATCH 23/27] packagegroup: Do not add libssp to SDK
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
X-List-Received-Date: Sat, 05 May 2018 00:14:48 -0000

Libssp is only needed on mon-glibc/non-musl systems
Add rpcsvc-proto for rpcgen since its not part of glibc
anymore

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../packagegroup-core-standalone-sdk-target.bb        |  2 +-
 .../packagegroups/packagegroup-self-hosted.bb         | 11 +++++++----
 2 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-core/packagegroups/packagegroup-core-standalone-sdk-target.bb b/meta/recipes-core/packagegroups/packagegroup-core-standalone-sdk-target.bb
index 43fc599c73..f5b2d69cef 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-standalone-sdk-target.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-standalone-sdk-target.bb
@@ -13,7 +13,7 @@ RDEPENDS_${PN} = "\
     ${LIBC_DEPENDENCIES} \
     "
 
-RRECOMMENDS_${PN} = "\
+RRECOMMENDS_${PN}_mingw32 = "\
     libssp \
     libssp-dev \
     "
diff --git a/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb b/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
index adb0c56c3a..f1273e8a17 100644
--- a/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
@@ -76,9 +76,6 @@ RDEPENDS_packagegroup-self-hosted-sdk = "\
     intltool \
     ldd \
     less \
-    libssp \
-    libssp-dev \
-    libssp-staticdev \
     libstdc++ \
     libstdc++-dev \
     libtool \
@@ -90,10 +87,16 @@ RDEPENDS_packagegroup-self-hosted-sdk = "\
     quilt \
     sed \
     "
-# glibc-utils: for rpcgen
+RDEPENDS_packagegroup-self-hosted-sdk_append_mingw32 = "\
+    libssp \
+    libssp-dev \
+    libssp-staticdev \
+    "
+# rpcsvc-proto: for rpcgen
 RDEPENDS_packagegroup-self-hosted-sdk_append_libc-glibc = "\
     glibc-gconv-ibm850 \
     glibc-utils \
+    rpcsvc-proto \
     "
 RDEPENDS_packagegroup-self-hosted-debug = " \
     gdb \
-- 
2.17.0


