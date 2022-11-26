Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B6AFC47089
	for <webhook@archiver.kernel.org>; Sat, 26 Nov 2022 14:16:06 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web11.70846.1669472160797625654
 for <openembedded-core@lists.openembedded.org>;
 Sat, 26 Nov 2022 06:16:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=CmaWzqTR;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.43, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f43.google.com with SMTP id x13-20020a17090a46cd00b00218f611b6e9so6477050pjg.1
        for <openembedded-core@lists.openembedded.org>; Sat, 26 Nov 2022 06:16:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tAG5ep6/eMgt6A9eG85iks9/GNn4b3ZLyJPb/MvKsXQ=;
        b=CmaWzqTR+iRxXz3gOodz7Tkl8XYSQvsn9CY7ie1EQTiLysovJYr5L4H8Ecm/HzNNEc
         8b+HYk7v63+lbBvl3nFwpFL+zdPvstQUW0fZxaZ+iMXg2cvR7nCse+QInd33+8gFcIUD
         RwgXrM7yQYWzP7YBddygnssh+0lu3OXMJ50wyjuB8lwWlWMMtFoLzDsj2hN8ibOi2dt0
         8FytQ+a9jsMsaEcPHBFWbwAxA5k/gk/bKvDDUxTJOclzcNcZcIAZCDc2208LtPRtyHMa
         aIJ0sPCxDmzAw42jUo8WAwrE5uU0rj2aV+uOIXMkj85/fi6weH5v//TlDuHkkplOJcl+
         LcXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tAG5ep6/eMgt6A9eG85iks9/GNn4b3ZLyJPb/MvKsXQ=;
        b=mkJvnNwb+U9Ca+lI8kgaBLGa6zmSahZV8+V7LvoCWUmnrwBzELgEM2Oe5nch4qDtIv
         2gF0GHXAiZdSC2Y3Fqao7qHmi11/G+WTJYn+kkVPDAOrHX8mhaqjZGSr94xBSrKUVHoo
         Sc+p87bAfLg6MtNf/BrFNjXIXMuI37KGZo2DOlbHVqEykUqiRLypBSltSPn0xmrHqZGz
         8I00WML6pMBrLZnK2UnA4Am26rjvho2fnjVPwnZyAUqEqx0W8R/kHKj2nxHJD70zUyjI
         iJlrGnMA8LflHLbuwZwaegZaT2qhM5YrTVMBi036ydiipw9fNNThDBOgzqpM6cm41n2X
         4poQ==
X-Gm-Message-State: ANoB5pkcx7VHDU9dxJH5x5f4YslSlAD7eF0pGc1JxQpVi72TZxE17PxR
	KACLDKnJaR+pii/Wyy1+HFoC+h7MsHrave6jTpo=
X-Google-Smtp-Source: AA0mqf4aDu+0noahujzhvuohKJbOH0iL1NEXU4M2kQVkzBelSumKxkxCpDsRcSknY06pgxKcUcF7tw==
X-Received: by 2002:a17:90a:7848:b0:218:a3af:3bd3 with SMTP id y8-20020a17090a784800b00218a3af3bd3mr32902083pjl.183.1669472159850;
        Sat, 26 Nov 2022 06:15:59 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id im22-20020a170902bb1600b001895f7c8a71sm4649177plb.97.2022.11.26.06.15.58
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Nov 2022 06:15:59 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 26/37] oeqa/selftest/lic_checksum: Cleanup changes to emptytest include
Date: Sat, 26 Nov 2022 04:14:30 -1000
Message-Id: <34ff6190581258c7fa2786a71196703a35d9d5e3.1669471990.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1669471990.git.steve@sakoman.com>
References: <cover.1669471990.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 26 Nov 2022 14:16:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173819

From: Nathan Rossi <nathan.rossi@digi.com>

Config written to the emptytest include file is invalid after the test
has cleaned up its temporary directories resulting in the emptytest
recipe potentially having invalid content when parsed by successive
bitbake runs.

This presents the following error in tests after lic_checksum execution,
e.g. 'oe-selftest -r lic_checksum recipetool'

  ERROR: .../emptytest.bb: Unable to get checksum for emptytest SRC_URI entry tmpn_nyosnq: file could not be found

Remove the recipe include content once the bitbake runs are completed in
each lic_checksum test case.

Signed-off-by: Nathan Rossi <nathan.rossi@digi.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 087df767a64b271b503d714df3df6d8b3caad1c0)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/selftest/cases/lic_checksum.py | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/lic_checksum.py b/meta/lib/oeqa/selftest/cases/lic_checksum.py
index 5897a396d9..2d0b805b90 100644
--- a/meta/lib/oeqa/selftest/cases/lic_checksum.py
+++ b/meta/lib/oeqa/selftest/cases/lic_checksum.py
@@ -28,6 +28,7 @@ LIC_FILES_CHKSUM = "file://%s;md5=d41d8cd98f00b204e9800998ecf8427e"
 SRC_URI = "file://%s;md5=d41d8cd98f00b204e9800998ecf8427e"
 """ % (urllib.parse.quote(lic_path), urllib.parse.quote(lic_path)))
         result = bitbake(bitbake_cmd)
+        self.delete_recipeinc('emptytest')
 
 
     # Verify that changing a license file that has an absolute path causes
@@ -53,5 +54,6 @@ SRC_URI = "file://%s;md5=d41d8cd98f00b204e9800998ecf8427e"
             f.write("data")
 
         result = bitbake(bitbake_cmd, ignore_status=True)
+        self.delete_recipeinc('emptytest')
         if error_msg not in result.output:
             raise AssertionError(result.output)
-- 
2.25.1


