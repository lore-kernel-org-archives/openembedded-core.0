Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web09.11080.1632141990440206532
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Sep 2021 05:46:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=D8SIPilU;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f46.google.com with SMTP id t8so29319780wrq.4
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Sep 2021 05:46:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=mui170Gyb+hIM8+sXfKKf9nroKgRaj6AiZ7WCGmGiDY=;
        b=D8SIPilU1D6CG9GhDHdyjXEcfzmkfq6hzlb9YqSpF0vM6e8wVIKimmcTVEXsk+LTOi
         mgjqbJ65T9tzB/daxNuGu9zXJK5HtdWa/pTjwv3PdaeGNqqjlDT66w22kaSxuCnmfZqY
         Hqn6ssRWDjI9YiHM4jFsNgOWP2LuWn1hok+Mo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mui170Gyb+hIM8+sXfKKf9nroKgRaj6AiZ7WCGmGiDY=;
        b=I6thCcG5tGJqaAasH8Xx/wv8nFqzVQ0v/gq/Hcpk5gbbi1LujLS2tYTT8dE/HTOFGd
         QMNSvHZiFwtmCYc82GMqyJx79IaYfVmJaHZkAUyFTtEAkOWeJAE3lW4/yTHhTgmJOkO5
         Z+vcftaGqFXHYDbGu6PPmnfNE3DPzCkehErL/RrVDflvVs31MPxQxVzna9JgrZfiynmN
         dtAd5cZQBiG6exjXU+SJfXKJ0pYblMoqEPq797dAm9Dv4R60cSPmfsuWUXn/hW+Wi5W2
         pHODTl6zEzf3U4U48sJNZWxag0qI9nnMkWCuqEIzBMPPVcFDu3Jy+3sJgQr/AvcU3FEN
         LwzQ==
X-Gm-Message-State: AOAM533ngV3xbD/vv4zEPg2ZyhVT4gM/tiquuzDU/Perhz2WUWWlobQv
	LuLB3oEGQ6k0sbzSzMZbpWCO751QLX2RV7Qt
X-Google-Smtp-Source: ABdhPJylykHFnvwkv/4He9RVwjGVBUABiFASVFvJ3ilUlgF2VvSub869luoSVFppI02Bm55O7/9pmw==
X-Received: by 2002:a5d:4950:: with SMTP id r16mr28701880wrs.265.1632141988841;
        Mon, 20 Sep 2021 05:46:28 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:7173:466e:b128:3e8b])
        by smtp.gmail.com with ESMTPSA id j21sm15773514wrd.48.2021.09.20.05.46.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Sep 2021 05:46:28 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 08/14] sstate: Ensure deploy tasks don't pull in toolchains
Date: Mon, 20 Sep 2021 13:46:15 +0100
Message-Id: <20210920124621.1576702-8-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210920124621.1576702-1-richard.purdie@linuxfoundation.org>
References: <20210920124621.1576702-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If an image is built from sstate, the cross toolchain was being pulled in.
This was due to the sstate dependencies for deploy tasks not being considered
in the "depvalid" logic.

do_deploy tasks do not need their populate_sysroot dependencies when installed
from sstate so skip these. This reduces the sstate pulled in by an image
build from sstate significantly.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/sstate.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index 29679e6a5ee..498dfc681cf 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -1090,8 +1090,8 @@ def setscene_depvalid(task, taskdependees, notneeded, d, log=None):
         # do_package_write_* need do_populate_sysroot as they're mainly postinstall dependencies
         if taskdependees[task][1] == "do_populate_sysroot" and taskdependees[dep][1] in ['do_package_write_deb', 'do_package_write_ipk', 'do_package_write_rpm']:
             return False
-        # do_package/packagedata/package_qa don't need do_populate_sysroot
-        if taskdependees[task][1] == "do_populate_sysroot" and taskdependees[dep][1] in ['do_package', 'do_packagedata', 'do_package_qa']:
+        # do_package/packagedata/package_qa/deploy don't need do_populate_sysroot
+        if taskdependees[task][1] == "do_populate_sysroot" and taskdependees[dep][1] in ['do_package', 'do_packagedata', 'do_package_qa', 'do_deploy']:
             continue
         # Native/Cross packages don't exist and are noexec anyway
         if isNativeCross(taskdependees[dep][0]) and taskdependees[dep][1] in ['do_package_write_deb', 'do_package_write_ipk', 'do_package_write_rpm', 'do_packagedata', 'do_package', 'do_package_qa']:
-- 
2.32.0

