Return-Path: <changhyeok.bae@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3F03C4345F
	for <webhook@archiver.kernel.org>; Sun, 21 Apr 2024 10:55:23 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.web10.29970.1713696918119267437
 for <openembedded-core@lists.openembedded.org>;
 Sun, 21 Apr 2024 03:55:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gJTJG0+R;
 spf=pass (domain: gmail.com, ip: 209.85.218.43, mailfrom: changhyeok.bae@gmail.com)
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a554cf23c3dso56377666b.3
        for <openembedded-core@lists.openembedded.org>; Sun, 21 Apr 2024 03:55:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713696916; x=1714301716; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1cu4LWZ1PpiS0JpKpzfDMj+2j31n2CLgsnK9pIf8h8w=;
        b=gJTJG0+RMEomLExkRZ7TBdokcKzUKFy9PIdntzkqhbU2FSRstfwD324j/gQrBAIvtD
         7N1/YupgQQPrEmF4Sh6svC7ZrutNnVh5QCdUMng+kQyS1kxw3pc/fV+qK2XEPqpvB6BM
         bGQp6/XupR5fPWgHFqfhgs4A7FCAMsTUUh0AZ/DwK/YxmK7qXDwV4AkeEQlja9aCG7kB
         Vg5GFVtMg6tY64P56aWRrI2i6KSR3iyGNXjDcn61bEfEyHWiJ4IsRclGipJfA3APyoKj
         BzVExMJoSbV5Z1ItFIk9LEhQdmOgg/3vsQFq1rKuIKB+rhG0AMDMmlXfWDO0nqTnpntR
         Y1rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713696916; x=1714301716;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1cu4LWZ1PpiS0JpKpzfDMj+2j31n2CLgsnK9pIf8h8w=;
        b=hniOYv1h9m9+WmWk+Rd0cCKJzH/Ol9+x1140EbxRffbpGCC/vbQDq1qqdLfomN2pyP
         b6toAFDDAH7qGH2qFaZLJRNf98V+ctN4bCroPX935cR2ZVataB5PK2yDmeylBvyCUTlQ
         qW8ZJ+0alGYHssHnU0Jyn+vrDHddK4rKxhCMYuITTq2DvDViL8BGucZAhRDbv1Q9icAK
         whq0Lm0Li8s1qTzboMXHw0U5UGc2RiL6EzPHp0BvQLZ2ugN2IUyfl0poKN8AXHGH9Hvh
         bddWXPs8uX3bL/sebzqQyGuF1IuychOeHyYoxAw9LnAV3SggNj5g/Lo5VyOyEcbMBYvN
         Du+A==
X-Gm-Message-State: AOJu0YwXL5ymqhR7jtQiPaH7U36zyi6Ho5q7jKPLylPkSWOLiM22Kazt
	jG+O8XaZHaszUu7+6nwzoxFSgbKrRN7PPsYMmEnlPM07tN9sWb9/82CP0A==
X-Google-Smtp-Source: AGHT+IEFveqoHcNLUCXiO2gA+lIEl83s61ZFRwDdUZVgegqN55o9OB5wTXVW2M9/ilu91JbQQDyy+w==
X-Received: by 2002:a17:907:86a7:b0:a55:af02:9167 with SMTP id qa39-20020a17090786a700b00a55af029167mr882301ejc.0.1713696916083;
        Sun, 21 Apr 2024 03:55:16 -0700 (PDT)
Received: from localhost.localdomain ([95.90.247.223])
        by smtp.gmail.com with ESMTPSA id sa40-20020a1709076d2800b00a5255afc856sm4412338ejc.84.2024.04.21.03.55.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Apr 2024 03:55:15 -0700 (PDT)
From: Changhyeok Bae <changhyeok.bae@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Changhyeok Bae <changhyeok.bae@gmail.com>
Subject: [OE-core][PATCH] iproute2: upgrade 6.7.0 -> 6.8.0
Date: Sun, 21 Apr 2024 10:55:11 +0000
Message-Id: <20240421105511.90489-1-changhyeok.bae@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 21 Apr 2024 10:55:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198570

* Release Note *
This is regular release of iproute2 corresponding to the 6.8 kernel.
In addition to the usual round of documentation fixes, many
small changes to ss utility. Most of the work to have full JSON
support in traffic control (TC) is done, only a few leftovers.

Remove support fot ipt and xt in tc.

Signed-off-by: Changhyeok Bae <changhyeok.bae@gmail.com>
---
 .../iproute2/{iproute2_6.7.0.bb => iproute2_6.8.0.bb}        | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)
 rename meta/recipes-connectivity/iproute2/{iproute2_6.7.0.bb => iproute2_6.8.0.bb} (94%)

diff --git a/meta/recipes-connectivity/iproute2/iproute2_6.7.0.bb b/meta/recipes-connectivity/iproute2/iproute2_6.8.0.bb
similarity index 94%
rename from meta/recipes-connectivity/iproute2/iproute2_6.7.0.bb
rename to meta/recipes-connectivity/iproute2/iproute2_6.8.0.bb
index 8c460adf73..b1c6518092 100644
--- a/meta/recipes-connectivity/iproute2/iproute2_6.7.0.bb
+++ b/meta/recipes-connectivity/iproute2/iproute2_6.8.0.bb
@@ -15,7 +15,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/net/${BPN}/${BP}.tar.xz \
            file://0001-libc-compat.h-add-musl-workaround.patch \
            "
 
-SRC_URI[sha256sum] = "ff942dd9828d7d1f867f61fe72ce433078c31e5d8e4a78e20f02cb5892e8841d"
+SRC_URI[sha256sum] = "03a6cca3d71a908d1f15f7b495be2b8fe851f941458dc4664900d7f45fcf68ce"
 
 inherit update-alternatives bash-completion pkgconfig
 
@@ -53,6 +53,9 @@ do_install () {
     install -d ${D}${datadir}
     mv ${D}/share/* ${D}${datadir}/ || true
     rm ${D}/share -rf || true
+
+    # Remove support fot ipt and xt in tc. So tc library directory is not needed.
+    rm ${D}${libdir}/tc -rf
 }
 
 # The .so files in iproute2-tc are modules, not traditional libraries
-- 
2.34.1


