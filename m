Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DF61C4167B
	for <webhook@archiver.kernel.org>; Wed,  8 Nov 2023 14:16:57 +0000 (UTC)
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
 by mx.groups.io with SMTP id smtpd.web11.14755.1699453007529542137
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Nov 2023 06:16:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gNeo/KH1;
 spf=pass (domain: gmail.com, ip: 209.85.160.175, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-41feb963f60so7332401cf.1
        for <openembedded-core@lists.openembedded.org>; Wed, 08 Nov 2023 06:16:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699453006; x=1700057806; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4/GcY2HSABPak13s99d6KQ57UfRBd4znsywtNwKmnnk=;
        b=gNeo/KH1UMW4tGwJqFwBpT9NJ6XSAET2ln2ZSRki7gCCX6jvojq4ZGXlJuRA/TYg2W
         mjC4e8i2XBqYfBuegazjj+t/kcjkSuaPxvjOXvk6LCaUrtzh6QSHCfzEWIbgagSbTZpQ
         +pqCqHCZ6Xgvk2V00/UryGg7yGa4nNrthpHjrA4f8mEKxzy7mG9fyFLQ7n7bqeBleuqm
         F5ehTT/+XM6XTInclF3SIAubLVjZ1xmEW++XxjXj9HX8qKUXyQgJDFaX+JnPLTCwXvNa
         q46RXHLWM0RBwfzOusYlwuvP+lSzPT5F3ZtK6RgtUsjrRr7lXgV7b4dqvVwHqZMSHy2e
         TEQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699453006; x=1700057806;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4/GcY2HSABPak13s99d6KQ57UfRBd4znsywtNwKmnnk=;
        b=emFAtiFTdW6ptIWR3baGDRFPg5o3z+yB6GjK53w3LfHu3fET+6Ckb8w4TScshhEgVE
         PFgOTcyiRSvhyYtklAjj2mpynJp8pQGXI7BC+3SHCj73Ui0pJPk0me4KMpITO5naXnqD
         XP6mDfNXIoDwzHfsCS1wLTZN7hQmC95/E5kq2o8uOqClm0TSGfbrTynSVoz9wB4BDBvJ
         Y1Aq1s6wbHGbYPaJRCtA5hgc3i1oGcQ6wao6X5rh4I9TPvmQ9ZVtJgxDMnGKHJpzNsZQ
         V0AkAbXGQ9EPdgd5TgS5WSOwcCJKUEpQxan/yFz3vySrCEvmLAWg38vMEgIAxnYD5PUH
         MJbw==
X-Gm-Message-State: AOJu0YzwlZVIo/O+ssXznJ5C455N/4rNr7a8GZWmqf60ddlCUxRX1kzJ
	YaBfXUj3C0qFAFMzW0nWv7xrgPyNM80rr7QV
X-Google-Smtp-Source: AGHT+IGI8WgQdlUdPQJw6r+hCJhAYnyFgr+Q5KOLb7/8rDG09MrU4PIEaEIJBlvikiR/sIheLIBGCQ==
X-Received: by 2002:ac8:7d4e:0:b0:418:a80:4529 with SMTP id h14-20020ac87d4e000000b004180a804529mr2302924qtb.16.1699453006514;
        Wed, 08 Nov 2023 06:16:46 -0800 (PST)
Received: from build.lan ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id j14-20020ac85c4e000000b004181138e0c0sm921665qtj.31.2023.11.08.06.16.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Nov 2023 06:16:46 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 08/12] kernel-yocto: improve metadata patching
Date: Wed,  8 Nov 2023 09:16:26 -0500
Message-Id: <e62eae56d99ddff005b6049834063d1d4f330230.1699452828.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1699452828.git.bruce.ashfield@gmail.com>
References: <cover.1699452828.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Nov 2023 14:16:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190347

From: Bruce Ashfield <bruce.ashfield@gmail.com>

The ability to patch the kernel-yocto metadata was added to support
debug and easier test cycles on kernel-cache provided fragments. As
such, it was very simple and has limited functionality.

That being said, it is an available feature and can be improved to
handle patches that fail to apply.

The main kernel patching is already handled by the kern-tools, so
we extend the patching of the meta-data to same tools and inherit
more functinality from the scripts.

[YOCTO #15266]

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/classes-recipe/kernel-yocto.bbclass | 30 ++++++++++++++++++++----
 1 file changed, 25 insertions(+), 5 deletions(-)

diff --git a/meta/classes-recipe/kernel-yocto.bbclass b/meta/classes-recipe/kernel-yocto.bbclass
index cb9cd26b09..9a86616dad 100644
--- a/meta/classes-recipe/kernel-yocto.bbclass
+++ b/meta/classes-recipe/kernel-yocto.bbclass
@@ -176,12 +176,32 @@ do_kernel_metadata() {
 		# kernel source tree, where they'll be used later.
 		check_git_config
 		patches="${@" ".join(find_patches(d,'kernel-meta'))}"
-		for p in $patches; do
+		if [ -n "$patches" ]; then
 		    (
-			cd ${WORKDIR}/kernel-meta
-			git am -s $p
-		    )
-		done
+			    cd ${WORKDIR}/kernel-meta
+
+			    # take the SRC_URI patches, and create a series file
+			    # this is required to support some better processing
+			    # of issues with the patches
+			    rm -f series
+			    for p in $patches; do
+				cp $p .
+				echo "$(basename $p)" >> series
+			    done
+
+			    # process the series with kgit-s2q, which is what is
+			    # handling the rest of the kernel. This allows us
+			    # more flexibility for handling failures or advanced
+			    # mergeing functinoality
+			    message=$(kgit-s2q --gen -v --patches ${WORKDIR}/kernel-meta 2>&1)
+			    if [ $? -ne 0 ]; then
+				# setup to try the patch again
+				kgit-s2q --prev
+				bberror "Problem applying patches to: ${WORKDIR}/kernel-meta"
+				bbfatal_log "\n($message)"
+			    fi
+			)
+		fi
 	fi
 
 	sccs_from_src_uri="${@" ".join(find_sccs(d))}"
-- 
2.34.1


