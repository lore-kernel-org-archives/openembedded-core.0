Received: from mail-qv1-f65.google.com (mail-qv1-f65.google.com [209.85.219.65])
 by mx.groups.io with SMTP id smtpd.web11.2443.1591122082985839714
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Jun 2020 11:21:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=PfFMoczP;
 spf=pass (domain: linaro.org, ip: 209.85.219.65, mailfrom: ralph.siemsen@linaro.org)
Received: by mail-qv1-f65.google.com with SMTP id f89so2257406qva.3
        for <openembedded-core@lists.openembedded.org>; Tue, 02 Jun 2020 11:21:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=bntwAUwSvJsePvxRRaaKbMAaFDymxEwnsa981lgiJyk=;
        b=PfFMoczPlTl3zJHphuc42kczm1FkqCPLi8jYCci/Hz7af+rMVGdBm9/4oyRZWBsSlq
         lQq5gseCG18PY4D2ObPElMRO2CU3IT6SsyhpB5hbphBM6B8tEEXmbdmnH/n6NgMeEtPV
         euLdI9+DIfWlsGmOaRImu5itp3EKwNs7rLDJSJwt26FLiHj9xhM9q5AmU+johoqj4CPY
         9ZHYh/+hf4R6Nrzy0hlgg5gUjAEhrs5usr7Z29JjKate198v5JmfAdsL5SClaivrrv0C
         kyNetZESuP/U+2QP6o9RQ8rTqdPdNzjvqF3Siv5S0OqvM+MauOuxJFQsdsT1PlRAYDSC
         ZzkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=bntwAUwSvJsePvxRRaaKbMAaFDymxEwnsa981lgiJyk=;
        b=uNG3Knr1SxGqR3MFPZhg4D6qcUtSls6avhEPFd0oBLeGv25TMLNRwsbLCu/q3cxhhT
         vCWNqJPP5sRltdpou9ge64j+6Sic5DKWZdhcv96VsziHTulHw+QQ/vE4Cb+aeygMVIps
         SHrmwNj8Jp3gn8wD0M1US7x80pI8ebQ0b5fRNysl3SjiFeo0jTK0EORbHMEJWXevtTnR
         AKJqENYU9OyfsbbLWKxbcn20dFGif5Bp+Mk1bPwxOlhilIGqvZRZnRAIMI52xsLRsqhs
         te+nQHc6m4ZuPJXfezILrFjnOyOnsHcivLYedaP423/Rk0PUm9Ep1osCyug2FU8dZ6OI
         7q6w==
X-Gm-Message-State: AOAM531g+bMHvO813LW9XXDwQ5wRPmcDZCJCcauPL9we98THhRhwaEKY
	CR/N8MxNyXtwWz7/stTKx2JeIPYbGtI=
X-Google-Smtp-Source: ABdhPJzpKpkTNsrG+JLglBgUlsAUmWMUtYVh06gxaW6HWB/TSI5jBchKpVakeNHpBJ8Ll/KYrI73Kw==
X-Received: by 2002:a05:6214:a72:: with SMTP id ef18mr7185847qvb.239.1591122081809;
        Tue, 02 Jun 2020 11:21:21 -0700 (PDT)
Return-Path: <ralph.siemsen@linaro.org>
Received: from maple.netwinder.org (rfs.netwinder.org. [206.248.184.2])
        by smtp.gmail.com with ESMTPSA id h50sm3363833qte.25.2020.06.02.11.21.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2020 11:21:21 -0700 (PDT)
From: "Ralph Siemsen" <ralph.siemsen@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Ralph Siemsen <ralph.siemsen@linaro.org>
Subject: [PATCH] cve-check: include epoch in product version output
Date: Tue,  2 Jun 2020 14:21:13 -0400
Message-Id: <20200602182113.19333-1-ralph.siemsen@linaro.org>
X-Mailer: git-send-email 2.17.1

In the generated cve.log files, include the epoch in the product
version. This better matches how versions are displayed elsewhere,
in particular the bb.warn("Found unpatched CVE...") that appears
on the terminal when CVEs are found.

Signed-off-by: Ralph Siemsen <ralph.siemsen@linaro.org>
---
Hopefully this is the correct mailing list for this patch.
If accepted, please also merge into older branches (eg. warrior).
 meta/classes/cve-check.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
index 556ac6e67f..514897e8b8 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -301,7 +301,7 @@ def cve_write_data(d, patched, unpatched, whitelisted, cve_data):
 
     for cve in sorted(cve_data):
         write_string += "PACKAGE NAME: %s\n" % d.getVar("PN")
-        write_string += "PACKAGE VERSION: %s\n" % d.getVar("PV")
+        write_string += "PACKAGE VERSION: %s%s\n" % (d.getVar("EXTENDPE"), d.getVar("PV"))
         write_string += "CVE: %s\n" % cve
         if cve in whitelisted:
             write_string += "CVE STATUS: Whitelisted\n"
-- 
2.17.1

