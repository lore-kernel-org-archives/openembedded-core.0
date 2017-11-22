Return-Path: <kristian.amlie@northern.tech>
Received: from mail-lf0-f65.google.com (mail-lf0-f65.google.com
	[209.85.215.65])
	by mail.openembedded.org (Postfix) with ESMTP id D05C578707
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Nov 2017 13:30:42 +0000 (UTC)
Received: by mail-lf0-f65.google.com with SMTP id o41so18233792lfi.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Nov 2017 05:30:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=northern.tech; s=google; h=from:to:subject:date:message-id;
	bh=Q0O+l8Hqb2inWghUnH4oB8rxMfl5vogqBbyGrQAlz28=;
	b=JuPVEcoZNcaMGHxTpx7ZTFKcm4btiFM8KbNbyCpB39ZUetI/LI3zf3DtAfipeSCHPn
	pjVEbCYj/4BpDYhH5aggCXN4ZcRMXI5vk1qz8W5Eh8mvYSVk3sJRy3u0HsJC9mx1oJnM
	ugIQyvCK8PdFIynyYcXMYlbFSk+Yl5f0HXw/IJ2v2VIVnP6d7jXHr6gu3UB07VAQ9nQy
	epTAt/Gaso+pFItd6Ef3yBIz07KIsPZfgrSwJHxbZKaT84lvp+CXAtKp3szkpis6iHud
	ceqN1YE9IXGUtMMBehbhemzBUMXuPVb7ePI9dQq5Pv2NoKYT9AvB4Sm3UDY89C/6kXlt
	62Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=Q0O+l8Hqb2inWghUnH4oB8rxMfl5vogqBbyGrQAlz28=;
	b=aMGC+gKUZkIAhRrn7PGQG51DxJEwcXTBW3u/hmxEjtCcGuPgUEMrThkk0OfKM0rPBD
	D67AZDdMPoSTg2sPmAsSlVmlBICkgwCCIOHOLtsReqQ7tTKYJuh/zmzhxj+koLYQn6Rq
	EF8qgsHLtrgI3Dwrnu6h8xFgs1I9mR7w0TDbNp3LDxs9+vlwIB9BuTFjGlwHBAhB9/Da
	+Jd9w+RGeZdoG4YFFsq8ffHeFZI/54SUKp63jrT3tnk1BtuAG9D1q3hE7J21GBhhXpdx
	MRbstYTNmY1clvD/asGWZGpXznZBKcDYuem5912dR6GOyyLmIqWBFH9zqi/vDj6yw7Nm
	nCZQ==
X-Gm-Message-State: AJaThX7XcA1Q1uo1B92062njRPbH0Qtn8CbRp5i/hhGzA8JHi25tCHk2
	YXXITJuaXdxA0VYc2gyFosYhWl457Jk=
X-Google-Smtp-Source: AGs4zMYQo5ETMoWkjz2pOEgymEgCDVos+ho2E6pu7+YyTyl0kTPdtjYLxFtnJXqs3ei0vaCHIzGALg==
X-Received: by 10.25.145.7 with SMTP id t7mr5993507lfd.103.1511357442773;
	Wed, 22 Nov 2017 05:30:42 -0800 (PST)
Received: from localhost.localdomain ([195.159.234.190])
	by smtp.googlemail.com with ESMTPSA id
	r101sm2845977lfi.17.2017.11.22.05.30.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 22 Nov 2017 05:30:41 -0800 (PST)
From: Kristian Amlie <kristian.amlie@northern.tech>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Nov 2017 14:30:40 +0100
Message-Id: <1511357440-7368-1-git-send-email-kristian.amlie@northern.tech>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH v1] systemd: Avoid fsck because time is out of sync on first boot.
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
X-List-Received-Date: Wed, 22 Nov 2017 13:30:43 -0000

By default, systemd uses its build time as the epoch. When systemd is
launched on a system without a real time clock, this time will be
detected as in the future and an fsck will be done.  Setting this to 0
results in an epoch of January 1, 1970 which is detected as an invalid
time and the fsck will be skipped.

Signed-off-by: Kristian Amlie <kristian.amlie@northern.tech>
---
 meta/recipes-core/systemd/systemd_234.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/systemd/systemd_234.bb b/meta/recipes-core/systemd/systemd_234.bb
index 6b8745b..86c04fe 100644
--- a/meta/recipes-core/systemd/systemd_234.bb
+++ b/meta/recipes-core/systemd/systemd_234.bb
@@ -170,6 +170,7 @@ EXTRA_OECONF = " --with-rootprefix=${rootprefix} \
                  --without-python \
                  --with-sysvrcnd-path=${sysconfdir} \
                  --with-firmware-path=${nonarch_base_libdir}/firmware \
+                 --with-time-epoch=0 \
                "
 # per the systemd README, define VALGRIND=1 to run under valgrind
 CFLAGS .= "${@bb.utils.contains('PACKAGECONFIG', 'valgrind', ' -DVALGRIND=1', '', d)}"
-- 
2.7.4


