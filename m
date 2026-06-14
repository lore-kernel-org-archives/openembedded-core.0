Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62C92CD98DE
	for <webhook@archiver.kernel.org>; Sun, 14 Jun 2026 08:03:40 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.105043.1781424219077284869
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Jun 2026 01:03:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=BwyDDcGS;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4921e4dd62dso9920905e9.0
        for <openembedded-core@lists.openembedded.org>; Sun, 14 Jun 2026 01:03:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1781424217; x=1782029017; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZnvdZcKpSHe7X/zfVe/TIBw4vCLHQcdQfld2HsrvIWo=;
        b=BwyDDcGS2NalFG6GDJ9FQzktoZDmGFQufyUcUue+O+Um7FqSdxjaReuSVvQ8pj7sRT
         +wnBlULoNYMU0Oz8y1YckrAb+e0Di/VvS4vRZHbnLwTilEQHXNi6I2wf/1refWqW+jNV
         uO8GM4kCoe7qjwkR+ne9jWcbG7GQugP5pXktU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781424217; x=1782029017;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZnvdZcKpSHe7X/zfVe/TIBw4vCLHQcdQfld2HsrvIWo=;
        b=MP9AMBd3QoBCT/TGw9HY1q7AwqZNbv6WafwRC3XyIrqXSoKAb61lSCNAjpBopmKX9K
         JftA2QQdr2R6Wp5o1r5M5CLZxUIOwQUU/9NgnAjRW8zy9Oqg5z0b2BIst7kIjBuzQMaz
         mdmrAgFvAuMYO0l9lwbiYic4bUe5ZJ+ILXQvhIsZffjEHs5ujsQuyO6gveprSp73IaXb
         R8cTuywwLAygeYBjajSFBPlWSDJihBor4vLsJFTOUGeUrasM/jDCbSvQp2TWQ3NakPZ0
         QGFDxhd0kjAZoUo/tTNZ+6OC5fkOMqqgUfY0he+gQLrItDyWNmchhJROV3nnKCa0zRMG
         9WvQ==
X-Gm-Message-State: AOJu0YxGtXwcQthUMWaa9uhUXlziXmUjxSiteLYbwclTghd5IX53vbQ1
	A2itZqLbrTIzg4OaArPkfeDQgKbqeB90tz5YfYw+cXC4twPNwiUVojlax7A8bJww4lxWO23213E
	Y+o9/
X-Gm-Gg: Acq92OHD82z+DuZLrbZnJwh9qocyDySqsq9ANtsyDBMYVepEGWH+Wy1ib5P3ZsdRXjy
	51c9QcWgezWImr2UAC1NGX7Aj+U25DTvZXuW2XXEBnMPVnuFxEsx6tL3O9kDLr2kPXsEsf6Y9vT
	CSNhW1VTFV3l8564t7HWX9iQw+s6IxyxlCWgSfVq6KlQdWFYK636QeuXPWWbqw60KvRr7FM/xiW
	p1M0C/cFhrnKLviZKLPJFu00CYETWBcHtOftSJ+9Ku2P+JJxuuvf0LnaVZO56pKPANNYD9nUJgZ
	b+sWBj4jzFDa57RqbC/p3l+9EP5GR973qYtMZ893lB5HYGglcIigT6Cj5VabOATQ3JIn4sj9zcM
	y4j8FQKfCfHUA1YdS2AJTLn2048KZaRbGxbNvz+GKSLd+n2LI35hlx0slPq0UMjAbFiHpJ+WwPV
	ke/Otf/06DTGcQdOgW4UMnMF8+U+PtQXrYql6RZehYZT+UGApRCbYUwr+jbYWdtUs=
X-Received: by 2002:a05:600c:1d02:b0:489:32b:ac0b with SMTP id 5b1f17b1804b1-490ec48fec5mr100199665e9.6.1781424217248;
        Sun, 14 Jun 2026 01:03:37 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:b23b:4f5a:d2e8:6789])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-492202edf89sm149999065e9.1.2026.06.14.01.03.36
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2026 01:03:36 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 18/56] libgit2: upgrade 1.9.2 -> 1.9.4
Date: Sun, 14 Jun 2026 09:02:29 +0100
Message-ID: <20260614080307.4017177-18-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260614080307.4017177-1-richard.purdie@linuxfoundation.org>
References: <20260614080307.4017177-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 14 Jun 2026 08:03:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238702

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../libgit2/{libgit2_1.9.2.bb => libgit2_1.9.4.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libgit2/{libgit2_1.9.2.bb => libgit2_1.9.4.bb} (93%)

diff --git a/meta/recipes-support/libgit2/libgit2_1.9.2.bb b/meta/recipes-support/libgit2/libgit2_1.9.4.bb
similarity index 93%
rename from meta/recipes-support/libgit2/libgit2_1.9.2.bb
rename to meta/recipes-support/libgit2/libgit2_1.9.4.bb
index 2e023b44ff3..e46e5d49fd8 100644
--- a/meta/recipes-support/libgit2/libgit2_1.9.2.bb
+++ b/meta/recipes-support/libgit2/libgit2_1.9.4.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=8eacfdc17c8f4d219e131a073973b97d"
 DEPENDS = "curl openssl zlib libssh2 libgcrypt libpcre2"
 
 SRC_URI = "git://github.com/libgit2/libgit2.git;branch=maint/v1.9;protocol=https;tag=v${PV}"
-SRCREV = "ca225744b992bf2bf24e9a2eb357ddef78179667"
+SRCREV = "f7164261c9bc0a7e0ebf767c584e5192810a8b24"
 
 inherit cmake
 

