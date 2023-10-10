Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B419CD80D5
	for <webhook@archiver.kernel.org>; Tue, 10 Oct 2023 13:50:19 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web10.92070.1696945811631124641
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Oct 2023 06:50:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20230601.gappssmtp.com header.s=20230601 header.b=1YEzU38c;
 spf=pass (domain: smile.fr, ip: 209.85.221.46, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3231dff4343so3432046f8f.0
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Oct 2023 06:50:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1696945809; x=1697550609; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wU+hoHEDWNctdxc1ENdXvjkUficnJ6aRFb83AEOff6Y=;
        b=1YEzU38cikkCh4GyLveViKAGQ9oXabGOu8CrFZ6WvmgQ7NShNAClH5USdweQsdksyh
         Hd+LBuaKm3HNO3VWI7o4cMVKfqdXyAgHt9ekX3RgKpElvIkQ5T0qXoDJQkF1YjfWRsjs
         iI6OKXgZrFMUnLDkKkVC4GkNaQQYwWPqFiY95wLBeVUDQtOA9XyBSninoVhL193RgL1g
         M2fdzWh1oXx9ctX+nyZ1uUB7kDHbp//Sxfby6xweHudqeh+/yjZHQ/gV3PovflA12Yis
         YfbNnINSm6eUT2ThWLibUsjgjMbdrvNCj7dUl4+/kNYfEJPPMhzdjONqYLsOwXyLYOQz
         QO+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696945809; x=1697550609;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wU+hoHEDWNctdxc1ENdXvjkUficnJ6aRFb83AEOff6Y=;
        b=KiiwHR1Grwd6yk3/ySbmKtnICFDC+V+7DOILWgf6VfyfuEl2BztDKl8XBE9mtj4v4M
         dGJ2MCiAoi2HC50yX4V87kpD0z1VR9szLdVCuSaUEDYIC1Qys3u3unqCmWh+gu7uLuSr
         3V9gAsj25sXc6Ct7zm1GtD9AaOXRAJkZZsF1vZCAUrk/ftvP+Z04jaEL57IlqLM8wUdJ
         t0iM/aqvLvYvJjQK9I0QXzCeFrNUDw/9mmamt9s+h52QNH7m+xpJJSXM+Ob+C3EwhDOA
         mvr93O9knVyhgy6QSCQJeCf9FooGlV3rKf9vZLhiX6/HWcr41g8UAhqhYH5/PHvP5CCM
         DAIA==
X-Gm-Message-State: AOJu0Yz18W/jY8YNqShRqvuzXEpfl/geO1xGFtzvGmvPCYauf9oM6yzW
	+B4SR3gCJd2diUVwXeLX0o9dg/5rYPXKoKsmoHw=
X-Google-Smtp-Source: AGHT+IEsuAUmysRyvg4zYTFOM/W3d5NNRKKZ3P+LyyvWxvwwmb0svSqz+CSlocXma0eXCxKdHM9vwQ==
X-Received: by 2002:a5d:595d:0:b0:31a:cca0:2f3a with SMTP id e29-20020a5d595d000000b0031acca02f3amr12786545wri.0.1696945809437;
        Tue, 10 Oct 2023 06:50:09 -0700 (PDT)
Received: from P-ASN-ECS-830T8C3.numericable.fr ([89.159.1.53])
        by smtp.gmail.com with ESMTPSA id c14-20020adfed8e000000b00317b0155502sm12716070wro.8.2023.10.10.06.50.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Oct 2023 06:50:08 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>
Subject: [PATCH v3 0/4] insane: Add unimplemented-ptest checks
Date: Tue, 10 Oct 2023 15:49:27 +0200
Message-Id: <20231010134931.3994720-1-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Oct 2023 13:50:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188892

To increase ptest coverage we can check if the sources of a recipe looks like
it contains unittest and warn the user that a test may be implemented there.

This series provide the check infrastructure as a package QA check and some checks for :
python pytest, perl Test::, meson, cmake, autotools-based tests... as well as
the naive check of "Is there a test/ directory in the sources?" which work
surprisingly well.

Currently, this check find:
* 865 unimplemented ptest in meta-openembedded
* 315 unimplemented ptest in oe-core/meta-poky/meta-yocto-bsp

Full lists: https://gist.github.com/ycongal-smile/ff164a1393ac9a0bf1a25f5b91505a00

v2->v3:
* Fixed a typo in CMake handling that caused the detection to fail
* Removed the detection of native, cross, crosssdk and canadian. These caused
  oe-selftest to fail by accessing OVERRIDES too early and breaking checksums.
  Tests were already disabled on the .bbclass side by doing it this way, tests
  can be reenabled on a per-recipe basis.

v1->v2:
* Corrected: shortlog tag
* Fixed infinit loop on source package containing symlink loops (e.g. md5deep)
* Added test result

Jérémy Rosen (4):
  insane: Add unimplemented-ptest infrastructure
  insane: Detect python and perl based tests
  insane: Detect build-system test harnesses
  insane: Add a naive heuristic to detect test subdirectories

 meta/classes-global/insane.bbclass | 47 ++++++++++++++++++++++++++++++
 1 file changed, 47 insertions(+)

-- 
2.30.2


