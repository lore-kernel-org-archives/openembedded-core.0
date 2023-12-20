Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4282C3DA6E
	for <webhook@archiver.kernel.org>; Wed, 20 Dec 2023 18:01:22 +0000 (UTC)
Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
 by mx.groups.io with SMTP id smtpd.web11.28011.1703095281627679942
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Dec 2023 10:01:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Fs/TqeUH;
 spf=pass (domain: gmail.com, ip: 209.85.160.54, mailfrom: jpewhacker@gmail.com)
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-2041e117abaso193377fac.0
        for <openembedded-core@lists.openembedded.org>; Wed, 20 Dec 2023 10:01:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703095280; x=1703700080; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GgtO0EYm/sLhMJyHo7AuUwU7yu72EukAYOF7jvqSWKk=;
        b=Fs/TqeUHq7P9//dHOH32veg209pTCMz1SFkFikpf2Aye0QamWsqJ0nkSztrKow642W
         jxmpDyJEwRViZekf3/A2NWs2tWFtfhHF4dxztUw4Z3VQ0FB2MMTw3jvxfeGCAEqJnzhz
         Y/zmyq/tyIynnSoSccAaeWRnfxLrkfPYnC97uZdDyiNlOVx+pesSk2cWHI/bjwET8R1S
         A1GWggEl5kMbud+wj5W5GgCWu/yOr7Ejkesun6a2tnnyva6EEsCqNluUPHjN2kjPOdel
         In3dbBtw7skQZm4g83EfZKcwAk0SH0EQkx2UzSyge42tLVJBc+OlIS6YXxPvPAs2J847
         Pj6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703095280; x=1703700080;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GgtO0EYm/sLhMJyHo7AuUwU7yu72EukAYOF7jvqSWKk=;
        b=mfa7eT0dqT0LzyJVA9uLCxmA3nhLhkr6wrfhZSDvA6NEYAaqgEHsmgBsSafPlsUcZu
         bd/z8fT/gR0lv6GMVaKoxh4EOy1ijyvi7iNjVRdFXeO8rZkebsm9guwlAWhquwLHGvtk
         0xrLeK+R7r5NU9KhV4t9vgdBiwxjDP1zoD47qcEO/u8L5TNnCoDbHRj6/cJGlI1399dq
         1VyfDLwJKBPjpDZVBBeS71ylLtM0tm/XPx6M/8Ays/6WTDWtOYPrq7qcyWqG6QBiGmBT
         g90EAxHWqUNbL5msGa7qT90ktSjyJIUjg5QtPagZdUwuxaKcRfa17qAjYCa4TUnCulZ/
         LTQg==
X-Gm-Message-State: AOJu0YwumA6/4417meF6sD74mpsgIJB2bkzpsLn6IUg9q3nWLrc6VaX+
	vDbQ7/Hr+JGADJFfrNTDB2ceU0EoQzg=
X-Google-Smtp-Source: AGHT+IFm3dPfl/kKELZkhwiYoCT7CKCKrJU73QwVsUv4NT9CVEUaom/R1YZgDV5IB7PEcTRtlgbwbg==
X-Received: by 2002:a05:6870:3926:b0:1fb:45d:4cf5 with SMTP id b38-20020a056870392600b001fb045d4cf5mr96199oap.12.1703095279728;
        Wed, 20 Dec 2023 10:01:19 -0800 (PST)
Received: from localhost.localdomain ([2601:282:4300:19e0::d6e0])
        by smtp.gmail.com with ESMTPSA id de7-20020a05687075c700b00203af6ff47esm39160oab.42.2023.12.20.10.01.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Dec 2023 10:01:18 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH 1/2] lib/oe/path.py: Add relsymlink()
Date: Wed, 20 Dec 2023 11:01:01 -0700
Message-Id: <20231220180102.3501941-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Dec 2023 18:01:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192805

Adds API to make a relative symbolic link between two directories. The
arguments are the same as oe.path.symlink()

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/lib/oe/path.py | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/lib/oe/path.py b/meta/lib/oe/path.py
index e2f1913a35c..5d21cdcbdff 100644
--- a/meta/lib/oe/path.py
+++ b/meta/lib/oe/path.py
@@ -172,6 +172,9 @@ def symlink(source, destination, force=False):
         if e.errno != errno.EEXIST or os.readlink(destination) != source:
             raise
 
+def relsymlink(target, name, force=False):
+    symlink(os.path.relpath(target, os.path.dirname(name)), name, force=force)
+
 def find(dir, **walkoptions):
     """ Given a directory, recurses into that directory,
     returning all files as absolute paths. """
-- 
2.34.1


