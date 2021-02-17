Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
 by mx.groups.io with SMTP id smtpd.web10.3207.1613534459402257135
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Feb 2021 20:00:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=EUoz0Io5;
 spf=pass (domain: gmail.com, ip: 209.85.167.47, mailfrom: idadelm@gmail.com)
Received: by mail-lf1-f47.google.com with SMTP id z11so19337704lfb.9
        for <openembedded-core@lists.openembedded.org>; Tue, 16 Feb 2021 20:00:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=7M4TrJJkNvv1NctnIn0bBBIlz1raCUWiSMDuQW5dBM8=;
        b=EUoz0Io5hRMuyLMsTBtn31ka30u4Bd9HR3dzvKy/laxQwsCMcwLfXETljc5eg5Aoae
         8K5GOcbW3rkAeKuo0//lA0icloTTRHh9xFk6eXrMQ1c0Qm3BN+3BfEgHghqiX4uaSUnR
         3YPKSQpI+BwNQO9/eOsTz8PjoYDjmD8qMGRWfAvylxFVLSlIxsPYURRkK8O+p/AFWd1m
         D3HWxQEDSCTDOjqw2uqPVPwD7x6SqLyMnPQZVn9vbIBuij3z8b2s8E6dINyN+aDMx57Q
         DbsI8e+St6X4LFPzjqlXbjMGbuoms8d88TR1UawLikVN6XUa2bb+OTfvCT5gcIdkt9am
         LKzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7M4TrJJkNvv1NctnIn0bBBIlz1raCUWiSMDuQW5dBM8=;
        b=XOq6gh6vs5hbmI/Pkcx7BHi1opVqSpJnnntyuoZ+U4ahPL7mUsipEAm5wOdUShOuE0
         RlYjp9cROkn1jA0mDUPp2XGgfydChKL0pEPzA6jORCZMugHR3MAH6Jdf0EkY3khutHzq
         xSxbxnqyBInWCJaX8yuOkdhIqx1ecFLy5yLJXmBxgJBM1jItf0GM8XOcwRtCxN9flK9F
         +rF+lQwh7SYPGunefvw7FmwnCmE/ipSSjm7Sy+hFX6x6LtY66rvW1K4533pG1qVixOwt
         TydymPovCKKw0fVUqKyDgGV4iooAZnkOHZ3M1iZPyJrNQ+H/1rBWeODpPJKoj4kX6R9y
         stXw==
X-Gm-Message-State: AOAM533T/7zSXTWY3UdJueA4unwrGCPfnY6YOaHVUj8D9Qn6E12dR+GJ
	h91qAArJKyQtCBjejIIotijLwPQL6nQN/A==
X-Google-Smtp-Source: ABdhPJxvXZ2nbua/j4xTRf2ySzmMfOqP6UV6ds0uqMEQCPvJEHGhVCkqvM0cZo1oC1D9BzIPbSMxSA==
X-Received: by 2002:ac2:5a42:: with SMTP id r2mr13314178lfn.79.1613534457459;
        Tue, 16 Feb 2021 20:00:57 -0800 (PST)
Return-Path: <idadelm@gmail.com>
Received: from localhost.localdomain ([129.0.101.17])
        by smtp.gmail.com with ESMTPSA id 5sm101464lff.176.2021.02.16.20.00.56
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Feb 2021 20:00:57 -0800 (PST)
From: "Meh Mbeh Ida Delphine" <idadelm@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [poky-contrib][RFC PATCH 2/5] package: Remove false positive lic warnings
Date: Wed, 17 Feb 2021 05:00:30 +0100
Message-Id: <20210217040033.21541-3-idadelm@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210217040033.21541-1-idadelm@gmail.com>
References: <20210217040033.21541-1-idadelm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

With the IGNOREWITHLINUXSYSCALLNOTE variable set to "1" in local.conf, it removes the "WITH Linux syscall note" string attached to the license value for sources before comparism.
This is to get more recipe LICENSES to match with those of the sources and reduce the number of warnings outputed.

Signed-off-by: Ida Delphine <idadelm@gmail.com>
---
 meta/classes/package.bbclass | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index c3259146b6..14c8475cfa 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -1774,6 +1774,10 @@ fi
                     if l.endswith('-or-later'):
                         lic_ = l.replace('-or-later', '+')
                         computedpkglicsperpkg.add(lic_)
+                    elif l.endswith(' WITH Linux-syscall-note'):
+                        if d.getVar("IGNOREWITHLINUXSYSCALLNOTE") == "1":
+                            lic_ = l.replace(' WITH Linux-syscall-note', '')
+                            computedpkglicsperpkg.add(lic_)
                     else:
                         computedpkglicsperpkg.add(l)
             if spdx_lic - computedpkglicsperpkg:
-- 
2.25.1

