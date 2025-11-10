Return-Path: <fbberton@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A27ACCFA13
	for <webhook@archiver.kernel.org>; Mon, 10 Nov 2025 17:13:45 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1866.1762794821036896421
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Nov 2025 09:13:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Pw4/S+J/;
 spf=pass (domain: gmail.com, ip: 209.85.221.47, mailfrom: fbberton@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-42b3377aaf2so979807f8f.2
        for <openembedded-core@lists.openembedded.org>; Mon, 10 Nov 2025 09:13:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762794819; x=1763399619; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vqau9Z5xlwHXnWl0JPptrWtV9xRTQRCDbkP7X5Tvm7o=;
        b=Pw4/S+J/V2fJmDU6o0wsz+Hmc1AvghK+etEKxJ1NtG9TwWxa/nSImI7ncVxusPdgf7
         0oUfEeyCstX5bCnZ1wbGX7vaD2MmTzOwpRMbcuEjMGdau86QlnZvMHUg+8M0UTmOBUdf
         UiyhSprBPH0NE008y26Uj7qUiQSAMUAXPNaYfIHNcamofSzqs6rQ0FAHdpc1U8JXedWy
         W2YlEoDPvDI1zKRasDiFshS/2KAMVmHdmAwDs0EdBTtRRtZszWGGCXuKUQmgnIZgLe2T
         qzifiw3yH/jvSVWIZkClRnl+WmLds1NhKkQbexJc+JK5rTC9A3hvhGs3VFCH66ypNvK8
         8OAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762794819; x=1763399619;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vqau9Z5xlwHXnWl0JPptrWtV9xRTQRCDbkP7X5Tvm7o=;
        b=EuBS/W+KcH+uUOijjgh8RrwRqb4mA6hjetKYJ4WhAAqZ1OQNP1fmSOAvrsUTIqaCuz
         F2fSzuiDx4wsczT1E4vLGElrIi9IBoa4VuwqA9WRQcF8f406BQU7hcIMn+tMPHGBEeHG
         lgG+pYNkO2wdnn31CGcZHAImD5NR95Qf33+IgAeRKEeUq1c+ue7HpAU7orsbExwBrl6j
         l5Qx04l8sFb4+oGlgGTi82x4nPMf+519Zo4bbaAksR9XNAriGn/cwVvi3XIl+V9TtlN2
         /4ZkYFFq9+UbP26KDVFFuyFDcOtYG0c2+Pg0HXDKrnpIpc3bsRdI4pxV1u3SesFuwSR6
         ll0w==
X-Gm-Message-State: AOJu0YxU76I9mIxpqK+FOgZNkj45yOZNisqVsD3PFPaX7hTaPV+4JXAl
	B028NnIh9otfH1KE3s1OSKNbShHGGO2B8ibU7+UKxGf+Px3Oi+Tf96lWLRutMw==
X-Gm-Gg: ASbGnctTlX5SucGq0l3Rx3e2ZajZf5NYqhIg0p7qevSIKPcKeYRkG7Rt8hfJMJm60Qm
	WzHMHm7KjzXzOEVxm+YyGZ9Z6DeyjX/hg3QdNN1Hv7Ei7kasOq6g8BvSazL4gg/LHMnECJV+K3k
	yG1oH3P91M6WVxhXVXvkjN+I87ay40n5tAY8GXSg11C6/sA252fil68wm//9JU7d/o1kzepJ6wk
	6leb48yXv8bI39csyKxjYYlqLiQx9QxYnBd+B2mH5TnvCN5P4tRfaAbdOs/x+GVuBJ+cR//BVRg
	PIuZula5nEhHaWgn/TgUVQyn5IJ+vw2pzimQaZREkJoxLqkS3/gh2A6W8dMMXWkNNf5H3CHYfCf
	JF6BasmAZHzBBWZchQFhWTaePslbPUKS6kH45u4tmiLHb/NZ7y9w4OLUrzDeZIb4KIYf4G8m5PP
	+uR1nwpA==
X-Google-Smtp-Source: AGHT+IETpHALvK6GEFEULet2xJycY+LtqrTNTV6hsmcziZkhySD57JOqxyWeFbZfoB1efU2DBw86+A==
X-Received: by 2002:a05:6000:240b:b0:42b:3746:3b88 with SMTP id ffacd0b85a97d-42b37463f5cmr4188320f8f.57.1762794818902;
        Mon, 10 Nov 2025 09:13:38 -0800 (PST)
Received: from CTW01359 ([213.205.68.220])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b2ee2ed31sm16461518f8f.29.2025.11.10.09.13.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 09:13:38 -0800 (PST)
From: Fabio Berton <fbberton@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: JPEWhacker@gmail.com,
	dwagenknecht@emlix.com
Subject: [RFC PATCH 0/1] spdx: Add software file externalRef support
Date: Mon, 10 Nov 2025 17:13:36 +0000
Message-ID: <20251110171337.754568-1-fbberton@gmail.com>
X-Mailer: git-send-email 2.51.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Nov 2025 17:13:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226130

Hi all,

When starting to test SPDX 3.0 in our projects, we noticed that it would
be necessary to have more information for files fetched via the
'file://' protocol, such as the full path of the file or a URL with git
information.

Our first idea was to use 'downloadLocation', but what I understand is
that this is a package property, and files fetched from the layer are
'software_File' type. Looking at the SPDX spec, it appears we could use
the 'ExternalRef' for this purpose.

The idea is to have two options to add this information: one to add the
full path of a file, and another to add the git information
'git+https://host/repo@commit#path/to/file'. The information is added as
an 'externalRef' and can be configured using these types:
https://spdx.github.io/spdx-spec/v3.0.1/model/Core/Vocabularies/ExternalRefType/

When using the 'path' option, something like this is added:
```
"externalRef": [
          {
            "type": "ExternalRef",
            "externalRefType": "sourceArtifact",
           "locator": [
              "/home/user/src/openembedded-core/meta/recipes-core/busybox/files/syslog"
            ]
          }
        ],
```
This option is non-reproducible, if the build path changes, the SPDX
will be different.

And with the 'git' option:
```
"externalRef": [
          {
            "type": "ExternalRef",
            "externalRefType": "sourceArtifact",
            "locator": [
              "git+https://git.openembedded.org/openembedded-core@ac5d9579a0db63b54bbebb5015de2ae860a462bf#meta/recipes-core/busybox/files/syslog"
            ]
          }
        ],
```

The implementation is not completely finished, but since there is
already a thread on this subject,
https://lists.openembedded.org/g/openembedded-core/topic/thoughts_on_spdx_for_files/116135395,
I wanted to share my work and get opinions on how to improve this
implementation.

My questions are:

Is the 'externalRef' the right way to add the information in the spdx
file?

I'm using the 'choices' type, but this only works when inheriting
typecheck.bbclass, and this bbclass is not inherited when using
OE-Core with 'nodistro'. Can this 'choices' type be used here?

I still need to find a way to cache Git layer information to avoid
calling the 'oe.buildcfg' function every time. Maybe it would be
possible to use something like this:
https://git.openembedded.org/openembedded-core/tree/meta/classes/metadata_scm.bbclass
to get information at parsing time. However, this
information is only needed when using SPDX_FILE_LOCATION with the git
option, and for all layers. Any idea here?

For the git option, we need to get a git remote, but there can be more
than one remote per layer, so we need a way to configure these remotes.
In this first implementation, I'm assuming that all layers use the same
remote, and the remote name can be configured, which fits our current
use case.

Should I add a variable like 'SPDX_FILE_LOCATION_GIT_REMOTE_<layername>
= "remote_name"' to set a specific remote for each layer? Would setting
the git remote be sufficient to cover most cases?

Any feedback or suggestions would be appreciated.

Best regards,
Fabio

Fabio Berton (1):
  spdx: Add software file externalRef support

 meta/classes/create-spdx-3.0.bbclass | 24 +++++++
 meta/lib/oe/sbom30.py                | 14 ++++-
 meta/lib/oe/spdx30_tasks.py          | 93 ++++++++++++++++++++++++++++
 3 files changed, 130 insertions(+), 1 deletion(-)

-- 
2.51.1


