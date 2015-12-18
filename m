Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f54.google.com (mail-wm0-f54.google.com [74.125.82.54])
	by mail.openembedded.org (Postfix) with ESMTP id B69D86FF80
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Dec 2015 11:20:46 +0000 (UTC)
Received: by mail-wm0-f54.google.com with SMTP id l126so59800383wml.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Dec 2015 03:20:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=KXOJQXjePavFNEYTimDiI+Lp+B2KuwF0fyN69Lw3JMY=;
	b=uNhx+WunX9JQd9Kzf3q7pMG15VwBtKc+GAFLuofPLrn1aM03RxzlduI0pFPAJtG+Sz
	7gX1u1sH6BFWXcieUhFOiQR0l7i1rzt5UWRcdVH66r2L6Xot+02jIqfDiUWjkNq7KMCh
	ww1abG5n8g0HJdeSYwsDtr8LilOe+Eb3HA4BWUR0X33MpD4qQQNF7TaJh4+NZULi+xuc
	LPpJTM2hMQ/CsQA4HcJmi7xM8R3CBX5fWh/OkcSfYDNkoXq6VgN3Ct+YMkCN46e0/hNY
	G++uagtigBko+buuGOr3HnccZ0cfRF/YmGorliJ74pM5o9pj7AO1DjbCcj0knlHBfthA
	kQPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=KXOJQXjePavFNEYTimDiI+Lp+B2KuwF0fyN69Lw3JMY=;
	b=N/nbgvIgiBOW6cMxLLjiTwxJHiNlX9D+oTOHFLwtkPn5uRQHNB8rIZ0qcsQlKTTXP1
	CPvov0zs4MiNj/IXqNJW+ciELWf1BA3Ke5sI2EgLkp+4rv1S+SbjvGtPv0wBtVFOzZCW
	NzhMiE/BdcMxojzU2s1FVe6JIEk3zfvFZnGCuCyrxgM2SGmpkvxSskmlayd7yiDILi5p
	18QilBRiWid+UtY0dGa/fovcTch6ZqqUmo1ReSovStdT5LbJgKkFsAYQgZ8wish9f8mH
	lq+XQSVdoXJsSUV/lRjF3LLKF6MCSzYPKF1K1xgwhmLQYFS4B3t+MJ5c5kYyYW9oOTxc
	PbQA==
X-Gm-Message-State: ALoCoQmN2mK0dmW+w5cYZe40UK4JRAB3X7KuLXCH5DR6QPH2vSVajQWoPJIzXAP7PtGtuY4xZ4uyKPpzUUByNJc6sPNzVsbI/g==
X-Received: by 10.195.13.137 with SMTP id ey9mr3907772wjd.81.1450437646700;
	Fri, 18 Dec 2015 03:20:46 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	pn6sm14381484wjb.15.2015.12.18.03.20.45
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 18 Dec 2015 03:20:46 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 18 Dec 2015 11:20:41 +0000
Message-Id: <1450437641-2745-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.6.4
Subject: [PATCH] flex: fix native tool problems
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
X-List-Received-Date: Fri, 18 Dec 2015 11:20:48 -0000

Always depend on bison-native and flex-native, yacc is needed during the build
and a host flex is also needed to build flex (apart from for flex-native where
it can run itself, but this dependency will be automatically pruned).

Also instead of special-casing class-target builds when telling it where to find
a host flex, always pass the path to a sysroot flex apart from when building
flex-native.  This fixes the build of nativesdk-flex, which can't run the flex
it built.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-devtools/flex/flex.inc | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/flex/flex.inc b/meta/recipes-devtools/flex/flex.inc
index e23bb3d..7398b15 100644
--- a/meta/recipes-devtools/flex/flex.inc
+++ b/meta/recipes-devtools/flex/flex.inc
@@ -5,19 +5,20 @@ HOMEPAGE = "http://sourceforge.net/projects/flex/"
 
 SECTION = "devel"
 LICENSE = "BSD"
-DEPENDS_class-target += "bison-native flex-native"
+DEPENDS = "bison-native flex-native"
 
 UPSTREAM_CHECK_REGEX = "flex-(?P<pver>\d+(\.\d+)+)\.tar"
 
 inherit autotools gettext texinfo ptest
 
-
 M4 = "${bindir}/m4"
 M4_class-native = "${STAGING_BINDIR_NATIVE}/m4"
+FLEX = "${STAGING_BINDIR_NATIVE}/flex"
+FLEX_class-native = ""
 
 EXTRA_OECONF += "ac_cv_path_M4=${M4}"
 EXTRA_OEMAKE += "m4=${STAGING_BINDIR_NATIVE}/m4"
-EXTRA_OEMAKE_class-target += "FLEX=`which flex`"
+EXTRA_OEMAKE += "FLEX=${FLEX}"
 
 do_install_append_class-native() {
 	create_wrapper ${D}/${bindir}/flex M4=${M4}
-- 
2.6.4


