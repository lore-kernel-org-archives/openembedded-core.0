Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0B80C54FB9
	for <webhook@archiver.kernel.org>; Thu, 16 Nov 2023 07:37:05 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web11.2231.1700120219316172250
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Nov 2023 23:36:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=i4Jl6OX/;
 spf=pass (domain: gmail.com, ip: 209.85.218.47, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-9ae2cc4d17eso70162366b.1
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Nov 2023 23:36:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700120218; x=1700725018; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FmojZAcuGR4/4QAUc9LCETDtv1cjRHveZxKp5iPAs2g=;
        b=i4Jl6OX/BY3mFQMR7Wmeg44fYZBpq1E9gNlqpH7Vkp+S8nOdB2fJBWjHD7LqaeWBph
         gZm+M1vVVOccSYGMW0VaQpTQfR7zmum9zINByAec4FhLhppQ/F7oG8KfDNuQo1b4agAd
         dxlQHkQFC7eI7Qt+3opVu19wF1UcLX9CodgPZGEf4Uj8e/cydWBHLjygE9/jrooB5O3Q
         jnkE+wSKJRwM96zVYoU/sKAGGoFLIqbYGLdQIqUGuEHFLZZl3pOUB8obF8BLNedXkVpf
         iJDKDZFt0C1O+Hu44q5tQHHcoyasIczRyJY00h4tCYOqB1CUJMbikb/BW4r7e1USZgKP
         LDbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700120218; x=1700725018;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FmojZAcuGR4/4QAUc9LCETDtv1cjRHveZxKp5iPAs2g=;
        b=NU562mS4L3WzPakzrr0kJ90+pNNZPZvgfpFRjKobtU6m7UqB8K7LvTofIMVVePC2/5
         XhLRcG+KURDB/YeAtkPAtOoC0YME8xrqcxtEuZTdI0o4EE14v9kaIH3w3rqy7jcqPClz
         K3kDJF7K1QUSoTcTKVtfsPDl19KQhuY3byhBGp7kA3gGURgmF/TQECBZjgI+JUEfq5cU
         Xz4YdhtyKaVlBdWNPW8VJkgcqOnISpGi7fDIQV5VZY6Y3yoQZXmXx7PcdwxwfjJyQUo0
         oQQhIIHBxSEts9g6D/clezFvbXfURpnH7fkMVGxrjj3uViaAwnEwg3eFA/xfrYYWcBTl
         Q7jg==
X-Gm-Message-State: AOJu0YyNyOF549L48rwJQCFOQfTKp3fucP7zOMVo2ekUqVmEAP+8HKNG
	Lgsdp9Ta+lppEWd49vQMHvBKbv6ymaQ=
X-Google-Smtp-Source: AGHT+IFpXg7+CebY9/rmXiWuLymZpYo0N1njDiRKXB+QIQhh1kuuYIK/LJdvgVPGO+xEiEoUCEchJA==
X-Received: by 2002:a17:906:dc9:b0:9bf:63b2:b6e2 with SMTP id p9-20020a1709060dc900b009bf63b2b6e2mr11733972eji.26.1700120217526;
        Wed, 15 Nov 2023 23:36:57 -0800 (PST)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id ga23-20020a170906b85700b009ae587ce128sm7954645ejb.216.2023.11.15.23.36.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Nov 2023 23:36:57 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [PATCH 03/11] go-cross-canadian.inc: drop PE, PR from /usr/src/debug paths
Date: Thu, 16 Nov 2023 08:36:42 +0100
Message-ID: <20231116073650.2710535-3-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231116073650.2710535-1-martin.jansa@gmail.com>
References: <20231116073650.2710535-1-martin.jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Nov 2023 07:37:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190755

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 meta/recipes-devtools/go/go-cross-canadian.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/go/go-cross-canadian.inc b/meta/recipes-devtools/go/go-cross-canadian.inc
index 45758f3361..0a72e89bbd 100644
--- a/meta/recipes-devtools/go/go-cross-canadian.inc
+++ b/meta/recipes-devtools/go/go-cross-canadian.inc
@@ -8,7 +8,7 @@ PN = "go-cross-canadian-${TRANSLATED_TARGET_ARCH}"
 # it uses gcc on build machine during go-cross-canadian bootstrap, but
 # the gcc version may be old and not support option '-fmacro-prefix-map'
 # which is one of default values of DEBUG_PREFIX_MAP
-DEBUG_PREFIX_MAP = "-fdebug-prefix-map=${WORKDIR}=/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR} \
+DEBUG_PREFIX_MAP = "-fdebug-prefix-map=${WORKDIR}=/usr/src/debug/${PN}/${PV} \
                     -fdebug-prefix-map=${STAGING_DIR_HOST}= \
                     -fdebug-prefix-map=${STAGING_DIR_NATIVE}= \
                     "
-- 
2.42.1


