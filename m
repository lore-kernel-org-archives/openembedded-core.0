Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E227AC47071
	for <webhook@archiver.kernel.org>; Thu, 16 Nov 2023 07:37:05 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
 by mx.groups.io with SMTP id smtpd.web10.2310.1700120218310411919
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Nov 2023 23:36:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YiUqQ+l0;
 spf=pass (domain: gmail.com, ip: 209.85.208.47, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5437269a661so3299615a12.0
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Nov 2023 23:36:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700120217; x=1700725017; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+le8dFUwk3qX3eUhekEN7desWBIjQSycjRPVNl/cfNw=;
        b=YiUqQ+l0O70vFhltsSJEmFwOUK9aHV5gJ1K//uWccWPiqQjWZP37aRfdOUTc0oZeN9
         vPgXo1GUmA6TgqeMhGs5b628J3YpI7fO1vF7PXy1i2P7eCqGS8mW9uNVtVpShdBRXjOE
         fuyiFpItyf9k9RPDzSXHVWFJSGLSbQOXBKeWdRzmEY7Aif6leUDgjzkojufGkX+75T/9
         J4JakjsE5Vut2JGQVM4g+plBG5lYe7WQBjviwBtKEkrTHW+8dTPI4AMuwuuI+VYWUUpl
         6pfgvRuYuQFMd2m2aiREKAbsSp82gRTiGF85N/XHm5TiH/7FwGKLINmDz+4cvm2ruKKi
         u9Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700120217; x=1700725017;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+le8dFUwk3qX3eUhekEN7desWBIjQSycjRPVNl/cfNw=;
        b=ndGyFR4hstf5YJqC/wQGmHWg/zKrQf4WWbcrMrBTKOo+RhMrLwn0Es7i5mWcZ8L0Zi
         ZqosMIDuInlJvRykwdEhlOXqT6D8bJODC6wNQ/na7fj/7oOoktt67wKlAhtrvftVsyfr
         p0uCGV4AxocqcVGwad4b0YN5x26HEbh5XxTkNaf/DUbuSh5L+DGAPolR1q4Jc6xXo5JH
         8DYs3rLhvwsfuv41rRyNqDz41uqvMk7jXaCV1d77Nbv131YY3LXLjMAHY5S7/QnRupOR
         0b2F8CTIXNTv5YwvbGM+meoDq22UOSl0h/naX0S8JRMg0CR9tPVkLZrKVCo7ZJHX3ntV
         UBBw==
X-Gm-Message-State: AOJu0YzCmCs84m2sEXhNyJ19x1ERgPF7c3vc1Wu/KRFqOMqAvuDI/44g
	dUllIP7QBNz9AuV2wjP1IihrwEkPezc=
X-Google-Smtp-Source: AGHT+IFvofOs6tORgpqu0Vbjcc/BvMxa7vAZAzU4P8dHtjbQUTuRAMktdLSbsJu485KN8e28Zx6brw==
X-Received: by 2002:a17:907:d21:b0:9f4:1bd6:2d26 with SMTP id gn33-20020a1709070d2100b009f41bd62d26mr1188049ejc.0.1700120216502;
        Wed, 15 Nov 2023 23:36:56 -0800 (PST)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id a14-20020a170906190e00b009c764341f74sm7942568eje.71.2023.11.15.23.36.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Nov 2023 23:36:56 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [PATCH 02/11] ovmf: drop PE, PR from /usr/src/debug paths
Date: Thu, 16 Nov 2023 08:36:41 +0100
Message-ID: <20231116073650.2710535-2-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231116073650.2710535-1-martin.jansa@gmail.com>
References: <20231116073650.2710535-1-martin.jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Nov 2023 07:37:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190754

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 meta/recipes-core/ovmf/ovmf_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/ovmf/ovmf_git.bb b/meta/recipes-core/ovmf/ovmf_git.bb
index 6bbe21ac5c..bf67a2a4a8 100644
--- a/meta/recipes-core/ovmf/ovmf_git.bb
+++ b/meta/recipes-core/ovmf/ovmf_git.bb
@@ -122,7 +122,7 @@ fix_toolchain:append:class-native() {
 # --debug-prefix-map to nasm (we carry a patch to nasm for this). The
 # tools definitions are built by ovmf-native so we need to pass this in
 # at target build time when we know the right values.
-export NASM_PREFIX_MAP = "--debug-prefix-map=${WORKDIR}=/usr/src/debug/ovmf/${EXTENDPE}${PV}-${PR}"
+export NASM_PREFIX_MAP = "--debug-prefix-map=${WORKDIR}=/usr/src/debug/ovmf/${PV}"
 export GCC_PREFIX_MAP = "${DEBUG_PREFIX_MAP} -Wno-stringop-overflow -Wno-maybe-uninitialized"
 
 GCC_VER="$(${CC} -v 2>&1 | tail -n1 | awk '{print $3}')"
-- 
2.42.1


