Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4837CCE79A9
	for <webhook@archiver.kernel.org>; Tue, 19 Sep 2023 21:46:33 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web10.22620.1695159986115079103
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Sep 2023 14:46:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=L5tf2SBo;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-31c7912416bso5794511f8f.1
        for <openembedded-core@lists.openembedded.org>; Tue, 19 Sep 2023 14:46:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1695159984; x=1695764784; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ab6sRdNu8qmYmtz92b1qDrAzE9i87qhPKZ7mkT/6QU4=;
        b=L5tf2SBooXLi01Ni4kNjHwETxP32VmnXOe34KLs2s315i+Kpx9+NBP8hnLDfsNZwgo
         cuO31WkVq7UwOtqh2O69irSVrtD2BMqV/mg0gLaNjdywQCJL7N96GTHnZQWG53brus7L
         VWCvw9sPTp9gV4/Le7kWN68b9GtW9yiQWU67c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695159984; x=1695764784;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ab6sRdNu8qmYmtz92b1qDrAzE9i87qhPKZ7mkT/6QU4=;
        b=C24vnh/0qr2tmBCZ3LNf6KqOYN7dtijkjUa6o/sG+RSf+ss4JO83PJ+EH8LaBnw+cj
         7ULyGwJfWnzdSJ02nX1nb/RpvuiCFvn+6aFlOWmvTQQchSHCg/0F67XpTj8fFL8HMWsF
         KrYBeI0wr5Upp6qHOIICIPvyiqf4z78XdBFrgvi3ef4R6dDxYhQkeCIAf3y0nf/vwEv0
         YqQcu+KIINt8N0ePNRWH93K2fG35RP4vFmG1Mgavxig0eyzvno09ERxTnvvXqcDcHS2S
         fpOJslEmPfGTzzxwrUK/Pvt1QJOMdc15V7anQk4W92FRnY+IFfJWg/3NnGXBVWY+iJ2o
         ulsQ==
X-Gm-Message-State: AOJu0YypNJdzgDJt7e1jAygZcM4vQdG7H0e37DGZ/Mt/1uCRDoJWn2+7
	9Y2PN1MB0JlXZ2xJPLKLm3j6BdisO+j1DWvz2ok=
X-Google-Smtp-Source: AGHT+IGUGNeBADJsDzOTOlilaf0N+5efi3rVtJhLUtb38MfkGkH3+KIl9wWJwJHhFg1+OVnqfoBReg==
X-Received: by 2002:adf:d0cc:0:b0:317:61af:d64a with SMTP id z12-20020adfd0cc000000b0031761afd64amr667305wrh.3.1695159984250;
        Tue, 19 Sep 2023 14:46:24 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:34a6:a1c2:97a:851d])
        by smtp.gmail.com with ESMTPSA id c13-20020a5d4ccd000000b0030fd03e3d25sm16657827wrt.75.2023.09.19.14.46.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Sep 2023 14:46:23 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/7] sstate: Stop allowing overlapping symlinks from sstate
Date: Tue, 19 Sep 2023 22:46:17 +0100
Message-Id: <20230919214621.903967-3-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230919214621.903967-1-richard.purdie@linuxfoundation.org>
References: <20230919214621.903967-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Sep 2023 21:46:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187879

When originally implemented, overlapping symlinks in DEPLOY_DIR were common. That
is no longer the case and these overlapping links are causing bugs in other areas
(e.g. bug 14123).

Therefore start showing errors for overlapping symlinks in shared areas. Whilst here,
fix a broken file reference in the grep command to match current file layouts and
update the message shown to users to match current times. Most of the message content
is obsolete now due to other advances and changes in the way the staging code
now works.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes-global/sstate.bbclass | 30 ++++++------------------------
 1 file changed, 6 insertions(+), 24 deletions(-)

diff --git a/meta/classes-global/sstate.bbclass b/meta/classes-global/sstate.bbclass
index 706c2ae9388..afcda2980b3 100644
--- a/meta/classes-global/sstate.bbclass
+++ b/meta/classes-global/sstate.bbclass
@@ -266,7 +266,7 @@ def sstate_install(ss, d):
     overlap_allowed = (d.getVar("SSTATE_ALLOW_OVERLAP_FILES") or "").split()
     match = []
     for f in sharedfiles:
-        if os.path.exists(f) and not os.path.islink(f):
+        if os.path.exists(f):
             f = os.path.normpath(f)
             realmatch = True
             for w in overlap_allowed:
@@ -276,36 +276,18 @@ def sstate_install(ss, d):
                     break
             if realmatch:
                 match.append(f)
-                sstate_search_cmd = "grep -rlF '%s' %s --exclude=master.list | sed -e 's:^.*/::'" % (f, d.expand("${SSTATE_MANIFESTS}"))
+                sstate_search_cmd = "grep -rlF '%s' %s --exclude=index-* | sed -e 's:^.*/::'" % (f, d.expand("${SSTATE_MANIFESTS}"))
                 search_output = subprocess.Popen(sstate_search_cmd, shell=True, stdout=subprocess.PIPE).communicate()[0]
                 if search_output:
                     match.append("  (matched in %s)" % search_output.decode('utf-8').rstrip())
                 else:
                     match.append("  (not matched to any task)")
     if match:
-        bb.error("The recipe %s is trying to install files into a shared " \
-          "area when those files already exist. Those files and their manifest " \
-          "location are:\n  %s\nPlease verify which recipe should provide the " \
-          "above files.\n\nThe build has stopped, as continuing in this scenario WILL " \
-          "break things - if not now, possibly in the future (we've seen builds fail " \
-          "several months later). If the system knew how to recover from this " \
-          "automatically it would, however there are several different scenarios " \
-          "which can result in this and we don't know which one this is. It may be " \
-          "you have switched providers of something like virtual/kernel (e.g. from " \
-          "linux-yocto to linux-yocto-dev), in that case you need to execute the " \
-          "clean task for both recipes and it will resolve this error. It may be " \
-          "you changed DISTRO_FEATURES from systemd to udev or vice versa. Cleaning " \
-          "those recipes should again resolve this error, however switching " \
-          "DISTRO_FEATURES on an existing build directory is not supported - you " \
-          "should really clean out tmp and rebuild (reusing sstate should be safe). " \
-          "It could be the overlapping files detected are harmless in which case " \
-          "adding them to SSTATE_ALLOW_OVERLAP_FILES may be the correct solution. It could " \
-          "also be your build is including two different conflicting versions of " \
-          "things (e.g. bluez 4 and bluez 5 and the correct solution for that would " \
-          "be to resolve the conflict. If in doubt, please ask on the mailing list, " \
-          "sharing the error and filelist above." % \
+        bb.fatal("Recipe %s is trying to install files into a shared " \
+          "area when those files already exist. The files and the manifests listing " \
+          "them are:\n  %s\n"
+          "Please adjust the recipes so only one recipe provides a given file. " % \
           (d.getVar('PN'), "\n  ".join(match)))
-        bb.fatal("If the above message is too much, the simpler version is you're advised to wipe out tmp and rebuild (reusing sstate is fine). That will likely fix things in most (but not all) cases.")
 
     if ss['fixmedir'] and os.path.exists(ss['fixmedir'] + "/fixmepath.cmd"):
         sharedfiles.append(ss['fixmedir'] + "/fixmepath.cmd")
-- 
2.39.2


