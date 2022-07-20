Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D8B3CCA486
	for <webhook@archiver.kernel.org>; Wed, 20 Jul 2022 08:45:35 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com
 [209.85.208.47])
 by mx.groups.io with SMTP id smtpd.web11.51627.1658306729805992562
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Jul 2022 01:45:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=T4kd8ckJ;
 spf=pass (domain: gmail.com, ip: 209.85.208.47,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f47.google.com with SMTP id v12so22858361edc.10
        for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Jul 2022 01:45:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Nwz3ggndKRksAXrn6ME8vKzNDV952ecCE1at7f1IuJA=;
        b=T4kd8ckJ2hvocOmy9KbeGEtZTGLvxm0kaw/BI8C9Y2mz9YionAzPAeVMFZF+AJQYXj
         gbe7lmG/XJBjvDTx9ldB0jGXyeUBqk99/04GJ9qKX+yvGhTVXRTSgCMstn+vOkeEFtBq
         eYl1z9V202MUE6qkH0VzBQCzh6vuMPM/aYFV+an3aaURqy4bJVhCqCVnkxNzEiYr7FU7
         hiRzrOiZSBTivHI5FvJyPsM3C9xz3xowe4QhbWx4BtBYGlKI1Ugq/LEOWHY3YyhpB5Y2
         dz2hikAB6gwvHW/H1j3vstC09PYYraF3yK7Qs7eQvDFHKHEwZ5ezFYePuww5O/WmWvF+
         4ZJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Nwz3ggndKRksAXrn6ME8vKzNDV952ecCE1at7f1IuJA=;
        b=2aTOQ61yijdpYolOXSp3ZpPmKlkLZA/ywALD8nb0q6t8m68EIued6mTCqvrhn1Tton
         VwXcNJqC5X6PVUiR+TNIW00RKclI/DbFnDFJnBx8gl6N4gTeLwhwhaxdIZmeQiZ1hbm+
         UBFYnhKmAiw1/i2M/YaPRZo10rUAX8eNQdOmXYhTlQEO5BZ7/KcYBbq/zAfzaLMqXylP
         uqrD4UXlW8+ICrG2ApCtKkPRKYqxlY5D9/ei1vItX7CMsEZK15JLxeuqLE5J8ZUCe5lw
         SJGP9FG2a+JyE2CL4ZA0MGSvCKqT3lRBOqZnN6yBOJgwrWBgkp7L9979FOjpJ2LRlBs+
         d7Mg==
X-Gm-Message-State: AJIora87YV0y2jDgjhvf08cYkhKVYRW2+n/RAMIytlu+a3cGYsle4tfG
	eQc+j4dV5Vsw8P3riQrW2b4zjwds0dU=
X-Google-Smtp-Source: 
 AGRyM1uQ3MLQ63qytWnkAcdqveqW0GXf9yEONHZ0amYcCkhrRdHN4apCYSPy3/tojLVsh9lFd1oshA==
X-Received: by 2002:a05:6402:5202:b0:43a:a238:61c with SMTP id
 s2-20020a056402520200b0043aa238061cmr49590693edd.186.1658306728378;
        Wed, 20 Jul 2022 01:45:28 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 s9-20020a170906a18900b00722e5b234basm7781784ejy.179.2022.07.20.01.45.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Jul 2022 01:45:27 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 39/51] piglit: upgrade to latest revision
Date: Wed, 20 Jul 2022 10:44:30 +0200
Message-Id: <20220720084442.2940187-39-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220720084442.2940187-1-alex@linutronix.de>
References: <20220720084442.2940187-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Jul 2022 08:45:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168334

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-graphics/piglit/piglit_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/piglit/piglit_git.bb b/meta/recipes-graphics/piglit/piglit_git.bb
index 38ededfcf8..932f2928a0 100644
--- a/meta/recipes-graphics/piglit/piglit_git.bb
+++ b/meta/recipes-graphics/piglit/piglit_git.bb
@@ -14,7 +14,7 @@ SRC_URI = "git://gitlab.freedesktop.org/mesa/piglit.git;protocol=https;branch=ma
            "
 UPSTREAM_CHECK_COMMITS = "1"
 
-SRCREV = "479b0002d004bc99514d186724b5a4fbfe543370"
+SRCREV = "c107462e4e429fa1cf6daac39168674c1c0c9fd4"
 # (when PV goes above 1.0 remove the trailing r)
 PV = "1.0+gitr${SRCPV}"
 
-- 
2.30.2


