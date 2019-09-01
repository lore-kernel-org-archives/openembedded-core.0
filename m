Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com
	[209.85.214.173])
	by mail.openembedded.org (Postfix) with ESMTP id 0881D7F42E
	for <openembedded-core@lists.openembedded.org>;
	Sun,  1 Sep 2019 14:37:01 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id 4so5405632pld.10
	for <openembedded-core@lists.openembedded.org>;
	Sun, 01 Sep 2019 07:37:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=7VM1VjmPn7JQszkFYdQ5EHE43Qe0z5FGxwTCckbh4LQ=;
	b=jP2T+6+xvMm6fttoou15GyotyIuJShJ/oIiTxhZ0Kb6pFPihIDCXskIoebdouk58D5
	OSYYBIqD3jtSljm2feQ0oekN/QqgmOaAKvsJgJwg1CLSMcGE5nsw967tL+DSE6hH2TJD
	sTZdpvOwPo2yy58bDYinKbG7KiZ5lvmRHMLg0ThOWNtfqznkJw+2yWWWTH1DES3nWnDe
	Xm6NGw5ahi7AZzgLKBzluuIMeoeFY0br9hElRo0u1ClpUCRKT7DWMrC5CqUuNXmZslCd
	ilf+ocHhKhgpw1AQZ8SosFPLjWln2Q4wrVZtqhJo8ZUJrihi2SUjdmhYOh/2NGxidtq9
	GOrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=7VM1VjmPn7JQszkFYdQ5EHE43Qe0z5FGxwTCckbh4LQ=;
	b=G9HdgbF4T//lZp1dqcHJ50zIYzVn487wkNTT5vrEE65IS1fFnE4d/19hvjdfGCDEr3
	pRpMlSt8+yWMfBY9ZBm+dG2jomRAPG4nQKQCTS7IyErsFAB2OdpoYJVf17jnTU9T4LYu
	Q+pTblIwxRuLLoJb/gMKdPgW67sWzbkN/yi1tAZeLJOqKgEcjxcvh5ULt4BsRdtyEqp3
	DlJh+by+VV9wYiebeasLeUZeIdI5+Yi3S1KeugPmYFS2N4tpefxN5/xvo4Qw/Ma+k86H
	OGv1MFgi/cNQqD0ZWNuD1bBVn58QNQ4qxFuZP45k9V1PONr9/dGVlq3jDhZw3jBwbZzD
	QQtQ==
X-Gm-Message-State: APjAAAU93T82LI2aJeRkhvjqifeuLFbSkSLKHjH9iy6lgAq9ZvacCcTU
	VqLn7Qna72nSgYZ1lehgIYVFKjNz
X-Google-Smtp-Source: APXvYqzQEesod8wpjbqTxOdUvzwxMNt4o7YoTMZKVBsIzI8Dwv4AOrYLyk05tn47llJnX7tqQBcWAw==
X-Received: by 2002:a17:902:4d45:: with SMTP id
	o5mr25704612plh.146.1567348622083; 
	Sun, 01 Sep 2019 07:37:02 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:1d53:5246:e59:bfe9])
	by smtp.gmail.com with ESMTPSA id
	s16sm15911381pfs.6.2019.09.01.07.37.01
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 01 Sep 2019 07:37:01 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  1 Sep 2019 07:36:18 -0700
Message-Id: <2ed66891e3afed338740a73c0b7c0e6947f2ea77.1567348433.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1567348433.git.akuster808@gmail.com>
References: <cover.1567348433.git.akuster808@gmail.com>
Subject: [warrior 40/43] glibc-locale: Fix build error with PACKAGE_NO_GCONV = "1"
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
X-List-Received-Date: Sun, 01 Sep 2019 14:37:01 -0000

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


