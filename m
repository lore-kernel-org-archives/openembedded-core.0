Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D4EBC433F5
	for <webhook@archiver.kernel.org>; Thu, 28 Apr 2022 21:47:21 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com
 [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web09.2987.1651182436629476256
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Apr 2022 14:47:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=HRe/UFcw;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.42,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f42.google.com with SMTP id iq10so5465571pjb.0
        for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Apr 2022 14:47:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=Ex44/V1Wugw7hn6efPWrV7AkFBlh3zmoMrodlnxbOxY=;
        b=HRe/UFcwdetE3RDTAjNiK3QyQRMcXIt9hBhcrrWJ0kX94tEqfHTmY2QUNf5t1bCd1B
         jA2eyQW9bys+jfXu/OuFOgTxn98B35XudVOVyZLWneD89CW6nK03o3nMcd5981Wc9R35
         /LjOWYzJwzXR7T1DIbvtiNZ1qCkBaH9dDg4Q3aZJIGRqE3IK7m7SJS318fqgJFLpjncd
         eVYTJYUHnPEZ0fII1ATDQ0CWQSHiQ+OOEc1JmdP04rU+qJ8Mw7LFxf9rR2uJP8pca6+O
         XQd0jSr9nYw0riFWG0p2qcz6JrnFzuU2Rle4cMrV7vvJOaM+kEIlSZdbOJhUdZm124xk
         XjwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Ex44/V1Wugw7hn6efPWrV7AkFBlh3zmoMrodlnxbOxY=;
        b=EkAmzyyMPKYyJOPhhZsOxeQJl/pLDvX33lvlJkxn4xNwDngUQT1LjqjSyA3mauDwQ4
         /z4QVbWrU9m1f/+tyI0HsJvs71gGbBj0M0+dLiWvmsvQkM2Xsus2HxOhjZDuNnXttkA+
         zNo5oAiHSr329pPLarO6oE9U4MJHenHKPk+QEmuULJI8EMqxylUn3+689+h8ZYtz5mtA
         RFuKfAuS3VkFY0tvGhh8GiAAz1uu4+kpO5sYoBjmbM5+R6p/pcE/gWrJabLb57kDNlE+
         kq6y4rHuEpBzyinIsRcvOspYNEep6++NUvqfm1VjZVZTwSwgdbZzF2V1Z1ijwFuCOi8a
         eDFA==
X-Gm-Message-State: AOAM533ilYVgDg6zHJkqim8X8aSaEMlg6PSJ+VrDMzk94564wkL6M0rm
	or3lmpXgO/Ffz5XoDUrMEktP5uGMO3/EHByRq9c=
X-Google-Smtp-Source: 
 ABdhPJyZ8fRxJLe05oa2tpxCaV1FKzUyK1AnvXTFwGhXxEW20VyWicdEmU/eBlo0V/J5rFoNONvV9g==
X-Received: by 2002:a17:903:208:b0:15c:7dd0:eb64 with SMTP id
 r8-20020a170903020800b0015c7dd0eb64mr32964731plh.40.1651182435441;
        Thu, 28 Apr 2022 14:47:15 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 c138-20020a624e90000000b005081f92826dsm749742pfb.99.2022.04.28.14.47.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Apr 2022 14:47:14 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 2/6] boost: don't specify gcc version
Date: Thu, 28 Apr 2022 11:46:32 -1000
Message-Id: 
 <9ef2a0d98d705dacf8909d846993a6d68c80e4aa.1651182153.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1651182153.git.steve@sakoman.com>
References: <cover.1651182153.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 Apr 2022 21:47:21 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164980

From: Ross Burton <ross.burton@intel.com>

There's no need to specify an ancient GCC version here as Boost will
probe it.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Tim Orling <tim.orling@konsulko.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/boost/boost.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/boost/boost.inc b/meta/recipes-support/boost/boost.inc
index 829e728b6d..1c13fb3599 100644
--- a/meta/recipes-support/boost/boost.inc
+++ b/meta/recipes-support/boost/boost.inc
@@ -165,7 +165,7 @@ do_configure() {
 
 	# D2194:Fixing the failure of "error: duplicate initialization of gcc with the following parameters" during compilation.
 	rm -f ${WORKDIR}/user-config.jam
-	echo 'using gcc : 4.3.1 : ${CXX} : <cflags>"${CFLAGS}" <cxxflags>"${CXXFLAGS}" <linkflags>"${LDFLAGS}" ;' >> ${WORKDIR}/user-config.jam
+	echo 'using gcc : : ${CXX} : <cflags>"${CFLAGS}" <cxxflags>"${CXXFLAGS}" <linkflags>"${LDFLAGS}" ;' >> ${WORKDIR}/user-config.jam
 
 	# If we want Python then we need to tell Boost *exactly* where to find it
 	if ${@bb.utils.contains('BOOST_LIBS', 'python', 'true', 'false', d)}; then
-- 
2.25.1


