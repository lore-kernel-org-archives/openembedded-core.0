Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C594EC27C76
	for <webhook@archiver.kernel.org>; Wed, 25 Jan 2023 04:04:13 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web11.37733.1674619451187518870
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Jan 2023 20:04:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=I61X78op;
 spf=pass (domain: gmail.com, ip: 209.85.216.46, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f46.google.com with SMTP id x2-20020a17090a46c200b002295ca9855aso724876pjg.2
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Jan 2023 20:04:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CqFRlMRG9uYSWkj67OCFlloDfYyOvyHJYJguUm4bkS4=;
        b=I61X78op90ir5BXYoDF6cCv8knQxCuNne7eexCzXKs6B3PPMjZKTGzDVbA1nKIOnWx
         RPcCkhYEpUbveTIX4PD+aFYP8TPax8UyMyAmDgoTPHuFCMOyxB821ChtTbus4/vjKg4/
         dknHTV0eZyJJIu2V+CkRq9UwNqtHS5HO+aAudW8LcrevjouaTbEHQOAUasuVH/x8Z4lq
         xkaMHwtgwTgFQxdRAje7vaK0gNjOlVsclLTGgOsVt1wdMQQjzA/gH5OW5Fou8MogXIL5
         TvvRqgH3QNlRjPHSqkYcpKrJ3mjLy+eWzIM3wKDw9jFOEO9vLOURWWwSU3AHPgB57eP7
         Vp4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CqFRlMRG9uYSWkj67OCFlloDfYyOvyHJYJguUm4bkS4=;
        b=iAwtkyHzE3/XIy7sj1LqTSrd5Q5h1GXwylP607iXIoVFLl1huKiuOu2qU5CPJaCIeJ
         NSze53VXGWG5hQuT5Bfq8Epn2Ox9g4PxTlui1SjAXJfmjFsUCpo6OR2Acj9gu5HTjihz
         jszasezUvEfwjOyB4mdCtdQ2lEgiUNVsLCMPiYob23lphofaD065pYb4rhqWVCHOM5ny
         gO7wd3vkepZik37hkAXUeYkQ5ob92BhL4FjjAK9UkK8lnDnI78Yyh+ORxul+GwXvSHDi
         cvqDYPIk6cMNT0LD35MwMCHoqnKZSf4FoDO/Uu1XrsfzgYgSckrWVJiSXjLL9Ae1bxHN
         6TcQ==
X-Gm-Message-State: AFqh2kqjEe81+rN+uWJYNYX+QldpTentEvgghPWC86j6/MhherVpUQEH
	KXt21mH00kG7oxFhS8SLoHKN0i84VjvDSA==
X-Google-Smtp-Source: AMrXdXviCkgr46cbV1vjoeL21gtj4csnUOHWTjLZMEW1USxn7+FjhC309B2ggcp9NpH3PQtOspCCpw==
X-Received: by 2002:a17:902:8498:b0:194:93ce:13eb with SMTP id c24-20020a170902849800b0019493ce13ebmr29804058plo.32.1674619450309;
        Tue, 24 Jan 2023 20:04:10 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::aee3])
        by smtp.gmail.com with ESMTPSA id y13-20020a170902ed4d00b001947222676csm2462714plb.249.2023.01.24.20.04.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jan 2023 20:04:10 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 3/3] elfutils: Remove funcretval test from run-native-test.sh for now
Date: Tue, 24 Jan 2023 20:03:58 -0800
Message-Id: <20230125040358.3573537-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230125040358.3573537-1-raj.khem@gmail.com>
References: <20230125040358.3573537-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Jan 2023 04:04:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176340

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/elfutils/elfutils_0.188.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/elfutils/elfutils_0.188.bb b/meta/recipes-devtools/elfutils/elfutils_0.188.bb
index 65cae868c7..182229becf 100644
--- a/meta/recipes-devtools/elfutils/elfutils_0.188.bb
+++ b/meta/recipes-devtools/elfutils/elfutils_0.188.bb
@@ -98,6 +98,8 @@ do_install_ptest() {
 		cp -r ${B}/debuginfod                   ${D}${PTEST_PATH}
 		sed -i '/^Makefile:/c Makefile:'        ${D}${PTEST_PATH}/tests/Makefile
 		find ${D}${PTEST_PATH} -type f -name *.[hoc] | xargs -i rm {}
+		# TODO: remove below filter after https://sourceware.org/bugzilla/show_bug.cgi?id=30047 is fixed
+		sed -i -e '/funcretval/d' ${D}${PTEST_PATH}/tests/run-native-test.sh
 	fi
 }
 
-- 
2.39.1


