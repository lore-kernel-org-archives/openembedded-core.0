Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web12.527.1621543754063288137
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 May 2021 13:49:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=PotBAfWh;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f42.google.com with SMTP id c14so17182713wrx.3
        for <openembedded-core@lists.openembedded.org>; Thu, 20 May 2021 13:49:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=9TjBwsE49GEfyna1sYAmiEmdz2VPzklTr5nCR8oedPg=;
        b=PotBAfWhk0/Qn6Pgm9z2Mug9NdtKcFC49xHFTGlz2VIrnOhowmXKP89oM8InWEtiMY
         i4GY+17LK26fHYHE4BeiVJV/oOjw9XLYi1A8mMGgQnE9NIJMGW9x6uz1A3bs5tEo9BRb
         EsAZquDXqEMU0JvhP751nj3hv5vuQTVE4cTT4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9TjBwsE49GEfyna1sYAmiEmdz2VPzklTr5nCR8oedPg=;
        b=fuTnKVxdklFaJapmTu155CTTpiR2vRQ1lvy8CCSzSQoMSdrEcBbak+DnXjCKk8eCeA
         GM6IK/idmWoOb9uu+5i+x1+LCXwfUFaHmFvXG91yXR43zDqpznHHmOjLxAWtqNLz7UzW
         mejhzTrl0sqlZMT3a312QB3XteCF547oDhltsRop45snmwie/hQe3aNOSHonnsT3p1Yj
         BSPdvP5lbxXC+R1e/TwqZk82q+CzzAhtgcmEuCXgiWbL72eiUctBixGqrAGcs0Be6Ua/
         Eek4Gc+wauUCDutAqHPe0Ampm0ck13DS/pJ28V42b68RVP3kc+lLciDcyLvKFwLxS95+
         kLFQ==
X-Gm-Message-State: AOAM533JroRkXK6Gd56KrTwASv1yhZ6DtpCk1yGvjQYAyuUe+1G0MuSy
	SuGJJewCh/ghtPJDem3Tjlf43T3kz9O8fg==
X-Google-Smtp-Source: ABdhPJwnloAQhlEDBf+EsM/PhMe8WXaMHuO+2UPZ9FqIyAW3GHXgQ+adfFNbvZBoKJfKQgfVdLwEDA==
X-Received: by 2002:a5d:4982:: with SMTP id r2mr5954901wrq.96.1621543752394;
        Thu, 20 May 2021 13:49:12 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:c394:d896:3913:6568])
        by smtp.gmail.com with ESMTPSA id n189sm3768061wme.9.2021.05.20.13.49.11
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 May 2021 13:49:12 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott] [PATCH 17/28] openssh: Exclude CVE-2007-2768 from cve-check
Date: Thu, 20 May 2021 21:48:51 +0100
Message-Id: <20210520204902.2527687-17-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210520204902.2527687-1-richard.purdie@linuxfoundation.org>
References: <20210520204902.2527687-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We don't build/use the OPIE PAM module, exclude the CVE from this recipe.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-connectivity/openssh/openssh_8.5p1.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-connectivity/openssh/openssh_8.5p1.bb b/meta/recipes-connectivity/openssh/openssh_8.5p1.bb
index 6a49cf71ccf..41ac303d38d 100644
--- a/meta/recipes-connectivity/openssh/openssh_8.5p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_8.5p1.bb
@@ -27,6 +27,9 @@ SRC_URI = "http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar
            "
 SRC_URI[sha256sum] = "f52f3f41d429aa9918e38cf200af225ccdd8e66f052da572870c89737646ec25"
 
+# This CVE is specific to OpenSSH with the pam opie which we don't build/use here
+CVE_CHECK_WHITELIST += "CVE-2007-2768"
+
 # This CVE is specific to OpenSSH server, as used in Fedora and Red Hat Enterprise Linux 7
 # and when running in a Kerberos environment. As such it is not relevant to OpenEmbedded
 CVE_CHECK_WHITELIST += "CVE-2014-9278"
-- 
2.30.2

