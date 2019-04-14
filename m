Return-Path: <adrian.freihofer@gmail.com>
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com
	[209.85.208.65])
	by mail.openembedded.org (Postfix) with ESMTP id 8B0E77D6C5
	for <openembedded-core@lists.openembedded.org>;
	Sun, 14 Apr 2019 13:28:36 +0000 (UTC)
Received: by mail-ed1-f65.google.com with SMTP id a6so1012060edv.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 14 Apr 2019 06:28:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=bvroOVEkYFrARj3IUkCGhXPe91qQkXuWXX/0Ql0Iqjg=;
	b=JUIh21PC17h+6sXHprarER3FXM+Z/IQLjdK67tyZReqHw4Eh8tXVb/qzFhCH9EtDir
	dZVfxbk8gc71RWrMxRMOyCwoLar2UoyOZb09Nu2PWdz7nC2SnFNt0kboki9naJzJ5Ry2
	YBkhZmd0E4QOIM20B9VtVcSwbZN5Jp9hkB/P10JTTeeC3p+m9yxiJZNGhcq7f/MIMW59
	FmEk9fvzM8ukKCC78tkbTmqeUW6KRbGHNuuhxmUw0VMIYdfnL0f6jlEMJU1zj43WcSwv
	ILbZAY9X0yFjsOB8dhl9IyCfhfj5YO3Vfo/c+ITP8nRB5HHf0PfxuAYwXEcZ7sS91IYz
	kXmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=bvroOVEkYFrARj3IUkCGhXPe91qQkXuWXX/0Ql0Iqjg=;
	b=lZitsp0VqZ3WuMM6sorgJAzvXdtL3+rn97+aA16etymctVCewEwNdTXUYORUIhSQB3
	8iGmR2bkD7wboLX1A+59bFyCHJR3kCJKTjKgxWTXqaPgNET7BLmudo0qty9eXqtJP+Pd
	lH/4gFIZEaK/VhZ9rAPOHZZaPvoRG4t/U3aEdi0hHfGb4FKjhN1jkVrBw4BTCnukat4F
	vJGeDB82w1bF1zjsizt/2aDmU5sr7GiT/ZCtlpOcihKDyBvxT40PNZVzvZ/VHfCJF49p
	aQ2tztqqm49GaVHhg3ytq7Qm5yfRyO/90QaHl2JZtHaNhYuiFrro2RFEQHLN7l4n/Q2L
	/piA==
X-Gm-Message-State: APjAAAUuRSUIZx8BZ9ryJZVlEa69qzl55k75aWX0hsFQpzhTx3zJxEgW
	5NhwgVAE1Py1GnXRmph+6KJLMw6zISE=
X-Google-Smtp-Source: APXvYqwM/PpHe+OnTEC/sIZcrVPmtUv398fpuM2r8hIOztRJRGEuH8jIEJh7uTqWIXAbEbsN8x1jbA==
X-Received: by 2002:a50:b582:: with SMTP id a2mr44034223ede.268.1555248516867; 
	Sun, 14 Apr 2019 06:28:36 -0700 (PDT)
Received: from wsadrian2.lan97.ffah.ch (c-93-184-18-27.customer.ggaweb.ch.
	[93.184.18.27]) by smtp.gmail.com with ESMTPSA id
	h15sm6333696ejc.78.2019.04.14.06.28.35
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sun, 14 Apr 2019 06:28:35 -0700 (PDT)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 14 Apr 2019 15:24:13 +0200
Message-Id: <20190414132414.18547-2-adrian.freihofer@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190414132414.18547-1-adrian.freihofer@gmail.com>
References: <20190414132414.18547-1-adrian.freihofer@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 2/3] systemd: container remove rrecommend
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
X-List-Received-Date: Sun, 14 Apr 2019 13:28:36 -0000
Content-Transfer-Encoding: 8bit

nspawn, journal-upload, journal-remote and journal-gatewayd are
completely independent from each other. There is hardly any reason
why the user should install all three journal services when
installing nspawn. Especially since these services are network
clients or servers, they should not be installed automatically.

Signed-off-by: Adrian Freihofer <adrian.freihofer@gmail.com>
---
 meta/recipes-core/systemd/systemd_241.bb | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd_241.bb b/meta/recipes-core/systemd/systemd_241.bb
index 8e493d5b55..688cc0608e 100644
--- a/meta/recipes-core/systemd/systemd_241.bb
+++ b/meta/recipes-core/systemd/systemd_241.bb
@@ -431,12 +431,6 @@ FILES_${PN}-container = "${sysconfdir}/dbus-1/system.d/org.freedesktop.import1.c
                          ${datadir}/polkit-1/actions/org.freedesktop.machine1.policy \
                         "
 
-RRECOMMENDS_${PN}-container += "\
-                         ${PN}-journal-upload \
-                         ${PN}-journal-remote \
-                         ${PN}-journal-gatewayd \
-                        "
-
 FILES_${PN}-extra-utils = "\
                         ${base_bindir}/systemd-escape \
                         ${base_bindir}/systemd-inhibit \
-- 
2.20.1


