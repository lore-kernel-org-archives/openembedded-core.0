Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CFB4C38A2D
	for <webhook@archiver.kernel.org>; Mon, 24 Oct 2022 14:24:58 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web11.19770.1666621490179712272
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Oct 2022 07:24:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=g3F230az;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.176, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f176.google.com with SMTP id p3so7634518pld.10
        for <openembedded-core@lists.openembedded.org>; Mon, 24 Oct 2022 07:24:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jvH3yZjAFkzid+orcQun3SRoA42zZ2kpwQ6SrLB0aok=;
        b=g3F230azYNRCeVho1EZS2qJ480JbC0kHTvnyE9qAnG1GC8L40442hMU2qB36g4VSz2
         E7nHv+a/pcKuT6tXyT4CK96EG+fqP6/O2ZhZfbSIGUIHHNPAdIaoGsWVQpIudWhoOWNu
         S6hvTi/0EpzmJJ/dICWFFu/HseBsaV7e3ajvzRopmgeSy2fWxBCUiOSov41mPNO2elLC
         SLu+TJEPcl/jmFwHDW/C1Sh+hbZZqfoUwwwz0/rP9N5mYm/CvQ8VVLA0MOjIF5LeB6FS
         UX+rMKbdZHjhUG6TMsfs1SeC6HyajiTYMUXKvLpHJraZy8M8tVNPbUDj0N//d8g9uk+9
         a/9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jvH3yZjAFkzid+orcQun3SRoA42zZ2kpwQ6SrLB0aok=;
        b=D/NcV+ls1uP7V7odUYIghJcBTUWSnKyQ5EoZvMNikwLxoFlHIKNfvjnuXIpLfckqwW
         8AeqQs4sOIB3qvd9/tPm8CMEYjKdTynhoLIGwt6iff4aMXIj6Eal+UZtw7p4KmcBWw0e
         0nPaJBMwCB6+ISHObd2Ak0HvkQYLroLRVjeBl8mfFI8YYMZMcSwHDDqyLUz9sGUMlUx2
         otklJpxDLd0LpwwmgHRJ8lO2KeL623sr3UsEtg0MRR2qozxoeLHcEhPOOWqoENbKUnxk
         8lPOrFXrvjDDxQzxa2FYEfNWIUFGyz0gE/VcaoOMqxyZxZozuhKjcMfVxJB6CfPBq6lg
         abMA==
X-Gm-Message-State: ACrzQf081VqBxV/1PIHbiMFA7Cn1WTbdXYqVfT1j/+N7/nvcTx85/+Mk
	ay3ed7lXO9PWgYemHfZLfnaPO6x2nG49W0pp
X-Google-Smtp-Source: AMsMyM51oVeMBEBFb93nMlZStg9toAcrnoXGxm0O56/72aRKpq2TU1phn4pzXrRwYQ35qXKunWEEhA==
X-Received: by 2002:a17:90a:cf06:b0:212:d9ab:811b with SMTP id h6-20020a17090acf0600b00212d9ab811bmr17568688pju.65.1666621491453;
        Mon, 24 Oct 2022 07:24:51 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id z15-20020a170903018f00b0017e64da44c5sm19704457plg.203.2022.10.24.07.24.50
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Oct 2022 07:24:50 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 6/7] devtool: add HostKeyAlgorithms option to ssh and scp commands
Date: Mon, 24 Oct 2022 04:24:20 -1000
Message-Id: <9275d23c782071382c201bca2d647f6426a64e2f.1666621276.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1666621276.git.steve@sakoman.com>
References: <cover.1666621276.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Oct 2022 14:24:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172096

With the newer version of ssh in Ubuntu 22.04 we are getting errors of this type:

Unable to negotiate with 192.168.7.2 port 22: no matching host key type found. Their offer: ssh-rsa

Add -o HostKeyAlgorithms=+ssh-rsa to command invocation as suggested at:

http://www.openssh.com/legacy.html

Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/selftest/cases/devtool.py | 2 +-
 scripts/lib/devtool/deploy.py           | 8 ++++----
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index 87e71632ab..5febdde28e 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -1323,7 +1323,7 @@ class DevtoolExtractTests(DevtoolBase):
             # Now really test deploy-target
             result = runCmd('devtool deploy-target -c %s root@%s' % (testrecipe, qemu.ip))
             # Run a test command to see if it was installed properly
-            sshargs = '-o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no'
+            sshargs = '-o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no -o HostKeyAlgorithms=+ssh-rsa'
             result = runCmd('ssh %s root@%s %s' % (sshargs, qemu.ip, testcommand))
             # Check if it deployed all of the files with the right ownership/perms
             # First look on the host - need to do this under pseudo to get the correct ownership/perms
diff --git a/scripts/lib/devtool/deploy.py b/scripts/lib/devtool/deploy.py
index e0f8e64b9c..b4f9fbfe45 100644
--- a/scripts/lib/devtool/deploy.py
+++ b/scripts/lib/devtool/deploy.py
@@ -201,9 +201,9 @@ def deploy(args, config, basepath, workspace):
                 print('  %s' % item)
             return 0
 
-        extraoptions = ''
+        extraoptions = '-o HostKeyAlgorithms=+ssh-rsa'
         if args.no_host_check:
-            extraoptions += '-o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no'
+            extraoptions += ' -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no'
         if not args.show_status:
             extraoptions += ' -q'
 
@@ -274,9 +274,9 @@ def undeploy(args, config, basepath, workspace):
     elif not args.recipename and not args.all:
         raise argparse_oe.ArgumentUsageError('If you don\'t specify a recipe, you must specify -a/--all', 'undeploy-target')
 
-    extraoptions = ''
+    extraoptions = '-o HostKeyAlgorithms=+ssh-rsa'
     if args.no_host_check:
-        extraoptions += '-o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no'
+        extraoptions += ' -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no'
     if not args.show_status:
         extraoptions += ' -q'
 
-- 
2.25.1


