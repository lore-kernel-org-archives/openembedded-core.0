Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE058C43334
	for <webhook@archiver.kernel.org>; Sun,  3 Jul 2022 19:38:55 +0000 (UTC)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com
 [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.web10.64486.1656877128364448258
 for <openembedded-core@lists.openembedded.org>;
 Sun, 03 Jul 2022 12:38:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=pzmb7eoS;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.171,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f171.google.com with SMTP id s27so7090546pga.13
        for <openembedded-core@lists.openembedded.org>;
 Sun, 03 Jul 2022 12:38:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=Ed9jSZxexUINZfFX6d6aQHWqb8kYSOPvVfP43k8aJ1E=;
        b=pzmb7eoSfvsJZT6sIwzX21HlZMbTbfRXVq0WXSkOef8igoQe3SeY8m335szau0P0ox
         paN2ka2BsyNFGJTog2uGGZ8eVFcAje+UIoZblowO/2mq72bOppVpKYP1l1lb/bYG0jbZ
         fx9bnWJ2PxZkTr8aOZjvYX7tCWslK8zX22YJ9LxcZXbkSbdoYrtyMRXgb5tbsRlyjekt
         68mSag0pIVHTQoH6gWX+B/FpkvmFu8LtU4vI3JU7BcFuw7ffE5ViGqnpP2xHolQF0ha0
         1wWnjqqMSEYBryibgq/71qS4SLiEDiemxiPQCYapZDUHkmT09nGuHzH0MTI78ynmiNqF
         reBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Ed9jSZxexUINZfFX6d6aQHWqb8kYSOPvVfP43k8aJ1E=;
        b=CXO4Nc+iWgVawd+VXhHR6jFHt8nxT/UvxmNddS0QqNrWHEy6MaHLxpp6wQGUW6iCN2
         020LyUM1F+hKdcwc1eCkiDh05OVKjYC3KxQgPHLHzW2GKEXWG+rwobgIBzRlp8qKex9Z
         9PAJ63NL07rJdd0v6KdJFjNzQGzJ8kEYz1rBgz4HY+Z4+fJIGGP54KXL7Ssq+JE5CqWh
         JQQFbvIzMu4T8oUT5X2vXslPM82h3kt7FkmDvGqeflDbQK0RqD0hxjv95l91uIQtuICT
         ROQJH5vplRMFRZ89v513yaCmnCm2DwFFCPeLJa01y1aweRYIiD7FTX+NYsUqsWwPGfMT
         m5hg==
X-Gm-Message-State: AJIora+GjbNV3vJYtlL3K4Q7BJ4zXPsYWyfJAjA1ik88ry9wwIabFh3/
	NwT5fCrBZ1mV2SF6j/LaPdX/OyjheZ0euqf1
X-Google-Smtp-Source: 
 AGRyM1tC+VrJrWNRYoD6GlXFHpiQHhCuRkLzLsFva+X3rXfO3EjC/3HjIgeWFkpn4cClVNDTbOn6rA==
X-Received: by 2002:aa7:86c9:0:b0:525:3d39:8d0f with SMTP id
 h9-20020aa786c9000000b005253d398d0fmr33048155pfo.54.1656877127177;
        Sun, 03 Jul 2022 12:38:47 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 d4-20020a170902654400b00168aed83c63sm19441739pln.237.2022.07.03.12.38.44
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Jul 2022 12:38:45 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 30/30] dropbear: break dependency on base package
 for -dev package
Date: Sun,  3 Jul 2022 09:36:05 -1000
Message-Id: 
 <4667abcc925ae0c430cccb480ec530506f6201ae.1656876825.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1656876825.git.steve@sakoman.com>
References: <cover.1656876825.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 03 Jul 2022 19:38:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167590

Otherwise the SDK fails to build as the main openssh and dropbear packages
conflict with each other

Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/dropbear/dropbear.inc | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-core/dropbear/dropbear.inc b/meta/recipes-core/dropbear/dropbear.inc
index 78f9f9adbd..2d6e64cf8d 100644
--- a/meta/recipes-core/dropbear/dropbear.inc
+++ b/meta/recipes-core/dropbear/dropbear.inc
@@ -12,6 +12,11 @@ DEPENDS = "zlib virtual/crypt"
 RPROVIDES:${PN} = "ssh sshd"
 RCONFLICTS:${PN} = "openssh-sshd openssh"
 
+# break dependency on base package for -dev package
+# otherwise SDK fails to build as the main openssh and dropbear packages
+# conflict with each other
+RDEPENDS:${PN}-dev = ""
+
 DEPENDS += "${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 
 SRC_URI = "http://matt.ucc.asn.au/dropbear/releases/dropbear-${PV}.tar.bz2 \
-- 
2.25.1


