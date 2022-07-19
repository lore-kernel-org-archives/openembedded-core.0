Return-Path: <daniel@qtec.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57F7AC433EF
	for <webhook@archiver.kernel.org>; Tue, 19 Jul 2022 06:55:07 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web11.37777.1658213695312423497
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Jul 2022 23:54:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qtec.com header.s=google header.b=AEeoEdVn;
 spf=pass (domain: qtec.com, ip: 209.85.221.41, mailfrom: daniel@qtec.com)
Received: by mail-wr1-f41.google.com with SMTP id n12so7303770wrc.8
        for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Jul 2022 23:54:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=qtec.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/dk2TeyojKtdIf3nfKbWKZwIO8Z3iVOx2a08RhPZVIw=;
        b=AEeoEdVnNrrOH9W7tAtrtqgem71eO3OS22nzEAmDHaN9vAi6Sxq9tXSZTQgD5yrTaD
         x5B5NNbRDrVvFNcMXVvvvhtJs8PStvjlIrnZWn/cVBCE91AeI7lP42OiJmbsnEk/NwN4
         l0bbPZQNWDWrPCUyEeup1k/9TUF65CgdtXql5H1I8vkZmg6HIuFCw6pTpxlgNHo162Er
         6vzbSLjz4TAESpAYz5p1ZK8c7QL+nUgBZIRuSNaIOYonXHfg9lBkhc0jfySFb48Nex1a
         Jp2CcYv3TDUaoWeICzgxeUhjkimAczWxAeBt5xM4P6VXgrwoCzaSExkhXpUancrEndm0
         BmOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/dk2TeyojKtdIf3nfKbWKZwIO8Z3iVOx2a08RhPZVIw=;
        b=ZHTfQrew/vrVEo6mzSqFC8ZMSnIsi9fiA0LVf8A0onsxaHq49o4PAjWh0BbdxFYLSp
         oMGAAYmdQ3W33UygAkdqFmrrxyKdhB1eR9uYrWna/c+UfMwDLsYtbk7ZK1FK9VbAxyXZ
         nFcvqCEHGtlMaLPcfSEIpPSl2fYu28WRMZq2kbRQV5KhPRA4/eRbOKRTQy5J7USkDb+m
         qmsIcwh7JabsJc0ckLTvCl+cfPtwbOlGvpH2v952VbHxR1tsVg8N9CfQmBRUPCj5mZuH
         NthHFxppjTBGosoQxTwNfApC2+cxKFG7ySgj3gn8FUn/QgCkzab9Y/irLSZYofjkS7Vp
         0b9w==
X-Gm-Message-State: AJIora8zQWNh2/VCMQMXZRiJjt0Y7fa8Wo6OLsD6pmL5RaSQ4Gw5XD08
	xatDZvw/OECKNCeGzXictGXJZTe99ThfxQGHS6pTQ5I8ZlrIq4RBQEF+5Ha/U1kOeVJvgtnqx17
	8Owo7ZRCAVZVj0H/3eOeM9g8s+SVizKjPqEQGQrurHoOvwcJqSuVdXCwp8ili5FyysqCz15BuHJ
	94lwkV33StbEBuE3y3Ow==
X-Google-Smtp-Source: 
 AGRyM1tViaJxV6eLsZRIJ9cWvi1zgbB438i8sOVtSb8vd+eIGVJE7goE+cCpfCx+cJcxFt3xtoNrNw==
X-Received: by 2002:a5d:47ca:0:b0:21d:9f54:ef97 with SMTP id
 o10-20020a5d47ca000000b0021d9f54ef97mr25667099wrc.478.1658213693092;
        Mon, 18 Jul 2022 23:54:53 -0700 (PDT)
Received: from datops.qtec.com (84.127.76.82.dyn.user.ono.com. [84.127.76.82])
        by smtp.gmail.com with ESMTPSA id
 p6-20020adfe606000000b0021d73772c87sm611253wrm.91.2022.07.18.23.54.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Jul 2022 23:54:52 -0700 (PDT)
From: Daniel Gomez <daniel@qtec.com>
To: openembedded-core@lists.openembedded.org
Cc: yi.zhao@windriver.com,
	dagmcr@gmail.com,
	Daniel Gomez <daniel@qtec.com>
Subject: [OE-core][PATCH] dropbear: Add configuration file to CONFFILES
Date: Tue, 19 Jul 2022 08:54:42 +0200
Message-Id: <20220719065442.14740-1-daniel@qtec.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Jul 2022 06:55:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168273

Avoid overwriting the dropbear configuration when the package gets
updated by adding it to the CONFFILES list.

Before:
root@qt5222:~# dpkg -i dropbear_2022.82-r0.26_amd64.deb
(Reading database ... 32509 files and directories currently installed.)
Preparing to unpack dropbear_2022.82-r0.26_amd64.deb ...
Unpacking dropbear (2022.82-r0.26) over (2022.82-r0.25) ...
Setting up dropbear (2022.82-r0.26) ...
update-alternatives: Linking /usr/bin/scp to /usr/sbin/dropbearmulti
update-alternatives: Linking /usr/bin/ssh to /usr/sbin/dropbearmulti

After:
root@qt5222:~# dpkg -i dropbear_2022.82-r0.27_amd64.deb
(Reading database ... 32509 files and directories currently installed.)
Preparing to unpack dropbear_2022.82-r0.27_amd64.deb ...
Unpacking dropbear (2022.82-r0.27) over (2022.82-r0.26) ...
Setting up dropbear (2022.82-r0.27) ...

Configuration file '/etc/default/dropbear'
 ==> File on system created by you or by a script.
 ==> File also in package provided by package maintainer.
   What would you like to do about it ?  Your options are:
    Y or I  : install the package maintainer's version
    N or O  : keep your currently-installed version
      D     : show the differences between the versions
      Z     : start a shell to examine the situation
 The default action is to keep your current version.
*** dropbear (Y/I/N/O/D/Z) [default=N] ?

Signed-off-by: Daniel Gomez <daniel@qtec.com>
---
 meta/recipes-core/dropbear/dropbear.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-core/dropbear/dropbear.inc b/meta/recipes-core/dropbear/dropbear.inc
index 78f9f9adbd..e170587d08 100644
--- a/meta/recipes-core/dropbear/dropbear.inc
+++ b/meta/recipes-core/dropbear/dropbear.inc
@@ -123,4 +123,6 @@ pkg_postrm:${PN} () {
   fi
 }

+CONFFILES:${PN} = "${sysconfdir}/default/dropbear"
+
 FILES:${PN} += "${bindir}"
--
2.35.1


