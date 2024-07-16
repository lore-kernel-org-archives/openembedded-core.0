Return-Path: <gudni.m.g@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC31FC3DA49
	for <webhook@archiver.kernel.org>; Tue, 16 Jul 2024 16:01:22 +0000 (UTC)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
 by mx.groups.io with SMTP id smtpd.web11.314.1721145673099909443
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Jul 2024 09:01:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=I3qVji5u;
 spf=pass (domain: gmail.com, ip: 209.85.208.175, mailfrom: gudni.m.g@gmail.com)
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2eeb1ba0481so79436521fa.2
        for <openembedded-core@lists.openembedded.org>; Tue, 16 Jul 2024 09:01:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721145671; x=1721750471; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=B2OgZEeXkrut2opjV7R1tTC1o47JytYfIPovakMRk1k=;
        b=I3qVji5u8m/YTKpEvu/Vin51uxdEgQqxOCNO/JKp/PItim/4f658xlCo8Zt99r0okf
         b/+aHVPCJtfkTA0TRbDTsnwejWcFq2EdTZS+y+1oJYAi6QozXhw84+UmV/aUEOWR7DNN
         2k5Qqj8kJkjog0MSxPgNmjjwDZTUn8AwAZUdfDtlFHDd3gaOwYYQHSas5Dq4pW6QmgoP
         xuVAL6EURRBhncXivLvk8jdRK08GcCghHRd2MgFnZEFNteyTc+bsOYlU43UBJm6QjEMQ
         00PNPE611fJvewy2MZLgY9OEr2/jnMff/d/URzE32cooNA958f22uVRzimxfZk4SkXwp
         Ut3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721145671; x=1721750471;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B2OgZEeXkrut2opjV7R1tTC1o47JytYfIPovakMRk1k=;
        b=BeQVyKJDmM03Ip1yaxvrpeop7AGXqyHsq1OuBZqU5Mn2BbSXw2QnaNBSRxkG+g0Mga
         rnL+VcWQsom+KQxwXuoGlt2ZZMUnQBqEv7OvZLMB9wqJ1UR1DKQFqhGvFjWUN6Cu7E87
         twlucFN0wUPvylG7q8VAsQqUXkRNPYDbDn0DJ9jkLC/+sDYALEOryoxVjEc4VxiIvEQU
         A6yG5RG4jULL0VWaO1FQqpbUlWwN1F7EsrokqSUSMlFqJP8LWmnDJR1OqIHb5VyLRCFo
         Y0MSQfsRsJz+X5+2Ac/EdJeCJhIP1etLk/sMDntvUo7fGOYHcGlfwd2DSE1JaMRw1AQ6
         SEVw==
X-Gm-Message-State: AOJu0Yxh540j5hMITH4VHIoORLyWwM/UimqkOE7Ad8pUhxLhFggf5wTQ
	q1oFSO95CQWp9u7g6XhgzsqR5fKAkOf6ipaGhXiPMzbmjARBzQg396MkeQ==
X-Google-Smtp-Source: AGHT+IFbXK+VjVyMFm5JvsncfWApCK9s5Cjpam2CYO3PCf1Um9UiXOab5Hn3OnCYhoPSx3VgWqns3A==
X-Received: by 2002:a2e:828f:0:b0:2ee:4e67:85e9 with SMTP id 38308e7fff4ca-2eef41eb93amr16881421fa.47.1721145670546;
        Tue, 16 Jul 2024 09:01:10 -0700 (PDT)
Received: from gudni-virtual-machine.localdomain ([81.15.100.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4279f2397f7sm169735845e9.9.2024.07.16.09.01.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jul 2024 09:01:09 -0700 (PDT)
From: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudni.m.g@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudni.m.g@gmail.com>
Subject: [PATCH] bluez5: drop modifications to Python shebangs
Date: Tue, 16 Jul 2024 16:00:37 +0000
Message-Id: <20240716160037.3764-1-gudni.m.g@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Jul 2024 16:01:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202122

All the test scripts are by now Python 3 compatible
and the shebangs are consistently set to #!/usr/bin/env python3
since BlueZ 5.73

See:
https://github.com/bluez/bluez/commit/d31f04aa928ae8fb7a4fc5b0876dd17ea65d4513

The source code was inspected to confirm there are no more
shebangs which reference 'python' (Python 2)

Signed-off-by: Guðni Már Gilbert <gudni.m.g@gmail.com>
---
 meta/recipes-connectivity/bluez5/bluez5.inc | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-connectivity/bluez5/bluez5.inc
index 55aea1f3c7..65dad45130 100644
--- a/meta/recipes-connectivity/bluez5/bluez5.inc
+++ b/meta/recipes-connectivity/bluez5/bluez5.inc
@@ -111,10 +111,6 @@ do_install:append() {
 		install -m 755 ${B}/$f ${D}/${bindir}
 	done
 
-	# Patch python tools to use Python 3; they should be source compatible, but
-	# still refer to Python 2 in the shebang
-	sed -i -e '1s,#!.*python.*,#!${bindir}/python3,' ${D}${libdir}/bluez/test/*
-
 	# Fix the /etc/bluetooth directory permissions when systemd is disabled
 	if ${@bb.utils.contains('PACKAGECONFIG', 'systemd', 'false', 'true', d)}; then
 		chmod 0755 ${D}${sysconfdir}/bluetooth
-- 
2.34.1


