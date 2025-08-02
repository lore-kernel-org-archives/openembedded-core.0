Return-Path: <anakin@childerhose.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91EFDC87FD2
	for <webhook@archiver.kernel.org>; Sat,  2 Aug 2025 21:01:02 +0000 (UTC)
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
 by mx.groups.io with SMTP id smtpd.web10.5968.1754168458060584611
 for <openembedded-core@lists.openembedded.org>;
 Sat, 02 Aug 2025 14:00:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@childerhose-ca.20230601.gappssmtp.com header.s=20230601 header.b=VKXiC2i+;
 spf=none, err=permanent DNS error (domain: childerhose.ca, ip: 209.85.160.181, mailfrom: anakin@childerhose.ca)
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-4abac5b1f28so31550411cf.0
        for <openembedded-core@lists.openembedded.org>; Sat, 02 Aug 2025 14:00:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=childerhose-ca.20230601.gappssmtp.com; s=20230601; t=1754168457; x=1754773257; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PoK0Vr6Jffega9oTR2hToELw8vwm6rfwDDXLkxysUl4=;
        b=VKXiC2i+XHlpN4CDIG0UorBlbzv7OLpB1D0XI8JkHs1lH37dlVeAfWvUnk0wK1+iia
         BtV/J6nZ88K/LNSgrdm820lmnU79eVnk1W0oOA33feI3gtQsNGj5bHiZie/UkPJowNqH
         3rPkT+KohbIvCCYJNRjiok/Z2I3m/sElOobLaK/Ir7/bo9kIrwBp+wimnMZwolA8zh79
         J8ZXadulUdHhkspXiBTt6t4jr639FBqtso47jZMm9Fw2UqqObv2CZlkzZddybik1Suy0
         NjmM+3vKuHYicQ8N+xOv/gH5KkmiTALMM7kQg+3GGks3SijeX0UiSbiUep+jzncdVMIs
         sgSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754168457; x=1754773257;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PoK0Vr6Jffega9oTR2hToELw8vwm6rfwDDXLkxysUl4=;
        b=RUruQSai9YnTjazuHAQmLQes77kIS8pCnWQk7iQQJ/DjLZb8DtyRUxuS5JsWKby9a5
         zxWS1VyGC0AXZ1+qHFn9cUlTBXM0KRI+W027mNI9OtpGcO3kU9VEXGsfYh7/D6obd0Wi
         rVyxbq0kg54XP26356qBR8FOW8FrLk3Tf+D/wN208f0clBlYfMKl9sJL7LzV4wwmKdkP
         pFO5NAaHKwMEgSMtX4NDBIzsfyJrd2dakNa9mX9WQ988aq6ybCGsfTEgT07Vp9vDicMP
         6T/4z+138gJXf3JUMAkNZbunnIh6lhNJ5YaB5KvovfwtJy5rAtwCwxek4KlBg+NLKxhA
         RHEw==
X-Gm-Message-State: AOJu0YyV+JIOj3QPiy4T8oMAJt2211ImCFraovy/GxyDkW6rb0ujHbM/
	vxo5v7nAznz8tBgoueCMRcbvZcd12szJ4p/X2LeW8/H6QkhtxNqQvMfvr5vQElHOb2XHhu0QmX6
	Sk7ecwl9bbg==
X-Gm-Gg: ASbGnculRBoag9YUhI0YXOSqS4ASNBAapJlCWPbEIJUu21N3VHfwuDCi7LMU1Og5Xq/
	u2OVTQpbKq3p4uCnUwp18zVPkXZujK7q0PKNVrPmSw3u2plgk83g17rLJTBlyPg2X12ntswR5w5
	pCFOvXPHs4nRIh17fdharhf07poSbQdxEN9oH8MPLWadQjrqJQ6f2lBEhTwBWBiU0yL9ZF1zoQA
	PpjwiN2HBt9tIA5ADc++qxGxFRVyG6Y/NjiLWXmN/TN2NkZF3MlJnfGb5pUciR9PHYr67HgCIBO
	DX99Hqf82IS+Durr5y07F8UjLaZjuHg1xpgchQRyOIYgH0U/YzoemUfZ7cJVFLH8mtrZMRLJPUq
	VBj8J+KZ6/7h6z5o0Fk/2EI/Nkc0=
X-Google-Smtp-Source: AGHT+IF9WhCXiZ/oYJCj4JlgJ1+0+Ib0m3NQ0fDTfi/XJYlj8EG/NDnPL1YEWpZkVCqTK31uFDywDg==
X-Received: by 2002:a05:6214:1d2a:b0:707:4c65:e71c with SMTP id 6a1803df08f44-70936241e72mr58125196d6.30.1754168456661;
        Sat, 02 Aug 2025 14:00:56 -0700 (PDT)
Received: from vader ([198.16.184.245])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-7077cde5a01sm39134646d6.70.2025.08.02.14.00.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Aug 2025 14:00:56 -0700 (PDT)
From: Anakin Childerhose <anakin@childerhose.ca>
To: openembedded-core@lists.openembedded.org
Cc: Anakin Childerhose <anakin@childerhose.ca>
Subject: [PATCH 0/2] Automatically add compile_commands.json to ${S}
Date: Sat,  2 Aug 2025 17:01:05 -0400
Message-ID: <20250802210107.19804-1-anakin@childerhose.ca>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 02 Aug 2025 21:01:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221385

To better take advantage of Meson and Cmake's automatic generation of a
compile_commands.json file for the clangd language server, link the
${B}/compile_commands.json to ${S}/compile_commands.json.

Anakin Childerhose (2):
  cmake.bbclass: inherit compile_commands.bbclass
  meson.bbclass: inherit compile_commands.bbclass

 meta/classes-recipe/cmake.bbclass | 2 ++
 meta/classes-recipe/meson.bbclass | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

-- 
2.50.1


