Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f65.google.com (mail-pl0-f65.google.com
	[209.85.160.65])
	by mail.openembedded.org (Postfix) with ESMTP id 1D6CD7922F
	for <openembedded-core@lists.openembedded.org>;
	Sun, 19 Aug 2018 17:23:56 +0000 (UTC)
Received: by mail-pl0-f65.google.com with SMTP id c6-v6so1099581pls.4
	for <openembedded-core@lists.openembedded.org>;
	Sun, 19 Aug 2018 10:23:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=LLSa+1FFOYXZIhwiE85U9yNuZhxaeBesfS3+zgZhh8g=;
	b=s394nI0F9Yx/vW64z135RKkJuqoJKr17LdQK/7X/JkWFCZsAfkoWzZuFoeNbl/xXwl
	6wf3FK0rUTgiTnS8b0FN5SRCT+0eYVA/F4SWMbv0Wv1YklIqDAr7ZMhNTfMXuFFOwZad
	/6S2YpZ9FZ9M9F3WO4Z2lI7SPSSE7rn6LgTC/TeZySDLEEwKaQJnJ0sAx933i2Lf7p2F
	4PSxbgsMp57wUeudrWGlClJ1MZtxyQhpUVW/wHextkr/9pEtQbeOm0jfocBCqns/NAPl
	TPe2wJBLVb8EMvLy51D1HRrwMOcAWZabl1vcRzI4XkyUfdkpqH4BZTsp4JsxipHVhQOA
	AQvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=LLSa+1FFOYXZIhwiE85U9yNuZhxaeBesfS3+zgZhh8g=;
	b=lVQD9t4Dx22Ng+Imu7RpzFSvRC3SEkV+Lf3oCpoiebAr3UABK2kZpGyZHdOw1lupdx
	Nm3DmR+O4HwPQIUu776q7OPigb+t6H5T4CHTQXM5dhJyykAKmAxvjnfHN4iBRGu7BtSO
	iiVfgraK6o5GBsdrKvuTFYb5BQyt4IXLb2sW0gQ+PplPS6HeqTLc7+t7XcfTiXVRCFho
	o9E1IDE+Us3WKEpmnnMm/6VvbH2uK8x+C1gyG3Wle4HcGyue/0tztJ4ZN4WNJegeHEHk
	Ad/sm+Yz+iOm876pWLCt+3GbJi9X4DMPgKtLNbCiv9WdC0I9UkkBsEc5PHUaoDiTuFUs
	ZQUQ==
X-Gm-Message-State: AOUpUlHJ8CET6Ezra1rvZUFsqvoqOU9fHMPaF6uJeAMhGofVV1uXgSpC
	rH+FRTPZtX5RanSAp/IuxV0ffUOj
X-Google-Smtp-Source: AA+uWPwPn9PqozQaYk4KrUnPm4BbGSkzNCPRL61Ge8sNyVgZJlMi2WmnOGb9psZNUghaW1dL8hrnQg==
X-Received: by 2002:a17:902:8604:: with SMTP id
	f4-v6mr42417882plo.225.1534699436933; 
	Sun, 19 Aug 2018 10:23:56 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::4add])
	by smtp.gmail.com with ESMTPSA id
	x1-v6sm8293466pgr.59.2018.08.19.10.23.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 19 Aug 2018 10:23:56 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 19 Aug 2018 10:23:41 -0700
Message-Id: <911a9ac98e1ad924f22dff0582b276a0ff1cd74b.1534699224.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <cover.1534699224.git.raj.khem@gmail.com>
References: <cover.1534699224.git.raj.khem@gmail.com>
Subject: [PATCH 9/9] libidn2: Fix libunistring detection
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
X-List-Received-Date: Sun, 19 Aug 2018 17:23:56 -0000

libunistring is one such library which many autotooled packages
mistake to use from build system if its installed on it. This
is specifically toxic when build host arch is same as target arch
since we only see the problem during runtime but thankfully OE
has build time QA which warns about it.

QA Issue: libidn2: The compile log indicates that host include and/or library paths were used.

Using --with-libunistring-prefix nudges the autoconf system for the
component to first look into target sysroot before going on to search
on the build host

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-extended/libidn/libidn2_2.0.5.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-extended/libidn/libidn2_2.0.5.bb b/meta/recipes-extended/libidn/libidn2_2.0.5.bb
index 0d7bddbc7f..0daf7a6877 100644
--- a/meta/recipes-extended/libidn/libidn2_2.0.5.bb
+++ b/meta/recipes-extended/libidn/libidn2_2.0.5.bb
@@ -19,6 +19,10 @@ DEPENDS = "virtual/libiconv libunistring"
 
 inherit pkgconfig autotools gettext texinfo gtk-doc lib_package
 
+EXTRA_OECONF += "--disable-rpath \
+                 --with-libunistring-prefix=${STAGING_EXECPREFIXDIR} \
+                 "
+
 LICENSE_${PN} = "(GPLv2+ | LGPLv3)"
 LICENSE_${PN}-bin = "GPLv3+"
 
-- 
2.18.0


