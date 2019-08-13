Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
	[209.85.215.194])
	by mail.openembedded.org (Postfix) with ESMTP id 587837E3BC
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Aug 2019 23:49:58 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id l21so52073577pgm.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Aug 2019 16:49:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=hRG/7NEzqLPiUGReWe3y78f+Al+5qIlnpvHRxKxmmhM=;
	b=AFD5ehlKOzeYFR4zsrJbvM1WaUIf1PiC5OwNmZbRAEx8fhUYKRvLxg58GGG/3OAokJ
	zGD/t1kjqQeo/3GOrcUs05acL2/2SzxUj8vggn6cmSYUTrcSfAS5OcFTlGktwQ7+iip9
	xIiwXQ/cXtMs9d7OztgQzKZAJCStPpOYTTGu8yHgeTgAWZ1PhAfTqlJNNi4lX4r/Q/ni
	UQaSHjYCZVDi13a7OJvS9Nwurg22B1txPJKagKxcyM74OsSMF0QR411jKlU60Y1wP5n5
	3kRJgXTwu59B5Nxyt1MNtpEpv3iTzMhfIxYdkVNht/uxSlbr+WA2B4IHmnwb+BgpQUNc
	jjaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=hRG/7NEzqLPiUGReWe3y78f+Al+5qIlnpvHRxKxmmhM=;
	b=PsqbghH95m+21TPo5xOUu9nO8L0E466swj0Ntt+pUKah86WO200JqOmmXQbPAUOfka
	4C/iQO6nMmLT86qsSfmqexgFzNTqbqj1YY++vnrwRjuz9qWIz3jcFIikQJLY0D/bLn/v
	PedIDR5VVuxkmK3qKzoUrKBWIwc8zXFFFSQRZuGUiQOnPwoq8i0exb27JpwlowR+zaHu
	1zQUHk+/Y4af5WeuSwUZ2QfE81RHxpKVQNzWC8yZCkHJuh9LYG0ftHjCoL5C6oTkRbSc
	/ruSZVQhS+MmuWARorXyc9Ls6vVsYkwWVPVRty8c0l/vAjMmKuCOlwCcXKahPg6/4wHB
	+Sow==
X-Gm-Message-State: APjAAAXkUvWTk2OPWK74LQcppHE7JGAM62gLwx+s4jJoqErApmX7PZJY
	fPvCEia5XbFFRr6xFSgKCpnyHflTbiE=
X-Google-Smtp-Source: APXvYqzo5yvxkNmKhOLVHUUsgjTq8jDXLeLtzjSJKSl4tNPe58V3ynV//t29svz30ZwbGt3muqmlkg==
X-Received: by 2002:a65:41c6:: with SMTP id b6mr36281218pgq.269.1565740198483; 
	Tue, 13 Aug 2019 16:49:58 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net (c-73-71-176-3.hsd1.ca.comcast.net.
	[73.71.176.3]) by smtp.gmail.com with ESMTPSA id
	m4sm129248858pgs.71.2019.08.13.16.49.57
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Tue, 13 Aug 2019 16:49:58 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 13 Aug 2019 16:49:48 -0700
Message-Id: <20190813234948.17250-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Subject: [PATCH] gdb: Do not set musl specific CFLAGS
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
X-List-Received-Date: Tue, 13 Aug 2019 23:49:58 -0000
Content-Transfer-Encoding: 8bit

These settings are no longer needed because we define
gl_cv_func_gettimeofday_clobber=no already and stat issue is alrwady
fixed via [1]

[1] https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=3c025cfe5efc44eb4dfb03b53dca28e75096dd1e

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/gdb/gdb_8.3.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-devtools/gdb/gdb_8.3.bb b/meta/recipes-devtools/gdb/gdb_8.3.bb
index c6eac84dd8..d70757a151 100644
--- a/meta/recipes-devtools/gdb/gdb_8.3.bb
+++ b/meta/recipes-devtools/gdb/gdb_8.3.bb
@@ -26,4 +26,3 @@ EOF
 		chmod +x ${WORKDIR}/python
 	fi
 }
-CPPFLAGS_append_libc-musl = " -Drpl_gettimeofday=gettimeofday -Drpl_stat=stat"
-- 
2.22.0


