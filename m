Return-Path: <tim.orling@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15752CA1007
	for <webhook@archiver.kernel.org>; Tue,  2 Sep 2025 21:46:41 +0000 (UTC)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.web11.89568.1756849599510543985
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Sep 2025 14:46:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=ZPcx/aR8;
 spf=pass (domain: konsulko.com, ip: 209.85.215.172, mailfrom: tim.orling@konsulko.com)
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-b49c1c130c9so4031828a12.0
        for <openembedded-core@lists.openembedded.org>; Tue, 02 Sep 2025 14:46:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1756849598; x=1757454398; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=XoErx3t1xYaaitpObrBlRm8VfUDXY6WCGDSLLkn79Ao=;
        b=ZPcx/aR8fUBlJPpbpqbRqiNvqtcyx/Dvo1yL1hM1v1J3MTutQ1zkey+mTiSRTmxhMv
         iMD0fOdGTMFbaq3LoOVcD5KBxBTfpxZufYfCxtmEA6LlUeKOQxdmKM+63bIgAMk20wVt
         w2w6UTbFiuhPH8HQfYy+jDWCNqY13STkfRX04=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756849598; x=1757454398;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XoErx3t1xYaaitpObrBlRm8VfUDXY6WCGDSLLkn79Ao=;
        b=fprpHMlSqQOVi8ylzU1zTsy3WBlTt6yZapi1OlEdXRd9y2avKx4u5C2Qyof5jRUfHL
         DnrffizBvpO3b0jcwx9ep2gkjQta6RfjYGN+9ycIe7Jjf8cGZYl60CWlrFfr7f3KJoXN
         j7umW/gYpH7c404hI8JHFzLL5LcRVfHMBN94jwv9U4F4qB8us4wdUas1D6la8xWj7Znr
         lg13exbr8pfig4mkCdhBuBGtRTMd3IJRsp9kjjHy/Uw8rS85Vt469FmkHP+YzRg/YHQT
         nwFJB+/oc1oMrsB7iTwsiE/acQuGeVUObj5K06erByAw+F7Uv1OlvYznLSmDDhpMRANP
         LLTw==
X-Gm-Message-State: AOJu0YzOwjxCvL2E2wkGgkFLiLeaByovYwAZhjUXZ3k/nZ7Rg7q0IwGV
	rNL6gSJ6MFr0OJUDE8Ql1wr7ZGLK8jLa01lfxGbp8ssvJvjfN5Df/p2d64FUSMn4nknTYMRungq
	IRSWqjMI=
X-Gm-Gg: ASbGncuS6ApF9EO+XRBk0J3V/9cXam1LhX0QbFbv/N0n5uIrpRD3juy4D++fJTC+67k
	lfvbyoScmW76D7ohh4ptTfN1um1bPRG5WEjpdG3CQPpQ0PMKt9mcUtGvcz0lXbsQfP+B8dXok+5
	zQZO8IbhCX1am8qadAaKcULEvqsuNPD7I4A6lEmai+I+2LjltRybaWtEvocXfu/s0pzSw6XJpdc
	YayeIYQocV0tZ9azR7U0WF2TX0dkyzbr5xZp98a0pCqDBC1GVgjm0xQSnosvS1p8VchdfOXYf0p
	iOFqVTt/QLFKP7AD92lylQyveDVFL5eUrpCdD38V7KNLi4olN1e+9YTWeZdb0s4/iF9FO+Khm3c
	9Qeq3MkzmPvGXsDahsjXZRazpiImS6mE1dPa89HPF2ywsqdww8CyVeDeQQNNhMg==
X-Google-Smtp-Source: AGHT+IH0j+hWz9nPkKnt/5WvLTeQjpX5KngB2vFnhCdsGJGli/1eLmfqN/+ODRg+kqTos8a21KBA7w==
X-Received: by 2002:a17:90b:1b4c:b0:327:dc81:b3a8 with SMTP id 98e67ed59e1d1-328156c747amr16081204a91.21.1756849598332;
        Tue, 02 Sep 2025 14:46:38 -0700 (PDT)
Received: from localhost (c-98-232-159-17.hsd1.or.comcast.net. [98.232.159.17])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-327935eb221sm9299425a91.3.2025.09.02.14.46.35
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 14:46:36 -0700 (PDT)
From: tim.orling@konsulko.com
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/6] Recipe upgrades for 2025-09-02
Date: Tue,  2 Sep 2025 14:46:23 -0700
Message-ID: <cover.1756849390.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Sep 2025 21:46:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222746

From: Tim Orling <tim.orling@konsulko.com>

Built and tested on qemux86-64

The following changes since commit 4ad510a63fd88b7907b2a1b8feceace9758397d0:

  vte: upgrade 0.78.2 -> 0.80.3 (2025-09-01 23:07:06 +0100)

are available in the Git repository at:

  https://git.yoctoproject.org/poky-contrib timo/upgrades-20250902
  https://git.yoctoproject.org/poky-contrib/log/?h=timo/upgrades-20250902

Tim Orling (6):
  python3-setuptools-rust: upgrade 1.11.1 -> 1.12.0
  python3-maturin: upgrade 1.9.3 -> 1.9.4
  python3-cryptography{-vectors}: upgrade to 45.0.7
  python3-typing-extensions: upgrade 4.14.1 -> 4.15.0
  python3-requests: upgrade 2.32.4 -> 2.32.5
  python3-rpds-py: upgrade 0.27.0 -> 0.27.1

 meta/recipes-devtools/python/python3-cryptography-common.inc    | 2 +-
 meta/recipes-devtools/python/python3-cryptography-vectors.bb    | 2 +-
 meta/recipes-devtools/python/python3-cryptography.bb            | 2 +-
 .../{python3-maturin_1.9.3.bb => python3-maturin_1.9.4.bb}      | 2 +-
 .../{python3-requests_2.32.4.bb => python3-requests_2.32.5.bb}  | 2 +-
 .../{python3-rpds-py_0.27.0.bb => python3-rpds-py_0.27.1.bb}    | 2 +-
 ...uptools-rust_1.11.1.bb => python3-setuptools-rust_1.12.0.bb} | 2 +-
 ...extensions_4.14.1.bb => python3-typing-extensions_4.15.0.bb} | 2 +-
 8 files changed, 8 insertions(+), 8 deletions(-)
 rename meta/recipes-devtools/python/{python3-maturin_1.9.3.bb => python3-maturin_1.9.4.bb} (92%)
 rename meta/recipes-devtools/python/{python3-requests_2.32.4.bb => python3-requests_2.32.5.bb} (91%)
 rename meta/recipes-devtools/python/{python3-rpds-py_0.27.0.bb => python3-rpds-py_0.27.1.bb} (85%)
 rename meta/recipes-devtools/python/{python3-setuptools-rust_1.11.1.bb => python3-setuptools-rust_1.12.0.bb} (91%)
 rename meta/recipes-devtools/python/{python3-typing-extensions_4.14.1.bb => python3-typing-extensions_4.15.0.bb} (91%)

-- 
2.43.0


