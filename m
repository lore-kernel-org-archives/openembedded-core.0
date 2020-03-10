Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
	[209.85.210.196])
	by mail.openembedded.org (Postfix) with ESMTP id 6A82E61B53
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Mar 2020 01:15:32 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id n7so5676505pfn.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Mar 2020 18:15:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=+I+xTadA/dKpsLss/ewMbAaqDD+daT6qYyoB6UxDh3U=;
	b=Y5OaRflop095BUsh8hMNVBeBsftIboJJQ1w8tRzfa5qt3GFIKSXzGbT5zlABZNQGrW
	g5BDS/oA6hgTsaS6TiX9Tk2rUNHNa/JhTBZZbepmNierzy6B+GRnbBLIcLAQygDpSeu2
	27XuSN9IeieolVk3tTmqwZHtK0VSYdS+Ygv1bPxOvjQ8vw17B1xdxv8BuVuLm8kSnqXU
	YPusnJ3rBRJttmvAbZSmXWDszW6eFF8wkReJKNBO2Ad+crE8KC1TW5F97NzldDk+3WW8
	am+JVsKba9w2bw+C/cFaHSBev2STtYmyeHYnWnD6fx1yDkLfTV2LALi5KtHR+L3jprSp
	8wpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=+I+xTadA/dKpsLss/ewMbAaqDD+daT6qYyoB6UxDh3U=;
	b=UQDEygn27/NbbnxO5fmNxJjKWv6jN4tdVGErjLOLLDuY9qZdsCcc0mbU7mbZ2gQf0s
	H1Og33aWf7MdTCrgKMs3W1wfLWZVve3L1rImDDPaV5KoY7ohFnTusXaF4bEDeJ8fnh3n
	B+Z79CKWahVw/jP7v1B0ha6WVjjl/sg6qZpPn821bh/h+pLUSSLDRoSi7NYItn9tK4jM
	tVfoOS84a/UgUmLQMIVtoiT7zVw8oRf/W5W84Gqd7lyZXL8fcDxQVxqXIq20jH7X9WIT
	SxBduAMj7Rn78D1MdT8ZQ87DJVjvtdoeMl5TB4HnP/pdZtYwYZtIAKnaVzXmwa8t6M5p
	iX3A==
X-Gm-Message-State: ANhLgQ1DwMe9anFKuIppLLlPC7NmCDyhiDbe7892oy74RX3i5rrOrvUo
	rgQvLue2b6PWOK+whieWIaL/Z7dNVFw=
X-Google-Smtp-Source: ADFU+vv/L5PVu1m2jd4O7TZHRZmIshx/nD7dQnwa4OrjN2T3LYLlxWdF5a9zHPkeMcwiJHRIXyzt6w==
X-Received: by 2002:a63:91c1:: with SMTP id
	l184mr18039730pge.341.1583802932904; 
	Mon, 09 Mar 2020 18:15:32 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::1c34])
	by smtp.gmail.com with ESMTPSA id na18sm737200pjb.9.2020.03.09.18.15.31
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 09 Mar 2020 18:15:32 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  9 Mar 2020 18:15:42 -0700
Message-Id: <20200310011544.3022342-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [PATCH V2 1/3] ruby: Use arm32 for coroutines on 32bit-arm
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
X-List-Received-Date: Tue, 10 Mar 2020 01:15:32 -0000
Content-Transfer-Encoding: 8bit

in 2.7 [2] ruby enabled ucontext for coroutines on arm32 but it does not
work for musl since it uses glibc specific functions e.g.
getcontext/swapcontext/swapcontext also see [1]

This patch reverts back to using arm32 implementation for coroutines on
arm

[1] https://bugs.ruby-lang.org/issues/16455#change-83442
[2] https://github.com/ruby/ruby/commit/6c6bf9ffcbfeb8be9d9c342e7604b74ec819e88a#diff-7fccec8474e2184cd2518046bf39d54cL10

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: No change

 meta/recipes-devtools/ruby/ruby_2.7.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/ruby/ruby_2.7.0.bb b/meta/recipes-devtools/ruby/ruby_2.7.0.bb
index 268b4bebd9..884bb0ef44 100644
--- a/meta/recipes-devtools/ruby/ruby_2.7.0.bb
+++ b/meta/recipes-devtools/ruby/ruby_2.7.0.bb
@@ -25,6 +25,8 @@ EXTRA_OECONF = "\
     --with-pkg-config=pkg-config \
 "
 
+EXTRA_OECONF_append_arm_libc-musl = " --with-coroutine=arm32"
+
 do_install() {
     oe_runmake 'DESTDIR=${D}' install
 }
-- 
2.25.1


