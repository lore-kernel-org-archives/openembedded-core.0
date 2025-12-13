Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DE25D5AE56
	for <webhook@archiver.kernel.org>; Sat, 13 Dec 2025 10:00:19 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2960.1765620011309564453
 for <openembedded-core@lists.openembedded.org>;
 Sat, 13 Dec 2025 02:00:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gbvjNzrF;
 spf=pass (domain: gmail.com, ip: 209.85.214.172, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-29808a9a96aso27483885ad.1
        for <openembedded-core@lists.openembedded.org>; Sat, 13 Dec 2025 02:00:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765620010; x=1766224810; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jG6Vrtzmar7S1QKfKecUcDFC46Pwx4fPDRZquok3nJo=;
        b=gbvjNzrF7Kb1GiBZHHFC3JkgvqAbDIylfDPYB6tX7IGxLQJaMKFvt+DunN+fk2PeJq
         rC8VlSfQXtAxhGORwVBn21OVXx36VjEKB8L3XYgPTIDOeKcJxud50RKuz/AUQmsU7riK
         +FQTbm7PSlC6szxz/i4ioniz58qg1RjMpYkVVjpJyBOoaslWdbCj99hiuw2affvkUys8
         PIio47wd+AMy4YmGEA7G94C6sZ76Pq4Ba/e2TtgWQ/XflAt4ZXQneGJ1tZGyuuUV1PXs
         b7TM2kAozKpBYWG/bxXjJv7WfmPuYFoHfWAprbvhg+eDoa+rsmZv+JJn17yWmUukdIVf
         engA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765620010; x=1766224810;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jG6Vrtzmar7S1QKfKecUcDFC46Pwx4fPDRZquok3nJo=;
        b=s8aD+J0aeD4rrmbvcVdkaWKR4GemBckNn1N48YHaG6zwKnqImvxcR2KJUU8CN5tLC/
         XpH1Nwtbq1MGM8EJRZn/BiAJTo5+32dwYjX9WO7oRTw8zZ0jKIjRI1yUUkaI6qsTs94i
         mFhobV6DpY6J1fFyutc+UrcbzMfQGx37cmD3iLy4ZDXWISXxwut1lX42jbsR4hsFjNxg
         aJHErhi1blOaJBm8Hvq2VHxhxjzvgpkI+ilpur/H37wExr3CA0lW0tXV+6tlrAyjCsa+
         iCDDhdSxktI3Ba5T7ClFB7oCQmhj7lTLKjI+5f8v/p1Pedy8qnK14fPCUucqMpUpz+Br
         O8lw==
X-Gm-Message-State: AOJu0YxHv6F/jF4SNrkVifr3lz0dmYnRwCvzwRFVv1uR28bXfVZDDSyS
	M/oLT6jaiuw6NQtMUSBaxxHoEXDKEgVmtTKjMu/bckVsbliRMqO+M8E89QrMxwM9
X-Gm-Gg: AY/fxX7i7gAv9TvidjnGqB9LeG7IM6j48bYNaiHNSlgopfiKlazVDdzkEHZkr9BP81v
	pnvnolGz6BP4aOv+xU4yHC83/f0jxy7iTP+8gIg2xbN87+hIvh0w5t7AYVCLp+zC3S64ojhuLb8
	tdfCrEovQWHcx/IDs35TdYhSX/zASiZYPb5VDzRQt6JTgFMW/PrBPIX7camas1JIgcuW+pvaZro
	cNn8JiRehjInW0WzmJanpAjL6StextBjih9ccLaDLyZfgKyaZkGi26uMhaY7w4XJANgnEYtgLop
	7kYs1s1TJVzg++4D8Fd+336bE8KdBMVCA4KVxitaia0Bjhs59obo9VjbuLE4b0iajzzTNHmmNoD
	Xj5hMDhVtYwXm01qVEOw+IBUBMuz/PeWmtYA+hQVpCrdgQF00ZWqFhvJS6C3gIvOBLJMww8m4OI
	10F2pJXhN2Q+ByCS1j2IZ4gN3d
X-Google-Smtp-Source: AGHT+IFrfK9/mQVq5sVLz1o/teF/P7OpERzEMGJ4mMVjs9LVKbaaF+Jjv5yrOk34fhoKbM/H7UUPUQ==
X-Received: by 2002:a17:903:1b30:b0:29f:1fad:8e50 with SMTP id d9443c01a7336-29f23dfeb24mr45318055ad.3.1765620010500;
        Sat, 13 Dec 2025 02:00:10 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([136.226.230.115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a082b13b6bsm26173725ad.99.2025.12.13.02.00.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Dec 2025 02:00:10 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Ming Liu <liu.ming50@gmail.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [OE-core][whinlatter][PATCH 12/67] bash-completion.bbclass: put bash-completion package to PACKAGE_BEFORE_PN
Date: Sat, 13 Dec 2025 15:28:36 +0530
Message-ID: <20251213095931.2571498-12-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251213095931.2571498-1-ankur.tyagi85@gmail.com>
References: <20251213095931.2571498-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 13 Dec 2025 10:00:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227630

From: Ming Liu <liu.ming50@gmail.com>

It was observed when FILES:${PN} contains "${sysconfdir}" or
"${datadir}", the bash-completion files wont be installed to
bash-completion package.

Fix it by putting bash-completion package to PACKAGE_BEFORE_PN, this
ensures bash-completion package get the files packaged before PN.

Signed-off-by: Ming Liu <liu.ming50@gmail.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
(cherry picked from commit 414156210a4912f1911e36ea00795fdfae7e1b71)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta/classes-recipe/bash-completion.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/bash-completion.bbclass b/meta/classes-recipe/bash-completion.bbclass
index b656e76c09..5371d3e625 100644
--- a/meta/classes-recipe/bash-completion.bbclass
+++ b/meta/classes-recipe/bash-completion.bbclass
@@ -6,7 +6,7 @@
 
 DEPENDS:append:class-target = " bash-completion"
 
-PACKAGES += "${PN}-bash-completion"
+PACKAGE_BEFORE_PN += "${PN}-bash-completion"
 
 FILES:${PN}-bash-completion = "${datadir}/bash-completion ${sysconfdir}/bash_completion.d"
 

