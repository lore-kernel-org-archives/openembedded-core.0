Return-Path: <raj.khem@gmail.com>
Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com
	[209.85.216.65])
	by mail.openembedded.org (Postfix) with ESMTP id 1F2117FDB1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jan 2020 20:00:39 +0000 (UTC)
Received: by mail-pj1-f65.google.com with SMTP id r67so1690117pjb.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jan 2020 12:00:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=EwOzi+yD4E18zHuGTa7FxQqC/X+n29tAaJGLy3hq5os=;
	b=iy1geW5Z13Efin8vghg1VuWLsn6AS15abQd9y01mYRX9gLbv0PUg/F8PEr/4xk6JEC
	B6QRIkIpua9O4VP8jL4atPO3aUgI7/aGZpXRtW9VQawCf6FKyrD9okwArMUDedWr9Lg6
	G+tUun1RGMW+Sogk/kWiutV6+cm9AdAB18gF1Q7v9Dme6TE/Cp5dwN0/MjaYNZtcB01G
	7/hknFcrjiz2holNVyjAYlPp+YNJOMnh6Wu1mModLAPgYp79eRhKEe2Phflg7K6/hBdw
	lxSNQhyuDqss6g/0NufgNgu1yCajIMvJZQIDgrGJh1jlXRlmBUQaCUcSteqQmnBM3sTM
	HtiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=EwOzi+yD4E18zHuGTa7FxQqC/X+n29tAaJGLy3hq5os=;
	b=Jd7UHWy15swhPuXERsrADgBKRpch+lBB0GyPWZmQpixYo13PyyD2ZhIlxWszaQASYk
	J3I82KC3eAd3q7d/e0X1vFK6IolrjioDf2xagL/L4iEi1wvbDeizAzkwloPRKe2nEfIr
	tpvsnHxtooZ/nXF8vhqGa6HLe/g33hGzwxjSlODKYQbpP978mdhrbR5A3dal1qk5Thob
	HXTuO+geUG8sbU0dT77a2PgnVj3Yf5uur8mCJi7yBhNzapreKKBTYJc6cxVwqZQHZzHS
	5SJz+inenf5YAr1XH9PyhSaZD4H8A1jKFYIKV4G7Z6tfBxUc64rQg+1kXQBpmjsQNsdk
	EduA==
X-Gm-Message-State: APjAAAX/IiNt+jxXNh0LN+5cpIKudo113Vc0wETFAncE1jwWZgBOsCYs
	VjjMXgzB+yMkMAno+P9XS+HpguAHCsA=
X-Google-Smtp-Source: APXvYqyn0fEYEvPK03ikwTYwXDKo08bq/wgug64cxnqXOsTD/VvctXqev8Blegwdxd97NmNUpl7GeQ==
X-Received: by 2002:a17:902:8a88:: with SMTP id
	p8mr2302551plo.179.1579809639701; 
	Thu, 23 Jan 2020 12:00:39 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net
	(c-73-63-224-124.hsd1.ca.comcast.net. [73.63.224.124])
	by smtp.gmail.com with ESMTPSA id
	y38sm3806967pgk.33.2020.01.23.12.00.39
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 23 Jan 2020 12:00:39 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 Jan 2020 12:00:38 -0800
Message-Id: <b167273d8649ff90ecd5a75060ee3042bede7679.1579809439.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <cover.1579809439.git.raj.khem@gmail.com>
References: <cover.1579809439.git.raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 1/4] perf: Pass LDSHARED and CCLD via EXTRA_OEMAKE
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
X-List-Received-Date: Thu, 23 Jan 2020 20:00:39 -0000
Content-Transfer-Encoding: 8bit

python code underneath is smart and pokes at python installation in
sysroot for compile environment, the overrides from EXTRA_OEMAKE are
ofcourse preferred but it falls back to python3's distutils/sysconfig
for rest of them, and it does use CCLD and LDSHARED for linking, when we
use clang to compile python3 then it encodes these variables to be clang
however, when building perf we inherit kernel which forces gcc to be
used for compiling perf, which then mixes both compilers due to CCLD and
LDSHARED demands. Therefore override CCLD and LDSHARED in make
environment helps python/distutils to use right linker

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-kernel/perf/perf.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
index 840f3008b5..6d1b06693d 100644
--- a/meta/recipes-kernel/perf/perf.bb
+++ b/meta/recipes-kernel/perf/perf.bb
@@ -73,6 +73,8 @@ EXTRA_OEMAKE = '\
     CROSS_COMPILE=${TARGET_PREFIX} \
     ARCH=${ARCH} \
     CC="${CC}" \
+    CCLD="${CC}" \
+    LDSHARED="${CC} -shared" \
     AR="${AR}" \
     LD="${LD}" \
     EXTRA_CFLAGS="-ldw" \
-- 
2.25.0


