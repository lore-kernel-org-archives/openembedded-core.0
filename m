Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id 85D7860691
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Mar 2020 16:05:15 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id j1so1970960wmi.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 Mar 2020 08:05:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=fgKcvrIpi9lcdgtncxmSctwyTnQhaPQ4jv3o1kQeXHg=;
	b=hp0tyBrdE7csFnJ8j4Q9ItBx9LH2QN2FTM80ta7fEJume2GxIMhrGCoUmHBNGQlQd1
	QMLXdI1eRoyRLwFIG4SO0J9yqXpZWHjk5kKlbXnJIUYB0qkxpUnB00mT7nKvLJwVufW5
	ytznIkd+DqjNZ1FwahAmjT04eaitly+7VR/Nd4A04X3qFvY9qoWNW4IpyaUQwVbMTqiH
	jHhLBY3ba/wNK20bx2FTnDw04obW1bwwn/FtIYomcsPQZlex1pEK3W/qWlLjRp0ODn8J
	Q0akrtMpPgK71HuGIuxNKQLRQPftMIuO3rfx3Li0ntbSfJbKEIuT+pruN2sonyO9hZAA
	QLeQ==
X-Gm-Message-State: ANhLgQ2x71rSGTHj3SgOKEYSeIkPo7LSJvDJqQyihr7d7tcxWF/XL6Jz
	QFsqy49eF7FraX+YYStP+OOgEvLh
X-Google-Smtp-Source: ADFU+vtf/OQeh91olGyO3v1JgKIjeNFHtQJdU7VUMzAjW/RBWr2R9CUt+vOcLt9asuZ42THyRyisLg==
X-Received: by 2002:a05:600c:2056:: with SMTP id
	p22mr4683804wmg.136.1583251515864; 
	Tue, 03 Mar 2020 08:05:15 -0800 (PST)
Received: from 1aq-andre.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	e8sm35335861wrr.69.2020.03.03.08.05.15
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 03 Mar 2020 08:05:15 -0800 (PST)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Tue,  3 Mar 2020 16:05:11 +0000
Message-Id: <20200303160513.17645-2-git@andred.net>
X-Mailer: git-send-email 2.23.0.rc1
In-Reply-To: <20200303160513.17645-1-git@andred.net>
References: <20200303160513.17645-1-git@andred.net>
MIME-Version: 1.0
Subject: [PATCH v2 2/4] bitbake.conf: more deterministic xz compression (threads)
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
X-List-Received-Date: Tue, 03 Mar 2020 16:05:15 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

xz archives can be non-deterministic / non-reproducible:
    a) archives are created differently in single- vs
       multi-threaded modes
    b) xz will scale down the compression level so as to
       be try to work within any memory limit given to
       it when operating in single-threaded mode

This means that due to bitbake's default of using as many
threads as there are cores in the system, files compressed
with xz will be different if built on a multi-core system
compared to single-core systems. They will also potentially
be different if built on single-core systems with different
amounts of physical memory, due to bitbake's default of
limiting xz's memory consumption.

Force multi-threaded operation by default, even on single-core
systems, so as to ensure archives are created in the same
way in all cases.

Signed-off-by: André Draszik <git@andred.net>
---
 meta/conf/bitbake.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index e201b671bb..131ba296d3 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -795,7 +795,7 @@ BB_NUMBER_THREADS ?= "${@oe.utils.cpu_count()}"
 PARALLEL_MAKE ?= "-j ${@oe.utils.cpu_count()}"
 
 # Default parallelism and resource usage for xz
-XZ_DEFAULTS ?= "--memlimit=50% --threads=${@oe.utils.cpu_count()}"
+XZ_DEFAULTS ?= "--memlimit=50% --threads=${@oe.utils.cpu_count(at_least=2)}"
 
 ##################################################################
 # Magic Cookie for SANITY CHECK
-- 
2.23.0.rc1


