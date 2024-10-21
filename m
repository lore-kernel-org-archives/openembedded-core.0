Return-Path: <badganchipv@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3061CD0E6D5
	for <webhook@archiver.kernel.org>; Mon, 21 Oct 2024 09:13:37 +0000 (UTC)
Received: from mail-il1-f176.google.com (mail-il1-f176.google.com [209.85.166.176])
 by mx.groups.io with SMTP id smtpd.web11.41900.1729502016042570251
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Oct 2024 02:13:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hCd07/rc;
 spf=pass (domain: gmail.com, ip: 209.85.166.176, mailfrom: badganchipv@gmail.com)
Received: by mail-il1-f176.google.com with SMTP id e9e14a558f8ab-3a3aeb19ea2so15122935ab.0
        for <openembedded-core@lists.openembedded.org>; Mon, 21 Oct 2024 02:13:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729502015; x=1730106815; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=b6qY2aa8CMrtJcNNC6gkVSPRf2hmZLSi2nS+neAGT68=;
        b=hCd07/rccLjsRtC+qacjs6rfvZUWKVihSQGmQYzhsQ8KlKropS9bwrrn/at2mksF3W
         D//s1lEaATEKFKN+cthWhNGVEQDB4sCoEsw1rFzP7+XE0NCgjnVFie+QNQf3+PwaRT0A
         aQ+9sKhxCGLThR/dVzN+dU2/8mE0eqereuvsj1RgiEbEaoTg2lgT+vFmeN+iK0XxJRDe
         ch4QNeela7TQUtc6nuxYLTsTeqhrTqOoMgWOGS5lw72pbu5jME//tUi1gjYUdfM/59wD
         OiRcOStNwdGevjAZHBPFfDWLczZnDvzS7ZPoJ+MT7rTLYmc5+kc5Ov80PnjxpGDK7S2s
         fcDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729502015; x=1730106815;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b6qY2aa8CMrtJcNNC6gkVSPRf2hmZLSi2nS+neAGT68=;
        b=ajdOiU7hr5Z1wuUDVShYbIkg2fwAr5RAlWzWawGMKe2VuwblphjQp0c4fnLEK7AVm8
         po3MjjFZA8pmYisE9/xDvpkY7As0xBX/d8PgksFf+wC9mBM4V7scHn43XcFQMwYLChH0
         ty6JqKKYkUZfF9p7+M4xcf4i2qyo3+Zi1qfIrPoaNwTOjdNFQBEdOkXR1lJdWAXi1bwg
         Lt/df5EO+5CHacXaJ9PEaUZdk5ehclFZXIBvzZY7cnNLO+Vlan/DyPwNbwA1EYhjebYN
         DLUckPfemTOM443/VdJvuJSZsDYIvMWALhkTbdV75Zz9h6O5e28cJieLmGv0X1eCEwcU
         C9Hg==
X-Gm-Message-State: AOJu0YznLzEGqdILbyZktIG2K1iESHRiDQW3JR6X9tb80YsOUD4mwRtt
	eOL7klSejp+gEB6MHlPvNP3MexIqDfOZNHxzWXlfd2Z7g3be3yo+col9B0nf
X-Google-Smtp-Source: AGHT+IFa4qkU045mY7nZ481RWQBqHlq/Fra6rxr12KR0siNLIFrK4PnAsmpvs8ea8paQ4mchBWPTBg==
X-Received: by 2002:a05:6e02:1d16:b0:3a3:a1a1:a3ec with SMTP id e9e14a558f8ab-3a3f40b745cmr90742575ab.22.1729502014920;
        Mon, 21 Oct 2024 02:13:34 -0700 (PDT)
Received: from LL-1378.kpit.com ([106.213.87.185])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7eaeab48f62sm2566697a12.42.2024.10.21.02.13.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Oct 2024 02:13:34 -0700 (PDT)
From: Pawan Badganchi <badganchipv@gmail.com>
X-Google-Original-From: Pawan Badganchi <Pawan.Badganchi@kpit.com>
To: openembedded-core@lists.openembedded.org,
	badganchipv@gmail.com
Cc: Aditya Tayade <Aditya.Tayade@kpit.com>
Subject: [OE-core][scarthgap][PATCH] run-ptest: removed 'sed -u' option
Date: Mon, 21 Oct 2024 14:43:20 +0530
Message-Id: <20241021091320.116044-1-Pawan.Badganchi@kpit.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Oct 2024 09:13:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206100

From: Aditya Tayade <Aditya.Tayade@kpit.com>

In embedded box, sed might be provided another providers like Busybox,
hence use generic options whenever possible.
/bin/sed -> /etc/alternatives/sed
/etc/alternatives/sed -> /bin/busybox.nosuid

Here used 'sed -u' option is not necessary, hence removed it.

Fixes below error:
sed: invalid option -- 'u'

Also added 'set -eux' option which halts execution of the script
on any failures.

Signed-off-by: Aditya Tayade <Aditya.Tayade@kpit.com>
Signed-off-by: Pawan Badganchi <Pawan.Badganchi@kpit.com>
---
 meta/recipes-devtools/e2fsprogs/e2fsprogs/run-ptest | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs/run-ptest b/meta/recipes-devtools/e2fsprogs/e2fsprogs/run-ptest
index 279923db8e..1857a17189 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs/run-ptest
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs/run-ptest
@@ -1,7 +1,8 @@
 #!/bin/sh
 
+set -eux
 cd ./test
-SKIP_SLOW_TESTS=yes ./test_script | sed -u -e '/:[[:space:]]ok/s/^/PASS: /' -e '/:[[:space:]]failed/s/^/FAIL: /' -e '/:[[:space:]]skipped/s/^/SKIP: /'
+SKIP_SLOW_TESTS=yes ./test_script | sed -e '/:[[:space:]]ok/s/^/PASS: /' -e '/:[[:space:]]failed/s/^/FAIL: /' -e '/:[[:space:]]skipped/s/^/SKIP: /'
 rm -rf /var/volatile/tmp/*e2fsprogs*
 rm -f tmp-*
 rm -f *.tmp
-- 
2.25.1


