Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB2E3C6FA86
	for <webhook@archiver.kernel.org>; Thu,  1 Sep 2022 07:21:51 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web11.9412.1662016898077871631
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Sep 2022 00:21:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Hu/O4KDW;
 spf=pass (domain: gmail.com, ip: 209.85.221.49,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id u17so1826975wrp.3
        for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Sep 2022 00:21:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=Z81Sw6mt7GXhs9LANNeCjHtM6SRt+eA4UzXVK73n2RA=;
        b=Hu/O4KDWLg8Z9FiQQXxujF3hA49Zlud++zhde71sEIyED4Y2qxEhWIjKMByc/tlz6L
         yuTygj1eSBRAzQF36nrsiXQqg1ZJZuhaaabP/QQWCbqsgbq62mLBFBnbWg2FT0tygnh/
         QY2ikVejgWG94a5lpn+LKaasAbWkxKGpnbO7IqReyN24kq3DKcKgJ4QJ/LwnlYrwkiXe
         WgS76EuiuEkgUgMFnhKNHpTQY69hhujKqmIXGwOSz+R3W7xTqsgqNLptUEFThI9qFrLl
         j6sA9lDnorY/fNDlh+NxW/TF7k0ws27QdbGG5OpzFBYzUniQB8Rw4DUexPggW0zYh1U2
         j/hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=Z81Sw6mt7GXhs9LANNeCjHtM6SRt+eA4UzXVK73n2RA=;
        b=bnzyh7MSXAxgp08j4MTI1CzK1KRsW3PDNnhURL1Efb5Aa39+VYdRB36EEG8EolH3PL
         X5KBhofrg+PreuA6zUuTlAoR1ft+fw/DRKuqxrzDwhwEtnGLNhkQFNni2KKZa/C94x/1
         5dDaVLZixHScDlHI5AleWJUk55ByIEhzkP+mNJ1ZAhydN9F2GcLwZotrzvM3n+rNB3CI
         2nPRuhQGjSOp/NLmyOtRvN4SODcgWhYTAByazyOTf9ep7z5yAH4+zfCWkTLSRIMqtwvM
         vkrU7Wf7DiPJFeaZdi+g3XoHkTUZSeKMLaXzmaPBmEh32USvZf3HAC+9uH+b14RrPYu7
         u4AA==
X-Gm-Message-State: ACgBeo0L+sx/+fAW9gfgHc/jetOqE2D4eXT6Xp717OGFJcMKiRtqZNBp
	eLtJe7swm1IDKxNzHUtxF4fdZsgZOtc=
X-Google-Smtp-Source: 
 AA6agR61EiC66wPdFcSIhUiDtgLfrXREYjKVhnmTN24aYWPLg1Dgd71CK3qFhemFke93KjbhWCC0tA==
X-Received: by 2002:adf:e490:0:b0:226:de4e:9897 with SMTP id
 i16-20020adfe490000000b00226de4e9897mr9180328wrm.457.1662016896475;
        Thu, 01 Sep 2022 00:21:36 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 c18-20020adffb52000000b00225239d9265sm14022982wrs.74.2022.09.01.00.21.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Sep 2022 00:21:35 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 02/14] shadow: correct the pam patch status
Date: Thu,  1 Sep 2022 09:21:13 +0200
Message-Id: <20220901072125.3366367-2-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220901072125.3366367-1-alex@linutronix.de>
References: <20220901072125.3366367-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Sep 2022 07:21:51 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170144

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../shadow/files/shadow-update-pam-conf.patch                 | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-extended/shadow/files/shadow-update-pam-conf.patch b/meta/recipes-extended/shadow/files/shadow-update-pam-conf.patch
index 15f8044fa2..3b61b75e5b 100644
--- a/meta/recipes-extended/shadow/files/shadow-update-pam-conf.patch
+++ b/meta/recipes-extended/shadow/files/shadow-update-pam-conf.patch
@@ -4,7 +4,9 @@ In yocto it obey the way with Debian/Ubuntu, and the names are common-auth, comm
 common-password and common-session.
 So update them with oe way.
 
-Upstream-Status: Pending
+See meta/recipes-extended/pam/libpam/pam.d/common-password
+
+Upstream-Status: Inappropriate [oe-core specific]
 
 Signed-off-by: Kang Kai <kai.kang@windriver.com>
 
-- 
2.30.2


