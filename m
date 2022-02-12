Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73C20C433F5
	for <webhook@archiver.kernel.org>; Sat, 12 Feb 2022 17:37:54 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web12.11708.1644687473440316413
 for <openembedded-core@lists.openembedded.org>;
 Sat, 12 Feb 2022 09:37:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=bjPHvJVh;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.42,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f42.google.com with SMTP id
 k3-20020a1ca103000000b0037bdea84f9cso8251661wme.1
        for <openembedded-core@lists.openembedded.org>;
 Sat, 12 Feb 2022 09:37:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1b5CdF8GJnEzJ6T746EgWMBza0x5CFY7GzDxWC4dJdg=;
        b=bjPHvJVhHtvfjbmysj0mNerewwEdJVDK6n8GvbCcIhMYNSpIVmYUJN+hFHBZfQe+pa
         OjKIDLlHw6ho+1l9xTPW0Ta4keROadx2fOznNDj9DqcKI6LNWVv599D2UVVkx5dxFhwy
         jp3otsX4rnpY0K3cNIlOT+bgDmin90NqlnAw4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1b5CdF8GJnEzJ6T746EgWMBza0x5CFY7GzDxWC4dJdg=;
        b=0UB4NADk+QhGX3wgyAnWPhZZTvtMUYWl9n8B0mDhDjmzylRmnWRA6mVcbyzhk5Y1BF
         TCsVp8yTCNuXh857v3QLlfHK6ZY6FhQWdRTzqjZw9SFCv39eD/t8fp0lL6ZV8dwihdUD
         9SSzQz8zKi/nuP1d/nbL4qaE2Hd+YguFTCR2bqzEycZq+M1nEmXWVQTER720jwzrp7p4
         Rc1E3kCYXwUG+Ya0rphBwL5Yz9EpExts+BfseAZ/4Wo+4Rzkn0yCz8PlHpwDUB01x6BB
         AxgBgkecR5VAbcuZu0p1qDCWrItwz7Cdqy6fjnhxWQQ4lh/ATc8yuw4KoksRXN2+ICny
         +BPw==
X-Gm-Message-State: AOAM532zl/WLyEUEZAC8yeiOmsp7r6gltAue3/RrmCsTkmQ1qJ638KBg
	u4RlQvssmb4anKr0ZmhxX8ac2m0TkQcOg90e
X-Google-Smtp-Source: 
 ABdhPJxNtRbqPnIVYOo6Tom5UkiDv23W/tewF6E7yRzfvbY5t6KpcrjxVj28SuQX65qJx7MjPpzq+Q==
X-Received: by 2002:a1c:a791:: with SMTP id
 q139mr4719312wme.176.1644687471552;
        Sat, 12 Feb 2022 09:37:51 -0800 (PST)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:8ec5:268f:bfc7:dcae])
        by smtp.gmail.com with ESMTPSA id
 q2sm23671843wrw.14.2022.02.12.09.37.50
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Feb 2022 09:37:51 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] oeqa/buildtools: Switch to our webserver instead of
 example.com
Date: Sat, 12 Feb 2022 17:37:49 +0000
Message-Id: <20220212173749.2771453-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 12 Feb 2022 17:37:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161674

Similarly to the sanity connectivity check, switch away from example.com
for the buildtools tests.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/sdk/buildtools-cases/https.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/sdk/buildtools-cases/https.py b/meta/lib/oeqa/sdk/buildtools-cases/https.py
index 134879aab32..35e549eb406 100644
--- a/meta/lib/oeqa/sdk/buildtools-cases/https.py
+++ b/meta/lib/oeqa/sdk/buildtools-cases/https.py
@@ -13,8 +13,8 @@ class HTTPTests(OESDKTestCase):
     """
 
     def test_wget(self):
-        self._run('env -i wget --debug --output-document /dev/null https://www.example.com')
+        self._run('env -i wget --debug --output-document /dev/null https://yoctoproject.org/connectivity.html')
 
     def test_python(self):
         # urlopen() returns a file-like object on success and throws an exception otherwise
-        self._run('python3 -c \'import urllib.request; urllib.request.urlopen("https://www.example.com/")\'')
+        self._run('python3 -c \'import urllib.request; urllib.request.urlopen("https://yoctoproject.org/connectivity.html")\'')
-- 
2.32.0


