Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web11.40997.1590446284181612341
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 May 2020 15:38:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=nKSjzYyD;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.176, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f176.google.com with SMTP id x18so6773785pll.6
        for <openembedded-core@lists.openembedded.org>; Mon, 25 May 2020 15:38:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=IqaXHh5Pop8oiTf1cyHSoOl/FQJJH4N69G76Vpkxlgo=;
        b=nKSjzYyDYzI7DolK8ePa0InDdACoRC+tjapDcjKltpmQe2OY+1t5N7ExrJ4fTJEDNV
         trCcMHEkw3FFinxL24A6op1P/Txoa/frYvCX2QaIk4lmiz5KxEIDcLd1xlvSt9Zi1YDU
         BT1p2jdif1TizSks1I8uR+TIGpNGloipozj4iystrxQ5Xn8CMOlMGY3V06TXKPVFMiEU
         eGU2jAMjODtD2uZFJ3sBUPCyY7kfHvhvW7xFfTgdC+NsfQa5/IEN/cxR2H6aa9B4oidE
         1HOLmpHxsh4B4lx0EwhOAklXDSsdtjbqrS1fa4/lgGcEfa7RU/xnb5XQte69yL61pOd0
         Mx4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=IqaXHh5Pop8oiTf1cyHSoOl/FQJJH4N69G76Vpkxlgo=;
        b=uNriNiV6aA2c0GrAbjTjG84aDZL8SP0PHdX8oOHRO2NWnbGHHkygwTVcfrYSKYm8VI
         e8GSOatX7BPKtE48k6hWix5+nvbepE8QWF0D2GlMJN5Ftukg+iEK6VagzjnWU8YEJQMu
         7ke3QseQ92iJmV8xzVLHkjM6LD0FK2YWtUVnKASc9u9MU09vpXQo0pNIe0N37n82devn
         Epg3NCDiyPNPtJCo32Z5ray3aETEgKzeeWD4KqMZRhFcjdx5/yMxlY9sbvBqZ+lVPZja
         iBgcbah2UB9LU48xZ0ZuK08niB7ksAp7yVI5g6M/mKusibj3Rm8+eV882qPWMbg8/BV3
         9qCQ==
X-Gm-Message-State: AOAM532A9vXnDIz2cXvA7ro0EpAThm3LtYBSxDtJZCAso4xcipXHzy73
	4kTlt3hEOVmRHFe+5NQP1TKF13AFvJM=
X-Google-Smtp-Source: ABdhPJzJCIkU/kENa0LSu9q+taYTE7vpcnwRAuzcV2QAtEVedlPaxvcnmW7enBnykWYc3OAF14ctAA==
X-Received: by 2002:a17:90a:f004:: with SMTP id bt4mr12925415pjb.128.1590446283304;
        Mon, 25 May 2020 15:38:03 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id y23sm1990432pje.3.2020.05.25.15.38.02
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2020 15:38:02 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 17/17] avahi: Don't advertise example services by default
Date: Mon, 25 May 2020 12:37:03 -1000
Message-Id: <82ef6731c200fc0ce518f74f5d55c9381ea26317.1590445868.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1590445868.git.steve@sakoman.com>
References: <cover.1590445868.git.steve@sakoman.com>

From: Paul Barker <pbarker@konsulko.com>

The example service files are placed into /etc/avahi/services when we
run `make install` for avahi. This results in ssh and sftp-ssh services
being announced by default even if no ssh server is installed in an
image.

These example files should be moved away to another location such as
/usr/share/doc/avahi (taking inspiration from Arch Linux).

Signed-off-by: Paul Barker <pbarker@konsulko.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.17.1

