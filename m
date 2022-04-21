Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 897FCC4167B
	for <webhook@archiver.kernel.org>; Fri, 22 Apr 2022 16:51:59 +0000 (UTC)
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com
 [209.85.215.170])
 by mx.groups.io with SMTP id smtpd.web12.2051.1650582400613076660
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Apr 2022 16:06:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=efPBw1pE;
 spf=pass (domain: gmail.com, ip: 209.85.215.170,
 mailfrom: ticotimo@gmail.com)
Received: by mail-pg1-f170.google.com with SMTP id s137so5886141pgs.5
        for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Apr 2022 16:06:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jwKaavghmGJj+QMJV57FSyWk+vwefZq2vry5k3cmLGI=;
        b=efPBw1pE2s/Ep9SInNi6ITqwTqKAwiOeL1wIRDpIeCvB+/+idcBBsE5B9IAxolZU0/
         SiypaUvjWnFz7V89s9xlfTxUOsRwxzXLaWw/de7nGy0davILhtenbKy9dry8jMrWmR8Y
         bFLrUK2XA1rHWdwInPPV93oQbmEhMuoFGt7okmpLiYIqc9LRlq0Qypfc60ohnw2b+3zQ
         gJNwWTSRTmN/dopSngqanHNitYvezz1sX0xEoGN/HfF/H9dP/H4PMgbgBIW3IxtbIIsu
         I9IvJScAAgQd2dLDslwpiQwkV+lKESFtKoFTe5lalgEhK05rNKU+YAuqETuJVtD5u8kc
         C9Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jwKaavghmGJj+QMJV57FSyWk+vwefZq2vry5k3cmLGI=;
        b=td3AeCh0Qlj8PtEpgd+DcVxGCzMG6gcqO1J2nQImp+NhQlCheZg/+wGZGfMoI0ZuXw
         uoS58G0TciIfxLFgtydGKwvvMtavFizAN81mVN8lP8+qEGKvM0XpJrq/EbaP4eyyQb9M
         sXtTmLxoLYKLCE0Xgs8TKxnJg+lfSVIECzM5v/g5jM//5S99J3Ovu6rQHXhTJaZUuFIe
         Imbzl86o/6zJ3LFkEVXE0zRviTJwhzQf5tXg2rVtdQbMLMEIJJh8zeUzaORO2WttuJvp
         godPt9vKDj7XIOgqDAPH/tNMsnkkrNT86EH9eZq7t8BuDxl5rBa6QzfCC2f2djlD781u
         YiTA==
X-Gm-Message-State: AOAM533qJh92KGu3p0HY9Q448jEzhQq+DW76L/Mw71fEPBSpLTp8Qsa+
	3/7FFV3R262eYQxo5Nm4MiLu8fqZ4bM=
X-Google-Smtp-Source: 
 ABdhPJyVt16mh8QzKX3caL9RRSSJAfKOMprdo++fdJxY4hsuOVYgP67ATXZSvdkRZX8FIAAir8D7zA==
X-Received: by 2002:a62:2504:0:b0:505:7693:b48e with SMTP id
 l4-20020a622504000000b005057693b48emr2018668pfl.4.1650582399531;
        Thu, 21 Apr 2022 16:06:39 -0700 (PDT)
Received: from nereus.hsd1.or.comcast.net
 ([2601:1c0:6000:1b20:7a6b:1408:49b0:c75c])
        by smtp.gmail.com with ESMTPSA id
 y16-20020a637d10000000b00381268f2c6fsm210791pgc.4.2022.04.21.16.06.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Apr 2022 16:06:39 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <timothy.t.orling@intel.com>
To: openembedded-core@lists.openembedded.org
Cc: steve@sakoman.com,
	Ross Burton <ross.burton@intel.com>,
	Ross Burton <ross.burton@arm.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Tim Orling <timothy.t.orling@intel.com>
Subject: [dunfell][PATCH] boost: don't specify gcc version
Date: Thu, 21 Apr 2022 16:06:15 -0700
Message-Id: <20220421230615.91674-1-timothy.t.orling@intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Apr 2022 16:51:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164768

From: Ross Burton <ross.burton@intel.com>

There's no need to specify an ancient GCC version here as Boost will
probe it.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Tim Orling <timothy.t.orling@intel.com>
---
 meta/recipes-support/boost/boost.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/boost/boost.inc b/meta/recipes-support/boost/boost.inc
index 829e728b6de..1c13fb3599b 100644
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
2.30.2


