Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
	[209.85.214.170])
	by mail.openembedded.org (Postfix) with ESMTP id F3D677F2B6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Sep 2019 02:50:12 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id 4so263906pld.10
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Sep 2019 19:50:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=7VM1VjmPn7JQszkFYdQ5EHE43Qe0z5FGxwTCckbh4LQ=;
	b=VYAj7iv1S04ItzvKOz1TyDcY/hubzNbHUxo5n/GybTc3d5casin7PsYEMtO9PVgxKv
	ZoBjqP4wT7vCUql4YqZrkoL+GKIXpPQPXsqXNCg+rzbCD3gTxKkSwDQqTxlVqqfr2b8Q
	NJRiVo/xDQQmCUaQQ6uEpD3a4Y4aC3sxd4ewP1vn4eO/qYu/G1hIe6FqAB6UrynCyW3R
	i5+vGxxN+sC2TA1rqx9/aeS4avk1jJaWqNFlz/dpa+ujfpG6vEWzuPb/EMTkeYlAK3ll
	ytkCTSjPk9PqkZGJMuM6aH9Fa7ejX8SYoabmEi671iS5cobF+ou2Gk0lBIbql7/RE5B2
	il/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=7VM1VjmPn7JQszkFYdQ5EHE43Qe0z5FGxwTCckbh4LQ=;
	b=DwwxZ6lehWtHNq6l4D4O5LD5DQZo1Am/nYKzlPOEkpvNzE409oa8PDRrOekaskX0lA
	g9bdq2l1fskSpHCEEhTHLwZQ82MlHtGcYphbaq0Uw9E8mKbfKt4TE5RvAHZ/XcsLhT7N
	n2pEBJWYxQgA/V3Nfk68MIDx13nwkbcnJsvfR8vV5Q8zAWu2zms7AagX5RdsWGZ5/0Y8
	W3+E74xZiqUbIeLGdTy7YkTNER2o5306oMup6ZVdtCHSd99MsF/DarLRj3mwGe1d7SC/
	p4hghPVU2AXUIhyro9ksvzbTAS89aqjSzco5FsgDSefckSbXQ/iCAXw4dNJSL1KyrWMm
	4Myg==
X-Gm-Message-State: APjAAAV0M1CanE84jl6TDfbzE+XutSSSDkgpEJU049x0Vbb8BBF2i6jc
	KF4V3zgP2AbgrLnqDYoJ1a/0NDRMpok=
X-Google-Smtp-Source: APXvYqwZq0XWILy0jO0SZxIxzfQhXBtBmEq8q6hLHEz9IVUW1/M8lJw3XzC15aHJ3SXN3hE9RILckA==
X-Received: by 2002:a17:902:b704:: with SMTP id
	d4mr486401pls.204.1569293414017; 
	Mon, 23 Sep 2019 19:50:14 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:ec07:55c0:9c8c:b3de])
	by smtp.gmail.com with ESMTPSA id
	q204sm146791pfc.11.2019.09.23.19.50.13
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 23 Sep 2019 19:50:13 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Sep 2019 19:49:20 -0700
Message-Id: <2ed66891e3afed338740a73c0b7c0e6947f2ea77.1569292053.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1569292053.git.akuster808@gmail.com>
References: <cover.1569292053.git.akuster808@gmail.com>
Subject: [warrior][ 40/50] glibc-locale: Fix build error with PACKAGE_NO_GCONV = "1"
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
X-List-Received-Date: Tue, 24 Sep 2019 02:50:13 -0000

From: Jason Wessel <jason.wessel@windriver.com>

When the PACKAGE_NO_GCONV is set to 1 an empty directory is left behind from the do_install rule:

=====
ERROR: glibc-locale-2.29-r0 do_package: QA Issue: glibc-locale: Files/directories were installed but not shipped in any package:
  /usr/lib
  /usr/lib/locale
Please set FILES such that these items are packaged. Alternatively if they are unneeded, avoid installing them or delete them within do_install.
glibc-locale: 2 installed and not shipped files. [installed-vs-shipped]
ERROR: glibc-locale-2.29-r0 do_package: Fatal QA errors found, failing task.
=====

The simple fix is to prune the empty directory.

Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-core/glibc/glibc-locale.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-core/glibc/glibc-locale.inc b/meta/recipes-core/glibc/glibc-locale.inc
index a985d26..17f5b78 100644
--- a/meta/recipes-core/glibc/glibc-locale.inc
+++ b/meta/recipes-core/glibc/glibc-locale.inc
@@ -89,6 +89,9 @@ do_install() {
 	if [ ${PACKAGE_NO_GCONV} -eq 0 ]; then
 		copy_locale_files ${libdir}/gconv 0755
 		copy_locale_files ${datadir}/i18n 0644
+	else
+		# Remove the libdir if it is empty when gconv is not copied
+		find ${D}${libdir} -type d -empty -delete
 	fi
 	copy_locale_files ${datadir}/locale 0644
 	install -m 0644 ${LOCALETREESRC}/SUPPORTED ${WORKDIR}/SUPPORTED
-- 
2.7.4


