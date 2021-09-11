Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web12.2212.1631354697597192664
 for <openembedded-core@lists.openembedded.org>;
 Sat, 11 Sep 2021 03:04:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=h/MFR+mk;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f49.google.com with SMTP id i23so6355458wrb.2
        for <openembedded-core@lists.openembedded.org>; Sat, 11 Sep 2021 03:04:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=B5qZ+TkeUJq/lcvYxSZGFpG0+teTZHsTCp4TEuCss3Y=;
        b=h/MFR+mkZiQ+vLE4J8UV/24H1XDmRL6WdzaIRGvLgSWXVJMmkZxHPMBQVXvuXHtNFe
         owlgxiDrRu5LAyi1AjlSZhJWmHWtKSLNTlrfYYm5vsMYJy5n05ZYLUNR1kty83LE3uuk
         s7m7yFwPzVlX0rtcVYUESSmeHaA6MuBeGoV4I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=B5qZ+TkeUJq/lcvYxSZGFpG0+teTZHsTCp4TEuCss3Y=;
        b=xwO+DUj7D3HJ5OPKzx8Hck7aF/UNFnoI++l5YsLnb33X/U3Ia/u99pxmj74wbEUFVg
         vSztTKfZSXKJZDEmxxgNjfmMikyNobLuZE07sHYtPELzTc2txrEGACy8XwPkm9c5ehYZ
         rt8gfLR9LaKuvoPjWEjrh0yfpnUoi006etXV/K3sbo72+/2Ggo13Q3bqPZoI7TP3qwVy
         kGe1UlXP5OpUUqc5tKD06hp2URkqSOjFyWRBtDOjR6DMjzjix8AixGH4uA3e1wH2vU31
         jFm+oDkH34efaIGf9QhzlE8/G+dOVxISTKtWvHUZb0aopCf9F3rTVgJ+qVTZikf+LmQr
         U5lA==
X-Gm-Message-State: AOAM530N0oBnWSsVhD732Y5XAte3sVGqH/9Tsx7oe/ZXtLG6TnMUR2K+
	CF+9GDHiVxQh4FPcHalwPytUbwHX2xqGzIVb
X-Google-Smtp-Source: ABdhPJw1e9BIy5Bef84D3kfOssvvPnkkGk8lHp9+O6GkhPvHhN63gcH2TwA9QvNcH28YcUP9gDTpmQ==
X-Received: by 2002:adf:ef48:: with SMTP id c8mr2361425wrp.349.1631354695965;
        Sat, 11 Sep 2021 03:04:55 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:a1a5:8b9e:48ea:5b97])
        by smtp.gmail.com with ESMTPSA id p13sm1222274wro.8.2021.09.11.03.04.55
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Sep 2021 03:04:55 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] sstate: Avoid problems with recipes using SRCPV when fetching sstate
Date: Sat, 11 Sep 2021 11:04:54 +0100
Message-Id: <20210911100454.1285040-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210911100454.1285040-1-richard.purdie@linuxfoundation.org>
References: <20210911100454.1285040-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When fetching sstate, SRCPV can be expanded withuin PV which breaks the
sstate fetcher as other variables like SRC_URI are changed by the fetcher
code. Expand the variable before doing this to avoid those problems and
hence avoid setscene task failures with remote sstate storage in git
recipes.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/sstate.bbclass | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index d7f1b3f26ed..62e45cb4a8b 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -731,6 +731,7 @@ def pstaging_fetch(sstatefetch, d):
     localdata.setVar('FILESPATH', dldir)
     localdata.setVar('DL_DIR', dldir)
     localdata.setVar('PREMIRRORS', mirrors)
+    localdata.setVar('SRCPV', d.getVar('SRCPV'))
 
     # if BB_NO_NETWORK is set but we also have SSTATE_MIRROR_ALLOW_NETWORK,
     # we'll want to allow network access for the current set of fetches.
@@ -755,6 +756,9 @@ def pstaging_fetch(sstatefetch, d):
         except bb.fetch2.BBFetchException:
             pass
 
+pstaging_fetch[vardepsexclude] += "SRCPV"
+
+
 def sstate_setscene(d):
     shared_state = sstate_state_fromvars(d)
     accelerate = sstate_installpkg(shared_state, d)
-- 
2.32.0

