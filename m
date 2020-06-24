Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web11.15474.1593010786690754898
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Jun 2020 07:59:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=aKCOUfL3;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f54.google.com with SMTP id j94so2639019wrj.0
        for <openembedded-core@lists.openembedded.org>; Wed, 24 Jun 2020 07:59:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=gyv6KmF+iEFhGy+EjIrXg1TvBSz+agiHhQwuLfWxKWY=;
        b=aKCOUfL31QsFfS41ETwD5Wwzj1sfjaNKGPetUcXJV8MVNqu+WRjcy2VLb0fStMll0Z
         bliEdY06i+1thVWrkIO8ODMgSr7yz6U44+6JfJV74un5iFyB/RrnbzF6k2kbSSvvM29o
         FmQePLcSTTf4oNPjaHnCroilxoxiRsOBW8Gvs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gyv6KmF+iEFhGy+EjIrXg1TvBSz+agiHhQwuLfWxKWY=;
        b=Xfl6dGXMfz71E7o38zd5XdrzQ0KfLrUBxCzqVuQnTHGsINhN3dffXI0g5V/K7Myvws
         VTWyjxUMleGtx0CYtRFypYdAODVsLGVMF+ro8SGSknTjWj7tF+vnrBA228VWGiOEmUGk
         1V7jktvmm+/gj2dUufQ2HNK3rJWVlYKbZ3qHz8n0GRDia8+Rb2Myhw/ecCbw7OOFXqpo
         rYalX7CU8GUOqhGneGyda4hFP9v6dTyJXrc6KxZsG5BZaCpbBbMQHzlGehoaTVd5fpFr
         0sJ3UNBKx7PdXrP+DO45zkkddsFol66OWJa1HTqFouk8sU9Q2RpDrm2mfCKEN0k62lhR
         MGNA==
X-Gm-Message-State: AOAM530lccCBsphJb9pwG4wUw07vJFwZgr7JJUKx1QjX+nWEG26f8Pc3
	pCyVgMFLsH4gOphPA1HhpaRU9OyE1tEy7A==
X-Google-Smtp-Source: ABdhPJz0Ml+D4sniuHPEt9jiBp6eUfLEZSTv6sS/IU11yqVOTB95LXFq9hYXjiOpZfFElngVfDxvFw==
X-Received: by 2002:adf:f450:: with SMTP id f16mr31831731wrp.307.1593010784762;
        Wed, 24 Jun 2020 07:59:44 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id e4sm1179555wrt.97.2020.06.24.07.59.43
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2020 07:59:44 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] scripts/install-buildtools: Handle new format checksum files
Date: Wed, 24 Jun 2020 15:59:40 +0100
Message-Id: <20200624145940.626352-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200624145940.626352-1-richard.purdie@linuxfoundation.org>
References: <20200624145940.626352-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Autobuilder generated checksum files only have a single space between the sum and the
filename, tweak it to account for this.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 scripts/install-buildtools | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/install-buildtools b/scripts/install-buildtools
index 5538ff70472..7118f48be91 100755
--- a/scripts/install-buildtools
+++ b/scripts/install-buildtools
@@ -241,7 +241,7 @@ def main():
                 if ret != 0:
                     logger.error("Could not download file from %s" % check_url)
                     return ret
-            regex = re.compile(r"^(?P<checksum>[0-9a-f]+)\s\s(?P<path>.*/)?(?P<filename>.*)$")
+            regex = re.compile(r"^(?P<checksum>[0-9a-f]+)\s+(?P<path>.*/)?(?P<filename>.*)$")
             with open(tmpbuildtools_checksum, 'rb') as f:
                 original = f.read()
                 m = re.search(regex, original.decode("utf-8"))
-- 
2.25.1

