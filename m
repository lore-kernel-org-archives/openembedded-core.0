Return-Path: <jonas@norrbonn.se>
Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com
	[209.85.208.194])
	by mail.openembedded.org (Postfix) with ESMTP id 319256BC01
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Jan 2019 07:24:47 +0000 (UTC)
Received: by mail-lj1-f194.google.com with SMTP id c19-v6so16554424lja.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Jan 2019 23:24:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=norrbonn-se.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=T/2uEQkboiYjLdxU+GA+/N/+2D6DcFXz/dOXoJ1iLTg=;
	b=PNHVbbfChqyAUPltNGJ4oLgiylUK9o9DnlI0E1kiiuWZq2pyIu0sk63VD9n7j2pkPa
	7rU0IQcZMpYCGXdGyR0P6K2a3zTXuvt/TLWMCab/sAp7y2lnEXL2hx/DHzKMo2U0IPSm
	jrfyGAdtrwLBS/v+aE76hRGk0H3dJ6HYaGwtGINdtO/DnVvuGA8/Bf9S4vYdqYJrxrJ7
	F1Gfu9XFhP49evVBt+tc4YTTcaAJxFq2HbAuB/OuUFW9EdkpV4Jb5MNd6+N7Y36Cj2a/
	JzwRWrnoluJXt88IW8tRRuBkMBMz0Cva30JD+DVKOFJ3SC8il4WXFRGWtYFiU7ob8id7
	NEcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=T/2uEQkboiYjLdxU+GA+/N/+2D6DcFXz/dOXoJ1iLTg=;
	b=g8st31yZj7uQDZJ8w2Iw9L1kgYDplism4qt8wQy4R4sWS5tBE04oQ9DFQfDHu1h/Uj
	JTwdGX696L6i+qv+8kP1WaqDxg2N9gChkDPAvji20wqJJsKrR0Vivs2gYsHHh7KrdKTY
	jFFwhkycCQpTj1MpQjhJHMNZy9LeyxLypHDeK/PgAsZJX/tFUnwqNgTFoR2zhidPlNzx
	ebW0SYSSAQCkqNxOXiop4EzBmSrBxDH9aKFdMgPPZKUHokMhcw5ams2CaJIx6LgO23DA
	Z80fxW/L7uKUcGXhRsi/XxqXAD9sWYOzZ7HCh9bJDTsRD55SdLINKwhH00GAaNVMkOjR
	ZA/Q==
X-Gm-Message-State: AJcUukdrJCKlycK/U1GD7JfmutuRNOaQ30R7jpyOsMP67vu1LMBNtjqF
	0y4EjE/QJypLxFuzyzwSPA/kcZeFlKc=
X-Google-Smtp-Source: AHgI3IYOw0VIWXyjD1qZ2lSqQnOOyw0iXecqRybI6gL71hcpl8w8Z5x2U5ZBYgVReMgQ3qvp5G4fnw==
X-Received: by 2002:a2e:744:: with SMTP id
	i4-v6mr13749552ljd.140.1548746687405; 
	Mon, 28 Jan 2019 23:24:47 -0800 (PST)
Received: from mimer.lan (h-29-16.A159.priv.bahnhof.se. [79.136.29.16])
	by smtp.gmail.com with ESMTPSA id
	u26-v6sm3356434lji.22.2019.01.28.23.24.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 28 Jan 2019 23:24:47 -0800 (PST)
From: Jonas Bonn <jonas@norrbonn.se>
To: openembedded-core@lists.openembedded.org
Date: Tue, 29 Jan 2019 08:24:40 +0100
Message-Id: <20190129072442.32343-2-jonas@norrbonn.se>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20190129072442.32343-1-jonas@norrbonn.se>
References: <20190129072442.32343-1-jonas@norrbonn.se>
MIME-Version: 1.0
Subject: [PATCH 2/4] dbus: volatiles are only needed by sysvinit configuration
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
X-List-Received-Date: Tue, 29 Jan 2019 07:24:47 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Jonas Bonn <jonas@norrbonn.se>
---
 meta/recipes-core/dbus/dbus_1.12.10.bb | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-core/dbus/dbus_1.12.10.bb b/meta/recipes-core/dbus/dbus_1.12.10.bb
index d71f7f7042..d3301278b0 100644
--- a/meta/recipes-core/dbus/dbus_1.12.10.bb
+++ b/meta/recipes-core/dbus/dbus_1.12.10.bb
@@ -120,6 +120,9 @@ do_install() {
 		install -d ${D}${sysconfdir}/init.d
 		sed 's:@bindir@:${bindir}:' < ${WORKDIR}/dbus-1.init >${WORKDIR}/dbus-1.init.sh
 		install -m 0755 ${WORKDIR}/dbus-1.init.sh ${D}${sysconfdir}/init.d/dbus-1
+		install -d ${D}${sysconfdir}/default/volatiles
+		echo "d messagebus messagebus 0755 ${localstatedir}/run/dbus none" \
+		     > ${D}${sysconfdir}/default/volatiles/99_dbus
 	fi
 
 	if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
@@ -131,10 +134,6 @@ do_install() {
 		ln -fs ../dbus.service ${D}${systemd_system_unitdir}/multi-user.target.wants/dbus.service
 	fi
 
-	install -d ${D}${sysconfdir}/default/volatiles
-	echo "d messagebus messagebus 0755 ${localstatedir}/run/dbus none" \
-	     > ${D}${sysconfdir}/default/volatiles/99_dbus
-
 
 	mkdir -p ${D}${localstatedir}/lib/dbus
 
-- 
2.19.1


