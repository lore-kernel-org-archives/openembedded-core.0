Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
	[209.85.215.194])
	by mail.openembedded.org (Postfix) with ESMTP id 19B2C7F817
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Dec 2019 18:44:31 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id z124so16979543pgb.13
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Dec 2019 10:44:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=njWVssZMXtOLGq41MCze2G9CKHHQ7gCsmR4/PCAo0VM=;
	b=l26j+06rHiooYSgAhjauRWaaN8Bv0ayXjR9kBr8OBwvDaijLtOL4fy/lkA2Jwh5VJ2
	HZhBJTsnGmSh6LHpuwWTbCPkOgtPdYF5lOelJra/QfS9NFaA6opQ9WS7eSR1GzwJftRv
	ZTGk3yrwWLd7Qe8aEKLknkMdr876yQGqkNJuAnhp7cJBVdgRnEYnqkmmxAy9WFt31bDZ
	dWqYz9cpGgUwoJtrzVq/KMVLso1CUNIZg7yRImZopDO+dFSHLlpoEytYcK/Qpg9olVFE
	MY3ObTO4rk4FGyT14ETOM5L9Nnfu42oglqV/Gb3I2+X/JhmplzZvvQFwQA8MXxk9WIV8
	QzZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=njWVssZMXtOLGq41MCze2G9CKHHQ7gCsmR4/PCAo0VM=;
	b=kfGkOk4AMh8tU1KIetce43IzFp7C+fGOJfMx99mUXcM5o/wmuTBjMb9cBuwNpmWyjZ
	lWzoMP2Wh55tPM3v6TROs1oCRwtv3kztxSZlwW78GIZtPFIqmrqVGS7/WItGUu6+M271
	FDT7HDbp86sWU5gIiRcduDhV+AV/LMLorn6mihcnogF38qswVcUqfTOrH+onEQJFoBI/
	g2FHG9q/Y6XFtZsRjhqh4pE1qAw4swBD1kDBLvWYDbLiyFfOG6eBBEwt91Uvc2ZwAtgZ
	YGT+RsrgeIt9r9ZyMYJ1Am2zdnYZI+1LWyxlYnZe9Yj0IFxAHtJXBTfuhLZQF61eGAX6
	sGwA==
X-Gm-Message-State: APjAAAWqNaUuVOCU9LCIJULUd1vINsb+oxlSsTS5O1twD6y5PMcxgdy9
	LDBkXYrO87NQJWbQddhZQhsLsWlE04U=
X-Google-Smtp-Source: APXvYqyYszcp0O5LYU5dZ2mQc3TGymHsh+9kxc6r1mavjiyjJmuwHzIMW0BYZBmzfy6r7vX/eevZqQ==
X-Received: by 2002:aa7:8e13:: with SMTP id c19mr32469014pfr.227.1577645071773;
	Sun, 29 Dec 2019 10:44:31 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::2f83])
	by smtp.gmail.com with ESMTPSA id
	bo19sm21257085pjb.25.2019.12.29.10.44.31
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 29 Dec 2019 10:44:31 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 29 Dec 2019 10:44:00 -0800
Message-Id: <20191229184415.19514-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20191229184415.19514-1-raj.khem@gmail.com>
References: <20191229184415.19514-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 04/19] cmake: Add a knob for cmake VERBOSE settings
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
X-List-Received-Date: Sun, 29 Dec 2019 18:44:32 -0000
Content-Transfer-Encoding: 8bit

Setting VERBOSE always, while is fine on one hand for debugging, its
coming at an expense of creating lots and lots of logs, e.g. qtwebkit
compile logs alone with VERBOSE is 163MB, there are many other large
packages which use cmake e.g. WPE, webkitgtk etc which are in same range
with out this option on, the logs reduce to 861K and also speeds up
build a notch

If user needs to disable these logs for a recipe or globally

CMAKE_VERBOSE = ""

in recipe or in global metadata e.g. local.conf

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Ross Burton <ross.burton@intel.com>
Cc: Andre McCurdy <armccurdy@gmail.com>
---
 meta/classes/cmake.bbclass | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/meta/classes/cmake.bbclass b/meta/classes/cmake.bbclass
index 8ccb1eefc7..11ffb0d33f 100644
--- a/meta/classes/cmake.bbclass
+++ b/meta/classes/cmake.bbclass
@@ -181,9 +181,18 @@ cmake_do_configure() {
 	  -Wno-dev
 }
 
+# To disable verbose cmake logs for a given recipe or globally config metadata e.g. local.conf
+# add following
+#
+# CMAKE_VERBOSE = ""
+#
+
+CMAKE_VERBOSE ??= "VERBOSE=1"
+
+# Then run do_compile again
 cmake_runcmake_build() {
-	bbnote ${DESTDIR:+DESTDIR=${DESTDIR} }VERBOSE=1 cmake --build '${B}' "$@" -- ${EXTRA_OECMAKE_BUILD}
-	eval ${DESTDIR:+DESTDIR=${DESTDIR} }VERBOSE=1 cmake --build '${B}' "$@" -- ${EXTRA_OECMAKE_BUILD}
+	bbnote ${DESTDIR:+DESTDIR=${DESTDIR} }${CMAKE_VERBOSE} cmake --build '${B}' "$@" -- ${EXTRA_OECMAKE_BUILD}
+	eval ${DESTDIR:+DESTDIR=${DESTDIR} }${CMAKE_VERBOSE} cmake --build '${B}' "$@" -- ${EXTRA_OECMAKE_BUILD}
 }
 
 cmake_do_compile()  {
-- 
2.24.1


