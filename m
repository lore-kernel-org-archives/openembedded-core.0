Return-Path: <nathan@nathanrossi.com>
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
	[209.85.210.196])
	by mail.openembedded.org (Postfix) with ESMTP id 84A1E79D87
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Nov 2018 08:47:12 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id s9-v6so70164pfm.13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 07 Nov 2018 00:47:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nathanrossi.com; s=google;
	h=date:message-id:from:to:cc:subject:content-transfer-encoding
	:mime-version; bh=jgl/MosvSLffut8DmOB1XkqRoMxbVF9AKqxVJNfV6CM=;
	b=gmj9KZfm/wgGxznKrq5MQ/05W5D+5Df/I+w3eR7PQ98zUg8re1xaLgflH4Q6xdU9ji
	uPZIE2p3WTSNOhSpNf7aIOdE4fDyxAYWpmdhUCJvSKaJG+r4LWt2FWNoWBqN7eaS1WU3
	Np/qHrdbzmnLr4stdcJlHzU8gUWEnD5wO630RPXTmwIR1QwxvwZ0ims/RosQ+Pv0k06+
	8hA5dWh+xSCU15hGBs9aVK3pt0T1xXzdAhCFvyfiGYfuogdEJtdMtPxWkgSN5tdiDlo3
	35kijwwxNCamOura1FqQag3CVFJuWmRwurPuV4ji6RhpKR73NiEqI3M8etF1OjwYmsEK
	YcNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:message-id:from:to:cc:subject
	:content-transfer-encoding:mime-version;
	bh=jgl/MosvSLffut8DmOB1XkqRoMxbVF9AKqxVJNfV6CM=;
	b=twq/Cfhf6F+v5zWldKEZHYEPcjhN0Zm/qO6/xj4Z9irEYs0zaa9nMzVUkf2YuwkIuh
	RzWeOfkKS46yhwV2xXDPE2lSidHrkUTBUZaLKij9tjjQSMW4XITidgWGmd4f4CQVzYMX
	69ebZa88ERIgKykIiKUsrj2ZYBC/qILFW7KM4UU/d6sA68AsYtSy3enA1pFgOoZkDST2
	puQamFcwbfUbBH512GKLlSmtzW3/UPs1/DaIfdxwwnz7PcVV0AaRTIHybgbnH0BL8EDF
	QtOzX3zj0XTCk7cTescZHXAuqzyK5tt1VGUR+r2wOmoq+kh7NpwInQl6y/+kq8rItf3a
	e2eQ==
X-Gm-Message-State: AGRZ1gLf5S6qIzEfc2oFouuNVDVErEBu9kOOM/J+co1XThI8SgOQsNjm
	oHOdwLf7iyZcdaXEzXS8ploiAQ==
X-Google-Smtp-Source: AJdET5fCdP9BdGvRB9iXDpZjYIeNxBlv/16bBN+q33Nm7Csk6f1c9chns/eLMwZwXa1SlVQMmvN0pA==
X-Received: by 2002:a63:6445:: with SMTP id y66mr889489pgb.250.1541580433547; 
	Wed, 07 Nov 2018 00:47:13 -0800 (PST)
Received: from [127.0.1.1] ([101.184.120.183])
	by smtp.gmail.com with UTF8SMTPSA id
	86-v6sm52437830pft.184.2018.11.07.00.47.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 07 Nov 2018 00:47:13 -0800 (PST)
Date: Wed, 07 Nov 2018 08:47:01 +0000
Message-Id: <20181107084701.5939-1-nathan@nathanrossi.com>
From: Nathan Rossi <nathan@nathanrossi.com>
To: openembedded-core@lists.openembedded.org
MIME-Version: 1.0
Subject: [PATCH] ghostscript: Define COMPATIBLE_HOST with supported platforms
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
X-List-Received-Date: Wed, 07 Nov 2018 08:47:12 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Setup the COMPATIBLE_HOST variable with all supported hosts based on the
provided objarch.h files. This inverts the existing pattern where
unsupported hosts (e.g. 'arc.*') are explicitly set.

This suppresses the warning message generated on hosts that are not
supported but were not listed explicitly.

  WARNING: .../ghostscript_9.25.bb: Unable to get checksum for
  ghostscript SRC_URI entry objarch.h: file could not be found

Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
---
 meta/recipes-extended/ghostscript/ghostscript_9.25.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/recipes-extended/ghostscript/ghostscript_9.25.bb b/meta/recipes-extended/ghostscript/ghostscript_9.25.bb
index 35eaaeb2fa..8b69170458 100644
--- a/meta/recipes-extended/ghostscript/ghostscript_9.25.bb
+++ b/meta/recipes-extended/ghostscript/ghostscript_9.25.bb
@@ -121,5 +121,4 @@ do_install_class-native () {
 
 BBCLASSEXTEND = "native"
 
-# ghostscript does not supports "arc"
-COMPATIBLE_HOST = "^(?!arc).*"
+COMPATIBLE_HOST = "(aarch64|arm|i586|i686|microblaze|mipsarch|nios2|powerpc|x86-64).*"
---
2.19.1

