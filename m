Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85C5BCCF2C8
	for <webhook@archiver.kernel.org>; Fri, 16 Oct 2026 22:24:46 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5934.1792189482577590743
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Oct 2026 15:24:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=WvZdzSg7;
 spf=pass (domain: smile.fr, ip: 209.85.221.48, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-487049569b6so189587f8f.1
        for <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2026 15:24:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1792189481; x=1792794281; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=xL+84jjIgxRbQ5TZmbf1MEq5xEyIgfd1Ln2MUu4l/Ok=;
        b=WvZdzSg7PgNMIOa0GLyqnjcwoh3qnIkgWvwBN6FqknZJDUze23xPhAB4EM+vt10Jh0
         j2d5UGJHfIX3ATgkLuYDSsXS/twHE/ARktX9hwuQdi/zGJDw8SIgQ/ENG+/FEQVv3Dsh
         7IEeHRMzQVs9QEb4vHPouDcd0XfOxKsApiihY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792189481; x=1792794281;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=xL+84jjIgxRbQ5TZmbf1MEq5xEyIgfd1Ln2MUu4l/Ok=;
        b=YfZUm4iGlVY9W/3WpP35ufk8SIgJCu0FBesWrQWP3v7wsyGur63zS2kJBpcvjqzIJi
         IMSJmmITfG2hANjjezNXaYwZWjh2eev75E4ZwocXUQYi8LeG0bksftcdQpIxz+cOwkGD
         fxypx0VLQGisCISFDuoQShigx/1IW0IwrzclTMiJtqvhN+Mt2dHQDxyRdzmmW/a5oPdb
         Agt0uByddmP7OMEoS+N9B4NpiDlBRM2E0SQ5JIKLl310a1ZmjU5IIKTQ1w9efHT1vkYz
         eHxiujG6eA+6kwOnSmvGdgZhJpGG7lqh8tYtlEF3zjl7F2JAF2Se56cpUWft6CUCBuhk
         ocXw==
X-Gm-Message-State: AFq9FYJi+8JLWS0tXGhUsgqlGL1KE+IS+1O2IE12djyz7scYtnzdADEm
	TsztSZlQ1ARN4YB7OgWsTVFnv6Fr6hEDGid9J4LYMi80jlwJ3SHo+IVSsldz1Isi21hXA1qnNqo
	1RCKZTDY=
X-Gm-Gg: AYBFou254y7aap4kqCnZWzJYMqBv6A0tPhENJrWNLR7l1TKoJBkg/0mlKBlbfy0KZbP
	phZiprwIybLs2nySReW4nOb4j8dvAFXwrVsWQtsFIIFbiJm9/xxjZnuPPQ5CpSrZpC0S818j0zU
	D3lahVkwCrOpzWcsunnxCYvAJgyk+6ixvOLTEYLt+rtkMRgzdyN/nxrw+v3rY1X/Bna7ASSqJrt
	fT6tCzRlSW8ynLiaoWybAOTNn9DFBQaZ9Ym4sPEGnKLfZyzMTr9u+shUzQB6HiJS0/Gz5ZM/i95
	D6rF0s5sVMsbzdx/187jXN+glViO/b3cvFNKWwSZKjRddYRR87s+sGdJd3nUbwfZk21hMzrCgRQ
	NqmObkhR0KJ+fjHGLPM2CsXa/4vUHqaEwJZqj1tjpCwAodWKSh07mHeX207pN8nE0Iyo0fJOZot
	qyYKk/GMilBS73ONn/eT/8RplfIY5nt6L3pMhAb0ikkSAPJ28beUKhBeZJdSJ9FlC2kexdFticO
	UlLbHR8JhZ4u1ERVL43G9+9lj9t+AIfZFOLX68JMsQTJPgmMQlqxzG8qWeCRKItRWTpJjwtfQ==
X-Received: by 2002:a05:6000:4382:b0:48e:932:aef3 with SMTP id ffacd0b85a97d-48e0932afa7mr904810f8f.23.1792189480761;
        Fri, 16 Oct 2026 15:24:40 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd503862sm7639515f8f.46.2026.10.16.15.24.40
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 15:24:40 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][blacksail 02/17] python3-mako: upgrade 1.4.1 -> 1.4.3
Date: Sat, 17 Oct 2026 00:24:04 +0200
Message-ID: <da714820d26eb7278a777e3207fd807aa1431c15.1792189264.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1792189264.git.yoann.congal@smile.fr>
References: <cover.1792189264.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2026 22:24:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248052

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
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
[YC: See: https://github.com/sqlalchemy/mako/compare/rel_1_4_1...rel_1_4_3 ]
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
 

