Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AC73CD98F6
	for <webhook@archiver.kernel.org>; Thu, 18 Jun 2026 15:41:24 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.22375.1781797280468481158
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Jun 2026 08:41:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=dBwn/kFE;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.218.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-bdb3fd39045so142631366b.3
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Jun 2026 08:41:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1781797278; x=1782402078; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=S+YMctVVq/GeXEBFk6L/QsktQpKkNp/iachSsW2PdXo=;
        b=dBwn/kFE869MPLFP0mcrZ5Nh57dxQGXudIppG2Cz/kwRaZjRskm8DBW4DU4tMzMf+M
         7FbueZpxHqSF5xJEZod230gS2y9gfBP5iaOVOuJAa7/oHEdRZYEoooZ5nfi4Rfl2av14
         HTyADuVrem6ExmQnKZrapYmFV2PEYIdz+729Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781797278; x=1782402078;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S+YMctVVq/GeXEBFk6L/QsktQpKkNp/iachSsW2PdXo=;
        b=myV8VIVW3GFfDUzEYjHnObwhSeCiCpXrutgW9vbCBFhTXgzc75L1jS1j6vvppOTVEq
         FBe3pXzaCO9iuuK2JYJZfakzyvbLkWkohjgLKGOTvxfylQe8kavsThXiLKlX8zj+Mgma
         2NrHsi8fRmEkjikwDHpcUFFFQEC/ANgOh9UE33qd7FZPBlrsqhFLWqNruce9h6DN1Xmz
         qwlEVjZVhf86GXX3Rg7E7lvleIthQqcMQwNaYxF0FJzfluH5XhCGjg9Ch8iiS/ejMQEw
         KT9CPekfg89Bxb/Q286TAuDkiodY833eUMNZEIZ8AxKBV7eMIbUs//OQJ4ydg1FFJLCo
         viEA==
X-Gm-Message-State: AOJu0Yy5+CRA1iN4MGSUkJ9PEmkqKV019hwanwdfvzTYNamlh+YuaxA4
	y67KWLsC2d+Yj+0erLXrW3JQsozeE0ONetQbfNS2zpqqxjWUW/YeZkSJ3zNy6fERwzsKwBweXy5
	TIRPB
X-Gm-Gg: AfdE7cmipYmsbLAH7l6YR+yHiXficaGTM5emSX1vKRAJP6EcwR6Xy40cfESkukr+1+g
	A5jcZbk3Qh1/7bmOojWTOtDczQIk/Ux7HpsUBATwiFXco6v0q5uF26TvZvctCI/5U7e45GkAJg4
	CiiGbHmFHVL/V1uz7XaT2tirmYkoHUxTYc6ZQyWN7uztU3v9oDlwiJjW/9uHQ5A70LKncbMfCnV
	9aJxumzQtAQfdnV4v8EcXhlh7bH+ExetL25SNzwGVFs8O4KR5nxsQn7Sad8xH2rkCU0UivEpNu6
	pNi0gvmSMQJ0Jqz4gHt5MXoEL5Rj48yX8X5oXcSG+NliCPZEJNfTm0LUNWA/DZ2+o5ALow7DbPB
	kh3HtiUgDMEazTIflkHYx/yUs2UDySZCcpgJ0plOy0j711vyZ1lcn1F41LL+61if/u6+KFrLOii
	uaqRNzXFwXQDrUWqQpWTrP4xVn2J/y58CE0YQBucm4
X-Received: by 2002:a17:907:940d:b0:c08:695:8819 with SMTP id a640c23a62f3a-c0806959588mr169951566b.0.1781797278310;
        Thu, 18 Jun 2026 08:41:18 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:25ec:f1b3:508a:164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f2ce361sm60366300f8f.31.2026.06.18.08.41.17
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 08:41:17 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] sstate: Reduce native sysroot execution race potential
Date: Thu, 18 Jun 2026 16:41:16 +0100
Message-ID: <20260618154116.235675-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Jun 2026 15:41:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239086

Whilst this doesn't remove all possible issues, removing files in /bin/
directories, then removing support files (like shared libraries) does
reduce the potential for weird failures if the system calls things like
python3.

[YOCTO #16323]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes-global/sstate.bbclass | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/classes-global/sstate.bbclass b/meta/classes-global/sstate.bbclass
index 50dd0e51c43..4ad71a70dac 100644
--- a/meta/classes-global/sstate.bbclass
+++ b/meta/classes-global/sstate.bbclass
@@ -474,6 +474,10 @@ def sstate_clean_manifest(manifest, d, canrace=False, prefix=None):
     with open(manifest) as mfile:
         entries = mfile.readlines()
 
+    # Remove binaries first, then all the other files, just in case somehow something
+    # is trying to execute something in a sysroot (e.g. python3 from PATH).
+    entries.sort(key=lambda d: '/bin/' not in d)
+
     for entry in entries:
         entry = entry.strip()
         if prefix and not entry.startswith("/"):

