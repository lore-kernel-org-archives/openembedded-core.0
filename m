Return-Path: <jermain.horsman@nedap.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB7CBC4167B
	for <webhook@archiver.kernel.org>; Tue,  5 Dec 2023 14:28:40 +0000 (UTC)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
 by mx.groups.io with SMTP id smtpd.web10.101894.1701786515917295881
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Dec 2023 06:28:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PmLCjNdM;
 spf=pass (domain: gmail.com, ip: 209.85.208.54, mailfrom: jhatnedap@gmail.com)
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-54c70c70952so4566895a12.3
        for <openembedded-core@lists.openembedded.org>; Tue, 05 Dec 2023 06:28:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701786514; x=1702391314; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:reply-to:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rYF3zcTwWpQQJpvCs6MVvCLwabYvWtwLashpYr18kyc=;
        b=PmLCjNdMjgF6gIL2FabzV6dNprjmU/G1qgmimjhPsjaw3ykchAnP3eqLaRL5nF3Lnw
         VVVMP/YtkIKQvkme3haRI0mrbt1JLWETUuOBqT+thNmuG2ucJwwnGfHOeBCO45aHM7G3
         eo4zRISHRaxF+uUqa8bZtF7Hw8+WqUhL59IlYpy1g4Hk39Dpw71PYdEMuC2m6+lRq980
         Kj6JNepuBlEcNiWYzdly6shjXsHjyf4IEXpa9MGEnGCRpeTh580WF55jQyw4FeuRR9dG
         u/jkQNIm+anKB9MBq2BoLVMBejPqSKaA/ze3sEMc+LgG0wdenMt9xEpA0/7HayyaH9/H
         SItw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701786514; x=1702391314;
        h=content-transfer-encoding:mime-version:reply-to:message-id:date
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rYF3zcTwWpQQJpvCs6MVvCLwabYvWtwLashpYr18kyc=;
        b=ZJC4xhChq9/tWBXggLCdYCKpdtoFeYnqThWxH1UwVYPp4S6eo1wdLWyv0jQhOVmyWr
         IqJwqoDe8cxTP+IbprW4eg4vadnAXuqKh6zKRWa4Uw3lyRfpOjnjft9Y76vPiKoW5IyK
         2eMAX68svcz9oHVHDQ3Wrni/8wCqbxCttb3Fghx/Pi8tqpehX31wLUAR+xEgjW1O/4XB
         SBws3HVsYtF6ws08JqNAKEjBsZIiY26GyOz0QFZ+8TY+KSEp5fCQvLsYlYLjD+Uwql98
         klpd6/+w5BDkRHB/FbvTTMW2sLoV/Y3zLWqe/ClX49BvoDUrzgOfKYR5FQ4XkDi0+hEb
         XY1g==
X-Gm-Message-State: AOJu0Yw8XB8NN9pkpRH48kLbpsJEvvp7Nk9wqbK5zZ5LSJ152Ot0wvOD
	e13vezogpb1JCLcMd8gkid3iqKs8i8M=
X-Google-Smtp-Source: AGHT+IFKvE7ubtdoxqOPEvqYRzvHCWaFrgdQGQN9PGIx4YPfCl7rgk5h4CEotH8L8sx89SSrRmms8w==
X-Received: by 2002:a50:d787:0:b0:54c:4837:7d3b with SMTP id w7-20020a50d787000000b0054c48377d3bmr2792632edi.122.1701786514173;
        Tue, 05 Dec 2023 06:28:34 -0800 (PST)
Received: from NVC4181.nedap.local ([149.3.168.10])
        by smtp.gmail.com with ESMTPSA id v12-20020aa7cd4c000000b0054c52a78f56sm1174043edw.56.2023.12.05.06.28.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Dec 2023 06:28:33 -0800 (PST)
From: jhatnedap@gmail.com
X-Google-Original-From: jermain.horsman@nedap.com
To: openembedded-core@lists.openembedded.org
Cc: Jermain Horsman <jermain.horsman@nedap.com>
Subject: [kirkstone][PATCH v2 0/5] Failure for rust-cross for arm(v5)
Date: Tue,  5 Dec 2023 15:27:15 +0100
Message-ID: <20231205142810.826-1-jermain.horsman@nedap.com>
X-Mailer: git-send-email 2.42.0.windows.2
Reply-To: jermain.horsman@nedap.com
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Dec 2023 14:28:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191822

From: Jermain Horsman <jermain.horsman@nedap.com>

I ran into the following when trying to compile rust for arm (on kirkstone):

Exception: TypeError: int() argument must be a string, a bytes-like object or a number, not 'NoneType'

After some investigation I notices some patches on master which were not
available on kirkstone.
Using the patches included here I am able to compile successfully.

v2:
I've included all patches that were originally send as a series on the
mailing list.
I've also included a single patch that should prevent the issue with the
oe-selftest reported on the first version.



Richard Purdie (5):
  rust-common: Set llvm-target correctly for cross SDK targets
  rust-cross-canadian: Fix ordering of target json config generation
  rust-cross/rust-common: Merge arm target handling code to fix
    cross-canadian
  rust-cross: Simplfy the rust_gen_target calls
  native: Clear TUNE_FEATURES/ABIEXTENSION

 meta/classes/native.bbclass                   |  2 ++
 meta/recipes-devtools/rust/rust-common.inc    | 24 +++++++++++++------
 .../rust/rust-cross-canadian-common.inc       |  5 ++--
 meta/recipes-devtools/rust/rust-cross.inc     | 21 ++++------------
 4 files changed, 26 insertions(+), 26 deletions(-)

-- 
2.42.0.windows.2


