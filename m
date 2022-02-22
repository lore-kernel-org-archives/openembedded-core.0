Return-Path: <scott.murray@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 300BCC433F5
	for <webhook@archiver.kernel.org>; Tue, 22 Feb 2022 14:45:46 +0000 (UTC)
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com
 [209.85.219.51])
 by mx.groups.io with SMTP id smtpd.web08.13421.1645541144849780099
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Feb 2022 06:45:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=Buh1fTei;
 spf=pass (domain: konsulko.com, ip: 209.85.219.51,
 mailfrom: scott.murray@konsulko.com)
Received: by mail-qv1-f51.google.com with SMTP id n6so42604978qvk.13
        for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Feb 2022 06:45:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yyvw37JyVj8PwDh+prl/tF4NWKBMNX2jnWvJHE2TRc0=;
        b=Buh1fTei2CkXwSJnPcyp/PwtKJ4X7lHaEByb48/c/qmtKZDLI8hcgKneHeZLANfuqQ
         pZu8FfQjUJGg/xr1bbZWjCXK+wt3eHE/AI7NOhP21VNTkH4AxyWYoPNAAMGclqxHbmn+
         EbVr7z3Vr4b08LGHjsd/nFNZjEteoZkI4rW6s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yyvw37JyVj8PwDh+prl/tF4NWKBMNX2jnWvJHE2TRc0=;
        b=qLeJJ267pSBno0ILf79bCDCigR+GsanP3mLfW1A0NMx7vfuEaKrQZhDm+uqTd3x6Ji
         mhJ/GC+EQjJBctLGYSxWLLA91DwUKo4xxhr0ZZjszYa8jOSuoC0w8KEkJ/Ch7AvnPysz
         WctjLrDSVvEL2CmmzUHUqndUchi4KBpjt0cqzXSpvU8mQX8Tw3xix1iJef0v+iQd7l/G
         Cp129gZwFjkQRyyP8YFboTXEsDdqowhwuiEOVcZ9cwvXNaoAMrGCxeIMpoaEG95OHj/V
         y9h1g9+WUeJr8/xgO3nojbLdp2fI74qnIO2+H7HF8AKgz9ZBCtmZVnPx81Ipa9Qvz4tE
         PZYA==
X-Gm-Message-State: AOAM533K20swN835oVYqB2VXCNSAMqJI09AusoOOUIZJCVZE3P3LUoqe
	LYz+hncoZthmv0bT8ryo1s3xv3EBG0jtKA==
X-Google-Smtp-Source: 
 ABdhPJxrklHKLSA6C++qcD5tyG50E0UsL6Eo/6hs1GFOaqEplbZI4UHDoYap9xzj8E5P9EGCz+wiaw==
X-Received: by 2002:a05:622a:8:b0:2d7:ae4a:8434 with SMTP id
 x8-20020a05622a000800b002d7ae4a8434mr22315686qtw.212.1645541143256;
        Tue, 22 Feb 2022 06:45:43 -0800 (PST)
Received: from ghidorah.spiteful.org (192-0-174-222.cpe.teksavvy.com.
 [192.0.174.222])
        by smtp.gmail.com with ESMTPSA id e2sm250297qte.92.2022.02.22.06.45.42
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Feb 2022 06:45:42 -0800 (PST)
From: Scott Murray <scott.murray@konsulko.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] scripts: fix file writing in convert-spdx-licenses
Date: Tue, 22 Feb 2022 09:45:34 -0500
Message-Id: <20220222144534.2244338-1-scott.murray@konsulko.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Feb 2022 14:45:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162135

The convert-spdx-licenses.py script needs the same file closing
fix as was made to convert-variable-renames to ensure modified
file contents get flushed out.

Signed-off-by: Scott Murray <scott.murray@konsulko.com>
---
 scripts/contrib/convert-spdx-licenses.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/contrib/convert-spdx-licenses.py b/scripts/contrib/convert-spdx-licenses.py
index 68b9e2f18e..4e194dee3f 100755
--- a/scripts/contrib/convert-spdx-licenses.py
+++ b/scripts/contrib/convert-spdx-licenses.py
@@ -114,6 +114,7 @@ def processfile(fn):
                     if orig != line:
                         modified = True
                     new_file.write(line)
+        new_file.close()
         if modified:
             shutil.copymode(fn, abs_path)
             os.remove(fn)
-- 
2.35.1


