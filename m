Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com [209.85.210.193])
 by mx.groups.io with SMTP id smtpd.web09.641.1603314576576209009
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Oct 2020 14:09:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=C71seb/2;
 spf=pass (domain: gmail.com, ip: 209.85.210.193, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f193.google.com with SMTP id b26so2240384pff.3
        for <openembedded-core@lists.openembedded.org>; Wed, 21 Oct 2020 14:09:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=g8fV/z8j8W8Va1kFcg6/0G+5WCPbUKBnPDN7MbyUxIU=;
        b=C71seb/2qYQFo/6+XDJ+CPAYwuKaxu2mOKiF9l+YqtOGY5DJ3z9ntLRlX2+r8zVAaT
         gIFO4nHi637qJ+F763Tx/T1aVBlfmHQuou+SrKplL1HEoXM+r3KWtlsZrsHRU5NfORfI
         XE7E7W/JKpiaWELuw3bAUB6/3id0gj9SNDjwLYWMzZN27csqokC32/qkGBCapSWRQgcD
         5tn5vJbV07gKQ5AJic8m2UkxEQlf2oDjTAlXBoizTotOdEQf/y3rByD9dO9ooTiLZvV2
         oXXlH3zxL/uov+nniPOQZAr057QULSvcZLtfEimaGepno83xtZ88h2P5CKXsakNAH2iy
         HQtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=g8fV/z8j8W8Va1kFcg6/0G+5WCPbUKBnPDN7MbyUxIU=;
        b=Ssv9w5mSEbWkCJDRXor9UOVloD2p84WtORiZT9yhqYWyINDK7oJJTRBTnZ9yVgkzj7
         n8xKXuuLCSgDPD1nXg5SDoHMYzlZ0YJDv2g8CZFA8dZcRA5oWfbIPIHVBvC2yK+7KFYt
         0WEGRURK8nA1zuGRVIdWX6+qsDOQg4mviGmcXwqOd9bV5E+EfO7ZHTbh16I0ndancB+d
         ui4GQk8V2/yLSTYgE150a1Xlg2lFQh4fr5WpiYfXmXFPgSs3xT03qgETkcPGLL5yxMyb
         21bcJnPTsslOZ+MFSID7czpT7hFUcYuv46JP+x8uHtsUsN8Gn6JSOwQS7nWyx23qE1Os
         CJfQ==
X-Gm-Message-State: AOAM533GyHEzbDtWgo3/yFZlE8T95TMZmKZsD7AXV7vYdIS9firpnpqm
	s0WJjHsAWpQOvoGyBjuEXJmrlITh2BmgAg==
X-Google-Smtp-Source: ABdhPJxodD3P77qjjVv+OFMFXQMksnu9gfJGBk7Eo1NPRb5EarHVgBR7fIQlPrrrATJtW6WIzI6guw==
X-Received: by 2002:a63:f14:: with SMTP id e20mr5196010pgl.52.1603314575639;
        Wed, 21 Oct 2020 14:09:35 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::3958])
        by smtp.gmail.com with ESMTPSA id y22sm3525588pgj.27.2020.10.21.14.09.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2020 14:09:34 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] multilib_header.bbclass: Do not install the stubs for non-multilib case
Date: Wed, 21 Oct 2020 14:09:32 -0700
Message-Id: <20201021210932.984184-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.29.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We mark certain headers which are not usable in multilib case through
this function, this however is a unnessary indirection when building
distros without multilib feature. Additionally it also addresses a case
where we compile baremetal software e.g. bootloaders or BPF binaries
e.g. which are a different target effectively but can be built using
same toolchain with some flags. This does not work when we always
install the stubs since the stubs require a fixed wordsize definition
and that may not be true for the BPF cases e.g. it will work fine when
multilib is enabled since that would have provided the headers it needed
say for 32bit multilib. Currently they go missing for a non-multilib
case and we end up with errors like

recipe-sysroot/usr/include/bits/long-double.h:23:10: fatal error: 'bits/long-double-32.h' file
not found
| #include <bits/long-double-32.h>

Therefore lets install these stubs only when using
multilib in distro

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes/multilib_header.bbclass | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/classes/multilib_header.bbclass b/meta/classes/multilib_header.bbclass
index e03f5b13b2..9ccdf46be5 100644
--- a/meta/classes/multilib_header.bbclass
+++ b/meta/classes/multilib_header.bbclass
@@ -6,7 +6,9 @@ inherit siteinfo
 # all of the ABI variants for that given architecture.
 #
 oe_multilib_header() {
-
+	if [ -z "${MULTILIB_VARIANTS}" ]; then
+		return
+	fi
 	case ${HOST_OS} in
 	*-musl*)
 		return
-- 
2.29.0

