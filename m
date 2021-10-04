Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12E26C433F5
	for <webhook@archiver.kernel.org>; Mon,  4 Oct 2021 14:21:23 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com
 [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web12.10087.1633357281945342490
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Oct 2021 07:21:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=KahgCBi3;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.169,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f169.google.com with SMTP id 187so10222319pfc.10
        for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Oct 2021 07:21:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=TRMfFDqc5zQJHNu0chPhykbSAP3U3h0W5hNxGUoYxoA=;
        b=KahgCBi3bv9CpS8Qwk0k899hBpSKcFpCIp4NAeQrr6MAEnmy2aLtBJGJhQzkL4VhiV
         TebuzzLBf7W4r2H/2tIIb+PtqTjsnTJYyH1PV3Fxel/+ccqIE6rvmiPwfb7nRFYJDqik
         IeV0At2tmcX8uCTBo2PN8Z75zyv5PtCvuiflZZqBzH+wuyXaWBhB8O2werCaVmgyR5QL
         O6zYvjrS8gzgM4q6DzojRKh1XsEU1xrJsOu4ruxczi3h4j5XclKYzRvyFAU4F8qr5PkW
         e7KvYkh1kbG/17K3Xx4SJ7O2xiyeB/AFYnXdCo8StynCYjjJ1kj/dnsC4F+7Nv+YUx4l
         fgow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TRMfFDqc5zQJHNu0chPhykbSAP3U3h0W5hNxGUoYxoA=;
        b=BDfb/k3ehxUuzR1kolG4Z1yIpUSXj5KS0CVDSdzaaRwhQCGOJfycnzBnXCCAOhYKJg
         VNW/U6NnIejzv7bynscwRxGRsna05Bkx3ngFEz3Xd+PYLLB19yT7hwlXAMcw+HqR8MOK
         D86yQJ9A1OzgXdj5b9sDsx1AgExgR2xcmLgVZRA5ZrrNBSh+c+1iL4fASOH11S2x/5e+
         r/iNF9Sh7fFHZQFzQklwBJjIl+E7HnB5ZtSpNYwikaxlkD2Kqap/Pa8GEf1BUbzqMOUI
         20Qx9k15IEEnI/GIshsjcCbZhQTnRSkv1r1FfDlYUivlB38OUBWnpnO1zXJOWpF5zQ+w
         Jqjg==
X-Gm-Message-State: AOAM532QFDBl+3DW76cElweCbYr2vO6ReMOrf2HU8W/raoOTtZirR5yj
	7jyg2CPDjaS9gttp5QAerfbGmvPGY6VF/bssqLM=
X-Google-Smtp-Source: 
 ABdhPJx2NkDd0ZURgL26oEZCBTebPeMXiVGSTkTDhPmbJ3I44TOVMxyuMQn35YQyxhn5s2hlwCU3Yg==
X-Received: by 2002:a05:6a00:b41:b0:44c:4d36:7f61 with SMTP id
 p1-20020a056a000b4100b0044c4d367f61mr10136400pfo.59.1633357281048;
        Mon, 04 Oct 2021 07:21:21 -0700 (PDT)
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 t4sm8313066pfj.13.2021.10.04.07.21.19
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Oct 2021 07:21:20 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 10/15] oeqa/qemurunner: Use oe._exit(),
 not sys.exit()
Date: Mon,  4 Oct 2021 04:18:38 -1000
Message-Id: 
 <2130363c7a8762866b523e596adf44ab63f40722.1633356813.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1633356813.git.steve@sakoman.com>
References: <cover.1633356813.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Oct 2021 14:21:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156603

From: Richard Purdie <richard.purdie@linuxfoundation.org>

sys.exit will cause finally statements and other code to run at exit. Since
we're using os.fork() here, os._exit() is apprioriate in this codepath.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit ec08498ff29de9ccd23be88b9d7af3dab6bbb81e)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/utils/qemurunner.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemurunner.py
index f7e5a3b3a6..de0dff3ff0 100644
--- a/meta/lib/oeqa/utils/qemurunner.py
+++ b/meta/lib/oeqa/utils/qemurunner.py
@@ -234,7 +234,7 @@ class QemuRunner:
             r = os.fdopen(r)
             x = r.read()
             os.killpg(os.getpgid(self.runqemu.pid), signal.SIGTERM)
-            sys.exit(0)
+            os._exit(0)
 
         self.logger.debug("runqemu started, pid is %s" % self.runqemu.pid)
         self.logger.debug("waiting at most %s seconds for qemu pid (%s)" %
-- 
2.25.1


