Return-Path: <loc.renesas@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C93AC74A5B
	for <webhook@archiver.kernel.org>; Wed, 29 Mar 2023 08:08:34 +0000 (UTC)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.web11.19177.1680077307039665725
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Mar 2023 01:08:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=AC1b79bS;
 spf=pass (domain: gmail.com, ip: 209.85.215.179, mailfrom: loc.renesas@gmail.com)
Received: by mail-pg1-f179.google.com with SMTP id h14so8773600pgj.7
        for <openembedded-core@lists.openembedded.org>; Wed, 29 Mar 2023 01:08:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680077306;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G6a7czPFzzcHaZUMODcas24MVNtbWyinh64DvWsPMxM=;
        b=AC1b79bSs9cBjTJKARW9HuNeXAEz6z4Kjc5IVdK4Z67OPQr6TMXEQ/SeIDbxOPUoxv
         Tix5mc3YqLWJBxscDr9SpFttPlwQZwew3NzxOkBdkLRtsW/Je6xgOkXClrZy475lBh/s
         1YRPUfzjTyVl0RIIWYt+FRf5fZysHKDL1Fn8c4jzF5kri0eTTkNhTy7O/JTTlwAbyqTf
         Bw6kvd7wh7WXFx0JNLaEhgGa+cyGRWMhi7SVwArVJ7eNHdNSbtC9LzWsV5xPhy4QL7Ml
         YgQRBBTFX9DS3wPeyuiGu0mHO6a1dvruZh4WF9wzOdANymr9UBWBfYt75T/ONwjrbxQg
         YeVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680077306;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G6a7czPFzzcHaZUMODcas24MVNtbWyinh64DvWsPMxM=;
        b=HWpWGxqECjlz5DNg/8wt3kvI4HsqYlrjdpPWx4QXEcM/VeBkTMp6xOgYxWsB7jbdNY
         o+VTUE0qfhPY+WlmukEpqgDixwUFg/rflBbbr5hEmwVyCnpy5ofuxklVXHAmLh12W16m
         cUMSdRr/h6fFuIYSxcyN24ZWUv+kgWcz1kQXE2YNhmtFqcQICpS6rI5qnvi7YxJXeXta
         RjJivpYYm1x3ilT0EuaFqKjnKoVR51oS2N4x4iz3UzrSfVJfIa/FsAjeNewrwklZLf3S
         bMUxBMUGfw6gBz+eKPp7OmAknyafpsl8/LO0Bgtpws8Zhv5A5fjHWdLi1Qa8Q0M8iB69
         micw==
X-Gm-Message-State: AO0yUKV27SPhX19VvwjYrthGxxKBVEhqjppOYkpxbL1jHSyDnz354grT
	qGlx5+duJHjsIXVls4eeOSrMPK+puB0g2F0q
X-Google-Smtp-Source: AKy350bi1PbZwANxbl2f3o7IbHk7jHrqUSu+Ksa9EKXnlvOCQ3J1ozy1kX0soKswwMUmWlDcZa/pcA==
X-Received: by 2002:a62:52d7:0:b0:622:c72a:d0e0 with SMTP id g206-20020a6252d7000000b00622c72ad0e0mr17077659pfb.13.1680077306348;
        Wed, 29 Mar 2023 01:08:26 -0700 (PDT)
Received: from localhost.localdomain ([113.161.39.1])
        by smtp.gmail.com with ESMTPSA id q27-20020a63505b000000b0050bebfe464dsm20967038pgl.53.2023.03.29.01.08.25
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Mar 2023 01:08:26 -0700 (PDT)
From: loc.renesas@gmail.com
X-Google-Original-From: loc.nguyen.wt@renesas.com
To: openembedded-core@lists.openembedded.org
Subject: [poky][PATCH 1/1] setuptools3: adding sanity check to detect python-eggs install
Date: Wed, 29 Mar 2023 15:08:05 +0700
Message-Id: <6079e5a15a635a639338c76873c41c2a69f72774.1680070372.git.loc.nguyen.wt@renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1680070372.git.loc.nguyen.wt@renesas.com>
References: <cover.1680070372.git.loc.nguyen.wt@renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Mar 2023 08:08:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179267

From: Loc Nguyen <loc.nguyen.wt@renesas.com>

Packages that install Python modules shouldn't be installing Eggs,
as distro-managed modules should be "bare"

Added a sanity check to verify if python modules will install Eggs.
If yes, display a warning message to user.

See [YOCTO #5725] for more details

Signed-off-by: Loc Nguyen <loc.nguyen.wt@renesas.com>
---
 meta/classes-recipe/setuptools3.bbclass | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/meta/classes-recipe/setuptools3.bbclass b/meta/classes-recipe/setuptools3.bbclass
index 4c6e79ee9a..1ce470f7e3 100644
--- a/meta/classes-recipe/setuptools3.bbclass
+++ b/meta/classes-recipe/setuptools3.bbclass
@@ -33,6 +33,16 @@ setuptools3_do_install() {
         python_pep517_do_install
 }
 
+python do_sanity_check() {
+    # Python modules shouldn't be installing Eggs, as distro-managed modules should be "bare"
+    pkgName = d.getVar('BPN')
+    rdeps = d.getVar('RDEPENDS_' + pkgName) or ""
+    if ('python-eggs' in rdeps) or ('python3-eggs' in rdeps):
+        bb.warn(pkgName + ' is installing Eggs.')
+}
+
+addtask sanity_check before do_fetch
+
 EXPORT_FUNCTIONS do_configure do_compile do_install
 
 export LDSHARED="${CCLD} -shared"
-- 
2.25.1


