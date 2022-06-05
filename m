Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F456CCA481
	for <webhook@archiver.kernel.org>; Sun,  5 Jun 2022 12:26:07 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web09.19988.1654431962181160815
 for <openembedded-core@lists.openembedded.org>;
 Sun, 05 Jun 2022 05:26:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ZmRvlLqZ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.51,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f51.google.com with SMTP id
 c5-20020a1c3505000000b0038e37907b5bso8670728wma.0
        for <openembedded-core@lists.openembedded.org>;
 Sun, 05 Jun 2022 05:26:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=Wf404Ay5Un75Vi60OFOdUnyO0S+ZE+2HpNJCdpNmwL4=;
        b=ZmRvlLqZlwZOsRmPYR393BLFRM/OwliRK9p0dM9mVRrImCN4rVI/3TJOxwrLAyesnJ
         aiN5Z2gk4sG1yDpAoekrW3YVVjR8KVwnGewNzIyRRWSBQCnPZ0LBLmi7ypndZ3BoSsHM
         CF2KB6TtM0SC34jf1ssPt9sCVhGghubBIWSA0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Wf404Ay5Un75Vi60OFOdUnyO0S+ZE+2HpNJCdpNmwL4=;
        b=YA6C/7CzTf8rEOnleecuDW+h7sdqkyQg7cjcSzkimgsf+kpgCpsuVI6SwTl4CC0P/R
         W/fMywxSq4CWBmIK1mHXZjvTUGbDlQhnMaffoQilfGDilv2MUX1vFkwEogrqF+h0gS81
         8he59q8fH9iBp9YK/Z7m1dPAgHT9sCI3bysniAu+GXe7AOzAGHHvCd/l//x7HsyhdNCP
         rU/Fwf4XsPlGfNkJXhPThYNC+Nbvzaq68FPRhc8ly5Mr0GUoft2W9xgr1gjYV1g0TwqV
         8OOo0Akh3emqcPId25Olax6HVcKC6yjqf7M8LIifLbTjU2VjmrBGsDebq29G0fGqtf8o
         bkmw==
X-Gm-Message-State: AOAM532Nr6F3SJKIqag2IrevFqEVpjC3oSnpK4vA8go5XM+OS2eMP0ab
	duvSYIwGcX77VeuHim1242MdjVeQpD3Bqg==
X-Google-Smtp-Source: 
 ABdhPJz5twn0uXAeDeDXsnAyg1k6Eom6P8yFwkl2Ouq26mWeCa6cTzwQyZCN5iSte/PjK+AIssW+9A==
X-Received: by 2002:a05:600c:2105:b0:39c:37d0:6f5e with SMTP id
 u5-20020a05600c210500b0039c37d06f5emr14058335wml.44.1654431960195;
        Sun, 05 Jun 2022 05:26:00 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:1a6f:63e8:c3d9:1249])
        by smtp.gmail.com with ESMTPSA id
 n9-20020a05600c3b8900b003942a244ecbsm12455927wms.16.2022.06.05.05.25.59
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jun 2022 05:25:59 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/4] perl: Add dependency on make-native to avoid race issues
Date: Sun,  5 Jun 2022 13:25:56 +0100
Message-Id: <20220605122558.270399-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220605122558.270399-1-richard.purdie@linuxfoundation.org>
References: <20220605122558.270399-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 05 Jun 2022 12:26:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166576

Make 4.1 has race issues with double colon usage in makefiles which are common
in MakeMaker generated code in perl. Add a dependency on make-native to avoid
this as it is relaitvely low overhead.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/perl/perl_5.34.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/perl/perl_5.34.1.bb b/meta/recipes-devtools/perl/perl_5.34.1.bb
index 4b9d2e2c501..42bcb8b1bc6 100644
--- a/meta/recipes-devtools/perl/perl_5.34.1.bb
+++ b/meta/recipes-devtools/perl/perl_5.34.1.bb
@@ -33,6 +33,8 @@ S = "${WORKDIR}/perl-${PV}"
 inherit upstream-version-is-even update-alternatives
 
 DEPENDS += "perlcross-native zlib virtual/crypt"
+# make 4.1 has race issues with the double-colon usage of MakeMaker, see #14096
+DEPENDS += "make-native"
 
 PERL_LIB_VER = "${@'.'.join(d.getVar('PV').split('.')[0:2])}.0"
 
-- 
2.34.1


