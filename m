Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A57EEC8302E
	for <webhook@archiver.kernel.org>; Mon, 30 Jun 2025 11:19:09 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web10.37336.1751282343033898777
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Jun 2025 04:19:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=cRa2eftB;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-450ce671a08so12339505e9.3
        for <openembedded-core@lists.openembedded.org>; Mon, 30 Jun 2025 04:19:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1751282341; x=1751887141; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lZLxtMs45mvNWjoCfetr1A8mhVUFzMZu1MoFJuzkgX0=;
        b=cRa2eftBhaaB1z8X3hU6uouEt9KwkWZta4xIeqaNShVBCFYcukK+HyJgmDxcAjRc/g
         5VDZqNTw/I04GfULpzBIf48CGTOuGcfxowH7MjZPSEb4lbKfq9mte3WRkUq5IVwaZN15
         WGBRb8e2T17+155koJ/+zDkyOYpXztOJlJmZw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751282341; x=1751887141;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lZLxtMs45mvNWjoCfetr1A8mhVUFzMZu1MoFJuzkgX0=;
        b=nOCLZKs3MnHuRmmbxGfHzH7hS+DHcxeXpHBF4nt46VWLEE7JoWyG8vnYIBdYgF7VZT
         UejSOZJEWD+w9gu7FXO97VlUIojinvvlzEmCgX8k9MD683XCYyxV2uevKksxsh7tRsyU
         uKzC7ihFd+tg5hVoz8Burq8hI/uTynDf1S25+7cSCT+LqVGOim8vflEUtf6S9VKp5JZ3
         CaBW8R1Cr5qMXFl515yRzAAUWMeOVjbDgJNOjkd0DRtiZVg0MPNIkmvYmX3jTssXqRb8
         swbj5rAPmvD/2d6U+tEdIIcClLFpC1/0IDh5W3ukcA2tuOrVw8rHu5pTLxvE6KHtXzkh
         dDog==
X-Gm-Message-State: AOJu0YztvA8pvdr+Z/rQIcAmBncx/YnrRhl8D4+Y3Hjs3kcnDd8ZYaRd
	TLTGw8K7mSdo2nx9zw5u8ubQm+XEBWCNdQ/VQFdnq4ytWMvDKx1myTjVKkndrk1+5W2pnDGMfwr
	QvqL1
X-Gm-Gg: ASbGncut5GDy+26Y4mj8zjrj1GsdzWbMg3nmunw/Sl8G+mZRAmNuAqPAK+D7Ci8AmlD
	bFbpxVsE7TcbH2krcZkEi4coUSadNC04+c982XL7Te6nrG7z09PO62jrPawXRAE4EHPoNuU21Tr
	HSRU3aF8p/XIRVefGQW5QgrAipU2yvG+H32YXfxaF4qZZ9gqiT++Ps5Q2KDCA0+Hrnrc0NKnFUA
	kyRZrT5hiA8pnTHzEppV4ms4sZIA40S0e3ZYk/+uijVD2PxV+QpAs6y9fdwmWQuLpqOMNcLPXwq
	xcqKnflI9gh47/bdDxcdEvrFVJ/SM01HCGq+EGQ/jUPIBWTlBlJcQOEMVQ5xN0BX18vfW6Fj83X
	y0CWV08oZcXvwTx8=
X-Google-Smtp-Source: AGHT+IEsgrXalgxpTY+98PsaBga0kwTRBFhkflHI6gYoe60vI7shBj7PLcb8inIWrEPb7wFCFKsGHQ==
X-Received: by 2002:a05:600c:818d:b0:453:1058:f8aa with SMTP id 5b1f17b1804b1-4538ee4dad4mr142885285e9.15.1751282340767;
        Mon, 30 Jun 2025 04:19:00 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:ea45:3640:e90f:2224])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538a423abbsm134811505e9.39.2025.06.30.04.18.59
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 04:18:59 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 2/2] base: Use OE_SHARED_UMASK for do_fetch
Date: Mon, 30 Jun 2025 12:18:57 +0100
Message-ID: <20250630111857.3425139-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250630111857.3425139-1-richard.purdie@linuxfoundation.org>
References: <20250630111857.3425139-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Jun 2025 11:19:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219512

The intent has always been to share DL_DIR, so set the umask accordingly
to the new OE_SHARED_UMASK variable and match expectations.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes-global/base.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes-global/base.bbclass b/meta/classes-global/base.bbclass
index b86f50e2839..ac145d9fd64 100644
--- a/meta/classes-global/base.bbclass
+++ b/meta/classes-global/base.bbclass
@@ -154,6 +154,7 @@ do_fetch[file-checksums] = "${@bb.fetch.get_checksum_file_list(d)}"
 do_fetch[file-checksums] += " ${@get_lic_checksum_file_list(d)}"
 do_fetch[prefuncs] += "fetcher_hashes_dummyfunc"
 do_fetch[network] = "1"
+do_fetch[umask] = "${OE_SHARED_UMASK}"
 python base_do_fetch() {
 
     src_uri = (d.getVar('SRC_URI') or "").split()

