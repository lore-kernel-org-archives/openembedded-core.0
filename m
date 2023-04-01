Return-Path: <frederic.martinsons@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 613ECC77B70
	for <webhook@archiver.kernel.org>; Sat,  1 Apr 2023 09:31:07 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web11.17484.1680341458605425294
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Apr 2023 02:30:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Zsb64fO0;
 spf=pass (domain: gmail.com, ip: 209.85.221.45, mailfrom: frederic.martinsons@gmail.com)
Received: by mail-wr1-f45.google.com with SMTP id l12so24678888wrm.10
        for <openembedded-core@lists.openembedded.org>; Sat, 01 Apr 2023 02:30:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680341457;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ol8FfIAHbEw0jNdubbhfpGHjv/EAyiWShTkIPW2gNVQ=;
        b=Zsb64fO0PH35cRyEKtWLiXt3OlT4N7xOTH5/LK1838VqNwcy4JhLa9Gxg1cHuBSnQO
         D2z1xXudKQ/1Yr1bx6FI0vsvG0D870E9SE0jSO2NsYF1fnzV4jpu5f/rPuJ1Yp6MIIfH
         /pENdY5QPBZ/fKrTPB7KJs2fBIhJexBOKMA6R4Ag76Ybm33nNC6qMyRBFCrN7PPDSmKh
         5u0n5Wfxyx7KoZ765G7lqDHF6k2dcBQpQjvc0AOsPpMu92Ttfi9EhLCg5OQtmRFVtnOD
         uExgYYhVrs4VNTPjlDfWMRIelLS73V+GoynqRxKMTPSF6rOpIWoYvRmSZfTniMUVhmXI
         qwfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680341457;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ol8FfIAHbEw0jNdubbhfpGHjv/EAyiWShTkIPW2gNVQ=;
        b=1G99pUQNAVlvzKpF0WAZb6b0ZAwSjoco5mvw8PpS01rrHKYZlBeOpMyd1EF0JZV6FR
         nGhkLCD94SLDXTdPn/sIclnBxHGjK3KaP6e5UujaM8oeplsGfHemlRmYidraUcyvQ1nG
         oUm092sqwpRDfQMjISz4WwIRAgnZXpLYqZj5q2fj1+6VoOI5e27JRWpTC2iXXztCkNsR
         4VEW6GKj1eKzENKnYVse/HiRaC7RQyWoez/UtC1YUzKqByMVmvB4SJ5/MIvwxffVHEwy
         csJv4feaFdPYhYCxsMEn8WjsM5Z2L30IoEEcB3yAGeW6wHyEy3ywJiIO7B7SJ4bAyjuZ
         vmcQ==
X-Gm-Message-State: AAQBX9e5JhVjVoeDqLUhGP5zRB1bklai3e3msrT95xcMfKrwjNTMxULN
	CuFjEp5HdmcFW1HYnpX9MPKD13zxiC0=
X-Google-Smtp-Source: AKy350bDdnkEIFu5Ttc9XVrcNaUK3R9uhJJ02sMzE/hzGVaLWohGZdprdKImBso4yan7ij78FRBgsg==
X-Received: by 2002:adf:e712:0:b0:2e2:730a:c7d6 with SMTP id c18-20020adfe712000000b002e2730ac7d6mr12362694wrm.25.1680341456664;
        Sat, 01 Apr 2023 02:30:56 -0700 (PDT)
Received: from work-pc.. ([2a01:e0a:8d5:c6c0:eb6d:89c5:4fce:e824])
        by smtp.gmail.com with ESMTPSA id p11-20020a5d4e0b000000b002e71156b0fcsm1522232wrt.6.2023.04.01.02.30.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Apr 2023 02:30:56 -0700 (PDT)
From: frederic.martinsons@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: martin.jansa@gmail.com
Subject: [PATCH V7 3/6] devtool: add support for multiple git url inside a cargo based recipe
Date: Sat,  1 Apr 2023 11:30:48 +0200
Message-Id: <e759e25bf56ca4017c90b2c5fd5d74889370c1ff.1680340685.git.frederic.martinsons@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1680340685.git.frederic.martinsons@gmail.com>
References: <cover.1680340685.git.frederic.martinsons@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Apr 2023 09:31:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179462

From: Frederic Martinsons <frederic.martinsons@gmail.com>

Without that, the possible git urls that are in SRC_URI of a recipe
are removed from SRC_URI during devtool process and so the
cargo_common_do_patch_paths in cargo_common.bbclass cannot
patch these packages to fetch them locally.

I use a generic type name because I foresee this change will
be useful for recipe that used a package manager (cargo but also
npm) see https://bugzilla.yoctoproject.org/show_bug.cgi?id=11015

Signed-off-by: Frederic Martinsons <frederic.martinsons@gmail.com>
---
 meta/classes/externalsrc.bbclass | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta/classes/externalsrc.bbclass b/meta/classes/externalsrc.bbclass
index 26c5803ee6..b00fdba8e9 100644
--- a/meta/classes/externalsrc.bbclass
+++ b/meta/classes/externalsrc.bbclass
@@ -68,9 +68,7 @@ python () {
         for url in fetch.urls:
             url_data = fetch.ud[url]
             parm = url_data.parm
-            if (url_data.type == 'file' or
-                    url_data.type == 'npmsw' or url_data.type == 'crate' or
-                    'type' in parm and parm['type'] == 'kmeta'):
+            if url_data.type in ['file', 'npmsw', 'crate'] or parm.get('type') in ['kmeta', 'git-dependency']:
                 local_srcuri.append(url)
 
         d.setVar('SRC_URI', ' '.join(local_srcuri))
-- 
2.34.1


