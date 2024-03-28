Return-Path: <tim.orling@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B7C8CD11DD
	for <webhook@archiver.kernel.org>; Thu, 28 Mar 2024 16:22:35 +0000 (UTC)
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com [209.85.214.194])
 by mx.groups.io with SMTP id smtpd.web10.745.1711642951332821306
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Mar 2024 09:22:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=PQDsLDlP;
 spf=pass (domain: konsulko.com, ip: 209.85.214.194, mailfrom: tim.orling@konsulko.com)
Received: by mail-pl1-f194.google.com with SMTP id d9443c01a7336-1dddbe47ac1so15128605ad.1
        for <openembedded-core@lists.openembedded.org>; Thu, 28 Mar 2024 09:22:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1711642950; x=1712247750; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QStgXhrXQ3GyPyYZOUQCYGC22pPsQIJqNf3b6ASNERI=;
        b=PQDsLDlP13JiqEh1UjVc+khcLw7Er/GrRtt4ql+E/R9pbA9GEuWyJRnUCgjV0wuas6
         LTIL26S5KPrqmHQcKWhw8GNLeNzW5JUorp0Kcz3MEAgt1EIKWWGVmV2q/vdUxLHCJ0Gu
         vTUOcXLsl2C7TIS3jl6NLBHfJT5wudAahX8G0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711642950; x=1712247750;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QStgXhrXQ3GyPyYZOUQCYGC22pPsQIJqNf3b6ASNERI=;
        b=ix+BUg1BjmR3fAXkC5EFVTSJBVDD2QUSwf+WaS0BZ6F11hLk11UDyizi7O/h7YjM5J
         e66VN1Ahjym4t3Fh5Za7ErI5JZej4EyLCAE9LdCYukURwsT6AKgisD0DdAejyWIUTjF6
         4+SvRHdDZOjSGBLKPxKijHg3mVZd4WFLJXXty7hMcPS66yUwAtj+2netL3OAJ8qkBDpb
         UUOBEsGHDIq4HKG+JdHWklMVtgrmd2uvQA6rALwYQu/WwJ9sFMDJPH5hRtgIUCrEzRpv
         0mncTEWEImQNbf6PkeHEp9QBC//nkBq1sDbLF76HKtCrB7Vd1P1K8oii4f7ay8x3uoZq
         BABg==
X-Gm-Message-State: AOJu0YyBq8QCxS096mj5lVRCQt+czDGH2QJiEzuUIImJXHw8s1s+jCQl
	UFIxKxBlgfiLDyltWUMhXyIIybZn6/eYp2OGnHmHZbra5hVCzeJwq+jB4MPTmgzSlX3WhzwiHfm
	+4vZWUlh5
X-Google-Smtp-Source: AGHT+IH9f7nDwxw9UYCUhIIRiTMVhwy+oxjyM9M8ofl61FbMFvVZEnz9JccMo86YR54pfQeXXhJBKQ==
X-Received: by 2002:a17:902:ea0e:b0:1e0:abdc:1507 with SMTP id s14-20020a170902ea0e00b001e0abdc1507mr4564684plg.17.1711642949946;
        Thu, 28 Mar 2024 09:22:29 -0700 (PDT)
Received: from localhost ([2601:1c0:ca00:bd60:6ae3:9cc1:54c1:30c])
        by smtp.gmail.com with ESMTPSA id n14-20020a170902e54e00b001e0f2dc4165sm1791322plf.60.2024.03.28.09.22.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Mar 2024 09:22:29 -0700 (PDT)
From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH 0/2] Move liberror-perl to meta-perl
Date: Thu, 28 Mar 2024 09:22:16 -0700
Message-Id: <20240328162218.1521815-1-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 Mar 2024 16:22:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197587

This perl package has not seen any updates since 2020.

The upstream author of Error has deprecated it for quite some time.

https://metacpan.org/pod/Error#WARNING

    'Using the "Error" module is no longer recommended due to the
     black-magical nature of its syntactic sugar, which often tends
     to break. Its maintainers have stopped actively writing code
     that uses it, and discourage people from doing so.'

The only recipe in oe-core which had any depdency on it was coreutils-ptest,
and that has now been removed. All ptests passed for core-image-ptest-coreutils
on qemux86-64.

It is not clear when the dependency in coreutils was present, but it is
definitely not needed in the current v9.4 release.

Tim Orling (2):
  coreutils: drop obsolete liberror-perl RDEPENDS
  liberror-perl: move to meta-perl

 meta/conf/distro/include/maintainers.inc      |  1 -
 .../distro/include/ptest-packagelists.inc     |  1 -
 meta/recipes-core/coreutils/coreutils_9.4.bb  |  4 +-
 .../perl/liberror-perl_0.17029.bb             | 48 -------------------
 4 files changed, 2 insertions(+), 52 deletions(-)
 delete mode 100644 meta/recipes-devtools/perl/liberror-perl_0.17029.bb

-- 
2.34.1


