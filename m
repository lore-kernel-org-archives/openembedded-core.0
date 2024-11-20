Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 209A2D6C289
	for <webhook@archiver.kernel.org>; Wed, 20 Nov 2024 10:10:43 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
 by mx.groups.io with SMTP id smtpd.web10.10261.1732097438574240721
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Nov 2024 02:10:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=moKqbcyd;
 spf=pass (domain: linaro.org, ip: 209.85.167.44, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-539eb97f26aso7015140e87.2
        for <openembedded-core@lists.openembedded.org>; Wed, 20 Nov 2024 02:10:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732097436; x=1732702236; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v/CXOB6HfqEPqE3gPJNWBuc1uT3Bg0Fj6Th8SQLPNuY=;
        b=moKqbcydfhGCLpLmRibxDiD45oiIvacNfUNRwE9QusAdK+bLm5zQz6TP7M/1j/QDNA
         JQuHG7vvFetJPNGyg1jcMVw8GppQ9gBpr0YZfil4T3t4Dev2O29q9QJYYHHNIalw/ymP
         rCE+WBjV1hz5SvTT9Aec/bBS1X2r/8u7FeeWFr6OynVfPJY8MA1GNubdDysdBaP2ourH
         aa4G5GzOZltqXdXdcligaw8AK6EyGA5KrMrkM97A4VijTeC8jK7L0JoiIjeD1ucl8bQK
         6tYVOEMiTlKvHa52o4aDYP45oTuvFmU2nn/yoD/1EcMXJNGSR52eXL372UAUALF4Ahbs
         ODlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732097436; x=1732702236;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v/CXOB6HfqEPqE3gPJNWBuc1uT3Bg0Fj6Th8SQLPNuY=;
        b=QFojCBQzHfC5Zbqcx3Pkh/AcNLAmEBeS1xe0OfzVlu8ZMEJvLf86XSMYfFpLqoyZ5g
         ji6PH/XOU5zuR9VWgKMgnXhAn3U4VqlvBkUk/4A1MGCmga5JgPr/cMepxumgoVvCadwX
         Xty0laD13AAG1f1HOUpeVUdscwxwwd4mtdPePzA8weqZeggi7cJiWyYnHKFOosDsl1zI
         jHabimr2bLH9CrihqQ8UOjRO6YT+XwasKImDzBPZpLjsvEQi5FXPn79S0u7BsyrErGOq
         UjFqiexMXZCbd61Dk3VNjOVJGfI5Ds4QAWaA5ncziTqNUXBW8BSLwi/72xNcqP9u/PAj
         mSJg==
X-Gm-Message-State: AOJu0Yy3gfIvyOU510z9RyiTuwG7Mmd3qT/rCUhpzhoF8O+fjuoke1e1
	gLWlK90qwUPLjUfL2SdLKVVqGnf5EfcLUlIso0fJZPRN6k+CAfHKMC1J7QodHArkOkWmK4p0g9s
	nKPU=
X-Google-Smtp-Source: AGHT+IGmOs7SrBKZJFvXGg8YQmJUkHozqgf8uuKLHzjtjubOA/5ciD0FgmiGF6EMKq12PfcB2GvdhQ==
X-Received: by 2002:a05:6512:118d:b0:539:ee0a:4f8f with SMTP id 2adb3069b0e04-53dc136aa46mr965816e87.44.1732097436382;
        Wed, 20 Nov 2024 02:10:36 -0800 (PST)
Received: from localhost.localdomain (78-27-76-97.bb.dnainternet.fi. [78.27.76.97])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53dbd472719sm569998e87.211.2024.11.20.02.10.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Nov 2024 02:10:34 -0800 (PST)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH] testimage.bbclass: change test failure logging from bb.fatal() to bb.error()
Date: Wed, 20 Nov 2024 12:10:07 +0200
Message-ID: <20241120101007.91244-1-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <1809A08EEA6B2440.29057@lists.openembedded.org>
References: <1809A08EEA6B2440.29057@lists.openembedded.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Nov 2024 10:10:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207419

bb.fatal() exists right away while bb.error() does some cleanup
before exiting. Fixes running tests during image build with TESTIMAGE_AUTO
multiple times in a row when some of the tests fail:

$ killall -9 Cooker ; bitbake -c clean core-image-base ; \
bitbake core-image-base ; \
bitbake core-image-base

With bb.fatal() something in cleanup is not done and second
image build builds an empty rootfs into .wic image.
Workaround is to kill Cooker processes between bitbake calls,
or to switch testimage.bbclass from bb.fatal() to bb.error()
logging which is done here.

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 meta/classes-recipe/testimage.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes-recipe/testimage.bbclass b/meta/classes-recipe/testimage.bbclass
index a9b031093a..055002d3fd 100644
--- a/meta/classes-recipe/testimage.bbclass
+++ b/meta/classes-recipe/testimage.bbclass
@@ -399,9 +399,9 @@ def testimage_main(d):
     os.symlink(d.getVar("BB_LOGFILE"), os.path.join(targetdir, os.path.basename(d.getVar("BB_LOGFILE") + "." + d.getVar('DATETIME'))))
 
     if not results or not complete:
-        bb.fatal('%s - FAILED - tests were interrupted during execution, check the logs in %s' % (pn, d.getVar("LOG_DIR")), forcelog=True)
+        bb.error('%s - FAILED - tests were interrupted during execution, check the logs in %s' % (pn, d.getVar("LOG_DIR")), forcelog=True)
     if not results.wasSuccessful():
-        bb.fatal('%s - FAILED - also check the logs in %s' % (pn, d.getVar("LOG_DIR")), forcelog=True)
+        bb.error('%s - FAILED - also check the logs in %s' % (pn, d.getVar("LOG_DIR")), forcelog=True)
 
 def get_runtime_paths(d):
     """
-- 
2.34.1


