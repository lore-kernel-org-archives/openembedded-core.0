Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BDB6C433EF
	for <webhook@archiver.kernel.org>; Fri,  1 Oct 2021 13:50:45 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web10.8304.1633096244242770285
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Oct 2021 06:50:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=DfA5bHI9;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.50,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f50.google.com with SMTP id d21so15581371wra.12
        for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Oct 2021 06:50:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=Aei3OII4Vw/sfwv3WZX//uvKGyyZ2jDLAgwlevqBslc=;
        b=DfA5bHI9BtEbEL0edd/eQ60qlsMROvq4RcPZCLooa0yZG9hUPyUZ2LdBTomRhamrZ4
         QaXN457FvMgYpDUmHdqhDsnZHeF4ztmZdoWsUSCM502enKjNSYoTmP+fnRCt5pba1MPJ
         rxN66NgW7rnfmqkH93N2YpjWSS0i3gQfMutaw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Aei3OII4Vw/sfwv3WZX//uvKGyyZ2jDLAgwlevqBslc=;
        b=0VIfayLms/D+K4/dfMZ9cPgUN4yIgZcM3qD++GLm4DXbqA4Vnzc6zCrEI2LHXgkBO5
         NqWeTtNcxGDbVGOtoTUAoSb0deduEmYkLeEf7ubEey2CckWqSr0YgeeGa/C0sMdWkn2X
         kHmWLKwy4cL2XwzggRgXvmX7MrJO1go+i9YU+mrESc7NBQ9huc8TYZQNXbbz+0USiDDe
         EUy5zt9UHzXvKSdGwf63M1FTC9cu6QR2EyZqicfc6HbqYpSoKmtf2DdhU7BwyIXMDNfA
         2slWHrMgByXCFR/ASf3YPng6HIRZMPBrakvHtIA6W8c9NbbwN97iywbV1uGR+2N/HyWw
         SHCA==
X-Gm-Message-State: AOAM530sHGi/4vgn72EbvaU6iDHOMdSXjyplyysLgKCO2eLcWGlSySHJ
	zCNBQmtZhqywAhMm7DFqas231kNBn0DbEBUP
X-Google-Smtp-Source: 
 ABdhPJxHzkjZOLWTUIqU9Ar2YBYRNRKMbylv2iBAWqeq4D9g/+vjBLTYp1U7ZZXYBMGvdX1MRszg7w==
X-Received: by 2002:adf:e788:: with SMTP id n8mr12377124wrm.431.1633096242556;
        Fri, 01 Oct 2021 06:50:42 -0700 (PDT)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:415a:6029:9a90:9863])
        by smtp.gmail.com with ESMTPSA id
 o19sm6193155wrg.60.2021.10.01.06.50.42
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Oct 2021 06:50:42 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/9] gnupg: Be deterministic about sendmail
Date: Fri,  1 Oct 2021 14:50:34 +0100
Message-Id: <20211001135040.2251283-3-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211001135040.2251283-1-richard.purdie@linuxfoundation.org>
References: <20211001135040.2251283-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Oct 2021 13:50:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156519

Set a path to where sendmail would exist making the output deterministic
as it no longer depends on the build host and the presense of sendmail
there.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-support/gnupg/gnupg_2.3.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-support/gnupg/gnupg_2.3.1.bb b/meta/recipes-support/gnupg/gnupg_2.3.1.bb
index b8b0314d2f0..411ea9579dd 100644
--- a/meta/recipes-support/gnupg/gnupg_2.3.1.bb
+++ b/meta/recipes-support/gnupg/gnupg_2.3.1.bb
@@ -31,6 +31,7 @@ EXTRA_OECONF = "--disable-ldap \
 		--with-zlib=${STAGING_LIBDIR}/.. \
 		--with-bzip2=${STAGING_LIBDIR}/.. \
 		--with-readline=${STAGING_LIBDIR}/.. \
+		--with-mailprog=${sbindir}/sendmail \
 		--enable-gpg-is-gpg2 \
                "
 
-- 
2.32.0


