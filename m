Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id 6061961423
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Feb 2020 21:43:04 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id a9so2292793wmj.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Feb 2020 13:43:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=nSYxhSxqbZcAUjwwNIY/Ksqo+BajNtKh79vSC4I2BWs=;
	b=QJ5y9k0uziupBxVA6UviyCbVxKHAQtGoPTqXkORdAuF9eL8TTl2aj7YBx44p1tZPtw
	0JBIwmVOJuollD7uy8h6fxg8YJULLDnuEJYqURU4VKp0gT/qTvdlGPP4YU08cJ5yMPi0
	l1U/DBScVJBK1AWxjbVA5rppBpXN4CYZKsq1k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=nSYxhSxqbZcAUjwwNIY/Ksqo+BajNtKh79vSC4I2BWs=;
	b=Z8EeBU00nUYd5nFsQm041suh9Fj0V4BFfuosrNvGoGGc3uxUU3kPGg7l+38AUFnH41
	wmXWn2rcbFcy3WzODZjgS15gTDF78i48QyBbvKQ/ykTPWbOXUYL7TWV8WabPFT1/ZghE
	6DJJ6aWftM97U1wu5hQ7jRniaeAxztX50vDkdEw/fHDYBoSsZecPF+UBzMiw/VtNSq5W
	TP2CXdfGKoj1rBBjZwTmiZQpOIvAjWIDKB+vwlnPctaxPgiyPG+icYPFlVo07jZ7XMwb
	LHH/S2kaATpu+CwUeWiFBnIV5ymNm5IVctQNJWWlkytCBVNFLOLU+M3H8tUQ3tkMNnM3
	CMXQ==
X-Gm-Message-State: APjAAAXvBO9s7zkPNFLGnqeh7cupXFr1wS/MOcdlUrB5z2wJE3rJ5v1E
	GdWSc7aQy0tZABt85yaor6PZG8OhuTI=
X-Google-Smtp-Source: APXvYqw0amc0gTQ0kUroSx6zFm48t4lR+r6vFmYe0ZMgKXfz/mBbFmqX+EZJxQi1uu28t4TAAu8ncw==
X-Received: by 2002:a1c:ac46:: with SMTP id v67mr11794079wme.153.1582148584860;
	Wed, 19 Feb 2020 13:43:04 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	b18sm1537147wru.50.2020.02.19.13.43.04
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 19 Feb 2020 13:43:04 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 19 Feb 2020 21:43:03 +0000
Message-Id: <20200219214303.138067-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Subject: [PATCH] local.conf.sample.extended: Document how to limit parallel fetch tasks
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
X-List-Received-Date: Wed, 19 Feb 2020 21:43:05 -0000
Content-Transfer-Encoding: 8bit

[YOCTO #13235]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/local.conf.sample.extended | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta/conf/local.conf.sample.extended b/meta/conf/local.conf.sample.extended
index fcf4a9b7c1a..443b4e83f9a 100644
--- a/meta/conf/local.conf.sample.extended
+++ b/meta/conf/local.conf.sample.extended
@@ -23,6 +23,14 @@
 #
 # For a quad-core machine, BB_NUMBER_THREADS = "4", PARALLEL_MAKE = "-j 4" would
 # be appropriate for example.
+#
+# Some users are behind firewalls or use servers where the number of parallel connections
+# is limited. In such cases you can limit the number of fetch tasks which run in parallel by
+# setting the option below, in this case limiting to a maximum of 4 fetch tasks in parallel:
+#
+#do_fetch[number_threads] = "4"
+#
+
 
 #DISTRO_FEATURES = "alsa bluetooth ext2 irda ipv4 ipv6 pcmcia usbgadget usbhost wifi nfs zeroconf pci"
 
-- 
2.25.0


