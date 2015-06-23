Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f170.google.com (mail-wi0-f170.google.com
	[209.85.212.170])
	by mail.openembedded.org (Postfix) with ESMTP id 9AB0B758E1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jun 2015 14:35:26 +0000 (UTC)
Received: by wiga1 with SMTP id a1so108381861wig.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jun 2015 07:35:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=waoIUF1jX37PGUmYUAJiEi1d+VQXKSD4viuDIQJKi7c=;
	b=WsjIgmfgpVW1OGJjVjr5+74nFkMSH7PRLTZIXJgVXWGw9/ny1dzAewTnLah/9QlGWv
	fAsiiexsYnFYpTAZSUUW8Tiu79kaO7i44iXcqk7YKGCsfStT0mWvK1iSe0OIKN4M8Qbi
	09IWFRRWV5OB17WJb0dul8LZNypCU3h0gc4lh5H6HADdOwN2I8GQqryT0VjiY3uL5luY
	bXjBaQh79JX/ZF6YE7W/fEBMyWsYhT3OdNVnCqQM9IAVHfV/r57X3xtwtz/Bqj7EOHgj
	nri4TjwwjobrZY9FhLwuw8yd+JXn8mz4DE62p66jdSZf0YWtJ2GyEkUH/x7kc+viTXOq
	pysg==
X-Gm-Message-State: ALoCoQnh4Fu4NSZ14AM1u1y2g0b0kAvzbXmxJux5VLHDcKkicDC+Io3NoVRI1fMw+/8BsFtOxzll
X-Received: by 10.194.209.130 with SMTP id mm2mr59812716wjc.64.1435070127033; 
	Tue, 23 Jun 2015 07:35:27 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by mx.google.com with ESMTPSA id z9sm12982900wiv.9.2015.06.23.07.35.25
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 23 Jun 2015 07:35:26 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 23 Jun 2015 15:30:07 +0100
Message-Id: <1435069807-13557-7-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1435069807-13557-1-git-send-email-ross.burton@intel.com>
References: <1435069807-13557-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 6/6] sudo: fix libdir/libexecdir confusion
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
X-List-Received-Date: Tue, 23 Jun 2015 14:35:28 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-extended/sudo/sudo.inc       | 3 +++
 meta/recipes-extended/sudo/sudo_1.8.13.bb | 2 +-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-extended/sudo/sudo.inc b/meta/recipes-extended/sudo/sudo.inc
index cdee6bb..0da30e2 100644
--- a/meta/recipes-extended/sudo/sudo.inc
+++ b/meta/recipes-extended/sudo/sudo.inc
@@ -37,3 +37,6 @@ do_compile_prepend () {
 do_install_prepend (){
 	mkdir -p ${D}/${localstatedir}/lib
 }
+
+# Sudo insists on putting libraries into libexecdir
+INSANE_SKIP = "libdir"
diff --git a/meta/recipes-extended/sudo/sudo_1.8.13.bb b/meta/recipes-extended/sudo/sudo_1.8.13.bb
index 4494170..b68863d 100644
--- a/meta/recipes-extended/sudo/sudo_1.8.13.bb
+++ b/meta/recipes-extended/sudo/sudo_1.8.13.bb
@@ -26,4 +26,4 @@ do_install_append () {
 	rmdir -p --ignore-fail-on-non-empty ${D}${localstatedir}/run/sudo
 }
 
-FILES_${PN}-dev += "${libdir}/${BPN}/lib*${SOLIBSDEV} ${libdir}/${BPN}/*.la"
+FILES_${PN}-dev += "${libexecdir}/${BPN}/lib*${SOLIBSDEV} ${libexecdir}/${BPN}/*.la"
-- 
2.1.4


