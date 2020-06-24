Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web10.724.1593028049102856345
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Jun 2020 12:47:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=lzTykSFx;
 spf=pass (domain: konsulko.com, ip: 209.85.221.50, mailfrom: matt.ranostay@konsulko.com)
Received: by mail-wr1-f50.google.com with SMTP id a6so3467435wrm.4
        for <openembedded-core@lists.openembedded.org>; Wed, 24 Jun 2020 12:47:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=i8hNHUxA+oKoS6dFRs+GA3XTrFPV3tjX3r5k+ft9seY=;
        b=lzTykSFxD+zQchdd2w9s6fXJi47QU4N0VmX8zLF7G0q5sg2Jlg2hfDIwmr6nWw3JBa
         qy80thesrdveQAodyBoCqib8nzHYn9KLrRqrXiB3a/JwO9+CnJZYYePWOhge2pW0u517
         2/5tK13EEooVGu1CK/DO1RM7KoKUKMcxgE/6Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=i8hNHUxA+oKoS6dFRs+GA3XTrFPV3tjX3r5k+ft9seY=;
        b=NSbuDwHiCS9RyLyvSRrBDj7IKAlsARpi7/bssAf2P50SG+ZxXHMFXg+UgpHpXdVKNr
         88/vmxsZZwbaHMUYUD4LxYlrB2HJ7xFCbAdsWZcmkzldOHpAuLB5Gtx2MAYkK8XKQQc+
         Xl57V0ORO4wmNa/QDvLGyntWwp9D4HG4sir9cM44YPETxRVSMevvyKND9wPRrK6/BCSd
         +b/GeUbGDOxhF5GbOTt1NPEqcKzO/GvnYNZmiNqSugEjfgqGpA1zPNGWO3gxKVtZacX0
         3P90+fKYCGRPBjovD4qL55Lqt7kXrWLHFAuxnhDxKCSqXaSCXwxsBGeoRclb/0DK2ntR
         nvoA==
X-Gm-Message-State: AOAM5311tbqC8uBUhaJefWg8rNZwcYivcWtZ/1F1dDRVwNq51d0Hk+RA
	iqUTG27P08cCDY6ZwxWYOuKjYDNevfQ=
X-Google-Smtp-Source: ABdhPJyNgk8XiNL50+V2HyFl4Hjd1jeeuE/d7YtYh0RGgAVChikFMlGPSUh+Mmg3DSSQ3zQB9f9Z6Q==
X-Received: by 2002:adf:fe0e:: with SMTP id n14mr29850965wrr.325.1593028047364;
        Wed, 24 Jun 2020 12:47:27 -0700 (PDT)
Return-Path: <matt.ranostay@konsulko.com>
Received: from taos.konsulko.bg (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id n16sm22018315wrq.39.2020.06.24.12.47.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2020 12:47:26 -0700 (PDT)
From: "Matt Ranostay" <matt.ranostay@konsulko.com>
To: openembedded-core@lists.openembedded.org,
	akuster808@gmail.com
Cc: Alexander Kanavin <alex.kanavin@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [OE-core][warrior][PATCH 2/2] python3: un-break disabling the readline PACKAGECONFIG
Date: Wed, 24 Jun 2020 22:47:16 +0300
Message-Id: <20200624194716.1107-2-matt.ranostay@konsulko.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200624194716.1107-1-matt.ranostay@konsulko.com>
References: <20200624194716.1107-1-matt.ranostay@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Alexander Kanavin <alex.kanavin@gmail.com>

Previously the readline module would have been built regardless of
readline's presence in the sysroot, and the recipe would
fail at package_qa.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/python/python3_3.7.7.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/python/python3_3.7.7.bb b/meta/recipes-devtools/python/python3_3.7.7.bb
index 4d1c5b0d10..684e9ce3ed 100644
--- a/meta/recipes-devtools/python/python3_3.7.7.bb
+++ b/meta/recipes-devtools/python/python3_3.7.7.bb
@@ -97,6 +97,7 @@ do_configure_prepend () {
     cat > ${B}/Modules/Setup.local << EOF
 *disabled*
 ${@bb.utils.contains('PACKAGECONFIG', 'gdbm', '', '_gdbm _dbm', d)}
+${@bb.utils.contains('PACKAGECONFIG', 'readline', '', 'readline', d)}
 EOF
 }
 
-- 
2.20.1

