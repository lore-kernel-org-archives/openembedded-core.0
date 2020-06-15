Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
 by mx.groups.io with SMTP id smtpd.web12.261.1592258525314315177
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jun 2020 15:02:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=SKO3ZDw2;
 spf=pass (domain: gmail.com, ip: 209.85.222.175, mailfrom: danismostlikely@gmail.com)
Received: by mail-qk1-f175.google.com with SMTP id l17so17333884qki.9
        for <openembedded-core@lists.openembedded.org>; Mon, 15 Jun 2020 15:02:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/h8l8hKIh2UufSQ21R2xJVDvkTHOIOvoRH8tE7f7WDk=;
        b=SKO3ZDw2tVK6CiEu1PczPp9jwTLYLTx8a0wSfvARABl1+oCvJa1gciM3MTDBnAXTw6
         nzEoxY+nR0xDDYsMVcQnADmlQ9EfgH2Ya28DNh5IYiLGyp+LSXTjYf2BbtKa4NRK1yVg
         VnF6KnRs8fpm2psSQZkSyJQGfTSg2KDxApER+PU+/OiSQ1ZK3rXRw2kB8UWFL1SLmzq7
         o7t1VBcbfneuo7GTPtLv2oQ7YPV4F4W2EDrJqfbOMOEK5hznRszgCP2Tz28b3MXbvtza
         /OmXZ3hLXzQNw6xTEtyqqG6SzvPVX4okOg0oALT6WpqULF5HwtwG2r3ABLD0h90E1VpA
         wDgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/h8l8hKIh2UufSQ21R2xJVDvkTHOIOvoRH8tE7f7WDk=;
        b=NKQQQmarC+Ed7/Y12+LVleSUXovQdJJE5oihn2i/hOo6TIgHvUR4PStj9xe4CBa9N1
         5kysZhdKVfuLvLpLGQsG4k5wpEDFuemJhpujd6z3Ox+GcNkTN9LxZvCtsozh8E6zgFr/
         NtvONVcS9NKM2KPHbJkeHtFDI10OOAGJShfIJ/GpFq4ZcVsT4JAymaBKcNvZd0kHEdTx
         apLFEk8fboYl9trCKaMe3Q0swpLBnGslJqR7TRprowScLwiMnFqcFpaJuNnPxgeh6J/d
         BZSIGZ5zxaFQUinUs1R8fs3Pf0v2hysegSR2UH1x1fVXON2rAEtVM0ZpJYu6AzHwM6Ee
         JQYw==
X-Gm-Message-State: AOAM531/8Wk8vvuHo4ElxFoe3NygqXfzTsyV3Alf4wJNE1gW70DtL4ea
	oXuFBYX9uVhQx6OW0HkSPJXn53hNPCE=
X-Google-Smtp-Source: ABdhPJyFKniEe72LanlmtdXsTNtRJT4F2Nq27iJPWmEUL9auFcZfCSJ4pQ+cC3bwLECmsOzQwfBBow==
X-Received: by 2002:a37:850:: with SMTP id 77mr17220383qki.498.1592258524201;
        Mon, 15 Jun 2020 15:02:04 -0700 (PDT)
Return-Path: <danismostlikely@gmail.com>
Received: from nebuchadnezzar.local ([2001:470:30f3:1:bafd:2698:c02f:136a])
        by smtp.gmail.com with ESMTPSA id 79sm12200056qkf.48.2020.06.15.15.02.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2020 15:02:03 -0700 (PDT)
From: "Dan McGregor" <danismostlikely@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Dan McGregor <danismostlikely@gmail.com>,
	Daniel McGregor <daniel.mcgregor@vecima.com>
Subject: [PATCH 3/4] systemd-conf: Accept MTU from DHCP
Date: Mon, 15 Jun 2020 16:01:42 -0600
Message-Id: <20200615220143.4018104-4-danismostlikely@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200615220143.4018104-1-danismostlikely@gmail.com>
References: <20200615220143.4018104-1-danismostlikely@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Dan McGregor <danismostlikely@gmail.com>

From: Daniel McGregor <daniel.mcgregor@vecima.com>

Many local cloud deployments use MTUs other than 1500. To support
them, accept MTU from DHCP by default.

Signed-off-by: Daniel McGregor <daniel.mcgregor@vecima.com>
---
 meta/recipes-core/systemd/systemd-conf/wired.network | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/systemd/systemd-conf/wired.network b/meta/recipes-core/systemd/systemd-conf/wired.network
index ff807ba31f..dcf3534596 100644
--- a/meta/recipes-core/systemd/systemd-conf/wired.network
+++ b/meta/recipes-core/systemd/systemd-conf/wired.network
@@ -6,5 +6,6 @@ KernelCommandLine=!nfsroot
 DHCP=yes
 
 [DHCP]
+UseMTU=yes
 RouteMetric=10
 ClientIdentifier=mac
-- 
2.27.0

