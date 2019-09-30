Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
	[209.85.214.174])
	by mail.openembedded.org (Postfix) with ESMTP id 6E2A671BEE
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Sep 2019 04:48:33 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id d22so3414345pls.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Sep 2019 21:48:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=7VM1VjmPn7JQszkFYdQ5EHE43Qe0z5FGxwTCckbh4LQ=;
	b=bn8E4+2ia0Gf6Tv3duXkseGbxHKF5DABgsWvK3fCJqeCrGCVoqQwoHSvkWmA0LvTlD
	0dw9WBwxURjKl5KpMUNZ2ApYpqp1gfw0yYSBeojysZAt3N0ndzwDWqOz212qRkcFOHx6
	fHzDjghP6/0T4UWMwKIyOkVDUqnyYdqAalQTrpjDexpxtN5vT9yRFWtEqCFoAn9BeDIi
	tG2PNxiU4T45RUQsvrE4O1wX/Ux6fg/PrHnFRknu2PGCPVm9Xf5zLBNkGzLU1T1RQX34
	3CjKVpBVO4wlF2PgMwPYnufbu9v9sz+nAac66M69H7jPBqyJfo9yw50K3i8twh3X74xC
	Uy9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=7VM1VjmPn7JQszkFYdQ5EHE43Qe0z5FGxwTCckbh4LQ=;
	b=R8K4ZRaXTmwVHCPGxlilz2WH04t2b/VKV6aiDtiZHNziGyBJsCbUCH8+yB6Fevrlwv
	w1w9jPspURqRHMMFV+XlKHQH/MUFXr6Y5AJJbqPEIECnzOBQqh24PyzDf6cd7tNoce92
	hfaxni2QzjR8z1pd7O7vCHRf2a9bIuKoxDDY9g9ZSwMS47mLl/DSRexiVTUO02r2qLzj
	0Ru/jqhGp83dYZrsABv1LclU/tHOrfCeqtkZ1vdYp1be3QisinyA3qF6eF4p77exzcwM
	5CeQVolmV+5JyUGMhxs0syEkAnYTzgeZja+eOSWk2YjLyYotPh/hgzPRy9d3cmeJICdd
	iJ2Q==
X-Gm-Message-State: APjAAAVjZAkrmeAks3loPQmRJMNnwFqBRs4juHJjCFKWTfmNOKLL8ERV
	zt3nMw+NHy0CneA5m/sO3XjLnXXKUQA=
X-Google-Smtp-Source: APXvYqwJ2vUV8tyMgHVme24jd6Zies9K+Dh+VsZB3c2ACSfSaDHa+qvd0U+bBfsx0mNJAIRXcWyRDg==
X-Received: by 2002:a17:902:9308:: with SMTP id
	bc8mr17160796plb.73.1569818914243; 
	Sun, 29 Sep 2019 21:48:34 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:a5c0:edf9:811d:ad92:85c2])
	by smtp.gmail.com with ESMTPSA id
	h15sm18888493pgn.76.2019.09.29.21.48.32
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 29 Sep 2019 21:48:32 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 29 Sep 2019 21:47:34 -0700
Message-Id: <f7a581264d0f73f0951253a887e380326ffd6180.1569818533.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1569818533.git.akuster808@gmail.com>
References: <cover.1569818533.git.akuster808@gmail.com>
Subject: [warrior-next 39/54] glibc-locale: Fix build error with PACKAGE_NO_GCONV = "1"
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
X-List-Received-Date: Mon, 30 Sep 2019 04:48:33 -0000

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


