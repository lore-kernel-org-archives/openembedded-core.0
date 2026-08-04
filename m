Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8783C55838
	for <webhook@archiver.kernel.org>; Tue,  4 Aug 2026 12:23:54 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14938.1785846230849039011
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Aug 2026 05:23:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=I9J/n34V;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-49800c6a846so28275225e9.3
        for <openembedded-core@lists.openembedded.org>; Tue, 04 Aug 2026 05:23:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1785846229; x=1786451029; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=bxYKQWaWVgg0+p1A1a1cGX6ulq5G3DB01S75tC1ouSM=;
        b=I9J/n34VEGnrukfG1eoZffoK9tznyX4L8CgN1OVk01g8a+OcxxNL74+5iNHhf0syMu
         SBlXmBmrLMsS6XRUnlOVhYsAvFXfgvAcStnL5ru+7WvQ94vo2+qqndj0zm9kDqm+tWd3
         ukeQ7WFsNkwTVVs8OJzf0Zv5KtkymTfSl3Wgk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785846229; x=1786451029;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=bxYKQWaWVgg0+p1A1a1cGX6ulq5G3DB01S75tC1ouSM=;
        b=egy2hvL6DJ0l2I3HNPRiCQ8daDE6HN5L2pr4aKFqjmCAM2pfnekT0w51bO1AMY8PkE
         CgDfeltwGiQ+dTBW1W9ikkUrIWkM183ccMJ6Q7C8C6HFLVgU9VOzDAzRMXyT6Ivjn97/
         6TSqBHcFGN0sCZ3Wf3uvXGGZSIP9KgCZ8xCfhcKgb+sa2h6VYVODqznQEsLfnOUPvVPf
         fyWOFigg67ZEjuq4DUZueiXTe/mNFOMA/zZuREI4XpFkYua6UyINjInnzzs+o3Xe/pcG
         HNuIWTtei7lqKq3HrCXCSdM3txg2/6pc+3+U/zSPAqKOr9KQurQrmqmdqZnQPyvc79mU
         iD1Q==
X-Gm-Message-State: AOJu0YzbzWUjfXPp755ylKaYnyYn65CHWc2D7U+GTX300fdBo/byohKG
	WhXO7B7SuQYT3MbA0UZE6QX/2RjdJ9EmU8in+Q36z4Pbobpqjne6SK7LIOVMlQKcKYkg2AugBmH
	U0nmIjYM=
X-Gm-Gg: AR+sD12gu0lxZNbki9SnE0QUArL8NYd9hl5crNMYjVfYqGeFawWunKRUY5F3D4nEEB/
	9NPSDKa88KY+X/5+sT9oTY7UVHzgsdyOuoXHII4TnMzFPvVoVAAIUnZFx/YiG6V1+IXoPKKeHC+
	HEi1M2+9Gc6xdKEu8fwe1HwGcDmnXkDgNsUrnb6llf5Me8TAhmPifhbh3Mv+Wd0QD2tbnwO79oB
	8vQrVbFFcaZ83fztVP4sTMBbGD2F0vV0zspN78zd2Tcv1E1GL/Doz8/3WPEHF2BLhbDP2dXZmRG
	w5Z771S8QVCkr+uLwnj0EKX6jp5p0jwnVNBxo9KAvRmFiynu+5coIReBtLtlFRQhoKhekw1kZA3
	xnkjCTZgLxx/HG3YsAbLekjg75l+v8ArMdMG/T0dD9FPkUXow5kr1glmN9LiAV8Df7xF6aEoIZI
	PVNxN4z/WpJ5BmTjWF3OY4WOCCIwaJn4dX8fDLtG3JP4y0K72dsl00rndxP2TuuOAm3bBaxoxVO
	BR31kmAlqs/c5W1Eg==
X-Received: by 2002:a05:600c:4747:b0:495:734e:4825 with SMTP id 5b1f17b1804b1-4980c674a20mr268358785e9.16.1785846229035;
        Tue, 04 Aug 2026 05:23:49 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:ce15:a763:9e16:7bb4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49949fcb0c5sm76247535e9.4.2026.08.04.05.23.47
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 05:23:48 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 9/9] python3-pyproject-metadata: upgrade 0.11.0 -> 0.12.1
Date: Tue,  4 Aug 2026 13:23:35 +0100
Message-ID: <20260804122335.3094065-9-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260804122335.3094065-1-richard.purdie@linuxfoundation.org>
References: <20260804122335.3094065-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Aug 2026 12:23:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242747

Fixes:

- Collect a config error instead of raising a raw `TypeError` when
  `project.dynamic` contains a non-string (unhashable) entry with
  `all_errors=True`.

Features:

- Support [PEP 808](https://peps.python.org/pep-0808/) (partially dynamic
  project metadata) (METADATA 2.6).
- Add support for Python 3.15.
- Warn ([PEP 685](https://peps.python.org/pep-0685/)) when an extra name in
  `project.optional-dependencies` is not a valid name. The extra is still
  emitted, only a `ConfigurationWarning` is produced.

Fixes:

- Error on an unset dynamic version instead of silently writing
  `Version: 0.0.0`. If `"version"` is declared in `project.dynamic` but never
  assigned by the build backend, writing the metadata now raises a
  `ConfigurationError` (`Field "project.version" missing`), restoring the 0.8.x
  behavior that regressed in the 0.9 rewrite.
- Don't crash on a non-table `[project]` when `all_errors=True`.
- Tighten `license-files` glob checks and private-tag parsing.
- Handle braces in user data within error messages.
- Correct the `Import-Namespace` field name in the metadata mapping.
- Fix UTF-8 author and maintainer names.

Performance:

- Cache `get_type_hints` and precompile dispatch patterns.

Documentation:

- Fix a stale dynamic docstring and a broken module example.
- Add a documentation project URL.

Internal and CI:

- Refactoring: consistent dataclass decorators, sorted constant entries, and
  removal of duplicate imports and dead code.
- Cover defensive branches in dispatch helpers and validators.
- Secure GitHub Actions workflows and bump pinned/downstream dependencies.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...-metadata_0.11.0.bb => python3-pyproject-metadata_0.12.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pyproject-metadata_0.11.0.bb => python3-pyproject-metadata_0.12.1.bb} (89%)

diff --git a/meta/recipes-devtools/python/python3-pyproject-metadata_0.11.0.bb b/meta/recipes-devtools/python/python3-pyproject-metadata_0.12.1.bb
similarity index 89%
rename from meta/recipes-devtools/python/python3-pyproject-metadata_0.11.0.bb
rename to meta/recipes-devtools/python/python3-pyproject-metadata_0.12.1.bb
index 1e485df338d..9918cae0753 100644
--- a/meta/recipes-devtools/python/python3-pyproject-metadata_0.11.0.bb
+++ b/meta/recipes-devtools/python/python3-pyproject-metadata_0.12.1.bb
@@ -16,7 +16,7 @@ PYPI_PACKAGE = "pyproject_metadata"
 
 inherit pypi python_flit_core
 
-SRC_URI[sha256sum] = "c72fa49418bb7c5a10f25e050c418009898d1c051721d19f98a6fb6da59a66cf"
+SRC_URI[sha256sum] = "8809a4df6fe08279b39a8890669506ed3158e0617855ac9aff098fcbe772ae4c"
 
 RDEPENDS:${PN} += " \
     python3-logging \

