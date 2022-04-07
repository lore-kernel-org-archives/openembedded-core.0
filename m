Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 989A3C3527C
	for <webhook@archiver.kernel.org>; Thu,  7 Apr 2022 20:36:08 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web09.981.1649350425452113185
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Apr 2022 09:53:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=OmMWhe+W;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.50,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f50.google.com with SMTP id z1so8763891wrg.4
        for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Apr 2022 09:53:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QmmcrWlLOc+sVk7qtDkNaLMFHOg6bkoxmeIwz8b1M2w=;
        b=OmMWhe+Wx1Zk6EDzDXMXgOKfy/iApWkpwbRj53fn4KbOQ1W1oLXc61KBoySZJr1Fl9
         I8Xrl2af/Saeo2J/wKuvqohzAIAQAntspUiQkSZzFvfqb3F+snNEDj5Qclu62QAgjsuy
         UwV4AzzbK9QHJCJshVExvoWvoX3kEPCqL6sdQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QmmcrWlLOc+sVk7qtDkNaLMFHOg6bkoxmeIwz8b1M2w=;
        b=s32Nc+Vw2y/ohu895zPEQ+5A7zbt82Y6ZqRp+Zj/tVu1Pw8cg0pxjJ7iSVjNOyBkPs
         u+2RU1DcfRxsLzZmgcjAWgoOYo0n6MgrAcwc4q0TXC4gboE/p0dHuorMkfFSyYG1RAxL
         siab1kJnFccic5o41cauU0C2FM04+O8g66Sv9mev8lBiF5cTRS3kkY6fstX5LDbvumRv
         vAX/GTOJLBIrM2RLv6EvtNhJdrtFvIToyLT23rUche4X485riPkVKrWUtvWjKPGTOUJr
         CmIT1ixVVoKU1yWv/VWYygZWzKkMf+Z+whUFfPlxVbDitWZm7NCiYzT+irxf/HFCDGBF
         1duQ==
X-Gm-Message-State: AOAM532ID6G80y/qB3Ob+4nPimc8eCFBkvreVqNf075roTZibjqgOy2j
	U5kswodG42V+2CveFMEjQXGRBeP3znt1C3K/
X-Google-Smtp-Source: 
 ABdhPJyrSq2I61dMSynMHDe2mrmf5h8jj+YqbBCbs2PMsrr3u139j5WvXreajoJwD87bKYfEH9EYYA==
X-Received: by 2002:a5d:522e:0:b0:206:8fa:7bb with SMTP id
 i14-20020a5d522e000000b0020608fa07bbmr11718284wra.120.1649350423563;
        Thu, 07 Apr 2022 09:53:43 -0700 (PDT)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:38fd:6061:5cb9:156e])
        by smtp.gmail.com with ESMTPSA id
 61-20020adf8043000000b00205e1d92a41sm18133307wrk.74.2022.04.07.09.53.42
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Apr 2022 09:53:43 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] package_ipk/deb: Fix specific version handling
Date: Thu,  7 Apr 2022 17:53:41 +0100
Message-Id: <20220407165341.1860456-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Apr 2022 20:36:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164116

We recently added a "xxx (= 1.2.3)" style dependency to a recipe and have
been having trouble with the opkg and debian backends with it.

The issues is that for debian, "=" really does mean equals and includes the
PR field. One bitbake recipe does not know the PR of another, nor shoud it.
In other words 1.2.3 != 1.2.3-r0. Debian defaults to a PR of "0", not our
"r0".

The only way I can think of to make this work is to change "=" dependencies
without revision information (no "-r" in the version) into things like:
"xxx (>= 1.2.3), xxx (<< 1.2.3.0)". This appears to work even if it is a
pretty horrible workaround.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/package_deb.bbclass | 7 ++++++-
 meta/classes/package_ipk.bbclass | 7 ++++++-
 2 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/meta/classes/package_deb.bbclass b/meta/classes/package_deb.bbclass
index 2e75e222bcb..a9b8ba01184 100644
--- a/meta/classes/package_deb.bbclass
+++ b/meta/classes/package_deb.bbclass
@@ -182,7 +182,8 @@ def deb_write_pkg(pkg, d):
             #   '<' = less or equal
             #   '>' = greater or equal
             # adjust these to the '<<' and '>>' equivalents
-            #
+            # Also, "=" specifiers only work if they have the PR in, so 1.2.3 != 1.2.3-r0
+            # so to avoid issues, map this to ">= 1.2.3 << 1.2.3.0"
             for dep in list(var.keys()):
                 if '(' in dep or '/' in dep:
                     newdep = re.sub(r'[(:)/]', '__', dep)
@@ -197,6 +198,10 @@ def deb_write_pkg(pkg, d):
                         var[dep][i] = var[dep][i].replace("< ", "<< ")
                     elif (v or "").startswith("> "):
                         var[dep][i] = var[dep][i].replace("> ", ">> ")
+                    elif (v or "").startswith("= ") and "-r" not in v:
+                        ver = var[dep][i].replace("= ", "")
+                        var[dep][i] = var[dep][i].replace("= ", ">= ")
+                        var[dep].append("<< " + ver + ".0")
 
         rdepends = bb.utils.explode_dep_versions2(localdata.getVar("RDEPENDS") or "")
         debian_cmp_remap(rdepends)
diff --git a/meta/classes/package_ipk.bbclass b/meta/classes/package_ipk.bbclass
index f67cb0e5c90..9fe3c52fae3 100644
--- a/meta/classes/package_ipk.bbclass
+++ b/meta/classes/package_ipk.bbclass
@@ -168,13 +168,18 @@ def ipk_write_pkg(pkg, d):
             #   '<' = less or equal
             #   '>' = greater or equal
             # adjust these to the '<<' and '>>' equivalents
-            #
+            # Also, "=" specifiers only work if they have the PR in, so 1.2.3 != 1.2.3-r0
+            # so to avoid issues, map this to ">= 1.2.3 << 1.2.3.0"
             for dep in var:
                 for i, v in enumerate(var[dep]):
                     if (v or "").startswith("< "):
                         var[dep][i] = var[dep][i].replace("< ", "<< ")
                     elif (v or "").startswith("> "):
                         var[dep][i] = var[dep][i].replace("> ", ">> ")
+                    elif (v or "").startswith("= ") and "-r" not in v:
+                        ver = var[dep][i].replace("= ", "")
+                        var[dep][i] = var[dep][i].replace("= ", ">= ")
+                        var[dep].append("<< " + ver + ".0")
 
         rdepends = bb.utils.explode_dep_versions2(localdata.getVar("RDEPENDS") or "")
         debian_cmp_remap(rdepends)
-- 
2.32.0


