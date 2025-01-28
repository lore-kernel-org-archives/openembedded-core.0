Return-Path: <omri.sarig13@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86CD1C0218A
	for <webhook@archiver.kernel.org>; Tue, 28 Jan 2025 11:50:57 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
 by mx.groups.io with SMTP id smtpd.web10.15785.1738065051563605436
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Jan 2025 03:50:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bg6lJP7f;
 spf=pass (domain: gmail.com, ip: 209.85.167.50, mailfrom: omri.sarig13@gmail.com)
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5401c52000fso5254871e87.2
        for <openembedded-core@lists.openembedded.org>; Tue, 28 Jan 2025 03:50:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738065049; x=1738669849; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9kG30rFVQg6IEhYgdp//iXx5eFD98tF5RVieIMuXEDY=;
        b=bg6lJP7fcC6BzreLdJunFQnCEYIrRvgknHqGBt3De/vp9iQOLnCoS70D40WPUqoZE4
         bEm1XXrQoUsfbL1VNPWZuH+SASL5kleoAdH7PeeuMUp585hEgE8oTsrCOVSd3R7DhnJd
         tikucei+loNvMsz13C57FG6IzKhEQ7iSRUkgtNArbwv0JQXIp1fw7W8jORU/dy5SxVR/
         lOnonKYbdeLdjwukTwKXlemYufL8HW6gB6rTibfSMeN91tlPeqRxkV+VeBoVFQKWIjJm
         DIj6g3zib9vJRSQlVz4cMaBKaXE4Cd+HiGhB2VmO/aD3rOQJbH7XNXGrM0B2SizQCALR
         CybA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738065049; x=1738669849;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9kG30rFVQg6IEhYgdp//iXx5eFD98tF5RVieIMuXEDY=;
        b=Hv/45YMnoVemYgRXYPYXIQBJpXdOhtvCFPRH9949M/Ixc1ZIxhfq4zWE3EIVp5JDbN
         pNGzA3lf9FCrw8/uusup8ssvD+gZW2PxupNBHS8yWXTzqHvkQjl4cqTXNOKILfwxazCR
         Dz+bJWoIQypOFFyerPtIurJIJ+P0khY6WLipZOqhdusxnA9zSdu9RCrpW7mleu6yl9E9
         JGgvV2x+AP7GlweZfzMhYDCPX9OnR3B1v+lXhuBllmgpUO0C9nHzVOjqv5bdYsJQdWHm
         GPWJ6zztQqHIMzdUimp/iV3vThnhYBNT6RaM8LmWqk/wTCq/kMfnSOaQKOyOBrmBPtU+
         vvuA==
X-Gm-Message-State: AOJu0YyBM0wPUdLiRA4GVXHSoE6Zu85sutoY/bRQi6yrOrP1cgS/Aea/
	8lKTZ+HIAv6PWnURRHsh4bEE08encGo14E1gDSpJiU+sic5mkP77B5GxDMM4ev0=
X-Gm-Gg: ASbGncsLlcifYzCPA8iVwA5Nuy/TSWTrgPsWg/yNMCZqNTGa++q8jEqmrMJhFlrPBKJ
	ItyIEIEk9dbgGIE037sA6JZqGZrGz2qwj827UU1cMLa4ImE0lGZZE1Lwmjakrm2eVZQKSEUjI6L
	DIhBJchVQ6CEPx6EHuD/4fzn0Bn/QrpLOfwGcK2/UcqFrP+HhQbwGLa1vPcU+yAzjP/JGPTzbDx
	+dzCtec9z8m61Gi9UcaUMXtA5OGk3KZn4u7WJ3Y8X/EQl/aHkip+Xf2jOrzD68vRMg1nLYbc4lt
	fmC0AxqlX8EcMs75DhhzfWXn00oC8Bo+FU68CdVKcsm+8EiGwFm4YqXsIbAr0flwne+E2vmssw=
	=
X-Google-Smtp-Source: AGHT+IEe5QZ7dmi4qct2m8PVt32wL/7/LzIEcs7K3CmDCMtcgEBjYzCuddw6trUOMNRe6cqqVRg5/w==
X-Received: by 2002:ac2:511e:0:b0:540:2a92:7da9 with SMTP id 2adb3069b0e04-5439c247dd2mr12877757e87.21.1738065048839;
        Tue, 28 Jan 2025 03:50:48 -0800 (PST)
Received: from omsa-HP-EliteBook-840-14-inch-G9-Notebook-PC.prevas.se ([81.216.59.226])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-543c8379a5fsm1624469e87.193.2025.01.28.03.50.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jan 2025 03:50:47 -0800 (PST)
From: Omri Sarig <omri.sarig13@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Omri Sarig <omri.sarig13@gmail.com>
Subject: [PATCH] python3: Update stringold summary
Date: Tue, 28 Jan 2025 12:50:44 +0100
Message-ID: <20250128115044.4122641-1-omri.sarig13@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Jan 2025 11:50:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210318

The string package in python currently contains common string
operations. This package is still in full use.
However, the old summary line of the package marked it as deprecated. As
this is not the case, this commit updates the summary line to better
represent this Python package.
The new summary line was taken from Python's documentation for the
package (https://docs.python.org/3.13/library/string.html).

In the past, the string library used to contain functionality that later
was moved to the str object in Python. The assumption is that during
this change, this library was marked as deprecated here. However, as
this package contains more functionality, which is still relevant and
used by python, the package itself should not be marked as deprecated.

This commit changes the description of the package, but does not change
the name of the package. The proper name for this package should be
"string" (instead of "stringold"). However, changing the package's name
will break compatibility with anyone using the string package in their
project. As this is a big change, it is decided not to be done yet.
The change in description, as well as this commit message, should be
enough to let users understand that the string package in python is
still valid, and should not be treated as deprecated.

Signed-off-by: Omri Sarig <omri.sarig13@gmail.com>
---
 meta/recipes-devtools/python/python3/python3-manifest.json | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3/python3-manifest.json b/meta/recipes-devtools/python/python3/python3-manifest.json
index 4b7f9cc7e3..f99cc5e2f0 100644
--- a/meta/recipes-devtools/python/python3/python3-manifest.json
+++ b/meta/recipes-devtools/python/python3/python3-manifest.json
@@ -1035,7 +1035,7 @@
         ]
     },
     "stringold": {
-        "summary": "Python string APIs [deprecated]",
+        "summary": "Common string operations",
         "rdepends": [
             "core"
         ],

