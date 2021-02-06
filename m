Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web10.4360.1612602262932840927
 for <openembedded-core@lists.openembedded.org>;
 Sat, 06 Feb 2021 01:04:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=DBBTf1yS;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f43.google.com with SMTP id r7so827936wrq.9
        for <openembedded-core@lists.openembedded.org>; Sat, 06 Feb 2021 01:04:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6Qg+ykU/Kox50V9Er20PAX1ZN2SRQuimRRmKd3/lW/c=;
        b=DBBTf1yS4eZzBq7swo++JPr79CpDiRGwB6Kp3wFiBUkU+TIczJ0a0ZN3RDkyZl5G4Y
         FocLgw4BiPKxMHiNrQ1xZiVbScZfi+5fBJbBEoDizwTA3RDxAQJq7VUuyr4yX0IPJvTB
         RqQTY463xuCBQICSEsF7DR0RgynRQs0jLj4pU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6Qg+ykU/Kox50V9Er20PAX1ZN2SRQuimRRmKd3/lW/c=;
        b=MZEwxEZ17IsB4r38EPdMa6OU2cP59Xtw47T8bQR+gaRgaSwzZqdxGQj4HZgqIo6Lpl
         VvruGiuWC277yKp0S0kH8sgS6WqVSPQAozK6ZStrflZdaOXl3jwbZTelrooQEiom/tWv
         Am/9FBPi8TCWltlJbrKq3a3YwK4XbAh5F/oFT6A/DdOvPdqH3E4i2tlnPgNeTMbsidMF
         aNyHWK6I/RWGyYBWdU995ZnkbDwJpJUyNJJuex2jPJLXdiDiJmeBhS+Euq2aGZ9EzoL1
         7kMjsDmbIQw15QxymEluj3iZTewp7lmDNwwZCXGNCZLACIYYAYBORIntrrS1d9yKEi3M
         kmgA==
X-Gm-Message-State: AOAM533Zer9KCxhGRYT6gf6MviePXDR/WdJr3z7pixUgC93aC7B5aacu
	5VXqBcOV7mSdnZDvA1puWyBrevF00/wSQQ==
X-Google-Smtp-Source: ABdhPJxTj0I19JOlEUTGcbuFw2ll+q0O1LDqkWB8hItNE5NoFgPaAd7MajckRb6LMIPUDNAvfvBLbg==
X-Received: by 2002:a5d:4242:: with SMTP id s2mr9407195wrr.108.1612602261480;
        Sat, 06 Feb 2021 01:04:21 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:be75:a088:9c76:71df])
        by smtp.gmail.com with ESMTPSA id o124sm11332678wmb.5.2021.02.06.01.04.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Feb 2021 01:04:21 -0800 (PST)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: Ross Burton <ross.burton@arm.com>
Subject: [PATCH 10/10] autotools: no need to depend on gnu-config
Date: Sat,  6 Feb 2021 09:04:15 +0000
Message-Id: <20210206090415.1707868-10-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210206090415.1707868-1-richard.purdie@linuxfoundation.org>
References: <20210206090415.1707868-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ross Burton <ross.burton@arm.com>

autoconf 2.70 onwards installs its own copies of config.guess/config.sub
which we keep up to date when autoconf builds, so there's no need to
depend on gnu-config for those files.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes/autotools.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/autotools.bbclass b/meta/classes/autotools.bbclass
index b334a8186ad..9dc8ebdaa79 100644
--- a/meta/classes/autotools.bbclass
+++ b/meta/classes/autotools.bbclass
@@ -17,7 +17,7 @@ def autotools_dep_prepend(d):
                         and not d.getVar('INHIBIT_DEFAULT_DEPS'):
             deps += 'libtool-cross '
 
-    return deps + 'gnu-config-native '
+    return deps
 
 DEPENDS_prepend = "${@autotools_dep_prepend(d)} "
 
-- 
2.27.0

