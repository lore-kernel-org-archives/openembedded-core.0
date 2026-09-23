Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF59CC9830C
	for <webhook@archiver.kernel.org>; Wed, 23 Sep 2026 13:59:49 +0000 (UTC)
Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7576.1790171987437031541
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Sep 2026 06:59:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ezw8C6oN;
 spf=pass (domain: linuxfoundation.org, ip: 74.125.225.140, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912d37b6so5390135e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Sep 2026 06:59:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1790171986; x=1790776786; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=wng3FoWw7GZSo+9rZZxsWHidY07b9WWGDWADAl96hWk=;
        b=ezw8C6oNDLqsVNHJ5edn7mZbTzyf/15GPZwyEdAsOlVSnn8fn+BMDMSKaKmN8R0/mv
         xwGII9sZxWf6pvnp7e8agmRhOdPYbgz8OhfiPefQj3QwJaA1DRxGFLaMVCRENTHBX2jB
         zsEbMfO5jQdOT8Vq0FLyA79YvSeFoNlA7t2Xs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790171986; x=1790776786;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=wng3FoWw7GZSo+9rZZxsWHidY07b9WWGDWADAl96hWk=;
        b=bnSOvp//TZLRzKevZoE6saXWtbO7Nrm5xRMr9JbDefLkrorWQo5yDKhjfx4Wo5xXEs
         VJ4I3l9RJKWZydJNX/IUx5I2Qg50s3YYN5mrDbfTa7g7xPbwIwFH8zfpDb56pmvNuEDm
         PKw7i+v4Xn8A3RveXyLWTjNH8ezWRdBj4RCrrVw1Mxga3H7JNM6007ckR/AJ/xdgef3q
         RSVYNX0WCrcp/yTicW7ssulouXUtPW5U8dkAlTyi2S8+8H3WvlfXZkp711mqFrwrjZhl
         cOVanpiOg2D7D4uYAG5GL3SviBF8pwSIFMobvbiuEO31VUdpo7Q88Jo8FtfIOm+v8kr2
         w6vQ==
X-Gm-Message-State: AFuF++l3SV2WQA3aU9OT9Q9t0j/iS+/2poNz+0Qg5fWLqlKcMTIbDa0s
	0ygRLT8w/nJDbjrzU+ni/2bjUZ8BcFvNHLA1fUK88Px4R6yrF6J5wWlO2mKchPj7u/RsitvbuSL
	VFXb9A9g=
X-Gm-Gg: AYBFou314jGrqoe5m4yiyuX0Jjb05sP0xnIv+dPW4Jvxp5NFKS3ldVlqAe2SsBpsCRj
	u/MirxPPENpMe+F3wOve8ZzqdbsnPSNtavv/4cv9ipJAKk+8LuBuXlQL62aO5oEgbG5oXeY+7lY
	5dBDVNI9tR1w1YADBKg0dh2xkYpk0DvezDG8Y5YXqBWwZFODkcR0Xncg/QM/NHkMxlHLYb0XZnn
	N5A5YvxaJuuXAKm2DLl/BcnBcTV/WNw4VsOYyM6udyET5YTYkFcuch+V+jk2R2J4CTwTB3rs+kI
	s2YdeJu6iQeEaCWpgLllSW9czeLshNmkPspGVey7DKMc2VcFDm507NTu6EiOTbY2Bm4QEHJKpyh
	UHcc903DGcK8OVDaUKyPqRlC3cGU6qrDMuRjbPZkVG+GE0CcyN9Oonv5wyKJxJzFJpuhwTDFWlU
	LO9TBx0Lteh37XSRG2dH0MjKbcrlB2MdubiWs1dRZIegO2hhvqa+HE/v0uTQ6uAoyUs7Ppej+7S
	Tskzz0qALJXETh8+BnXW8AMeTg=
X-Received: by 2002:a05:600c:4f83:b0:49c:ed94:cdd8 with SMTP id 5b1f17b1804b1-49fdecc35f6mr35782135e9.6.1790171985657;
        Wed, 23 Sep 2026 06:59:45 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:36fd:f492:2703:247a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe43fc27csm8027945e9.2.2026.09.23.06.59.44
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 06:59:44 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 5/6] python3-mako: upgrade 1.4.1 -> 1.4.3
Date: Wed, 23 Sep 2026 14:59:38 +0100
Message-ID: <20260923135939.3797785-5-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260923135939.3797785-1-richard.purdie@linuxfoundation.org>
References: <20260923135939.3797785-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Sep 2026 13:59:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246518

.. changelog::
    :version: 1.4.3
    :released: Tue Sep 22 2026

    .. change::
        :tags: bug, tests
        :tickets: 441

        Fixed regression caused in 1.4.2 where tests added to the suite were
        unable to run directly on Windows, due to posix mechanics: the tests
        force ``os.path`` to ``posixpath``, whereas
        :meth:`.TemplateLookup.get_template` converts the configured directory
        using ``os.path.sep``.  These tests are now skipped on that platform,
        where the traversal check is instead exercised against ``ntpath``
        natively.

.. changelog::
    :version: 1.4.2
    :released: Tue Sep 22 2026

    .. change::
        :tags: bug, tests
        :tickets: 440

        Adjusted the test suite to accommodate for a change in Pygments 2.21.0
        where the ``HtmlFormatter`` now renders ``"`` and ``'`` characters
        literally rather than as HTML entities, which caused failures in tests
        that assert against the rendered output of
        :func:`.html_error_template`.

    .. change::
        :tags: bug, template
        :tickets: 441

        Fixed issue in :class:`.TemplateLookup` where a URI beginning with a
        drive designator (e.g. ``C:/../../secret.txt``) could bypass the directory
        traversal check on Windows, allowing reads of arbitrary files outside of
        the template directory.  The check in :class:`.Template` normalized the
        URI using ``os.path``, which on Windows is ``ntpath``; as ``ntpath`` splits
        the drive designator off and treats the remainder as rooted, the ``..``
        segments were absorbed before the check could inspect them.
        Normalization
        is now performed with ``posixpath``, which is the same module used by
        :meth:`.TemplateLookup.get_template` to resolve the URI to a file.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../python/{python3-mako_1.4.1.bb => python3-mako_1.4.3.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-mako_1.4.1.bb => python3-mako_1.4.3.bb} (88%)

diff --git a/meta/recipes-devtools/python/python3-mako_1.4.1.bb b/meta/recipes-devtools/python/python3-mako_1.4.3.bb
similarity index 88%
rename from meta/recipes-devtools/python/python3-mako_1.4.1.bb
rename to meta/recipes-devtools/python/python3-mako_1.4.3.bb
index 367a65271f5..41bccec9ebc 100644
--- a/meta/recipes-devtools/python/python3-mako_1.4.1.bb
+++ b/meta/recipes-devtools/python/python3-mako_1.4.3.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=c79ceff89df0a72f29bb0e1b6f0e36ed"
 
 inherit pypi python_setuptools_build_meta ptest-python-pytest
 
-SRC_URI[sha256sum] = "d7904710b662996425a21627710c4777c45053146942cf8a7aebf757c92b8c27"
+SRC_URI[sha256sum] = "cd6537fe88d5fec315c55c2f8529bc4ce7a9a352ad7db3eeaa6a66e2dd4ec37a"
 
 CVE_PRODUCT = "makotemplates:mako sqlalchemy:mako"
 

