Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-io1-f67.google.com (mail-io1-f67.google.com
	[209.85.166.67])
	by mail.openembedded.org (Postfix) with ESMTP id DE9517CF51
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Mar 2019 13:46:11 +0000 (UTC)
Received: by mail-io1-f67.google.com with SMTP id x9so16700703iog.12
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Mar 2019 05:46:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=OA7qJhP30jtA81LAbJqatBBLAeQp4C1nOSyaNxsmDrQ=;
	b=mLiaUsUG+bEBbCs+ZQQv3MCCrM/JXOUxG04KEfNbuIRAqJscopxXahhbjo9yUEdS69
	aarxEYT6v0r0AfL6xKm5NQ35KAK7K5MALuL2fPRmzy6QReF6f0J1TJZ4BtXxP6/qoDxR
	Qcb5JB9ymKUR4xekGGIA0TTdRIaJMlM/vtqjhRgwman6Wxw5336ORrHPN0UM4K/XjLGl
	tWbup3B9tA7atXb5F8mLy/VMmJuldbd1yEaHgFgn5MQa/lHrc0qNvmRAI1F38asHFzdp
	l/FiET0N/TGoKrpyBsoc/Xd6MdRwAagzUU74guCxhGl3HlBcuO9Lre+R/1P+hWL12zDQ
	th9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=OA7qJhP30jtA81LAbJqatBBLAeQp4C1nOSyaNxsmDrQ=;
	b=FDB+QaZTFZE8BSjV/UbaU80Ke32z0jOACZqUhoK3c5yywAIwFOCWU9TbnhznsUl+oX
	E/xHx/s6k1B4WtIFhDK54pWGZBP+5WcnhsVUE4wSjdQQNpN3P3w97S0EIiHwN/RIuaf/
	bH05is4WIdk6pkP8dYiM5cT1vleu1ecJ1bNQgWDYKM5R9v0Rt2TGEukWXNReIrvVGC/u
	C3+NjOTs9xL22t70JcphcK8Fd/NqRmTVgcgj9jsUOMnJLd0lW8kPsL5alJNk68Y01QvU
	HlRMwVYUg7FriQAq7Rpc8wRQM3/GOEJwVYp4Cmg8YPuC/yPeebqjs95O6WflV+aEq4aC
	yd4g==
X-Gm-Message-State: APjAAAUGHfmhTNmS2tO30ANOxMJ7/2KFn3CZegPw+BxEC9UUnrv4A+Mx
	bDBv1mt3HOT4lW2J/ARViNw=
X-Google-Smtp-Source: APXvYqx1k6doquzwIhw0lVlnNS4fnJyA90BhAq6bxqEL2U/FBiQrxf6R47jtXMvl7r+PZ+VCSnosyQ==
X-Received: by 2002:a6b:fd04:: with SMTP id c4mr10095232ioi.290.1552052772735; 
	Fri, 08 Mar 2019 05:46:12 -0800 (PST)
Received: from localhost.localdomain
	(CPEe8de27b71faa-CM64777d5e8820.cpe.net.cable.rogers.com.
	[174.116.254.195]) by smtp.gmail.com with ESMTPSA id
	b21sm3975957itd.37.2019.03.08.05.46.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 08 Mar 2019 05:46:12 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Date: Fri,  8 Mar 2019 08:46:10 -0500
Message-Id: <20190308134610.48557-1-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH v2] perf: synchronize unistd.h between libc-headers and perf source
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
X-List-Received-Date: Fri, 08 Mar 2019 13:46:12 -0000
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

v2:

As suggested by Martin, STAGING_INCDIR can be used instead of RECIPE_SYSROOT

 meta/recipes-kernel/perf/perf.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
index 9120766858..5acdcfb9f0 100644
--- a/meta/recipes-kernel/perf/perf.bb
+++ b/meta/recipes-kernel/perf/perf.bb
@@ -235,6 +235,10 @@ do_configure_prepend () {
     for s in `find ${S}/tools/perf/scripts/python/ -name '*.py'`; do
         sed -i 's,/usr/bin/python2,/usr/bin/env python,' "${s}"
     done
+
+    # unistd.h can be out of sync between libc-headers and the captured version in the perf source
+    # so we copy it from the sysroot unistd.h to the perf unistd.h
+    cp ${STAGING_INCDIR}/asm-generic/unistd.h ${S}/tools/include/uapi/asm-generic/unistd.h
 }
 
 python do_package_prepend() {
-- 
2.19.1


