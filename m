Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
	[209.85.128.52])
	by mail.openembedded.org (Postfix) with ESMTP id 3E2D460AE2
	for <openembedded-core@lists.openembedded.org>;
	Sat, 22 Feb 2020 14:01:58 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id m10so7257068wmc.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 22 Feb 2020 06:02:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=8liQVjRDbKO354BlBApZq4OYo0RK9NJ6djxAY1+o9Ck=;
	b=F6N8uIYMkrsFV7yJ3yELcA/X6bHzVP+prlshfS2ibMQlWimTZycWtwSBs7iQDtUPkc
	V+Sn4QBXMc3qrHfFKCISqwbylAUn2DAbE8Up4wKAoStjmq26Fzxvns9YoJNJhcONZ97n
	x7KTPCrWAOkS+sllytWqQZIAuJ7RFCY1leFSQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=8liQVjRDbKO354BlBApZq4OYo0RK9NJ6djxAY1+o9Ck=;
	b=F4LlivMWevU8Jz+U0507GfKv5D3YcHHQkQZVlg57L/w7eTtYLzHSrhFhyZQ8Z9XsfP
	kaviSnzJd/HJhHUcrELQLma0ZLh6Sb4fswTdFB+D0SL6UFPNj0I7Z+7Uvd8DXTx0+XJx
	4U8lTsbExBgRuBfEgpa6mr/YrafIKsZJF4gm0FNdOA/oqQLOsE1KMCaZzIB0aMFZc13B
	oniuwoWmqQk+8bLXMwy+1yshcA0UCsAD/wtPxqCcdB8lsMd9atIu/KGa8CauLfLHNfFw
	QRkOlugcvR+SkpbC7Dm/5k64hvqqnkVay2lUY9aFg35SvVmH5Mz7veq192qPLNXzdM8d
	NjsQ==
X-Gm-Message-State: APjAAAWEc5ojInc9EpZLXrUYIou/RG5fqPXRiS4FUoTzaSCWnDyNqFi+
	/p2LOf+J5rPGMQURkV361WY7+YCo8vI=
X-Google-Smtp-Source: APXvYqz0pmdrkgvXRe6CCKu6zN/sHLiN7DZVW+uKvxdEdSu0deIdyLZFLxUniDuvCk98LUx0rlkLUQ==
X-Received: by 2002:a1c:2645:: with SMTP id m66mr10167159wmm.98.1582380119176; 
	Sat, 22 Feb 2020 06:01:59 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	m68sm8554036wme.48.2020.02.22.06.01.58
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 22 Feb 2020 06:01:58 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Sat, 22 Feb 2020 14:01:56 +0000
Message-Id: <20200222140157.253097-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Subject: [PATCH 1/2] binutils: Fix x86_64 override usage
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
X-List-Received-Date: Sat, 22 Feb 2020 14:01:59 -0000
Content-Transfer-Encoding: 8bit

This override was applying to binutils-native meaning it would behave differently
depending upon the host it was building on. This is not a good idea and we have
tests to detect it which failed:

oe-selftest -r sstatetests.SStateTests.test_sstate_32_64_same_hash

binutils-native already enables all targets so we can avoid issues by not setting this
option in the native case.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/binutils/binutils.inc | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/binutils/binutils.inc b/meta/recipes-devtools/binutils/binutils.inc
index 5b4a3392092..6ed40a14861 100644
--- a/meta/recipes-devtools/binutils/binutils.inc
+++ b/meta/recipes-devtools/binutils/binutils.inc
@@ -75,9 +75,12 @@ EXTRA_OECONF = "--program-prefix=${TARGET_PREFIX} \
                 --enable-deterministic-archives \
                 --enable-plugins \
                 ${LDGOLD} \
+                ${EXTRA_TARGETS} \
                 ${@bb.utils.contains('DISTRO_FEATURES', 'multiarch', '--enable-64-bit-bfd', '', d)}"
 
-EXTRA_OECONF_append_x86-64 = " --enable-targets=x86_64-pe,x86_64-pep "
+EXTRA_TARGETS = ""
+EXTRA_TARGETS_x86-64 = " --enable-targets=x86_64-pe,x86_64-pep "
+EXTRA_TARGETS_class-native = ""
 
 LDGOLD_class-native = ""
 LDGOLD_class-crosssdk = ""
-- 
2.25.0


