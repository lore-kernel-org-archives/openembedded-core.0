Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25D36C624D9
	for <webhook@archiver.kernel.org>; Wed,  2 Sep 2026 11:58:04 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10720.1788350275981352966
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Sep 2026 04:57:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=UtjACLYi;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-49b0eab380eso9042815e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Sep 2026 04:57:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1788350274; x=1788955074; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vwgsvFvOb/DvrkTbxl89zavUq1IjjcoN5U2cT8s8Jsg=;
        b=UtjACLYirtfMOaWPdA1dGSixgZowqCR6v8KAh+2eYeRmXoqTj27Lktg0B47ng/KOE+
         KBw8B4wQ1yrSMhuhg0dpNDOXkaFmLz4HNeHRDa3fL0768GwZU0fwY8mm6Obb5fOCz69l
         frXMEih+ZmwnQdYRPavXAOxla8mklaVYp/t+o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788350274; x=1788955074;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=vwgsvFvOb/DvrkTbxl89zavUq1IjjcoN5U2cT8s8Jsg=;
        b=jzGjJJHg0FQ7jA9zIQJnH/qx1ztGrTZ5XJ8KooqgyuN/iryZwL0GgLKPQPvwKR5AY8
         357YxtkaudLjehUNjFuznfRkugfROx9GMl4SMofcukoUOO3gNGxbGrKSSW4mRsLKERLy
         Xe/bxI9TCVllEqp3gCxxu/NqACJ63m39TpjF9e4zzKJ0V/cvWejk3NiJBOk2zdmnlHW5
         MUYw+rTgSoc9d9BiHqSpeu5DAHVAVGL+k9rtPfziFSdFFJaQeHgOypkCTQMDjLd4Ea8c
         X4ZfEjiQPPe4LedH5hHZMlG9B9+vPrnZ9zSOxBCVs1SbffCUa0o/rl9BDZJmIHGWb0sJ
         B00A==
X-Gm-Message-State: AFuF++m2Xn8TecZcDJW/PQSBf1C0/jt5dSiO4DJp9xy54vrbSCfiiLQt
	S3GAFleEE7xyxKc+D3Q8DwW5i9l2YjpEI+OPibvY3XwdrfqIIQVfc97OChc/hFSZiHzciEzyVkS
	TsErIT3w=
X-Gm-Gg: AR+sD12/32O/bTV6SvUp4h/lhyIjD3A6msQmhLNrrqi2fXXUZj1EMn1LZ+aRvEnywoT
	ItdbLhdCflfl4/kACLoUZeo7rZ32gTuF99aYJiKYkuWaJTbCwaGTFqMt69qyngeO/cbj51QogVs
	Av4imPUE6utcwghoKnxw+vD3mLmLajQ1L115Y36p02LiqoPWVbqwAwG4wQWINiBaJs9mP3dkveo
	K8Vp4fbaT7uKPAhWPMqaIshyMof1JRo+5yrOiDbUSxS8q74RsEtkDMxPKJrKeDT8E0AGwi1EPCW
	o90B4QBS700k0p6RvRr/HlIjUznKHs4JsDcGUTWUd54ebGeKnQJ+qGQ5+MDdVypa4QL2BnNnPLy
	uIr9Jf6CzQshDCoENckYK9eroy5QvwZlj29AImMnWpNMJ3ZgXIvlDTqv9jFmgHQWqHsd2t7S3W4
	bkBXde3VFoa1CEgaDCv+LQX17LVEPlpGiXcFFII1tT71/OVRPmxYKXjdhhJHDKdXGOCNY3EPkcf
	a2SD8WYaUM/odDUSw==
X-Received: by 2002:a05:600c:4f87:b0:499:59fd:dbfc with SMTP id 5b1f17b1804b1-49ce7bb7823mr35027865e9.1.1788350273855;
        Wed, 02 Sep 2026 04:57:53 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:89b1:8875:2e41:59f0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce47820e2sm66574265e9.13.2026.09.02.04.57.52
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 04:57:52 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/4] debianutils: upgrade 5.23.2 -> 5.24
Date: Wed,  2 Sep 2026 12:57:48 +0100
Message-ID: <20260902115751.2762897-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Sep 2026 11:58:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244933

debianutils 5.24:
  * d/control: Bump standards version from 4.7.2 to 4.7.4, bump
    debhelper-compat version from 13 to 14, and remove redundant
    field, Rules-Requires-Root: no.
  * acinclude.m4: Update DEBIANUTILS_VERSION to 5.24.
  * run-parts.c: Recognise short option for --debug (Closes: #1131363).
  * run-parts: Add options -A, --after and -B, --before for greater
    flexibility (Closes: #1131375).
  * d/tests/run-parts.test: Extend testing of run-parts for new options.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../debianutils/{debianutils_5.23.2.bb => debianutils_5.24.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/debianutils/{debianutils_5.23.2.bb => debianutils_5.24.bb} (97%)

diff --git a/meta/recipes-support/debianutils/debianutils_5.23.2.bb b/meta/recipes-support/debianutils/debianutils_5.24.bb
similarity index 97%
rename from meta/recipes-support/debianutils/debianutils_5.23.2.bb
rename to meta/recipes-support/debianutils/debianutils_5.24.bb
index 06bc4060c98..89522eb82d8 100644
--- a/meta/recipes-support/debianutils/debianutils_5.23.2.bb
+++ b/meta/recipes-support/debianutils/debianutils_5.24.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://debian/copyright;md5=4b667f30411d21bc8fd7db85d502a8e9
 SRC_URI = "git://salsa.debian.org/debian/debianutils.git;protocol=https;branch=master;tag=debian/${PV} \
            "
 
-SRCREV = "b999bb0969471d302f1db85e58f17dcb64f274c2"
+SRCREV = "015efec85971f1ce0fcfe6e26180f574846036ca"
 
 inherit autotools update-alternatives
 

