Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-qv1-f68.google.com (mail-qv1-f68.google.com
	[209.85.219.68])
	by mail.openembedded.org (Postfix) with ESMTP id CAEEE60130
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Feb 2020 17:35:55 +0000 (UTC)
Received: by mail-qv1-f68.google.com with SMTP id g6so3226875qvy.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Feb 2020 09:35:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=/AcFXtD5cJozbWlOnE8J2ATr0tEuelC8gFcqoFeiJ50=;
	b=WPTBkKxXaE6ruxwk0ndJNNYUNzJeoHLNJIpu1xXP6fa7WhOsDT08ZylegQn8UGZkQB
	DtbgLhcNCgMovWwKkgulnBjdJQOByKw1BBj59Br7lbynlEl1Jc8sdKNC/03ZBv+pOL8M
	XjRpCTTJc40r8kQoVJpiFHoNpNQDd5JjL1B+pNKV7eFWcJjJH7V1cUN54VRThah5uKDq
	Z8JdLVYZJtI6pr94aFeqC6exK36bIVcfgnAMPED2KfRMZO9dZKZZ7tQ9rzaOUYnZ8Tw9
	Mx45e41vmYwCZM2mPptWG5D1w0fDW9O9d6XMfeAiyz8Zo5+j2N67eryvlk6QP5IBEaF6
	AHIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=/AcFXtD5cJozbWlOnE8J2ATr0tEuelC8gFcqoFeiJ50=;
	b=j/NquiD+1+7JJ6gNhmn3AGRUJC6dy9rD236t4/ut75bc1a5eYzsdmvEehR/CCDOoyE
	4PB5VHXe9/qUPLa78K/eOx9tOX7i7xshPoUI89G2egFdRzgNDqU8t7oJ4bZ2d8BGiltO
	nXfZ6BXiN9F8g8KBzZFmjI5YDpXocvfUFE1wObZFVJJ537WkTCM2ks9As4OB/S5kxNhh
	9TmLXcWQhXl8EfKAPHVNT3lc35gUG2pZV9cLCaAni8rwz4GL5mF07jV2lLEh54jWi8Qu
	WsmdhvChqbP1sceOFlIN096RRVJxapeYJdN2eTyvi6hfPD7ltv51ZaTEPmp2iLzZI8Wk
	zrLQ==
X-Gm-Message-State: APjAAAWpZb44hrYEWNLoAlASRdUH9E+OCYwyL+S+lIqedwOfH/CeGFT8
	iGrLc9Ap0IU4O6NYdeNkcrNYgDcunVc=
X-Google-Smtp-Source: APXvYqy/UD/Vtl6FMXUxcqXZMT239fiSIbfLA4i2nQwlPSOcxcGoUcpMkDtu+vLmdKRIN2EbrVbwtQ==
X-Received: by 2002:ad4:5a48:: with SMTP id ej8mr3333876qvb.187.1581010556689; 
	Thu, 06 Feb 2020 09:35:56 -0800 (PST)
Received: from localhost.localdomain
	(CPEe8de27b71faa-CM64777d5e8820.cpe.net.cable.rogers.com.
	[174.113.11.95]) by smtp.gmail.com with ESMTPSA id
	e26sm1715138qkm.80.2020.02.06.09.35.55
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 06 Feb 2020 09:35:56 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Date: Thu,  6 Feb 2020 12:35:44 -0500
Message-Id: <d038fa25f2cb9bb5a85dec66d8aeb8fbe468e8f3.1581010425.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1581010425.git.bruce.ashfield@gmail.com>
References: <cover.1581010425.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 01/10] kern-tools: tweak symbol_why to be python safe
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
X-List-Received-Date: Thu, 06 Feb 2020 17:35:56 -0000
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating the SRCREV to pickup tweaks to symbol_why.py to be
python3 safe:

  - we explicitly call /usr/bin/env python3
  - we full specifiy our symbols
  - do not assume that 'None' can be converted to a string

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/kern-tools/kern-tools-native_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
index a4c0b6fb8a..57ec1abc6d 100644
--- a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
+++ b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://git/tools/kgit;beginline=5;endline=9;md5=9c30e971d435
 
 DEPENDS = "git-native"
 
-SRCREV = "7465c8497893ef8f6503c918aeede969f7e9753b"
+SRCREV = "5358eb293399867db05fd73d04ce908d69a03bed"
 PR = "r12"
 PV = "0.2+git${SRCPV}"
 
-- 
2.19.1


