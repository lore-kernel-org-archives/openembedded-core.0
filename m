Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 165A5C7EE29
	for <webhook@archiver.kernel.org>; Sat, 20 May 2023 16:05:45 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web10.13621.1684598734945930672
 for <openembedded-core@lists.openembedded.org>;
 Sat, 20 May 2023 09:05:35 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=Alc+LaV9;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.181, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-64d2c865e4eso1708403b3a.0
        for <openembedded-core@lists.openembedded.org>; Sat, 20 May 2023 09:05:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1684598734; x=1687190734;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QFO4vt0yutBSa/nNqk6LbdgHLTYKn2rU8CRS7nOFWBk=;
        b=Alc+LaV9OYRBSof8a0U/Zvkn17CrtTspTE+InLIAypZel/hiiFKy1Ijg23msroGdGh
         822UhyW1BvBsz2SltC7gmB/ckYmPaXrgQfnW9ZWb1PPMlMTzIZItpZsesV5xhV6wBqfc
         PModAfu/6caakTMkNZOAOy4CCr9hGAUCwBJEzDgkEeYALR3eku8rrAXo21T6/cXAXvbG
         HeQe8PJwrwAEy0xMzx0PMHPGyHBZ8rvr2kCpmbPf+R+LspqldGHJVR02FX1SCE2VKZVQ
         Ukw/NH+5JU/DgIwm1iD9qrduFruWyxYyRXf0DPeDXbwosFaSGUg/UFAGoimBujpSfRSJ
         USQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684598734; x=1687190734;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QFO4vt0yutBSa/nNqk6LbdgHLTYKn2rU8CRS7nOFWBk=;
        b=MHetD7naElnbwSSBYSAbzoXpMQlGpYsG5Rra+fMVr7gnx+5p+L7luYBqYaBd/Oi+2v
         GvPXyV3u+cmfGPlBhjq1fEKcAcofv+JNAjMX2/T/i6RBw4zqJXH1ZvNsl6KXBDlKPcbL
         s35abphDdUeVhL2H98TFHLBjDgRlf+wCToQrxpepCW0zhu6y2O2vH1U+q8U7OmVNnHCi
         h/90BbGU1vlgvdfntAEBf2FwVNWEMAPCfE7xwiEniiUgXOrnf0R7rIXKanWdprY6cK5n
         ORx5Vi8v25TgOrsyBumzcwi3Fa65o1S0YLXr7egzJOyBTPvBibcl4P0ai6TlHuumxju1
         aTng==
X-Gm-Message-State: AC+VfDzib5ivI8BE8OWtTJiMAYB9U5apQV/SRq84fe0GhEp37OWr/us5
	fcf/0kqE3o7c2Gskx9QmdIC0FrxybVGpHygzbac=
X-Google-Smtp-Source: ACHHUZ5wyzlqcteOiEfrlkVT6HVsR4vznit2pf3Vfi9j8G3eIVm+UGwQFwpQq1MRkSxTgvxzQGwfoA==
X-Received: by 2002:a05:6a00:1a15:b0:64d:88b:a342 with SMTP id g21-20020a056a001a1500b0064d088ba342mr6547954pfv.30.1684598734018;
        Sat, 20 May 2023 09:05:34 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id a24-20020a62e218000000b00642f1e03dc1sm1457790pfi.174.2023.05.20.09.05.33
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 May 2023 09:05:33 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 10/11] oeqa/utils/metadata.py: Fix running oe-selftest running with no distro set
Date: Sat, 20 May 2023 06:05:06 -1000
Message-Id: <1a28c6cfe0e6c4b44d01778f8034231040c6d4ad.1684598568.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1684598568.git.steve@sakoman.com>
References: <cover.1684598568.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 20 May 2023 16:05:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181573

From: Thomas Roos <throos@amazon.de>

This will use default values when no distribution is set.

[YOCTO #15086]

Signed-off-by: Thomas Roos <throos@amazon.de>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
(cherry picked from commit 888fe63b46efceeff08dbe8c4f66fec33d06cb7a)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/utils/metadata.py | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oeqa/utils/metadata.py b/meta/lib/oeqa/utils/metadata.py
index 8013aa684d..15ec190c4a 100644
--- a/meta/lib/oeqa/utils/metadata.py
+++ b/meta/lib/oeqa/utils/metadata.py
@@ -27,9 +27,9 @@ def metadata_from_bb():
     data_dict = get_bb_vars()
 
     # Distro information
-    info_dict['distro'] = {'id': data_dict['DISTRO'],
-                           'version_id': data_dict['DISTRO_VERSION'],
-                           'pretty_name': '%s %s' % (data_dict['DISTRO'], data_dict['DISTRO_VERSION'])}
+    info_dict['distro'] = {'id': data_dict.get('DISTRO', 'NODISTRO'),
+                                'version_id': data_dict.get('DISTRO_VERSION', 'NO_DISTRO_VERSION'),
+                                'pretty_name': '%s %s' % (data_dict.get('DISTRO', 'NODISTRO'), data_dict.get('DISTRO_VERSION', 'NO_DISTRO_VERSION'))}
 
     # Host distro information
     os_release = get_os_release()
-- 
2.34.1


