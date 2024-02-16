Return-Path: <andre.draszik@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4ACE4C48260
	for <webhook@archiver.kernel.org>; Fri, 16 Feb 2024 16:31:20 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.web11.1157.1708101078376251712
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Feb 2024 08:31:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=vzmH+9xL;
 spf=pass (domain: linaro.org, ip: 209.85.208.48, mailfrom: andre.draszik@linaro.org)
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5639c8cc449so1264718a12.2
        for <openembedded-core@lists.openembedded.org>; Fri, 16 Feb 2024 08:31:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708101077; x=1708705877; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=PhW9Hplv3gpjs68p1h4XkFthqpTRS8woIJTI9S6a850=;
        b=vzmH+9xLhsj2QSYWplubBvqUC1X1cRm/vNhFEkfuHgMOY3bmEDoJHq/MHmweoShRyJ
         FrsLWGdyYdzv0UMtJv6Gqycf/jA8Dt3C59RqZAkeHJ0RmfFp6izNpv7dwiWz9wYDxrj1
         iuwKFbClPGkrN84KlwCrM+Z0cpvv+NJSOQM7rb6pk1dU6jsvjWCLMmnOEQ3ILBeW3SK3
         HWA/T8PNgrpXIWWDprqo/pQV2SGiw4S29qEroUcxrlK4LY2QSW4ImADYfjug+MJ4dmy7
         6u2/bAS9LF9FPVvDzpla7P484Z3eNigRKCd7bu714xTQWCeeUi336DB/BWz+gt0KGTAA
         9g4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708101077; x=1708705877;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PhW9Hplv3gpjs68p1h4XkFthqpTRS8woIJTI9S6a850=;
        b=C06KsFbl3DHmCQt58jSuwlHhklc+Vp9I8XWXgWpppBtvq+g/HhKX4FHPCPmDVBiaII
         FtOY99r07WvZgHAuIB+XEDinciC6u34n87Qx5EpfJerSga/Ua580l9ZeiqbK78oCqiBa
         15/RqQdqNMdINyhxdIT9YFxRAHdvFZ7MquVR1XXfRgWFT2KY8UTh/LcYtFJrKvo9blQD
         qSaSVnb+AeP1ZLhgvhZbg8CylumMyEKXFyi1ilvdK0wA2UG0Qrbra4G00JE7Yw7T4+Yh
         kj4i+YBxKUI4yddFp27J24PlUGel07ZziuEhEr3M95iMsncKaoC5KG5H2aH20aD2ZvLW
         fGOA==
X-Gm-Message-State: AOJu0YzOIjwjTp2M2wjD4LkTTdkURQwr5QgTycpnsX0LKz4LS4uWa2Gq
	wJaw1hrPbrNAA+PgBuosmpC8Q4r7iS45nqF1tpfg4fi4Sqpt5uYD28g7T2JOQnpiMCPmdfpOFHB
	WA0f2IQ==
X-Google-Smtp-Source: AGHT+IGkA3ptxku0z8SMp2ojJ8ydHT5lQ0NFEviSyTtDItKR8qNmmkvcRhVaUr2YROwNCGUu+QMnkw==
X-Received: by 2002:aa7:c655:0:b0:561:548e:e4c4 with SMTP id z21-20020aa7c655000000b00561548ee4c4mr4111592edr.19.1708101076622;
        Fri, 16 Feb 2024 08:31:16 -0800 (PST)
Received: from puffmais.c.googlers.com.com (68.57.204.35.bc.googleusercontent.com. [35.204.57.68])
        by smtp.gmail.com with ESMTPSA id n9-20020aa7c449000000b0055ef4a779d9sm133632edr.34.2024.02.16.08.31.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Feb 2024 08:31:16 -0800 (PST)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 0/3] support git's safe.bareRepository=explicit
Date: Fri, 16 Feb 2024 16:24:58 +0000
Message-ID: <20240216163113.2751935-1-andre.draszik@linaro.org>
X-Mailer: git-send-email 2.44.0.rc0.258.g7320e95886-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Feb 2024 16:31:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195781

Hi,

When git is configured with safe.bareRepository=explicit [1], various pieces
here just fail. LWN has an article about the problem that this configuration
option addresses and why it is useful in [2].

To test, simply run
    git config --global safe.bareRepository explicit
to add safe.bareRepository=explicit to your ~/.gitconfig, and see things
fail without these patches.

These patches are the first stop-gap step to make bitbake/OE work with this
configuration option enabled. I believe in the future, these should be
converted to invoking git with the --git-dir= option explicitly.

Link: https://git.kernel.org/pub/scm/git/git.git/tree/Documentation/config/safe.txt#n1 [1]
Link: https://lwn.net/Articles/892755/ [2]

Cheers,
Andre'



