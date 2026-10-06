Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81EDCCA5FFC
	for <webhook@archiver.kernel.org>; Tue,  6 Oct 2026 16:01:40 +0000 (UTC)
Received: from mta-65-228.siemens.flowmailer.net (mta-65-228.siemens.flowmailer.net [185.136.65.228])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.49221.1791302489630415699
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Oct 2026 09:01:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=LqE55kLY;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.228, mailfrom: fm-256628-2026100616012174ad2bb470000207b9-hzx1p1@rts-flowmailer.siemens.com)
Received: by mta-65-228.siemens.flowmailer.net with ESMTPSA id 2026100616012174ad2bb470000207b9
        for <openembedded-core@lists.openembedded.org>;
        Tue, 06 Oct 2026 18:01:22 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=J8GdZ/xrjutFC33dchN3xMS3661Coyt+C8DD28C7VjE=;
 b=LqE55kLYloeXcFWknZKkJ64RFOAheplpyGPZlVJVea8ZiCp07ULE9Gn+JjrqRJS2rr4wLY
 JWHfX46O0pcgnZptmgH0xKKNk2VJbGGXDdyAB+Ti9V5ANz1z/0SUCML0kaRLClvXUxq9eJ5I
 Pllalr12SWeNzTKTLR0RIVQmZ9aBvh1td0QYkNZ8eDmk07H2k7QBR5dcjVwYx2dlWNs2OpNh
 InHty8ze9DCI9F+jNZ4XtGfT/JQS9MHXCcMEVdprLTrlxUEpGyYLhbLHqHderHwgNC1pulEZ
 FQwyxkJRDa5ubh3GJEZeKRgZOAQ7iFhNd/BDQA9KKme1sRRKFSZFiP4w==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [blacksail][PATCH] python3-mako: upgrade 1.4.1 -> 1.4.3
Date: Tue,  6 Oct 2026 18:01:02 +0200
Message-ID: <20261006160102.8436-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Oct 2026 16:01:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247309

From: Richard Purdie <richard.purdie@linuxfoundation.org>

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
(From OE-Core rev: c56742b717ab1279923698d0cf680bae53711a48)

This (two version) upgrade contains only single code change commit,
fix for CVE-2026-102991. All other commits and maintenance and tests.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../python/{python3-mako_1.4.1.bb => python3-mako_1.4.3.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-mako_1.4.1.bb => python3-mako_1.4.3.bb} (88%)

diff --git a/meta/recipes-devtools/python/python3-mako_1.4.1.bb b/meta/recipes-devtools/python/python3-mako_1.4.3.bb
similarity index 88%
rename from meta/recipes-devtools/python/python3-mako_1.4.1.bb
rename to meta/recipes-devtools/python/python3-mako_1.4.3.bb
index 367a65271f..41bccec9eb 100644
--- a/meta/recipes-devtools/python/python3-mako_1.4.1.bb
+++ b/meta/recipes-devtools/python/python3-mako_1.4.3.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=c79ceff89df0a72f29bb0e1b6f0e36ed"
 
 inherit pypi python_setuptools_build_meta ptest-python-pytest
 
-SRC_URI[sha256sum] = "d7904710b662996425a21627710c4777c45053146942cf8a7aebf757c92b8c27"
+SRC_URI[sha256sum] = "cd6537fe88d5fec315c55c2f8529bc4ce7a9a352ad7db3eeaa6a66e2dd4ec37a"
 
 CVE_PRODUCT = "makotemplates:mako sqlalchemy:mako"
 

