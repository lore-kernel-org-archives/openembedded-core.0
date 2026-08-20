Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4887EC5DF87
	for <webhook@archiver.kernel.org>; Thu, 20 Aug 2026 22:51:58 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1651.1787266311449733520
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Aug 2026 15:51:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=GXWbEp6Q;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-47db714766aso1127321f8f.0
        for <openembedded-core@lists.openembedded.org>; Thu, 20 Aug 2026 15:51:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1787266310; x=1787871110; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gdcqR2AewgZi9pII9pJEacVNO6iTkwd9YVu7t5QvJ2k=;
        b=GXWbEp6Q5SBgElwNjSZV8n1AJnQKc25m3O/aJ1fYX473oqulGyEnP1Uup1j3bqWUIp
         DDH9Qb+3OkkPXeyQ1meo8taXhnED2DtANR4ukxZ5VmMlQHqBa2jeO45sXLiD4MjZPCmo
         koiyH2Rto6ttLCh7oE7yfNnwZvMr4OXzgcGwQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787266310; x=1787871110;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=gdcqR2AewgZi9pII9pJEacVNO6iTkwd9YVu7t5QvJ2k=;
        b=Da+/8H+UHRHysqLvZX4RIwoEVGIfQ6Lfg7zPSBNfI9AfZj8ri4vZOJ/UShFNF1cwKd
         JKr4G5KJSXRCLCTAUa91vx/Epl8OdlXqcsBLunkmH4OTCo8Q721sWFbmhcxq01CNy4e0
         w8kNp8mrfBQsB2XDdVL4gtOq7YQ0nBPxk/7TVshRhr/d5yUVUc7PIqjTTvIX9EN9x3du
         JdvVVITQPy4taDRl85/mNboZZvMXkb7611zTRKsgj7gXgY75/JJ3+sUVFCWN4PIUPfi1
         /Bo/tfQT9lOSNcwkjSLRpKLofm233M6HoyYfk8flHlsN+LackTfHjENFWZK5dEu1ERBb
         eEDQ==
X-Gm-Message-State: AFuF++lTJupl4qwpA/1iJA0WPfbpG1PqhPYBolwAW0a3jc9kQsOoElgc
	uRdXzPbMTbmspl4zXPlOHDI8ZBv/uPvox3IgjIYBpxH6cJ6uTt7yoeEFgJGyw79OzVku1j+BId7
	T/ZCJKcU=
X-Gm-Gg: AR+sD12UKZa/+2FMwQbrL5fhVEK6TZB2bOY01I0K/lH+mqD2zdfbf9O75cdBXHn7QTp
	Xpe1xFkzQ8kzzwwtjJ5YVle0BYfY0g7luZB+AIn+4zROfbe3OFgR12z4/vts/7uGf04nxMKfqE+
	X6CBqpuBt5T7OrWy6wVLahVF/f1zTS3/nipL3XiFc4HCdn2f87dIAkKe1bhUwzgjOftshfJioyR
	ED7wbwEZcetjos+nLESON4ur6SGoKmnodYbZRrkhEYi51pqDf4kSrx8qbbyb1X0J2p7b9qD7E4X
	oJVD+YV5B3G4heJrHntQmCALlAB+SKvCPnzAdcKt5pL0gFUOupedDk70KB1PfJVYXpvscC5ywKn
	WtleZyzi1DQVcWa5QtuzUB3Z/WxJOm3kVVmrO9+ZU7wy8jC+2jL+7vDksYXXoPLjxbw/CzLJjZx
	x2y6oICtvcSgB1ajG+ajXQ7vn7rq3R6Vuzpu7yR4KmvaPyHOAYAD1/ka35//l7ev/wgdsMGfm0f
	cVY+xyAp62OzrvJIv7bM6QUMDXV
X-Received: by 2002:a05:6000:4a13:b0:481:562d:6fb1 with SMTP id ffacd0b85a97d-482c1163f13mr1368452f8f.6.1787266309508;
        Thu, 20 Aug 2026 15:51:49 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:9334:47ad:4624:539c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482b1441c78sm14998996f8f.2.2026.08.20.15.51.46
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 15:51:47 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] recipe_sanity: Drop rename overwrite detection
Date: Thu, 20 Aug 2026 23:51:45 +0100
Message-ID: <20260820225145.3460875-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Aug 2026 22:51:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243886

Bitbake itself checks for probelmatic renames now during key expansion so this
check shouldn't be needed anymore (it dates from pre 2011).

(https://git.openembedded.org/bitbake/tree/lib/bb/data.py#n96 in expandKeys())

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/recipe_sanity.bbclass | 21 ---------------------
 1 file changed, 21 deletions(-)

diff --git a/meta/classes/recipe_sanity.bbclass b/meta/classes/recipe_sanity.bbclass
index a5cc4315fb8..3c763de1f20 100644
--- a/meta/classes/recipe_sanity.bbclass
+++ b/meta/classes/recipe_sanity.bbclass
@@ -34,13 +34,6 @@ def req_vars(cfgdata, d):
         elif val == cfgval:
             __note("%s should be defined to something other than default (%s)" % (var, cfgval), d)
 
-def var_renames_overwrite(cfgdata, d):
-    renames = d.getVar("__recipe_sanity_renames", False)
-    if renames:
-        for (key, newkey, oldvalue, newvalue) in renames:
-            if oldvalue != newvalue and oldvalue != cfgdata.get(newkey):
-                __note("rename of variable '%s' to '%s' overwrote existing value '%s' with '%s'." % (key, newkey, oldvalue, newvalue), d)
-
 def incorrect_nonempty_PACKAGES(cfgdata, d):
     if bb.data.inherits_class("native", d) or \
             bb.data.inherits_class("cross", d):
@@ -113,7 +106,6 @@ python do_recipe_sanity () {
             __note(msg, d)
 
     can_delete_others(p, cfgdata, d)
-    var_renames_overwrite(cfgdata, d)
     req_vars(cfgdata, d)
     bad_runtime_vars(cfgdata, d)
 }
@@ -137,19 +129,6 @@ python recipe_sanity_eh () {
 
     d.setVar("__recipe_sanity_cfgdata", cfgdata)
     #d.setVar("__recipe_sanity_cfgdata", d)
-
-    # Sick, very sick..
-    from bb.data_smart import DataSmart
-    old = DataSmart.renameVar
-    def myrename(self, key, newkey):
-        oldvalue = self.getVar(newkey, 0)
-        old(self, key, newkey)
-        newvalue = self.getVar(newkey, 0)
-        if oldvalue:
-            renames = self.getVar("__recipe_sanity_renames", 0) or set()
-            renames.add((key, newkey, oldvalue, newvalue))
-            self.setVar("__recipe_sanity_renames", renames)
-    DataSmart.renameVar = myrename
 }
 addhandler recipe_sanity_eh
 recipe_sanity_eh[eventmask] = "bb.event.ConfigParsed"

