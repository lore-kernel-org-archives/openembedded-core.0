Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9A66C3DA6E
	for <webhook@archiver.kernel.org>; Fri,  5 Jan 2024 11:54:05 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web10.21906.1704455642160323774
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Jan 2024 03:54:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=R4g8MR0v;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-40e3ab65709so1501695e9.3
        for <openembedded-core@lists.openembedded.org>; Fri, 05 Jan 2024 03:54:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1704455640; x=1705060440; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=SHcyvnih5tiZZuLdFbmUEK4GK7nf952bF8QdUvlO2As=;
        b=R4g8MR0vrQZmpx6dbaeZeSctg4ufgHpb0yHmryp81KRbnkntK4FULum9JODmNIMV/I
         ef4prn3irQfRy+K0IkvmpdWYQbC0IA3S3eBH8eCxPQIcMMHA04YNNNkfbtYONuixyBQn
         jhFsJtji56cRrQ+2Se9aoQBo2bLte1+NqZ/VE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704455640; x=1705060440;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SHcyvnih5tiZZuLdFbmUEK4GK7nf952bF8QdUvlO2As=;
        b=j0I8+dTX5PcGpd5JNES7l4fQYnegsXj8nDFNLDCxGVlgSXEvrhPG1KkbPUlwWyb49Q
         OK3q8o4Y8MNXE6syNB5n6lRds4an+NIBFPtFtBz2ur/8jDUmnqN3PO3JGllvraJqMWsY
         ffTbDQgKczQcTelwZzeJradrv3rrck0MyUi4uv2LLbujVAcR/gTyudMjSYo8iAV6jcw3
         vCAv7nrbML/GKjJbpXtuGOzM+seZWZpeCPBtA9AlGWXf3JIkXkM0akE+gT/ftFFTx9KF
         YCjoJfP/w8wJ2SW+FLaYSFzKUbxAA3zzmC/n/FXr/rHPPjLyBNvqy8gzUtZ/mlVAW0+R
         suVA==
X-Gm-Message-State: AOJu0YwBHCAO3u9x+3jooU86I+taEi6WEwNGIcfLfsXh+FEv85LWbldo
	mzUi3Y/In+BmOvrwB8Til6s0Wv70mh4XNEQ1SU3OFJnFMzc=
X-Google-Smtp-Source: AGHT+IF13T5kryYrJtJuS71tMIKneNMoDvubf/vOlKN4z55pfPMcJYvtYQddgZ60jH/1ck/r/KPuTQ==
X-Received: by 2002:a05:600c:4445:b0:40d:7691:d056 with SMTP id v5-20020a05600c444500b0040d7691d056mr1278178wmn.38.1704455640230;
        Fri, 05 Jan 2024 03:54:00 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:8000:8a34:98ad:54c2])
        by smtp.gmail.com with ESMTPSA id l20-20020a05600c4f1400b0040d91930f93sm1349856wmq.11.2024.01.05.03.53.59
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jan 2024 03:53:59 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] sstatesig: Add version information for find_sigingfo
Date: Fri,  5 Jan 2024 11:53:59 +0000
Message-Id: <20240105115359.2431120-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Jan 2024 11:54:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193353

Since we're changing the return values of the function, add a version so
bitbake can ensure it is using a compatible function.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oe/sstatesig.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/lib/oe/sstatesig.py b/meta/lib/oe/sstatesig.py
index 6f124e4f59b..1b4380f21bc 100644
--- a/meta/lib/oe/sstatesig.py
+++ b/meta/lib/oe/sstatesig.py
@@ -422,6 +422,7 @@ def find_siginfo(pn, taskname, taskhashlist, d):
     return hashfiles
 
 bb.siggen.find_siginfo = find_siginfo
+bb.siggen.find_siginfo_version = 2
 
 
 def sstate_get_manifest_filename(task, d):
-- 
2.39.2


