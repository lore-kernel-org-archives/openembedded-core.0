Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-io1-f67.google.com (mail-io1-f67.google.com
	[209.85.166.67])
	by mail.openembedded.org (Postfix) with ESMTP id 0863279D5B
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Mar 2019 06:35:58 +0000 (UTC)
Received: by mail-io1-f67.google.com with SMTP id k21so15860424ior.13
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Mar 2019 22:36:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=2c+Zs1gtlvjHjqRfRycAQiIRacFk4A77Xlf7cZXvm3k=;
	b=sSX73KnQclsH5AA1xjJqldcW1HjmkN5wNoeO3uW4gYwQYStVjz252dJDBgxxNkfDtK
	fpr8DpHF6VSFZQGPICdYqvnJzVo0xZFbja1wq9al8DD32ziXC3ZpVxAnSWeGSOxoGTLJ
	a04VM0JUElO5PVvHc57MyMXsF22Y2sTOVb0/aM0ekGJZ+JqxpkTO63jT9ts5gEDFQzNy
	x4726dDKjBjds0kYWC1WNqCqOohmKIXTXOo5Qnnfcc6L8zArBDZLdkzWx4s2feVPa67x
	aIsKBUk28J7fQrXcWvygaYjScf/os5L8UXQubRLBW5WwZ08URSGgSDtmuQivZiAkPai+
	3Ocw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=2c+Zs1gtlvjHjqRfRycAQiIRacFk4A77Xlf7cZXvm3k=;
	b=EapjPlx5riMmVT4ApECjdRo1mEDJPC8P2iMXd6/wWi7MR+HWNuLyxzf+9HEB1VOMRi
	GgaNezdM2zjSYd9Y10FOxCe9xeZR5de/G+1oRipA7rspE1nV+JxdRUtntYtCPRUaMuWy
	USAkRF4fC9i1yFD11oHkn4E1Wjkx2rahEQi/PwB+22skO/ahoOYh2hqhJPLJ9GShJavd
	zcQhHxi4Y3ta06aWjag7Ewbf3lpecE2/feso4F8dr9M/+HbhR7eVbnEw9UpOhfk/xQl2
	+OLmhwNcXng1OeXhbs+GwWu8UHpYTaDJ/1/kQwLSSN7JPb53psipcuK08pbT/PM2gi2D
	4eYw==
X-Gm-Message-State: APjAAAWn+pX5kQwW54LQsm17vPOuhlP7xS9mz68eMdk3W74eWrQ7oq6g
	D08epjUmkG3RlZEBPV/Bz6c=
X-Google-Smtp-Source: APXvYqxFk3u9YjCgOnNqWo4p1BIy2vFUnrSdDKVPU2Qttc2jBhFMAR7ReGFQQe1Ikx3lM6SFrkwA0A==
X-Received: by 2002:a6b:7405:: with SMTP id s5mr8518871iog.1.1552026959731;
	Thu, 07 Mar 2019 22:35:59 -0800 (PST)
Received: from localhost.localdomain
	(CPEe8de27b71faa-CM64777d5e8820.cpe.net.cable.rogers.com.
	[174.116.254.195]) by smtp.gmail.com with ESMTPSA id
	a16sm3594175itc.27.2019.03.07.22.35.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 07 Mar 2019 22:35:59 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Date: Fri,  8 Mar 2019 01:35:57 -0500
Message-Id: <20190308063557.3712-1-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH] perf: synchronize unistd.h between libc-headers and perf source
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
X-List-Received-Date: Fri, 08 Mar 2019 06:35:59 -0000
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

During the build for some architectures, perf generates a program
which executes on the host to dump the syscall table.

The generation of that program uses the cross compiler + sysroot
to expand unistd.h. As such, we are getting the contents of that
file from linux-libc-headers.

The compilation of that generated program uses the host compiler
and a restricted include path to the perf source code. In the
perf source there is a captured unistd.h, as such it will be used
when compiling the host executable. The perf source code is copied
from the kernel version that is being built .. so we have a
mismatch between the generation and the compilation of the host
program.

Normally this mismatch is fine, but if the libc-headers are
newer than the kernel, we'll have syscalls (and their syscall
numbers) that are not defined in the perf source code. This
leads to a compiler error and a cascading failure of the perf
build due to a missing generated file.

To fix this, we can copy unistd.h from the recipe-sysroot
into the perf source code and they will always be in sync.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---

Richard,

This should fix the perf build failure with 4.19 and the 5.0
libc-headers.

It also builds fine in the other combinations I was able to
test. No sense sitting on this, it can use some AB combinations
for more testing.

Bruce

 meta/recipes-kernel/perf/perf.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
index 9120766858..2f85006ee1 100644
--- a/meta/recipes-kernel/perf/perf.bb
+++ b/meta/recipes-kernel/perf/perf.bb
@@ -235,6 +235,9 @@ do_configure_prepend () {
     for s in `find ${S}/tools/perf/scripts/python/ -name '*.py'`; do
         sed -i 's,/usr/bin/python2,/usr/bin/env python,' "${s}"
     done
+
+    # cp from the sysroot unistd.h to the perf unistd.h
+    cp ${RECIPE_SYSROOT}/usr/include/asm-generic/unistd.h ${S}/tools/include/uapi/asm-generic/unistd.h
 }
 
 python do_package_prepend() {
-- 
2.19.1


