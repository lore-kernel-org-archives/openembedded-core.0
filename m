Return-Path: <jpewhacker@gmail.com>
Received: from mail-il1-f194.google.com (mail-il1-f194.google.com
	[209.85.166.194])
	by mail.openembedded.org (Postfix) with ESMTP id 20D566C0ED
	for <openembedded-core@lists.openembedded.org>;
	Sun,  8 Dec 2019 20:18:51 +0000 (UTC)
Received: by mail-il1-f194.google.com with SMTP id t17so10825127ilm.13
	for <openembedded-core@lists.openembedded.org>;
	Sun, 08 Dec 2019 12:18:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=AIEw2dJYaxRJ+N3iEUq56wlfgk1hYTyTpK6mcw4ZBuA=;
	b=XW6+OejgnRwHwiol+et7kLhiZaMYChHPvsKJ1RrYb8suw9jsYiK7DhwNVQSjzqe0y1
	rjpFCQslmowiRNy4k84iDvk+4oZzhzlVyH2ZsuxZmPu97JUFYhj2aVOUWHqQqew1WxzE
	bnAlN/qT52RWE9Aq2nvncf1TaoPnAzNjBirBdSGX0Gwi8AapTuoDWdjtZWVHUlY1W+9E
	6vEq7paDTGnofCYEyaOUQoYGWvaYBzdYfGTpJ4iApfdueHv9TOFVLMkqDtqYzwrQyhbb
	kDflXkrQlLRoPbPWYKxqxKnDj/a0FcSr86WpRE19n2znaVb0RynCdrzPW4E63t5ummEv
	9pBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=AIEw2dJYaxRJ+N3iEUq56wlfgk1hYTyTpK6mcw4ZBuA=;
	b=ejeOiCAmcutHChIToWL8WBWdv1746aounp+tMRv8edaX0+Aow75+TNZIhGh7UosDVI
	fLOnAne8diXDOg6BeBv3lypsb6y91art1sIg5SA5nb3csljvsn591wzNRLB67zKwnInN
	n1FYyuVWTY5DhOKt9cyDiNhjvI1emoHgVhBpkSlVX7Vid6NgozELChoaug3yAaP1dh81
	VlUlSfv3+wI6LOYcCLAsiwSpxYebVbUtVXSuK7Da/aFq9Vvvjgkz76Z2HLXlxHCeMiOV
	fAceasSlGIZvYULWJkNowJk7tP0A5VwsXy4g0CxGa0jkX3jqNspm0aqyc46J+9cwo9uk
	bwvg==
X-Gm-Message-State: APjAAAUwUznqad1cCFlMxtzh/9s0PlTbHqAgooVWLY4LbPsXCWw5bM7f
	sesB6TC/XOlQt+H1i94JJ8m+dvn2r0c=
X-Google-Smtp-Source: APXvYqz7QNNIaE23Doi/6jkIniMPlB4uNsYiHk7n0LOIUL5yQQoY3parRndbQzZ6oF5i8Mcyibu4pQ==
X-Received: by 2002:a92:8311:: with SMTP id f17mr25972376ild.82.1575836332685; 
	Sun, 08 Dec 2019 12:18:52 -0800 (PST)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.gmail.com with ESMTPSA id k7sm6072852ilg.49.2019.12.08.12.18.51
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 08 Dec 2019 12:18:52 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  8 Dec 2019 14:18:48 -0600
Message-Id: <20191208201848.4119958-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Subject: [PATCH] flex: Replace uninative loader path
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
X-List-Received-Date: Sun, 08 Dec 2019 20:18:52 -0000
Content-Transfer-Encoding: 8bit

The Makefile used for flex-ptest can pick up the path to the uninative
loader through BUILD_LDFLAGS. This includes the full path to the
uninative loader, which is not reproducible. Replace it with /bin/false.
It doesn't appear as if these native programs are used in the test
suites and if there are likely to be other problems related to building
them using the BUILD_* flags.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/recipes-devtools/flex/flex_2.6.4.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-devtools/flex/flex_2.6.4.bb b/meta/recipes-devtools/flex/flex_2.6.4.bb
index d8e2f7f28c2..43b2547fc69 100644
--- a/meta/recipes-devtools/flex/flex_2.6.4.bb
+++ b/meta/recipes-devtools/flex/flex_2.6.4.bb
@@ -64,8 +64,13 @@ do_install_ptest() {
 	    -e 's:${BASE_WORKDIR}/${MULTIMACH_TARGET_SYS}::g' \-e 's/^Makefile:/_Makefile:/' \
 	    -e 's/^srcdir = \(.*\)/srcdir = ./' -e 's/^top_srcdir = \(.*\)/top_srcdir = ./' \
 	    -e 's/^builddir = \(.*\)/builddir = ./' -e 's/^top_builddir = \(.*\)/top_builddir = ./' \
+	    -e 's:${UNINATIVE_LOADER}:${base_bindir}/false:g' \
 	    -i ${D}${PTEST_PATH}/Makefile
 }
+# The uninative loader is different on i386 & x86_64 hosts. Since it is only
+# being replaced with /bin/false anyway, it doesn't need to be part of the task
+# hash
+do_install_ptest[vardepsexclude] += "UNINATIVE_LOADER"
 
 # Not Apache Flex, or Adobe Flex, or IBM Flex.
 CVE_PRODUCT = "flex_project:flex"
-- 
2.23.0


