Received: from mailrelay1-2.pub.mailoutpod1-cph3.one.com (mailrelay1-2.pub.mailoutpod1-cph3.one.com [46.30.212.0])
 by mx.groups.io with SMTP id smtpd.web11.8314.1631277363591506341
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Sep 2021 05:36:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@berginkonsult.se header.s=20191106 header.b=SsPXlWAZ;
 spf=none, err=permanent DNS error (domain: berginkonsult.se, ip: 46.30.212.0, mailfrom: peter@berginkonsult.se)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=berginkonsult.se; s=20191106;
	h=content-transfer-encoding:mime-version:message-id:date:subject:cc:to:from:
	 from;
	bh=7unm0qt8fOmvtnTUGBnu53Gl99Pfvig1NRUW0hVbMu0=;
	b=SsPXlWAZdf+N0McFuGQhQN8RthDuv3GzMsWxPjUvhC7NkzSJvkCiJ/j2YLVaAR1nPwV/YiRIeJC5N
	 gGPcxd0YRahJ/3cJi1ZSRxNrxKwk6VBCdTYiv1rtsFaud4YPUs0WwdSpne1DQBavxdqUdYQkNG0TAQ
	 6Oemi3qEYAIY/T5ZgRHUAd0bPQXN5SXChxOY7RFvigURz42kEKcrfq0BLAlWhW/G2SWWzyrhmIazdj
	 AZ6odgjvwRQiWl/VgKrm5YVuN1vgYezF6fDT4zM0Pht/sAi7X3iD93S1BR8ERBWCNYppJB2/d1sAa9
	 sOccuzm9kQiabmfNx6L1UUvSu9DnDwg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=berginkonsult.se; s=rsa1;
	h=content-transfer-encoding:mime-version:message-id:date:subject:cc:to:from:
	 from;
	bh=7unm0qt8fOmvtnTUGBnu53Gl99Pfvig1NRUW0hVbMu0=;
	b=IrIIsHZeCe3bWs6KiTiZnw++QOMqvBmcAQZyhQWWLE87S4UY7M31D9EyPGyZHQ3GeOpzlDfKdm3SK
	 gTBMsw8cN04J9XchtrMjHbbTLgJCxCc99r2GUPRV/lEufhH9c5InCTCFVGeQ8WPdWbcnCjAvM1ogJc
	 jeFbJq7DQtTfT3f55tBjgblpa8+fp3SPNdz8tD8Y0us12QcYUp9TTKI6EG6RBsZGerkk6KevAMF9WL
	 o7DZ1svdaFQ24GuSldW8CIDq2PACAHuO8phCurL8BWOUplO1ItIFNmTTeXLl/NbK0LD4C9PSoBD/wE
	 Ia2fhwbimlpT0gGfit1oGO8JLywGkvA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
	d=berginkonsult.se; s=ed1;
	h=content-transfer-encoding:mime-version:message-id:date:subject:cc:to:from:
	 from;
	bh=7unm0qt8fOmvtnTUGBnu53Gl99Pfvig1NRUW0hVbMu0=;
	b=8fS0WneukpCQeG9L9GYjcvWWqnFMd9W8ZqPaaA7VHtg8NIMtDBBnvDpk+CPD4c6fWH1tLXbpc1/fj
	 z9fDYFiCw==
X-HalOne-Cookie: b6a3599c2cb8feafc94a81465f02c414dbc5f650
X-HalOne-ID: 9f78ee6a-1233-11ec-b7cf-d0431ea8a283
Received: from pbergin-7420.. (ua-85-227-233-29.bbcust.telenor.se [85.227.233.29])
	by mailrelay1.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
	id 9f78ee6a-1233-11ec-b7cf-d0431ea8a283;
	Fri, 10 Sep 2021 12:35:50 +0000 (UTC)
From: "Peter Bergin" <peter@berginkonsult.se>
To: openembedded-core@lists.openembedded.org
Cc: Peter Bergin <peter@berginkonsult.se>
Subject: [PATCH] systemd: add packageconfig for wheel-group
Date: Fri, 10 Sep 2021 14:35:34 +0200
Message-Id: <20210910123534.5197-1-peter@berginkonsult.se>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If the distro does not include the group 'wheel' systemd will
complain when trying to parse ACL rules for tmpfiles.d.

  systemd-tmpfiles[273]: Failed to parse ACL "d:group:adm:r-x,d:group:wheel:r-x": Invalid argument. Ignoring

Systemd has a configuration parameter to avoid using 'wheel'
group in the standard config files for tmpfiles. Add this as
a PACKAGECONFIG and enable it by default to keep default.

Signed-off-by: Peter Bergin <peter@berginkonsult.se>
---
 meta/recipes-core/systemd/systemd_249.3.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-core/systemd/systemd_249.3.bb b/meta/recipes-core/systemd/systemd_249.3.bb
index c1594d7cc5..c027b88fd6 100644
--- a/meta/recipes-core/systemd/systemd_249.3.bb
+++ b/meta/recipes-core/systemd/systemd_249.3.bb
@@ -93,6 +93,7 @@ PACKAGECONFIG ??= " \
     userdb \
     utmp \
     vconsole \
+    wheel-group \
     zstd \
 "
 
@@ -196,6 +197,7 @@ PACKAGECONFIG[userdb] = "-Duserdb=true,-Duserdb=false"
 PACKAGECONFIG[utmp] = "-Dutmp=true,-Dutmp=false"
 PACKAGECONFIG[valgrind] = "-DVALGRIND=1,,valgrind"
 PACKAGECONFIG[vconsole] = "-Dvconsole=true,-Dvconsole=false,,${PN}-vconsole-setup"
+PACKAGECONFIG[wheel-group] = "-Dwheel-group=true, -Dwheel-group=false"
 PACKAGECONFIG[xdg-autostart] = "-Dxdg-autostart=true,-Dxdg-autostart=false"
 # Verify keymaps on locale change
 PACKAGECONFIG[xkbcommon] = "-Dxkbcommon=true,-Dxkbcommon=false,libxkbcommon"
-- 
2.30.2

