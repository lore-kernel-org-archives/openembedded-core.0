Return-Path: <rehsack@gmail.com>
Received: from mail-wm0-f53.google.com (mail-wm0-f53.google.com [74.125.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id 1B06C79895
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Sep 2018 09:25:13 +0000 (UTC)
Received: by mail-wm0-f53.google.com with SMTP id j192-v6so5422010wmj.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Sep 2018 02:25:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id;
	bh=UZWbYJXcINnid4EK8/HcQB6ub1wmdh0fxNniFtMFh9U=;
	b=ER342TF8IAQ3A1QWFKbnWRgmxRAtgx9TusDGGsyzFmEDbh7TwYhos7lEsZqCJYAPtd
	NrvaPauTQ+ZwqZ0a7GnyHiZjyHN2LwOZYWwi+N5lr3L6JHJd+kHLbFk60+0h6BUVz1Z+
	Wmsz7HJW1Jjg2clES/LewR0y5cpTaSSlWeQGn8v5Cd4vk3pGxclBKc5KtZJLAa5IfMAo
	ugdWm72qtxgA1L3nUxTsOyRVB2t9DwCEZ1tStRtj87TU9Ofca487ZlaQOI1JPFxF7ynW
	yGtbAtw7trYTd1cuOsGD8KusBTENlqaJwV0fbNU1mWDpJqSBtgmb0FixNJxwiiR5OWET
	ed6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
	bh=UZWbYJXcINnid4EK8/HcQB6ub1wmdh0fxNniFtMFh9U=;
	b=kUYu/c7rddGeGFN02lrNlKYdRuKssOeU33hCeDVfFo5nPiaj/kNhFMWBbZBFRcJ/m1
	qsGMo+k7cTsY6MLHrt9svrmJGhgx8plD9PgTtuHD2l5cutnsUjTZhlRR+m34eneK96Ch
	eFZTMazwGCL2t7c3v3tmeaV/xSYlZrz10v5Tg7VOReG1y/gsndeEe7OFeN5dmxMp7AT5
	mGv9sVwNsuSmVHJzljoPQhhQMYhy8E+IuDPae4URuCITMnZU5vF2fHafWSgoCHtGH9L0
	PrgJGq8MvsCKzPNL0qh+w8I8gVM68/j0TFGRvxSSUdd/ws0+/Yh5VHCHT81XQO3a71bA
	rgZQ==
X-Gm-Message-State: APzg51BuJ5XFhb/7MkosI2nH0qM41OXJr5sGvhH+SaunVrEnKzuuM+zY
	UBcSC+6oTuGAgwjfMsz1A+0Ts1D6
X-Google-Smtp-Source: ANB0VdZ+nw9hiwAFBRcw8lQAz49zsZDXQLqTLjv/ojsfeUugXi8hQ3hhRV+CvAt22CZi1sm0zNmVsA==
X-Received: by 2002:a1c:cc0e:: with SMTP id h14-v6mr4727864wmb.2.1536830714453;
	Thu, 13 Sep 2018 02:25:14 -0700 (PDT)
Received: from beaker.muppets.liwing.de (b2b-78-94-80-58.unitymedia.biz.
	[78.94.80.58]) by smtp.gmail.com with ESMTPSA id
	34-v6sm4473474wra.20.2018.09.13.02.25.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 13 Sep 2018 02:25:13 -0700 (PDT)
Sender: Jens Rehsack <rehsack@gmail.com>
From: Jens Rehsack <sno@netbsd.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 13 Sep 2018 11:25:00 +0200
Message-Id: <20180913092500.1161-1-sno@netbsd.org>
X-Mailer: git-send-email 2.17.1
Cc: Jens Rehsack <sno@netbsd.org>, Igor Kreps <igork@miltenyibiotec.de>
Subject: [PATCH v3] coreutils: add alternative target for nice
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
X-List-Received-Date: Thu, 13 Sep 2018 09:25:14 -0000

Avoid coreutils conflicts with nice from other recipes, like
busybox - even if that's not enabled by default.
In situations, where coreutils is a dependency for -dev images
and small busybox nice is available always, it avoids extra
effort for coreutils for those users.

Signed-off-by: Jens Rehsack <sno@netbsd.org>
---
 meta/recipes-core/coreutils/coreutils_8.30.bb | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-core/coreutils/coreutils_8.30.bb b/meta/recipes-core/coreutils/coreutils_8.30.bb
index 053891f6ea..eb1dd2a93a 100644
--- a/meta/recipes-core/coreutils/coreutils_8.30.bb
+++ b/meta/recipes-core/coreutils/coreutils_8.30.bb
@@ -42,10 +42,10 @@ PACKAGECONFIG[acl] = "--enable-acl,--disable-acl,acl,"
 PACKAGECONFIG[xattr] = "--enable-xattr,--disable-xattr,attr,"
 PACKAGECONFIG[single-binary] = "--enable-single-binary,--disable-single-binary,,"
 
-# [ df mktemp base64 gets a special treatment and is not included in this
+# [ df mktemp nice base64 gets a special treatment and is not included in this
 bindir_progs = "arch basename chcon cksum comm csplit cut dir dircolors dirname du \
                 env expand expr factor fmt fold groups head hostid id install \
-                join link logname md5sum mkfifo nice nl nohup nproc od paste pathchk \
+                join link logname md5sum mkfifo nl nohup nproc od paste pathchk \
                 pinky pr printenv printf ptx readlink realpath runcon seq sha1sum sha224sum sha256sum \
                 sha384sum sha512sum shred shuf sort split stdbuf sum tac tail tee test timeout\
                 tr truncate tsort tty unexpand uniq unlink uptime users vdir wc who whoami yes"
@@ -77,7 +77,7 @@ do_install_class-native() {
 }
 
 do_install_append() {
-	for i in df mktemp base64; do mv ${D}${bindir}/$i ${D}${bindir}/$i.${BPN}; done
+	for i in df mktemp nice base64; do mv ${D}${bindir}/$i ${D}${bindir}/$i.${BPN}; done
 
 	install -d ${D}${base_bindir}
 	[ "${base_bindir}" != "${bindir}" ] && for i in ${base_bindir_progs}; do mv ${D}${bindir}/$i ${D}${base_bindir}/$i.${BPN}; done
@@ -96,8 +96,8 @@ inherit update-alternatives
 ALTERNATIVE_PRIORITY = "100"
 # Make hostname's priority higher than busybox but lower than net-tools
 ALTERNATIVE_PRIORITY[hostname] = "90"
-ALTERNATIVE_${PN} = "lbracket ${bindir_progs} ${base_bindir_progs} ${sbindir_progs} base64 mktemp df"
-ALTERNATIVE_${PN}-doc = "base64.1 mktemp.1 df.1 groups.1 kill.1 uptime.1 stat.1  hostname.1"
+ALTERNATIVE_${PN} = "lbracket ${bindir_progs} ${base_bindir_progs} ${sbindir_progs} base64 nice mktemp df"
+ALTERNATIVE_${PN}-doc = "base64.1 nice.1 mktemp.1 df.1 groups.1 kill.1 uptime.1 stat.1 hostname.1"
 
 ALTERNATIVE_LINK_NAME[hostname.1] = "${mandir}/man1/hostname.1"
 
@@ -113,6 +113,10 @@ ALTERNATIVE_LINK_NAME[df] = "${base_bindir}/df"
 ALTERNATIVE_TARGET[df] = "${bindir}/df.${BPN}"
 ALTERNATIVE_LINK_NAME[df.1] = "${mandir}/man1/df.1"
 
+ALTERNATIVE_LINK_NAME[nice] = "${base_bindir}/nice"
+ALTERNATIVE_TARGET[nice] = "${bindir}/nice.${BPN}"
+ALTERNATIVE_LINK_NAME[nice.1] = "${mandir}/man1/nice.1"
+
 ALTERNATIVE_LINK_NAME[lbracket] = "${bindir}/["
 ALTERNATIVE_TARGET[lbracket] = "${bindir}/lbracket.${BPN}"
 
-- 
2.17.1


