Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B343C433F5
	for <webhook@archiver.kernel.org>; Mon, 28 Feb 2022 16:06:11 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web10.21380.1646064370327356615
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Feb 2022 08:06:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=J2ZoJzvz;
 spf=pass (domain: gmail.com, ip: 209.85.128.47,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id
 bg16-20020a05600c3c9000b00380f6f473b0so6035012wmb.1
        for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Feb 2022 08:06:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=r07HoHKA0wrPT0T7oUMJwIqDo3L3vrS93xVozrmfJmY=;
        b=J2ZoJzvz6dYeR7eCAyS0SKv5R0UxlcyLapXKiAICTsyiA5B2EWb6QWMLHyYLgVHZB0
         OXmtHcVs0VTPW+dttTuKehYNkrMWvhORnqbH1Ga3oazV8NKcD21lxxyKR7xCEAU6oihw
         AMwEq8wRJCQTnrZXFH1lQuiLOlmZmg+dO3hxeff/xxY+4BDsWwi97Rc+sLqO8itJi0Fs
         RMdgVQbOXTFK7QpDIyD2ZZQsiwZyenxlmH8GsT2py9PN0RYNGe2HubZxSIIl8SszxJns
         H3ngoE5v5J3dyUVGvalfZDyhqlNTXwHa66mcHrv8lwn8dnmr1gakld/PSVP8aLpRVem/
         9l9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=r07HoHKA0wrPT0T7oUMJwIqDo3L3vrS93xVozrmfJmY=;
        b=u9iAddASt8fVXbb5qYIT9pneGC7PhPs3Op3oWU4uPNWwfG0UhbuvLRFtXSPyRNVJnS
         itrMAeu4OwlNA2x4NwnHlzsBc/zA4KqpVx+q93KQRzr8yYbcwvFgxS5nSL1y7RRELq/l
         xPudF8VD+czlFaUw/oxf3p1q6oNH5zutT5ACWFgrbSLcTrjnj6DtTCPlGqP/GZzb7sNK
         B/SIeSv3j9uaEsDhRPSF/osRcEFf3nn20pebnnWSqMMsSYjX86VBks9ZlKv0Ew1uuZSu
         rTg3+Xgu0cG958FDj5nGUV3aYy8EzvtMMFUnMTI4ioVN4LrnHJkiLUGYiGgGOE26l46k
         NA9w==
X-Gm-Message-State: AOAM531rztbkq5D3LvQRovVSgKP/XAh/uP1DcNVoNaem1WvSuLsRPADF
	T7W95wfoIEnaAmFpZhpuim7VMpwWriE=
X-Google-Smtp-Source: 
 ABdhPJwn3gHMPIc0Mbhy0eYeyM8CDi6Kg0shleU2bSF8ZJRSl6ijPfJNyQC70DZ8nvh1ATLTh39ELw==
X-Received: by 2002:a05:600c:4107:b0:381:1c3:5d3 with SMTP id
 j7-20020a05600c410700b0038101c305d3mr13668544wmi.107.1646064368438;
        Mon, 28 Feb 2022 08:06:08 -0800 (PST)
Received: from CTW-01195.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id
 o22-20020a05600c4fd600b0038133076dcesm12654932wmq.16.2022.02.28.08.06.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Feb 2022 08:06:07 -0800 (PST)
From: Jose Quaresma <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH] buildhistory.bbclass: create the buildhistory directory when
 needed
Date: Mon, 28 Feb 2022 16:06:00 +0000
Message-Id: <20220228160600.42164-1-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Feb 2022 16:06:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162508

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
 meta/classes/buildhistory.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
index 49797a6701..d416512f6d 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -896,6 +896,8 @@ python buildhistory_eventhandler() {
                 if os.path.isdir(olddir):
                     shutil.rmtree(olddir)
                 rootdir = e.data.getVar("BUILDHISTORY_DIR")
+                if not os.path.exists(rootdir):
+                    bb.utils.mkdirhier(rootdir)
                 entries = [ x for x in os.listdir(rootdir) if not x.startswith('.') ]
                 bb.utils.mkdirhier(olddir)
                 for entry in entries:
-- 
2.35.1


