Return-Path: <daniel.diaz@linaro.org>
Received: from mail-oi0-f68.google.com (mail-oi0-f68.google.com
	[209.85.218.68])
	by mail.openembedded.org (Postfix) with ESMTP id D8E6E744F2
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Aug 2018 17:15:39 +0000 (UTC)
Received: by mail-oi0-f68.google.com with SMTP id b15-v6so11062098oib.10
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 Aug 2018 10:15:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=ZtpArjX6p0IAi307rxgnGcCSIwudpp9y7hLSAx4lWLQ=;
	b=Wt7Pd45quc3JQBqc/rMDBUEyKrI1p3Oj9g1U+O8b2Ggqotpzz1gRj+YEke8ElqMb7s
	oYjDhebTS3VPSXtJ8kkJOmJVkur1lUD50zOYGOdXZ53kuuB4ljispLFP9XUqUi620tZ2
	TgaOOBVHY4ljnQR4P+fUD+3dYsTi3gxP2tsXM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=ZtpArjX6p0IAi307rxgnGcCSIwudpp9y7hLSAx4lWLQ=;
	b=sr8srMpxj5POCRwRis0mbKkxc5Aw4nSl9tMGrIEg3/cLpJc/DjM+uVI+yCNgeDdyoV
	jtDOOGq/WwD9RuTC0KcEj9xEQMLDNL1VuTsNS3Feq6r/AFKcQPTnmZ1RMxmYhoNiXbbz
	toBueqknhauLi2qt8SR1EOSQGsaR5z95aSBENsX2KJ8Vsfq6DxhniiEALxhcD38QKBqc
	+eK/0tW0g90E3XZh+b06t1Qexa/xHbXQtQfCVWiHXBTB4OPLRyLIaYbJS4HFQqNS/3nQ
	3PaaMi1OqwmQ5Q9t1YkynZCTb9/L08q3ykS1cK17ISAORN4ISilZ8tSCieA/QTCCsvRp
	aSew==
X-Gm-Message-State: AOUpUlGNPsy8GWPx7tSw3g46g5tBQEZTrn/GVBEPer2I7hOQ8ve49fJ5
	48wPtV8kAt4cmFgbifYZGfzH7Nc1t8Q=
X-Google-Smtp-Source: AA+uWPyunVjeCVDbZx5im4pGNk8yW7Bk3y9KNFEwzwT3/b145EK8G+PXKF6AW6MbvFlGBJwM+bcJ1w==
X-Received: by 2002:aca:ba57:: with SMTP id
	k84-v6mr2742762oif.10.1533834940584; 
	Thu, 09 Aug 2018 10:15:40 -0700 (PDT)
Received: from aura.cortijodelrio.net
	(CableLink-187-161-193-121.PCs.InterCable.net. [187.161.193.121])
	by smtp.googlemail.com with ESMTPSA id
	m203-v6sm10884127oig.42.2018.08.09.10.15.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 09 Aug 2018 10:15:39 -0700 (PDT)
From: =?UTF-8?q?Daniel=20D=C3=ADaz?= <daniel.diaz@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Thu,  9 Aug 2018 12:14:54 -0500
Message-Id: <1533834894-4576-2-git-send-email-daniel.diaz@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1533834894-4576-1-git-send-email-daniel.diaz@linaro.org>
References: <1533834894-4576-1-git-send-email-daniel.diaz@linaro.org>
MIME-Version: 1.0
Subject: [PATCH 2/2] multilib_header: recognize BPF as a target
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
X-List-Received-Date: Thu, 09 Aug 2018 17:15:40 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

When building with `clang -target bpf` using the
multilib_header, a recursion was unavoidable because
bits/wordsize.h would #include itself, still lacking
a definition for __MHWORDSIZE or __WORDSIZE.

Signed-off-by: Daniel Díaz <daniel.diaz@linaro.org>
---
 scripts/multilib_header_wrapper.h | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/scripts/multilib_header_wrapper.h b/scripts/multilib_header_wrapper.h
index f516673..9660225 100644
--- a/scripts/multilib_header_wrapper.h
+++ b/scripts/multilib_header_wrapper.h
@@ -22,7 +22,9 @@
  */
 
 
-#if defined (__arm__)
+#if defined (__bpf__)
+#define __MHWORDSIZE			64
+#elif defined (__arm__)
 #define __MHWORDSIZE			32
 #elif defined (__aarch64__) && defined ( __LP64__)
 #define __MHWORDSIZE			64
-- 
2.7.4


