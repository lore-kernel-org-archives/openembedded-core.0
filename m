Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FEB0C433F5
	for <webhook@archiver.kernel.org>; Mon, 28 Mar 2022 21:33:50 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web10.228.1648503229162185662
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Mar 2022 14:33:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=f83iewuM;
 spf=pass (domain: gmail.com, ip: 209.85.221.41,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f41.google.com with SMTP id i4so3345065wrb.5
        for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Mar 2022 14:33:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0YIT1a6X/HCfZRpvC0/b1BtZ4vB/CSIBycPgCNcMoBA=;
        b=f83iewuMy31EDSkp2+2SC3NM7GO8YdVTgI1N4rsVtfTur5o7j8dPGUwXOo190+tICW
         OLtFDb1jrOAd2bB0E2DHP1OA0qX2nA9B6Bc7CnX+M81Z26GNxxctQUNcUhfsJewAbcLB
         SU/DxpaFk2LZlUdeO13/opGrAWNXl6xwxWh3NPp4L6CrMjVhJQzhFZ1zR8p8Z5WF38VJ
         R2VWFuhEspx9s6qc6xK3RFMQEZuxdvvPvMmwyfKZV5UN4EQi+Zvk/OTt2mBCKN1KQgRv
         rStOOwFCWYcza7Y74WZ5stflTUiRPwfwxKefymYrZFI3zTFoX2o2Em7tyXoUYj/XzCFW
         rwoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0YIT1a6X/HCfZRpvC0/b1BtZ4vB/CSIBycPgCNcMoBA=;
        b=0aYb/qjb5t09rpGoH+DIUm59SRxvg2o8Cit0p5YoLg4LO+romysy9lkZ0x03z3+bYz
         2ooalPiZ2txO0A3RRxi/u+m/KWFSExdjIiZsfBLTFSJAokfmbZD4cW4DmKgP7HH59SlI
         w19N9vQcwGxfhnE9lUZ9lXP1+yec9jmizvhTS711ch19bDTZ0h9+l0rFtDBEtJEhT0zh
         8iqLLpHtRKW3Ws1wF5Ud6MJ3qcyG+o/LxsROYyFOngWpthI+l4YpVFt2U6JvpX1z+IAT
         25hxXZCrnzTbJSA3r2FXDn8keC4yB/d4ziAgYj1istVpXbFHKB/PnAfIlrR1Rzn/H82n
         0rXg==
X-Gm-Message-State: AOAM532c3ma7M69U2WpOUOJb5uFH6Kue+Klj8kf/HMih+jtjScAiNImy
	xSubkPZqJUYXB+1EF7UDWyVbr/6llLrcTg==
X-Google-Smtp-Source: 
 ABdhPJzzS/g9V6T2S2UvfzM6hFfh4PWAcYQE7Mcbn6I0dQaH3oomhDEgfONCjFCg3FRA3LAxdpjstw==
X-Received: by 2002:a05:6000:1847:b0:204:1928:166a with SMTP id
 c7-20020a056000184700b002041928166amr26324514wri.122.1648503227131;
        Mon, 28 Mar 2022 14:33:47 -0700 (PDT)
Received: from CTW-01195.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id
 k5-20020a05600c1c8500b0038ce140fec1sm493386wms.16.2022.03.28.14.33.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Mar 2022 14:33:46 -0700 (PDT)
From: Jose Quaresma <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Scott Weaver <weaverjs@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH][dunfell] bitbake: fetch2: add check for empty SRC_URI hash
 string
Date: Mon, 28 Mar 2022 22:33:35 +0100
Message-Id: <20220328213335.115586-1-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Mar 2022 21:33:50 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163721

From: Scott Weaver <weaverjs@gmail.com>

No error was being reported when the hash string was set to empty.
For example: SRC_URI[md5sum] = ""

On a related note (not a bug):
Because whitespace in the string will result in a checksum mismatch, the error
message was updated to make it a little clearer why the error was thrown.
For example: SRC_URI[md5sum] = " " or
SRC_URI[md5sum] = " 209f8326f5137d8817a6276d9577a2f1"

Now creates a message like this:
File: '/home/scott/yocto-cache/downloads/rsync-3.2.3.tar.gz' has md5
checksum '209f8326f5137d8817a6276d9577a2f1' when ' 209f8326f5137d8817a6276d9577a2f1' was expected

[YOCTO #14232]

(Bitbake rev: a13510d0028e234ea2f4744b0d0c38558395c70f)

Signed-off-by: Scott Weaver <weaverjs@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 bitbake/lib/bb/fetch2/__init__.py | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/bitbake/lib/bb/fetch2/__init__.py b/bitbake/lib/bb/fetch2/__init__.py
index dc99914cd9..3e6555bd67 100644
--- a/bitbake/lib/bb/fetch2/__init__.py
+++ b/bitbake/lib/bb/fetch2/__init__.py
@@ -562,6 +562,9 @@ def verify_checksum(ud, d, precomputed={}):
 
         checksum_expected = getattr(ud, "%s_expected" % checksum_id)
 
+        if checksum_expected == '':
+            checksum_expected = None
+
         return {
             "id": checksum_id,
             "name": checksum_name,
@@ -612,7 +615,7 @@ def verify_checksum(ud, d, precomputed={}):
 
     for ci in checksum_infos:
         if ci["expected"] and ci["expected"] != ci["data"]:
-            messages.append("File: '%s' has %s checksum %s when %s was " \
+            messages.append("File: '%s' has %s checksum '%s' when '%s' was " \
                             "expected" % (ud.localpath, ci["id"], ci["data"], ci["expected"]))
             bad_checksum = ci["data"]
 
-- 
2.35.1


