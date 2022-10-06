Return-Path: <fede@evolware.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2084C433FE
	for <webhook@archiver.kernel.org>; Thu,  6 Oct 2022 04:02:55 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com
 [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web09.2014.1665028971854423371
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Oct 2022 21:02:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=lrdIyA1s;
 spf=pass (domain: gmail.com, ip: 209.85.218.45,
 mailfrom: fede.evol@gmail.com)
Received: by mail-ej1-f45.google.com with SMTP id b2so1842844eja.6
        for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Oct 2022 21:02:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=Hh8aGWSIqFKQyt9X4lPrkE0QxlU6oe5+GFfux8xOCPc=;
        b=lrdIyA1su6LvUDiMI/LJLCFBAifmM5T2kgyV2FI5Z8JOT4CwHzXpkdYe9k2MAtLHzU
         fqzfOdxx5NAj3ERgHimZ204ZDKb2SNAnOZNKJ9gRn922w4aQv7cwI3+x0RVSxR9IDjLr
         K3RCARZiVT5EX2PPfRXRy+HuC2+eDdDkdy/ug/ZltLYRMs2X8rcc/mMisB7y3ZjRuAzu
         kczkTynR6ul7XluqjoY1swGhwGtjjfTkEifNvAqLtarcmTTn/roTrzg6D/lqTl2RhYBG
         Whpu3JD2DBacVai/Zr7+g0d+YjoUc9848Hq9w/pq7/7INRTuZN6dOIXeB+sJQSdrd3nE
         4z4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hh8aGWSIqFKQyt9X4lPrkE0QxlU6oe5+GFfux8xOCPc=;
        b=HDHzSPpmWz/9i7eby+dQvqcydIeF82MNGrSyk9JfB8tuEpzjYciNUY4sHyVe5O1Dtz
         nzId6pIPwFECF00xAVa6lCCVJC7T5h8OSPpa3xSbHwPgrWNflu87xJHMM6XLOOdZKEdT
         0pOkHs+gQgqUkr1BSlxevnv16LQqBh8XUNQ+rfalgkZyl6JCjuQguw8DNJR+of0qxKe7
         hO9+yiiJ9oxikABvcVo87oVzvCds3C5AcRz5BXEVgPVtQ5EICSXN690ge4ncKn+WwYYW
         vZ6yZNiYUrD5hqbbx/5P5hZyNtO/AbOYl8Vc+RnGVm8V7vNVpW8TCwvOFgsJZsJgs3tF
         cH+w==
X-Gm-Message-State: ACrzQf0oeNUmnUD2gAsNiGM0Phd7GbEJyalzpCVSZ2wninj6IChh0kEJ
	D8Dtt8+6AE9Ay4dTYLqitpxKXS19I1mlrw==
X-Google-Smtp-Source: 
 AMsMyM4dEGtLw6ebYNcJRQjWKsJKy8SWh2oVfdC7oMn9geKczQWWBFuCRmtjvKrDU+n/aizrbaoRuQ==
X-Received: by 2002:a17:907:75f7:b0:77b:4579:2aee with SMTP id
 jz23-20020a17090775f700b0077b45792aeemr2331125ejc.529.1665028970272;
        Wed, 05 Oct 2022 21:02:50 -0700 (PDT)
Received: from interzone.fritz.box ([2a02:2455:e61:4a00:c805:5e99:7773:8f9e])
        by smtp.gmail.com with ESMTPSA id
 p13-20020a05640243cd00b0044f21c69608sm4902095edc.10.2022.10.05.21.02.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Oct 2022 21:02:49 -0700 (PDT)
Sender: Federico Pellegrin <fede.evol@gmail.com>
From: Federico Pellegrin <fede@evolware.org>
To: openembedded-core@lists.openembedded.org
Cc: Federico Pellegrin <fede@evolware.org>
Subject: [OE-core][PATCH 1/1] chrony: add pkgconfig class as pkg-config is
 explicitly searched for
Date: Thu,  6 Oct 2022 06:02:44 +0200
Message-Id: <20221006040244.96372-1-fede@evolware.org>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Oct 2022 04:02:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171479

The configure script present in chrony will explicitly look for
pkg-config and without the pkgconfig class it will fail:

Checking for pkg-config : No

This then affects the possibility (via image features or bbappend)
to use features based on nettle/gnutls/nss which strictly require
pkgconfig to be present and working.

Signed-off-by: Federico Pellegrin <fede@evolware.org>
---
 meta-networking/recipes-support/chrony/chrony_4.3.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-networking/recipes-support/chrony/chrony_4.3.bb b/meta-networking/recipes-support/chrony/chrony_4.3.bb
index 083d2cbc0..dfdb7864a 100644
--- a/meta-networking/recipes-support/chrony/chrony_4.3.bb
+++ b/meta-networking/recipes-support/chrony/chrony_4.3.bb
@@ -47,6 +47,9 @@ DEPENDS = "pps-tools"
 #       chrony does not use GNU Autotools.
 inherit update-rc.d systemd
 
+# The configure scripts explicitly check for pkgconfig and needs it for gnutls/neetle/nss
+inherit pkgconfig
+
 # Add chronyd user if privdrop packageconfig is selected
 inherit ${@bb.utils.contains('PACKAGECONFIG', 'privdrop', 'useradd', '', d)}
 USERADD_PACKAGES = "${@bb.utils.contains('PACKAGECONFIG', 'privdrop', '${PN}', '', d)}"
-- 
2.37.3


