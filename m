Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web12.21407.1630932658439087357
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Sep 2021 05:50:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Y4hshGQj;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f50.google.com with SMTP id m9so9738249wrb.1
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Sep 2021 05:50:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=iCX3IxSwkxcG3jJITywp1XxLcAta/xKxUmh7DgqGFMc=;
        b=Y4hshGQjyajaE6i4xlCOhbEkwpdS8qKnbir/w1ifCQJgFTpRcAQbIh59qcT1IK6jS4
         G+b8ijJwKLMyHjJXayCV/3rsUObY2Ar+i72HpaPZD/VSxOmUn5+3hV/tkvYEjwJ6Zdro
         +6Tqd7rkm1ng6TUB+/N6JgLLQ6O5Z0+200DHQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=iCX3IxSwkxcG3jJITywp1XxLcAta/xKxUmh7DgqGFMc=;
        b=E5X4A4e8SqxIcyqjEAtT8AxfDRXzWcJy+8kLhj9jg3hKc2neV0tWzZdRUizmDqbfRg
         NFl06PoyyzxwTOE3lslmG7j3k0rvmca1/5z8sJ7ZMeacyG04i/UwPmMUJ1t2yiN7WdJV
         X4FMQC7LjqL6SDswWFP3djIA+gPmYnMwNYWRVVwhtftflCfcuSPA1mmAvIRdvBmyXTir
         5CyodnEDv5u/a1iv41FEmZRqH6mwkJzJOT6E8ZIw5suECcDWZnOKyPMFiIjAq1E/MvZu
         Y9qxddF5Q3Y/CXrMvPvPfpf5M2rtOCr+ccNBbwhXF/5vIK0PjwgOvo8bICjRydkzVydF
         WKNw==
X-Gm-Message-State: AOAM530IKbx3E/T8q2GTY/MkUDa/K/ZD0l+e7kFf01v0TsrisOuHDYDf
	uqSOchBQJn4gUg25Mzd2KrYP9S1CL5w1pw==
X-Google-Smtp-Source: ABdhPJzNuwJfLCK7aVHJNRa+D6i7tgNPhZEacb1F5kfOZWk/HoD+i725pByxs+EUQ0NSfrNpDuu+Nw==
X-Received: by 2002:a5d:5712:: with SMTP id a18mr13058252wrv.367.1630932656654;
        Mon, 06 Sep 2021 05:50:56 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:612e:ab48:3553:3f2])
        by smtp.gmail.com with ESMTPSA id o26sm7174402wmc.17.2021.09.06.05.50.56
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Sep 2021 05:50:56 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] flex: Add CVE-2019-6293 to exclusions for checks
Date: Mon,  6 Sep 2021 13:50:55 +0100
Message-Id: <20210906125055.1082043-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

CVE is effectively disputed - yes there is stack exhaustion but no bug and it
is building the parser, not running it, effectively similar to a compiler ICE.
Upstream no plans to address and there is no security issue.

https://github.com/westes/flex/issues/414

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/flex/flex_2.6.4.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-devtools/flex/flex_2.6.4.bb b/meta/recipes-devtools/flex/flex_2.6.4.bb
index 56f5b742e29..6a47ef1bd86 100644
--- a/meta/recipes-devtools/flex/flex_2.6.4.bb
+++ b/meta/recipes-devtools/flex/flex_2.6.4.bb
@@ -28,6 +28,11 @@ SRC_URI[sha256sum] = "e87aae032bf07c26f85ac0ed3250998c37621d95f8bd748b31f15b33c4
 UPSTREAM_CHECK_URI = "https://github.com/westes/flex/releases"
 UPSTREAM_CHECK_REGEX = "flex-(?P<pver>\d+(\.\d+)+)\.tar"
 
+# Disputed - yes there is stack exhaustion but no bug and it is building the
+# parser, not running it, effectively similar to a compiler ICE. Upstream no plans to address
+# https://github.com/westes/flex/issues/414
+CVE_CHECK_WHITELIST += "CVE-2019-6293"
+
 inherit autotools gettext texinfo ptest
 
 M4 = "${bindir}/m4"
-- 
2.32.0

