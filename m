Return-Path: <Yash.Shinde.oss.dev@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52D1DCD5BAB
	for <webhook@archiver.kernel.org>; Tue, 19 May 2026 17:22:42 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4110.1779211352634050156
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 May 2026 10:22:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=B/P2ZY0A;
 spf=pass (domain: gmail.com, ip: 209.85.216.44, mailfrom: yash.shinde.oss.dev@gmail.com)
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-365eecc5885so3581466a91.0
        for <openembedded-core@lists.openembedded.org>; Tue, 19 May 2026 10:22:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779211352; x=1779816152; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lXjw0y0qUwxzPQ2gwyb1OMU+H01htYYnMhWnasztlI4=;
        b=B/P2ZY0A/EAw9YLJRePScBxeof3EqnGOyaTYr1pSBMQ0122sWxFQ4DNBRzGYgCTKte
         BI8sEfvMd3iuIlgZEN3nwEH4snFkcdLqpmGVmwwUsK9MBrC6VqsVNdQF3W0GAhAUIygL
         33KqfDrm/wxXBgi+TCIBT2KPoDtIra0nUdSjovjaHBejN2Luq1MGvb1N0lAiPDuXZHDw
         7JVRAKXLhuGFaIS9hi9nhD1fpn2gnblob1IOzc4Bo0d1dpJYwfxaYM0c3vAt11wklJqr
         9GYn1xtQvXzb9Cx9Tvv4D3T6wR7WvnEpwONWLyVlmclFKBnZWCvnBp1xqCohsp5Iofhj
         dALg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779211352; x=1779816152;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lXjw0y0qUwxzPQ2gwyb1OMU+H01htYYnMhWnasztlI4=;
        b=WoBp7XYYLnH0ixY0hPZWpTTtlpgil/cNtv9zEobwXLF7vGctG47i3pVwDotBStRrx7
         5YUq6CUR3eWboKdqhk9vyxwDkX7u5TFHSmMdr+izrGwMEsz1MsgPNbblNYzVF9Er9Cts
         N/WnXpL5Hzwey07RbHhkxKBK+4A72PNqW4Z0CragZIQC0QFJvNlsZlSXoRaFtJ58ESYe
         jAEtpFanCuzhz7lKxuZWyQMbGzRe0ySGrxdvODXY0K3odbFNoRKLGK0TdKPB94IQqC6S
         nlzaTBbQ/Uuu7502IeOfBNJWqULrJ5mi3NJaFOX45HgNWx8SmlOmNMg67bFECaWxzCe7
         Ep1Q==
X-Gm-Message-State: AOJu0YxUWp+35xUSs8I+ljLJj/zkxDJaPnelu+RI+2khGwmyohxd5XRH
	Y6HIEgV/Flk9KUGpNGcoaNJRUi/sUyl5VPI1Io/l7Sfu9giivWjj4mAw+0jNG69j
X-Gm-Gg: Acq92OFYfWbRG9tIYVrLqbNHRppHS2wgaWw0SQ20AHzbetexma///ag7EuJVoC93zfA
	s7TLsndiwyYBJm8Cd2UL29Nr1LExtkewccz1y3xP61iQsm5Sc48UCA0n6seZ33xEfgUlK98Uvq1
	oNkftUbIhRL06SQI+Q3Ik94WLjU8PNLHyp9N+oGu8hJSDOf/U4SQr3FWqDeOvqPq05IZz9JVfL2
	gNU8WnWaoy1WMo5VMnW4fOi7uqLmGxViYQfTaHFfRt4ggdQjG/N5Ee3vJ2vCzNreaMZFsfjy++P
	VSmb67UHNumasIgVp6BQrgkQZI3F84A50kz8vG4TZbhXg3WmtF1EabNkcgimsxsUnOQMUg6tA2P
	It/5yLD0aM9YLwG5jvwYVEhvibtBv+trhHcK+iPaqa8MZ8QmVvjSXtBolhKaaHx0yT+QQcYi8iM
	qNJviwc/2rmK2LTSxiJNl9PAFJe+t713wxIbnMUiIkqjBk6SpTTsmiR9W90A==
X-Received: by 2002:a17:903:46d0:b0:2bd:657f:3a1a with SMTP id d9443c01a7336-2bd7e77ab65mr223800785ad.8.1779211351822;
        Tue, 19 May 2026 10:22:31 -0700 (PDT)
Received: from QCOM-V9bhWph2GA.qualcomm.com ([103.172.209.48])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bdc58575dfsm107910735ad.20.2026.05.19.10.22.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 10:22:31 -0700 (PDT)
From: yash.shinde.oss.dev@gmail.com
X-Google-Original-From: Yash.Shinde.oss.dev@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Yash Shinde <Yash.Shinde.oss.dev@gmail.com>
Subject: [PATCH 4/7] python3-pip: upgrade 26.1 -> 26.1.1
Date: Tue, 19 May 2026 22:52:02 +0530
Message-ID: <20260519172205.274641-4-Yash.Shinde.oss.dev@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260519172205.274641-1-Yash.Shinde.oss.dev@gmail.com>
References: <20260519172205.274641-1-Yash.Shinde.oss.dev@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 May 2026 17:22:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237340

From: Yash Shinde <Yash.Shinde.oss.dev@gmail.com>

https://github.com/pypa/pip/compare/26.1...26.1.1
Release Notes: https://pip.pypa.io/en/stable/news/#v26-1-1

Signed-off-by: Yash Shinde <Yash.Shinde.oss.dev@gmail.com>
---
 .../python/{python3-pip_26.1.bb => python3-pip_26.1.1.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pip_26.1.bb => python3-pip_26.1.1.bb} (97%)

diff --git a/meta/recipes-devtools/python/python3-pip_26.1.bb b/meta/recipes-devtools/python/python3-pip_26.1.1.bb
similarity index 97%
rename from meta/recipes-devtools/python/python3-pip_26.1.bb
rename to meta/recipes-devtools/python/python3-pip_26.1.1.bb
index a6275be140..2e09075de2 100644
--- a/meta/recipes-devtools/python/python3-pip_26.1.bb
+++ b/meta/recipes-devtools/python/python3-pip_26.1.1.bb
@@ -26,7 +26,7 @@ inherit pypi python_setuptools_build_meta
 
 SRC_URI += "file://no_shebang_mangling.patch"
 
-SRC_URI[sha256sum] = "81e13ebcca3ffa8cc85e4deff5c27e1ee26dea0aa7fc2f294a073ac208806ff3"
+SRC_URI[sha256sum] = "d36762751d156a4ee895de8af39aa0abeeeb577f93a2eca6ab62467bbf0f8a78"
 
 do_install:append(){
 	# pip vendors distlib which ships Windows launcher templates (*.exe).

