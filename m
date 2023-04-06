Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D4E9C761A6
	for <webhook@archiver.kernel.org>; Thu,  6 Apr 2023 16:02:36 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web10.162521.1680796953959888493
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Apr 2023 09:02:34 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=rC+W9t6v;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.47, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f47.google.com with SMTP id lr16-20020a17090b4b9000b0023f187954acso41092375pjb.2
        for <openembedded-core@lists.openembedded.org>; Thu, 06 Apr 2023 09:02:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1680796953; x=1683388953;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J11PGA1CMXE/5tnyQAm/M8K2MRWOE2Kl3DpgjN2Bhfo=;
        b=rC+W9t6vCwgn/l0SZD9PnT4aLhhDW0KRrSyLNwCO1LI6cKdO0vjfetcqd7VPly/Buk
         D1wJPVMzU3hNrZKNb9ZfKhyh5TtIKL0+RILeVmUrboYK+ODy59FtRidrUjYM5MdcI9HL
         Bb2SMtvAEvV+vKAAsJ5K3NXcAcF+7gVIXDHKZzZ+NvXH7LfZabZnD06IVnpswz8uKfYJ
         rtt5sPO3GpO+e606lT/uUOj+CT3deXCTMQrYrO4ibA2KT9Y+5H5rYtd7MLmW6arjNAC7
         z4s0NnMsiJLfOoCB8hNHFLyAoyWqSFTg7dg11+sdPxzxh9lZ9psgAwpAP2y2oNabP1G5
         yVtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680796953; x=1683388953;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J11PGA1CMXE/5tnyQAm/M8K2MRWOE2Kl3DpgjN2Bhfo=;
        b=KutZF8jPnYA89xHyvcsXXNlhp8vNj1VuOSuSWnkBcbCHcGjzCxC6kURwJRwnLCV2WT
         6mMGt4M1Z/xfsyL2O4lFH1o7P8eyZ31rSvX6Z4khw4VlO06anaYKhGPX4MPql2GtQWGm
         5CHeKT+aPT8l/6bSsC3Rsgv85tSOR6pTNPMOAOB4wNCTxvjYkV+e4hugPT0dsij1i7Sz
         AzzJ/cDs0TLfkvs3WadNG6BgAqygyXKTy2Pw0JbpXsaBPsRs85pUvGY7wtVCHsBsIQ7q
         SXqqdr8O9ZsDao/yFqC6DYIAXyLpr7xN3NeIEHtsPXlfW2zwN0daiSqfYezyqXXPafDj
         jmXg==
X-Gm-Message-State: AAQBX9c39jwuctNcbFJBJG++yGn+cpBB6EHNOdLDD3ftvo38+qsjkeEa
	VLcQYuZpq4WJhOWYFUBgSZNahek/V9qPdUcgGZw=
X-Google-Smtp-Source: AKy350b2vbDQM3oGmhFkxBIPoayBJf4xxXog8WhA7lO64xLGSyBwwD9VSDJe+bVzWgvd6+ebMIIlUg==
X-Received: by 2002:a05:6a20:b98:b0:cb:8885:5650 with SMTP id i24-20020a056a200b9800b000cb88855650mr2893750pzh.55.1680796952970;
        Thu, 06 Apr 2023 09:02:32 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id b13-20020aa7870d000000b0062e26487e7esm1532588pfo.155.2023.04.06.09.02.32
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Apr 2023 09:02:32 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 08/26] oeqa/selftest/reproducible: Split different packages from missing packages output
Date: Thu,  6 Apr 2023 06:01:35 -1000
Message-Id: <a623217aa3297eb6c0616723901788dfd706e1d7.1680796770.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1680796770.git.steve@sakoman.com>
References: <cover.1680796770.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Apr 2023 16:02:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179786

From: Jose Quaresma <quaresma.jose@gmail.com>

When we provide sstate_targets recipes they are reported as missing
which is not quite correct because they are proveided to cut build/debugging time.

Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit fd70a564d6946fa460638dd04ce2daecf4566cf3)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/selftest/cases/reproducible.py | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/reproducible.py b/meta/lib/oeqa/selftest/cases/reproducible.py
index f4dd779842..cd7aa8aafa 100644
--- a/meta/lib/oeqa/selftest/cases/reproducible.py
+++ b/meta/lib/oeqa/selftest/cases/reproducible.py
@@ -292,9 +292,13 @@ class ReproducibleTests(OESelftestTestCase):
                         self.copy_file(d.reference, '/'.join([save_dir, 'packages-excluded', strip_topdir(d.reference)]))
                         self.copy_file(d.test, '/'.join([save_dir, 'packages-excluded', strip_topdir(d.test)]))
 
-                if result.missing or result.different:
-                    fails.append("The following %s packages are missing or different and not in exclusion list: %s" %
-                            (c, '\n'.join(r.test for r in (result.missing + result.different))))
+                if result.different:
+                    fails.append("The following %s packages are different and not in exclusion list:\n%s" %
+                            (c, '\n'.join(r.test for r in (result.different))))
+
+                if result.missing and len(self.sstate_targets) == 0:
+                    fails.append("The following %s packages are missing and not in exclusion list:\n%s" %
+                            (c, '\n'.join(r.test for r in (result.missing))))
 
         # Clean up empty directories
         if self.save_results:
-- 
2.34.1


