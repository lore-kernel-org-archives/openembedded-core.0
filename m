Return-Path: <jonas@norrbonn.se>
Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com
	[209.85.208.195])
	by mail.openembedded.org (Postfix) with ESMTP id EF4F96093F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Dec 2018 12:06:08 +0000 (UTC)
Received: by mail-lj1-f195.google.com with SMTP id v15-v6so23493727ljh.13
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Dec 2018 04:06:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=norrbonn-se.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=xBMEIk2+cb5ykIA34swI+flOhzYXU/v4C7up0GUH2xs=;
	b=VPwi5qDUWoXczzuX4ORc7OsJjxU3+tXvrGj8nlMuI51L+Yp6nqW71021/BiA8ojBVh
	BWrXgCNz0XugdpEWVGWpIdk3X1GZcA/5kkCEccxc/Ozp6QOlQ14/CY2tOHKacWW88k7o
	o7yvn27fO80PGkwe4a0ZEY2hfqduxmUnQvFQAXH9qQYUhY8p4c7WuTIHuwrYGF2CwURp
	voANQnXK1vMSKv7rAh8B3/uydgT51L/73nfA2LTPfCHktMuIA+w3IEpTT2bvEYlxxVLr
	fZWDRaZmF/biun/EUwebUJLqlWHYEGYeSWiQzU9h/yhmv9cXx72ZZ2//x2DHytiYJuqd
	lHjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=xBMEIk2+cb5ykIA34swI+flOhzYXU/v4C7up0GUH2xs=;
	b=IcWchY0zp0UVS6LvUdFqEQJ6yXejsrVos3+55gFJ3lfYovT0yTD5mErSFywpnkyrkN
	2qUsWAEJVDdgCBIl6a9NfVdv7T7z03WPpxeX+3MEvY/0W4NXTh9Foiis7Z/dUhn5PMfZ
	YbzpjevNdiB5CmvGxkf93+JWHNseWANiJKUWkMjxMfsofeAJMaioMOWVue4UaaSIlAma
	jFzMllzAQLVEDX3O9Si3YBTKKCCdibXHX/zsxokAm4AXIDOtXAT36MKk3phfmYSjG7k4
	sqKq/0du+1+HxIMTxqBtQ05WPNu8qtulgvUbSRXdZU0tfrSD+4lPBJZDrMD004od7cHQ
	E34A==
X-Gm-Message-State: AJcUukeyZbGkzAbKBvy+OYvIGfZhHMEkiJ01Zb6kWLFIlleT5UsNny7I
	u7jEjxMS3EK3rC56Z3KsSyY17VyU14E=
X-Google-Smtp-Source: AFSGD/WXndLkGPptT2OfGPTJUd/w0qO/aqEMI3KZPFwyhUUOSd01z6nDlEtU3SOZ1KnJ/UkvWKNf5g==
X-Received: by 2002:a2e:890b:: with SMTP id
	d11-v6mr19772204lji.113.1546257969462; 
	Mon, 31 Dec 2018 04:06:09 -0800 (PST)
Received: from mimer.lan (h-29-16.A159.priv.bahnhof.se. [79.136.29.16])
	by smtp.gmail.com with ESMTPSA id
	r76-v6sm10246379ljr.83.2018.12.31.04.06.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 31 Dec 2018 04:06:09 -0800 (PST)
From: Jonas Bonn <jonas@norrbonn.se>
To: openembedded-core@lists.openembedded.org
Date: Mon, 31 Dec 2018 13:05:59 +0100
Message-Id: <20181231120559.25470-8-jonas@norrbonn.se>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181231120559.25470-1-jonas@norrbonn.se>
References: <20181231120559.25470-1-jonas@norrbonn.se>
MIME-Version: 1.0
Subject: [PATCH 7/7] systemd: do not pre-enable services, rely on presets
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
X-List-Received-Date: Mon, 31 Dec 2018 12:06:09 -0000
Content-Transfer-Encoding: 8bit

At installation, systemd _both_ installs preset files for its services
and enables the services accordingly (effectively, calling 'systemctl
preset-all' on its own services).  As we now rely on systemd calling
preset-all at first boot, there's no need to carry the pre-populated
/etc/systemd/system directory in the package.

This gets us a step closer to en empty /etc which is a requirement for
running a "stateless system".
---
 meta/recipes-core/systemd/systemd_239.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-core/systemd/systemd_239.bb b/meta/recipes-core/systemd/systemd_239.bb
index 70e687c92e..7b4c5c56aa 100644
--- a/meta/recipes-core/systemd/systemd_239.bb
+++ b/meta/recipes-core/systemd/systemd_239.bb
@@ -298,6 +298,8 @@ do_install() {
 	# duplicate udevadm for postinst script
 	install -d ${D}${libexecdir}
 	ln ${D}${base_bindir}/udevadm ${D}${libexecdir}/${MLPREFIX}udevadm
+
+	rm -rf ${D}${sysconfdir}/systemd/system
 }
 
 
-- 
2.19.1


