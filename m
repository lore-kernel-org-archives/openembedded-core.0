Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 7F16478982
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Jan 2018 16:00:51 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id g75so15146417wme.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 Jan 2018 08:00:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=4BynpK9kujpI5JKVUU6Y7T0RxeWV6n/zZLHKAtSTyJQ=;
	b=THYA9PjiKmztO3gi4hseb8Y/SJ+8VGG+JisL+HYV7QbEqxHoT7h10V8DIVyig1B4gG
	qnhdC6qOXB8z3qSR2YMv3qr4WsmwJ8hs/WjXnSMLG5MREEbjORLgGsoV86c/XpBSxrbj
	nnixw31Nqzpw8UBe1eT+lNZAcUhagBzad1V3wPk6lZYV308l4mt2XM98WHvOmR/PHe3S
	USyab5g+yXRMThOrL6k60IbdftyM2eR4A7AgS2h7K3YLJ6x4qvpush7BNr6p51AOybb8
	J7uVaWwh3fECCxKSo6gktcpCjaHvdizhkuOduxwibzG1AuzjWbgwlc0xvAIbwDYFKdgH
	O6zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=4BynpK9kujpI5JKVUU6Y7T0RxeWV6n/zZLHKAtSTyJQ=;
	b=HQaq03JTzTqh8Fgch/SFAJh/frWwMmexvHZ+YkETaA6k7O8PyyA6+i2ydx5MpHoCIB
	JCKIYSOZUqjqlHa2+Ye33OBwrbSoh+ndGCeLLjSieN3diInZNNTGQf9R952pSZcOjWvU
	DQvxn4nmd9lml2lkKUJQY3eKH6WrgRVjHs1SVju/SdbGfY7bT3ixC1yqVqSFO3CmvTnJ
	f+MnbjbXlOULcBuYeagPNYAjpBsm7a73FiSejtA1F2TQUicyU0EinvcPGFbO0qj2DME2
	aQH7l9UWc0lCcPMSF/c6eM0o+8QowakgRtDEIeK/YTxcouLl5wpTOZVbQF14rZgL8zYO
	zYFQ==
X-Gm-Message-State: AKGB3mJHq7+huo+ms1yMnhXEKjS5umX062ciQqUmPXHyWrFtzM3Hpiyt
	AyYKCH0D4xBLJ4M3iRmw4IzoaC+Q
X-Google-Smtp-Source: ACJfBovdKnf/XkFMTbQ9pM+HLdEd4+lHFr08YpzIKyiidJCp0eqV2igV75qK7Z7P2OJudaz479PqTA==
X-Received: by 10.28.238.72 with SMTP id m69mr9339635wmh.17.1515427252291;
	Mon, 08 Jan 2018 08:00:52 -0800 (PST)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	b15sm11386658wrh.5.2018.01.08.08.00.51
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 08 Jan 2018 08:00:51 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  8 Jan 2018 16:00:19 +0000
Message-Id: <20180108160021.4715-7-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20180108160021.4715-1-ross.burton@intel.com>
References: <20180108160021.4715-1-ross.burton@intel.com>
Subject: [PATCH 7/9] avahi: remove explicit avahi-dev RDEPENDS
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
X-List-Received-Date: Mon, 08 Jan 2018 16:00:51 -0000

These were added to the avahi-dev package back in 2011 before avahi-ui existed
at all.  The problem of GTK+ being pulled in via avahi-dev was finally solved
with the avahi-ui split, so these explicit (and by being manually maintained,
incomplete) dependencies can be removed.

This also results in gettext-dev being removed from the dependency tree (the
gettext library API is provided by glibc/musl), which means that for a standard
image we don't need to build target gettext at all anymore.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-connectivity/avahi/avahi.inc | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/meta/recipes-connectivity/avahi/avahi.inc b/meta/recipes-connectivity/avahi/avahi.inc
index ef655dec443..ec368de4f4a 100644
--- a/meta/recipes-connectivity/avahi/avahi.inc
+++ b/meta/recipes-connectivity/avahi/avahi.inc
@@ -109,11 +109,6 @@ RDEPENDS_${PN}-dev = "avahi-daemon (= ${EXTENDPKGV}) libavahi-core (= ${EXTENDPK
 RRECOMMENDS_avahi-daemon_append_libc-glibc = " libnss-mdns"
 RRECOMMENDS_${PN}_append_libc-glibc = " libnss-mdns"
 
-RRECOMMENDS_avahi-dev = "expat-dev libcap-dev libdaemon-dev dbus-dev glib-2.0-dev update-rc.d-dev"
-RRECOMMENDS_avahi-dev_append_libc-glibc = " gettext-dev"
-
-RRECOMMENDS_avahi-dev[nodeprrecs] = "1"
-
 CONFFILES_avahi-daemon = "${sysconfdir}/avahi/avahi-daemon.conf"
 
 INITSCRIPT_PACKAGES = "avahi-daemon avahi-dnsconfd"
-- 
2.11.0


