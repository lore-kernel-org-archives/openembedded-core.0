Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23347CCF9EE
	for <webhook@archiver.kernel.org>; Mon, 27 Oct 2025 20:02:54 +0000 (UTC)
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
 by mx.groups.io with SMTP id smtpd.web11.1069.1761595366152345622
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Oct 2025 13:02:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=Oe+auzU4;
 spf=pass (domain: baylibre.com, ip: 209.85.222.178, mailfrom: tgamblin@baylibre.com)
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-89048f76ec2so576377085a.1
        for <openembedded-core@lists.openembedded.org>; Mon, 27 Oct 2025 13:02:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1761595364; x=1762200164; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4Z3SwCl/pN4oezS6vPjMzMIF6TxzR8BsyrRisMNsocw=;
        b=Oe+auzU48h4jzeXyw+WaDQ30Ell8F1+HPcj6IqAhqZauKRLhYvAgPvqnHzofaizD5I
         VIHleiMhBj9aKMgMO53VaTfA8SCnIF3f/EcMHuDMSd1r4tqP8l6/q7RoanBF4Eqj00Ht
         VuHAMFYTmwzTkZefqR7I65almb7gZl667QWhDWeSK6r4Gj71DiG5F0Bp4gFQzkJAKfQW
         Su3LB3klNIFHVFRWVjxqKBKPSpgZQfrmuduXi1rtYVhJaPqROKuETyekpwPGTQtNkHPD
         TAHsuygKOitPg825z+/Ilh+3mJUc0ZgPV70rz673j3x/aRlAfr9gOlZhCg3H4wEvAn3y
         Kzng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761595364; x=1762200164;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4Z3SwCl/pN4oezS6vPjMzMIF6TxzR8BsyrRisMNsocw=;
        b=oceVTBj/gY+32J6jhEWJTAhS5xHaDz2uPPWqngYN/EUeHsjuXrPZgvxfJeWk9TBfwu
         p5BUihdF+xYidPilsOBkeEYCB1/2Y1aBjrMRBAoDy/M3OqLgwZ2oZmK109TZCilAItad
         /RZL6P5Fn+c9G2eKHvZXV05kO3+9YMT069Bvcnktvdtj9hjR5aZeOIVg9dsCIjvQ/OEx
         h+ZwgoaCuD8KRkGLhiT6C5/xzZq2VbFru6vQwWWXK2eiDPMEKRXdgRZOCQ2Kl7iNAOwi
         Zd9j/xBSntz7KFjwjvGaVgsrY2U33StqyL6Xx83IzASP0xFBasFEXyPwvq2jXbEHQwZA
         V6+A==
X-Gm-Message-State: AOJu0YzeAoXr+FpWCUD/dUVavEmi6mbEmVCiHONZPJKzSat3I28ITMWJ
	epoZKVXOFG82Niz1HZoqYivgJ4lZFhhPjL7Jdl8EeCIw1TciGcm4LESmmJTCJamnSEuR1+55D2v
	GFq50jUE=
X-Gm-Gg: ASbGncvB3Kt4tSjJiP95aPh/glMaBxgsdR7WpKfEhTbCbTej+8NoO7AkOqi67UEvnrJ
	33744zwXh81bdNOPSfHTdIYKF72stpBT1a3YRf74bY3b/BzaurNeBXZslqjHQYFukga8d7tnrji
	vUcV+/MyOmXR4ayFqZ92TnzY9mX1MxlKU4HWdQO+AEiKmDiIoZIG5vrXMZO9MrzF8LNn398Zjxt
	qjj/sfsI33Og51RPvP6WrzC6nEwvlsrHcZ5RhX+EHWCUwAfSo3BZoodJ5H9sOI5BWADtPP3b6oO
	L8y6qI+v8a7wa/SEt3BrjQzpjm3bHMGs1oW0ySSjyDmQC1QQvAf1rBum07ZgVWsDEFdPMYksOce
	PYou+4n1tADLIBXuw4EqiJ5qQtWuL8o9ThaBSSNSxQbe7hQW9h0M2zRJ3msz7j7gh36xHOJvl2c
	RL30E6AVn8xj9OewA=
X-Google-Smtp-Source: AGHT+IHBeMDlfBOKn732m6NR/HJ7aB/0xQcFswJOsfLABTW9Dt4SI8MVEv4S1Oz9ywpFQrjn5Lhndg==
X-Received: by 2002:a05:620a:1a95:b0:892:9838:b17a with SMTP id af79cd13be357-8a6f3c36254mr146857185a.3.1761595364138;
        Mon, 27 Oct 2025 13:02:44 -0700 (PDT)
Received: from localhost ([2001:1970:3847:e000:8598:5636:16ad:2a8f])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-89f31bd2613sm645941085a.11.2025.10.27.13.02.43
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 13:02:43 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 2/2] python3-referencing: upgrade 0.36.2 -> 0.37.0
Date: Mon, 27 Oct 2025 16:02:38 -0400
Message-ID: <20251027200238.751241-2-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251027200238.751241-1-tgamblin@baylibre.com>
References: <20251027200238.751241-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Oct 2025 20:02:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225355

Changelog
(https://github.com/python-jsonschema/referencing/blob/main/docs/changes.rst):

- Declare support for Python 3.14.
- Drop support for Python 3.9 which is near EOL.

Reproducibility OK.

Builds OK. No ptests.

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 ...hon3-referencing_0.36.2.bb => python3-referencing_0.37.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-referencing_0.36.2.bb => python3-referencing_0.37.0.bb} (81%)

diff --git a/meta/recipes-devtools/python/python3-referencing_0.36.2.bb b/meta/recipes-devtools/python/python3-referencing_0.37.0.bb
similarity index 81%
rename from meta/recipes-devtools/python/python3-referencing_0.36.2.bb
rename to meta/recipes-devtools/python/python3-referencing_0.37.0.bb
index 388c1887fb..a75f5f80d4 100644
--- a/meta/recipes-devtools/python/python3-referencing_0.36.2.bb
+++ b/meta/recipes-devtools/python/python3-referencing_0.37.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/python-jsonschema/referencing"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=93eb9740964b59e9ba30281255b044e2"
 
-SRC_URI[sha256sum] = "df2e89862cd09deabbdba16944cc3f10feb6b3e6f18e902f7cc25609a34775aa"
+SRC_URI[sha256sum] = "44aefc3142c5b842538163acb373e24cce6632bd54bdb01b21ad5863489f50d8"
 
 inherit pypi python_hatchling
 
-- 
2.51.0


