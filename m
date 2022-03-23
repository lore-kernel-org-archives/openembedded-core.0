Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C291C433F5
	for <webhook@archiver.kernel.org>; Wed, 23 Mar 2022 14:24:16 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web08.9764.1648045454895699308
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Mar 2022 07:24:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Mc9effq2;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.51,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f51.google.com with SMTP id n35so1043069wms.5
        for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Mar 2022 07:24:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4t9Tjk+hhQwfctAsRieqsWixSYmISmpqWl0Si5RumS8=;
        b=Mc9effq2KV5ZWyb19/OcRfDtityBLXOUXpGhfOOR0fNXlPfsjhBQ7RD2rW5zmvDqAF
         pTFnbcSY7EBt/zI85hSVYfOEVtLP9zKVWE4iAlP5KrzBvHKXtPdk2MJWXyoZpC28Ce0E
         HffZDDBNGZhJH6mTZa18s0nkMEf86Wh8j2fX0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4t9Tjk+hhQwfctAsRieqsWixSYmISmpqWl0Si5RumS8=;
        b=iaMoXaBgn49slN/om0c+928W0fMKd7hN5zPxRIqHGd/5AaMKuIuFmP/BPXNCEmYgHQ
         WYLK9il+S5TRtzglhiJjpgUBvVbyu+QM4ShTCiCoQsAcdd/zSWv723YjuOHfhCPZeLsM
         uCkLFXwrqTZBVIDlCKjGfJD6rUl87mc6go91FS73b9pKG+U1ePCnCQo+8WcczPRyTn+C
         ZRjXU+sevK3DXFKTGAGO46DRONDnmxvYgSXOKMru/hzO1YRsjR9ZirGYdVOYvWL2qVaS
         qkU1SzgVQNZosFMi7GMuBnXHnOAz4UcJuviddK0qZeyC1OlYE5N30Y4KxKDX+KuflLCi
         Jwsg==
X-Gm-Message-State: AOAM530HosKZ/XjdUxNW/fScBoRb04hh1wp9j0jrRlOXL5tMk+HKaJS6
	vAcIVEkIifNQNZZG8Dn4kbwqyXPAGVMOWH4q
X-Google-Smtp-Source: 
 ABdhPJyl7M2FZiQraZQYBAwfTVHfTzMooaFiZvyhqSUTZIITuhWM98f8Y6gSoOSAEgD+SO6DQFVvjw==
X-Received: by 2002:a05:600c:214a:b0:38c:aa5d:1872 with SMTP id
 v10-20020a05600c214a00b0038caa5d1872mr9976451wml.9.1648045452551;
        Wed, 23 Mar 2022 07:24:12 -0700 (PDT)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:aaba:716e:9c38:ad87])
        by smtp.gmail.com with ESMTPSA id
 k2-20020a1ca102000000b0038c78fdd59asm4158488wme.39.2022.03.23.07.24.11
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Mar 2022 07:24:11 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] sanity: Add warning for local hasheqiv server with remote
 sstate mirrors
Date: Wed, 23 Mar 2022 14:24:11 +0000
Message-Id: <20220323142411.1277228-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Mar 2022 14:24:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163584

We're seeing a lot of users configuring an sstate mirror but not realising that
the default hash equivalenve setting will make this ineffective. Add a warning
to highlight this to the user for the common case.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/sanity.bbclass | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index 92807dc88e9..be956fbcd6c 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -914,6 +914,11 @@ def check_sanity_everybuild(status, d):
                     mirror_base = urllib.parse.urlparse(mirror[:-1*len('/PATH')]).path
                     check_symlink(mirror_base, d)
 
+    # Check sstate mirrors aren't being used with a local hash server and no remote
+    hashserv = d.getVar("BB_HASHSERVE")
+    if d.getVar("SSTATE_MIRRORS") and hashserv and hashserv.startswith("unix://") and not d.getVar("BB_HASHSERVE_UPSTREAM"):
+        bb.warn("You are using a local hash equivalence server but have configured an sstate mirror. This will likely mean no sstate will match from the mirror. You may wish to disable the hash equivalence use (BB_HASHSERVE), or use a hash equivalence server alongside the sstate mirror.")
+
     # Check that TMPDIR hasn't changed location since the last time we were run
     tmpdir = d.getVar('TMPDIR')
     checkfile = os.path.join(tmpdir, "saved_tmpdir")
-- 
2.32.0


