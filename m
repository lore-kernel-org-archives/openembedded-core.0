Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E03F1C433EF
	for <webhook@archiver.kernel.org>; Fri, 11 Feb 2022 17:46:18 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web11.10338.1644601577197938926
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Feb 2022 09:46:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=CMr8LAY2;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.42,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f42.google.com with SMTP id e3so16571356wra.0
        for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Feb 2022 09:46:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kMYi/HfbHyi7jYvu0Cog25/u6z4D054wGasVKzY7lxo=;
        b=CMr8LAY2ii25L9ccT63mE3nLcUdXG/9F5u18s04WhvBgq/kshdfy7P2VG6Ze75e9Hn
         HwPHcVbFmEA36XI+rbZ7pG0rYv6RqDHhqxtJIYF4Eh9M0NkmG1PelHcOcsvoHN/eeIGM
         KkV5a4W2C4XhdceBiTJW0AVwIxjCntgOl6gXM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kMYi/HfbHyi7jYvu0Cog25/u6z4D054wGasVKzY7lxo=;
        b=hvBEUj9LYbquJrSTdsDnRc4qo6B06G8FwiH4N7XKuHCd9dEzWUm5ar+/NfTTx6hOco
         DOwO8j51C1kiBnE6oOHsEWNMYr+BE5eFY8GjlLDyfR7s9b//y7DpNKhMKtRSLCgKuDWF
         b6zY5ODOSJM6ogpCRg7Mv3Z/OBxFlyPlj0OpD5Np7jAGfNWzjUrxvflmXJxFGjh7rNZu
         nYGp+pNAyBywSvqZk/TbBL+77GuRXSZ4hVzahL/hL7AVsK/2aBbAU4/4VO8ZyvmZP+06
         m2RG+8iXzClk4WCXUrzZarr6h/jCY5bgMK5c4tWhBCI7KdmqJeFOoHILMMerhLU1y7/4
         nM4w==
X-Gm-Message-State: AOAM5302wsaZuKpUL+Wf8sNT1Wc99F9pGzpzzc6joiDvQnrJD4Xb6utX
	dVmXeIZT3zbQ3a+cA4mfy7ohTfyxnrOGNJAV
X-Google-Smtp-Source: 
 ABdhPJxtpcEtADoItF2RqqOBdufxd4a3YXiZWAK9LRBtQVnxjwJX5jpEZyW7yq/ik/35ir6mUBpxSw==
X-Received: by 2002:adf:f64e:: with SMTP id x14mr2146406wrp.698.1644601575210;
        Fri, 11 Feb 2022 09:46:15 -0800 (PST)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:e5fe:2e7c:731b:5924])
        by smtp.gmail.com with ESMTPSA id t18sm83912wmq.2.2022.02.11.09.46.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Feb 2022 09:46:14 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] default-distrovars.inc: Switch connectivity check to a
 yoctoproject.org page
Date: Fri, 11 Feb 2022 17:46:13 +0000
Message-Id: <20220211174613.2732343-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Feb 2022 17:46:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161661

example.com is proving unreliable at present so switch to our own connectivity
page instead. That page is very simple avoiding app overhead on our web server
which was an original reason for switching to example.com.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/sanity.bbclass                     | 2 +-
 meta/conf/distro/include/default-distrovars.inc | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index f288b4c84c9..773902e619d 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -353,7 +353,7 @@ def check_connectivity(d):
                 msg += "    Please ensure your host's network is configured correctly.\n"
                 msg += "    If your ISP or network is blocking the above URL,\n"
                 msg += "    try with another domain name, for example by setting:\n"
-                msg += "    CONNECTIVITY_CHECK_URIS = \"https://www.yoctoproject.org/\""
+                msg += "    CONNECTIVITY_CHECK_URIS = \"https://www.example.com/\""
                 msg += "    You could also set BB_NO_NETWORK = \"1\" to disable network\n"
                 msg += "    access if all required sources are on local disk.\n"
             retval = msg
diff --git a/meta/conf/distro/include/default-distrovars.inc b/meta/conf/distro/include/default-distrovars.inc
index fb0f1097da9..3bba651a776 100644
--- a/meta/conf/distro/include/default-distrovars.inc
+++ b/meta/conf/distro/include/default-distrovars.inc
@@ -54,4 +54,4 @@ KERNEL_IMAGETYPES ??= "${KERNEL_IMAGETYPE}"
 # fetch from the network (and warn you if not). To disable the test set
 # the variable to be empty.
 # Git example url: git://git.yoctoproject.org/yocto-firewall-test;protocol=git;rev=master;branch=master
-CONNECTIVITY_CHECK_URIS ?= "https://www.example.com/"
+CONNECTIVITY_CHECK_URIS ?= "https://yoctoproject.org/connectivity.html"
-- 
2.32.0


