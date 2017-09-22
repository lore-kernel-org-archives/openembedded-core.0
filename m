Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f66.google.com (mail-pg0-f66.google.com [74.125.83.66])
	by mail.openembedded.org (Postfix) with ESMTP id 75DDB71BFC
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Sep 2017 06:05:40 +0000 (UTC)
Received: by mail-pg0-f66.google.com with SMTP id j16so108797pga.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Sep 2017 23:05:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=19ddPXhHh4EnXjLsdGSGynssIFxeAUsm0+csgf+zQRM=;
	b=UQ+SUIj/mqwlf7e/gJFdHSk4W6iEwl6WM6nARxsr0e1xWG4YzaY7j4PTYz6MXR/4Sq
	h5dW2HSuhiF+rTT48tlv+nlKPugfdGiEwfmMu/lEzJfpmKkIxTG/vmIz4yo3Ph9KREg6
	Igb2zkX6lIu9bjDEwzj987vsxaRPHZ/xQI2Oj+yharbQBavcAGnd/eZ3/fEEXj1XPxFe
	X6e0P65Cuoi8xGJkCThW4xWZCPfc5AfiUPNidj3TuJLtU/wDKZaLgdqhnUF1yooHeo1f
	TvZnUwdCitLdqM1oEjwGi/yU5RYQ6z679yFU0FzAF87DkmweDlJ7La4AMXdM8fxT8JwE
	bpkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=19ddPXhHh4EnXjLsdGSGynssIFxeAUsm0+csgf+zQRM=;
	b=r8f89b1zupD4OsFJauKFJEAiVtza+hPzZNEM4J8bCYrM7cfg8ub2A5WJ0VNxJWaOYd
	1+eozrXY6iO1jkhfrJL7tSSS81UWgqXS8cMB82Tkg2I412CpPCcel5DeYiuJKD3CazvZ
	X01EGU4N4qRiqFQe32x+cMJczyNHkMDR8bWuoHnxIE3B5Jrx00TeJfrh/LQhXtwWPBL3
	Gb14q7NQGcWABU6ilfItVw5NdClwN8XovyyhMjUDEUXX99OReyS7R0FBX6kc2VLvILCA
	0QWy/+/Xf7TT8frwqNc6h/UxUMpmPIEuCbrzJRcba6iMm2E0VturOuL7oODkGI2Zdv8o
	T7YQ==
X-Gm-Message-State: AHPjjUg5p4p/yDdZsAkIb8bd/HJpBaI7KX/Rr0/O4CTHz4P7LuxekXaF
	CNN8HavYCmY8C4ZsW/gBaFeKzw==
X-Google-Smtp-Source: AOwi7QAXd2EzaehlmOrxjMt1HVmCgTYIWYPotvBjHTNXe4jX7VuRxI7e7xJimPkmARqAv9w7g95pZw==
X-Received: by 10.84.149.197 with SMTP id a5mr7760538plh.55.1506060341847;
	Thu, 21 Sep 2017 23:05:41 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::e57f])
	by smtp.gmail.com with ESMTPSA id
	q13sm4843802pgt.87.2017.09.21.23.05.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 21 Sep 2017 23:05:41 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 21 Sep 2017 23:05:33 -0700
Message-Id: <20170922060533.943-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.14.1
Subject: [PATCH] go-dep: Fix build with hardening flags
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 22 Sep 2017 06:05:41 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/go/go-dep_0.3.0.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-devtools/go/go-dep_0.3.0.bb b/meta/recipes-devtools/go/go-dep_0.3.0.bb
index abfeb48370..20ea792c52 100644
--- a/meta/recipes-devtools/go/go-dep_0.3.0.bb
+++ b/meta/recipes-devtools/go/go-dep_0.3.0.bb
@@ -11,6 +11,10 @@ SRCREV = "7a91b794bbfbf1f3b8b79823799316451127801b"
 
 inherit go
 
+TUNE_CCARGS_remove = "-march=mips32r2"
+SECURITY_CFLAGS = "${SECURITY_NOPIE_CFLAGS}"
+SECURITY_LDFLAGS = ""
+
 GO_INSTALL = "${GO_IMPORT}/cmd/dep"
 
 RDEPENDS_${PN}-dev += "bash"
-- 
2.14.1


