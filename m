Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E54CC05027
	for <webhook@archiver.kernel.org>; Wed,  8 Feb 2023 07:22:25 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web11.3155.1675840928155593088
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Feb 2023 23:22:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=lsF26JNh;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id m16-20020a05600c3b1000b003dc4050c94aso737285wms.4
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Feb 2023 23:22:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=box0DbD18O5VcM8mwUSvZmembfzXQwtIPKGwpnfXzrU=;
        b=lsF26JNhu+H8AMdxiQsOXJZtHodWD0OrFN08hwxAjt7OTjyDb5WLYvZLBe84vzk14U
         u3C+HRbRrQYz4XNl0EnwfUAzOASgIvq1hzwqwbyH/x2rAf2hqI20eikZsF7QP1spgCps
         GI8r1oKFqluVsLNe248Ypourpt/CzX+L4fAcLjKUNG5XZLsasbysCQM0kJTjrVSwS/Qw
         AXw5kW9EqF1Woe91ytyErzh3R+G7Dz+i3C6TIO8lr32xd01B3UkA3KFtJ9UD7WiLULJ5
         jvw9AB6+T77PWWwtlUBJvho+lAWQGPjo4hpoBrSMDDT55awbhdAJXrTwxGd3C5gBukvO
         rc1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=box0DbD18O5VcM8mwUSvZmembfzXQwtIPKGwpnfXzrU=;
        b=t0T04Uyx3y9yrNUlM8jQbDbpjyYI1iBl+XHYkMaeNFGb/uDyoKbe0DBO6RAxmy1pbC
         JRf0Oou213mjy5lLYgvcCSou0TiJd+kaTj34UKH2YERZ9OKhG4s41WOtxAjg76c23tFU
         o80q7utmTuJlXPNXg0iXZSnhKGovkxAWsdV7IrNNwp5tifMitvjErtGLZ5zhbKrpWuyi
         Kup5xg3yN7CGeoWZxBvnSxkkOjHN8kI/e9Jra6Ki79h36cSpPvP1ZEgFTwZeDqOEiH+q
         lXKCAuB2VE0k5nwmNBGV8iGtYJXkCrM7mYil4urKwf9mNxiSOISUD85Tx91E+PvrQutd
         4T7w==
X-Gm-Message-State: AO0yUKXlbW7XnhrdrimOMY8YvD4oZ8rk5ofp/bp/th+nLgKJ7WW5jvFk
	Wg/JaGBxTbskrVhUfi5iK6nFNssQUZk=
X-Google-Smtp-Source: AK7set8OLnpXH2N7WvGYiLTvmUuEEwmArXZ9mntGhIXuKdD8j42J4wye+fcLXkwFbBeYYboYQFWGRg==
X-Received: by 2002:a05:600c:1894:b0:3de:1d31:1048 with SMTP id x20-20020a05600c189400b003de1d311048mr5513247wmp.29.1675840934899;
        Tue, 07 Feb 2023 23:22:14 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id l16-20020a05600c2cd000b003daffc2ecdesm1087926wmc.13.2023.02.07.23.22.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Feb 2023 23:22:14 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 47/52] sudo: upgrade 1.9.12p1 -> 1.9.12p2
Date: Wed,  8 Feb 2023 08:21:38 +0100
Message-Id: <20230208072143.2930292-47-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230208072143.2930292-1-alex@linutronix.de>
References: <20230208072143.2930292-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Feb 2023 07:22:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176887

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../sudo/{sudo_1.9.12p1.bb => sudo_1.9.12p2.bb}                 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/sudo/{sudo_1.9.12p1.bb => sudo_1.9.12p2.bb} (96%)

diff --git a/meta/recipes-extended/sudo/sudo_1.9.12p1.bb b/meta/recipes-extended/sudo/sudo_1.9.12p2.bb
similarity index 96%
rename from meta/recipes-extended/sudo/sudo_1.9.12p1.bb
rename to meta/recipes-extended/sudo/sudo_1.9.12p2.bb
index 1495b67b8b..ae7207c081 100644
--- a/meta/recipes-extended/sudo/sudo_1.9.12p1.bb
+++ b/meta/recipes-extended/sudo/sudo_1.9.12p2.bb
@@ -8,7 +8,7 @@ SRC_URI = "https://www.sudo.ws/dist/sudo-${PV}.tar.gz \
 
 PAM_SRC_URI = "file://sudo.pam"
 
-SRC_URI[sha256sum] = "475a18a8eb3da8b2917ceab063a6baf51ea09128c3c47e3e0e33ab7497bab7d8"
+SRC_URI[sha256sum] = "b9a0b1ae0f1ddd9be7f3eafe70be05ee81f572f6f536632c44cd4101bb2a8539"
 
 DEPENDS += " virtual/crypt ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 RDEPENDS:${PN} += " ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam-plugin-limits pam-plugin-keyinit', '', d)}"
-- 
2.30.2


