Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AA63C001DC
	for <webhook@archiver.kernel.org>; Wed, 14 Jun 2023 09:29:44 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web11.7471.1686734974616319463
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Jun 2023 02:29:34 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=VWOlrqrH;
 spf=pass (domain: gmail.com, ip: 209.85.218.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-977c89c47bdso84835766b.2
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Jun 2023 02:29:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686734973; x=1689326973;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jqa2mkWcTNJjnvI8jfRJVZG0p7QDLLCE2hNYPyc9cto=;
        b=VWOlrqrHKcd8t+ekP0Ft3onPSHqBFsk6wetQnCbatsauqXf8s82w0cvn75VeEMfUI+
         ZF49eylHi5rSSuANsTpoFzqa3tCyQqRkzxmmRSBnuOScks2YthFq4nKbhxp0Xq4R44jD
         FHjVj6aQcmtru69jdzAQzxE5jAySOf7MqiFIe+bkurPA4vkPqXyKXh61yd+4HQf1uXL5
         k9ih0irQGeuVIQ20JlMj93hc+wiiKRrdmQL1DpfOnHB2V31E+XAymhvDZBy4ExQr2/2Z
         2MaYk149wxLWBbMaLGQnt7NOqLgTklDVHucU/6DN5OvlBIA+MW6TpVK6v9vqYl03Wx7I
         p6Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686734973; x=1689326973;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jqa2mkWcTNJjnvI8jfRJVZG0p7QDLLCE2hNYPyc9cto=;
        b=J0g4qdX7PIK5dr3T9oUXSUrPJEpzBpsblSyRR8D1VqmNoKZ7T62qEnCRVndr/PAvhf
         yePFgD1XcfKQ9zcdqXTfAonphuk1Pnr/SngWNYWMZ803vsTn7EN4f9Fn7jqVeSeZvXfL
         t3JqYFBaCa3gWqbMI/n8i3KFWjBLbsvbrTuRU0qk7pQvQtVwN7Q948IPze8FqJhKh1Ka
         ovIjLWyqiktnvdWBoHZWL+iPd/SoxJ4uTOsn0ykUuJKXYEeGR5JgamNiqIsqqnNMPWGd
         jTYoIb6NMEIRcKvpqW67lM98nMluHvEmUTYrK++DQ9BTC9N4lsp5OWKM56/6Z23mEA7L
         BBpQ==
X-Gm-Message-State: AC+VfDymaCUH+y8OK5ECjGFWAeXSuFLv/Q7eXBNSQQh22puUGWLqpEQV
	LQmlShxWACE0WmfwEKdtfLVs+bzh7TQ=
X-Google-Smtp-Source: ACHHUZ5lissB6/obt4C2m7lTjkzyy6/NexEV50e2Sgh8sgWQ0pKCMXXUSgdNNirsizMBJGuLR/alrA==
X-Received: by 2002:a17:907:2d91:b0:97a:bd0f:ac74 with SMTP id gt17-20020a1709072d9100b0097abd0fac74mr15533185ejc.26.1686734973036;
        Wed, 14 Jun 2023 02:29:33 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id k19-20020a170906129300b0097381fe7aaasm7747375ejb.180.2023.06.14.02.29.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jun 2023 02:29:32 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 12/55] attr: package /etc/xattr.conf with the library that consumes it
Date: Wed, 14 Jun 2023 11:28:35 +0200
Message-Id: <20230614092918.4065570-12-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230614092918.4065570-1-alex@linutronix.de>
References: <20230614092918.4065570-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Jun 2023 09:29:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182757

This matters for example with latest coreutils where cp
wouldn't copy extended attributes by default if the config
file specifying that policy is not there, and so ptest fails.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-support/attr/attr.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/attr/attr.inc b/meta/recipes-support/attr/attr.inc
index 8ba865a74a0..e8835398afa 100644
--- a/meta/recipes-support/attr/attr.inc
+++ b/meta/recipes-support/attr/attr.inc
@@ -22,7 +22,7 @@ inherit ptest update-alternatives autotools gettext
 
 PACKAGES =+ "lib${BPN}"
 
-FILES:lib${BPN} = "${libdir}/lib*${SOLIBS}"
+FILES:lib${BPN} = "${libdir}/lib*${SOLIBS} ${sysconfdir}"
 
 ALTERNATIVE_PRIORITY = "100"
 ALTERNATIVE:${PN} = "setfattr"
-- 
2.30.2


