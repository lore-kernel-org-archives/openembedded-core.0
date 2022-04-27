Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA558C433EF
	for <webhook@archiver.kernel.org>; Wed, 27 Apr 2022 15:24:01 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web11.9665.1651073037555835428
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Apr 2022 08:23:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Y74aM0XB;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.50,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f50.google.com with SMTP id k2so3003791wrd.5
        for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Apr 2022 08:23:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ViZmU1g5ET02x/1Y4htjreFTHmluw1d432af/fslGLA=;
        b=Y74aM0XBIPAXgxJKAGGh9YFd9BcGctiuNQAa1AP2WkMQNU1sS/KyXpvfr6BfiZ10+q
         OROemJpkhHQEQ75s2T0UfDB3HrZPcCdjhN/4EknZUGEhOSAYqX29cHe2HinQkx3/X28X
         +mLt0R1Fh2bJsvhCaK6PzMcFVTd2V7ppdLLJ4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ViZmU1g5ET02x/1Y4htjreFTHmluw1d432af/fslGLA=;
        b=ifNxbv3uT5v2vwnc6IFA//tcV9y4UdMPyeUsZtwQ+EDVyoE6p3GBVnT18U5BT7kOni
         aXmU+X5A6jEHVRllFrmgCa61F1CcifNrIBSN2hPYdGIqi3SaT/3Ndv8z3QhLkuG+ctkf
         gbyELSNnzXngwQc2lEJgZKMI+BmuYAGkfU1u1BMj9sI12r2GrOPlI6GxY38ErdHgBKYz
         Zb0Q14jGc47RojZDFsHnwbDUZMSylkuaaHjbhKmhUFeaUc90yWKncXdpesLATAEFAFoj
         xd/ykExut1Jw2eQNOQSCGtmyLAxSr8YzNqTU1RSU+qGlFMA5WPvesSjH2bcPI5FGmlwK
         1m/Q==
X-Gm-Message-State: AOAM532jm/RiYMoNf74tEHj7zUv6rwbJLKMT81s/6RY53r31VzEtKrZ0
	RyfBWuLCiEGtoqzSUs7sQlbpCRjNFh0bUg==
X-Google-Smtp-Source: 
 ABdhPJwIgxYH0RCWo8Sy7KMLC/P1Viu17HDEcck3DUS3Q2cqws50GyHbJmXJiaW/3kikvGkljp7tpg==
X-Received: by 2002:a05:6000:1a87:b0:20a:7ea5:2aef with SMTP id
 f7-20020a0560001a8700b0020a7ea52aefmr22493439wry.666.1651073035621;
        Wed, 27 Apr 2022 08:23:55 -0700 (PDT)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:aee4:ace8:5bdc:9ee3])
        by smtp.gmail.com with ESMTPSA id
 b14-20020a7bc24e000000b003899c8053e1sm1980976wmj.41.2022.04.27.08.23.54
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Apr 2022 08:23:55 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] staging: Ensure we filter out ourselves
Date: Wed, 27 Apr 2022 16:23:54 +0100
Message-Id: <20220427152354.2824313-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Apr 2022 15:24:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164927

Adding a dependency on ourselves in this function doesn't make sense, the hash
may change after hash equivalence is applied. Other code using BB_TASKDEPDATA does
handle the self reference correctly (which is there for a reason), update this
code to do likewise.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/staging.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/staging.bbclass b/meta/classes/staging.bbclass
index ab827766bef..9fc8f4f2839 100644
--- a/meta/classes/staging.bbclass
+++ b/meta/classes/staging.bbclass
@@ -651,7 +651,7 @@ python target_add_sysroot_deps () {
     taskdepdata = d.getVar("BB_TASKDEPDATA", False)
     deps = {}
     for dep in taskdepdata.values():
-        if dep[1] == "do_populate_sysroot" and not dep[0].endswith(("-native", "-initial")) and "-cross-" not in dep[0]:
+        if dep[1] == "do_populate_sysroot" and not dep[0].endswith(("-native", "-initial")) and "-cross-" not in dep[0] and dep[0] != pn:
             deps[dep[0]] = dep[6]
 
     d.setVar("HASHEQUIV_EXTRA_SIGDATA", "\n".join("%s: %s" % (k, deps[k]) for k in sorted(deps.keys())))
-- 
2.32.0


