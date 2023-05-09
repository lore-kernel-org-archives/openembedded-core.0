Return-Path: <max.oss.09@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0BB6C7EE22
	for <webhook@archiver.kernel.org>; Tue,  9 May 2023 16:13:53 +0000 (UTC)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
 by mx.groups.io with SMTP id smtpd.web11.37300.1683648832963936303
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 May 2023 09:13:53 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=qGxSIprj;
 spf=pass (domain: gmail.com, ip: 209.85.208.44, mailfrom: max.oss.09@gmail.com)
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-50bc0ced1d9so9260658a12.0
        for <openembedded-core@lists.openembedded.org>; Tue, 09 May 2023 09:13:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683648831; x=1686240831;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LThtHrY3IiIFpM3TSsZryKdJ3bjbTwzKZgplOykDuus=;
        b=qGxSIprjanBOUrUIH96qWTrx0MPsFSzcie4PV2AXjnwXIdSFnVrooGilPlP8PEBjaw
         tl0V/510oHCjwoGqeKEfaeja8E0OUoi/ym0iCNZ4A0LFFeNd7HIfejJpovrXy5bb7dWu
         ZzmQO4/ZmOjpt7k3UMO/28fKqwRQ8rBrJsNgDCC8uZ0mxiT8MgSGnPCzSkE27jbBebhe
         isKrGVN6q262zaAneYsxVeMExGcXWCV0Fm+KEZrAqaWLBlk4Fn5Q9OQvdwb9IjyjEzkb
         OxnqUsPuuYuqw2PxJubNzFWXGUnhMkGrJoSLDvpe5SydSTJNj/thUyzt09zOTDgnmzdK
         B+RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683648831; x=1686240831;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LThtHrY3IiIFpM3TSsZryKdJ3bjbTwzKZgplOykDuus=;
        b=hU2mTU2Sq1vf4Bd1G7Yy96KfIOUIUil4Ns+LREtQKYZTvV1ODQKFm1qOG9l4YzGUZZ
         vf8N596mGoo2+O2Y0mSAOpHpfOZnAoepeOkKM+qrtd9nK0JXPaeX2LzuTmq/08TW9Zh+
         zvJbYVfCOSKeaPrq2zhMUARJhrn8LdY4AqNUmVMNr2mZYv8mPtCoCJsPdjZHpNhVQywt
         oZt//KN4ICEq1GPR22GDx0dr1rlbbPQdStwQ0Rl+wQ/f+tIxgTULe/vaTUfpQeaUb/+T
         3/lppHY6sD/CkcCddOf42GixLWuDp1iSAEiJJ+Ye5gGa9odiOCG4BCJxIICnvp9l5lfd
         Ru3Q==
X-Gm-Message-State: AC+VfDw25/j7qrAdBQ0Kf/obPL0+ik7gWkRTnX3G48FOyUlxakqN9XlG
	DFkFi6pcUxcK1mJHicA+XdViYi3NbYc=
X-Google-Smtp-Source: ACHHUZ6OWzvkP7jsOZPyUpFAQWRuGzcTUU0l1hW9ywfUtrGqEKq+xxq556zUoYXiXCCLOb0VeTLl+g==
X-Received: by 2002:a05:6402:64d:b0:504:b64d:759c with SMTP id u13-20020a056402064d00b00504b64d759cmr10212013edx.35.1683648831089;
        Tue, 09 May 2023 09:13:51 -0700 (PDT)
Received: from linuxdev2.toradex.int (31-10-206-125.static.upc.ch. [31.10.206.125])
        by smtp.gmail.com with ESMTPSA id z19-20020aa7c653000000b0050bd2f16ef5sm903997edr.84.2023.05.09.09.13.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 May 2023 09:13:50 -0700 (PDT)
From: Max Krummenacher <max.oss.09@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: bruce.ashfield@gmail.com,
	raj.khem@gmail.com,
	Max Krummenacher <max.krummenacher@toradex.com>
Subject: [OE-core][Patch v2 0/3] perf: add libtraceevent packageconfig
Date: Tue,  9 May 2023 18:13:07 +0200
Message-Id: <20230509161310.3839898-1-max.oss.09@gmail.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 May 2023 16:13:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181049

From: Max Krummenacher <max.krummenacher@toradex.com>

With kernel 6.4-rc1 commit 6898e60f709b ("perf build: If libtraceevent
isn't present error the build") having libtraceevent is a required
dependency unless building it with 'NO_LIBTRACEEVENT=1'.

Changes in V2
- add a patch importing libtraceevent from meta-openembedded
- move the pkg-config changes in a separate commit
- default to setting the packageconfig as we now have the dependecy in core

Max Krummenacher (3):
  libtraceevent: import from meta-openembedded
  perf: make pkg-config available
  perf: add libtraceevent packageconfig

 ...not-preserve-ownership-in-cp-command.patch | 40 +++++++++++++++++++
 .../libtraceevent/libtraceevent_1.7.2.bb      | 25 ++++++++++++
 meta/recipes-kernel/perf/perf.bb              |  5 ++-
 3 files changed, 69 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-kernel/libtraceevent/libtraceevent/0001-makefile-Do-not-preserve-ownership-in-cp-command.patch
 create mode 100644 meta/recipes-kernel/libtraceevent/libtraceevent_1.7.2.bb

-- 
2.35.3


