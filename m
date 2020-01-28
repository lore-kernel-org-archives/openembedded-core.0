Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id A225E7FED8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jan 2020 15:16:47 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id z3so16472480wru.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jan 2020 07:16:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=EoqpcwxdS3ZbpjZf/y5unptM0hSEP3sC8bnU8tP71ks=;
	b=D8NO4cPr7aXrj7D3tcSa3Z/Ih7cYayNBM80BIbZVTm7Cxwh/wmfQzssssssrg2Jul4
	aKEcfBMbhsX/3DchdW+yVqoGnG54KXUVpxSeDr92vr+GhqEAUBN1OwQ7U3Px3d5TWUDC
	8i0kqfoNWcnYP3We0b+OPtNpDQcuWXWKQ/sa4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=EoqpcwxdS3ZbpjZf/y5unptM0hSEP3sC8bnU8tP71ks=;
	b=Wi+4Z5Y+BnwpsitFoDnFqeWSz4zBTMfnatMhCpbSA3yNt7xr6H20ELr4VHuxYnx+/o
	hzlJ4GiXjGfFKc0+GOZjLm3U/vCLdKQ9VPcWupHLd3AeP5COXzSDU0oss5sO+OjNUhcN
	iEhpT2B5g6P0Tfhc7nUGQjeIEpLc7ZXPTZz7TKbEKUPd+GSywll376sLxiFBnDLOSB5y
	YwzTTP4BALFuRFF7UDuZ1eJVUGt+hvCpmgS8HEjvf7TORxYbuuflB/ZTe4j88BoOM824
	3TSkAhxRlorwnXYLuw5u7HwEQs7d8mdmW3GOS77IccruHtl7B0YpF3VXg/+L+jiUAfOn
	9Bvg==
X-Gm-Message-State: APjAAAV0uDbAtk0izjapcbl3k3BmmQL+Sa5IAOcRAbXJ0pDpIyMv7CXD
	uIBfjpLULMu4cQZnIMvc7WMypUL04AY=
X-Google-Smtp-Source: APXvYqza0XHh6UrxqAvaKX5O8EWVZZuuLFEqSEHZ4nJXcevetfkJXYxxI+3d/Bhg6MWMzjfDiU7Nsw==
X-Received: by 2002:adf:fd91:: with SMTP id d17mr31193401wrr.340.1580224607987;
	Tue, 28 Jan 2020 07:16:47 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	c15sm25711302wrt.1.2020.01.28.07.16.47
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 28 Jan 2020 07:16:47 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 28 Jan 2020 15:16:42 +0000
Message-Id: <20200128151643.9711-4-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200128151643.9711-1-richard.purdie@linuxfoundation.org>
References: <20200128151643.9711-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Subject: [PATCH 4/5] texinfo: Only build texinfo when api-docs enabled
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
X-List-Received-Date: Tue, 28 Jan 2020 15:16:48 -0000
Content-Transfer-Encoding: 8bit

Also fix the crosssdk and cross-canadian cases.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/texinfo.bbclass | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/classes/texinfo.bbclass b/meta/classes/texinfo.bbclass
index 72091c733e5..ba1dd4994e1 100644
--- a/meta/classes/texinfo.bbclass
+++ b/meta/classes/texinfo.bbclass
@@ -6,9 +6,11 @@
 # Texinfo recipe, you can remove texinfo-native from ASSUME_PROVIDED and
 # makeinfo from SANITY_REQUIRED_UTILITIES.
 
-TEXDEP = "texinfo-native"
+TEXDEP = "${@bb.utils.contains('DISTRO_FEATURES', 'api-documentation', 'texinfo-native', 'texinfo-dummy-native', d)}"
 TEXDEP_class-native = "texinfo-dummy-native"
 TEXDEP_class-cross = "texinfo-dummy-native"
+TEXDEP_class-crosssdk = "texinfo-dummy-native"
+TEXDEP_class-cross-canadian = "texinfo-dummy-native"
 DEPENDS_append = " ${TEXDEP}"
 
 # libtool-cross doesn't inherit cross
-- 
2.20.1


