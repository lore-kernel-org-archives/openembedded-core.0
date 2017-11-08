Return-Path: <dan.dedrick@gmail.com>
Received: from mail-pf0-f169.google.com (mail-pf0-f169.google.com
	[209.85.192.169])
	by mail.openembedded.org (Postfix) with ESMTP id B93A260125
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Nov 2017 01:13:07 +0000 (UTC)
Received: by mail-pf0-f169.google.com with SMTP id n89so745586pfk.11
	for <openembedded-core@lists.openembedded.org>;
	Tue, 07 Nov 2017 17:13:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=hKRhHDajdwDOqqYtfmvHXvD8RDofEu1/NpDkd4BM8ac=;
	b=Z8cEN59c893pCLp6u0BQwghaNust1mpLj2j7rC8QWDnEfTyKk6fp69HA7SktRlznoF
	oCOoRHjZbG0tQ3/5ud3vsJ0J69kkt7qd0dR0KyyzZ0UBYBQcL9mv/TQFlel208XRx9YH
	0ZucD21sdgG76E7HFlFC+bdGYesch5S2iThjf8z2TWQr41sbfS6Pmhg+S/ZWzRj1li1J
	vdb8lTgt8m6USXEfmUvl8d7qrkT5TXnG1N/q6COebcUTuqky0yDApeAnKqeGZvc1ZKs6
	33kE3FhMRVJGnENhAtLqrnXi/AxlpwLceIOlsl7+J06YCv/T+tveBZr6/cG7VYEZj1Jg
	juog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=hKRhHDajdwDOqqYtfmvHXvD8RDofEu1/NpDkd4BM8ac=;
	b=ahH48lyeqNvUw/6IPJZ5uahiRCKJP3xhR9yocnxLGhT1ejIbUJNP1ZfNFC3TDSHOHR
	lEzWDuNTpX5JoFzXaEjVsyflBZHM/lWINxLMZaOBE2SA7xKFr9S4MLe45hHqXzFdD0zL
	nhMnZ0aF6CrVLHv94JezdaQ1R84R0RzPjg7n7H2aQh/LBD54+z1buJ2oOACiAMkrUrgh
	lRPDP3bRiVBDMQldD41jkayyaF8h9BrzEOik7cZ9pZDZg6XonDc0kmY1glgccGLwJVFD
	y0Fl20h5HvS0YM2uooZ3o8Lzadh6bQ7McxV+uwj3D1oS0LfnNKGV6F72a4fvO2Xks5+G
	3FiA==
X-Gm-Message-State: AJaThX7pXQSi8ulx0Tix+aq0X6Z9k5X5g9V9T7jgJWMTJ+ryHeYC5WDx
	+4RdaIQmTw92obutDJniLABDSQ==
X-Google-Smtp-Source: ABhQp+RsLF9kRi8/qoBkOEEtBdv8J64CFWBHOu4Lq3xEenMSzxHWK5KIHSwQ2nLv9TG75Ucq/+iHmg==
X-Received: by 10.101.68.202 with SMTP id g10mr560822pgs.29.1510103588402;
	Tue, 07 Nov 2017 17:13:08 -0800 (PST)
Received: from aeryn.lexmark.com ([2605:a000:7980::2])
	by smtp.gmail.com with ESMTPSA id
	h1sm4868523pfg.143.2017.11.07.17.13.07
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 07 Nov 2017 17:13:07 -0800 (PST)
From: Dan Dedrick <dan.dedrick@gmail.com>
X-Google-Original-From: Dan Dedrick <ddedrick@lexmark.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  7 Nov 2017 20:12:20 -0500
Message-Id: <20171108011220.13976-1-ddedrick@lexmark.com>
X-Mailer: git-send-email 2.13.6
Cc: Dan Dedrick <ddedrick@lexmark.com>
Subject: [PATCH] dhcp: use ${BPN} instead of ${PN} for user
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
X-List-Received-Date: Wed, 08 Nov 2017 01:13:07 -0000

${PN} will include additional prefixes, such as lib32-, which are not
actually a part of the user that is being added. This was creating an unused
user and possibly missing the actually intended user. By using ${BPN} this
will remove all additional extra information and consistently be "dhcp".

Signed-off-by: Dan Dedrick <ddedrick@lexmark.com>
---
 meta/recipes-connectivity/dhcp/dhcp.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/dhcp/dhcp.inc b/meta/recipes-connectivity/dhcp/dhcp.inc
index 58f4a6fd24..e94370786a 100644
--- a/meta/recipes-connectivity/dhcp/dhcp.inc
+++ b/meta/recipes-connectivity/dhcp/dhcp.inc
@@ -27,7 +27,7 @@ UPSTREAM_CHECK_REGEX = "(?P<pver>\d+\.\d+\.(\d+?))/"
 inherit autotools systemd useradd update-rc.d
 
 USERADD_PACKAGES = "${PN}-server"
-USERADD_PARAM_${PN}-server = "--system --no-create-home --home-dir /var/run/${PN} --shell /bin/false --user-group ${PN}"
+USERADD_PARAM_${PN}-server = "--system --no-create-home --home-dir /var/run/${BPN} --shell /bin/false --user-group ${BPN}"
 
 SYSTEMD_PACKAGES = "${PN}-server ${PN}-relay ${PN}-client"
 SYSTEMD_SERVICE_${PN}-server = "dhcpd.service dhcpd6.service"
-- 
2.13.6


