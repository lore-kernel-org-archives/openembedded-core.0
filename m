Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web11.503.1621543755506727421
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 May 2021 13:49:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=XzBioq4o;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f54.google.com with SMTP id z17so18944110wrq.7
        for <openembedded-core@lists.openembedded.org>; Thu, 20 May 2021 13:49:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=9joeA2cL6KpnrNKr214B/WvcXS89WjJ+jVxr5u6rzvA=;
        b=XzBioq4o0z1NqXcI+tnfBEbIMHQLHrT2rLQST0sBqi7Y+uwTK609g3jFPZwV6dUXWY
         6ElMXGprdCwkoSba8BW9ZWXzZuaqbdPDJIjT5d9z+vp3ssEp1WvqqXCaRaLgd3HFZHPv
         hs+2jEz1cYL/IKkz65Evl29yr/s+Xa1jmJ90Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9joeA2cL6KpnrNKr214B/WvcXS89WjJ+jVxr5u6rzvA=;
        b=AXH9YHchF348h8Kx+UCaVlIQJI7Mjd3u0f3jjYHvLkR1s8JQ85EQa9Hr7qCCzN6fPR
         AwwIn+070Bsa5nLepuZcGaCvLkUEI+24qHp1lpitszYfhpSZiHe7kuRMYELOSZ8Iggeq
         mUQTmHkY8/IvIvkGMwkytwpcHWp4hGi/4zHau9wPRs90Kv25bo/OhLG61ibrmBdGgZt6
         SlA7ZOoFAwUloui1f5BznP1OH3rM4hfRtfa/T566VjPiLekJo3nikA6OwdHy0oRhVNxY
         HVEnw9Z20NESemVKuPwpHlIwhfPMegoXMgVcsvIiXHHH0Y/TSn+zDBizyNE+avD5fuiD
         tFZw==
X-Gm-Message-State: AOAM531xyQSIfibXUaicyhWQg68vSlHPsbdCOexV+RkyikyJeywZMqmq
	WiXWk3pBQf6Ft75ZAwJFfKQTK5T931i+4A==
X-Google-Smtp-Source: ABdhPJwtUC6a20AaMkwqoLKIY97mJ8s1/1LS9j8Z6n59FVJ3aAoY0/lER214IPLkjmPx0is+0h7JKA==
X-Received: by 2002:a05:6000:24f:: with SMTP id m15mr6262373wrz.338.1621543754028;
        Thu, 20 May 2021 13:49:14 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:c394:d896:3913:6568])
        by smtp.gmail.com with ESMTPSA id n189sm3768061wme.9.2021.05.20.13.49.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 May 2021 13:49:13 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott] [PATCH 19/28] unzip: Exclude CVE-2008-0888 from cve-check
Date: Thu, 20 May 2021 21:48:53 +0100
Message-Id: <20210520204902.2527687-19-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210520204902.2527687-1-richard.purdie@linuxfoundation.org>
References: <20210520204902.2527687-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The patch mentioned as the fix for the CVE is applied to the 6.0 source
code. Zip versioning makes CPE entry changes hard.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-extended/unzip/unzip_6.0.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-extended/unzip/unzip_6.0.bb b/meta/recipes-extended/unzip/unzip_6.0.bb
index 0c56a39d921..af5530ab386 100644
--- a/meta/recipes-extended/unzip/unzip_6.0.bb
+++ b/meta/recipes-extended/unzip/unzip_6.0.bb
@@ -32,6 +32,9 @@ UPSTREAM_VERSION_UNKNOWN = "1"
 SRC_URI[md5sum] = "62b490407489521db863b523a7f86375"
 SRC_URI[sha256sum] = "036d96991646d0449ed0aa952e4fbe21b476ce994abc276e49d30e686708bd37"
 
+# Patch from https://bugzilla.redhat.com/attachment.cgi?id=293893&action=diff applied to 6.0 source
+CVE_CHECK_WHITELIST += "CVE-2008-0888"
+
 # exclude version 5.5.2 which triggers a false positive
 UPSTREAM_CHECK_REGEX = "unzip(?P<pver>(?!552).+)\.tgz"
 
-- 
2.30.2

