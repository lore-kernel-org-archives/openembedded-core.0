Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8110C982EE
	for <webhook@archiver.kernel.org>; Mon, 21 Sep 2026 14:58:50 +0000 (UTC)
Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.50862.1790002721330372345
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Sep 2026 07:58:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=g5BtSWfJ;
 spf=pass (domain: linuxfoundation.org, ip: 74.125.225.99, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-4885d4825adso420363f8f.0
        for <openembedded-core@lists.openembedded.org>; Mon, 21 Sep 2026 07:58:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1790002719; x=1790607519; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=cAOKVlm3LrYMxEdejHpuAq3972MmvTj1U26nqyXaTMQ=;
        b=g5BtSWfJGp2hBJLw+atETIfS7CfMOZJXaagHSi7gYYdnnm7GNUbVCsJV8/dUHjXeSP
         venL0gFXym1J+t8ekQOdZF7X0eaRLR5YBymAsCVTAr4aXOpHrKyphvCGf8WbYGrnyZ8M
         4izP+PT7b0gxvibNzYipOZWxMtzpk8aBCCKdw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790002719; x=1790607519;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=cAOKVlm3LrYMxEdejHpuAq3972MmvTj1U26nqyXaTMQ=;
        b=aZvhcuSrf8C9vm5HtUzhkSApOWPsOk4I1mcyExvYI+FQAyh8/0XqAbQnSZexH7QrtY
         a7NUKMs7O0Uhpy3hh5C0iesFH4+oK+Z/NsNoUz/D33PQHSdzlrymnW//lUD/m2bccyiQ
         9Fn2Wd4BeQx4F5nvTxRJB164AGrZMU8ecY+v61mJ8yuddbq4YM7g/PlVgTUcxXUCRzUE
         9cMYLk2KOvXbFS2vlbwSscYiCs5nRPmQWTL9aQc6hrlJZbSlvyG1wrcgKiM362QKwQb7
         vAgHa1gy2LNSe2PWfETqhj61pUJgynfrHl0Mg6kQdizy7+6kAIcF9OiJW4uMcAUyRsn1
         nPSg==
X-Gm-Message-State: AFuF++ldZaqwE2jBJFRP4rOeUDgQDOEm/j8xi4LgiV8Y2XEn3caLVFa9
	VzGtbwqJc4yCq+BvTXMCi2J45d/xyF0QL/klGrtWj3Ythy2x7ehFtahCtynpFZw2Or0ME9yiVxp
	PzI17yeM=
X-Gm-Gg: AYBFou3PQjsbFbX/wSv124n6NTr2Wweck8kJjsLYqcku4cO0OFhOf7W7dEG6JP5taIl
	ACjcLyqu6HywssEvlZHY5Orv0fYG13SHxwgHrBsD22S5NClfPgqZ/j2zVTxfba62eFUssy/Sypt
	TPEmyeWjWOGPIr7qu8FdXpzBtodEGAutNcnqv2kd3Mq08faAcWKzyNINNEBbPl1TPj2bEmfepi1
	53MSQpbxyzV8r+RtPwkG4vx59HVcGAYgahy8n6LnkDsbmeUoTxQ6AErtf4G+7x8EUwWExrZmMPF
	so0beGCLJyGI/DCZrZysy6Rq+ZkF5ljBzCn70hd052SA8JJASoKG+I3hqOL8j49VNAWecohjuig
	3tVbg6rE2HDt4mb6KuXEyNgOlaaTfgCVr2fjraFDX5Tnb2rjBAAdK1Z5fSsR5rFnVJRTB63E149
	MbjSmnZC3aW8IoAczijWkORazl3wxnlp1HMIwPIq2RQusFoo6UNAHzQTSemFJdu0Oql01Zw9DHQ
	QkFu1jUOq7XQPmJaz1w42B+Lp+/F/4nxKeyN3w=
X-Received: by 2002:a05:6000:4a18:b0:487:40d:af3a with SMTP id ffacd0b85a97d-4871e213673mr13878707f8f.2.1790002719539;
        Mon, 21 Sep 2026 07:58:39 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:a46d:d671:f81e:e5f1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48724596604sm23856287f8f.30.2026.09.21.07.58.38
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 07:58:38 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/5] python3-pyparsing: upgrade 3.3.2 -> 3.3.3
Date: Mon, 21 Sep 2026 15:58:33 +0100
Message-ID: <20260921145835.1106731-3-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260921145835.1106731-1-richard.purdie@linuxfoundation.org>
References: <20260921145835.1106731-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Sep 2026 14:58:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246336

Version 3.3.3 - September, 2026
-------------------------------
- Added support for Python 3.15.

- Fixed CI unit test jobs selecting a tox environment with no test commands.
  The matrix and fallback now select `py-unit`, as diagnosed and proposed by
  glaziermag in issue #662; submitted by Neal Lin et AI.

- Refactored recursive implementations in pyparsing, for improved performance and
  reduced memory usage.

  - repetition using a large upper bound with multiplication or slicing notation
    has replaced a recursive `Optional` expression with a modified `ZeroOrMore`
    expression, using a new `max` argument. PR #652, submitted by sudo.

  - `nested_expr` now uses an internal class that maintains its own stack for
    managing nesting levels.

  - `infix_notation` replaced its recursive implementation with a shunting-yard
    algorithm.

  These changes should not cause any regressions in existing code, and tests
  show significant performance improvements for some of the more complex examples.
  Railroad diagrams may render differently, since they now no longer rely on
  recursion using `Forward` expressions.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../{python3-pyparsing_3.3.2.bb => python3-pyparsing_3.3.3.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pyparsing_3.3.2.bb => python3-pyparsing_3.3.3.bb} (90%)

diff --git a/meta/recipes-devtools/python/python3-pyparsing_3.3.2.bb b/meta/recipes-devtools/python/python3-pyparsing_3.3.3.bb
similarity index 90%
rename from meta/recipes-devtools/python/python3-pyparsing_3.3.2.bb
rename to meta/recipes-devtools/python/python3-pyparsing_3.3.3.bb
index 2565751f287..fbb0d642936 100644
--- a/meta/recipes-devtools/python/python3-pyparsing_3.3.2.bb
+++ b/meta/recipes-devtools/python/python3-pyparsing_3.3.3.bb
@@ -10,7 +10,7 @@ BUGTRACKER = "https://github.com/pyparsing/pyparsing/issues"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=9c8a9625037eff2407f8456010875183"
 
-SRC_URI[sha256sum] = "c777f4d763f140633dcb6d8a3eda953bf7a214dc4eff598413c070bcdc117cbc"
+SRC_URI[sha256sum] = "928ae7e20211f3b6f3915a72f06a0cfd29ab9d24279dd6346b6b1a7146397d36"
 
 inherit pypi python_flit_core
 

