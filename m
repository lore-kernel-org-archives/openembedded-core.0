Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id F05D67F943
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Jan 2020 13:15:22 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id b6so49605616wrq.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Jan 2020 05:15:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=X9mLV7MER2NEqqmI1IbwWP5bNFiCoaUmxp6RvQ43M2E=;
	b=CbOxPU3r64lL+qmpG7DWdt+8zxd1brzkh8asOIXbqozmYCSwU2wAAPty0e2qN8RUi9
	Z0a2AsrD9d0Ggpzj6hI1VkDAZYp8o51ZduwyHsFkGfMBprZ7N05P268VXJAG964mKnB3
	VjmJF7C9DAuO5xtnGq9bH715IT+cASjNzJQiM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=X9mLV7MER2NEqqmI1IbwWP5bNFiCoaUmxp6RvQ43M2E=;
	b=fNHj2KWCUjPshIRI0wMA8iK5D1bymHCO0Ikz4i2IMQiQ2QgYXMrSG4IeqzOVtosleO
	A5wMxOVaw7m8BeGjpj0KIGfVbWVcXjItF8TDMLEaiXfjYUuZpXY8zPLfYtOsFHNnCi9o
	ja82S8e89vtBVHfFZl1WsOSlDfzL/hAhKfKchHlV5Wk0IcK3xf7xt2dHpgWvBTS8Y3uq
	Zp7RqALb7yM9TB/FXaAsthTS7WXe85N2CEze+lpggA7DvGepm5vwT3aCFRjm45D6rZxL
	3mbdXgvWedF/5v8lrgDWdhrT6Hip6M6UlaL9546CuBwSB5Wcvb591We8aymjSyGdlS+Z
	5BDg==
X-Gm-Message-State: APjAAAXFAmm9QvoBk19b9b7rf3aBj+zlFeqvcf791Wgj/tRicu2POs22
	F7EeDMYXVmM0D/8oBW+GBMTngt09SAo=
X-Google-Smtp-Source: APXvYqxqcUlSzEehFPzATnkO82Ol5tDnoD3LknXOCX4hDY4eL+XAInPW9V/p+C+9umhGYc9ZOE1V7Q==
X-Received: by 2002:adf:f311:: with SMTP id i17mr102780448wro.81.1578316522903;
	Mon, 06 Jan 2020 05:15:22 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	o15sm73629570wra.83.2020.01.06.05.15.20
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 06 Jan 2020 05:15:22 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Mon,  6 Jan 2020 13:15:16 +0000
Message-Id: <20200106131516.6507-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200106131516.6507-1-richard.purdie@linuxfoundation.org>
References: <20200106131516.6507-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Subject: [PATCH 2/2] scripts/gen-lockedsig-cache: Only look at new format sstate objects
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
X-List-Received-Date: Mon, 06 Jan 2020 13:15:23 -0000
Content-Transfer-Encoding: 8bit

We can have sstate directories which are mixtures of old and new layout entries.
Only use the new format ones since these are the only ones bitbake itself will
look at.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 scripts/gen-lockedsig-cache | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/scripts/gen-lockedsig-cache b/scripts/gen-lockedsig-cache
index 6a7d2859104..cd8f9a4356d 100755
--- a/scripts/gen-lockedsig-cache
+++ b/scripts/gen-lockedsig-cache
@@ -80,13 +80,10 @@ for s in sigs:
     prefix = s[:2]
     prefix2 = s[2:4]
     if prefix not in sstate_content_cache:
-        sstate_content_cache[prefix] = build_sha_cache(prefix)
+        sstate_content_cache[prefix] = {}
     if prefix2 not in sstate_content_cache[prefix]:
         sstate_content_cache[prefix][prefix2] = build_sha_cache(prefix + "/" + prefix2)
 
-    if s in sstate_content_cache[prefix]:
-        for f in sstate_content_cache[prefix][s]:
-            files.add(f)
     if s in sstate_content_cache[prefix][prefix2]:
         for f in sstate_content_cache[prefix][prefix2][s]:
             files.add(f)
-- 
2.20.1


