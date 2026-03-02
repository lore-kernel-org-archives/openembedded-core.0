Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF878D58E51
	for <webhook@archiver.kernel.org>; Mon,  2 Mar 2026 04:55:41 +0000 (UTC)
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.153560.1772427341068145443
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Mar 2026 20:55:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=P4OuGosX;
 spf=pass (domain: gmail.com, ip: 209.85.219.53, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-899d6b7b073so32894726d6.2
        for <openembedded-core@lists.openembedded.org>; Sun, 01 Mar 2026 20:55:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772427340; x=1773032140; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tjyulk5xYg9kCAUwnXpLMKP319fbemT4yazQi+P/wY8=;
        b=P4OuGosXcenoOwM9rKJNKavxOE7LNCku/Hkhi/OkQdXQy5YU8vROyvjRp3WR61O09P
         0Ms2p+AMQ7GjUcsgKkYTL4JaWJRm1ersT6MGtxxkWYBBB/o1P2JNiUDfjVimNzPnzWvA
         2lV1iJCXALNfPLovSei4f91Af4HQvlaJWJkjZ22OKdMB1NWFthIeyjH+63R8vZ4Fk+CH
         3HD454kASumofJ1KeDiX8+cryk+UyyiFJeVv0J5qWLepTbiegtXASAboEABWYzmroUHp
         yv3SS6LYnudMNnyJOyAwFlgisz8hOXi85QknwlHAVLtZHRJYq4hZzfFGKj6QcPrWntaN
         Iavw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772427340; x=1773032140;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tjyulk5xYg9kCAUwnXpLMKP319fbemT4yazQi+P/wY8=;
        b=sJbZlpq/w6GeDGrnnJB1XnnEEM5UkmT8qBZGrn5zKjIjmhpZBBstHhqgEA4hcorg7S
         sZgOoKYEg7IC9m2g8GtH6pX2nlmljj4L7MOFqyxYajP++WR5ZlCpw+kOxQe/X8zPrqyC
         JY0mnFbTZJIblKsbM0fMoDpzpi50c2gPGygSt/jro8Xuwa78j0kP/u11FInVE5+deT71
         CqKz0H5puwjbStZGhWn+4ZeVRAU79/0ONQB/ViRJZQI0WfSsc4STjJvtsMneb0np5Fb+
         PSFt1or0/Ne+pv97c7y06lj90oq+ckON7qHqe+ATYnQQa7jGaUlP/Kdp+RUA0uxGmKEW
         znkw==
X-Gm-Message-State: AOJu0YzNPD2U8hPGzmwgi/5aC7YalZl7SFjjj+lZ0+Hyh4XPDdAC9eC4
	L6yRkky7AshF1qATG7+MKmkCTPw1FZeNXI+emjHpgDtU6Fr33Lr5WviA
X-Gm-Gg: ATEYQzzBQkue91FdekwRUR2OOVXtu0u7+Y/cyLzAQ0Utb40sMX/xubxdN/b03ZN4cdV
	fBfMvoKw0pWhkKjIGVhMkLBaMObAA6rzjtj2ZKJd+lBfToht1PDHYgcuHMzJApUpULTt8t64ktz
	W+gshReISSB0qmWyT1als/oa3XI4RMip47XD5c9gK/E9R+Z1gZb8+UOQPuI4nv3ZdwFU5B8fAM+
	Frdn/ST7mpOnFwSvmTv3j78q+MJw7FFRSx5+jaxJxKpXot5eAiag1jotN48685ioNNVuaC/laDh
	rlW7zyp0xc+HoBub0VP/+sVIx6o/IR+9GWR7iLbki/WIUjj1WeyFK3zgBqIJatJiIroXzekAx6P
	4yGu5irz8bebkFEv6gURrAKwGsCKjjcEsjmMjHKUDQgu+EnjvHwNPml8IT47KGX2ov+PEutmU+C
	i2r0bSmXt8oT4i4OgbPhiclKTt4yGfnUP0au40xxFwjKdQXvg4KghqwsPendIkhR65a6q4GS0Mw
	JN6WPk8KyNWFGoUmRmdQu6xLbwdzVt3YmrpY1+nIxt2cfNAHFlC6b1XfKbZs+xV505RaQ==
X-Received: by 2002:a05:6214:27eb:b0:895:6790:bd18 with SMTP id 6a1803df08f44-899d1e6b25cmr155286516d6.56.1772427340031;
        Sun, 01 Mar 2026 20:55:40 -0800 (PST)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89a017add76sm2488406d6.36.2026.03.01.20.55.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Mar 2026 20:55:39 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/10] linux-yocto: consolidated / combined pull request
Date: Sun,  1 Mar 2026 23:55:26 -0500
Message-ID: <20260302045537.2153587-1-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 Mar 2026 04:55:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232160

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Richard,

Here's the next set of -stable update for 6.18.

7.0 will be the dev kernel shortly, just waiting for -rc2 on it
before pushing the changes.

Also note that this is again a combined oe-core, yocto-bsp pull
request. I've keep the numbering 0-N to hopefully lore/b4 won't
miss things.

If this doesn't work (the formatting), I'll just go to different
sends for the different repos.

Bruce

openembedded-core (7):
  linux-yocto/6.18: update to v6.18.9
  linux-yocto/6.18: update CVE exclusions (6.18.9)
  linux-yocto/6.18: update to v6.18.11
  linux-yocto/6.18: update CVE exclusions (6.18.11)
  linux-yocto/6.16: genericarm64: feature splits and enablement
  linux-yocto/6.18: update to v6.18.13
  linux-yocto/6.18: update CVE exclusions (6.18.13)

meta-yocto (3):
  yocto-bsp: update to v6.18.9
  yocto-bsp: update to v6.18.11
  yocto-bsp: update to v6.18.13

 openembedded-core:
 meta/recipes-kernel/linux/cve-exclusion_6.18.inc   | 306 ++++++++++++++++++++-
 meta/recipes-kernel/linux/linux-yocto-rt_6.18.bb   |   6 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_6.18.bb |   6 +-
 meta/recipes-kernel/linux/linux-yocto_6.18.bb      |  24 +-
 4 files changed, 313 insertions(+), 29 deletions(-)

 meta-yocto:
 meta-yocto-bsp/recipes-kernel/linux/linux-yocto_6.18.bbappend | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
2.43.0

