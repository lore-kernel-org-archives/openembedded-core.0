Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A33B7C0729B
	for <webhook@archiver.kernel.org>; Thu, 27 Jul 2023 14:36:40 +0000 (UTC)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
 by mx.groups.io with SMTP id smtpd.web11.9062.1690468593747579874
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Jul 2023 07:36:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=rfTKvya+;
 spf=pass (domain: gmail.com, ip: 209.85.208.175, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2b9a2033978so15792641fa.0
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Jul 2023 07:36:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690468592; x=1691073392;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IGNY/PCGIRMWY/qqmhYtaScUBu7Fl8K681wAcT9b0TM=;
        b=rfTKvya+yelRW1O0roV8oa9V5SQYk5WXTaJnHxLG6/Goni1VOLDDE2qntZFXl6+Pr1
         zRlZA3wSNYCfH6OYds/OcLeFeiMOx7zGMaN7pZc7ilxMav17HZpnjKfrwNF7vxonQXOy
         g0XC5b6AvCViflZpIbbvB+uA/pWlcaKkNlbZMTDybBX5kqy8iRWqCCuMjAO4WAqUL7zp
         CtjVH0T4WIvvD9vP+073tKYn6T5z05gTrx3rKF0pInzPNgz3edTL3b06Q8BBPQnnzdQ1
         QjA0n8ayYUa6gUZ5Z9VQE/pm/PqdxUA00CNeerSTGyGG2fhmDYIFZp/yC2gfogoS2hmR
         vJpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690468592; x=1691073392;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IGNY/PCGIRMWY/qqmhYtaScUBu7Fl8K681wAcT9b0TM=;
        b=gdybTEnZqo6ORVctsR14xu6LiirZUAnEWex2AOcnr8J9EjDZUSkEyS2ynsa/YDcMiS
         5vGH3UeU0Mr37r5R4At5U0rp2xYOnaMr+HMpJva9v3o04eN9/tM8HzMzfmUW1IMqk89Y
         bJnvN7MSDklQPuJ+/O/0HRiOq0/zC3Tq6SA0Y/YIwZyiP4rT+dNa8Rg5Oht+9o3tOige
         R+PqrTaG26GOHYGsmpM89qNehx62a5ujmMwOczAJ3JkHtxfMbanpr7TwPanyBOL6MSky
         mjpRFxjGR1G0Kg5uQDoDeLP9novZGo6/i+4Z4lq/0Dmzl01fmLbPC/atBWd3/ofZ8ven
         lEEg==
X-Gm-Message-State: ABy/qLYheTYegq1jyQByMAbkLil4AGhSaf7EwHAPclAAXy7jl9vIbZxh
	pkcDh3kETP+FP6B8V8/osWHAw66X+jY=
X-Google-Smtp-Source: APBJJlHLOCR4WzHVS7K7FecOCCmpeLmV9XbzsUqpqJVI1XPjr3EZq2oTAtFB7AdXKEscF90bPh2htw==
X-Received: by 2002:a05:6512:2ef:b0:4fd:d7c7:170c with SMTP id m15-20020a05651202ef00b004fdd7c7170cmr1870528lfq.23.1690468591561;
        Thu, 27 Jul 2023 07:36:31 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id m10-20020a17090607ca00b0099bcf9c2ec6sm846725ejc.75.2023.07.27.07.36.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jul 2023 07:36:31 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 03/21] devtool: do not run recipe_qa task when extracting source
Date: Thu, 27 Jul 2023 16:36:09 +0200
Message-Id: <20230727143627.3718496-3-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230727143627.3718496-1-alex@linutronix.de>
References: <20230727143627.3718496-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Jul 2023 14:36:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184943

The immediate reason is that the task is sstate enabled, and due
to the way devtool sets up source extraction this causes bogus
values to appear in tmp/sstate-control/index-* files.

Also, recipe_qa may contain hard failures in the future, and it
would be counterproductive for the failures to prevent devtool
workflows (which may perhaps be about fixing the failure).

An alternative would have been to not insert recipe_qa task before
fetch task, but that would greatly delay the checks in larger
bitbake builds, and it's better to run them as early as possible.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 scripts/lib/devtool/standard.py | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index 86ca77f7180..88a6ecd4219 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -567,6 +567,8 @@ def _extract_source(srctree, keep_temp, devbranch, sync, config, basepath, works
         logger.debug('writing append file %s' % appendfile)
         with open(appendfile, 'a') as f:
             f.write('###--- _extract_source\n')
+            f.write('deltask do_recipe_qa\n')
+            f.write('deltask do_recipe_qa_setscene\n')
             f.write('ERROR_QA:remove = "patch-fuzz"\n')
             f.write('DEVTOOL_TEMPDIR = "%s"\n' % tempdir)
             f.write('DEVTOOL_DEVBRANCH = "%s"\n' % devbranch)
-- 
2.30.2


