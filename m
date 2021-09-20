Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web12.10865.1632141991885452285
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Sep 2021 05:46:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=W0GUuGf/;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f44.google.com with SMTP id q26so29312203wrc.7
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Sep 2021 05:46:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=NMrkoHsfipzx+uLIuY0rtsl7tMQZJk/LccfN5c8XkCo=;
        b=W0GUuGf/zmAIMTYfAPyXkGVtiqkTLl2ryohIlk9c4uj2hpJhlgVMxZJe4DOIQhBqeP
         UowA8WsNxqBgUWp7A0i3aM6fGGOEr/rQLIC8qoRp76S1xCmbV3ql4BU86U3nLdgaAbIu
         dOVE7JOWlTnBzUz55qvSm4vjTPbP77ZH1vjHU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NMrkoHsfipzx+uLIuY0rtsl7tMQZJk/LccfN5c8XkCo=;
        b=U4WoG1g0HJyKnL3CfnY5piGjAvHdYZ7xaz0kxCD3lPufE3wkYA9YUOVQFrz69c+39g
         NoQT6KohYii6XFKVK8hz77m74rDL4mkOL1oD2yzrJDHSXa9dchSiTsdjDJZqJjU18JkJ
         jI3JisDbk3GigQghfn0G4DXpzHhUinYZLcR2v+H1XFvn8y1KOI6EULjcsNdJe4PLYp0o
         KE4rqVnKHgzWv1vJnYzzCW7Ixbpkf0G5k1/fTbfuStEKrTRWd+oqGjvx1wZ56lo/fWOX
         29/2YEAMWn4a72ZMoJQ6cokdNQhcjoBF+RR3boaVlf5E9yNzdWxigk3XZIO8lg5TZV2s
         ZBBg==
X-Gm-Message-State: AOAM531fxIEHRn6CB5i7+5bg0/VsRUpne6yJRvXXHl3Na5UsUD32uKGQ
	0iBo8IWsUXMZbvJVNOmphc/jJ7r4R+Ya5uO6
X-Google-Smtp-Source: ABdhPJxYIIA6sDL49JZqQtjJJN9SjCFhM4EABdgh8f57uSMIb7xSqLJIPgft4fQ/CiVtsp6TGALGGQ==
X-Received: by 2002:a05:600c:4991:: with SMTP id h17mr29360524wmp.74.1632141990409;
        Mon, 20 Sep 2021 05:46:30 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:7173:466e:b128:3e8b])
        by smtp.gmail.com with ESMTPSA id j21sm15773514wrd.48.2021.09.20.05.46.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Sep 2021 05:46:29 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 09/14] sstate: Avoid deploy_source_date_epoch sstate when unneeded
Date: Mon, 20 Sep 2021 13:46:16 +0100
Message-Id: <20210920124621.1576702-9-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210920124621.1576702-1-richard.purdie@linuxfoundation.org>
References: <20210920124621.1576702-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This sstate task is only needed when depended upon, it can be skipped
if there are no tasks running that directly depend upon it.

This reduced the number of sstate tasks in something like an image
build.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/sstate.bbclass | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index 498dfc681cf..5accc13a89b 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -1066,6 +1066,10 @@ def setscene_depvalid(task, taskdependees, notneeded, d, log=None):
     if taskdependees[task][1] == "do_populate_lic":
         return True
 
+    # We only need to trigger deploy_source_date_epoch through direct dependencies
+    if taskdependees[task][1] == "do_deploy_source_date_epoch":
+        return True
+
     # stash_locale and gcc_stash_builddir are never needed as a dependency for built objects
     if taskdependees[task][1] == "do_stash_locale" or taskdependees[task][1] == "do_gcc_stash_builddir":
         return True
-- 
2.32.0

