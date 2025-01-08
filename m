Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E949C3DA4A
	for <webhook@archiver.kernel.org>; Wed,  8 Jan 2025 10:59:11 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web11.16734.1736333943626842819
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jan 2025 02:59:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=M/VHfcf9;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-385e0e224cbso8293981f8f.2
        for <openembedded-core@lists.openembedded.org>; Wed, 08 Jan 2025 02:59:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1736333941; x=1736938741; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=8KjM5jybny2mAWo5UGZvaUqrmcHqr7EvtX3Bzpq0xOU=;
        b=M/VHfcf9D4vEaDXAaX17+/6BmbrrNofgCgi9QVdaNe/ypZd+h2Yc/UE/H+IwEFF6y+
         3vQvBdC1/jHURJ231WGmUlXGX/u0DSwKhicrk108s/f9pecDKWHcob24pH3ImcG50PZN
         BDtdK0xVzra1PCKobud3YBjZH7/quPoSyei9M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736333941; x=1736938741;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8KjM5jybny2mAWo5UGZvaUqrmcHqr7EvtX3Bzpq0xOU=;
        b=FfY4HyzWPFmPgCdu+n7PdtQexU7quZJ478stW6/mDZlNC1Hl5PQkxJ+OtZ7LhuE79T
         0Xhr72nUNmoBr4leFWN60Yrf+pp7AhMVFdya/gDXCLiJoN2nQPs8RXne/HUk8LgnuDou
         zTjq0s27DON6LN0WKz6aLFK+QXA76cOYJrHupjacHP94cpbv+a30i1yeeUejGDal+4yx
         d8g0yDp4V/9r6DY6cs29hKb6ArXwQt7dVar8+8c8OT8RvBK1VbX+EwXy3P1hS0LFuBLO
         gTNovkQ71Sm8CzV9ZTGw7uoYdKuuJ/RTaHW1uGdkrZ3qmJp/IaLJPNJcb7TH+/E5gZdc
         usVg==
X-Gm-Message-State: AOJu0Yziwu4rFlwU3SbW4cAX+YAHe8NeHDI0kVm3OEmB9qNQsjEhFz3k
	WF/c35KiQIdCXPsu3iqFmJ/lEEWatgKkvOUOYZF7cVESnwKI5i/mZu3IN4Yjd02ICIol5iV81qL
	v4ZY=
X-Gm-Gg: ASbGncusXKfd3cgnYtKew+56rPy4EICWMC7N5NjgnEd/oswlmTDMb2UsufrtHYBhcK8
	zflXST0BCP5I/6yr3XA/XlO7iGfRVC7rUZnUPrLgF4Hv+9p6mhXwSWEZKHl2GLkvm01Z1UMYi2z
	n81R9lsju8zCOoYfqeYW1CodwHPgjRZxWLbyoOkgDkyd98WRq22m2rho2LMky2YbgkIiPnRN4yr
	IrD9QV5rNoMec3ZiWtSSd4S7X4EVcJjHTJbRUkmrOiTZyV5l27S92hVGc12RAzkco2X/8l1g8Gw
	NkYnpry19A==
X-Google-Smtp-Source: AGHT+IEayutX9CiAhHitjxwDaLukmGp+kYzeXRzkvNe6jDF4E7iBAqzy3DXFHbcjnkZL6u9TbHoY1A==
X-Received: by 2002:a05:6000:401e:b0:386:366d:5d03 with SMTP id ffacd0b85a97d-38a872da868mr1842518f8f.16.1736333940853;
        Wed, 08 Jan 2025 02:59:00 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:906a:f5af:b180:de5a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c8288b8sm52186033f8f.11.2025.01.08.02.58.59
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2025 02:59:00 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/3] native: Improve ${PN}-XXX package name handling
Date: Wed,  8 Jan 2025 10:58:57 +0000
Message-ID: <20250108105859.3561400-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Jan 2025 10:59:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209548

If a recipe has something like:

RPROVIDES:${PN}-xxx = "yyy"

then the current code will turn this into:

RPROVIDES:${BPN}-native-xxx = "yyy-native"

which can lead to errors. Add in some handling for this special case in the class
extension code.

The corresponding entry in PACKAGES is correctly remapped, the variables aren't
remapped to match though.

Note that merging this does trigger new dependencies to be exposed, some of which
can't be met or are incorrect. These need to be fixed on a case by case basis.

There was also a problem in the existing code when handling anonymous python in
PACKAGES since it would pass bizarre package names like "d)}" to the remapping code.
This patch changes it to ignore anonymous python since in the native case, this likely
isn't wanted anyway. This also then avoids ${PN}-ptest in the native case which was a
common dependency problem.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes-recipe/native.bbclass | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/meta/classes-recipe/native.bbclass b/meta/classes-recipe/native.bbclass
index d9651a7f22d..1d9432138ef 100644
--- a/meta/classes-recipe/native.bbclass
+++ b/meta/classes-recipe/native.bbclass
@@ -119,6 +119,7 @@ SSTATE_SCAN_CMD ?= "${SSTATE_SCAN_CMD_NATIVE}"
 INHIBIT_SYSROOT_STRIP ?= "${@oe.utils.vartrue('DEBUG_BUILD', '1', '', d)}"
 
 python native_virtclass_handler () {
+    import re
     pn = e.data.getVar("PN")
     if not pn.endswith("-native"):
         return
@@ -158,10 +159,20 @@ python native_virtclass_handler () {
                 newdeps.append(dep.replace(pn, bpn) + "-native")
             else:
                 newdeps.append(dep)
-        d.setVar(varname, " ".join(newdeps))
+        output_varname = varname
+        # Handle ${PN}-xxx -> ${BPN}-xxx-native
+        if suffix != "${PN}" and "${PN}" in suffix:
+            output_varname = varname.replace("${PN}", "${BPN}") + "-native"
+            d.renameVar(varname, output_varname)
+        d.setVar(output_varname, " ".join(newdeps))
 
     map_dependencies("DEPENDS", e.data, selfref=False)
-    for pkg in e.data.getVar("PACKAGES", False).split():
+    # We need to handle things like ${@bb.utils.contains('PTEST_ENABLED', '1', '${PN}-ptest', '', d)}
+    # and not pass ${PN}-test since in the native case it would be ignored. This does mean we ignore
+    # anonymous python derived PACKAGES entries.
+    for pkg in re.split(r"\${@(?:{.*?}|.)+?}|\s", d.getVar("PACKAGES", False)):
+        if not pkg:
+            continue
         map_dependencies("RDEPENDS", e.data, pkg)
         map_dependencies("RRECOMMENDS", e.data, pkg)
         map_dependencies("RSUGGESTS", e.data, pkg)

