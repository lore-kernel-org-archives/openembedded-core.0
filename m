Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67EC9C46CA3
	for <webhook@archiver.kernel.org>; Wed,  6 Dec 2023 23:36:42 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web11.63420.1701905798959951303
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Dec 2023 15:36:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=PtnHaV2i;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3316bb1303bso246308f8f.0
        for <openembedded-core@lists.openembedded.org>; Wed, 06 Dec 2023 15:36:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1701905797; x=1702510597; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=OMXBlyh1EngKIFV+Jll4OUGtCQUyslzjGOJSUt3qCkk=;
        b=PtnHaV2iTpRHA0edzekBRVxc0h9nNlgMmi1OOe4hPkjpIF6Tkc2ugRIH8ITu2w4CtP
         t13mRWCx7CG7xfV+cPOIWySAvwrCy+WcKqoD4zYo70jzXwljhlDG735xA+5uhX+bG3TV
         VE43HDAKX3ZHICzgn6VtVEwjGc3h4tKaedcxQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701905797; x=1702510597;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OMXBlyh1EngKIFV+Jll4OUGtCQUyslzjGOJSUt3qCkk=;
        b=j9sF4/+vqe68eHi2BzPEoejdq+66E240s6oBOpieR6gBJrjE3pVGFFsHaBxB6/g5Fz
         Cl7dI2ypSandevZGv7Zbgv/3q/lPUDG5y5KS/ZqRoEu5fp+g6hnSkxIYCaYZeyu1y7zG
         LC/pyuWpoNGqFgu3j0Vp4jWTSlB/rwsDXhoi8oUE6DAH2o3+fEUAa6FetkpJKDwoRE5q
         EV1k4e2bIzsJciLXMAp8V3h4ZA5DLkFc9U2SUvOT03cueAWQpSJOQhClra4i1wuYFAG7
         bfArHQrzWBnvNSdd75WNzQqW7R4lCICuSR70j6wLHJLP8dCWdiskT9fdfbHjV4RwLQCe
         rVvQ==
X-Gm-Message-State: AOJu0YyePgz/XdEFinoSzAtZQjg8CCT2d4o3Jeqmn6Jrl5SP8iT9q/nA
	wsSzTWe0TnHaEc0LeKhl0P57PotDXM1iqybSoJI=
X-Google-Smtp-Source: AGHT+IFypMk0v1ie9fy9KhtDYd8O13nKZDedr4GK82JsyD9d8IdPc4BQnLLrVTSxQ1BPAKAE6Qo4VA==
X-Received: by 2002:adf:ea05:0:b0:333:13cf:dd15 with SMTP id q5-20020adfea05000000b0033313cfdd15mr989696wrm.55.1701905796945;
        Wed, 06 Dec 2023 15:36:36 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:30b4:b44a:2cc6:3876])
        by smtp.gmail.com with ESMTPSA id g7-20020a5d6987000000b003333fa3d043sm757738wru.12.2023.12.06.15.36.36
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Dec 2023 15:36:36 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] sanity.conf: Require bitbake 2.6.1 for recent runqueue change
Date: Wed,  6 Dec 2023 23:36:34 +0000
Message-Id: <20231206233635.1714521-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Dec 2023 23:36:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191938

Require the presence of a recent change in bitbake 2.6.1 for runqueue
setscene dependency handling improvements.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/sanity.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/sanity.conf b/meta/conf/sanity.conf
index 593419921f5..ebe71c632b8 100644
--- a/meta/conf/sanity.conf
+++ b/meta/conf/sanity.conf
@@ -3,7 +3,7 @@
 # See sanity.bbclass
 #
 # Expert users can confirm their sanity with "touch conf/sanity.conf"
-BB_MIN_VERSION = "2.3.1"
+BB_MIN_VERSION = "2.6.1"
 
 SANITY_ABIFILE = "${TMPDIR}/abi_version"
 
-- 
2.39.2


