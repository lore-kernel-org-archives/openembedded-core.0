Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 682C5C64ED6
	for <webhook@archiver.kernel.org>; Sat, 11 Feb 2023 21:24:37 +0000 (UTC)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.web11.19495.1676150659841718988
 for <openembedded-core@lists.openembedded.org>;
 Sat, 11 Feb 2023 13:24:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=RJp01Pcu;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.172, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f172.google.com with SMTP id x31so5924780pgl.6
        for <openembedded-core@lists.openembedded.org>; Sat, 11 Feb 2023 13:24:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A+KwquLrLYw+qWBpYpeMvSymNEq2vlNL4g7oWddzl4E=;
        b=RJp01Pcubd99yizS/IoqkIdJsay29iIlPaqms8C1Lzb70hi17lWGs1woOOW94I/gOJ
         SZja5bcnswgpOFPOvRSw9oB9U5vmXvQ4EfylxumUL2dhn7fULd7DxQ2AgzHGEb7HfNsg
         JdgvUTtosRdRIgJiZmBfLK6otxACH13ngW8ZIG8prRXewLMJeiDWXk49dg8HSsqhwam/
         IRKp53FDblD6F1x8QS1RbIUcHGgjzQciWnf/czsqPuDmyfreq/i6jxbuIPpF6B/wPx22
         OT6fhsm/yCMZLMS0g5D2sSc8U2F8QeIKpfB0aijhDXg4WlcfvDd93HVOhJeL4AI9JEvu
         sfeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A+KwquLrLYw+qWBpYpeMvSymNEq2vlNL4g7oWddzl4E=;
        b=rIUJo2Gp86Qv4KogT4DeELzzbqqb5PTtePvLsozrmTjxF8X0ZDrTdCaGDV0YzfezK8
         qiVEH6/Ti6h9n2+cVHTOKvnhXjSeEoT/pWiMF4aJ+qaaGvxTfyE3w5yAkbr5sNWhBDl8
         Ud5toaPkHgab6oFMcqNsdctkQyjjL/zZS4qU55tXdWHwX5G0g1MEXstvPtiFt2R47jZp
         eyvSyP/2tJZRZjvOmM+ZHgSWBBd2c/UlSWW9ms8w0zShMkkPeHO2jyMs4i6hiUFXmTzi
         oYCZJlWiQY3SAUe1wlUHMYFn0Z6EKNmRyysFMunwFXIToddGpM5ywUcvHrUUHL18xxkl
         75FA==
X-Gm-Message-State: AO0yUKXu/1kGYxe4eavQ5xeMNnPAR7LahMHgWCNCqmHRNlLkI/svCoi5
	PAroshta/qPgbxfM9Tj2dd1aGRCaU991IQLT3vE=
X-Google-Smtp-Source: AK7set/Vgja0MZ6gznpaZkNpiYJserFeaR1xr7upIn17lZlTpSPaDbGtALJveviwNS5xvpmyCMlMnQ==
X-Received: by 2002:a62:5881:0:b0:5a8:abd7:a9e8 with SMTP id m123-20020a625881000000b005a8abd7a9e8mr159560pfb.27.1676150674266;
        Sat, 11 Feb 2023 13:24:34 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id v23-20020aa78097000000b0059393d46228sm5398595pff.144.2023.02.11.13.24.33
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Feb 2023 13:24:33 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 21/28] sstate.bbclass: Fetch non-existing local .sig files if needed
Date: Sat, 11 Feb 2023 11:23:44 -1000
Message-Id: <51c7e5c9f292278f5bdf35bdbd251c50482d55dc.1676150527.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1676150527.git.steve@sakoman.com>
References: <cover.1676150527.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 11 Feb 2023 21:24:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177031

From: Tobias Hagelborn <tobias.hagelborn@axis.com>

For the case of a global shared state cache and a local sstate cache
with a mix of signed and un-signed entries, there is a case where
a .sig is missing locally, but may exist in the global sstate cache.

For this case, do not just fail sstate fetch, but rather backfill
the .sig file from the global sstate cache.

If this case is detected, re-run the fetch operation to get the
global .sig file (if it exists).

Signed-off-by: Tobias Hagelborn <tobias.hagelborn@axis.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit d5ea1a5396bf9fd4303cae46bc0e042be8de8d67)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes-global/sstate.bbclass | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/classes-global/sstate.bbclass b/meta/classes-global/sstate.bbclass
index 21959ff13b..2dd880bbab 100644
--- a/meta/classes-global/sstate.bbclass
+++ b/meta/classes-global/sstate.bbclass
@@ -365,8 +365,9 @@ def sstate_installpkg(ss, d):
     d.setVar("SSTATE_CURRTASK", ss['task'])
     sstatefetch = d.getVar('SSTATE_PKGNAME')
     sstatepkg = d.getVar('SSTATE_PKG')
+    verify_sig = bb.utils.to_boolean(d.getVar("SSTATE_VERIFY_SIG"), False)
 
-    if not os.path.exists(sstatepkg):
+    if not os.path.exists(sstatepkg) or (verify_sig and not os.path.exists(sstatepkg + '.sig')):
         pstaging_fetch(sstatefetch, d)
 
     if not os.path.isfile(sstatepkg):
@@ -377,7 +378,7 @@ def sstate_installpkg(ss, d):
 
     d.setVar('SSTATE_INSTDIR', sstateinst)
 
-    if bb.utils.to_boolean(d.getVar("SSTATE_VERIFY_SIG"), False):
+    if verify_sig:
         if not os.path.isfile(sstatepkg + '.sig'):
             bb.warn("No signature file for sstate package %s, skipping acceleration..." % sstatepkg)
             return False
-- 
2.34.1


