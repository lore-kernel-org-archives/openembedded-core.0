Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7648FD5AE6C
	for <webhook@archiver.kernel.org>; Sat, 13 Dec 2025 10:01:29 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2998.1765620082006323768
 for <openembedded-core@lists.openembedded.org>;
 Sat, 13 Dec 2025 02:01:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UKnitpWo;
 spf=pass (domain: gmail.com, ip: 209.85.214.181, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2a0a33d0585so876895ad.1
        for <openembedded-core@lists.openembedded.org>; Sat, 13 Dec 2025 02:01:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765620081; x=1766224881; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mzO8T75toGvYkJXT+PKiaI9Nd2NXaNIdxXM4Iy/PhpE=;
        b=UKnitpWomS+y+6Q7sMmIC3MA+zB8qjVkUq/UD5h6OCxqzFHjwH8lBDaZPiDda8+kpo
         1CColMIzBakc91B3ZYjhy6tnZfuEyoiWkSzms061MBQUjkGWP/jY4UcC/PAhMBi3aPN/
         6JUep2a20duCW1Sr6vw18WmVYj+veeX2yOTB4N2+GTCHxIUIBKh8jx8IULeCjFyuzMHn
         IlNqnswTDtTH6uAHIYmnFHe/cXRUPjF5ovOLwsPCooYC1x/Zb0OAK+9JzdQGdq7oFo3D
         Fu6Ss5xeuYbckZXhrc/nZC9r13ksaP9zdrwS5aIMu7Jj3xiVq4Gxlwegi9geX6Fi/9rh
         rEPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765620081; x=1766224881;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mzO8T75toGvYkJXT+PKiaI9Nd2NXaNIdxXM4Iy/PhpE=;
        b=YEYZObFQMPMyfVGQct2znJUOw74X5U/sHD8rHVmhJpxNjA+86BIw5hGox9v9f5CRX5
         V0P+4kOm+R62kTWwF50olGknmtn7Sda2aY6UCNCWB6XRk6lDw54m/shDoU7X1ykLxD0n
         kbugseCR5Xi5x5xZbM4MUhs00gW2twy/88vhW5ZKbPLo+bIOgHEgYq7CPKNmTiCKV1vt
         kKGFYF8VpV5dQrFMsmMTH4RZLVa+4F67CFdNMqoUr3CqSF3GhZBekzlohi4DwMSeQ/P6
         XyPByIpdRcg9rSF2JykrIMkK4Kbo1SPS+Ba1Rj25SzG0ejHDwWpxYqsDAKMwLSezwokN
         R6hg==
X-Gm-Message-State: AOJu0YzoTqbzsTsRpOYbd68WJotfQMKKZpkciPoGjmu2KyO0guZIjjcf
	AqFD/llJjdNGgHjQ2U3sjZBnaNsmDCuc6TzD/OuOAHCMnC9bnjqoOaOxFvXY61SJ
X-Gm-Gg: AY/fxX6GN0lpWmv01ygh7pD0k9ANcfSgozVj56gXT5+G+kUmy5TAeulEGvikvv3rZba
	izM0e8u0DWoxQTBnhE7gcD4OHN8o7DZf9WARwRp4k6/NuBTHWRYT9ynpUeS90Qi5bQT3ejbLalS
	g+fmAXBUBLhjIIpEFCixvZmd8jq0wXJtWCugBFALRsuXcuDkGLpaauwZeLCKZEkF51MwP6c43wP
	0mtnvQ+UGrZFKew9kVIeeiM9DzTo49AePtctA02VibSvFj/63tZqgnspVWCVEycqLM9v1jFhaTa
	9x0VEsljp7SknCe8/N9JCVEmt6QR10zesMxICA2AOlOUizK3TZZb71eXVh+N9gBDEzmjpkPVcy5
	TVp2aT4GHhnmGMJ82AopnMaH8sMgK2WYkLnKGyzkFrHUuPUcVoSuaibcbusok7Q8gjw2nLc0cuv
	4lQHPgw8F0Yr7GrO+c+HA4f471
X-Google-Smtp-Source: AGHT+IEKR+2gw2HLcID9VJiWzRFL8Zl3hQ1S2bFmM6UK/ndoMeSWE20L9eU5AhBE5pnMgKk7cUSnhQ==
X-Received: by 2002:a17:902:c946:b0:2a0:8aae:b95 with SMTP id d9443c01a7336-2a08aae180bmr20509195ad.33.1765620081155;
        Sat, 13 Dec 2025 02:01:21 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([136.226.230.115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a082b13b6bsm26173725ad.99.2025.12.13.02.01.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Dec 2025 02:01:20 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Yi Zhao <yi.zhao@windriver.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [OE-core][whinlatter][PATCH 37/67] rpcbind: set the owner of /run/rpcbind to rpc
Date: Sat, 13 Dec 2025 15:29:01 +0530
Message-ID: <20251213095931.2571498-37-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251213095931.2571498-1-ankur.tyagi85@gmail.com>
References: <20251213095931.2571498-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 13 Dec 2025 10:01:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227655

From: Yi Zhao <yi.zhao@windriver.com>

The current owner of /run/rpcbind is root, which prevents the rpc user
from creating files in this directory. When the rpcbind service is
stopped, the following errors are logged:

$ systemctl stop rpcbind
 systemd[1]: Stopping RPC Bind...
 rpcbind[270]: cannot open file = /run/rpcbind/rpcbind.xdr for writing
 rpcbind[270]: cannot save any registration
 rpcbind[270]: cannot open file = /run/rpcbind/portmap.xdr for writing
 rpcbind[270]: cannot save any registration
 systemd[1]: rpcbind.service: Deactivated successfully.
 systemd[1]: Stopped RPC Bind.

Set the owner of /run/rpcbind to rpc to fix this issue.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
(cherry picked from commit 80e428924715fa954fc68c381cb0aea19e73a5b8)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta/recipes-extended/rpcbind/rpcbind/rpcbind.tmpfiles | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/rpcbind/rpcbind/rpcbind.tmpfiles b/meta/recipes-extended/rpcbind/rpcbind/rpcbind.tmpfiles
index fecee72c09..65805e7263 100644
--- a/meta/recipes-extended/rpcbind/rpcbind/rpcbind.tmpfiles
+++ b/meta/recipes-extended/rpcbind/rpcbind/rpcbind.tmpfiles
@@ -1 +1 @@
-d /run/rpcbind 0755 root root -
+d /run/rpcbind 0755 rpc rpc -

