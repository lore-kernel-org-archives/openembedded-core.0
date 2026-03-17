Return-Path: <michalwsieron@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B63B8FF6E70
	for <webhook@archiver.kernel.org>; Tue, 17 Mar 2026 20:29:25 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.86043.1773779364813366270
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Mar 2026 13:29:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MFrzo5Bj;
 spf=pass (domain: gmail.com, ip: 209.85.208.52, mailfrom: michalwsieron@gmail.com)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-66778a3c1c4so1374142a12.2
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Mar 2026 13:29:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773779363; x=1774384163; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VPf/V94lFEk6e772LqQe/vDb6RywCzY8qv34drg5/pY=;
        b=MFrzo5BjwTMU/7pPQk2SOmuHzOyk0gV0YaTWrG5TwcLcjVD+GywPu2neBprL6drXT9
         7AtVVGODZM21lHxNEeqqfaajWWK2rS9v1FlRigXG/V7Era42w8m045iiI+rJsIXmYJsg
         s8ewH2P04bqZLa6F59BX4zZnP9Tlmec6pP7F5ilBxw0iT5EYuJDc2vEKQvbzZFWT2/3f
         Zk9se0DwTuDUgufjpqs5wqX77ZR8ClbRiNmSlejziYRkrtkMBhg9nSrmlcvL5p2jeG5c
         EDQ/F0ilI7AYGmTxL/MuReCtfwpVC3/V3ujQK1k7Ojo3upGlbTfPdDA/5KSvwv2tzaHT
         q0CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773779363; x=1774384163;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VPf/V94lFEk6e772LqQe/vDb6RywCzY8qv34drg5/pY=;
        b=k9JWuhpx4+f2U6jgD3YUh84Sl8suJtxg+WTAl0MDosbqOy++r2mMZ3XGaqip/LrkYB
         LM9SfgB+T2zh+hxJ5yYCLmFaDjZPEgg0SUfRjdMijspY/5lrCcDBxTrjyj9TOHSeXCf/
         Uf2raH3Q5pZzz5Bqz9QDcX9F9xQL6sJB9zlqP2Hh50DQAQoCINNnaPBMskaFTsZozRme
         eR4+wIjc5cM/7zTAwrqgDcEhLW9gqfjgfE7mf6xRL73otjdR+oNjzziOyztr5WAo1y/c
         Y2sglodOMJfxiOl3PPTb46DPt7I1/Z0Kc0M7A8B3+na2ETlGYcL6tVikFS+KO7a9Ffey
         W1Lg==
X-Gm-Message-State: AOJu0YyHOPITt5SCi4H6nYl6AodMRg7j3yZKyXdn/AgDTCSBsx6pZckH
	CMGUFUkG2HHUIm9ObQ2S7EqeG70txKOz/Ul0FeVFARP1VhJAoQsrv0Hz
X-Gm-Gg: ATEYQzyt4ewZE0ie6FeCWau2QXnYNiz4JtxVoHFM65BRhkG1nKHJnGizDGUAdReT8QV
	BEM9BdpPHfYfuU0X2/yRHdR1EI/zASFd/Mp7YkoW8EpDSa9T9bvI9cKYW3xfzSCSsrOSapGf4Tj
	4MQZwBMvM+tUbOAs+hTdrRWQ5hymoogqZQiP2+l8Woo4BlGZjMzR71a1FZHps8WCsrRUXknFEWo
	auubqnFlTZx+VXV//Dnd+FLufBY/AjgqLFfuONLu8L37yLfKLe4mX+88Zr2jMhrTTBWRmAEZn89
	JIfIGeev+JZBEbPfa4ng1lvLEHPob8LQeaf3WR6Hqb0eb5Ag1DGlcNWkUf5swKdRS8yPRtmyFCj
	HMq+AxYVFimf8AN+eqyurdgVyI2ewsZ7ODxA+FbzTf4lJrkOtQPp18xoulG6jpYgib9U62b7PPc
	FjeFxZKHCCJQSE4WiiQoWabgo0e+WnhqaoNnxjSlynD0lPu2F3WAL8e54WCVPBf48=
X-Received: by 2002:a05:6402:401e:b0:663:71dc:1278 with SMTP id 4fb4d7f45d1cf-667b214e0a3mr725433a12.1.1773779362982;
        Tue, 17 Mar 2026 13:29:22 -0700 (PDT)
Received: from [127.0.1.1] (185-164-141-154.cgnat.inetia.pl. [185.164.141.154])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-667b0eb9c02sm451909a12.19.2026.03.17.13.29.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 13:29:22 -0700 (PDT)
From: Michal Sieron <michalwsieron@gmail.com>
Date: Tue, 17 Mar 2026 21:29:07 +0100
Subject: [PATCH v3 08/13] systemtap: Convert confusing append to override
 syntax
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260317-fix-invalid-appends-v3-8-59452f073f31@gmail.com>
References: <20260317-fix-invalid-appends-v3-0-59452f073f31@gmail.com>
In-Reply-To: <20260317-fix-invalid-appends-v3-0-59452f073f31@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Michal Sieron <michalwsieron@gmail.com>
X-Mailer: b4 0.14.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Mar 2026 20:29:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233343

While in this case `RDEPENDS:${PN}:class-target +=` wouldn't result in
any unwanted override, there is no guarantee there won't be a change,
which would be hidden by this override. To avoid any surprises in the
future let's use `:append:class-target =` syntax here.

Signed-off-by: Michal Sieron <michalwsieron@gmail.com>
---
 meta/recipes-kernel/systemtap/systemtap_5.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/systemtap/systemtap_5.4.bb b/meta/recipes-kernel/systemtap/systemtap_5.4.bb
index 254bac4d6f..f319aa54fd 100644
--- a/meta/recipes-kernel/systemtap/systemtap_5.4.bb
+++ b/meta/recipes-kernel/systemtap/systemtap_5.4.bb
@@ -52,7 +52,7 @@ FILES:${PN}-runtime = "\
  ${bindir}/stapsh \
  ${libexecdir}/${BPN}/stapio \
 "
-RDEPENDS:${PN}:class-target += "${PN}-runtime"
+RDEPENDS:${PN}:append:class-target = " ${PN}-runtime"
 
 PACKAGES =+ "${PN}-examples"
 FILES:${PN}-examples = "${datadir}/${BPN}/examples/"

-- 
2.53.0


