Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id 7E9A07E3AA
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Oct 2019 14:29:57 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id f22so3511785wmc.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 01 Oct 2019 07:29:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=lUR5cd//XSCaB25Jz+ep5/LdvQ+8ETD9eyBIzKHXS/U=;
	b=PjpdErSYCbX8YvGG6+34hKJZ5do1qkaRB6ruXTJ4UwJ1DSz8C1LlbEWnzRSD1fwxJl
	Rzl2Z4v/9A3jZvRPtJg7DW/TPWpOkkax3pDpudHC+p6I3rm6lHnki33FRV9SlYljxAlW
	VZPPtT8Td5fYSgYHsuYW5e1lU0j+x6iKgq06niYN2jo/8nugHugaBPLH98uAFKnIECK5
	AIVidLEGM5fQbq8oJyO9uyihDvjjkXBcbmIXoTdumtY18i0BzsZjakS+VuNZ5VNUsOIP
	LzxhgC3jDaWi4gbSbngYnzZbM2z+OxhuExgb7F+LHx9+dKdKz2qzAWNN1VGxQli20Dui
	vW0w==
X-Gm-Message-State: APjAAAU0CLwTZU1wHixMM5iKbocdGCgOOVZcajBdCqQNaCs7P1u52qYT
	IvuwEsgx37xEPDfgwITZD7b2TOdk
X-Google-Smtp-Source: APXvYqyCzJjRVh+y7KS397qCLZq8YlTAxCAQSGqXkeWDo2ViATJFaHyjfhDWFd/4SRXDDhex73rGgg==
X-Received: by 2002:a05:600c:2386:: with SMTP id
	m6mr4160383wma.164.1569940197945; 
	Tue, 01 Oct 2019 07:29:57 -0700 (PDT)
Received: from 1aq-andre.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	z1sm32693448wre.40.2019.10.01.07.29.56
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 01 Oct 2019 07:29:57 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Tue,  1 Oct 2019 15:29:56 +0100
Message-Id: <20191001142956.39512-1-git@andred.net>
X-Mailer: git-send-email 2.23.0.rc1
In-Reply-To: <20191001095452.37335-5-git@andred.net>
References: <20191001095452.37335-5-git@andred.net>
MIME-Version: 1.0
Subject: [PATCH] ruby: some ptest fixes
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
X-List-Received-Date: Tue, 01 Oct 2019 14:29:57 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: André Draszik <andre.draszik@jci.com>

* the (new?) ruby expects some additional compiled libraries
  to run, so we need to copy them as part of ptest.
  Fixes errors like:
  # ruby ./runner.rb ./-ext-/vm/test_at_exit.rb
  Run options:

  # Running tests:

  [1/1] TestVM#test_at_exit = 0.06 s
    1) Failure:
  TestVM#test_at_exit [/usr/lib/ruby/ptest/test/-ext-/vm/test_at_exit.rb:7]:

  1. [1/2] Assertion for "stdout"
     | <["begin", "end"]> expected but was
     | <[]>.

  2. [2/2] Assertion for "stderr"
     | <[]> expected but was
     | <["-:1:in `require': cannot load such file -- -test-/vm/at_exit (LoadError)",
     |  "\tfrom -:1:in `<main>'"]>.

* the 'erb' test can't find the erb binary, as we're not
  running this from within the build directory

Signed-off-by: André Draszik <andre.draszik@jci.com>
---
 meta/recipes-devtools/ruby/ruby_2.6.4.bb | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/ruby/ruby_2.6.4.bb b/meta/recipes-devtools/ruby/ruby_2.6.4.bb
index 4554487c0a..fb202b8f1f 100644
--- a/meta/recipes-devtools/ruby/ruby_2.6.4.bb
+++ b/meta/recipes-devtools/ruby/ruby_2.6.4.bb
@@ -44,6 +44,14 @@ do_install_append_class-target () {
 
 do_install_ptest () {
     cp -rf ${S}/test ${D}${PTEST_PATH}/
+    # install test-binaries
+    find $(find ./.ext -path '*/-test-') -name '*.so' -print0 \
+        | tar --no-recursion --null -T - --no-same-owner --preserve-permissions -cf - \
+        | tar -C ${D}${libdir}/ruby/${SHRT_VER}.0/ --no-same-owner --preserve-permissions --strip-components=2 -xf -
+    # adjust path to not assume build directory layout
+    sed -e 's|File.expand_path(.*\.\./bin/erb[^)]*|File.expand_path("${bindir}/erb"|g' \
+        -i ${D}${PTEST_PATH}/test/erb/test_erb_command.rb
+
     cp -r ${S}/include ${D}/${libdir}/ruby/
     test_case_rb=`grep rubygems/test_case.rb ${B}/.installed.list`
     sed -i -e 's:../../../test/:../../../ptest/test/:g' ${D}/$test_case_rb
@@ -61,6 +69,9 @@ FILES_${PN}-rdoc += "${libdir}/ruby/*/rdoc ${bindir}/rdoc"
 
 FILES_${PN} += "${datadir}/rubygems"
 
-FILES_${PN}-ptest_append_class-target += "${libdir}/ruby/include"
+FILES_${PN}-ptest_append_class-target = "\
+    ${libdir}/ruby/include \
+    ${libdir}/ruby/${SHRT_VER}.0/*/-test- \
+"
 
 BBCLASSEXTEND = "native"
-- 
2.23.0.rc1


