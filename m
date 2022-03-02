Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F623C433EF
	for <webhook@archiver.kernel.org>; Wed,  2 Mar 2022 00:47:08 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web11.2441.1646182027636537064
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Mar 2022 16:47:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Gr6FGOW4;
 spf=pass (domain: gmail.com, ip: 209.85.221.47,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id r10so276883wrp.3
        for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Mar 2022 16:47:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=cTekW8MoQnwOt4kBq+ksLEZR/pr0SZkiiNMnfbQxOMg=;
        b=Gr6FGOW4tA054IzKRWo6D8X53TzVl3HRK3tLg39Iif7ZuTNeg7OkdoDKfLc+590qxN
         CIUWqqdx5rIfUCqNXEK6MLD74nruLHAPVcvhg0/d0A5DdLH3+4dnLgC1RVef8j44okFu
         GMBhsSDy4zdgDCCORtCit6pzqqWzrH/Xf3Ip48qPmn/ap9qwtIMwNVu6N6iM5vITrbHi
         DUHbicaj1kQlErpoOxpgBEFVnyAIvhSv/1MhGeAJ6I5PLg45XCKU5LwapZH3gC2kGm+j
         v3JMd4NTIpVLW2CQhmelxLM4iU5I1nN3Vi/jLKExUGBgOU3QWoFxph8v3uj+irnLYi4B
         SO4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=cTekW8MoQnwOt4kBq+ksLEZR/pr0SZkiiNMnfbQxOMg=;
        b=DkkodjXnJmyThz3iWOYut6o624Dv1q2gqPNT/hoIX7L5Uu8ThtFwaC07WfkmIUepo8
         rzJF/Bq7NG4MiqCrmgsAP5+UCURlo97tSGxrZekO5udIv4Wa5AKY4p+Ji5vd4BpDOwc9
         OHGgX0t8EYww+E3gvLsuMN11lzhFRqz+gJ1inJlnGBR5aen/5IS/MaAWTUF9gnmHIFi+
         0dw5l8D0bNtXxA+mYP7kyHdhkKyFz8NP88acfys61EXKqs+tHRhiYWPTgWF86IBJVwha
         bl3BAIwI4Oog2aen2NJwCm/u8sz39Ccx/b1EmLmoawTgqb2ciBpg49RBKoLK/jpXTfJD
         WOHw==
X-Gm-Message-State: AOAM533Zaq9aHmwoYTKO4/P9Tvy+NSv9QpGYSPIycGGFSDELn9wgl3as
	107mOOz25ZFyQI3Lh2Nj010PyMd4bVk=
X-Google-Smtp-Source: 
 ABdhPJzCmuABcjDL51tmL91PqGjh6oVpuM4kxOc3WT9JIHfIl5N72uMktVWX/yB6hf32Ima7K4aSdQ==
X-Received: by 2002:a5d:4e83:0:b0:1ea:99dd:d335 with SMTP id
 e3-20020a5d4e83000000b001ea99ddd335mr22336342wru.16.1646182025785;
        Tue, 01 Mar 2022 16:47:05 -0800 (PST)
Received: from CTW-01195.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id
 s12-20020a5d6a8c000000b001e32cc8adb7sm14970294wru.107.2022.03.01.16.47.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Mar 2022 16:47:05 -0800 (PST)
From: Jose Quaresma <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH v2] buildhistory.bbclass: create the buildhistory directory
 when needed
Date: Wed,  2 Mar 2022 00:45:27 +0000
Message-Id: <20220302004525.430577-1-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Mar 2022 00:47:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162587

When the BUILDHISTORY_RESET is enabled we need to move the
content from BUILDHISTORY_DIR to BUILDHISTORY_OLD_DIR but
when we start a clean build in the first run we don't have the
BUILDHISTORY_DIR so the move of files will fail.

| ERROR: Command execution failed: Traceback (most recent call last):
|  File "/xxx/poky/bitbake/lib/bb/command.py", line 110, in runAsyncCommand
|    commandmethod(self.cmds_async, self, options)
|  File "/xxx/poky/bitbake/lib/bb/command.py", line 564, in buildTargets
|    command.cooker.buildTargets(pkgs_to_build, task)
|  File "/xxx/poky/bitbake/lib/bb/cooker.py", line 1481, in buildTargets
|    bb.event.fire(bb.event.BuildStarted(buildname, ntargets), self.databuilder.mcdata[mc])
|  File "/xxx/home/builder/src/base/poky/bitbake/lib/bb/event.py", line 214, in fire
|    fire_class_handlers(event, d)
|  File "/xxx/poky/bitbake/lib/bb/event.py", line 121, in fire_class_handlers
|    execute_handler(name, handler, event, d)
|  File "/xxx/poky/bitbake/lib/bb/event.py", line 93, in execute_handler
|    ret = handler(event)
|  File "/xxx/poky/meta/classes/buildhistory.bbclass", line 919, in buildhistory_eventhandler
|    entries = [ x for x in os.listdir(rootdir) if not x.startswith('.') ]
| FileNotFoundError: [Errno 2] No such file or directory: '/xxx/buildhistory'

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 V2: remove the check to see if the directory exists

 meta/classes/buildhistory.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
index 49797a6701..8db79a4829 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -896,6 +896,7 @@ python buildhistory_eventhandler() {
                 if os.path.isdir(olddir):
                     shutil.rmtree(olddir)
                 rootdir = e.data.getVar("BUILDHISTORY_DIR")
+                bb.utils.mkdirhier(rootdir)
                 entries = [ x for x in os.listdir(rootdir) if not x.startswith('.') ]
                 bb.utils.mkdirhier(olddir)
                 for entry in entries:
-- 
2.35.1


