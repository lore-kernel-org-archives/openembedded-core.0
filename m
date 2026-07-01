Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FE57C43327
	for <webhook@archiver.kernel.org>; Wed,  1 Jul 2026 17:06:58 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.50240.1782925596547499809
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Jul 2026 10:06:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=JNp7OaYI;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-472a14c9965so788626f8f.1
        for <openembedded-core@lists.openembedded.org>; Wed, 01 Jul 2026 10:06:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1782925595; x=1783530395; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=ElOXyUbTKkqaQh/oKkFcBhaiP+Q8sH77bH353q4NVi8=;
        b=JNp7OaYImgF8P5b0ofH/rGduOg+TNoABpmtZVId9hK4tSexlnVFrgMzTrMnrGsxvQP
         H3wLt4r6To6BfPlH9bSE9mL0+B2WcyDhV8IQomqpSHVHE0qTifZYvmi1FzSgtEVNxOwB
         QvFo913my2zG03ZpRKMX4PGHMqQbavjEFXnDk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782925595; x=1783530395;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ElOXyUbTKkqaQh/oKkFcBhaiP+Q8sH77bH353q4NVi8=;
        b=eUP95u0IqC8X/VSstugbp5+Og8Lp1BK19WAOa/kCJOO2Pc5QQO03gP/VOccGNaOVzO
         FkagUV3znI51A12+EJDG9uhbA/T8m2IOyeI1BwXDCZwVOse/ayWVWFZxHE41uxan1EzS
         y29EJhb+NkU38eNQFox8roU53tgysAguZ/Lr3OX1RPcnpVu2AByRJ2bC10vDWycRSWlF
         fZTIelcbmmHpTcB6ycKBZImDZoj9DQMTaMUGzkWk0nRoFnumw4BO+NEC9conbVZa5cpz
         bO327JHzENHNT12ch9cSYCeoHExUQ01ugwpHsZAJ2XOwyiicqteJW1Vfki4p8I49CYfx
         B27Q==
X-Gm-Message-State: AOJu0YznOMdOWDyswGylc4KRSbw7qwdu6umufB/gC0+DQQnvyFy0wFxQ
	jW6z2/w97rv+bcSCGYu3RgU9nLSwH3gNaiNyK644At/F8MNunB88shnrIMO8G61DoZvvHLAE7pK
	TRmOO
X-Gm-Gg: AfdE7ck4aCkBbFHRz6nEfmUHtdOgWY1NtNU2KURnLbEZZpDReGeztzp+ejx7yQ0P/Ou
	0JZx9wbKGv5SlhH7ZgprGkl7VodPGMHGw77dqoyPKFFM41joQkWQ207GDgWPe7hPBv6SIj4C2FI
	cLR0cTMAdHULhQXxanuUwIfXOr13HUO+3ArhjeFjGXq0QLcERCRr+OAyRYaaYsiLY36n3kd+yn4
	+PkCLsfNEQpQmrse++Switz2WX+Qj+k9kj4Jh5x2zVYHbwz6l6GxohbKuCng6Vb7KyOf2gzNUW4
	VRtvuheGJGX3RJqDOBpx24RFcThvSG2uEALue5oRvbaUjy+RifHRhNePgioi0nESn6EunxXDLt6
	bLNEm0NkaYFtnmNn98Q3Mc57TsHyvsSwJvgxp6vAQc0gSqPHCWvOrWPg+MibY2Xin5fkN1ujXBt
	in0iBAwF9sD7rPsh8SQRHZY1wlLxBgXJSiVzOetiwA4qqQPxTymmbC
X-Received: by 2002:a05:6000:607:b0:46d:19b6:8653 with SMTP id ffacd0b85a97d-4775a6ce840mr4116012f8f.40.1782925594513;
        Wed, 01 Jul 2026 10:06:34 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:6b3f:20f2:ee05:f032])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-477de3dc77bsm1252754f8f.33.2026.07.01.10.06.32
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 10:06:33 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] sstate/staging: Add SSTATETASKS vardepsexclude entries
Date: Wed,  1 Jul 2026 18:06:31 +0100
Message-ID: <20260701170631.4140885-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Jul 2026 17:06:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240003

Tasks should never be dependning on SSTATETASKS since that can change for things
which code should be independent from (e.g. package backend), breaking sstate reuse.
Add the appropriate vardepexclude entres.

This currently isn't an issue due to extend_recipe_sysroot being globally
excluded from hashes.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes-global/sstate.bbclass  | 2 ++
 meta/classes-global/staging.bbclass | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/classes-global/sstate.bbclass b/meta/classes-global/sstate.bbclass
index 4ad71a70dac..34a59fda002 100644
--- a/meta/classes-global/sstate.bbclass
+++ b/meta/classes-global/sstate.bbclass
@@ -467,6 +467,7 @@ def sstate_clean_cachefiles(d):
         ld = d.createCopy()
         ss = sstate_state_fromvars(ld, task)
         sstate_clean_cachefile(ss, ld)
+sstate_clean_cachefiles[vardepsexclude] += "SSTATETASKS"
 
 def sstate_clean_manifest(manifest, d, canrace=False, prefix=None):
     import oe.path
@@ -571,6 +572,7 @@ python sstate_cleanall() {
         shared_state = sstate_state_fromvars(ld, name)
         sstate_clean(shared_state, ld)
 }
+sstate_cleanall[vardepsexclude] = "SSTATETASKS"
 
 python sstate_hardcode_path () {
     import subprocess, platform
diff --git a/meta/classes-global/staging.bbclass b/meta/classes-global/staging.bbclass
index 15ed3d002f1..7e4267afc7a 100644
--- a/meta/classes-global/staging.bbclass
+++ b/meta/classes-global/staging.bbclass
@@ -645,7 +645,7 @@ python extend_recipe_sysroot() {
 
     bb.utils.unlockfile(lock)
 }
-extend_recipe_sysroot[vardepsexclude] += "BB_TASKDEPDATA"
+extend_recipe_sysroot[vardepsexclude] += "BB_TASKDEPDATA SSTATETASKS"
 
 do_prepare_recipe_sysroot[deptask] = "do_populate_sysroot"
 python do_prepare_recipe_sysroot () {

