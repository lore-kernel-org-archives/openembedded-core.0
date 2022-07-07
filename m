Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3202CCCA480
	for <webhook@archiver.kernel.org>; Thu,  7 Jul 2022 22:00:21 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
 [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web11.721.1657231215315586137
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Jul 2022 15:00:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=CjI45kUf;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.182,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f182.google.com with SMTP id z1so9031084plb.1
        for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Jul 2022 15:00:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=otVHgLLXy5MlcUvziQmxF7FORcDqPihk5lI2JDRPhR0=;
        b=CjI45kUfD9kq8f5z5g79TrVYFis0nqDu5E7rSUvcIRyTBW3aEXcWRxBpq8/pBfRarb
         uN+Nt5B8fzS0PFVngdSpQ4Y+jXJtC+ZBU9Nu4kU6C1U7DXvuqzQTBbWi7+yX+PGrnYtt
         7S3cROSe3v8X+FeZQwNrVD03luqirIGRlQMHNdD26GIffRd7QTh1Vl9GMlRB3wwpZWrX
         PJMIr7dLpwoph7cIi+gnxHys9Tf0rfEaMLGvHJEQgYdmXQwJbOWnlazxI3SD/3z55zTG
         9NoSa4UXD5UCMmR6WCXHq8V1l10DdirT/cOShzLJKCkzzsGa8JmHkLBz7BX9qksEm7ha
         TPRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=otVHgLLXy5MlcUvziQmxF7FORcDqPihk5lI2JDRPhR0=;
        b=vc9zJbB89eOcAji04MW4+GssRPJ3v1pC+BnoGOctgpfvnIeDOz0Vq95E1n4/EJDCrJ
         Rg/ivPU/co9h6fPNJmXW+OO6sb1XYcZw5OVnLaHV+vP3Ir3VJRxIbZer+bt0Jx8P5sTJ
         6HWno1LvhXUs2vsbXzQBECyE1zzySGHosXGLcwhru7B3jgHEvG0R1MNdXpvqc/5mjBvq
         U3qvq4ruPfAS3ifakwvTO4MNLoepoNXk0JPDc5oaq7OPedCNDTyk05ob354OxWDwCiJt
         7A+3emOsWfAB28Ug5nbXj/djHNKKtJxaaGPGoUjMduWz9vy5NRLKd305kBw/SCvOEV8b
         /WmA==
X-Gm-Message-State: AJIora9T55DjOlRLUFZl3TWdil2FLoBAZovabb+vIyLmjXd3vvpytW7j
	b3Q/m5dlXr+43dKgQutKziL8NNvRulMgUQrJ
X-Google-Smtp-Source: 
 AGRyM1seh4Ui6eEt2ZDWxuEd9OzVADSpDCanSmrk3b6JCB+aUlhDOPLMKrY6LX+paXD/DylTbfgTOw==
X-Received: by 2002:a17:90b:4f4e:b0:1ef:ab40:b345 with SMTP id
 pj14-20020a17090b4f4e00b001efab40b345mr4880pjb.226.1657231214255;
        Thu, 07 Jul 2022 15:00:14 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 j1-20020a17090a31c100b001ef79eb5033sm56840pjf.11.2022.07.07.15.00.11
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Jul 2022 15:00:12 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 08/14] oeqa/runtime/scp: Disable scp test for
 dropbear
Date: Thu,  7 Jul 2022 11:59:30 -1000
Message-Id: 
 <e7fb95c0b22b52b253f8d0ff10426bee9967854e.1657231055.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1657231055.git.steve@sakoman.com>
References: <cover.1657231055.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Jul 2022 22:00:21 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167806

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Fedora is switching to use sftp as the backend for scp. This means the
scp test fails on Fedora 36 hosts with a dropbear target as dropbear
doesn't support sftp. This change is in the upstream openssh code, other
distros have not yet changed the default but probably will follow.

The easiest way to resolve test failures in dropbear images is to stop
testing this against dropbear as it is no longer expected to work and will
likely spread as the change filters through other distros.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit a71fc7d455400f406b0d607be712a1133fe91166)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/runtime/cases/scp.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/runtime/cases/scp.py b/meta/lib/oeqa/runtime/cases/scp.py
index 3a5f292152..f2bbc947d6 100644
--- a/meta/lib/oeqa/runtime/cases/scp.py
+++ b/meta/lib/oeqa/runtime/cases/scp.py
@@ -23,7 +23,7 @@ class ScpTest(OERuntimeTestCase):
         os.remove(cls.tmp_path)
 
     @OETestDepends(['ssh.SSHTest.test_ssh'])
-    @OEHasPackage(['openssh-scp', 'dropbear'])
+    @OEHasPackage(['openssh-scp'])
     def test_scp_file(self):
         dst = '/tmp/test_scp_file'
 
-- 
2.25.1


