Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f66.google.com (mail-pg0-f66.google.com [74.125.83.66])
	by mail.openembedded.org (Postfix) with ESMTP id 75CB978551
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Aug 2017 22:12:16 +0000 (UTC)
Received: by mail-pg0-f66.google.com with SMTP id 123so3996048pga.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Aug 2017 15:12:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=p+kJPDadXC3KEykAW39+vcrePVynZTauHf6GDMOBJ8k=;
	b=eUjH7MfN4UtN1FSeqb4zzXx5K0NK4M3/SKN4mwtXDpUMGEnBsU9fC5peA/iF7rIv1N
	BDhOsWRVxMXNCngLbQOrM8chcYR4S+dqBFSXs0yndFmubu0x1ync8hnytpiF7TpIzQlh
	x4cPcgU9ZoR3RUVezREKzERZ5asjy3yu3xvaFtRx2mA4DVJPsZZSqH4Qt+6EQU0Q3Dyz
	TC2NwWY9Wf1ntNxJBKC0L4Pwmm3A/7uJiFzjvtIZl+NJpJK6AVSfX0NtBtmrUW5HfKgW
	GN1/5JQpydICrhTALtTnD7dn6mTcvxqpjSJOIkkQ23REdBAQv+0QEuj1iKcVtTNJHqmt
	W5iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=p+kJPDadXC3KEykAW39+vcrePVynZTauHf6GDMOBJ8k=;
	b=Yhzz8KOgeb/zPebEiJTFcKtbzs9jhAA+IPARpj7WfmCCPhOnMNh+f6zY5/QpHg14fY
	sSRc15oQ/TyMhbgr6dY2aTnbLwczVdSIowvfTFbeddi+wtpO62Th0ylQjcE3Gw9v9LnL
	MukDcLK69B1NEOgn9GNIid4VM5trnIpgFzQVlHec+bqNGunmA10KmFofQFO/eBcV3jo/
	yt4alUHNZpf/4Ky/+IlK5IJss+53PvOH/pupptDc8DRxKwkqLndO0CBM6A8cB84NKiLz
	6KCx2SwOaCXZ1qcX6gAKowe9lVUXJJ4g90WX680HA7MReZ9Tv8+fyIoY77RpzzyWrSGp
	frZQ==
X-Gm-Message-State: AHYfb5jKzZ70Z6EqJcJLhx6JBzZIL4dxtcgJGb7n/ZK2aSyu/intyhav
	sRwcIP1+NPpBwAHw
X-Received: by 10.84.224.76 with SMTP id a12mr19085755plt.382.1502489538383;
	Fri, 11 Aug 2017 15:12:18 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::8e89])
	by smtp.gmail.com with ESMTPSA id
	w63sm3182361pfw.28.2017.08.11.15.12.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 11 Aug 2017 15:12:17 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 11 Aug 2017 15:12:08 -0700
Message-Id: <20170811221208.27335-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.14.1
Subject: [PATCH] musl: Build only in ARM mode when using clang
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
X-List-Received-Date: Fri, 11 Aug 2017 22:12:17 -0000

clang 5.0 has a codegen bug when compiling musl in thumb2 mode see

https://bugs.llvm.org/show_bug.cgi?id=34165

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/musl/musl_git.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/musl_git.bb
index 64c7334eea..eefd23bb8e 100644
--- a/meta/recipes-core/musl/musl_git.bb
+++ b/meta/recipes-core/musl/musl_git.bb
@@ -28,6 +28,8 @@ export CROSS_COMPILE="${TARGET_PREFIX}"
 
 LDFLAGS += "-Wl,-soname,libc.so"
 
+ARM_INSTRUCTION_SET_toolchain-clang = "arm"
+
 CONFIGUREOPTS = " \
     --prefix=${prefix} \
     --exec-prefix=${exec_prefix} \
-- 
2.14.1


