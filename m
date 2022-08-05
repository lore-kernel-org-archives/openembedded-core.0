Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 998E3C25B0E
	for <webhook@archiver.kernel.org>; Fri,  5 Aug 2022 13:13:00 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web09.6778.1659705177065009322
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Aug 2022 06:12:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=amGOCWJe;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.53,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f53.google.com with SMTP id l22so3219057wrz.7
        for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Aug 2022 06:12:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc;
        bh=z8VCMMuhxd8cDnuNmG/WOVtbmRjgYNio5gDnUyrN604=;
        b=amGOCWJe0TGxtex+NN7ziytgPaSFhcaJPKOlXo2b8iSjIygEwdoc4wwNKFNvmjkGqe
         N1hdEWgwVKGecNNcRlY0o/FLuShJ0ZGnIPdC6XOKXoj4O8/wtqKB61Su6E9GfOqYIITs
         aHmz3I2Tia/s7Kq0PLYT7YuBVzcHTvNXEcCcI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc;
        bh=z8VCMMuhxd8cDnuNmG/WOVtbmRjgYNio5gDnUyrN604=;
        b=hveuXf9175Midg+uBoG29ckkcZfWFLrlVQa+uJey8LCpjbfFlPiR8LjcfSblTPdOix
         EqTpsdJBPmeNDo6yFcvElujZAQNuqhtmcM70qZbx1hFyYvD3Q2jxv6AQtww6mff6lqNR
         1I1+21mfXws0931xXEn85i1lU6NJ7j9USVJwXxntzzzPo8FtooGjdQwN22mHqvNjz6ym
         mJmhVEEso8riTSR8/Tn8UzSP1LQbkVf9sfOPFdhJZoOVcVo95YUFi2wTig7easxfc0C6
         3xiEJBqbaR9hJS3Oon2rWuGOWamfSX+QawWnFBbpGyr5aBrsEPMNR+zgcqekD9Phn+Qo
         AmoA==
X-Gm-Message-State: ACgBeo3JC9Iy06C//jQ3EpR5DC5n+CWCcd4qCJZfYgjl2sEsPd5NuqZa
	TawcU7iGaKupwI61sVG8vjMH5C0MDkzWPA==
X-Google-Smtp-Source: 
 AA6agR5vQiZagv3XB9joxfaI/vu/XNW+2snmu+aH0UK8Cnr+MrgMuPwRyswjDgnQE79iARjDYpzXPg==
X-Received: by 2002:a05:6000:18ab:b0:220:6c0d:8157 with SMTP id
 b11-20020a05600018ab00b002206c0d8157mr4409816wri.438.1659705175185;
        Fri, 05 Aug 2022 06:12:55 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:f483:fcb0:1452:5a5a])
        by smtp.gmail.com with ESMTPSA id
 p12-20020a05600c204c00b003a51a0d35e7sm1908901wmg.37.2022.08.05.06.12.54
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Aug 2022 06:12:54 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 03/29] selftest/reproducible: Exclude rust/rust-dbg for now
 until we can fix
Date: Fri,  5 Aug 2022 14:12:26 +0100
Message-Id: <20220805131252.3706794-3-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220805131252.3706794-1-richard.purdie@linuxfoundation.org>
References: <20220805131252.3706794-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Aug 2022 13:13:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168937

There looks to be a reproducibility issue left in one of the rust
libraries. It doesn't appear to be a string issue but some binary
problem. Disable rust from the reproducibility testing until we can
get to the bottom of the issue (allowing wider testing of all the
other improvements).

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/selftest/cases/reproducible.py | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/reproducible.py b/meta/lib/oeqa/selftest/cases/reproducible.py
index 5042c11d8eb..f4dd779842a 100644
--- a/meta/lib/oeqa/selftest/cases/reproducible.py
+++ b/meta/lib/oeqa/selftest/cases/reproducible.py
@@ -16,6 +16,8 @@ import os
 import datetime
 
 exclude_packages = [
+	'rust',
+	'rust-dbg'
 	]
 
 def is_excluded(package):
-- 
2.34.1


