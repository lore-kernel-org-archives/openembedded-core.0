Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
	[209.85.221.54])
	by mail.openembedded.org (Postfix) with ESMTP id 060956C242
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Nov 2018 10:17:48 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id 74-v6so12590499wrb.13
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Nov 2018 02:17:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=zyEbVxrbyesmd5NxzDDjndWUzW6n5w4EIt1MJO+B9vU=;
	b=Hb4zEHv73ySUf8RU9ebMkXuMKPmRXuKKiu3djlqZOAYeaT3Tdaj1v8Wx4dZzwZ7obi
	lbQL3+ZcaPkPz4K7ATOuCPyOONhrG6WAmCHkV8mLRx4HT5jUoytBvGk3OKNoL8YEEmHI
	bcfGZdnvHVIDdyMDP8To5erfeRE73lBlZeY0TFTHT+jsQKTxoEyEzusQ2yUEWsCgWtIP
	HgbuQ9Vp61fcCtp+VzjKQeniCeLolriDGz6AGF+974z9OYT2Nk/S97AiGKxPvqe/KGi8
	vX0LnjrwKLLCh9reTBJjG6YZdpHHrTvkm2lnTj1bba8rmQMt+5QpqfejbhlQm0Dd2Ox/
	lVaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=zyEbVxrbyesmd5NxzDDjndWUzW6n5w4EIt1MJO+B9vU=;
	b=IcKUyliEMFlA9Yz6o7ZIDkg4Ldi67hkLPQrDSfpY2wcj+h5svx6eIbLFcqic7kSicn
	cXKVHWsW+YxHiWKOanr7KjmOLrfC54qCDmW7y7lm8sJaanGeDYvUtNo+I5FV5UKqxBjJ
	EDPYcVc1S+OtpEl6XLt3BN4Wi6DuiTJBtcoNfy8W0Q4ZfsEPrzXNB3ac83Vmr/rssTjt
	hrX41wiKcJ3IxJXoEcB8t8/06TvU8RIhRJ9IOSH3a+bfkUzlxDKZVHIJ9UauhDNoCmCQ
	Jz17A8WW8oX0fLh+DbDSMKxdFuj0L0DaUGMjeFfXLr7brsFHN+P6rrjhUJYfX1psKNQZ
	rWeg==
X-Gm-Message-State: AGRZ1gKRgi9KiHHvcmDi6PhpwK4PDmbqTcJC1tRvHspvPGsST/niI8Ur
	tKc9RMP6DBvmMC6o/wKV+XrS0Urd
X-Google-Smtp-Source: AJdET5dn2GImkXBRUMX3zZmqT3l6QeLReXSlwrEbC6H05xPnIAr0y1HH6qScGZngzWKbiK8rgMhVvA==
X-Received: by 2002:adf:8444:: with SMTP id
	62-v6mr4137892wrf.251.1542104268705; 
	Tue, 13 Nov 2018 02:17:48 -0800 (PST)
Received: from localhost.localdomain (p509737a3.dip0.t-ipconnect.de.
	[80.151.55.163]) by smtp.gmail.com with ESMTPSA id
	r64-v6sm10030812wmd.43.2018.11.13.02.17.47
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 13 Nov 2018 02:17:47 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 13 Nov 2018 11:17:28 +0100
Message-Id: <20181113101729.19289-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.14.5
MIME-Version: 1.0
Subject: [PATCH 1/2] scons.bbclass: Force rebuild if necessary
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
X-List-Received-Date: Tue, 13 Nov 2018 10:17:49 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta/classes/scons.bbclass | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/meta/classes/scons.bbclass b/meta/classes/scons.bbclass
index b9ae19d582..286843f74c 100644
--- a/meta/classes/scons.bbclass
+++ b/meta/classes/scons.bbclass
@@ -2,7 +2,16 @@ DEPENDS += "python-scons-native"
 
 EXTRA_OESCONS ?= ""
 
-do_configure[noexec] = "1"
+do_configure() {
+	if [ -n "${CONFIGURESTAMPFILE}" ]; then
+		if [ -e "${CONFIGURESTAMPFILE}" -a "`cat ${CONFIGURESTAMPFILE}`" != "${BB_TASKHASH}" -a "${CLEANBROKEN}" != "1" ]; then
+			${STAGING_BINDIR_NATIVE}/scons --clean PREFIX=${prefix} prefix=${prefix} ${EXTRA_OESCONS}
+		fi
+
+		mkdir -p `dirname ${CONFIGURESTAMPFILE}`
+		echo ${BB_TASKHASH} > ${CONFIGURESTAMPFILE}
+	fi
+}
 
 scons_do_compile() {
         ${STAGING_BINDIR_NATIVE}/scons ${PARALLEL_MAKE} PREFIX=${prefix} prefix=${prefix} ${EXTRA_OESCONS} || \
-- 
2.14.5


