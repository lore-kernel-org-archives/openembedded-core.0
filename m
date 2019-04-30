Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
	[209.85.128.53])
	by mail.openembedded.org (Postfix) with ESMTP id B05A57DBB2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Apr 2019 13:19:40 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id n25so3801447wmk.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Apr 2019 06:19:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=ZHgLFySznS/XV1YlMe+88/VSr/GaqbuzyyZaAjFdMFk=;
	b=GTbFcAJg4ve7f72Ni2RVADmjwshLkMFZ2lpebgyws8aazmmJSENNUL5I9vvhoUsQFs
	WNLs52u91FhZ35HwL6b8YyoWOH8E+KoEj/mhUttylzUfnrJq2wtfNfPsg+sm+S5RwxwO
	OkuAHmQZ2AdLmfc0o5WVURRLGN2v7aRhIcr5RGJUFQlhXO5spLJ+cS+uYzY9r5RkdYHf
	GL+mmVUUBIX/lqJZQ5pR+hPfcPf82OswFI69/+Gsi5N1IgOjUF4eoa5TSKVimqX4dJJg
	qCz2Dc/9W22MBGTcQGw2MniEmE7jP6S+MSmkcYahLDisMtUtqouMmw4m29Ji4UEE3zXr
	FQZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=ZHgLFySznS/XV1YlMe+88/VSr/GaqbuzyyZaAjFdMFk=;
	b=n/yxpaIKIM/PCInz61Uj97s2guX8EBIM/n3QBEu9+88RRVkjazEPKguojqrUi3+KEE
	OF/b42M12LlHhPUsPZLi/22dd061XIpXq1TKCePEDhPCEn/EoQCSA4EQ8fckGi9H4hae
	aFcbzXFY6UmCjDyLlU0Tsl35OmGogZDJ11JEFzFJlePU+Mo+m/snb7fI9y5vaUYxAtyx
	7WnCpPsnuGVQaqTq22/+Xe6PGvZUqRVAELSYdTXP2nmM4cgPdIkAbGiwvkJp3BLjAkkQ
	aykFzcddP6a0BFWi/yJDe2de7rzKfCFcRbDFChFTcoQOm5h38U73TDW1wABssgxmMxd1
	m85g==
X-Gm-Message-State: APjAAAXCj3j7xO3hEEJF0GPqorBLO3qKK+oVIUVA1kuvI979DJ5QmSgX
	UZwZN5FIXpVSD6N03og1PypRrWaY
X-Google-Smtp-Source: APXvYqwG8p16uiZZAsFQvP1r//BztjGVXumLSoKpANka/jmEFFA56uZFjvhkpHSfRWrn0jq2UCSaWQ==
X-Received: by 2002:a1c:7512:: with SMTP id o18mr3350165wmc.68.1556630381072; 
	Tue, 30 Apr 2019 06:19:41 -0700 (PDT)
Received: from localhost.localdomain (p509737a3.dip0.t-ipconnect.de.
	[80.151.55.163])
	by smtp.gmail.com with ESMTPSA id 10sm3141404wmd.23.2019.04.30.06.19.40
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 30 Apr 2019 06:19:40 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 30 Apr 2019 15:19:27 +0200
Message-Id: <20190430131927.29493-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] qemu: split out vte into seperate PACKAGECONFIG
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
X-List-Received-Date: Tue, 30 Apr 2019 13:19:40 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* vte-native requires host compiler supporting c++17. Some distros we support
  ship comilers not supporting c++17 currently.
* oe-self-test 'test_testimage_virgl_gtk' sets
  PACKAGECONFIG_append_pn-qemu-system-native = " gtk+". With vte enabled by
  'gtk+'-config, build fails on hosts with ancient compilers [1].
* Alexander Kanavin did some tests: Without vte in PACKAGECONFIG there is still
  a working terminal available with reduced functionality [2].
* Users wanting 'full' terminal in system-qemu back should add
  PACKAGECONFIG_append_pn-qemu-system-native = " vte"
  in their local.conf.

The idea of this patch was coming from Ross Burton - thanks!

[1] http://lists.openembedded.org/pipermail/openembedded-core/2019-April/281637.html
[2] http://lists.openembedded.org/pipermail/openembedded-core/2019-April/281727.html

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta/recipes-devtools/qemu/qemu.inc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 13f0549c25..3ec141452d 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -144,7 +144,8 @@ PACKAGECONFIG[vnc-png] = "--enable-vnc --enable-vnc-png,--disable-vnc-png,libpng
 PACKAGECONFIG[libcurl] = "--enable-curl,--disable-curl,libcurl,"
 PACKAGECONFIG[nss] = "--enable-smartcard,--disable-smartcard,nss,"
 PACKAGECONFIG[curses] = "--enable-curses,--disable-curses,ncurses,"
-PACKAGECONFIG[gtk+] = "--enable-gtk --enable-vte,--disable-gtk --disable-vte,gtk+3 vte gettext-native"
+PACKAGECONFIG[gtk+] = "--enable-gtk,--disable-gtk,gtk+3 gettext-native"
+PACKAGECONFIG[vte] = "--enable-vte,--disable-vte,vte gettext-native"
 PACKAGECONFIG[libcap-ng] = "--enable-cap-ng,--disable-cap-ng,libcap-ng,"
 PACKAGECONFIG[ssh2] = "--enable-libssh2,--disable-libssh2,libssh2,"
 PACKAGECONFIG[gcrypt] = "--enable-gcrypt,--disable-gcrypt,libgcrypt,"
-- 
2.20.1


