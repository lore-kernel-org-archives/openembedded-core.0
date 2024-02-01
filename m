Return-Path: <nick.owens@eero.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2268C48286
	for <webhook@archiver.kernel.org>; Thu,  1 Feb 2024 21:09:43 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web11.7327.1706821779549449582
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Feb 2024 13:09:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@eero.com header.s=google header.b=pukg9Wey;
 spf=pass (domain: eero.com, ip: 209.85.210.179, mailfrom: nick.owens@eero.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-6da6b0eb2d4so1103835b3a.1
        for <openembedded-core@lists.openembedded.org>; Thu, 01 Feb 2024 13:09:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=eero.com; s=google; t=1706821778; x=1707426578; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=V0Vo/bi9blwS79j9S1O+dRP653zFok2t/vZBXe8aII0=;
        b=pukg9Wey9Y9BE7swpJieVp2x68GpU5oCmvHGuBd7e1XOhnvkF/ai63yEM2xxBwGIsN
         NIf0tEgFQKZEFDApfqiXkLy8FyTEtRE0nBWWFjDxYLehfafCX22Vmph1yQa7NHAuu/ZZ
         Vlvv1z5q7dBDcfBrXlKbIJjjKqUIDQIgi3WcU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706821778; x=1707426578;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V0Vo/bi9blwS79j9S1O+dRP653zFok2t/vZBXe8aII0=;
        b=GvMSnxpd3rKBiV+tvPtfqi/gylKxVGwCNyU1mOMtiepM2hyRKmuQHxOiG1pjo/6Odv
         xHDOBqjBBxebpZMouZqadycoOQGlKDnykOmH0Ruc28zrjCqZm9BBCsTj8q2aNJhan18X
         +3N454SaRUg9IlxeI7GlPFf4cL6RF1ijMXdIwE3ElfAiyYkjH/WR8URIWsOKzkU3YTnX
         77u/5k8PfyZEwnqPXSNmAN/vIRWpb1Wa9FJrfN3t+Cn55/Gb2ykxaRd+WxmIPoRFgqKZ
         THWqyCvcb7Jsdz9qdz2W6VK0jorTtca9ylhP12Tv1kmrALuSV5sWizZGHtDXHXv/LSiy
         vd+Q==
X-Gm-Message-State: AOJu0Yz/SBY/S+NjDHELO2mkkR5LPMoNVk+j347pHzFxi/jXGhbKRVj7
	5kUsHLyNsJ60noC6TDC573nn5VFRSsvp3g1t+BKvCgx9u7oKPhHdDetpZuRbkC2gkkx4Zc/o2uO
	N
X-Google-Smtp-Source: AGHT+IHhFm9JQYG3aI+s3L8rODFau5IiOIZDcHtXsK/5QFQaPoA1dsUMK9bPOBPQQ4nkda13Dkk5pA==
X-Received: by 2002:a05:6a20:6f91:b0:19e:40e0:76d6 with SMTP id gv17-20020a056a206f9100b0019e40e076d6mr3246453pzb.53.1706821778524;
        Thu, 01 Feb 2024 13:09:38 -0800 (PST)
Received: from ubc8fb08c436a5b.ant.amazon.com ([12.76.39.42])
        by smtp.gmail.com with ESMTPSA id z123-20020a633381000000b005d3bae243bbsm292323pgz.4.2024.02.01.13.09.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Feb 2024 13:09:38 -0800 (PST)
From: Nick Owens <nick.owens@eero.com>
To: openembedded-core@lists.openembedded.org
Cc: Nick Owens <nick.owens@eero.com>
Subject: [OE-core][PATCH] systemd: recommend libelf, libdw for elfutils flag
Date: Thu,  1 Feb 2024 13:09:15 -0800
Message-Id: <20240201210915.1326623-1-nick.owens@eero.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Feb 2024 21:09:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194753

when elfutils is enabled, the elf reading code of systemd will dlopen
libelf and libdw. these dependencies are not automatically detected and
will not work at runtime without them installed. add them to RRECOMMENDS
when elfutils is turned on in PACKAGECONFIG.

fixes https://bugzilla.yoctoproject.org/show_bug.cgi?id=15379

Signed-off-by: Nick Owens <nick.owens@eero.com>
---
 meta/recipes-core/systemd/systemd_255.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd_255.1.bb b/meta/recipes-core/systemd/systemd_255.1.bb
index c0de44090d..9e09c89355 100644
--- a/meta/recipes-core/systemd/systemd_255.1.bb
+++ b/meta/recipes-core/systemd/systemd_255.1.bb
@@ -146,7 +146,7 @@ PACKAGECONFIG[default-compression-xz] = "-Dxz=true -Ddefault-compression=xz,,xz"
 PACKAGECONFIG[default-compression-zstd] = "-Dzstd=true -Ddefault-compression=zstd,,zstd"
 PACKAGECONFIG[dbus] = "-Ddbus=true,-Ddbus=false,dbus"
 PACKAGECONFIG[efi] = "-Defi=true -Dbootloader=true,-Defi=false -Dbootloader=false,python3-pyelftools-native"
-PACKAGECONFIG[elfutils] = "-Delfutils=true,-Delfutils=false,elfutils"
+PACKAGECONFIG[elfutils] = "-Delfutils=true,-Delfutils=false,elfutils,,libelf libdw"
 PACKAGECONFIG[firstboot] = "-Dfirstboot=true,-Dfirstboot=false"
 PACKAGECONFIG[repart] = "-Drepart=true,-Drepart=false"
 PACKAGECONFIG[homed] = "-Dhomed=true,-Dhomed=false"
-- 
2.34.1


