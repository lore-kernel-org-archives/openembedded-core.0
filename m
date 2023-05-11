Return-Path: <max.oss.09@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0ABD8C77B7C
	for <webhook@archiver.kernel.org>; Thu, 11 May 2023 12:58:16 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web11.58072.1683809888478442032
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 May 2023 05:58:08 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=r75yBQ4J;
 spf=pass (domain: gmail.com, ip: 209.85.218.45, mailfrom: max.oss.09@gmail.com)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-96a5903758fso177178166b.1
        for <openembedded-core@lists.openembedded.org>; Thu, 11 May 2023 05:58:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683809886; x=1686401886;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=j+GvMHaOZc0J9KuR4mscihCxYBmWWPAT/f5+5xxFwZ8=;
        b=r75yBQ4JpdE8O/kbx/h2ShozCzUL14aqQTsXhfHWuG9xBPPy6If3eA/5st2lQEkbhl
         hqq8B6j5koGtL0XNbJj3BiIuJb+lPVulptpnPt1n/PBiFmqhModYocISStTIzfd8ZPwQ
         +fxaz/J1rYpYTUdZC46TPRcgE1KTnYgPEJeiG9l6tpSlEWcNljIW4v7mjyqKXLVxD54C
         x8FiFc84Nv9zJEC+MF989K3WQNQMNMX3i11JxcRNmPG4mtoHWpeCvrdFi8FvidrUMn1V
         qZAyMpEAwRdqsWjKh7eMCSCC3/dgvrC6+isLbSpbGIuAtgVkWHS8hCWNWd/HXiEWWpr/
         krNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683809886; x=1686401886;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j+GvMHaOZc0J9KuR4mscihCxYBmWWPAT/f5+5xxFwZ8=;
        b=FxLwJHm7TuvMl5QszKOxKxgLP9MPx7g1PWUiUI4zP80hpdHSIHKdonaBs4JMm1Aq58
         TzKia/DbrcauSfkkJfkT/xY/uro3XW+QPyKAv9M8uAJqFVCUE+tn1HknAGzsDzDC2fb5
         /64w9xJHsWjKs/2Q+ElGL3kgnNpBACQfYRXUOxnO8JwyGGbe+LvdFFci0/wmnpfO4z68
         0MI4/ZaAEBvDRhyOh++4EHHaXGBSSSof81VAoFqXjr1c5InwSVqhIx6nPZqGTZbJg27U
         DPZku3yOuxYpA+W88UDUY4toXwF5096DPUL10zeqxDLRQg00Klj48VA8jeACCCrChqig
         pH7Q==
X-Gm-Message-State: AC+VfDwuzhoIs0UHNb4wwJ0er5OBmXk4ILourMnHXB4IbJYmWw5DwcK6
	IXXKjSpE9MaVy65awhf3v56cTBkh3WY=
X-Google-Smtp-Source: ACHHUZ57Oj32niOBMF9LcOqK9x63Fmtqn2mJW5h+Joxjkt5pruJYJktGMIhW9Ywq7FVaAtf0nbwVYw==
X-Received: by 2002:a17:907:1b12:b0:961:b0:3dfc with SMTP id mp18-20020a1709071b1200b0096100b03dfcmr20260328ejc.8.1683809886590;
        Thu, 11 May 2023 05:58:06 -0700 (PDT)
Received: from linuxdev2.toradex.int (31-10-206-125.static.upc.ch. [31.10.206.125])
        by smtp.gmail.com with ESMTPSA id f7-20020a170906494700b00965bf86c00asm4047223ejt.143.2023.05.11.05.58.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 May 2023 05:58:06 -0700 (PDT)
From: Max Krummenacher <max.oss.09@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: bruce.ashfield@gmail.com,
	raj.khem@gmail.com,
	quaresma.jose@gmail.com,
	Max Krummenacher <max.krummenacher@toradex.com>
Subject: [OE-core][Patch v3 0/3] perf: add libtraceevent packageconfig
Date: Thu, 11 May 2023 14:56:00 +0200
Message-Id: <20230511125603.958144-1-max.oss.09@gmail.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 May 2023 12:58:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181132

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

Max Krummenacher (3):
  libtraceevent: import from meta-openembedded
  perf: make pkg-config available
  perf: add libtraceevent packageconfig

 meta/conf/distro/include/maintainers.inc      |  1 +
 ...not-preserve-ownership-in-cp-command.patch | 40 +++++++++++++++++++
 .../libtraceevent/libtraceevent_1.7.2.bb      | 25 ++++++++++++
 meta/recipes-kernel/perf/perf.bb              |  5 ++-
 4 files changed, 70 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-kernel/libtraceevent/libtraceevent/0001-makefile-Do-not-preserve-ownership-in-cp-command.patch
 create mode 100644 meta/recipes-kernel/libtraceevent/libtraceevent_1.7.2.bb

-- 
2.35.3


