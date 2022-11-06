Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49E60C4332F
	for <webhook@archiver.kernel.org>; Sun,  6 Nov 2022 16:04:12 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web09.17886.1667750651194663452
 for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Nov 2022 08:04:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=0mBk/I+F;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.51, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f51.google.com with SMTP id d13-20020a17090a3b0d00b00213519dfe4aso8331478pjc.2
        for <openembedded-core@lists.openembedded.org>; Sun, 06 Nov 2022 08:04:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l+RAn+KEKbGC2dpv+DUNzaUtWaBHIhkNYyz9aGuyfHQ=;
        b=0mBk/I+FVb+l43bsMK91dSdG66WdMdRpPcvW4VTSnW44hSJWdAqzyeqDtQNa92YeGc
         CHiRFgcP0usl1dJ/Ws5hAfnYt4W05kZ8FcaI5cxipU69D9fh77z38SIXp3cnJzjkq6Wc
         snsMRS5rOEufgkFafs0CX0EF3wmBvuU63/IjlAByhb/MQSsPFn3b7xO+xWhJI31D2h4B
         GVJe4oWTskgd+m7QD7bD1qvRy1cS3qOBchNTCXOEA9wSVA1HGgp1pl5InW92PJRn6xd8
         Kesw84NvmVjWAWpbsjqHJ6lgtXZKFioVpFggO/F0i+2NBgcLX755bHi67pnrcffyfCHA
         nYEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l+RAn+KEKbGC2dpv+DUNzaUtWaBHIhkNYyz9aGuyfHQ=;
        b=uI8PMzXWu8w/4IGUxJvKy/1Fc22te3nmVOIiCuJBjMig/Jjq2Dm+QEpAUptO87omA1
         HAV+Cuj4nDozLf0gSXhslIsaVsbwn+70jKhqfJ52/w/O14JaBRp2Ggc5QwcLigzi5r3z
         1nP53I/OIYSiVQZrlVDCsRvYi51UkfuEqu+FeWKA+xaaIJ0c9+21weVcfefuzHd7MbaU
         3sn2wLdAF44hKLi8msEp67P6sl479cuqXvspgHoUA6kLIIu3YMiCdkSwERg1cqnDMgjx
         DXuMvkqG3hs0gMMyMaii6G7c/XzeYD3BItpRbjgRFIhzgHKpoc1iAje0UYqQwof/nyno
         Rg6A==
X-Gm-Message-State: ACrzQf14PzK2LGavDKAlKQaUXBA3y/PCp5Pyn7e5uXsEgi4CTMXYQNEu
	WRiP1TyJJAeL5R44dEiMNj98Mf9/4Ndq+UTL
X-Google-Smtp-Source: AMsMyM451poYFWgWEu1AbbEK/r2NBaqjf0zToJNCHQ7JMg3TL6M5bXOZvIe8klzqlWLRIXRPaFNh2w==
X-Received: by 2002:a17:90a:de13:b0:213:eab9:5e38 with SMTP id m19-20020a17090ade1300b00213eab95e38mr37120793pjv.44.1667750650106;
        Sun, 06 Nov 2022 08:04:10 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id s11-20020a170902ea0b00b0018700ba9090sm3294683plg.185.2022.11.06.08.04.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Nov 2022 08:04:09 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 4/8] cve-update-db-native: add timeout to urlopen() calls
Date: Sun,  6 Nov 2022 06:03:49 -1000
Message-Id: <f51a6742bcae3a151a326d17cd44935815eb78c7.1667750511.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1667750511.git.steve@sakoman.com>
References: <cover.1667750511.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 06 Nov 2022 16:04:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172810

From: Frank de Brabander <debrabander@gmail.com>

The urlopen() call can block indefinitely under some circumstances.
This can result in the bitbake process to run endlessly because of
the 'do_fetch' task of cve-update-bb-native to remain active.

This adds a default timeout of 60 seconds to avoid this hang, while
being large enough to minimize the risk of unwanted timeouts.

Signed-off-by: Frank de Brabander <debrabander@gmail.com>
Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit e5f6652854f544106b40d860de2946954de642f3)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/meta/cve-update-db-native.bb | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/meta/cve-update-db-native.bb b/meta/recipes-core/meta/cve-update-db-native.bb
index 85874ead01..59e7d7dc2c 100644
--- a/meta/recipes-core/meta/cve-update-db-native.bb
+++ b/meta/recipes-core/meta/cve-update-db-native.bb
@@ -17,6 +17,9 @@ deltask do_populate_sysroot
 # Use a negative value to skip the update
 CVE_DB_UPDATE_INTERVAL ?= "86400"
 
+# Timeout for blocking socket operations, such as the connection attempt.
+CVE_SOCKET_TIMEOUT ?= "60"
+
 python () {
     if not bb.data.inherits_class("cve-check", d):
         raise bb.parse.SkipRecipe("Skip recipe when cve-check class is not loaded.")
@@ -39,6 +42,8 @@ python do_fetch() {
     db_file = d.getVar("CVE_CHECK_DB_FILE")
     db_dir = os.path.dirname(db_file)
 
+    cve_socket_timeout = int(d.getVar("CVE_SOCKET_TIMEOUT"))
+
     if os.path.exists("{0}-journal".format(db_file)):
         # If a journal is present the last update might have been interrupted. In that case,
         # just wipe any leftovers and force the DB to be recreated.
@@ -77,7 +82,7 @@ python do_fetch() {
 
             # Retrieve meta last modified date
             try:
-                response = urllib.request.urlopen(meta_url)
+                response = urllib.request.urlopen(meta_url, timeout=cve_socket_timeout)
             except urllib.error.URLError as e:
                 cve_f.write('Warning: CVE db update error, Unable to fetch CVE data.\n\n')
                 bb.warn("Failed to fetch CVE data (%s)" % e.reason)
@@ -104,7 +109,7 @@ python do_fetch() {
 
                 # Update db with current year json file
                 try:
-                    response = urllib.request.urlopen(json_url)
+                    response = urllib.request.urlopen(json_url, timeout=cve_socket_timeout)
                     if response:
                         update_db(conn, gzip.decompress(response.read()).decode('utf-8'))
                     conn.execute("insert or replace into META values (?, ?)", [year, last_modified]).close()
-- 
2.25.1


