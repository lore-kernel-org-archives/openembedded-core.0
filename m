Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f47.google.com (mail-wm0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id 0F81A6FF7B
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Dec 2015 19:57:50 +0000 (UTC)
Received: by wmec201 with SMTP id c201so43982868wme.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 Dec 2015 11:57:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=u/Zj5o2p25vvkm+R7iQ1Vd3U4EeKtqAjvdLQRWWOH1s=;
	b=IsVc8pjFZq3L1xND2ohMcVhTfPBRz+Lvw0vDnO3BMWK/yFZuvNvO6DQCN36OsQQD6F
	9IwJBC3bGFyUfbvONsE9Fgql2v/BIeRpDjLKDKh6pa+XNLHlfWf50yvzTZYrr9vAjZk5
	Yc3SN455B9a36pct231RKQ1bSRAk5fVQzH6rdoLVYe/cjX0Fsqj2sTGSqDHF3fszju/y
	rEXa1itu59KPo8pVQBT33I16a4nhEIsmoBIBEuTa1M9Oq8YZa3pKb1qS/QaABxWMTD9c
	QhKppKKiI4kyjJR/Z0wCoxIvMhEt6E48SMkFv/nuHlmC5NweeR+PR5+ZLZhToPO/PFE8
	VxMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=u/Zj5o2p25vvkm+R7iQ1Vd3U4EeKtqAjvdLQRWWOH1s=;
	b=lIsZl5RVbCZ3zmlEwoyvHaMPOt3zNI5OvDH6FiaTb7OLV7DH8Z6djfJNYaqMTfzV9W
	+xjF5CsNG6fZghys1JKj7FrD/HdRUomGDv8uLadeYBcdSc5AVutYUOiv4gezp/mebtZW
	tMLMnWKBEe/C2iYfYt8cHaHYYbALnr+smhgGws4HZ+SZ4kdbRpgwAXy9Ky3uKJG3+b/8
	CyPI4E64/Y4bNsKHfT+3axm+DdYim/YiPdxi3U8cei56xWC6mnO2Du7GTRnvBGPCdlHv
	aFhksrLDSnUPfR0w3RyLKX6rMpKFoEQUJC8ZpipdAmzFMBF5zIivSmGNe37Y60dtalX/
	0ruw==
X-Gm-Message-State: ALoCoQnCpRbiY2Gie2RSa+udCJwb7Fv9Hi4pLaK66BM+qYGQemWeJ0D96yGSBm5Q1AqqThw0zTxN
X-Received: by 10.28.140.211 with SMTP id o202mr521544wmd.8.1449172670951;
	Thu, 03 Dec 2015 11:57:50 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by smtp.gmail.com with ESMTPSA id i18sm431221wmf.6.2015.12.03.11.57.49
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 03 Dec 2015 11:57:50 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  3 Dec 2015 19:57:43 +0000
Message-Id: <1449172665-1343-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH 1/3] sudo: handle libexecdir != libdir/PN.
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
X-List-Received-Date: Thu, 03 Dec 2015 19:57:53 -0000

sudo has somewhat special file installation logic and installs the modules and
libraries to $libexecdir/sudo, with special handling for the case when
libexecdir already contains /sudo (which it does by default in current oe-core
where libexecdir=$libdir/$PN).

As setting libexecdir to /usr/libexec should work, add both possibilities to
FILES to be sure the right files are captured, and add INSANE_SKIP for the
libdir warning that libraries are outside of /usr/lib/ (arguably, this should be
fixed in insane).

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-extended/sudo/sudo.inc         | 5 +++++
 meta/recipes-extended/sudo/sudo_1.8.14p3.bb | 3 ++-
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-extended/sudo/sudo.inc b/meta/recipes-extended/sudo/sudo.inc
index a25876b..48ed436 100644
--- a/meta/recipes-extended/sudo/sudo.inc
+++ b/meta/recipes-extended/sudo/sudo.inc
@@ -38,3 +38,8 @@ do_compile_prepend () {
 do_install_prepend (){
 	mkdir -p ${D}/${localstatedir}/lib
 }
+
+# Sudo insists on putting libraries into libexecdir
+INSANE_SKIP_${PN} += "libdir"
+INSANE_SKIP_${PN}-dev += "libdir"
+INSANE_SKIP_${PN}-dbg += "libdir"
diff --git a/meta/recipes-extended/sudo/sudo_1.8.14p3.bb b/meta/recipes-extended/sudo/sudo_1.8.14p3.bb
index b93112f..4db85e2 100644
--- a/meta/recipes-extended/sudo/sudo_1.8.14p3.bb
+++ b/meta/recipes-extended/sudo/sudo_1.8.14p3.bb
@@ -33,4 +33,5 @@ do_install_append () {
 }
 
 FILES_${PN} += "${libdir}/tmpfiles.d"
-FILES_${PN}-dev += "${libdir}/${BPN}/lib*${SOLIBSDEV} ${libdir}/${BPN}/*.la"
+FILES_${PN}-dev += "${libexecdir}/${BPN}/lib*${SOLIBSDEV} ${libexecdir}/${BPN}/*.la \
+                    ${libexecdir}/lib*${SOLIBSDEV} ${libexecdir}/*.la"
-- 
2.1.4


