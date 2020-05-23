Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com [209.85.221.65])
 by mx.groups.io with SMTP id smtpd.web11.2707.1590261370414465601
 for <openembedded-core@lists.openembedded.org>;
 Sat, 23 May 2020 12:16:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=EUEKqs+s;
 spf=pass (domain: konsulko.com, ip: 209.85.221.65, mailfrom: pbarker@konsulko.com)
Received: by mail-wr1-f65.google.com with SMTP id c11so4047182wrn.6
        for <openembedded-core@lists.openembedded.org>; Sat, 23 May 2020 12:16:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9RyzgcNh4eTCRkBiJob3yZ8GlgciWh+NXNFzIEDGQco=;
        b=EUEKqs+s7p7AqkwAmrSuWm6DpoffSeVgkNdYWH+0iu1q4BoBdZk9mzqa4cBMGCTFIP
         liGJutuCYbz/fWyQ2GJ/tpdegS8pS5oUxSdOBB7B8wzSczHP1HqFJ3ou1YTDPyUCXyCC
         Jd5P9FIYvoJZ1/uYTFSdmNwj4rPJfdtGBO4bU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9RyzgcNh4eTCRkBiJob3yZ8GlgciWh+NXNFzIEDGQco=;
        b=HcA1CIOqxgYnmlGdoBUlgth3tCYxibtZj0LQd/FtBRnfcCqRW8bcsVKdNsJXueDuiT
         v03wB47nPABUpNiCT4wXrH5GiQg+ZGalrL6uo4HiPEaNOhG0guEwJ9qpwUxrTPDrrNcY
         bATzOMgHHnAFLZdAxKo1GMzVhQp7lofr5utD1NxwQJ78h/Egnq3FoVO1aL+saM5ooXfS
         xnU/oCTdFuT0sbv9gp9LB6wc8WQQ6c2HBAIXEJMVPsm6Nf2ZXSfLfVAl5uV53HQ7qIOB
         hCObU10iptEQVryiwiL6TCus0F26GjIpkUFUZdURPWv6J9KBLyubn1GnfRXossY0bBDt
         NNZQ==
X-Gm-Message-State: AOAM533lcTpXm8mGQ0VTvH3HK1yVFm7LgbRksdIRAIe27h+3XprHuW2y
	ePtCQaxQOWpACj98S9r7navbCTaUV0dHvw==
X-Google-Smtp-Source: ABdhPJz6/CFMMiE/bbWEYUR9umIySWRldCWkiWY6Mx33iY7IRMdYoF6dB/x0NefRVk0ZeQnR+IwWsw==
X-Received: by 2002:a5d:4987:: with SMTP id r7mr682002wrq.316.1590261368576;
        Sat, 23 May 2020 12:16:08 -0700 (PDT)
Return-Path: <pbarker@konsulko.com>
Received: from ar2.home.b5net.uk ([213.48.11.149])
        by smtp.gmail.com with ESMTPSA id 5sm13319957wmd.19.2020.05.23.12.16.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 May 2020 12:16:08 -0700 (PDT)
From: "Paul Barker" <pbarker@konsulko.com>
To: openembedded-core@lists.openembedded.org
Cc: Paul Barker <pbarker@konsulko.com>,
	Armin Kuster <akuster808@gmail.com>,
	Anuj Mittal <anuj.mittal@intel.com>,
	Steve Sakoman <steve@sakoman.com>
Subject: [zeus/dunfell PATCH] avahi: Don't advertise example services by default
Date: Sat, 23 May 2020 20:16:06 +0100
Message-Id: <20200523191606.56427-1-pbarker@konsulko.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The example service files are placed into /etc/avahi/services when we
run `make install` for avahi. This results in ssh and sftp-ssh services
being announced by default even if no ssh server is installed in an
image.

These example files should be moved away to another location such as
/usr/share/doc/avahi (taking inspiration from Arch Linux).

Signed-off-by: Paul Barker <pbarker@konsulko.com>
---
 meta/recipes-connectivity/avahi/avahi.inc | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-connectivity/avahi/avahi.inc b/meta/recipes-connectivity/avahi/avahi.inc
index 94fe6a16b6..6acedb5412 100644
--- a/meta/recipes-connectivity/avahi/avahi.inc
+++ b/meta/recipes-connectivity/avahi/avahi.inc
@@ -77,6 +77,11 @@ do_install() {
 	rm -rf ${D}${datadir}/dbus-1/interfaces
 	test -d ${D}${datadir}/dbus-1 && rmdir --ignore-fail-on-non-empty ${D}${datadir}/dbus-1
 	rm -rf ${D}${libdir}/avahi
+
+	# Move example service files out of /etc/avahi/services so we don't
+	# advertise ssh & sftp-ssh by default
+	install -d ${D}${docdir}/avahi
+	mv ${D}${sysconfdir}/avahi/services/* ${D}${docdir}/avahi
 }
 
 PACKAGES =+ "${@bb.utils.contains("PACKAGECONFIG", "libdns_sd", "libavahi-compat-libdnssd", "", d)}"
-- 
2.26.2

