Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 153E7C5AD5A
	for <webhook@archiver.kernel.org>; Sat, 15 Aug 2026 12:46:37 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8166.1786797986918087616
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Aug 2026 05:46:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=gsrAALDE;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-482938466a7so847798f8f.1
        for <openembedded-core@lists.openembedded.org>; Sat, 15 Aug 2026 05:46:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1786797985; x=1787402785; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=e+IV9apLKlzH+6/S9VuTrP+g76IDtgsSPGn+LpYfdq8=;
        b=gsrAALDE8UgRsaD2VtKqbkXrEj8x2L0jJkP2bvWMdgY5nmoY8Ap1iZ9+C6o6y8p9xj
         iCUc13r6tRI/Bw9r//dlxli1YsGDl9baoTNP43PxdXbGGl2R1AZ7Pdasmp7evQXhLZeL
         fypr3NAEqrfnwKHMxA3yI7uhXVZf3aJ67qIOE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786797985; x=1787402785;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=e+IV9apLKlzH+6/S9VuTrP+g76IDtgsSPGn+LpYfdq8=;
        b=WIA3WkSR4LHC0v/cr9HWwoajzPU9eW/FSU4RBF2nF2kZ7VfFsXGiaxz3hL5OefXZGB
         oyaNQvKVdsCRB4zS6MKp5wkvjCQVzij5yysUyQzteKErTNA3bdbjRpI11ddw6n79Z3Le
         J4RD6RpaTuyhDYWJboGOHZ+NR/Uy2toavDOpQbJGbSer7W5efBuoilGXiMugzuvrn9Ni
         4oTc7zBy2KLFcjDH5MwDxDhOW6cmqrbEqjwvaoRjXAukEO39VHLOEC8u9X/6Vp61YsG+
         6Qdsf60vwerFljoZPjU/g14KyhqJSzHTNKwUwvJbITxzzz9NwZYhBDRhbwxWwf4ZIq3g
         52Fw==
X-Gm-Message-State: AOJu0YzJ5wCPl7Lcx4ZWrMxlHqLGY+BcB5373jO6incNbS3CeWF+dwWj
	rE7BXG9KRmosFZjtP50Ax9mXgMjnWCh9LPb2mkArt15Pfk2of1bVLGd0/Banz2JIRTSGVRr+xk3
	lS5sKNv4=
X-Gm-Gg: AR+sD128cw3TVE2hgTp0rY6eaIWUQW5ySNn5VMX0SnYb9BpnaYp+R9Zx1RtVssMLdKz
	VfeetAXhT7JF/zP7VoCcQlFg3vgv6wYKCq+PEflxFRocMTk2zYw9ZeqwvvW5eBOYUQyHD/4aIQD
	qupfWLgavGPXGPG9bjtk+eOOPBOQc9cE1dC2UjSSlJ6Lxi6DpylLud1EhsedYrU/lNpl0luSmwG
	OwsC+MEWU3g2Rm6eUZe373yBSZeubgdCvnjcpbZ05bY5NN4F/wxaJ5B678nVLqoa6Z/vOYDAp32
	7DfiKMQ8CbOpYWIEZyp1hPSUEWpkk8mTN/4Rc3K0WwagWi6eFdVhK7qijYxBea2deymolWFRrOz
	/V6N/JJPZWFRBb/csXMRLqyeA68hTKCJO0KXH6wi37SDb559z9zNLqVnOaSLQ1K+XurDUVXM0AO
	lqb69O1gO8IPY5zIAt6UnmWz6pJTaMgb5Gvpb1NR/Ya3YzWMn032ONH2sUqBTt9mYTTjQOeYsrV
	Jp8ZXCA8UIq8WWcwUJOl7NwVKA=
X-Received: by 2002:a5d:4d0e:0:b0:481:4f9b:282b with SMTP id ffacd0b85a97d-48160764a5amr16024221f8f.21.1786797985191;
        Sat, 15 Aug 2026 05:46:25 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:76a9:d146:8f01:f2e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4815f200752sm17245267f8f.1.2026.08.15.05.46.24
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Aug 2026 05:46:24 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/4] diffoscope: upgrade 327 -> 328
Date: Sat, 15 Aug 2026 13:46:20 +0100
Message-ID: <20260815124622.3666801-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260815124622.3666801-1-richard.purdie@linuxfoundation.org>
References: <20260815124622.3666801-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Aug 2026 12:46:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243483

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../diffoscope/{diffoscope_327.bb => diffoscope_328.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/diffoscope/{diffoscope_327.bb => diffoscope_328.bb} (93%)

diff --git a/meta/recipes-support/diffoscope/diffoscope_327.bb b/meta/recipes-support/diffoscope/diffoscope_328.bb
similarity index 93%
rename from meta/recipes-support/diffoscope/diffoscope_327.bb
rename to meta/recipes-support/diffoscope/diffoscope_328.bb
index 30d33732f6e..7b4bd7640b0 100644
--- a/meta/recipes-support/diffoscope/diffoscope_327.bb
+++ b/meta/recipes-support/diffoscope/diffoscope_328.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "b5a398de17b180637cf091ba5c3c9fecde9dc8f5c2c80204ff8dd78e1b9d5358"
+SRC_URI[sha256sum] = "8480ddffa8cc4860c6ada3c9c80a8169e75d6a39ad971662851f1ad776512870"
 
 RDEPENDS:${PN} += "\
         binutils \

