Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web12.7685.1614526649562235401
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Feb 2021 07:37:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=tEaMw/w0;
 spf=pass (domain: gmail.com, ip: 209.85.218.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f52.google.com with SMTP id mm21so23243175ejb.12
        for <openembedded-core@lists.openembedded.org>; Sun, 28 Feb 2021 07:37:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4lOJ3j0Zsvv/4Am+AQop6S4ZKVtz0e6Rdws6QhK5Ojo=;
        b=tEaMw/w0eaZ0HvTRNl0FxeMmqAgJJnECPmYcdfvJxu9Pczm82bUgAeisg5MMTbmNq+
         TEBx9yV6tNfJf9jtvybNegBez/ZdI4ri7TcKSZGhMh5dwbTvZ/z6i231gg0G+n6C//mb
         5EPuWy5GYZNyHkhvEFtY9S/A6f0MDO8YoSF2NtirHVKRDzdk0Kca/tSmibSfJqQTXKsH
         sXpur4R2UhDaSHdszxK/WPFBX/W5zH/F0JxWcs79oLLCVEU/HJIWIb5mUJyrhOfFFPE8
         NeFhotkfgyLH5VNNP76hRwgioN7ztLvLCAaVfHLrk5vHE82zZG8WEdFgzcyR2qV82bp3
         ymfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4lOJ3j0Zsvv/4Am+AQop6S4ZKVtz0e6Rdws6QhK5Ojo=;
        b=YY61D9oKxXf9Q6uAeZVl9nk86ywx+A7iJeiwORhM4CmhTu9Q8o0rCoyQNng4p0MlWP
         eaHo2gxUP8o3ez8PiVEp1BMc1y9DoCUwgTOMOuT6/quCcgHXNLob2Tjg/RYKN4CBdusg
         bnToyY3Jo37muTU2ydV5HeSpeexSNqbWx7zwsAHvrWccY2680+Nv/LRU4WdnNMYnQz65
         0iBkME4NG+FG/z6j/V44Ldj3i99ZrYGd5u2kNVqim0RP5Y8PLejXPPywQZ1wq0qZlFdV
         /eV2HdBQRBrWhFlzqWbbB+5jKYEn0OeSzmeulMqm2biduBft99L81PaMMF2WjAmibc+l
         480Q==
X-Gm-Message-State: AOAM532J0lbzGD7OASp0yUc/S0ZDppxXkLPjcYGOKoNSIu+RZBIQeaFJ
	z+GXFZ0NdPAQeDh5GJRMo9DTmbO3vo3dWg==
X-Google-Smtp-Source: ABdhPJzj+GHYCCodw4JCq6V8qPI/KPEUQBeKMcTPmdYLueYv7xDjXCEx6xxJKQ9S9QeCRx5dtvuDIA==
X-Received: by 2002:a17:906:3f96:: with SMTP id b22mr11912852ejj.478.1614526648191;
        Sun, 28 Feb 2021 07:37:28 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2450:1011:512:45a5:1b3d:84d2:e7fc])
        by smtp.gmail.com with ESMTPSA id b17sm10234780ejj.9.2021.02.28.07.37.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Feb 2021 07:37:27 -0800 (PST)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 24/24] ptest-perl/run-ptest: address failures caused by perl 5.32.1
Date: Sun, 28 Feb 2021 16:37:02 +0100
Message-Id: <20210228153702.498275-24-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210228153702.498275-1-alex.kanavin@gmail.com>
References: <20210228153702.498275-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Particulary, . needs to be explicitly specified so that perl
looks there when loading items in 'require'.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/files/ptest-perl/run-ptest | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/files/ptest-perl/run-ptest b/meta/files/ptest-perl/run-ptest
index c9f9ca94d0..fd35357b42 100644
--- a/meta/files/ptest-perl/run-ptest
+++ b/meta/files/ptest-perl/run-ptest
@@ -1,7 +1,7 @@
 #!/bin/sh
 
 for case in `find t -type f -name '*.t'`; do
-    perl $case >$case.output 2>&1
+    perl -I . $case >$case.output 2>&1
     ret=$?
     cat $case.output
     if [ $ret -ne 0 ]; then
-- 
2.29.2

