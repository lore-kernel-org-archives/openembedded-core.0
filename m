Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
	[209.85.128.53])
	by mail.openembedded.org (Postfix) with ESMTP id 1C98C6C3E1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 11 May 2019 14:08:17 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id n25so9816378wmk.4
	for <openembedded-core@lists.openembedded.org>;
	Sat, 11 May 2019 07:08:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=klFiMW7qRtj4fLk63o/7c6cv4/QaXptApK8gM+BTWOE=;
	b=clIgdoqKNMZXbUyA/KXgC9mqtlH/xUd4Mx8iK+5kM5RjK0ESUCdZ4p0axQIwcLGlb7
	FYND2fhxFLkd2n66grdclwXLtfyVRukQ+Q6tC0BussCOFfpE3McVD4YhrXM0V5yZGwkD
	BrPRxAD1U8tzhrCq0Djtc83Fq3R0UWt011JeAhoODiPVLg+GYYqlMjjqumWVoRK/DUbe
	YdCqD+cnQWOdMGoihrhMyjHA0lG8RlCM2l1B/wGnnjrp5NlXYBEqP9DPRSZLXOf7hJK4
	Ye7EOQWlHzI8fbmQ+0lQSieQBA6DOgBSeGXXzhaDA7j2BIata5HSduvz+vlT2bjqNbBQ
	0MCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=klFiMW7qRtj4fLk63o/7c6cv4/QaXptApK8gM+BTWOE=;
	b=m25VnByEZWlOmCLit/S/j4/NliMyQfdTXc4bIwLdh9mjqXblxcT7bABhA2zH/5+1i7
	glveIIpJkeGke1Od2kN6tJOqY/HkzmNe5RWPrpuo1VSGQ/2zcfUS17rDd6SpM1tUDSy8
	EffAi8ytbKzYQPyNnRi9HjJEyu1jzaYdgdAbW2yNa4j0ImE2qO6plM/Xy3ocfBwX5k3D
	UDNrj8Wk3FBAQvP0fkHIfScN/pzVcMvzz33kw+ja74WW4OOPcLgbiIC6CtYvnHSoeqs6
	F552iL2VWm8osT2hGvUbRJOk06wrgktmV4P+eyY2hsu95lxE6G5bYHDOw9nr/Xl03bsz
	t5zQ==
X-Gm-Message-State: APjAAAWTZuOj73H4DR4FWeQ7BYL9Ryjb4SpKUTeJQDOP3myPT+xOHDTo
	jK8ctG6ulZOLV2OdxjwknJN2GPyQ
X-Google-Smtp-Source: APXvYqxSEAepzSQ7mnbeMxdR1Yhw6LcB1VUmQdF5m9RdP4urvmK8zzbFMHBbihmUStxXzqr1JwWu9g==
X-Received: by 2002:a1c:c004:: with SMTP id q4mr9666017wmf.131.1557583698494; 
	Sat, 11 May 2019 07:08:18 -0700 (PDT)
Received: from localhost (ip-217-030-068-212.aim-net.cz. [217.30.68.212])
	by smtp.gmail.com with ESMTPSA id
	s3sm12671248wre.97.2019.05.11.07.08.17
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 11 May 2019 07:08:17 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 11 May 2019 14:08:24 +0000
Message-Id: <20190511140824.4624-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] perf: make sure that the tools/include/uapi/asm-generic directory exists
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
X-List-Received-Date: Sat, 11 May 2019 14:08:18 -0000

* before trying to copy unistd.h into it

* older kernels don't have uapi in tools/include and do_configure fails
  with:
  DEBUG: Executing shell function do_configure
  cp: cannot create regular file '.../perf/1.0-r9/perf-1.0/tools/include/uapi/asm-generic/unistd.h':
  No such file or directory
  WARNING: exit code 1 from a shell command.

* tools/include/uapi was added in kernel 4.8 with
  https://github.com/torvalds/linux/commit/c4b6014e8bb0c8d47fe5c71ebc604f31091e5d3f
  tools: Add copy of perf_event.h to tools/include/linux/

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-kernel/perf/perf.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
index 546076f84b..215d0a38f9 100644
--- a/meta/recipes-kernel/perf/perf.bb
+++ b/meta/recipes-kernel/perf/perf.bb
@@ -238,6 +238,7 @@ do_configure_prepend () {
 
     # unistd.h can be out of sync between libc-headers and the captured version in the perf source
     # so we copy it from the sysroot unistd.h to the perf unistd.h
+    [ -d ${S}/tools/include/uapi/asm-generic/ ] || mkdir -p ${S}/tools/include/uapi/asm-generic/
     cp ${STAGING_INCDIR}/asm-generic/unistd.h ${S}/tools/include/uapi/asm-generic/unistd.h
 }
 
-- 
2.17.1


