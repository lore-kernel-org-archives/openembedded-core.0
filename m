Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CF1BC25B78
	for <webhook@archiver.kernel.org>; Tue,  4 Jun 2024 12:49:01 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web10.20616.1717505339715417053
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Jun 2024 05:49:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=b0SzOgk2;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-42120fc8cbfso42773495e9.2
        for <openembedded-core@lists.openembedded.org>; Tue, 04 Jun 2024 05:48:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1717505338; x=1718110138; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=wnqEqPbESxgwX9HnTq3GwdVA1ndvn5Zr5VGbIpPcNKA=;
        b=b0SzOgk2Y9ECa84PBI0mv6bfy+kc2tY37z55Nrc6hd7+p+JVwA9r9qVX1NJiYtKONt
         sU90yShC/Gjkb8/t6FchGs/geETn5Oguvyv95imiMlFlMo50IDFT/wov8iIFK2YCHrYT
         wVnZYFkIC39x+mXBwF2DFzXJ/5MUtsb/DSOCI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717505338; x=1718110138;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wnqEqPbESxgwX9HnTq3GwdVA1ndvn5Zr5VGbIpPcNKA=;
        b=P1bC6AwVKMnoJIkRqQh1NsOHuhyfrNYj1PeI4vb8YqGT54HFBcHCQ0AbjpJdL64lXr
         WrJ2zLDTnpWmihqPnyufC/PUvitrCg83a+5VVkkTrYBrBqv0NGipG0okw6D2ACNws17i
         U3Je9cnG/QFs9Sb24neKOeKVI/p5He+4fCOXw6p9PoFPi8bPgW7cAdQ7gfOURKr1IcxG
         GNr6XLlkeNneI1uKYFwCkGDCnS1xDShm4Jdu4yXEmsiWdIn20uKHVqjwlddlUrk0Wpcg
         CmMuh1LjhHbnh2dW5CRvNkJgI4IwPz+NI9xxlekAOScw1rF30XPFdDs8wZ4zUQMvYRAZ
         e0hg==
X-Gm-Message-State: AOJu0Yzu1T12yYWEuIRvvpZWo38mM5Hgf9/+XK1Nr/KjI+LnLCkzuElj
	uA/FzbInyEQuByak51lJ73KCICZ3VrWkthAWDDGzxQI28AlQKikM76hmnS0R6w07mMQaSiM/+3b
	t
X-Google-Smtp-Source: AGHT+IFhSEa7zPVmWWbbLEIRQF39ra3/NvPTDi/RZztmvWbNEr3grce5PNz2+WdWj4sX4ghRk5BvRw==
X-Received: by 2002:a05:600c:3b8b:b0:421:29c6:e2ce with SMTP id 5b1f17b1804b1-4212e047477mr101171125e9.7.1717505337554;
        Tue, 04 Jun 2024 05:48:57 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:9a5c:ae3c:1b90:53c1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42139688d82sm95917715e9.3.2024.06.04.05.48.56
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jun 2024 05:48:57 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] oeqa/runtime/ltp: Drop groups that were removed in new version
Date: Tue,  4 Jun 2024 13:48:56 +0100
Message-Id: <20240604124856.3649228-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Jun 2024 12:49:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200333

The io, cap_bounds and filecaps groups were removed in latest version
of ltp. Tweak the test class to match.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/runtime/cases/ltp.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/runtime/cases/ltp.py b/meta/lib/oeqa/runtime/cases/ltp.py
index f588a93200e..e81360670c5 100644
--- a/meta/lib/oeqa/runtime/cases/ltp.py
+++ b/meta/lib/oeqa/runtime/cases/ltp.py
@@ -57,7 +57,7 @@ class LtpTestBase(OERuntimeTestCase):
 
 class LtpTest(LtpTestBase):
 
-    ltp_groups = ["math", "syscalls", "dio", "io", "mm", "ipc", "sched", "nptl", "pty", "containers", "controllers", "filecaps", "cap_bounds", "fcntl-locktests", "commands", "net.ipv6_lib", "input","fs_perms_simple", "cve", "crypto", "ima", "net.nfs", "net_stress.ipsec_icmp", "net.ipv6", "numa", "uevent", "ltp-aiodio.part1", "ltp-aiodio.part2", "ltp-aiodio.part3", "ltp-aiodio.part4"]
+    ltp_groups = ["math", "syscalls", "dio", "mm", "ipc", "sched", "nptl", "pty", "containers", "controllers", "fcntl-locktests", "commands", "net.ipv6_lib", "input","fs_perms_simple", "cve", "crypto", "ima", "net.nfs", "net_stress.ipsec_icmp", "net.ipv6", "numa", "uevent", "ltp-aiodio.part1", "ltp-aiodio.part2", "ltp-aiodio.part3", "ltp-aiodio.part4"]
 
     ltp_fs = ["fs", "fs_bind"]
     # skip kernel cpuhotplug

