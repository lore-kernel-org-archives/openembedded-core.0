Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
 by mx.groups.io with SMTP id smtpd.web12.4029.1623101168855558637
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Jun 2021 14:26:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=GGpujBzf;
 spf=pass (domain: gmail.com, ip: 209.85.160.181, mailfrom: bkylerussell@gmail.com)
Received: by mail-qt1-f181.google.com with SMTP id t17so13723593qta.11
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Jun 2021 14:26:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IWSR+aNvmnKl92tKekcirE4CfVYZQMlpodM2KZj60B8=;
        b=GGpujBzf2LqYY3bKT/vZIGwnJLXbtJ5MQswyCpCXQHxbhfm8mGhtK6vPpeMDn7+uhF
         elhACMjDn+V3Jvyc8NmFgUK3QGP95XplWCPJgQbpmATXPYspWoO0YSdfy1lfpi6dq52t
         SZeNuImPE8Mr4luK1rNDhXFyvsEsr04L9HpmOGqiRFfQ6/y0Yuw8UupEliD2ITWxo5c4
         +ir+kM5ixlbp5KERZjdbCuprWqIuGoiq4q/wwwGGqYHHAE1wbCIIqqZyp47dIpf8QipI
         Y4AJ8zMQIIZqdpioDyVHVmoPgBq8gFesHhW9JjMfGd5dBRrI6d+cBxAHo2P+x3mSnJrZ
         8S2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IWSR+aNvmnKl92tKekcirE4CfVYZQMlpodM2KZj60B8=;
        b=FYAK8XF7ECSCT722Tg21vS/U4wUNwN+CyQdx2VQwt2ysow6d4w3sKvpbPXYuei/d0r
         w0JvXiEkZD29Mb0BG8vHEk+xQ/zPN6u8EpnHiO1fOepcXxQBh/jap/OQ6R8XTgI6PCXd
         AI4EjS2JkycU1UeL7EIRmghTroY52VvoZWCXzfCX3X4wxs1OFi4KTrUGSEsN22P2/OAv
         A0I49Uz6yIwemlkYOxnMQzV2GkC6iVU13C7fwMrs2FQvAfnqlNBkMGIpHmMGiYtm/+7G
         BivoDkfbFpVn1YjMu98kjsLz/OKB4HNDtL7YcWtkNdsvW2Gxx3ql4BKexnplEniWJ6mO
         3Pdg==
X-Gm-Message-State: AOAM530X4MI+8s8KRXEYbBkCBgcvMA3T+YPEuY4oO1gFRk11gKFNc4Zu
	QZS9BbUREEzVw9iTCL/xd3OboGd9YLvF/g==
X-Google-Smtp-Source: ABdhPJypAv0KM9lf//hjg12/fOfKpa61eHRypnTnDJfDiieIj0mJMEgq6m7vtwLPWLrSmBEdrSW9gw==
X-Received: by 2002:ac8:7586:: with SMTP id s6mr6164183qtq.117.1623101167790;
        Mon, 07 Jun 2021 14:26:07 -0700 (PDT)
Return-Path: <bkylerussell@gmail.com>
Received: from poirot.file.core.windows.net (cpe-74-138-104-174.kya.res.rr.com. [74.138.104.174])
        by smtp.gmail.com with ESMTPSA id x28sm9877509qtm.71.2021.06.07.14.26.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jun 2021 14:26:07 -0700 (PDT)
From: bkylerussell@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: wesley.lindauer@gmail.com,
	Kyle Russell <bkylerussell@gmail.com>
Subject: [PATCH] lib: oe: utils: always append host gcc version to NATIVELSBSTRING
Date: Mon,  7 Jun 2021 17:25:58 -0400
Message-Id: <20210607212558.86624-1-bkylerussell@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

By having multiple uninative feeds based on host gcc version (rather than a
single uninative feed for all possible host gcc versions), we avoid a general
class of problems (as first observed in the bug below) where changes in native
gcc don't cause native sstate to regenerate.  Below is another example where
this problem is encountered across multiple supported host distros for a given
poky version.

gcc 6 supports default generation of PIE, which gets enabled between Ubuntu
16.04 (default gcc 5.4) and 18.04 (default gcc 7.5), both supported distros
of warrior.  Consider a native package dependency chain as follows:

     A
   / | \
  B  C  D

If a complete set of native sstate for the above packages is built prior
to the default PIE change, but a workstation upgrades its distro to a version
that natively compiles PIE by default, the sstate hash is not currently tainted,
so the newer compiler version will pull from sstate not compiled for PIE.

For example, if a source change to C causes part of the above chain to rebuild
(C -> A), then this may result in non-PIE sstate (B and D) giving link errors
with A.

ld: relocation R_X86_64_32 against `.rodata.str1.8' can not be used when making a PIE object; recompile with -fPIC
ld: final link failed: Nonrepresentable section on output

This appears to have been considered previously as an option to address
the following bug, but appears to have been set aside only because of
proximity to the end of a release cycle.

[YOCTO #10441]

Signed-off-by: Kyle Russell <bkylerussell@gmail.com>
---
 meta/lib/oe/utils.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/utils.py b/meta/lib/oe/utils.py
index a84039f585..8afe19fd99 100644
--- a/meta/lib/oe/utils.py
+++ b/meta/lib/oe/utils.py
@@ -426,7 +426,7 @@ def host_gcc_version(d, taskcontextonly=False):
         bb.fatal("Can't get compiler version from %s --version output" % compiler)
 
     version = match.group(1)
-    return "-%s" % version if version in ("4.8", "4.9") else ""
+    return "-%s" % version
 
 
 def get_multilib_datastore(variant, d):
-- 
2.25.1

