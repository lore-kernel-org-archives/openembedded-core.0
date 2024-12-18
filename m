Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFC82E77187
	for <webhook@archiver.kernel.org>; Wed, 18 Dec 2024 11:56:44 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web11.103989.1734522998591901155
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Dec 2024 03:56:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=BQF4QNGw;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-435f8f29f8aso46131725e9.2
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Dec 2024 03:56:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1734522996; x=1735127796; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=F3hCEwWCQuJ/B2kGi27p/akZIMraC2x5i57h16NEncU=;
        b=BQF4QNGw6j6/FzkSWqntjbCyiRJJr5JvUm/3JTBp2wfHZ/7fp+7tr/BBtMq64eOsLL
         HYg38mrMlVu3lj4wT4/miEP57LYJIQZoDHqdbOwBcJIC7oj91GKeeFzwy8nWnuMuKKt6
         4ZaxeNgLS7o2c+2kVjasHQyR0q96Shz2Zlkhk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734522996; x=1735127796;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=F3hCEwWCQuJ/B2kGi27p/akZIMraC2x5i57h16NEncU=;
        b=I1ByfNcpEVnmYU22K/fWZV/unBUsrA3M9oS46vf8BeUoGnZTASb0myxzqT773XaseD
         BLid94VfFSY7in6Ng1crwYfUiZQyejbxV0O2geGq5srlM6sZupbyhdzfyt4oS1ZNyNnV
         WnEqiSvxBlMIRlRnbuI7Eoks1kw0+enJEE8rGEV2HTx97f4owyckx01g8ANCu3Q0jd78
         KRqClZny/SciDxvzezY8QX238UBJM0M/0YOkni4+IYxu26fRXcqAR2GJwHXz1k3GDTp7
         DF3Ry8BMaqImp3j3XXruO54WSlh7xkLYQIO8VakGuf2mgT//yWzwLyjhhx/3hNrsAzd9
         QPjA==
X-Gm-Message-State: AOJu0YwQ+XFWKWy+Qx04IO+LmH1C/7Dhq32KxDI8keYqI9YK9MNL2wbi
	Vakjr6ryAIsP/QR8wXZhy0J/EagtYY/juq8T293lZ95TO//NKa33azqVIOwodFzpiSGQLTxd8BG
	3
X-Gm-Gg: ASbGncv4EHxE9asn7marmgAvZgE7EnQRDfY9DoIL21wwSswDgtG+4fEiz+q9LRR+c3k
	Udv2Mn1Za2I/baMt8471JHYmbwzDTNhDgOqxOcQisSr4dfOLhUPlx/gx1VOnbPGnJZfxJaPrtBS
	UMfsZk4XlHxOXrySdwDXJKzIJQuUbfEtMPrOAo6iUvnE8jx3v5sF0gjvZuSLRvVA+c5HF4aIRoz
	Bf/eyW9YAC2BZuG6UNItgHHkG4zUUPJ1QB880svKKtYc+l5JQkym+uPe8U7AkzRXL0zdB2ciI89
	oqI6mqhT+w==
X-Google-Smtp-Source: AGHT+IH1Dd6AZJmDvij6/z9CnRE7b/fRoKXJYmb92Ypp4mtEty8BJO47Fe1A0N5gE5DDZoMi6mEFHA==
X-Received: by 2002:a05:600c:3b9d:b0:431:6153:a258 with SMTP id 5b1f17b1804b1-4365535e9b1mr19911945e9.13.1734522996214;
        Wed, 18 Dec 2024 03:56:36 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:1e1f:4ecb:f2fa:eddc])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43656b0153asm18196335e9.14.2024.12.18.03.56.35
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2024 03:56:35 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] cve-update-nvd2-native: Tweak to work better with NFS DL_DIR
Date: Wed, 18 Dec 2024 11:56:34 +0000
Message-ID: <20241218115634.1666697-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Dec 2024 11:56:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208869

After much debugging, the corruption issues on the autobuilder appear to
be due to the way sqlite accesses database files. It doesn't change the
file timestamp after making changes, which for reasons unknown, confuses
NFS. As soon as the file is touched, NFS becomes fine again accross the
whole cluster, as if by magic.

We could try and debug further but putting a "touch" call into the code
is easy and harmless. Lets hope this removes this annoying source of
errors.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-core/meta/cve-update-nvd2-native.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-core/meta/cve-update-nvd2-native.bb b/meta/recipes-core/meta/cve-update-nvd2-native.bb
index a68a8bb89f1..8ef13bdde6f 100644
--- a/meta/recipes-core/meta/cve-update-nvd2-native.bb
+++ b/meta/recipes-core/meta/cve-update-nvd2-native.bb
@@ -90,6 +90,8 @@ python do_fetch() {
     if update_db_file(db_tmp_file, d, database_time) == True:
         # Update downloaded correctly, can swap files
         shutil.move(db_tmp_file, db_file)
+        # Need to 'touch' the file to ensure NFS sees the data
+        os.utime(db_file)
     else:
         # Update failed, do not modify the database
         bb.warn("CVE database update failed")

