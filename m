Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 800BAC04AA7
	for <webhook@archiver.kernel.org>; Wed, 20 Sep 2023 15:39:03 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web11.43219.1695224336616567320
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Sep 2023 08:38:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=KtvADn+r;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-40472c3faadso70514095e9.2
        for <openembedded-core@lists.openembedded.org>; Wed, 20 Sep 2023 08:38:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1695224335; x=1695829135; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UbDu62W8f0OUxThPfGt1HZkBNooF//fFooHLEdjzBkY=;
        b=KtvADn+r9Kjg4PhAhjYenX5/3rjNJQlVqPaXKvWdGRbLu+kcZs6nvCe0sFYtm5+wLV
         fEOYzk9Ycehe9seJ+ajeqPUSY0ZLqgjvePXQdTqOOPBH3VMnsPAc0Sgy6yZgsayhEmLb
         s5e+AJMQilzhA9NXOxK+gnVVe0TsuU2JXY8/o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695224335; x=1695829135;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UbDu62W8f0OUxThPfGt1HZkBNooF//fFooHLEdjzBkY=;
        b=agJ706erdqWrF940fXnTiGZi29Fhg7tHRNeblcVeYHvZlHH+WqxsQtJ0VvygmZ7L2x
         nDbGqA7bj3PklEmZe8271FpL6dS1LPGYckYJjO+F/gfFDeswAmI7TXR3WZpuYqF5Qcdn
         VrIzpXyWVMRk3F36q687y0rpZ0amjfHMSmw3fufkDikqyAWOgIyh1RxXvRW5025awGV3
         AbcgIrPA7LIMkHr4XHYJYYVqVPHE7mfUc8tiX+KSGttEB6FHQGBGkotiT7ZHxrdO+RjS
         qVAUXPwVFJvAn21uuPbc1lbkQPPqAyxbAZnlJ0NJihQGK+udUGrlx8ZrxjnDe+A9qkaY
         G8Sw==
X-Gm-Message-State: AOJu0YwHX53fdyQB391FYk+EaVR+OtslHM4SpnGWH1MFiRTnaDhiJ2K8
	eRMoKbXvUWNxX5LpITOMESfRDtLSboaYxEJR1Ws=
X-Google-Smtp-Source: AGHT+IHHC3llWFrKbXBlXHX56AbGjzQjl7y1Q4lrnQGKjiSK9OpuR43sxF097j+W2WKq7ehfVxYovw==
X-Received: by 2002:a7b:c3d0:0:b0:403:7b2:6d8f with SMTP id t16-20020a7bc3d0000000b0040307b26d8fmr3016716wmj.2.1695224334774;
        Wed, 20 Sep 2023 08:38:54 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:34a6:a1c2:97a:851d])
        by smtp.gmail.com with ESMTPSA id x1-20020a1c7c01000000b00402d34ea099sm2269688wmc.29.2023.09.20.08.38.54
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Sep 2023 08:38:54 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] bitbake.conf: No longer support PR from filename
Date: Wed, 20 Sep 2023 16:38:53 +0100
Message-Id: <20230920153853.1060224-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230920153853.1060224-1-richard.purdie@linuxfoundation.org>
References: <20230920153853.1060224-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Sep 2023 15:39:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187931

Nobody really sets PR from the recipe filename, we might as well drop
the overhead of the python function call and simplify the variable.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/bitbake.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 8b264618745..67577c8fe7e 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -237,7 +237,7 @@ ASSUME_PROVIDED = "\
 
 PN = "${@bb.parse.vars_from_file(d.getVar('FILE', False),d)[0] or 'defaultpkgname'}"
 PV = "${@bb.parse.vars_from_file(d.getVar('FILE', False),d)[1] or '1.0'}"
-PR = "${@bb.parse.vars_from_file(d.getVar('FILE', False),d)[2] or 'r0'}"
+PR = "r0"
 PE = ""
 PF = "${PN}-${EXTENDPE}${PV}-${PR}"
 EXTENDPE = "${@['','${PE}_'][int(d.getVar('PE') or 0) > 0]}"
-- 
2.39.2


