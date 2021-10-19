Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5ADB8C433F5
	for <webhook@archiver.kernel.org>; Tue, 19 Oct 2021 19:55:38 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com
 [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web10.15535.1634673337427847385
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Oct 2021 12:55:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=cwpJF8fb;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.52,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f52.google.com with SMTP id
 na16-20020a17090b4c1000b0019f5bb661f9so799432pjb.0
        for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Oct 2021 12:55:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=1dyi4N13RlTUgmgu8o0/ZtB40YGyNL5QnDM4Dk3mCSs=;
        b=cwpJF8fbvmycp5uS749L7ezB/KSWhUeq8V2/vg5K/Cg1tJ5xt9y5etlPGERT6YVMtj
         GT3manr75o/D3gDlGLtCLkQ+0oECG/1Ad4R3HaCENWO1JorNnx50DOzIOh1DFFA2MK4h
         NMP82KiZz5y9bvlM6cYLHKdLtGlvaL04X5YCdeiBdJBJw+z+Z4YWaHyna9PE7MUqfAWK
         TmSloQkMxj+nUXeTpb0Wg/1GaNjJehEtgpCl2rB+eUisKsaF96dH86ECp10N8ZCqCu8S
         Zc4CfznjioHXyTfI4r/LWTiJndq67jj0Z0F4VR3HbLm3uByortgqAohksi8EyaSUP6UE
         VD7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1dyi4N13RlTUgmgu8o0/ZtB40YGyNL5QnDM4Dk3mCSs=;
        b=S6dBTRFMb+YHPNoQ5GZm5GziupbBZffzlxEujGsKIJ5cyYL4yG5pieiXEJMLz3kzvk
         crPTonbBmplFe3zgdfLhE8+iPHPxgF9oQEGzb8dlc2oxbTfxU9RI3bjCmP/vq2+GzgC2
         o70GNDYC5eCbVucPqQwK6ETSfi9uwuUxA4GgA7LxA6gMJxs0Ow7waDen6tFuoyeBijhM
         hCnO3Zk0KN4Hj43iDYch9ThJ6YgEExu+Jps/pqtUq+HYTLJWG6UKBcGbWhk/RIIijLbj
         RNYXCwcaHg8h0024jnAvoF4psbi+/ohEYX2sUU2ixfCtnO0AO+z2YjY+CwDSD6jacXTz
         X/4A==
X-Gm-Message-State: AOAM530pqzUFrBZoZv+3Pt/5G4v/eEA0iKK7OZig+vwR5N9Fvir7ajwS
	nRzFQZeuFGvF5iZPUZnw6wdTsCbIJ9VRuDDG
X-Google-Smtp-Source: 
 ABdhPJwhSjOxXhR88DToYbyQyJ9mFFpLt0nBLqa4OP2+EMrthL31j4R5p2DIC/ffpZdfTQbCYPH/mg==
X-Received: by 2002:a17:90a:c795:: with SMTP id
 gn21mr2205065pjb.112.1634673336359;
        Tue, 19 Oct 2021 12:55:36 -0700 (PDT)
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id q14sm67104pfk.3.2021.10.19.12.55.35
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Oct 2021 12:55:35 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 38/38] target/ssh.py: add HostKeyAlgorithms option
 to test commands
Date: Tue, 19 Oct 2021 09:53:49 -1000
Message-Id: 
 <5fc4f7896fb7af94cd0eeb6370128c861193a6ea.1634665675.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1634665675.git.steve@sakoman.com>
References: <cover.1634665675.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Oct 2021 19:55:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157243

After recent updates to the autobuilder tumbleweed workers there are tests where the client and
server fail to agree on a public key algorithm for host authentication:

DEBUG: [Running]$ ssh -l root -o PubkeyAcceptedKeyTypes=+ssh-rsa -o UserKnownHostsFile=/dev/null
    -o StrictHostKeyChecking=no -o LogLevel=VERBOSE 192.168.7.6 export PATH=/usr/sbin:/sbin:/usr/bin:/bin; uname -a
DEBUG: time: 1634578090.4632802, endtime: 1634578390.4592378
DEBUG: Partial data from SSH call: Unable to negotiate with 192.168.7.6 port 22: no matching host key type found. Their offer: ssh-rsa

This appears to be an issue with recent versions of shh.  Add -o HostKeyAlgorithms=+ssh-rsa to
command invocation as suggested at:

http://www.openssh.com/legacy.html

Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/core/target/ssh.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/lib/oeqa/core/target/ssh.py b/meta/lib/oeqa/core/target/ssh.py
index aefb576805..af4a67f266 100644
--- a/meta/lib/oeqa/core/target/ssh.py
+++ b/meta/lib/oeqa/core/target/ssh.py
@@ -34,6 +34,7 @@ class OESSHTarget(OETarget):
         self.timeout = timeout
         self.user = user
         ssh_options = [
+                '-o', 'HostKeyAlgorithms=+ssh-rsa',
                 '-o', 'UserKnownHostsFile=/dev/null',
                 '-o', 'StrictHostKeyChecking=no',
                 '-o', 'LogLevel=ERROR'
-- 
2.25.1


