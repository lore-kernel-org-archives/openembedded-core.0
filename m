Return-Path: <raj.khem@gmail.com>
Received: from mail-qg0-f41.google.com (mail-qg0-f41.google.com
	[209.85.192.41])
	by mail.openembedded.org (Postfix) with ESMTP id 386E160249
	for <openembedded-core@lists.openembedded.org>;
	Sun, 24 Apr 2016 16:39:26 +0000 (UTC)
Received: by mail-qg0-f41.google.com with SMTP id f74so69126113qge.2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 24 Apr 2016 09:39:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=8TXf0DUWcEXZQfb5IZhJPNUqZ4ZZRHo7W4DYqf34me8=;
	b=Xcne46xV0FiK3njyM7TrKgpatLCgX9StM40xjhUyEl6xKcRtkm09sK/ZuprldnXWU9
	Y7F8vuoh7GWM83GCzLCgpWxq7EKXB+U32/iqAllX1HGUfLyeNb+LkrzNEGSFIoLpRaRC
	c+Jj1RDihvgD2HouRWRzvg/odGoUXkBHXrWzqRYxjVCTjB6czh2E+N63wITXvqCLn8MD
	mnNJUGySNXrtQuvppei5fNrvAzdSuLMvkpHi1WWQ3QVvc++15yIZEdQZH56wWnTEneE2
	uS4Jph6zDdRSox/xu2Zffpg8npRDmWVsmzYjhRbkfTQeTaoWX/1yui/4XWjfts3tUNB0
	DQ4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=8TXf0DUWcEXZQfb5IZhJPNUqZ4ZZRHo7W4DYqf34me8=;
	b=ZvV4EfW9OFWmOgGRtZPuxy6YqgwOnOV7h/pKeJBLZ9+gwtkU5AcCfYG3vVFTcBb+u2
	+qBTpzg1WQ7sDevskwENDrYhYcZ4DS8FbenHaMQ+ig/dWEg9/lYQSw/0Nk2NpoWdvM6z
	6u8jT0SZIlo2lPJ0PSEcS6bVvvzety/TDZb/xiCTqvd/x8ffJ+gljNHjfhiGDM9/tdXm
	b/S/EBvy3i9pSbCvBAQPcY4XGv/ac5LllZihlHWUGLjP9J2yo/PtVf3nx6KTCB1xTTY5
	mhUSFS1ZWeDQM9Pl4CDJkMuFdYbdFz9r6PAkNyvI5rFSvr2B9KLdiFpcjlsni7PJIvWl
	cH9Q==
X-Gm-Message-State: AOPr4FVHOO1xqyodZVCswuWwSWrUcVI/iRuL3qN2ocsYRGvBvPJGgEWJrywjKViBKplppQ==
X-Received: by 10.140.197.130 with SMTP id s124mr32100384qha.17.1461515966566; 
	Sun, 24 Apr 2016 09:39:26 -0700 (PDT)
Received: from eos.sys.comcast.net (a-96-118-179-133.sys.comcast.net.
	[96.118.179.133]) by smtp.gmail.com with ESMTPSA id
	y200sm5756624qka.48.2016.04.24.09.39.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 24 Apr 2016 09:39:25 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 24 Apr 2016 16:39:20 +0000
Message-Id: <1461515960-29048-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] systemd: Create missing sysusers offline
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
X-List-Received-Date: Sun, 24 Apr 2016 16:39:27 -0000

Some system users which are needed by systemd components were missing
create these users knobbed with relevant packageconfig

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/systemd/systemd_229.bb | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd_229.bb b/meta/recipes-core/systemd/systemd_229.bb
index c23c749..8374dc1 100644
--- a/meta/recipes-core/systemd/systemd_229.bb
+++ b/meta/recipes-core/systemd/systemd_229.bb
@@ -319,10 +319,14 @@ PACKAGES =+ "\
 SYSTEMD_PACKAGES = "${@bb.utils.contains('PACKAGECONFIG', 'binfmt', '${PN}-binfmt', '', d)}"
 SYSTEMD_SERVICE_${PN}-binfmt = "systemd-binfmt.service"
 
-USERADD_PACKAGES = "${PN}"
+USERADD_PACKAGES = "${PN} ${PN}-extra-utils"
 USERADD_PARAM_${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'microhttpd', '--system -d / -M --shell /bin/nologin systemd-journal-gateway;', '', d)}"
 USERADD_PARAM_${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'timesyncd', '--system -d / -M --shell /bin/nologin systemd-timesync;', '', d)}"
+USERADD_PARAM_${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'networkd', '--system -d / -M --shell /bin/nologin systemd-network;', '', d)}"
+USERADD_PARAM_${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'coredump', '--system -d / -M --shell /bin/nologin systemd-coredump;', '', d)}"
+USERADD_PARAM_${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'resolved', '--system -d / -M --shell /bin/nologin systemd-resolve;', '', d)}"
 GROUPADD_PARAM_${PN} = "-r lock; -r systemd-journal"
+USERADD_PARAM_${PN}-extra-utils += "--system -d / -M --shell /bin/nologin systemd-bus-proxy"
 
 FILES_${PN}-analyze = "${bindir}/systemd-analyze"
 
-- 
1.9.1


