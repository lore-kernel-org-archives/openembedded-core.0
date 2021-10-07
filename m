Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE9D1C433FE
	for <webhook@archiver.kernel.org>; Thu,  7 Oct 2021 14:07:04 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web09.12247.1633615623616395723
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Oct 2021 07:07:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=OBamFN+T;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.48,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f48.google.com with SMTP id t2so19473093wrb.8
        for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Oct 2021 07:07:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=Y6BYyv1okUbWOP+HrEWIEVkNDnJlej14zJGPmtcMmts=;
        b=OBamFN+T7JFBxmODU3JJn+GCEGlyPRo/6MajtAR+XaO3uMcv5EXyw0PqIx0qoocZGR
         w+hVMhYuI6itLhcLV5lqOYRlNb+emCO2pL+Gl+Vw7CpOo8qpkejFoQylKHco71hCLXxV
         eQRrAeAXc5yAzIDI0JHr2hR2zhPZzJ4RS3cfo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Y6BYyv1okUbWOP+HrEWIEVkNDnJlej14zJGPmtcMmts=;
        b=yBpXPdLKpHJprzi3j96ukT9TAowgTwW1aOjNMawEbdf+vS/6HJ8oCdJwgVYY0q3L25
         EsAzEyYdINOl+z4b4WnPBvTifvbgvA9i0H6ago7ebKey2wuDN4ay7Lx38gQzUoyKwH1T
         Og4SaqK+Jn+Vno4CNU5NnQlsKuOFlkp81SHs12gY3ocVAyHDv7F5nYeVf4AJ6gtR7pGg
         du0kkycGse1cQ9Y+Mc4pYn6nCjjzI+WXxfzqKQhF/AqqYDlfWEiQUdzfQroLd0ZhgKUy
         11oAGVwA+z/QjNeoYqDKI6NIJZPwjLD/xBXcRVxKIUSW6qBX2RPMRyIBHMXgVI+NwFgm
         sbwQ==
X-Gm-Message-State: AOAM532glh+nZRKOpe4uYTuwLrUgDdWP/1Azum+Dhh34hnWvqg8ViyRF
	ocZZtrhxvM/CcuzHNmCbc0MhThdBp9XXVg==
X-Google-Smtp-Source: 
 ABdhPJz31K20D7kX5a5LVhOxcIPYyPF/2LbnXcnS5KE+I1VTxDaZ09H6kDsWlP+89lhmszEvZ6flhw==
X-Received: by 2002:adf:aa4e:: with SMTP id q14mr5739486wrd.100.1633615621926;
        Thu, 07 Oct 2021 07:07:01 -0700 (PDT)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:4ef0:3e29:718c:a98a])
        by smtp.gmail.com with ESMTPSA id
 d3sm27441979wrb.36.2021.10.07.07.07.01
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Oct 2021 07:07:01 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] rpm: Deterministically set vendor macro entry
Date: Thu,  7 Oct 2021 15:06:59 +0100
Message-Id: <20211007140659.2419135-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211007140659.2419135-1-richard.purdie@linuxfoundation.org>
References: <20211007140659.2419135-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Oct 2021 14:07:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156726

On an aarch64 build host, vendor is found to be "unknown", on x86 systems
it is "pc". This filters through to the PLATFORM tag in target rpms.

We saw reproducibility test failures where the PLATFORM tags in noarch
rpms were changing depending upon which host built them. Forcing the
vendor value to a consistent one makes things deterministic.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/rpm/rpm_4.16.1.3.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb b/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb
index 2ff9c2b1122..aa6b5ee8aad 100644
--- a/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb
+++ b/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb
@@ -59,7 +59,8 @@ AUTOTOOLS_AUXDIR = "${S}/build-aux"
 # OE-core patches autoreconf to additionally run gnu-configize, which fails with this recipe
 EXTRA_AUTORECONF:append = " --exclude=gnu-configize"
 
-EXTRA_OECONF:append = " --without-lua --enable-python --with-crypto=libgcrypt"
+# Vendor is detected differently on x86 and aarch64 hosts and can feed into target packages
+EXTRA_OECONF:append = " --without-lua --enable-python --with-crypto=libgcrypt --with-vendor=pc"
 EXTRA_OECONF:append:libc-musl = " --disable-nls --disable-openmp"
 
 # --sysconfdir prevents rpm from attempting to access machine-specific configuration in sysroot/etc; we need to have it in rootfs
-- 
2.32.0


