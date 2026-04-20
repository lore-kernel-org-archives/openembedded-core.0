Return-Path: <corentin.guillevic@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7254F588C6
	for <webhook@archiver.kernel.org>; Mon, 20 Apr 2026 13:38:21 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19857.1776692299690745587
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Apr 2026 06:38:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=atZctZJw;
 spf=pass (domain: smile.fr, ip: 209.85.128.42, mailfrom: corentin.guillevic@smile.fr)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4891e86fabeso10910585e9.1
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Apr 2026 06:38:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1776692298; x=1777297098; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SN2p5eCc8BVg0nKvIhDFA20TBC8+suQJvypcbtjvwPc=;
        b=atZctZJwxn2qwgnUIwShS79MBWclQadt61AIfu2N/ow10Bdy5fKu3CKTCkPoOMn4Ml
         xOENZmGSPISMRyKTPA0nFXEtvnZbfVWgiZAjbBvfPQJS6iPjT8MQlOKWLm0JEyXEUT7y
         ohSLqSB1KkB9n7NLplc/2GOp1EKvGPCeF/1rk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776692298; x=1777297098;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SN2p5eCc8BVg0nKvIhDFA20TBC8+suQJvypcbtjvwPc=;
        b=NH4El+2FiWjvbP4CnvKoOAAkb3E/2/SdYHM7jFtyTxLZI3wlSY1jlORVqrRXxw+H8n
         nFEdz67gEogt2QNRYGSkAfURNzSRNRQ350ZtFJ5amngMvtCqiGl1fao+RMGxNMgQx1rt
         x234XR1cfPWjd7Lp9mF5tf3doPBaxBU7h0V08LeDJn0OUBLhPzREjUhM8FU0Q8ZzagTX
         cwSX+QqlukElT8Q6w9xhRqAtF4wI37PWbg6mr0A2+hf05yAWjcmfXwXyipOONWXjDhrV
         37b/uJgSgAjfFjeS7SdZNQ1sBBs4FIOwtX+nuJo7Am1zS9yIC1rE1o5ZgShUvbsDwkRQ
         HNEg==
X-Gm-Message-State: AOJu0YzXrjqiWa0yQmxRW22U4Pw+9B2remgMaFtdTgRyVpdeoZCsun8G
	6J6eA8jGUWDn8JAnPRGP2IXkkkhsDR7dzxNA0gOKqe5SYGqdcOU7yDCUZty6qRIUDN4z806S5CZ
	lAyypl6o=
X-Gm-Gg: AeBDiet3EJHPIDf8+eldp1zLtUbIuc0Bu6D4h4K7HeLgtGq/UHT1Iy1KqrrArBxGrTm
	cghnfMbVwZDBsmPH+OZM196nGOCyAiX3fOywtv9+F96PzmXXUiRra77ExgfHZFdP55vnrpB9Cvk
	p6f4zMJjKYU1CjPMFsD4RDD9eqnGZgScbEM6nmfxcU7AM77CDoG9oH1A/h6/ynGx6Mwp4TGgvBh
	opAHVzjMoM22gLwqZiCssVCtyM5OoXD8pJ6wmNF4BoDQm0EbIKj59n175KrLqXpMtJwcFNjyFVr
	YheJ8w4k+ijXO1Nan3Ffwjx5c5iXa1IZFB+YGgTYiT9GQjHLqpvzBL+RbTGoAwX7MOJgfKXVL+4
	M41QU5NkhuDtyaemNqOPKYZppG4R3EKiXcUD1nRm3grJFAhVI7aOV0K8xfH0VvEC1ZEfeCoKzeJ
	IpZD4NvOmaq2A8x+j2biRJpOAFZp1nvuVZpuHQHjdPZxhWTEmfiG062ma02yk2dqPUQP0yQREUt
	EfYIuTKJl0iFWrwM8eWgmTsiyZ9Zd0oTp4fqKtS7Gc=
X-Received: by 2002:a05:600c:a416:b0:488:90ac:8f71 with SMTP id 5b1f17b1804b1-488fb73a9fcmr157009535e9.5.1776692298004;
        Mon, 20 Apr 2026 06:38:18 -0700 (PDT)
Received: from heaven.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4891c08faffsm153960025e9.1.2026.04.20.06.38.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 06:38:17 -0700 (PDT)
From: corentin.guillevic@smile.fr
To: openembedded-core@lists.openembedded.org
Cc: Corentin Guillevic <corentin.guillevic@smile.fr>
Subject: [PATCH v2] sanity: add check for own-mirrors/SOURCE_MIRROR_URL
Date: Mon, 20 Apr 2026 15:38:05 +0200
Message-ID: <20260420133804.443583-2-corentin.guillevic@smile.fr>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Apr 2026 13:38:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235565

From: Corentin Guillevic <corentin.guillevic@smile.fr>

The SOURCE_MIRROR_URL variable belongs to  the own-mirrors class. However, the
user may forget to define it. This will cause the class to inject incorrect
content into PREMIRRORS, resulting in the following error:

ERROR: gettext-minimal-native-1.0-r0 do_fetch: Bitbake Fetcher Error: MalformedUrl('${SOURCE_MIRROR_URL}')
ERROR: Logfile of failure stored in: /path/to/tmp/work/x86_64-linux/gettext-minimal-native/1.0/temp/log.do_fetch.258066
ERROR: Task (/path/to/layers/poky/meta/recipes-core/gettext/gettext-minimal-native_1.0.bb:do_fetch) failed with exit code '1'

Add a check to the sanity class, to detect this case and raise an error.

Signed-off-by: Corentin Guillevic <corentin.guillevic@smile.fr>
---

Notes:
    Changes in v2:
    - Use addresult() / oe.utils.inherits() instead of bb.fatal() / inheritlist.split()

 meta/classes-global/sanity.bbclass | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/classes-global/sanity.bbclass b/meta/classes-global/sanity.bbclass
index 1a490f8d61..cd2cfa9a62 100644
--- a/meta/classes-global/sanity.bbclass
+++ b/meta/classes-global/sanity.bbclass
@@ -984,6 +984,11 @@ def check_sanity_everybuild(status, d):
             "Please set TMPDIR to a clean path with no trailing slash or "
             "consecutive slashes (e.g. %s).\n" % (tmpdir, os.path.normpath(tmpdir)))
 
+    # Check whether the SOURCE_MIRROR_URL variable, belonging to the 'own-mirrors' class, is defined
+    inheritlist = d.getVar('INHERIT')
+    if oe.utils.inherits(d, 'own-mirrors') and not d.getVar('SOURCE_MIRROR_URL'):
+        status.addresult("own-mirrors is enabled, but SOURCE_MIRROR_URL is not defined")
+
     # Check the format of MIRRORS, PREMIRRORS and SSTATE_MIRRORS
     import re
     mirror_vars = ['MIRRORS', 'PREMIRRORS', 'SSTATE_MIRRORS']
-- 
2.51.0


