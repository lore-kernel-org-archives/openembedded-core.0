Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAF82E77188
	for <webhook@archiver.kernel.org>; Sat,  4 Jan 2025 13:42:36 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web11.18161.1735998154242969177
 for <openembedded-core@lists.openembedded.org>;
 Sat, 04 Jan 2025 05:42:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=qZ+ZJAiA;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.177, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2164b662090so161382275ad.1
        for <openembedded-core@lists.openembedded.org>; Sat, 04 Jan 2025 05:42:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1735998153; x=1736602953; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tbhvUlBhbFTdsDsuSa2Ukqk9jfkdb2UJulaPWkZOEyw=;
        b=qZ+ZJAiAtr8rj4ePEmHjBNZgf7s9q5pl3YfbqTzr8cl+076FTveeADqSZPWK5H0rbW
         exltJh9PeofTyBPL6G8oCf0zc0MyNGj5Vz/8l+WtyH6GF32Hn9ElgHO4e5GSE1sTM8pF
         wctL1lHS6oKlvv4ESzeve+plxYgF+jdHRXL28mfy7T+Dhi7dOZLWAgw+p1KbniW1eU+7
         aM+68V5A4kJqZ9OIP0Zjhsz5hTiINRnbPYlnzc7L43J/96ok7NJZ64U8qAqmdD1yH7HN
         U46FYg4MrYVJ0qmHNqFazneE9GaR4LW31hoNaPXllko72IqPDM6Vxvx5vRHcNntGcZYX
         m7Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735998153; x=1736602953;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tbhvUlBhbFTdsDsuSa2Ukqk9jfkdb2UJulaPWkZOEyw=;
        b=ND9KRPgTGHKlN00sdzEgdo0njBz/c7dHXsahWDg82/xgx92ocxR4qoxfttWnqJVrAY
         cXav4rfuyXwaYuwsSEZR9ltO82CdCXHlT8NTxOFKYtR6+9e+PmhcJHu3X5nglfiMwarG
         V1pZnXzt9q3HGaxgLqq+dajUUrNSWeRzX41LhvSNDlKohnVoaf2UW76xuf807wYXoRn+
         zAIxQdgydsnhBKxZSkkzmGwHBgZ2UP6i7WsiemfGdvib4WlzHUWAGTtMvCbmQzCuvs16
         VdaG87VxdjwD3g1GRYThUfxKqacfsrgVp7OIJ5eJYNWliVmgISyTDHMPLEyKodCB+K9u
         uAsA==
X-Gm-Message-State: AOJu0Yz2nYv8vqmqx6p+baAJVqjecReurWulNwLPotzHGjC0gWK6ZPSS
	M68LMgUzYrwrcPdw3cDnmy9LW5uxMD/4Nmkvo6zaMN3iko2cUQVBd0abWczrrtYKVfVSK9yWk9n
	e
X-Gm-Gg: ASbGnctxhEGktgu25ZRKgX3G3qYdvf0WwNlKSLzR4bjTJMtyg4ObU7NUxG9trAAjg58
	unMsOcYXU5BxMYBrVAwbm2HTCREVKmFLtQR0UR0HUKoDLA7Wdn+u4UJMlFinl6E8H6rc2+JYJpM
	abQm2KXg6K0syzGZM7iHME/DJLN1J49lUqwyyMsjXEI4KqiTkWVeUYZ5qrHzPnE/WEeW5cteusY
	KN8a6kqg/Gh2kKVBdHUrge4sbw8sP9xejQr/TS6x693Og==
X-Google-Smtp-Source: AGHT+IFTJZW/1fsiLX7fWhSs2sKvr3hNA2bnGkpreh9KV7ngnYVnWrQFIwY38GFTivZAIYhi/vNTJA==
X-Received: by 2002:a05:6a00:cd6:b0:729:a31:892d with SMTP id d2e1a72fcca58-72abdd9603cmr90537288b3a.8.1735998151955;
        Sat, 04 Jan 2025 05:42:31 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad8faf93sm27966257b3a.153.2025.01.04.05.42.31
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jan 2025 05:42:31 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 21/25] python3-requests: upgrade 2.32.0 -> 2.32.3
Date: Sat,  4 Jan 2025 05:41:45 -0800
Message-ID: <e1787271b07c605df2843d82d65e1c3d2e2114e6.1735997984.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1735997984.git.steve@sakoman.com>
References: <cover.1735997984.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 04 Jan 2025 13:42:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209391

From: Soumya Sambu <soumya.sambu@windriver.com>

Changelog:
https://requests.readthedocs.io/en/latest/community/updates/#release-history

2.32.3 (2024-05-29)
  * Bugfixes - Fixed bug breaking the ability to specify custom SSLContexts
    in sub-classes of HTTPAdapter. (#6716)
  * Fixed issue where Requests started failing to run on Python versions
    compiled without the ssl module. (#6724)

2.32.2 (2024-05-21)
  * Deprecations - To provide a more stable migration for custom HTTPAdapters
    impacted by the CVE changes in 2.32.0, we’ve renamed _get_connection to a
        new public API, get_connection_with_tls_context. Existing custom
        HTTPAdapters will need to migrate their code to use this new API.
        get_connection is considered deprecated in all versions of
        Requests>=2.32.0.
  * A minimal (2-line) example has been provided in the linked PR to ease
    migration, but we strongly urge users to evaluate if their custom adapter
        is subject to the same issue described in CVE-2024-35195. (#6710)

2.32.1 (2024-05-20)
  * Bugfixes - Add missing test certs to the sdist distributed on PyPI.

https://github.com/psf/requests/compare/v2.32.0...v2.32.3

Also transition to using python_setuptools_build_meta.

Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...{python3-requests_2.32.0.bb => python3-requests_2.32.3.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-requests_2.32.0.bb => python3-requests_2.32.3.bb} (78%)

diff --git a/meta/recipes-devtools/python/python3-requests_2.32.0.bb b/meta/recipes-devtools/python/python3-requests_2.32.3.bb
similarity index 78%
rename from meta/recipes-devtools/python/python3-requests_2.32.0.bb
rename to meta/recipes-devtools/python/python3-requests_2.32.3.bb
index b4df4c5dc7..4f0638b50c 100644
--- a/meta/recipes-devtools/python/python3-requests_2.32.0.bb
+++ b/meta/recipes-devtools/python/python3-requests_2.32.3.bb
@@ -3,9 +3,9 @@ HOMEPAGE = "https://requests.readthedocs.io"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=34400b68072d710fecd0a2940a0d1658"
 
-SRC_URI[sha256sum] = "fa5490319474c82ef1d2c9bc459d3652e3ae4ef4c4ebdd18a21145a47ca4b6b8"
+SRC_URI[sha256sum] = "55365417734eb18255590a9ff9eb97e9e1da868d4ccd6402399eaf68af20a760"
 
-inherit pypi setuptools3
+inherit pypi python_setuptools_build_meta
 
 RDEPENDS:${PN} += " \
     python3-certifi \
-- 
2.43.0


