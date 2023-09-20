Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A346CE79C8
	for <webhook@archiver.kernel.org>; Wed, 20 Sep 2023 10:58:07 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web11.35323.1695207486569572711
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Sep 2023 03:58:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=cKGfMyz4;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-32157c8e4c7so2840459f8f.1
        for <openembedded-core@lists.openembedded.org>; Wed, 20 Sep 2023 03:58:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1695207485; x=1695812285; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ab6sRdNu8qmYmtz92b1qDrAzE9i87qhPKZ7mkT/6QU4=;
        b=cKGfMyz4pEV8uCt7MyZgGkMiA3uPw3kzxSHVKFhqllQVzpa7aelwmOu7Qzby1UH/MX
         /AToFBFLI9xs4Ac2cTJX/tQoq76lVS6PieaFKzMRBZKKIvyOcveBMHSPsL/Yu+amN916
         ySj5LRpnLD1k+05oEJ2RH5bNHf6S2SnWxRLDc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695207485; x=1695812285;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ab6sRdNu8qmYmtz92b1qDrAzE9i87qhPKZ7mkT/6QU4=;
        b=oLBwvH87NmEwdSMfV8/hJycYjOjz+DC3yUd358KW7QlcYTVudfM1f2n23Qh2TudvVY
         +H18qK2xrYlOBGYYxHIyYfbznMzvnhHjzxzSUYbBMpqRkKigdye85bR77Gfpybf7joq/
         +6GYzkD6o5MaGIaT6/7T1IZg2FKvWvx77JExCYrnYSugOlVKdcAOInwAvsElJjfYQo2t
         5lxVlpCaaMXom3u9RQIzieS9sdJ8TEpjG41GHs0M7yq4n+5FnOgMJZhT4suEid5B3N//
         nF5LHj8DWOGNJBkDxC2nwMD2em4VcpRaPD0wZInlSYsCMq4/yFHTm2ZTJIfEYqNKAsp8
         zz9Q==
X-Gm-Message-State: AOJu0Yy1jMnN1bDyfs4CkB1/TtNabSU5KKk9HLi98Glu2n7MPQ7M9/Ep
	uSQ/f9M/KM7eU8IGfEVYNO1svheLU6XSaAZc8f8=
X-Google-Smtp-Source: AGHT+IFYIHu8LViZPZEc1L/XINczX/v5PL2ylEwC/J6DspyMIpmqAfrkrazbDQRBgJ2WoCQ7WrSBgg==
X-Received: by 2002:a5d:6947:0:b0:31f:f72c:df95 with SMTP id r7-20020a5d6947000000b0031ff72cdf95mr1658243wrw.21.1695207484772;
        Wed, 20 Sep 2023 03:58:04 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:34a6:a1c2:97a:851d])
        by smtp.gmail.com with ESMTPSA id h1-20020adfe981000000b0031f300a4c26sm426636wrm.93.2023.09.20.03.58.04
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Sep 2023 03:58:04 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/6] sstate: Stop allowing overlapping symlinks from sstate
Date: Wed, 20 Sep 2023 11:57:59 +0100
Message-Id: <20230920105802.1008778-3-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230920105802.1008778-1-richard.purdie@linuxfoundation.org>
References: <20230920105802.1008778-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Sep 2023 10:58:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187919

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


