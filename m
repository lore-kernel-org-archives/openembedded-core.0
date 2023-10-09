Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40F01E95A8E
	for <webhook@archiver.kernel.org>; Mon,  9 Oct 2023 08:43:48 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web10.57013.1696841026292751985
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Oct 2023 01:43:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SsBvaaxE;
 spf=pass (domain: gmail.com, ip: 209.85.221.48, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-323ef9a8b59so4065332f8f.3
        for <openembedded-core@lists.openembedded.org>; Mon, 09 Oct 2023 01:43:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696841024; x=1697445824; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sZzURQ7loM3TAOAVEyHEf9Zc7u9ggpc3Zdo7K2A3aLM=;
        b=SsBvaaxEqo81Mw/jztXGfHLYgwqnafZsyyUdWyugHvw0LM1C+AYNLJRifk46qv9JNU
         rOTnzhoaA+RpKsHXNmlrKcIwbdH1tAEpf08l5VdRtArEjjsYQaxQj4yzz8c39xIF3zqM
         MgtT6Ve89xG5X0Fs8im1oW0kcIROlVUDhmLQJPYBGxiFottyjEr2yGfETfYBPk6N979k
         joGTi1F/D6NF/v1lfICLFq8MEPTxjHSyqleVkDtZXKluKI8kuV80ouXiO9KKdK0HAGSh
         kV4jceE6GfKaloVweZXms7s9h4yzoUnx06d8kg9JOp9qAiN96STWUE4nkSOfkwkW8d4A
         /ICA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696841024; x=1697445824;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sZzURQ7loM3TAOAVEyHEf9Zc7u9ggpc3Zdo7K2A3aLM=;
        b=jJyyhf5smVDZ+2s9rl+zz8JLZEMoQpjvGPyth1763MNd/fowFAaM+M8sQl4196U9qv
         +CzZDj2hX/hYxodKUCR+Idgb4G0Em+CXtQi/sr6OlwZNTeoXTN76C48sVy3JaWBQ4Cug
         Y/qt2W1Yjl3Jw1/x064n5vUQ6omS/dOR2xt8PrtzuEZyuv5t2KrK93F9K7UGIcnAS+RA
         j9G6dn22qb4eWxLAkt2BjuyBVYo4geAEQOLHWKWn4Iy2V32q+6leQgrNGIpf9WxXl4Qw
         opON+2xyft6Nb5KvhGN2bDfnhl4ZM0+jccUklcETbhcgWcnPqp8EeJhseFlhdwHdY8go
         LBjg==
X-Gm-Message-State: AOJu0YzVIxjFN8EtaPk0ElNeXlL+m1BskkCJw6NzRwkuFBzGhI4gTS7i
	N7w1LghtTfjp5MEFBta8c/m1FvELhj4=
X-Google-Smtp-Source: AGHT+IEhlvHLhzfuJbG8IRv8V+QwtLhqp4jJ6ZdbNd3lzPXUkNtg6BVjydQu01EL8HldrBZZzF1Q9g==
X-Received: by 2002:a5d:4f88:0:b0:319:775f:d553 with SMTP id d8-20020a5d4f88000000b00319775fd553mr12042937wru.9.1696841024050;
        Mon, 09 Oct 2023 01:43:44 -0700 (PDT)
Received: from og-worker-dev-01.infra.foundries.net ([2001:bc8:6005:6:8218:44ff:fef2:ade0])
        by smtp.gmail.com with ESMTPSA id k8-20020a5d5188000000b003247f732c11sm8986177wrv.76.2023.10.09.01.43.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Oct 2023 01:43:43 -0700 (PDT)
From: Jose Quaresma <quaresma.jose@gmail.com>
X-Google-Original-From: Jose Quaresma <jose.quaresma@foundries.io>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <jose.quaresma@foundries.io>
Subject: [OE-core][PATCH v2] sstatesig: be more precise and show the full path in exceptions
Date: Mon,  9 Oct 2023 08:40:51 +0000
Message-Id: <20231009084050.639451-1-jose.quaresma@foundries.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Oct 2023 08:43:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188830

Also remove the warning than doesn't make sense as the code will generate
an exception and bitbake will abort.

Before:
| WARNING: core-image-minimal-initramfs-1.0-r0 do_image_complete: KeyError in .
| Exception: Exception: KeyError: 'getpwuid(): uid not found: xxxxx'
| Path . is owned by uid xxxxx, gid yyy, which doesn't match any user/group on target. This may be due to host contamination.

After:
| Exception: Exception: KeyError: 'getpwuid(): uid not found: xxxxx'
| Path /build/tmp/work/intel_corei7_64-lmp-linux/core-image-minimal-initramfs/1.0-r0/sstate-build-image_complete is owned by uid xxxxx, gid yyy, which doesn't match any user/group on target. This may be due to host contamination.

Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
---

 v2: drop [OE-core][PATCH 2/2] sstatesig: do_image_complete needs to run with pseudo disbale

 meta/lib/oe/sstatesig.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oe/sstatesig.py b/meta/lib/oe/sstatesig.py
index 633a0fd450..e5026e9836 100644
--- a/meta/lib/oe/sstatesig.py
+++ b/meta/lib/oe/sstatesig.py
@@ -582,9 +582,9 @@ def OEOuthashBasic(path, sigfile, task, d):
                         update_hash(" %10s" % pwd.getpwuid(s.st_uid).pw_name)
                         update_hash(" %10s" % grp.getgrgid(s.st_gid).gr_name)
                     except KeyError as e:
-                        bb.warn("KeyError in %s" % path)
                         msg = ("KeyError: %s\nPath %s is owned by uid %d, gid %d, which doesn't match "
-                            "any user/group on target. This may be due to host contamination." % (e, path, s.st_uid, s.st_gid))
+                            "any user/group on target. This may be due to host contamination." %
+                            (e, os.path.abspath(path), s.st_uid, s.st_gid))
                         raise Exception(msg).with_traceback(e.__traceback__)
 
                 if include_timestamps:
-- 
2.34.1


