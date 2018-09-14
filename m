Return-Path: <nathan@nathanrossi.com>
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
	[209.85.215.194])
	by mail.openembedded.org (Postfix) with ESMTP id E83E9798EA
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Sep 2018 11:10:16 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id 7-v6so4258418pgf.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Sep 2018 04:10:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nathanrossi.com; s=google;
	h=date:message-id:from:to:cc:subject:content-transfer-encoding
	:mime-version; bh=lcW96jEbfGMLoFD6B4uL/w0DmtReWMaYve2XaJdAtE4=;
	b=Z2hUo8f5GdiGfuqJZy0uLNrILtw99gM1vRyy4pVHRJdJRF6t3e8R3p6p60+vwd2Tsd
	85ev2uqOtrNE36I+vbxyC4k30QnWHWjkTcrZC6KgzSb3yKTkRc10kVapr8SqRdnlShkm
	yeX1LEG6HUMv0IdpCNkdDAEjkdQsSMz2bYAHxgktnBy+XRf3+0mo/DC/ohWRkVvi5Zpn
	We2Ec9OtEHYTHp8pKQRBDU8UeyigL0mK+supKt5ZbyG3kudHiccdqaXbaUpHUbebPeRC
	bWVhWNc1x+t0InL2yObBTJiB8czbhL51ag81uO3n+HHJDDW62Vw/vvXiNfk6cyte1Bzr
	7zLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:message-id:from:to:cc:subject
	:content-transfer-encoding:mime-version;
	bh=lcW96jEbfGMLoFD6B4uL/w0DmtReWMaYve2XaJdAtE4=;
	b=tYE1UfRYFQsMwJ4HxCa7iNIrv/DPd16zPKYiLJ86NTaTGDZu50heGMBgSfALKUh6tp
	3CG2E9SaeGBN1jmKIfDsFnKbTdcF7atiqvzbgEdUZNYdnt4fOhei3AFjc+75Eewq5e2/
	YmwU/gd8KMlMW7UlmFI7fVYHz3zaelBdTXhGbz0//JaP7Cpj5f2ZUDzBb0Qj1cdMSil2
	8VO408b89K30P3+KuedLhe/41Z1erh5RxdhMy1Q8nOjEshEqF7bt/JCkAoA+I0CKir6y
	ns7hZ/4IZYSCEQ1UosdX1gSKra6664zsQD+N2K32qzDJeT6fC1OhiEop6NPy7B+1/LlG
	dF0g==
X-Gm-Message-State: APzg51CljUtYKqgDRhOGmBMIXI73i/aL5dygWgl4h/FWhtm3qWoasNea
	KSh/FbL1J77dP0k4GC163MtqcQ==
X-Google-Smtp-Source: ANB0VdZkOhBUPGQOGs7nx7Zuo+Yqlc8ajj3QALVG9zFJWQRmdbSmgYEupFDzdO+yf0eLMBiHNNX6ng==
X-Received: by 2002:a62:ee06:: with SMTP id e6-v6mr12151151pfi.2.1536923417905;
	Fri, 14 Sep 2018 04:10:17 -0700 (PDT)
Received: from [127.0.1.1] ([101.184.120.183])
	by smtp.gmail.com with UTF8SMTPSA id
	v7-v6sm7513519pgh.57.2018.09.14.04.10.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 14 Sep 2018 04:10:17 -0700 (PDT)
Date: Fri, 14 Sep 2018 11:10:07 +0000
Message-Id: <20180914111007.14959-1-nathan@nathanrossi.com>
From: Nathan Rossi <nathan@nathanrossi.com>
To: openembedded-core@lists.openembedded.org
MIME-Version: 1.0
Subject: [PATCH] libgloss_3.0.0.bb: Consolidate rmdir with -p
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
X-List-Received-Date: Fri, 14 Sep 2018 11:10:17 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Consolidate the rmdir of multiple directories with the use of -p to
delete the leaf empty directory and any empty ancestor directories.

Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
---
 meta/recipes-core/newlib/libgloss_3.0.0.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/recipes-core/newlib/libgloss_3.0.0.bb b/meta/recipes-core/newlib/libgloss_3.0.0.bb
index 727062ca5d..e412153dab 100644
--- a/meta/recipes-core/newlib/libgloss_3.0.0.bb
+++ b/meta/recipes-core/newlib/libgloss_3.0.0.bb
@@ -21,8 +21,7 @@ do_install_append() {
 	mv -v ${D}${prefix}/${TARGET_SYS}/lib/* ${D}${libdir}
 
 	# Remove original directory
-	rmdir ${D}${prefix}/${TARGET_SYS}/lib
-	rmdir ${D}${prefix}/${TARGET_SYS}
+	rmdir -p --ignore-fail-on-non-empty ${D}${prefix}/${TARGET_SYS}/lib
 }
 
 # Split packages correctly
---
2.18.0

