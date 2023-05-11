Return-Path: <max.oss.09@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8730C7EE22
	for <webhook@archiver.kernel.org>; Thu, 11 May 2023 23:22:18 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.web11.11592.1683847337756439555
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 May 2023 16:22:18 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=b1Z+obbD;
 spf=pass (domain: gmail.com, ip: 209.85.208.48, mailfrom: max.oss.09@gmail.com)
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-50bd2d7ba74so84062598a12.1
        for <openembedded-core@lists.openembedded.org>; Thu, 11 May 2023 16:22:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683847336; x=1686439336;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5BfagyR+yuzK0IAx6fqjTX4JKUP4WFb43Sd/OKuX09I=;
        b=b1Z+obbDTuXdVS+XZu4HzfXOaKNP8Jd0e0h5KWGEMG3XDzRNnDNO+G6fDY9OaVKsxU
         wZ44vgiHIB1dgKp7vLLTXZf3tgfOhfMLUIPChUnKp6TItJ0bzbvcMBxyGgkWNk4fObS9
         mU4lVHyOMcMaQOsZhNKa/g5EeD7p8NPlGe/NtsTmx0bufEELCG+F7JIQifFU55sAKztg
         RD9dbSy8OllL0eVOoFWh6f5Mjc2i44NA+l7sGUTFT0tIUxUsPwXWdOul7ehBcZNXhcdq
         uafXdftjQAKXEvnBjSO6rZUQib0U2AmBCJsFvJMydpw5cxuEx4NkFohcaaAM+CcTWvFO
         EY+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683847336; x=1686439336;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5BfagyR+yuzK0IAx6fqjTX4JKUP4WFb43Sd/OKuX09I=;
        b=kb4Z6RbBrfiBt+ZraaW+b2i/1TTaXuzm8IzFlAG6lH/I9jRQOZED2xKG6yqy0KvCjy
         lVmtGjOYp043K7tgsuRkjheUStaPGSwR5jf2FrjPqU9+0fKQfotByC+VaZIh8L28fN+Z
         K+1MzhavN6E5Ac0OAc35KtCa9Y4fEk1+MWz+l77OCief40K/PsyhLjwD2aizeJzEgHVJ
         CxvLO8zDKjkPVOLLkCf9vDg6IkqMg8hbLKM3bkJdJ/92obWtcsTcSrufHfD4zyTnYRFA
         Q9cbbzF7mFDpJMHmqQ79f2wLAw6TaLTz175AfFd4ogLGEP35uJ+qSyssOme+wU99cJms
         3YFg==
X-Gm-Message-State: AC+VfDyFf7lDp/oQ7E8b8NZRaBTmrSieh1Fg52rK5G+qhLONur+p7Ktj
	eNxcZXzZZXmUs2Gqh9yXwC7jKlb8/+0=
X-Google-Smtp-Source: ACHHUZ5rPt0yw5zCnbbCi2i0lTvTAzVx+521KvGEyqUh1BwM/qmcWF2Hdx8qg2B/HgO6OTckTR/vqA==
X-Received: by 2002:a17:907:6d22:b0:965:d7c7:24db with SMTP id sa34-20020a1709076d2200b00965d7c724dbmr20954777ejc.32.1683847336080;
        Thu, 11 May 2023 16:22:16 -0700 (PDT)
Received: from linuxdev2.toradex.int (31-10-206-125.static.upc.ch. [31.10.206.125])
        by smtp.gmail.com with ESMTPSA id n25-20020a056402061900b0050a276e7ba8sm3480162edv.36.2023.05.11.16.22.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 May 2023 16:22:15 -0700 (PDT)
From: Max Krummenacher <max.oss.09@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: bruce.ashfield@gmail.com,
	raj.khem@gmail.com,
	alexandre.belloni@bootlin.com,
	quaresma.jose@gmail.com,
	Max Krummenacher <max.krummenacher@toradex.com>
Subject: [OE-core][Patch v4 0/4] perf: add libtraceevent packageconfig
Date: Fri, 12 May 2023 01:22:10 +0200
Message-Id: <20230511232214.993328-1-max.oss.09@gmail.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 May 2023 23:22:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181167

From: Max Krummenacher <max.krummenacher@toradex.com>

With kernel 6.4-rc1 commit 6898e60f709b ("perf build: If libtraceevent
isn't present error the build") having libtraceevent is a required
dependency unless building it with 'NO_LIBTRACEEVENT=1'.

Changes in V2
- add a patch importing libtraceevent from meta-openembedded
- move the pkg-config changes in a separate commit
- default to setting the packageconfig as we now have the dependecy in core

Changes in V3
- add Bruce as the maintainer of the new recipe libtraceevent, thanks Bruce.

Changes in V4
- fix QA issue "libtraceevent-dbg contains reference to TMPDIR [buildpaths]"

Max Krummenacher (4):
  libtraceevent: import from meta-openembedded
  libtraceevent: fix qa issue with reference to TMPDIR
  perf: make pkg-config available
  perf: add libtraceevent packageconfig

 meta/conf/distro/include/maintainers.inc      |  1 +
 ...not-preserve-ownership-in-cp-command.patch | 40 +++++++++++++++++++
 .../libtraceevent/libtraceevent_1.7.2.bb      | 27 +++++++++++++
 meta/recipes-kernel/perf/perf.bb              |  5 ++-
 4 files changed, 72 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-kernel/libtraceevent/libtraceevent/0001-makefile-Do-not-preserve-ownership-in-cp-command.patch
 create mode 100644 meta/recipes-kernel/libtraceevent/libtraceevent_1.7.2.bb

-- 
2.35.3


