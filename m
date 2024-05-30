Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7794C25B74
	for <webhook@archiver.kernel.org>; Thu, 30 May 2024 16:24:25 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web11.659.1717086258669560221
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 May 2024 09:24:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=L7zXZYZV;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3550134ef25so1082245f8f.1
        for <openembedded-core@lists.openembedded.org>; Thu, 30 May 2024 09:24:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1717086257; x=1717691057; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=71pcCjyJ4/kwb8zep2EqcbHmaQv3rfZtPXGG5ERalWw=;
        b=L7zXZYZV5C5tqs3jMvIMrKfjPd7TrjSLyPbZtH3EZaUByHUuDv+0imJfxBIUTQmImq
         rKoOpj9suUh/xJqfL5XRUTYU/zZd+kumUMUBzKZ/MRgInWEV+osg2M5O96wau60mPE2W
         hkPvcantcJvCQbaX5rMvEmS8RM8tSniuZfM+4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717086257; x=1717691057;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=71pcCjyJ4/kwb8zep2EqcbHmaQv3rfZtPXGG5ERalWw=;
        b=oD7DhV4jRM7M+8lUoCYkoSwWlTds6QajEPM8EYBE+cnGmxVfnPhaBdg97yRHyMGRhK
         tCDax0hS6Q1GGOVU1+Owv2fJNAk1ZUs5q8JlvaOWesO+uDQujRMOKSN2OhL9fdcfwa3e
         Rw+1j7k+pnpV/dZ5fDPPfRnDG2Q1Hzr8fLCPd9BQxQ1+FGhg3XbN1TGMwv1e2HhoUE21
         je+D4JBkr4kehisY+SNOIcW3t81fFtROYjmpQJ6nHFix1S149RILtkS18GuVgEkXoBWx
         BguUQRbJyCSpZj0rmSjKTGRHdcpQdeLCvamE14MF/xUWLIHohjytxxkh3jUJUPm9nbKB
         4NYQ==
X-Gm-Message-State: AOJu0YwtaHOZctG/XqqsM9SEtZH5lQDX68bBmwviy8vUAJmxYr7ILq4P
	L61vl7yE0Wj84hgFV+kIB1N3vN8TtasaHMDihoC2zVPPFIFjxbzkYn5CThgnBVc5Dt3a3Py73Sm
	i
X-Google-Smtp-Source: AGHT+IFdIuw4UKYbdYQQnBu9GFJyDCFg4vWCVjR/YtPLL8izUa4J9kD7uWxhtge17mNv+sicdrM/OA==
X-Received: by 2002:a5d:6390:0:b0:354:fa57:a0c5 with SMTP id ffacd0b85a97d-35dc009880cmr1943236f8f.38.1717086256779;
        Thu, 30 May 2024 09:24:16 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:e2db:3695:26f3:1f11])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3587724c6f4sm12914650f8f.28.2024.05.30.09.24.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 May 2024 09:24:16 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/4] sstate: Drop intercept functions support
Date: Thu, 30 May 2024 17:24:12 +0100
Message-Id: <20240530162414.3111406-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240530162414.3111406-1-richard.purdie@linuxfoundation.org>
References: <20240530162414.3111406-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 May 2024 16:24:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200029

The only user was siteconfig which has been removed. The API was horrible
and we don't want to encourage this kind of usage.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes-global/sstate.bbclass | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/meta/classes-global/sstate.bbclass b/meta/classes-global/sstate.bbclass
index 76a7b59636c..f4ebeb5859a 100644
--- a/meta/classes-global/sstate.bbclass
+++ b/meta/classes-global/sstate.bbclass
@@ -189,7 +189,6 @@ def sstate_state_fromvars(d, task = None):
     plaindirs = (d.getVarFlag("do_" + task, 'sstate-plaindirs') or "").split()
     lockfiles = (d.getVarFlag("do_" + task, 'sstate-lockfile') or "").split()
     lockfilesshared = (d.getVarFlag("do_" + task, 'sstate-lockfile-shared') or "").split()
-    interceptfuncs = (d.getVarFlag("do_" + task, 'sstate-interceptfuncs') or "").split()
     fixmedir = d.getVarFlag("do_" + task, 'sstate-fixmedir') or ""
     if not task or len(inputs) != len(outputs):
         bb.fatal("sstate variables not setup correctly?!")
@@ -205,7 +204,6 @@ def sstate_state_fromvars(d, task = None):
     ss['lockfiles'] = lockfiles
     ss['lockfiles-shared'] = lockfilesshared
     ss['plaindirs'] = plaindirs
-    ss['interceptfuncs'] = interceptfuncs
     ss['fixmedir'] = fixmedir
     return ss
 
@@ -790,9 +788,6 @@ sstate_task_prefunc[dirs] = "${WORKDIR}"
 python sstate_task_postfunc () {
     shared_state = sstate_state_fromvars(d)
 
-    for intercept in shared_state['interceptfuncs']:
-        bb.build.exec_func(intercept, d, (d.getVar("WORKDIR"),))
-
     omask = os.umask(0o002)
     if omask != 0o002:
        bb.note("Using umask 0o002 (not %0o) for sstate packaging" % omask)

