Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CD6EC636FE
	for <webhook@archiver.kernel.org>; Mon, 25 Apr 2022 19:26:14 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web09.30019.1650895265959228624
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Apr 2022 07:01:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=PBJhjCkE;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.48,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f48.google.com with SMTP id b19so20976835wrh.11
        for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Apr 2022 07:01:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/PZZ03aXBBQBnhm73dunYMqLbKi/MdhVzQ20Dkfq00g=;
        b=PBJhjCkE4KyZ8aCqMN5wyhl3HIGmzzCVgnqQCSEB8HT76WvkF4MX8znpLA7vo6jOTo
         44evNNWI9HlJkAlKUmLtx0rvIElnFs4grGe++K4sQjeZXS43lGiBDO/PaTWFZ9EvSGRb
         TgjT+IxUmDtOwCyhivGbXe1Pb0WnfOY2OUjT8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/PZZ03aXBBQBnhm73dunYMqLbKi/MdhVzQ20Dkfq00g=;
        b=G53qLNrBNgsEN83IKUKkp03oRsNKwX5uhGRVv1Yhzo39rXcYsJeoWmqSrLqK78qNVX
         3BhnHw9orwVZ9f5FucxijjQoCU1YzYcTHILZHOSpJ6XF2SHt+VuWnoO2Rh6jkWTDmZZV
         kkZlSIkYpw8HXOf3hnkOPBnpMvTc2vs587dHtxtU/mr3f4t07yBOa2GnMrbrBkuG8qSf
         ZPSlioIMhfcK/PRKNPYzaZkPjboaiAVsYOwXDlC5fbQUjm0/dQZdhWlwducr5cB2zByF
         2syWCYqUZTQkNBdUiq1hasVnrfNFtc6vctTTNen/4EAz9JcQRYun7dinHxxpvL+1Nr27
         MjfQ==
X-Gm-Message-State: AOAM533ezjLGz8/0YHlTsrcs2XMGT+eOz4pKarkCEzOZYH/VUtzTyW4g
	7FHsL/YTIsXyIRFmPNlZ1QwpERw1JriDWw==
X-Google-Smtp-Source: 
 ABdhPJyg45gr9xQ6+vYXmVNXNSiu4XMQs+ek0Eho+VS6Xo3k6AGhqdaHF+fSbJN1+TUgc3Sgp56UXw==
X-Received: by 2002:adf:ecc1:0:b0:20a:e019:e184 with SMTP id
 s1-20020adfecc1000000b0020ae019e184mr1668975wro.99.1650895263999;
        Mon, 25 Apr 2022 07:01:03 -0700 (PDT)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:fa79:b435:615c:b6d3])
        by smtp.gmail.com with ESMTPSA id
 u22-20020adfa196000000b0020ad517ce4bsm5905086wru.52.2022.04.25.07.01.03
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Apr 2022 07:01:03 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] scripts: Make git intercept global
Date: Mon, 25 Apr 2022 15:01:02 +0100
Message-Id: <20220425140102.2743203-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 25 Apr 2022 19:26:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164823

The previous minimially invasive git intercept simply isn't enough. For example,
meson used in the igt-gpu-tools recipe hardcodes the path to git in the configure
step so at install time, changing PATH has no effect.

There are lots of interesting things we could do to try and avoid problems but
making the git intercept and dropping fakeroot privs for git global is probably
the least worst solution at this point. It will add slight overhead to git calls
but we don't make many so the overall impact is likely minimal.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/base.bbclass       | 1 -
 meta/classes/devshell.bbclass   | 2 --
 scripts/{git-intercept => }/git | 0
 3 files changed, 3 deletions(-)
 rename scripts/{git-intercept => }/git (100%)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index b54b56d6248..3515720bf95 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -367,7 +367,6 @@ addtask install after do_compile
 do_install[dirs] = "${B}"
 # Remove and re-create ${D} so that is it guaranteed to be empty
 do_install[cleandirs] = "${D}"
-PATH:prepend:task-install = "${COREBASE}/scripts/git-intercept:"
 
 base_do_install() {
 	:
diff --git a/meta/classes/devshell.bbclass b/meta/classes/devshell.bbclass
index 75604d0c076..62dc958d9a4 100644
--- a/meta/classes/devshell.bbclass
+++ b/meta/classes/devshell.bbclass
@@ -2,8 +2,6 @@ inherit terminal
 
 DEVSHELL = "${SHELL}"
 
-PATH:prepend:task-devshell = "${COREBASE}/scripts/git-intercept:"
-
 python do_devshell () {
     if d.getVarFlag("do_devshell", "manualfakeroot"):
        d.prependVar("DEVSHELL", "pseudo ")
diff --git a/scripts/git-intercept/git b/scripts/git
similarity index 100%
rename from scripts/git-intercept/git
rename to scripts/git
-- 
2.32.0


