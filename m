Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A8ECE9E307
	for <webhook@archiver.kernel.org>; Wed, 11 Feb 2026 13:10:57 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18509.1770815448844148096
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Feb 2026 05:10:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=grHip2TS;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-47edd9024b1so67247625e9.3
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Feb 2026 05:10:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1770815447; x=1771420247; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=u0dE2iD1y3gtZA8HJ83htJbNRC6Tn2JDXq96bypUt9Y=;
        b=grHip2TSyYpNpkrrwiqjlet69OrP0l8/SkEexGCHpZPn22xqNDYspGvRg75rOAu+Rg
         Zr26S/O3T0GEX9zGyGcud1LltD1EOZaldysszxCspi8bgrC4o0Ib8Y0eKZpFMdivRwVg
         G7ZSqPVcHT/YjQnuKVC5RzL0XcOKvEhRipFQ4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770815447; x=1771420247;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u0dE2iD1y3gtZA8HJ83htJbNRC6Tn2JDXq96bypUt9Y=;
        b=Umjt6Vxgmd8Pib8kXsfABklbTt4wkdXcH6fKVZyIDM0ZsOAAcf5vtuFAUHX9o5++Kl
         cuI/UPc/vo/kGQkEWBCvRWYeNtk+5sTp/wum5ybM33JnFe4qPN8u1Y0er/tqkrEPn1oj
         TJCEbuNzctNulgiGRehGV4vAqZNs52kLP/81ntX0yQyyfmhUwci4O4rHvLuLoyLxmykn
         W9LbhBuZTkyL1vwon8IuGHlZAbjd3r1qC1JMDYdPk5sESvYT3ymnf9dAhDqW5qCLvRfz
         6EDwVfimib6VeMHAStpxKowkHJB8r7+TOe+nKvohKMTmoy87fUXz08a8oqdmbDCYM2tv
         kVRg==
X-Gm-Message-State: AOJu0Yxoie2ixen65YvrcxcYyBIWEVVOzf+rgbKEqWYzm5br4zEwzWeL
	hnB6jrQrf89iWXpojouomxOuu9j5HBIurnT6c3sd/LodgnQv0vx2+kDvHllzbl7j/9I0BtynqB2
	SRKxpVwg=
X-Gm-Gg: AZuq6aICx3bFVfP99zkSY3bDi63369EEFmrkBhGL45DDjcKiHnOkGGyXt6C/68zmKSh
	p79yGg+KWKGad3H6s9GwkyCPefphqxFcEhFeUvfoMXQiEDpuQNOXoWln4oMoBrTLw2PeWf0T8rZ
	72QdFCE878gAzkOEWpkBoc0TTVQSZ05IdNveivzvZYW9GZCvDgWYN4nogFNvwRUj2MB5OZua+jT
	aNOWWXuJ//H9tbRJ3u0i/hSgvYZZImWVW9hzvWT8lw3lybV8CAtbphs+xuJDKCsmmNQcb9bKl2Z
	WxVFj/bgPdNfNppfmh3APJq6Ew972xj1/iSNsc8HtCsZ0y8u2pNLHQwOp4hrvjf7mI1tqbXll8x
	Fw8ZsN2yDs2day8XUwSXcP4q/8wuor3qYx+SDC+wi0sD1z+ypPSjNmi56Mcb0zdqAVkoDc31X4a
	MBm2wjOAEmRdomuZ9ksC6k8dKMmHupgWPIg6oE/5i+ghM5ABbSOQ==
X-Received: by 2002:a05:600c:3587:b0:477:561f:6fc8 with SMTP id 5b1f17b1804b1-4835b8f80b2mr33338495e9.5.1770815446411;
        Wed, 11 Feb 2026 05:10:46 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:cfe:c2d7:e79b:dfdf])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4834d834ebesm123727265e9.13.2026.02.11.05.10.45
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Feb 2026 05:10:45 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] populate_sdk_ext: Ensure BB_BASHSERBVE_DB_DIR is handled correctly
Date: Wed, 11 Feb 2026 13:10:44 +0000
Message-ID: <20260211131044.1199918-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Feb 2026 13:10:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230990

The new BB_BASHSERBVE_DB_DIR variable needs to be filtered when creating eSDK
local.conf files since we use tricks with the hashserve DB in the eSDK to
create a local cache file as part of eSDK creation.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes-recipe/populate_sdk_ext.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes-recipe/populate_sdk_ext.bbclass b/meta/classes-recipe/populate_sdk_ext.bbclass
index 2838ca1a03b..d17fc3af64c 100644
--- a/meta/classes-recipe/populate_sdk_ext.bbclass
+++ b/meta/classes-recipe/populate_sdk_ext.bbclass
@@ -37,6 +37,7 @@ ESDK_LOCALCONF_REMOVE ?= "CONF_VERSION \
                              SSTATE_MIRRORS \
                              DL_DIR \
                              SSTATE_DIR \
+                             BB_HASHSERVE_DB_DIR \
                              TMPDIR \
                              BB_SERVER_TIMEOUT \
                             "

