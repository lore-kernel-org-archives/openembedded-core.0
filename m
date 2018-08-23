Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm0-f44.google.com (mail-wm0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id D1E8F79540
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Aug 2018 08:25:01 +0000 (UTC)
Received: by mail-wm0-f44.google.com with SMTP id s12-v6so4365114wmc.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Aug 2018 01:25:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=CRqLE/cwHdfSJDh61T38hXf8vVD/D03ZkVtFs4zpTks=;
	b=PlMJRXP0aGN6+FosHuyDDvaAbnyA7G8Jg8VZVQJgCcqIDQq2+lhOXJ+vqqSQO96KNr
	3rzoh5rMnbhQbIW/VXYo7YSYxs90NJxGNCkP8Kk7ElqT1g71pKhiou0Uzv+GwmeiUmtU
	scYWgz0fnwQeRekdvL6zcr8WxQy7cJn6HsgQs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=CRqLE/cwHdfSJDh61T38hXf8vVD/D03ZkVtFs4zpTks=;
	b=o0OS+fyE8ah36AUE/kZbqo5XG6FKOP0+46PtFfaLy7O0Rl2lBaBU+4pkKn6ZqWJkUS
	NWioAF7HOxW3huC8c52oFRR5GONwxgc19AUGEh4Dg4Z66BoFR21nVNi1xHCa9bUZiE8/
	47YY+w2axFy+LnEiOsxmPUUruN9kfLxeODqt0BV1J6+/AVEHQXhidOX67EZ3uHg7bc7W
	srm8xUG7DVuQguZTTdFzuk2tnAOFe+HRcjpMGvoqm5s7l1Z1B3mZ1VEb8pyaTFh59qBL
	FKSmnwe4ANKVrblPZ/SR07eZJmSfvK7NsXCDWAVxTxJ9waD/YjzrbbapCxMkih/1Wnvz
	nj1g==
X-Gm-Message-State: APzg51BnNl/N2/ml6IRDYQ5k++BWQBeWT1JKc1+5rkkgNCXuyBphe9fu
	UmZCdJ2Yk5qoRNXWmZozdVpdTHxz8xM=
X-Google-Smtp-Source: ANB0VdYjZZ8gH79tEod69SBcNB0xaSWgmFtBjnAlMtsx270fYz+rCJFfqRVRVvpOLkrNwcLwFj28Ww==
X-Received: by 2002:a1c:a60e:: with SMTP id
	p14-v6mr4763156wme.64.1535012702335; 
	Thu, 23 Aug 2018 01:25:02 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	p11-v6sm1316860wrd.74.2018.08.23.01.25.01
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 23 Aug 2018 01:25:01 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 Aug 2018 09:24:55 +0100
Message-Id: <20180823082457.32062-3-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180823082457.32062-1-richard.purdie@linuxfoundation.org>
References: <20180823082457.32062-1-richard.purdie@linuxfoundation.org>
Subject: [PATCH 3/5] lib/oe/utils: Fix get_multilib_datastore to work for original tune
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 23 Aug 2018 08:25:02 -0000

Currently the original datastore returned by this function doesn't
always work as the tune isn't set back to the original. Fix it
to work like all_multilib_tune_list() in utils.bbclass and correct
the data returned.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oe/utils.py | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/lib/oe/utils.py b/meta/lib/oe/utils.py
index 814ac0fd51c..f22a6ab596d 100644
--- a/meta/lib/oe/utils.py
+++ b/meta/lib/oe/utils.py
@@ -368,6 +368,9 @@ def get_multilib_datastore(variant, d):
         localdata.setVar("OVERRIDES", overrides)
         localdata.setVar("MLPREFIX", variant + "-")
     else:
+        origdefault = localdata.getVar("DEFAULTTUNE_MULTILIB_ORIGINAL")
+        if origdefault:
+            localdata.setVar("DEFAULTTUNE", origdefault)
         overrides = localdata.getVar("OVERRIDES", False).split(":")
         overrides = ":".join([x for x in overrides if not x.startswith("virtclass-multilib-")])
         localdata.setVar("OVERRIDES", overrides)
-- 
2.17.1


