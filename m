Received: from mailrelay2-2.pub.mailoutpod1-cph3.one.com (mailrelay2-2.pub.mailoutpod1-cph3.one.com [46.30.212.1])
 by mx.groups.io with SMTP id smtpd.web12.5246.1600198399334953832
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Sep 2020 12:33:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@berginkonsult.se header.s=20191106 header.b=eIwMq6MP;
 spf=none, err=permanent DNS error (domain: berginkonsult.se, ip: 46.30.212.1, mailfrom: peter@berginkonsult.se)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=berginkonsult.se; s=20191106;
	h=content-transfer-encoding:mime-version:message-id:date:subject:cc:to:from:
	 from;
	bh=1XmKN7She5uPdGQmg4EyZh0a+vOcxR+gQdFnT7kqQ1g=;
	b=eIwMq6MP8D0xv+bi4vuxh4+/kxBf3B5ndp4yCFYah6crLhsl7nK2OGkQkLISVJQNuildlFvZERE04
	 VIiBobOIe2EIuj87Yh5X27noagJe8q4ssLrU3rCIB0KDa0hiKmflLpwpHtMdJKXpTFqDXE/tLqayvh
	 y8o/427u6krFC0XQbafbpMc8RXHRuLjDtWqEnrMFoYRf3O/jdrRAOwa3WS0CCeG/JqcdlBVBDXxjWc
	 Dllb5+U+3uB/+gUiBaPd3tPeBZa39M5NHa0nflwx450jOZ9AOVMqr/DyoY7DpR4nHadYZtAjmSXaG8
	 na+wEmgL1DMhcsZA9dWHvBtxJhpNY1w==
X-HalOne-Cookie: 286267ed19257a07b1daeda80e80d34a4c3b68bd
X-HalOne-ID: 4ad633ae-f78a-11ea-84a6-d0431ea8a290
Received: from localhost.localdomain (c188-151-59-206.bredband.comhem.se [188.151.59.206])
	by mailrelay2.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
	id 4ad633ae-f78a-11ea-84a6-d0431ea8a290;
	Tue, 15 Sep 2020 19:33:16 +0000 (UTC)
From: "Peter Bergin" <peter@berginkonsult.se>
To: openembedded-core@lists.openembedded.org
Cc: Peter Bergin <peter@berginkonsult.se>
Subject: [PATCH] systemd: avoid failing if no udev rules provided
Date: Tue, 15 Sep 2020 21:33:05 +0200
Message-Id: <20200915193305.1950606-1-peter@berginkonsult.se>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In the case when no udev rules are provided by the recipe the do_install
step of systemd is failing with:

    install: cannot stat '<WORKDIR>/*.rules': No such file or directory

By default the systemd recipe provides touchscreen.rules but in the
case this is unwanted on target the install step fails. This solution
is dynamic and search for *.rules files in $WORKDIR. If found they are
installed.

Signed-off-by: Peter Bergin <peter@berginkonsult.se>
---
 meta/recipes-core/systemd/systemd_246.2.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd_246.2.bb b/meta/recipes-core/systemd/systemd_246.2.bb
index 238cd4741f..af10e4212b 100644
--- a/meta/recipes-core/systemd/systemd_246.2.bb
+++ b/meta/recipes-core/systemd/systemd_246.2.bb
@@ -232,7 +232,9 @@ do_install() {
 
 	install -d ${D}${sysconfdir}/udev/rules.d/
 	install -d ${D}${sysconfdir}/tmpfiles.d
-	install -m 0644 ${WORKDIR}/*.rules ${D}${sysconfdir}/udev/rules.d/
+	for rule in $(find ${WORKDIR} -maxdepth 1 -type f -name "*.rules"); do
+		install -m 0644 $rule ${D}${sysconfdir}/udev/rules.d/
+	done
 
 	install -m 0644 ${WORKDIR}/00-create-volatile.conf ${D}${sysconfdir}/tmpfiles.d/
 
-- 
2.25.1

