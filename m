Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 835FFC433EF
	for <webhook@archiver.kernel.org>; Mon, 21 Feb 2022 14:15:11 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com
 [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web12.11033.1645452911244726245
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Feb 2022 06:15:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=hx1EDx+t;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.180,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f180.google.com with SMTP id i6so8946490pfc.9
        for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Feb 2022 06:15:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=zSGNCoCyFmlIddd0MfDaNDyjuP56rcUHUhQ+FjrYxiA=;
        b=hx1EDx+tZuuZW1uuTrvFBU+WdjeSA+tyLAqbJCY1ekEutmlz8XiFHukYCkq84D5Gvq
         7nE5niPeLgoZG5On977956JSpj4+b4HD6bpWkxNCh/ixPm+CvIJx9cu/DtovMNs19DSU
         DWJGZAPac8cD7Io+YmmantrrUvASYo5XAEC/GH6x9fKgfk/aw/dd7JtYSPboHaUNxxh6
         Ctvg6fsnQSV9e4xq57XNlhvlUezPQVq9DvpWtoqQlrtyPiASwwnTIiKwbQRrR3mhfp8L
         8atWohQi/twGYFOXJoVCkPTvvYtjdLrKjqwDQM+yVQE60qhvjYU6X/gGmjucKAWc8gHt
         QZgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zSGNCoCyFmlIddd0MfDaNDyjuP56rcUHUhQ+FjrYxiA=;
        b=FqTznSaSmwAgjtCLb1vhqgYDzzPzt65due5F48z8mu2GCF3850PHimQZWmaBgra7Dy
         Y5vCc/pnsahkj6+ijFyF0BpyXajZlLR5ib7pXCL58yz6ozm6HJUxIRyMdAioh4p2vKNH
         SN5H1ogBPkT0/cOLLcwpnCGNAUg6oS9H2qS9n6YUhn7mmTvJIUIDpA92IvmmdhhlMV0e
         xYA1CvwTEHpmY0bisIpPuMKuZTqDzEQSIYKSXWH+SHxy21JbLQm1+a+kti3hd+Qnlfxu
         +PC+z3DSQMv8jqMo2sLR+1e1eeJUzuWQIvAULoD8GbZFNEXcuHaI0Q5dmmm52mAlOHHN
         pBhQ==
X-Gm-Message-State: AOAM5326CevY7qlYsjt9/ndw3T73fSyEmbyTrvUO+GHbS6fZqV41yzE0
	uG0cSrfEohLbHIro8NT0wct1Zmds62MmZBnw
X-Google-Smtp-Source: 
 ABdhPJzkROPZ0a7m9GThbOfadFeq5Gbhxu8qzuJxs51zzIZwgA86wmpGHk4cwX5tWtEOnugj27tExw==
X-Received: by 2002:a05:6a00:1705:b0:4e1:5a1:c626 with SMTP id
 h5-20020a056a00170500b004e105a1c626mr20149007pfc.1.1645452910221;
        Mon, 21 Feb 2022 06:15:10 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 8sm12919235pfl.164.2022.02.21.06.15.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Feb 2022 06:15:09 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 19/20] default-distrovars.inc: Switch connectivity
 check to a yoctoproject.org page
Date: Mon, 21 Feb 2022 04:14:17 -1000
Message-Id: 
 <0ed4759eb306596575e3e9859a023f44f814cf4c.1645452535.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1645452535.git.steve@sakoman.com>
References: <cover.1645452535.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Feb 2022 14:15:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162047

From: Richard Purdie <richard.purdie@linuxfoundation.org>

example.com is proving unreliable at present so switch to our own connectivity
page instead. That page is very simple avoiding app overhead on our web server
which was an original reason for switching to example.com.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit dc6b043cb75c5751b5a98afd2201aa31f9b4b9f6)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/sanity.bbclass                     | 2 +-
 meta/conf/distro/include/default-distrovars.inc | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index 2325ee2747..37354af9d5 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -395,7 +395,7 @@ def check_connectivity(d):
                 msg += "    Please ensure your host's network is configured correctly.\n"
                 msg += "    If your ISP or network is blocking the above URL,\n"
                 msg += "    try with another domain name, for example by setting:\n"
-                msg += "    CONNECTIVITY_CHECK_URIS = \"https://www.yoctoproject.org/\""
+                msg += "    CONNECTIVITY_CHECK_URIS = \"https://www.example.com/\""
                 msg += "    You could also set BB_NO_NETWORK = \"1\" to disable network\n"
                 msg += "    access if all required sources are on local disk.\n"
             retval = msg
diff --git a/meta/conf/distro/include/default-distrovars.inc b/meta/conf/distro/include/default-distrovars.inc
index 0240589c81..038acc1504 100644
--- a/meta/conf/distro/include/default-distrovars.inc
+++ b/meta/conf/distro/include/default-distrovars.inc
@@ -48,4 +48,4 @@ KERNEL_IMAGETYPES ??= "${KERNEL_IMAGETYPE}"
 # fetch from the network (and warn you if not). To disable the test set
 # the variable to be empty.
 # Git example url: git://git.yoctoproject.org/yocto-firewall-test;protocol=git;rev=master;branch=master
-CONNECTIVITY_CHECK_URIS ?= "https://www.example.com/"
+CONNECTIVITY_CHECK_URIS ?= "https://yoctoproject.org/connectivity.html"
-- 
2.25.1


