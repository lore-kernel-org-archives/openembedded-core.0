Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2858CAC5BB
	for <webhook@archiver.kernel.org>; Wed,  1 Oct 2025 11:46:11 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web11.15143.1759319161601156728
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Oct 2025 04:46:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DImnYJRp;
 spf=pass (domain: gmail.com, ip: 209.85.218.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b0418f6fc27so1050584766b.3
        for <openembedded-core@lists.openembedded.org>; Wed, 01 Oct 2025 04:46:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759319160; x=1759923960; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3w3aFueztCxwKs1W4oq9pzSuu+36r9oLK0m4YaWMv/k=;
        b=DImnYJRpOZRAMHfJn/6LuJil+x58bxhhy7loHDacXEcYJNddLh39QyNwMjpxWuztRU
         FGTEQMBRD9402jio/87RdunU8WYdXK0WpFJdIIYkY+M66PhHItxJFxPMOUbZm+cb6vH1
         gx9KukKdHyx/6KsU3yyzGceXngnaGpnhEKrwxKkdHHlnwOcPvD8mB76S2tEzDVNlTi/U
         fAnG7Idgz9l352m1V9Or9HIH6+B17ZlXzi83/Z+l47BQz7wv/LBk9HYUHE1yM0xURu5u
         YeY8kaAcOM26dCLbeDFL/eEtmgE+78OOBUInNLHB/Ag9NsPOHT52NWfYpnfN2hUgnEbP
         X3ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759319160; x=1759923960;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3w3aFueztCxwKs1W4oq9pzSuu+36r9oLK0m4YaWMv/k=;
        b=fUdiz9x/ZOrVCncuCOpxKKpb2fWJAMmMCUGQlMKDI3YSRCFVnqhNdXWQ266hoGrxj5
         7W+XRIVfSmCSZ3qqbwPIhNg6wqszZ/RuBZ4aJNy4R2PCwrXpq1Eq9WO+mqIbwp+tRQKm
         +fOBgCWAtohliQr1Srd6KsorSGc4tXEv7tQMEg9vR7EUrDkJuIAujs+BIgWCcJrTBZM2
         sHKbUXZ9cSKriO3iaHY2UO+abp9uEtxrGlZGzg1WMv//3MkbmyUqHLaY0e0RoYV0cmQG
         nadglMl4GnvLmCRD5ZCOx0Rlg5Wdf/N5OyEU0+CAcX9KH8EYP6edjLS3xi4W9qBNzc/x
         evuA==
X-Gm-Message-State: AOJu0YyniEijjw3CNTj30XwkvhQUeoAxGDhUQeZfUeYVLF83A6bPZBFz
	LKtZwqTiFdvMFaaqXFZCyTTcTLBax40cSMVATlqfxASX6mVEEwh33AvLVKlhLg==
X-Gm-Gg: ASbGnctzdm4YcbWWW6JK3SipdPsyCEDyvqNgZlTfrcFtX2ohTs/PouIQgFAkCvxDI5P
	c0DhsQ/UM4LhQhkhkxS0ktyr2q9duwjBrxqx4gdlJDZnOAVZ4xdlb3ctf9tX9w8cd6MqWmuITQ7
	lF0UZ7Px2pu8T0TjRjiQs3qYpVAYaSoQwvPkfEJKnC1nlAZJ1hAjDTbFZrXT/MKm3HwVSHbim/I
	s5EGuCnFYZNuHy7fKf40QaQAxlnUw/rcGnfybLuMfomqbW9nJ1uhVJyJmOw88wCkAXrZUd28piF
	29aWuRAnZGi395L2jpZHeoSj0LwsCPjk1nQjHsvA+7wv8tXho2mQcTS4vnSHNLIPigixSJI7wyV
	7FWXLz2LtME4xT+6x4TiB6FTT8tq8OaT0PoG8OACBV1w2W36MqvrhPnMow/IHI6iOvcpsrnYrJn
	ai8bpTTLHE6HP9Ggo6dSjEK64okVRk8N25llR0IX4UUyXGNw1S+05kAyOhqE+zlXLjYqvwpsFGi
	9odFiXaCw==
X-Google-Smtp-Source: AGHT+IEaDQ2fHCcoUKBpy88UKqhw+guiYFT9jEg42hLWgCuwnlupy967VDLsK2y3C+54Lzi6XXraVQ==
X-Received: by 2002:a17:906:730a:b0:b3e:e16a:8ce6 with SMTP id a640c23a62f3a-b46e0daafdamr400376566b.11.1759319159605;
        Wed, 01 Oct 2025 04:45:59 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b41f5ed2cf2sm401556666b.36.2025.10.01.04.45.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Oct 2025 04:45:59 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH] populate_sdk_ext: do not require CONF_VERSION (e.g. local.conf version) to be set
Date: Wed,  1 Oct 2025 13:45:40 +0200
Message-Id: <20251001114540.3283918-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Oct 2025 11:46:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224207

From: Alexander Kanavin <alex@linutronix.de>

The version checks for local.conf/site.conf/bblayers.conf are all optional,
and aren't enforced (by insane class) if the versions aren't set.

As bitbake-setup writes out a blank local.conf, it doesn't put a version in it
either. Also, esdk bundle has a fixed set of layers and is not at risk of
needing to update its own local.conf.

The same condition is already in place for esdk's bblayers.conf for similar reasons.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/classes-recipe/populate_sdk_ext.bbclass | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/meta/classes-recipe/populate_sdk_ext.bbclass b/meta/classes-recipe/populate_sdk_ext.bbclass
index 20dfdf02d42..36a3e9c836d 100644
--- a/meta/classes-recipe/populate_sdk_ext.bbclass
+++ b/meta/classes-recipe/populate_sdk_ext.bbclass
@@ -345,7 +345,13 @@ def write_local_conf(d, baseoutpath, derivative, core_meta_subdir, uninative_che
             if bb.data.inherits_class('uninative', d):
                f.write('INHERIT += "%s"\n' % 'uninative')
                f.write('UNINATIVE_CHECKSUM[%s] = "%s"\n\n' % (d.getVar('BUILD_ARCH'), uninative_checksum))
-            f.write('CONF_VERSION = "%s"\n\n' % d.getVar('CONF_VERSION', False))
+
+            # CONF_VERSION may not be set, for example when using an empty local.conf
+            # generated with bitbake-setup, and it is not otherwise required to exist.
+            # Write it out only if it's defined.
+            conf_version = d.getVar('CONF_VERSION', False)
+            if conf_version is not None:
+                f.write('CONF_VERSION = "%s"\n\n' % conf_version)
 
             # Some classes are not suitable for SDK, remove them from INHERIT
             f.write('INHERIT:remove = "%s"\n' % d.getVar('ESDK_CLASS_INHERIT_DISABLE', False))
-- 
2.39.5


