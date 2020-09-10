Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web11.20773.1599740698386346118
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Sep 2020 05:24:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=IrxGLTNR;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f43.google.com with SMTP id z1so6490642wrt.3
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Sep 2020 05:24:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=IW2ovGLvLHhqRGxLaT8AvCysssk1tdMjnLABKQl3NxU=;
        b=IrxGLTNRisCzK5sXl0x0+M0IoJcRcX8Rj4doMEY86iCZKC9o1V/RUxe2SYlatgt46t
         1DtGBIMmTbyAhK8aWCYMHlVDhxxsz80Gk8tdemHXzF3OVvwERBTZEm9y7vhoiTyKKpZA
         wdAJwyTuVBpDlXQB+tJPfKIrjVsp5SY+Tvv8g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IW2ovGLvLHhqRGxLaT8AvCysssk1tdMjnLABKQl3NxU=;
        b=cxSkUpq6CdY/RxXP7R2HDTPHjG0kvfkqe92G/S/NhfSnrHyNQIh+bkQ2tVyEtiNTbH
         TymPjlz2qQAznUznRiOTO0pmSzkXKaQNLkLloiweKquz9dKV3we2p/rKrzvNzh2BRTvn
         W9hg/ZFlpcm7Pde5PPVIy9g2WXVRMNEds6CwV8BeGwYvvj1rWaepYOdbzh1NDLrNIDEJ
         FVDSrn34KNqE++6Ko9Bd8YeW0rpbWLUipbOzNYD1SX/NEAMSRrg0Ji1c7Mg9noOU0tSx
         su6cJ17eO+c0aQCq9UdfiJ252H3eAbOqd5WIuBFq74oNd7CvcDJFyc1saIzWLPrugBUl
         3O3Q==
X-Gm-Message-State: AOAM533t+NOusqWnRr7YRIWdZagXYhfjbz2gCxXLMQ9qp5qVPEoELacc
	URPOsAzkwqapl3J+SyouYFZslE1vQPzIyw==
X-Google-Smtp-Source: ABdhPJwbShWzoofvYp5w/nO5zxoN8c0sU+RYCD7FrVJiWF1mMoD+S4XCA+Yla6Qf/94e9NylmTSUNQ==
X-Received: by 2002:a5d:67cd:: with SMTP id n13mr8510914wrw.51.1599740696679;
        Thu, 10 Sep 2020 05:24:56 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net (2.f.a.6.5.4.b.4.5.7.2.f.a.5.0.6.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:605a:f275:4b45:6af2])
        by smtp.gmail.com with ESMTPSA id j7sm8590498wrs.11.2020.09.10.05.24.54
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2020 05:24:56 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH][thud 22/29] attr: Disable parallel make install
Date: Thu, 10 Sep 2020 13:24:26 +0100
Message-Id: <20200910122433.2040293-22-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200910122433.2040293-1-richard.purdie@linuxfoundation.org>
References: <20200910122433.2040293-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

do_install fails on newer versions of make with interesting and hard to
debug errors. Disablle parallle make install as a workaround. Later verisons
of attr in newer releases don't have the issue.

(From OE-Core rev: 6043b9a2ea879f8960897b11eb947801508a94da)

(From OE-Core rev: f06861bbe402fff3f370687585e43c0270609d00)

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-support/attr/attr_2.4.47.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-support/attr/attr_2.4.47.bb b/meta/recipes-support/attr/attr_2.4.47.bb
index fc88bef830b..c3da66a0c72 100644
--- a/meta/recipes-support/attr/attr_2.4.47.bb
+++ b/meta/recipes-support/attr/attr_2.4.47.bb
@@ -12,4 +12,7 @@ SRC_URI += "file://attr-Missing-configure.ac.patch \
 SRC_URI[md5sum] = "84f58dec00b60f2dc8fd1c9709291cc7"
 SRC_URI[sha256sum] = "25772f653ac5b2e3ceeb89df50e4688891e21f723c460636548971652af0a859"
 
+# Has issues with newer versions of make
+PARALLEL_MAKEINST = ""
+
 BBCLASSEXTEND = "native nativesdk"
-- 
2.25.1

