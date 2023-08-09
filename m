Return-Path: <max.oss.09@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C504EB64DD
	for <webhook@archiver.kernel.org>; Wed,  9 Aug 2023 08:19:15 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.web10.83700.1691569147414741025
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Aug 2023 01:19:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=hbTwCTGu;
 spf=pass (domain: gmail.com, ip: 209.85.208.53, mailfrom: max.oss.09@gmail.com)
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5230ac6dbc5so8840439a12.3
        for <openembedded-core@lists.openembedded.org>; Wed, 09 Aug 2023 01:19:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691569145; x=1692173945;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GNMMc1ngrXWu4CSTsGmLSj3l19Co8cNo+Ajc+aB96Mw=;
        b=hbTwCTGuTO7gyC1mnXmYqhvSdkTYBth+rqBVcFfGA+rInHJJ0eafk/fraHgmHKvpDd
         pyVDvGku1hsIjhx8fbvagbOSYdV2AjPyKqV7AsvpGTmzHpHJURLpTdwNk1zIvO0Zzw3N
         NpcwUSGoEyMCaDLdP9YpBhOU201jpfk6CvSu9RvWwaEFQ1lzdH0kbPQo9STA5GdZjLEr
         j5/PozRvtt3U6AAJGPXchKP5qM3cEWWtaXz591tONxPFDM3FA0uID8nVzlezlDyjAAyC
         eoertMXMifHyXMXWtvWxeaxo2r9BmseLBYsgcx86I7fOLLgD/99Qr0nyESTc+FIUg1FY
         Q+6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691569145; x=1692173945;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GNMMc1ngrXWu4CSTsGmLSj3l19Co8cNo+Ajc+aB96Mw=;
        b=JmZDtGnLzj0UdA7SlyfLj/z6jMvW+cQ9kSrpKhzA6LHCOGuYVlwv/MY/C3SMiBsY5j
         ugixrlZHQjTjQsGeseayTVS075OLESK331SGz0qepwguIP/oyD6Hg1lffYY8C8YpHJK/
         v7zR1IO0FwlkUcmnP0LUPgJtva8NJPl6L47U7OVrJ6sUEOn7bNlJELxzgnmmKKDHLcqU
         zgEzsBTnZHm8PS2t8GJA9W06m0FhWEgQyhP1NFXIkLd74aDGmLfoBA1QiKVLUZkboH5c
         ucMhHzb8Q/CKuwtbGLabKOgbj6g2yQplhdV5cYm8/z1ElFVbPgymADpzfMX3Zo5vnoKn
         bCHQ==
X-Gm-Message-State: AOJu0Yx6GeQo+OVOrp4KaweJgaw9R0vmLInmT0FeE8mG2zj0SHthPzpP
	z4GGhDOBEmneINvoSMqjHaSChchTVP8=
X-Google-Smtp-Source: AGHT+IH00HcEEWaYe34FlKcsMd4845vDsBWNz+sKLnSufQqyqF58/3t+wFaFwIkT2pCPlc/INVSAEQ==
X-Received: by 2002:aa7:cf82:0:b0:523:4bfa:b44c with SMTP id z2-20020aa7cf82000000b005234bfab44cmr1573306edx.33.1691569145102;
        Wed, 09 Aug 2023 01:19:05 -0700 (PDT)
Received: from linuxdev2.toradex.int (31-10-206-125.static.upc.ch. [31.10.206.125])
        by smtp.gmail.com with ESMTPSA id c6-20020aa7d606000000b0052338f5b2a4sm3587376edr.86.2023.08.09.01.19.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Aug 2023 01:19:04 -0700 (PDT)
From: Max Krummenacher <max.oss.09@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Max Krummenacher <max.krummenacher@toradex.com>
Subject: [oe][OE-core][Patch] classes/create-spdx-2.2: allow absolute paths in NO_GENERIC_LICENSE
Date: Wed,  9 Aug 2023 10:18:06 +0200
Message-Id: <20230809081806.1813479-1-max.oss.09@gmail.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Aug 2023 08:19:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185690

From: Max Krummenacher <max.krummenacher@toradex.com>

The current implementation expects the license file in NO_GENERIC_LICENSE
specified as being relative to ${S}.
Assuming that there are two source locations this gets confusing to
specify, e.g. ${WORKDIR}/other_tree/file looks more natural than
${S}/../other_tree/file.

Check if the filename specified is not absolute and only then assume
it is relative to ${S}.

Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
---
 meta/classes/create-spdx-2.2.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes/create-spdx-2.2.bbclass b/meta/classes/create-spdx-2.2.bbclass
index 844b674f6f..42d4ef54b0 100644
--- a/meta/classes/create-spdx-2.2.bbclass
+++ b/meta/classes/create-spdx-2.2.bbclass
@@ -134,7 +134,8 @@ def convert_license_to_spdx(lic, document, d, existing={}):
                 # If it's not SPDX or PD, then NO_GENERIC_LICENSE must be set
                 filename = d.getVarFlag('NO_GENERIC_LICENSE', name)
                 if filename:
-                    filename = d.expand("${S}/" + filename)
+                    if not Path(filename).is_absolute():
+                        filename = d.expand("${S}/" + filename)
                     with open(filename, errors="replace") as f:
                         extracted_info.extractedText = f.read()
                 else:
-- 
2.35.3


