Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id 0A5846B3D1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Nov 2018 15:32:21 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id r11-v6so5766154wmb.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Nov 2018 07:32:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id;
	bh=1KCRpN5LmSHFnqTRoEq6U04HCe6GtigZobtv4TwMVq8=;
	b=OVaUzneoGla36f7GOmWiBrAruC3oujq247MSOlxS2ZtxEqsjCpvGjaf23+8J1A8Jtw
	sBFepOrnJgzDiv0LWieui59NPE+2ze2US1aUrfmDofjHCDV1WwEqUsSxwURsDVH9H35h
	nzBAJD4P2yIDLptL4v/F+I8Wf9+sfV6mFAwRk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=1KCRpN5LmSHFnqTRoEq6U04HCe6GtigZobtv4TwMVq8=;
	b=ha5RW7j20uP6Xtf6VG3WfeovLsn8uHr98OBgUd5ih6r4IhW3f3i9/1uB66hQ6ApSx9
	XpQ88LhdglhlklSiHDKlRbairj0EfVU3Z/77IBuXta6QZp3CHK/i5ic1dVACxCQxcJvf
	va4vOyHQMVyhAj3MsqboW9Klvndmha4txZZmFrR59PJCbvAwo3etMwI7e2cpTnNQ4lQ7
	P5JWZAazUP/Bd5XAvhNtUc08Yf6ygvsnwBi0wmbc1U7pfQM9Bq7x4nIZgS3ysIaTivhV
	miyxkBeQpMJKRgBq6LZhO6XrE6nmMwZHjTpc2gJTcqjdRyddEcS1WP7q7EGJUVAkDzQ6
	aPjw==
X-Gm-Message-State: AGRZ1gIvp6aIFgZ4VlkX20y61GjJcVYi8oKElNTyPT6LGhT8ODlvkPtp
	jEPjWQfSxiuEhXzx//RxS9PQPPL1Mdk=
X-Google-Smtp-Source: AFSGD/XuLnpCIEBkKvQdKcEktgrykImA3dU4l+c60qZkWX3PY97Ri9GA3RwlIQRBXdFKPLCNDxpVbw==
X-Received: by 2002:a7b:c5cc:: with SMTP id n12mr7533941wmk.149.1542641541811; 
	Mon, 19 Nov 2018 07:32:21 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	x81sm409180wmg.17.2018.11.19.07.32.20
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 19 Nov 2018 07:32:21 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Mon, 19 Nov 2018 15:32:17 +0000
Message-Id: <20181119153219.21850-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH 1/3] lttng-tools: Improve ptest robustness
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
X-List-Received-Date: Mon, 19 Nov 2018 15:32:22 -0000

There are some fatal make errors that occur from the current ptest
for lttng-tools however since other tests are successful, those make
build failures were being ignored.

When upgrading, the order of test execution changed and the ptest failed
fatally straight away with the same errors.

Passing -k to make means it will try and run all the tests making the
test suite run more consistently over all lttng-tools versions.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-kernel/lttng/lttng-tools/run-ptest | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/lttng/lttng-tools/run-ptest b/meta/recipes-kernel/lttng/lttng-tools/run-ptest
index 705030ee53b..dbb18820a4c 100755
--- a/meta/recipes-kernel/lttng/lttng-tools/run-ptest
+++ b/meta/recipes-kernel/lttng/lttng-tools/run-ptest
@@ -3,4 +3,4 @@
 # test plan to raise ERRORs; this is just noise.
 makeargs="LOG_DRIVER_FLAGS=--ignore-exit top_srcdir=$PWD top_builddir=$PWD"
 make -k -t all >/dev/null 2>&1
-exec make -s $makeargs check 2>/dev/null
+exec make -k -s $makeargs check 2>/dev/null
-- 
2.17.1


