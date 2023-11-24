Return-Path: <h4nn35.work@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C903C61D97
	for <webhook@archiver.kernel.org>; Fri, 24 Nov 2023 10:34:56 +0000 (UTC)
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
 by mx.groups.io with SMTP id smtpd.web11.132989.1700822092321421407
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Nov 2023 02:34:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RLpCNCQ9;
 spf=pass (domain: gmail.com, ip: 209.85.219.179, mailfrom: h4nn35.work@gmail.com)
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-db3fa47c2f7so1550546276.0
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Nov 2023 02:34:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700822091; x=1701426891; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=0d+L9NnUNm5kZAW/doN0bxO4mFuzGtcw9aSyfl0OMvQ=;
        b=RLpCNCQ9DwV706MOwOIraYlCrFmXELiWTVDwXfGfFF/uJrCCErXZBzmV2TnEANhY3S
         aMifTjUL+uZKznVi6ImxYMjLcbHK0ydzAp72lFhAv44/nmAu0+x+fLNS56wSSwmEeipM
         V4rjK7khF/oKdI+JqIh/otOKRUSRoVloT0v63zuSbcFcWg25x4bQGwXf54CmRCme6i4d
         qBetEEhNiqUdLPlWCi+zzb3sNOnJBjs13IhVCgi9/pG4v6TPEYc4as4Q+8NAL1YJ6+1y
         q+QNtqHmTPQPXBmGZO/b9jqiuJq7RwD2fUvui8zG2cr08wxlAAsSFTURLEmsPMuedzIM
         wo2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700822091; x=1701426891;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0d+L9NnUNm5kZAW/doN0bxO4mFuzGtcw9aSyfl0OMvQ=;
        b=jGEqMMdjzzRP0wJBeAa0HI/HjkpRToDOkdPRMvb2GwLbsxXjcxz8/EDGENQkVJyuOz
         jmnOU4SnYRMfIdWSfaBDJ01HZH5Uy1JEByF/iIDojG9d83hr/eQQTV6f6eVOQVZQpagw
         c1x/qnyVHQRnp9uluRKGClw5+doK54jViWjfsmPRSCwuSCrqKnrW5J+Z9D6VQja/+gzI
         9p8GnDDQs4zFwVhxP7Cim9dvGDCKbqbE5Sk3hzJoETMfTUWiYNjnTMs7g+MsMfd6PMEG
         D+maqfeNav3Ad1PPVyuhVo3T0KU9B2GccrgHuL+/WDBatHx9AV9x4rETv1Rgj4JFRfgR
         o2Aw==
X-Gm-Message-State: AOJu0YxziRfwe3BNCpTZqOMUu/hNVZrwvOW/qE/UD9Ki0lv9zcIWom+7
	3mTEHW+gMwi06C4r2AoZ647EF7f1oJBM+Pfgh1hWv1CJNg==
X-Google-Smtp-Source: AGHT+IHCQdWpDdWjGfE/WuGBXj/mvXTeNCrpnO4/2ts/olJZZu86q+nNdXTotK3PzCCBXcRoUVmgFLwc2FEYN8pqKZM=
X-Received: by 2002:a25:9703:0:b0:da3:ab41:31f3 with SMTP id
 d3-20020a259703000000b00da3ab4131f3mr1817998ybo.8.1700822091437; Fri, 24 Nov
 2023 02:34:51 -0800 (PST)
MIME-Version: 1.0
From: Johannes Pointner <h4nn35.work@gmail.com>
Date: Fri, 24 Nov 2023 11:34:40 +0100
Message-ID: <CAHvQdo1KaZ2S1srqjvyj=R0tVroUieExEXmfBpiEBq9J1RZxDQ@mail.gmail.com>
Subject: rootfs.py generates wrong ld.so.cache in case of usrmerge distro feature
To: OE-core <openembedded-core@lists.openembedded.org>
Cc: Khem Raj <raj.khem@gmail.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Nov 2023 10:34:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191179

Hello,

I did recently my first Nanbield build which required the distro
feature usrmerge because of using systemd and as a result QtWebEngine
didn't work anymore.
I reported this to Qt(https://bugreports.qt.io/browse/QTBUG-119140),
but looking deeper into this it turned out to be an issue related to
the generated ld.so.cache in the rootfs.py.
At the moment in the ldconfig-native which is used to generate this,
are the paths to LIBDIR("/usr/lib") and SLIBDIR("/lib") hardcoded, but
that isn't correct if usrmerge is enabled, at least I think so.
The resulting ld.so.cache looks like this:
236 libs found in cache `/etc/ld.so.cache'
       libzstd.so.1 (libc6) => /lib/libzstd.so.1
       libz.so.1 (libc6) => /lib/libz.so.1
       libxtables.so.12 (libc6) => /lib/libxtables.so.12
       libxslt.so.1 (libc6) => /lib/libxslt.so.1
       libxml2.so.2 (libc6) => /lib/libxml2.so.2
...

Would it be OK to configure the paths LIBDIR SLIBDIR using base_libdir
and libdir?

Thanks,
Hannes

