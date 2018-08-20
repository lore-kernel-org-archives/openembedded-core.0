Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com
	[209.85.215.173])
	by mail.openembedded.org (Postfix) with ESMTP id 3D8E779074
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Aug 2018 19:00:00 +0000 (UTC)
Received: by mail-pg1-f173.google.com with SMTP id z25-v6so2533462pgu.7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Aug 2018 12:00:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=SOM9N/pYMukLr8AT45/QXONPE2OWrYMBMbVnfyqJA3c=;
	b=d0GN43WnRfLJdYMXRwnXNb/REzmmZPxtHrZ86aSlmDxkW3KmKjpT8HzdWkTfk/FU8F
	zmhbKTn8ed6fMfBck46Htj1zHGrpG6Bh6CDAOGShWYhG84V5IxequfmwpU42YTtQq50F
	/9ya1pwYUdFIT8hhx0cZN/4ktVYhEPJ0cTdqV/5G39NUSK5w2RaMAGDh/O0exPRnEuoY
	Rjvu7xvDv6sVVzYI1zsD9qZYMkoJjod7btpnCB4tCgs2UCO07ansmEdqSm7u32ZfBzBM
	1f3ShGnu+ffMpBnY6S+eEy33fNpPCa8isuj5uRY+nxyF4hNdLe/SyXkNZbVTC2sZIITf
	mC8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=SOM9N/pYMukLr8AT45/QXONPE2OWrYMBMbVnfyqJA3c=;
	b=pijS47VyruHQbJ2sxN18SaSiMScF/WoIRop4OkcqkZKLTkCettlmdYCxyGIoPEsQGq
	p63o6fmWrISPFdWazLs+g/hpIfiK1YEtiENWaZmCSpBWMech6vL3IPL22yD0JqSLpIYw
	DaLpDdwlYFSl937vwvUoTl5Iwp8Y4P60EkYxcp8/Npciq1/yWz1Ky9G8EvEfOmuOz/yz
	etxMKr9jme3eSeyTpwWb8X1q0a5x2he3AJbEBSBCKud1GcoV5jOn7HYBgnK4fEKlwN99
	LYoXmm+V/Vj5+dKxQWz/fXbkBvERmkQwKT2x0W3xNjr7XC9D5XxaLn29dClioGshrVEf
	y5lg==
X-Gm-Message-State: AOUpUlF19Bv/CZ7rx50i4swovVXhJFtD1/1Bs3YpYLxbNGxCtZy5hifX
	tZcb1zKHkHHiKJAxUzyl4AAadVKH
X-Google-Smtp-Source: AA+uWPxvmaj2udKZzF7wHnPmldStKiUKqqCEc53H/RZyBFgEXmNfCL9Bmgy1v7LLRUWEPm0PpVnKQg==
X-Received: by 2002:a63:4d06:: with SMTP id
	a6-v6mr43950566pgb.408.1534791600995; 
	Mon, 20 Aug 2018 12:00:00 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::4add])
	by smtp.gmail.com with ESMTPSA id
	j27-v6sm18773223pfj.91.2018.08.20.11.59.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 20 Aug 2018 12:00:00 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 Aug 2018 11:59:49 -0700
Message-Id: <2c5a62b8c4afe40ff2c0fbe2263e9c96d40b63d7.1534791421.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <cover.1534791421.git.raj.khem@gmail.com>
References: <cover.1534791421.git.raj.khem@gmail.com>
Subject: [PATCH 3/5] gdb: Alias rpl_stat to stat() on musl
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
X-List-Received-Date: Mon, 20 Aug 2018 19:00:00 -0000

Use CPPFLAGS instead of CFLAGS since there is C++ compiler being used for somefiles

Fixes
gdb/gdbserver/../../../gdb-8.1.1/gdb/gdbserver/../common/common-utils.c:419: undefined reference to `rpl_stat'
| collect2: error: ld returned 1 exit status
| make[4]: *** [Makefile:414: libinproctrace.so] Error 1

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/gdb/gdb_8.1.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/gdb/gdb_8.1.1.bb b/meta/recipes-devtools/gdb/gdb_8.1.1.bb
index 84ab08ce93..c6eac84dd8 100644
--- a/meta/recipes-devtools/gdb/gdb_8.1.1.bb
+++ b/meta/recipes-devtools/gdb/gdb_8.1.1.bb
@@ -26,4 +26,4 @@ EOF
 		chmod +x ${WORKDIR}/python
 	fi
 }
-CFLAGS_append_libc-musl = " -Drpl_gettimeofday=gettimeofday"
+CPPFLAGS_append_libc-musl = " -Drpl_gettimeofday=gettimeofday -Drpl_stat=stat"
-- 
2.18.0


