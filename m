Return-Path: <ptsneves@gmail.com>
Received: from mail-lf0-f66.google.com (mail-lf0-f66.google.com
	[209.85.215.66])
	by mail.openembedded.org (Postfix) with ESMTP id 0980F755A7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jun 2018 20:21:26 +0000 (UTC)
Received: by mail-lf0-f66.google.com with SMTP id g21-v6so1462980lfb.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jun 2018 13:21:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=r03gfmNQ15kx1jOsVzohEyfZ+BwFlsL2MD97gRRjqRg=;
	b=HMoI48s/zlGQA2r2BPWehhITZg8bp/wA5gL9tPCdl8mB1ezj2Qy9a0OwIf7CJHhy8Q
	TVkAQBJi664ngmLEmHvfW3Y6YLAE4JX1W/XFBD9AkYmbYLnqI8ZOpuqzB4ghHPzt39wb
	p/OIGrvEFLRrPQX1pqbkpQggsNHs1iwEiZIKDNykDV4O0BNcgTjhzDHCKt+iIDsx7q9J
	7Ft/FoHoP3axM3zueRzPQ8+xP5yVurp+POihB7MVIqjVY7X7mnkz+5iJrYL2H0i+zDtP
	XtoH1x6LyKv/X0eQ7eD+Uj3S5EWmpROqkEeIqac0wMyz8ysF9uqWiXYhMkGiggoBX2uP
	HqHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=r03gfmNQ15kx1jOsVzohEyfZ+BwFlsL2MD97gRRjqRg=;
	b=N8+xzsApP058ShNKglDbYVWme8CjLTlDQ2rd92F/f7/FBUyGLkv/65FdAibhnisZI2
	DJAPdJf4F3L5n8odfbBhG+RJgH0APPm4cycXEUF+uFneEKkQAhG2g9+Z9U+X29O62nm+
	e6b2C2KJnkgFgt0ovwEc5RVxaAaOcwcQcqACZOCyOUKTaHHOGvIBRRTOS2VPpK5m71OB
	MyN7lA0vbBw6lFi/4kT4jJHOYBU5VFrgDmwpWhCMoLCi8aXR9y83lqYYp3dJzBtZJioa
	8X00CYdIHP7o5cCldYTY1qm6uraqO6L3hgeBDJgphwPIhLzvmTrKVEr2Jj+zHRQsFcp9
	ocwg==
X-Gm-Message-State: APt69E1ZJDWKiHzUN2X7jnJCtyfOAJvbxBPw1orKAVeh4X+aDeV4dgb1
	nIlhrkach/wKUOzskJE6Mh1gj5c=
X-Google-Smtp-Source: ADUXVKIoW7cNBgORAH2HFxVdyumDAUwvCzgwYjfQeB2X58AOA4yf2dbL8dzk3HoD0C2lZmC3HH6Amw==
X-Received: by 2002:a2e:5d81:: with SMTP id
	v1-v6mr11920180lje.137.1529439687300; 
	Tue, 19 Jun 2018 13:21:27 -0700 (PDT)
Received: from pneves.access.nsn.com ([78.10.208.103])
	by smtp.gmail.com with ESMTPSA id
	e42-v6sm93027lfi.18.2018.06.19.13.21.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 19 Jun 2018 13:21:26 -0700 (PDT)
From: Paulo Neves <ptsneves@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Jun 2018 22:20:29 +0200
Message-Id: <20180619202029.5338-1-ptsneves@gmail.com>
X-Mailer: git-send-email 2.14.1
Subject: [meta-oe][PATCH] meson-with-tests: Allows for build time tests of meson
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
X-List-Received-Date: Tue, 19 Jun 2018 20:21:27 -0000

meson build system has the functionality of setting
an executable wrapper to run cross-compiled
binaries. The setting is called exe_wrapper and can
be defined in the meson.cross file. With a valid
exe_wrapper meson build system can test if the built
binary is sane.

Another advantage of setting exe_wrapper setting
is that we can run the tests defined in the meson
build system. This way if this class is inherited
not only are the default targets built, their tests
will also run and have an opportunity to fail the
the build at the recipe level if necessary.

The user of this class should not inherit meson
directly but leave it to this class. This class
may later be merged into meson.bbclass itself.

Signed-off-by: Paulo Neves <ptsneves@gmail.com>
---
 meta/classes/meson-with-tests.bbclass | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)
 create mode 100644 meta/classes/meson-with-tests.bbclass

diff --git a/meta/classes/meson-with-tests.bbclass b/meta/classes/meson-with-tests.bbclass
new file mode 100644
index 0000000000..ddaeebc726
--- /dev/null
+++ b/meta/classes/meson-with-tests.bbclass
@@ -0,0 +1,26 @@
+inherit meson
+
+DEPENDS_append += "qemu-native"
+
+do_write_config_append() {
+  #You need to pass qemu with the sysroot path
+  #arguments, but internally meson uses Popen
+  #so we could try lists of arguments
+  #While passing a list directly in the exe_wrapper
+  #parameter passes the sanity test, it later on
+  #fails in the actual test run with:
+  #TypeError: expect bytes or str, not list
+  #So we create an in here wrapper.
+  cat > ${WORKDIR}/meson_exe_wrapper.sh << EOF
+#!/bin/sh
+qemu-${TARGET_ARCH} -L ${RECIPE_SYSROOT} \$@
+EOF
+
+  chmod u+x ${WORKDIR}/meson_exe_wrapper.sh
+
+  sed "/binaries/a\exe_wrapper = '${WORKDIR}/meson_exe_wrapper.sh'" -i ${WORKDIR}/meson.cross
+}
+
+do_compile_append() {
+  ninja test
+}
-- 
2.14.1


