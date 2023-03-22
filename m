Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A66FC74A5B
	for <webhook@archiver.kernel.org>; Wed, 22 Mar 2023 14:22:04 +0000 (UTC)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.web11.44011.1679494922463763434
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Mar 2023 07:22:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=QnYgfyX5;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.182, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f182.google.com with SMTP id h14so10451206pgj.7
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Mar 2023 07:22:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1679494921;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eFiQIhK1/idxzJjaaeyGnnyYfWh9w0oKeCx+LbMJ3l8=;
        b=QnYgfyX5ex9MhVjjbJoKRLfmM7cR3wraaaHkvt3KEM+0whdh3LflgBaAsr+IXVvX33
         h/o9gU03LE1gWxPgdYN62B30fsBiQAyRAK2CI2DSN7pHk3XaIhrEsLWuWzo5CLjYgJeV
         C11KoOYMO9EFTrPV6wcNP+i1+JMj3AivXbM1wTZ5KnstZscotdRHdY3DkZNHuS7NNaLG
         nzPJeXXS/JdIWP1iWPZWcwVXpgH16cmKPbm/9YV+qipVARHBlIx3UeYIGt+5LG0qmxVE
         KGhsiPOu+IFxIEFP1v8qa+E0p4o3EZ2WNkPY5Yy+t6ps8fvo56SiXH3z/4nEzXmubTA5
         YcQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679494921;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eFiQIhK1/idxzJjaaeyGnnyYfWh9w0oKeCx+LbMJ3l8=;
        b=TiZ0CBotPVvIzA3iINZVR/w7XOT/wjmymW0RmJdvqcmtP728JvyySEFDiVM0kgOpnt
         pJrE/ofDPBsNLXemdI/Jlg0cZNqFjEmTx6aiuwJgdqAcoaDSshKEwJ9lcXtAObt15SKw
         XiyzsufBocnUuMTFR93enj7YiySGf1bHO4aiFKK3GPqGhi9PcYnMiZDNH2JfJXV3UmVx
         YFe1NGmR+HegcuMnK4SNZwLVMVjciO8Kr/WAvOhug/8+a5WdHIU18KObZIKsjQDapFjA
         7udCLWUtoAukjJlPRzovTHyLCXpOYff4q60rGSNBMzCrNKhUzbNqkflJvzA/5yEv673c
         sajw==
X-Gm-Message-State: AO0yUKUdCxUir6hHVIy99D7hZnmq6T9vv5xl0rB4hrEHexiYomw5PYqa
	YgSmr9vXNFqAjo6NbhX2JorxWO54zOImr2cJBX4=
X-Google-Smtp-Source: AK7set99MSXTmJoFR1UNnydVGNQtMuYTCDpvigftnWSUTbBhYpeJT2XTUYG5hGt59Heox8tcC7HBeQ==
X-Received: by 2002:a62:1916:0:b0:622:9e34:11f1 with SMTP id 22-20020a621916000000b006229e3411f1mr3070471pfz.17.1679494921472;
        Wed, 22 Mar 2023 07:22:01 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id e25-20020a62aa19000000b00627ed3e9c10sm6893524pff.137.2023.03.22.07.22.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Mar 2023 07:22:01 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 07/21] systemd.bbclass: Add /usr/lib/systemd to searchpaths as well
Date: Wed, 22 Mar 2023 04:21:26 -1000
Message-Id: <612e2cff28852d9d3dfc947ee07dbe4111748239.1679494378.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1679494378.git.steve@sakoman.com>
References: <cover.1679494378.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Mar 2023 14:22:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178932

From: Khem Raj <raj.khem@gmail.com>

Some packages like lirc places its unit files into $systemd_user_unitdir
and also uses them in SYSTEMD_SERVICE list in recipe. This fails in
do_package

ERROR: Didn't find service unit 'lircmd.service', specified in SYSTEMD_SERVICE:lirc.

here lircmd.service is installed in /usr/lib/systemd/system/lircmd.service

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 12808a4159835b67d8d53d32bc9135811701a779)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes-recipe/systemd.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes-recipe/systemd.bbclass b/meta/classes-recipe/systemd.bbclass
index f6564c2b31..ce188a8113 100644
--- a/meta/classes-recipe/systemd.bbclass
+++ b/meta/classes-recipe/systemd.bbclass
@@ -152,6 +152,7 @@ python systemd_populate_packages() {
     def systemd_check_services():
         searchpaths = [oe.path.join(d.getVar("sysconfdir"), "systemd", "system"),]
         searchpaths.append(d.getVar("systemd_system_unitdir"))
+        searchpaths.append(d.getVar("systemd_user_unitdir"))
         systemd_packages = d.getVar('SYSTEMD_PACKAGES')
 
         keys = 'Also'
-- 
2.34.1


