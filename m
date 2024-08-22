Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08CD6C54731
	for <webhook@archiver.kernel.org>; Thu, 22 Aug 2024 09:35:52 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web10.9517.1724319343684856660
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Aug 2024 02:35:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=h6pZX7u+;
 spf=pass (domain: gmail.com, ip: 209.85.208.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5c07eebf29eso28062a12.2
        for <openembedded-core@lists.openembedded.org>; Thu, 22 Aug 2024 02:35:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724319342; x=1724924142; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VBjbihm3mWhz8glkN1gkhG+uwuum6RgIeJmIdjMDfD8=;
        b=h6pZX7u+g4i/tb70Z1B/Zfr5t0X0Fyvdx7bUQwj1DZ8tVl2AL8qJV+mL42o2v+54uR
         WXd4t4I/uZeEiJh+790hd51HgwQOejmNfE3374f/0VJ6ntcbvZuj7iJofKIV4tJj8+8C
         5eyH2lul5hUetZsd4lqqZzJPVBMDNy8i5p2NJwhARQ/GT+RBu620/4E/URjUVP68rAiW
         /ycFtCpPmNK4UlCTKrR7W13/E1371Rc4Lcoq44xJBT9b6FNSithXl1WVQgGa0wxc+6q6
         HGzGWBuAusszIH+lIbwMr+rqMbYYaTO2q3OyJ80374KXNt37tde1bojElKYn+waa6cLN
         SROA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724319342; x=1724924142;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VBjbihm3mWhz8glkN1gkhG+uwuum6RgIeJmIdjMDfD8=;
        b=aRZB9y4ahADKJrlvdwoMfK0vFzzRQR7kSbzkELx9PXDX+yeP/g5necLHAjU2++yRut
         koy+970U+PmAYCTkpLrpk2tjH5weZILen0mndbzPfM6MqAKogDGG9ZVLjxqUUp5zQiVl
         pAccalkTs6t63kgu60wzk5S70pxMJ4wbpW8/z3oL8AW4EnrSnqiWz3t39D0WCf0zmr7t
         hfPCMyu+MPM4UK0ZQqx9qe/S8AvbfG75Iq5GxwrkYgLbeU0oRPSAsSAA0v8mFp9xCXxT
         iFnjSB8l30KdAUTWHoItPuYgoDbz87oKjQa82osO04Tvbh8D/kKs5WoKMpe72wZsPIxY
         hJCg==
X-Gm-Message-State: AOJu0YwMHCGJnnXs2+TfLKs21XD7GlZPxFPD0Pd6gIBn/3qthia4Ftkk
	F9vhUTasYATupiPUd0uHqZbsXR3mw+NmmjLtCFPJ6OR9N7Bk+ZnH50SO/Q==
X-Google-Smtp-Source: AGHT+IHN1lu6+57W5R9zOClrBTau0t3V14GLiMQ6PPjt6Kt8M5R/WFEikMvJcyqtQVHTU0u37pTUBQ==
X-Received: by 2002:a05:6402:430c:b0:5a2:c1b1:4d3 with SMTP id 4fb4d7f45d1cf-5c079294a3dmr1430131a12.28.1724319341608;
        Thu, 22 Aug 2024 02:35:41 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c044ddbce5sm698502a12.4.2024.08.22.02.35.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Aug 2024 02:35:41 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 26/32] python3-webcolors: upgrade 1.13 -> 24.8.0
Date: Thu, 22 Aug 2024 11:35:15 +0200
Message-Id: <20240822093521.36790-26-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240822093521.36790-1-alex.kanavin@gmail.com>
References: <20240822093521.36790-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 Aug 2024 09:35:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203641

From: Alexander Kanavin <alex@linutronix.de>

License-Update: copyright years

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...{python3-webcolors_1.13.bb => python3-webcolors_24.8.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-webcolors_1.13.bb => python3-webcolors_24.8.0.bb} (77%)

diff --git a/meta/recipes-devtools/python/python3-webcolors_1.13.bb b/meta/recipes-devtools/python/python3-webcolors_24.8.0.bb
similarity index 77%
rename from meta/recipes-devtools/python/python3-webcolors_1.13.bb
rename to meta/recipes-devtools/python/python3-webcolors_24.8.0.bb
index cea2a971d33..1998cfc4c17 100644
--- a/meta/recipes-devtools/python/python3-webcolors_1.13.bb
+++ b/meta/recipes-devtools/python/python3-webcolors_24.8.0.bb
@@ -1,9 +1,9 @@
 SUMMARY = "Simple Python module for working with HTML/CSS color definitions."
 HOMEPAGE = "https://pypi.org/project/webcolors/"
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=702b1ef12cf66832a88f24c8f2ee9c19"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=cbaebec43b7d199c7fd8f5411b3b0448"
 
-SRC_URI[sha256sum] = "c225b674c83fa923be93d235330ce0300373d02885cef23238813b0d5668304a"
+SRC_URI[sha256sum] = "08b07af286a01bcd30d583a7acadf629583d1f79bfef27dd2c2c5c263817277d"
 
 inherit pypi python_setuptools_build_meta ptest
 
-- 
2.39.2


