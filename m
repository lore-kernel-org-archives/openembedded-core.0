Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com [209.85.214.193])
 by mx.groups.io with SMTP id smtpd.web10.9782.1605627280785848842
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Nov 2020 07:34:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=tgEdmqfL;
 spf=pass (domain: gmail.com, ip: 209.85.214.193, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f193.google.com with SMTP id 18so973592pli.13
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Nov 2020 07:34:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9P97SKJGuwPDECjD6X5AU5tno0BCQIb7D7MRwvyAnUc=;
        b=tgEdmqfLGnJw8rVu55CIMDnI7pq/HOnHoTBeBOp0lRI+ihuRyXstQdOUL7swzH6Wqt
         6Wlt5P6oCiPeEVG+Ufoly6oHoriNntFj/9WQs/9hgVMGFjz0GlgM3Tm9GRNtD7EIw480
         U7kM/wL23XlaU1v5HL4vM6IFeB3KS6KI/2KFL4i1f54DDR8ZwmgYRuP4E+7S4piU/riu
         0v/gUWPt8HCkAL0y2EN06tNRJIIMWp18GRg7PrH7LhMrH7/5IMuJBIjxdbzbpAELtpXb
         injxDNOuINcXBEhfopm2YieWpLrIceC1mm9/y9PbPoCVnEiMFbAEKXrkzS2gL5WZkC7w
         hRVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9P97SKJGuwPDECjD6X5AU5tno0BCQIb7D7MRwvyAnUc=;
        b=A5PFD6/jNNU8xHBsL90hSC8mTaJgD/ZJdRw3g+Qzi85PzMy/GCex89KYPYPO9nZDC2
         vcHfE3J4N01R8W/X4uWLmAkRZR76VYRNbSRzCeM5edm1NZZ6/8B6GWBHcEyaDT6kONYD
         BVeXvYRkDaAI0YbQH1DCGWuOQAel2yaVgbkfSoCozQfZznJppDhRcquojsIzgxRlMng5
         r7aPEuIMAeTrjxsGYiOxb+Uvg1Jc+e6xwzT58dmxstoUy+mQX5YhcvJoBp41Y4br21I2
         JS4efZ8s0OUg4gbYPp2fbUKA3VILdiJG2UiGIn4uSsvWYhN2NCMZO2GJ5htgK8bvz1g4
         gtNw==
X-Gm-Message-State: AOAM531qxPG0ZeFZPCs3fFk/bJ+I9FKlG3ZP62xS+gTsxlpqnQt91VYw
	ACMOXQfaF4IVHTONdbYjjHq1Gogo60hWDw==
X-Google-Smtp-Source: ABdhPJzG8nBr13+p4Cg2rMcMRtKv1wEiMS+6agiqZeQ2Q8j22jY043Q9W3MBFV8peLLRKB9fOBRvbQ==
X-Received: by 2002:a17:902:aa06:b029:d8:bc5b:612b with SMTP id be6-20020a170902aa06b02900d8bc5b612bmr174848plb.50.1605627279953;
        Tue, 17 Nov 2020 07:34:39 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::4611])
        by smtp.gmail.com with ESMTPSA id l8sm3649981pjq.22.2020.11.17.07.34.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2020 07:34:39 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Alexander Kanavin <alex.kanavin@gmail.com>,
	Martin Jansa <Martin.Jansa@gmail.com>
Subject: [PATCH] python3targetconfig.bbclass: Add py3 dependecy only for target recipes
Date: Tue, 17 Nov 2020 07:34:36 -0800
Message-Id: <20201117153436.3701771-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

python3targetconfig append target python3 to dependencies
unconditionally, and here its inherited unconditionally too but
distutils3-base is inherited in BBCLASSEXTEND'ed recipes and other not-target
recipes as well. Hence the change added via 9c8f666097802cb594a759989edcf01603a22df3
is now bridging the native dependencies with target python3 and thats
resulting all sorts of rebuilds for multimachine builds e.g.

MACHINE=qemuarm bitbake python3-scons-native
MACHINE=qemumips bitbake python3-scons-native

results in rebuilds for python3-scons-native

bitbake-diffsigs shows

Hash for dependent task python/python3-scons-native_3.1.2.bb:do_populate_sysroot changed from 1cdb93193b416477df6faa137e83a967b433c7aa29033146b405153f73f36933 to 3cea1e7cbedd121ecb768fbc291cc4e4d7d3b5c0442897
0e3b97bd058d162065
    Hash for dependent task python/python3-scons-native_3.1.2.bb:do_install changed from 8d6018fd03ffc6060a04532dc39a5b7ccca1be026a69d069cb4fb11aef86dd89 to c5f1d173596a8e910f45a2b6e0b4dab96cd0102be4d62bd3156
229cb0f5ebb11
        Hash for dependent task python/python3-scons-native_3.1.2.bb:do_compile changed from e3ee4b52a15267e6ae7853ec19a666b2fb62608a597608793336382d1c45f8a0 to 1e582043dfe6b3e00aaa532f363ce6afb37652abe837dac
7cc9769194c43eae1
            Hash for dependent task python/python3-scons-native_3.1.2.bb:do_configure changed from 770a4d5a77a96ebd9e1e7368f710bca3f88e3b1266dffa3b2d0360b1e3a81e27 to a366982778b03eee5165c3117ee778f848acdfaa2
b346650fbdf114ac70ab57b
                Hash for dependent task python/python3-scons-native_3.1.2.bb:do_prepare_recipe_sysroot changed from 958910037856ff5d5eb2b5162b3cdd02a3a710fc543b933cfeba771ee095cb72 to 474333fb565f908992fd3716
4935aaecf31a79e867826fe634cde4f44171d8e7
                    Hash for dependent task python/python3_3.9.0.bb:do_populate_sysroot changed from 7ac1c4fcbb2eacf98d2c32d991751bd2f3c7d55e2e32f2c9e485e7f5975fecf8 to 25dcfe74a95af19cce8df7c29311cc5edbbf6ad
08777e46a6fa6e417c0445018

...

Therefore limit inheriting this class only for target recipes.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Martin Jansa <Martin.Jansa@gmail.com>
---
v2: Mark depends conditional instead

 meta/classes/python3targetconfig.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/python3targetconfig.bbclass b/meta/classes/python3targetconfig.bbclass
index 640d0c97b6..b79ec211c7 100644
--- a/meta/classes/python3targetconfig.bbclass
+++ b/meta/classes/python3targetconfig.bbclass
@@ -1,6 +1,6 @@
 inherit python3native
 
-DEPENDS_append = " python3"
+DEPENDS_append = "${@['', ' python3']['${CLASSOVERRIDE}' == 'class-target']}"
 
 do_configure_prepend() {
         export _PYTHON_SYSCONFIGDATA_NAME="_sysconfigdata"
-- 
2.29.2

