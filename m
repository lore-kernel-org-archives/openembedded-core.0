Return-Path: <frederic.martinsons@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 635CBC77B60
	for <webhook@archiver.kernel.org>; Thu, 30 Mar 2023 15:45:12 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web11.29130.1680191103132127290
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Mar 2023 08:45:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=SiOkGXIN;
 spf=pass (domain: gmail.com, ip: 209.85.221.52, mailfrom: frederic.martinsons@gmail.com)
Received: by mail-wr1-f52.google.com with SMTP id v1so19564922wrv.1
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Mar 2023 08:45:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680191101;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ol8FfIAHbEw0jNdubbhfpGHjv/EAyiWShTkIPW2gNVQ=;
        b=SiOkGXIN4yAtH0HDkWY4Lh6yGHJ7ADbX8ZU5kk09YN7sVXtHFEtqtIxEp91rn3HJcg
         /9HpvPWVizetl+PwWUsnYPs7/yj4PGaE7uTdTaDU/ICQb9bkFdz6Z3+4CLXSNI2X4Z9F
         +gFiJHgM0HxU1oktmvXvGLD2+TkWdxI/eToQM/HfcfgudPV18WiLDKYiLuaTy7FODP7k
         GtP8RKRd2f+gvrP7Qk+ke7tsC4RXsaWKfvkpLwIRg+QtiqFSQhHMvh3uMnvf3o3nJGPd
         9t+OTcp84tj5WXdybAJIVFr/y34UmC2Vy+t8QMW13PXVx1LbZh5Qf5QfHa4zM/PpOWoS
         asHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680191101;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ol8FfIAHbEw0jNdubbhfpGHjv/EAyiWShTkIPW2gNVQ=;
        b=VfCzDh5pJXKsZqAW+H5wG7Tq2r98YBZ9ALWSvZ+YflDa+lzPJ+sNroKaE+CSgjowuo
         wHHUaUm/G4/Ypq8OQBNHyfIzCa/XFXWhGGwsRN2s0Ije0c2Ww5KB3EC5rFfAQ7YRB+0O
         FmPi36ZaIStBYhgcir4K3/rDIUNXySVdCP90hrXORjIleCxmsqghdftW0XmfmFF9PAn4
         MABaIBSzX3M/Y/lom7n9ZZAU9ZzS/GkEzVS4vr/1ZIAmwGe3xBjdnbuagfnuTYZHlrk9
         t+QcbVt/MysOi9T56zhsPbGAZ9gtQitYJxSxyDmNK6jKMASOvymqxeJkF60jnil3RcT1
         4gUQ==
X-Gm-Message-State: AAQBX9cilYAYDp/Ji6hyoQzD5FTq4Aw/T8+W0j+Zck0/u+P/0sg0Wn7O
	xOMSys6khE4JCHW0V7h608cJLzc5NmU=
X-Google-Smtp-Source: AKy350YDKZEiQOTvkDE5Y/l+KV2akYm+6Ph7boggXJQ8+wqvAX7Igcko+yqPu7sXl4jh0eNx72hpOw==
X-Received: by 2002:adf:ea49:0:b0:2ce:82f8:812d with SMTP id j9-20020adfea49000000b002ce82f8812dmr17884948wrn.54.1680191101183;
        Thu, 30 Mar 2023 08:45:01 -0700 (PDT)
Received: from work-pc.. ([2a01:e0a:8d5:c6c0:c898:b1f6:d5c7:39c5])
        by smtp.gmail.com with ESMTPSA id x12-20020a5d650c000000b002c5544b3a69sm33151056wru.89.2023.03.30.08.45.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Mar 2023 08:45:00 -0700 (PDT)
From: frederic.martinsons@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: alex.kiernan@gmail.com
Subject: [PATCH V5 3/6] devtool: add support for multiple git url inside a cargo based recipe
Date: Thu, 30 Mar 2023 17:44:50 +0200
Message-Id: <19ff7843ad82c2b3e245ce71d082650b3eed7822.1680190966.git.frederic.martinsons@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1680190966.git.frederic.martinsons@gmail.com>
References: <cover.1680190966.git.frederic.martinsons@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Mar 2023 15:45:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179340

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


