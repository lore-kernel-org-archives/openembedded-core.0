Return-Path: <sam.van.den.berge@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7288C47DD9
	for <webhook@archiver.kernel.org>; Fri, 22 Mar 2024 11:07:00 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web10.10195.1711105619158099349
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Mar 2024 04:06:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ni4pqDkR;
 spf=pass (domain: gmail.com, ip: 209.85.221.52, mailfrom: sam.van.den.berge@gmail.com)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-341950a6c9aso1426863f8f.1
        for <openembedded-core@lists.openembedded.org>; Fri, 22 Mar 2024 04:06:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711105617; x=1711710417; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yBGHWfvZ4cUHjoFqSJb/v7+B2mkCjY//rfVM0F0QyQM=;
        b=ni4pqDkRPP5PgE3LKm02q1LjTW82sYWMW9rsWvGz2QW6P6cudcwYTWt0wGDM9w4SOO
         H5jKzzmWIWvuN0yAz0VublFLkO60ZScqhtiXzgM8d9nynqcdzEoDfYD+3acrJ2G75ZjB
         t4ctWwDZmDDzVntb28KYJ0CgRdxCaStHoZttWeahfVXw3YfUm2F9ucxg/FCcT6cp3nFO
         r8PIdtVQudSPiq5EfydVUCNWiUrDWmUDUdFh0Z1438tOCds8g3vr9/HbxCxpyHTjDfsN
         0JaLM/B6zx9hhJ+eUZjfEiysijFttbguMlQT0bVUk1C/aL1308LQXTh1uCBsenHnVsJI
         oLvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711105617; x=1711710417;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yBGHWfvZ4cUHjoFqSJb/v7+B2mkCjY//rfVM0F0QyQM=;
        b=ezO6KQ020l4uD3Xd84EuhCFQFH7REr/r56ixVLHvvRapEMH4fNL/cstAdNlssaP19z
         rqeoPt3Ff40aO7Yq8SD0g9g2YcnjD7SyaEY/t9naLTM2IFTmsss3Dl8rXqmevDJZv9m7
         LMvjCoS1P20cMwFF9UfNNQoRZg4IPRZUSiOJYQOIFE9d2f/qxxgOLA7aI5gMk38AJVBM
         OhgKQ6JlP3rLvFCWMGGnK2qs1TKrQlJYuZl1+RJgp18KKDqs7yw0D8FK/RYHxcSAT2fT
         Ato+BbfYd/HMKgZySHhEj4tJ7/T5DhcOO1vd+yPs9m4WKdT1yBwGJzWrH1+0jH8Svfl2
         o60w==
X-Gm-Message-State: AOJu0YwPi3JwONawQDsAjO/LWy5Baj764s3t1FAeFD8+12ZBKYKdNvQC
	YVMaLXa2bntBnr4zdPk8BAka06Cub+cDUXGqsPv3q+GZq7a8jD0kd/wPPLM=
X-Google-Smtp-Source: AGHT+IHbUIIx0RdlHJALXaPpJj/qKTl35f8WNWcoM9qxX3mrqHsdQUJFiOmoyNaD8MRVuJoY+Kf95w==
X-Received: by 2002:adf:f402:0:b0:33e:74ce:6123 with SMTP id g2-20020adff402000000b0033e74ce6123mr1494238wro.60.1711105616930;
        Fri, 22 Mar 2024 04:06:56 -0700 (PDT)
Received: from OP01518NB.WTSOUT.OIP.LOCAL (mail.oip.be. [81.246.50.154])
        by smtp.gmail.com with ESMTPSA id x17-20020adfffd1000000b00341babb8af0sm452076wrs.7.2024.03.22.04.06.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Mar 2024 04:06:56 -0700 (PDT)
From: sam.van.den.berge@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Sam Van Den Berge <sam.van.den.berge@gmail.com>
Subject: [OE-core][PATCH] shadow: don't install libattr.so.* when xattr not in DISTRO_FEATURES
Date: Fri, 22 Mar 2024 12:06:54 +0100
Message-Id: <20240322110654.5756-1-sam.van.den.berge@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Mar 2024 11:07:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197443

From: Sam Van Den Berge <sam.van.den.berge@gmail.com>

Fixes the following issue:

install: cannot stat '.../recipe-sysroot-native/usr/lib/libattr.so.*': No such file or directory
...
ERROR: Task (virtual:native:.../shadow_4.14.2.bb:do_install) failed with exit code '1'

Signed-off-by: Sam Van Den Berge <sam.van.den.berge@gmail.com>
---
 meta/recipes-extended/shadow/shadow.inc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-extended/shadow/shadow.inc b/meta/recipes-extended/shadow/shadow.inc
index a164b8347f..40e6ab0b30 100644
--- a/meta/recipes-extended/shadow/shadow.inc
+++ b/meta/recipes-extended/shadow/shadow.inc
@@ -160,7 +160,8 @@ do_install:append:class-native() {
         binaries=$(find ${D}${base_bindir}/ ${D}${base_sbindir}/ ${D}${bindir}/ ${D}${sbindir}/ -executable -type f)
         chrpath -k -r ${STAGING_DIR_NATIVE}/lib-shadow-deps $binaries
         mkdir -p ${D}${STAGING_DIR_NATIVE}/lib-shadow-deps/
-        install ${STAGING_LIBDIR_NATIVE}/libattr.so.* ${STAGING_LIBDIR_NATIVE}/libbsd.so.* ${STAGING_LIBDIR_NATIVE}/libmd.so.* ${D}${STAGING_DIR_NATIVE}/lib-shadow-deps/
+        libattr=${@bb.utils.contains('DISTRO_FEATURES', 'xattr', "${STAGING_LIBDIR_NATIVE}/libattr.so.*", '', d)}
+        install $libattr ${STAGING_LIBDIR_NATIVE}/libbsd.so.* ${STAGING_LIBDIR_NATIVE}/libmd.so.* ${D}${STAGING_DIR_NATIVE}/lib-shadow-deps/
         install ${D}${libdir}/*.so.* ${D}${STAGING_DIR_NATIVE}/lib-shadow-deps/
 }
 
-- 
2.34.1


