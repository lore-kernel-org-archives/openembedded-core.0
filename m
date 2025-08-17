Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5A3ECA0EDC
	for <webhook@archiver.kernel.org>; Sun, 17 Aug 2025 22:58:33 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web11.62768.1755471504658675465
 for <openembedded-core@lists.openembedded.org>;
 Sun, 17 Aug 2025 15:58:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Teeh6Sa2;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-45a1b05d252so23520325e9.1
        for <openembedded-core@lists.openembedded.org>; Sun, 17 Aug 2025 15:58:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755471503; x=1756076303; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NbB//AdBobbj9s0Ve/nE1hbWghFC9kkuvr9LQlEQXco=;
        b=Teeh6Sa2LshYXpsK9ucYQcgEphS3ugDyJco4uIkE6CWNya+EuTpk7rCKr5nyD1n+gs
         RPLCKdSskUm+O2qmXA0eAV7Y8L8WJbGgX08TG7ddjpIccotFnLRaZmOZd50feLZw+hQ6
         WCCLb1gvJANFLftuF/ldQvp0uJ4yBBu38BtBBdgJFPARCLMON/NLNv9N4f69b6tzWn4v
         NfN77c8LU9d/Cq+TD1BKszdlTGhwX5oBoSX1Zk+vBm7jYn7KxAHtEiF9MZB3VNcATI3w
         dwOm+lZ+KCq5VQDd/eSLKK6Aq/SETFgAzNahOLGbRSUIUqk161Nt2q73gxbcJzBvGCJV
         rERA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755471503; x=1756076303;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NbB//AdBobbj9s0Ve/nE1hbWghFC9kkuvr9LQlEQXco=;
        b=JP1oXLYw8VZIp+J7RdOQkEJ41d4IcQU2stwe3kXhIMZlnQvq2/l/dFPjdIT86EEd1N
         zFNkkvpYdwAtuZZM06nRkGOYNqFjQ5A0nPZVI9Rb2adOpNA1PUjNztkyMpctWyEcJhC0
         6lTi4ze6AnjJ9wM+SQy0Tez26sO656AYPviiqMBenYm/5FDvT2FAFP33vVfuf56jPJ03
         lOuTKz9h1YfuoKin7LnDmkEO+EOaKpAZWmFKPxm3gKE/dNYnEIO6w4COfiu+njIln3QM
         q04wgCxnJmckLQqwWefcbosdZfq/NCNl2NsV1FWot6scC/zP7/rOgjEkVfEEv4xYA4eo
         zpCA==
X-Gm-Message-State: AOJu0Yy39gUOwSr1s0gxAyQm0dQ/6oEbNsT9MlAvEir6q/XzsyEA9xV6
	l+26kLEeUq9eQU0lnT2XDFcyb/AknWpb2u4XEmGojtQHJqE0m0aiUKZsLd9Xkw==
X-Gm-Gg: ASbGncs1DtzcDKxAHEjDtI+gmlJd903CaLXy4c3+6KQhu6pwrz9Y0FmkIP9jqal6gHo
	Sld5TgyeYKm4HiFqzxTTHyiwgCX7X7CkUwFLXC86F28YWCWbLCV2T/D4EIwwXZQYBzWzHKzOd2v
	zsACLI3Ey7pJVrShNDKTd8WKpgcI7MBLYl5J1U4tLMNmwjQsUe7b/tgmrH3cko/paq+j7BHxHu3
	HIqGNk8B25pLu4EOihHx+QIblclSQcC9jEO+80cQEVCbvEiDNVhHFK2g/8J/t7YnvyxrygX1uWr
	RxB0oDV6uTzBQXGkfZpxQ0KSKjBqc86jbNKZmykgjLde4oovApSFkGGff+3EboH6ZiWJFBvqXM2
	iAefcdwaXOHiMs4B/dmBMsbDrRD+8FCKvdyJ8
X-Google-Smtp-Source: AGHT+IHhj/FOyBwAS/mBn0tUXkBJs6eHd080vw/ZYzgynS8Db7ObNyfti/pN937qRcGE+0QCt9Zoaw==
X-Received: by 2002:a05:600c:4ec9:b0:459:e094:92c2 with SMTP id 5b1f17b1804b1-45a2185f864mr66309475e9.27.1755471502830;
        Sun, 17 Aug 2025 15:58:22 -0700 (PDT)
Received: from localhost ([109.238.218.228])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-45a1c6bd337sm147694515e9.4.2025.08.17.15.58.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Aug 2025 15:58:22 -0700 (PDT)
From: martin.jansa@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: steve@sakoman.com,
	Khem Raj <raj.khem@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [scarthgap][PATCH 1/2] bash: Stick to C17 std
Date: Mon, 18 Aug 2025 00:58:15 +0200
Message-ID: <20250817225816.2089232-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 17 Aug 2025 22:58:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222028

From: Khem Raj <raj.khem@gmail.com>

GCC 15 defaults to C23 and bash is not yet ready for that
so keep using C17 like GCC 14 for now

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-extended/bash/bash_5.2.21.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-extended/bash/bash_5.2.21.bb b/meta/recipes-extended/bash/bash_5.2.21.bb
index ccfe5c47a7..42ab02c440 100644
--- a/meta/recipes-extended/bash/bash_5.2.21.bb
+++ b/meta/recipes-extended/bash/bash_5.2.21.bb
@@ -22,4 +22,6 @@ SRC_URI[tarball.sha256sum] = "c8e31bdc59b69aaffc5b36509905ba3e5cbb12747091d27b4b
 DEBUG_OPTIMIZATION:append:armv4 = " ${@bb.utils.contains('TUNE_CCARGS', '-mthumb', '-fomit-frame-pointer', '', d)}"
 DEBUG_OPTIMIZATION:append:armv5 = " ${@bb.utils.contains('TUNE_CCARGS', '-mthumb', '-fomit-frame-pointer', '', d)}"
 
+CFLAGS += "-std=gnu17"
+
 BBCLASSEXTEND = "nativesdk"

