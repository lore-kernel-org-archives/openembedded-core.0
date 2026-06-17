Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51644CD98F9
	for <webhook@archiver.kernel.org>; Wed, 17 Jun 2026 07:45:40 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10218.1781682338114114605
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Jun 2026 00:45:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=EyXzOkgJ;
 spf=pass (domain: smile.fr, ip: 209.85.221.44, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-46019b190b6so4505036f8f.3
        for <openembedded-core@lists.openembedded.org>; Wed, 17 Jun 2026 00:45:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1781682336; x=1782287136; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tLUYRJtYR4Fyy5Yyn3TZZ35Z1FEaT/xzPT3JZfFEQds=;
        b=EyXzOkgJt7UQfz9lpRvSRBVGg9uK2UosZenJVl2bdPG+anlHztkJmxT9dBljDJVlMY
         dpjHcVbCpOOyZdpT7Y4ewBgs5wSjtKvR8T/Xd2DEUF3KebUFNVtFbGX4w/TZMYecFCJr
         BerI8iUHJNZGlINja675/WhwyYH2iQncOWjKM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781682336; x=1782287136;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tLUYRJtYR4Fyy5Yyn3TZZ35Z1FEaT/xzPT3JZfFEQds=;
        b=HIPsGB8dA8aKyQfjFUzugTEliVGl/dwftl56mzqHy7VrtDW7cvV0zd5L+qhnsEY+3g
         tGjpZwms43BCTB4IIg+Skn7AzE98y0c2i/hyx3oBleTZk9dKDl5A1D2lgfpIem5EJldV
         70clH9b2x7GqFEltyy45HdnVLylIvndQvNmfngQty8CPxSBwVwcB4eEYFwZqW8RF51aC
         MblO/mCF2WUs++89/MUJ9tmR/aENelINKVE7LcVLk6ICgGiPCfifioh7HfaoZuJUqlPK
         ED055N9j/bw39K4ZiV+5YiA32E6aNuH0ru9jw9qAdG546ud7Gq5/qqEzHh3/wdO5lzz7
         pqvw==
X-Gm-Message-State: AOJu0YwYtV8+/BqeaFEPSKDhyQm7Mvb0Zlm4kFcR3o/+11+dbuyRB9qb
	VuCS0VzB2XlYpyw9lB2j+BFCtVLPXVJdWybl23f74kEW/0Ss0YLrRa2ML/0rvEg0pdUXOdUM7eo
	t+G5Y
X-Gm-Gg: AfdE7cnalPtHMkw9FFuZkUlkL4oauTcOQGZwC7uxkpCOSEIfcRS7PsWo9ziJsrn/Jhh
	ZYBBYNRYe8j2ftBYsrFBHpC1T/Ot66UEFZlm4EWNF9Fpbrq7vIcFJ/wC2/N7seEI8CJ0HLn4rOm
	zVS2LqpGcL+v1e62srln/FY/SkU42EgfA06B0Qhn6M0eUmTuIXO3Kb8nwuiqCBJJ8kyd/he8en6
	mQZWf0JpV2V5g0VlBtfK0oqcTjruVfF+eLq/o6OchWetCPITnM+ID27vIf0YED1QLOoektSHPma
	YNZam01MYAT2tJkWwf2U2/qoOu4sQwhb10Z+ASUjLYrqChyE3J2hoU6soOU2lzIooxqHvM2yF8p
	0ZC/aPxwG0jPB2JlUaj49XOaRipghOqWl+WoYsyN3IPIShbMbeyLHV23jBU1eJyo4+ZeSxgH/UW
	qin5J+D60dKGAAR6n9inILJOvWo0obbF8JOk2ByUfkxce+C3t8mVY7XoR2BWUmbg5pH0Sodmcxf
	bGpgHg24zRtX1wGrw==
X-Received: by 2002:a05:6000:200d:b0:45e:739b:3e43 with SMTP id ffacd0b85a97d-462323f334bmr4747057f8f.0.1781682336384;
        Wed, 17 Jun 2026 00:45:36 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00bc19bde07170effe.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:bc19:bde0:7170:effe])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4619b9b7750sm23483215f8f.6.2026.06.17.00.45.35
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 00:45:35 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 16/30] setuptools3: clean the build directory in configure
Date: Wed, 17 Jun 2026 09:44:51 +0200
Message-ID: <a0151ab56cf3fcaa6587e240b5454fed5315a534.1781682189.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1781682189.git.yoann.congal@smile.fr>
References: <cover.1781682189.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Jun 2026 07:45:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238998

From: Ross Burton <ross.burton@arm.com>

It's not currently possible to set the build tree to be somewhere we
control, but we know it will always be in the build directory alongside
the setup.py so we can [cleandirs] that.

MJ: helps with build/lib directory being added when a recipe is rebuilt
in the same WORKDIR multiple times, e.g.:

Just rebuilding python3-tqdm in the same TMPDIR after cherry-picking this:

$ buildhistory-diff -p buildhistory build-minus-1 | grep PKGSIZE
python3-google-auth/python3-google-auth: PKGSIZE changed from 11752510 to 1315694 (-89%)
python3-googleapis-common-protos/python3-googleapis-common-protos: PKGSIZE changed from 7108856 to 794024 (-89%)

$ wc -l python3-google-auth/2.29.0*/image/usr/lib/python3.12/site-packages/google_auth-2.29.0.dist-info/RECORD
  554 python3-google-auth/2.29.0-old/image/usr/lib/python3.12/site-packages/google_auth-2.29.0.dist-info/RECORD
   66 python3-google-auth/2.29.0/image/usr/lib/python3.12/site-packages/google_auth-2.29.0.dist-info/RECORD

$ wc -l python3-googleapis-common-protos/1.63.0*/image/usr/lib/python3.12/site-packages/googleapis_common_protos-1.63.0.dist-info/RECORD
  1166 python3-googleapis-common-protos/1.63.0-old/image/usr/lib/python3.12/site-packages/googleapis_common_protos-1.63.0.dist-info/RECORD
   134 python3-googleapis-common-protos/1.63.0/image/usr/lib/python3.12/site-packages/googleapis_common_protos-1.63.0.dist-info/RECORD

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
(cherry picked from commit f3854f4f60801e3b6788bee3a0a1850fc498d536)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/classes-recipe/setuptools3.bbclass | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/classes-recipe/setuptools3.bbclass b/meta/classes-recipe/setuptools3.bbclass
index d71a0895398..c4fd30020aa 100644
--- a/meta/classes-recipe/setuptools3.bbclass
+++ b/meta/classes-recipe/setuptools3.bbclass
@@ -15,6 +15,9 @@ SETUPTOOLS_SETUP_PATH ?= "${S}"
 setuptools3_do_configure() {
     :
 }
+# This isn't nice, but is the best solutions to ensure clean builds for now.
+# https://github.com/pypa/setuptools/issues/4732
+do_configure[cleandirs] = "${SETUPTOOLS_SETUP_PATH}/build"
 
 setuptools3_do_compile() {
         cd ${SETUPTOOLS_SETUP_PATH}

