Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
	[209.85.214.195])
	by mail.openembedded.org (Postfix) with ESMTP id CFEA361B66
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Mar 2020 01:15:33 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id g6so4741872plt.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Mar 2020 18:15:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=J2xUVHK1cO27xweYjgoI+vuCY+ZZocu21z8ZJoTVq6s=;
	b=AQSrc5LC+xMwEUs2U3B1bO/kGWy/q0YNTb+anEi1EjL+kXds/1HSqGCQbjI57XcwFr
	PGJEnKP/P2ezWjcXJ3+5vccykYyX6oiz+OstTh11NPjJIdzvc8TMqmIupVL5XPCP+t0Z
	+7ykhH+O/GkT+IiK5RhdMN9+0Ub1soFckiI0tKuvKJtSLYepV5qYH4X/qlPq8wsePm6m
	t01oAsCZBCR4WXb5eBfJQpB4i60eGAqAJtXu9/a4Aw9ZBQ6K9Umczam3/NJ5uQcISlsS
	CQi+WX2BRwX6Ku2JzWip86UR9MydkQAMeWRfoiB2E+EvFYvy/6kH2tfMQOqmPb6oaV/6
	zn6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=J2xUVHK1cO27xweYjgoI+vuCY+ZZocu21z8ZJoTVq6s=;
	b=rzDFPTMuO+DuqwnJidedqEUJh4A6XLLtghXip8gjz+ApNIK91BCXGZnpXtck4iOeEu
	TsmUJj5PTR/WcB5wZyEQpXZxGg0U3AzKodpPR/FFVU5TfG1YEZvfNLx3Vr+YUasvfURZ
	IYOzuzq6ff5ASbJ6bUBteSxVzGlIEjC2ijq9FhmeCqccDRrSScMPhwRCSSS/nB5AgVwc
	VnkyDXJd9OIfumHwtSf7N3Th0vD2d9JXKNAEeJ+FD/EAPF+bIUXnHAD3LLS5fHCUiYb2
	wz9SPeaQCTsqxlrWhfKIw1xrMBW4PnHn7G/B7RrX6eypJthdwZ01pVjAGuknek/hq1dN
	cX1A==
X-Gm-Message-State: ANhLgQ1AUc6BJCYBzaRaBoqgLWei0YRMZrFLrPLdq9adrYvUsOAsjZ/6
	3seTIuRyNwMnidRS462+8lm3qi0VRrs=
X-Google-Smtp-Source: ADFU+vv1izASQ2KV2k0tslK25agXNXRgwP8Sili4RcbMnGVG4j8S4HxaCNHbC0Xan6nKPx8HKbhFmA==
X-Received: by 2002:a17:90a:cf0c:: with SMTP id
	h12mr2107931pju.164.1583802934565; 
	Mon, 09 Mar 2020 18:15:34 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::1c34])
	by smtp.gmail.com with ESMTPSA id na18sm737200pjb.9.2020.03.09.18.15.33
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 09 Mar 2020 18:15:34 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  9 Mar 2020 18:15:44 -0700
Message-Id: <20200310011544.3022342-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200310011544.3022342-1-raj.khem@gmail.com>
References: <20200310011544.3022342-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [PATCH V2 3/3] dbus-test: Replace cp -a/-r with portable options
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
X-List-Received-Date: Tue, 10 Mar 2020 01:15:35 -0000
Content-Transfer-Encoding: 8bit

-r are not posix defined and -a leaks UID of
build user into target

Errors like below are fixed when -a is used

bus/connection.h is owned by uid 1000, which is the same as t
he user running bitbake. This may be due to host contamination

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Improve commit message for clear reason for change

 meta/recipes-core/dbus/dbus-test_1.12.16.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/dbus/dbus-test_1.12.16.bb b/meta/recipes-core/dbus/dbus-test_1.12.16.bb
index bea0e74ed0..91e2ba69d2 100644
--- a/meta/recipes-core/dbus/dbus-test_1.12.16.bb
+++ b/meta/recipes-core/dbus/dbus-test_1.12.16.bb
@@ -70,11 +70,11 @@ do_install_ptest() {
 
 	install ${B}/test/test-segfault ${D}${PTEST_PATH}/test
 
-	cp -r ${B}/test/data ${D}${PTEST_PATH}/test
+	cp -R --no-dereference --preserve=mode,links ${B}/test/data ${D}${PTEST_PATH}/test
 	install ${B}/dbus/.libs/test-dbus ${D}${PTEST_PATH}/test
 
 	install -d ${D}${PTEST_PATH}/test/.libs
-	cp -a ${B}/dbus/.libs/*.so* ${D}${PTEST_PATH}/test/.libs
+	cp -R --no-dereference --preserve=mode,links ${B}/dbus/.libs/*.so* ${D}${PTEST_PATH}/test/.libs
 
 	# Remove build host references...
 	find "${D}${PTEST_PATH}/test/data" \( -name *.service -o -name *.conf -o -name "*.aaprofile" \) -type f -exec \
-- 
2.25.1


