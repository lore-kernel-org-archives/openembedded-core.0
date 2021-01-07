Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web12.1441.1610056909113043895
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Jan 2021 14:01:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Z7Cy2wxg;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f43.google.com with SMTP id y23so6800406wmi.1
        for <openembedded-core@lists.openembedded.org>; Thu, 07 Jan 2021 14:01:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=U7+p5L/taeJU1qvgD89OUBGeqlSAc4z8DPGIEU+gQpw=;
        b=Z7Cy2wxggHbX4MYVshBzw5pwbvbtyVE/epycEftAnb88a+0WOWhbwN4I3G4Fs9rIzz
         yZ0CAwyZ7oqT3WmIOYp3pmzPPbcRFIz9jaYBmQqhJ+GYY/5CKdn0VTBXSB2VXre2BZ0F
         6aw3k8vJC4833K33LKIOnnus3iLgPIQUBnLkg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=U7+p5L/taeJU1qvgD89OUBGeqlSAc4z8DPGIEU+gQpw=;
        b=o//N2G1odw/vOo/LyXFwAxpyO+TOaQhqDKpJPC0LkB548CFUip+t/DacM62u4BpLAx
         KuM/fFanDhT3iR1enf03mD3qVrmmM1EsZSNxTQYEwF1RTFjrQLhB42iDF6lwDmlccYyt
         ge6F8PObLLBRkk77bG8udnMhats0EQ5SsSmG5Fiien19/EksVZ62qD725bMvMX0ogiUW
         gPWgRFB74675X1g165d+kxbEZQ1q/giYq2hP8u1o3ueeD/0g8W6lNb6tsMBYB9i+IFZJ
         11uskevHIYM2WI/Wd1ADJEsT5XiUIr5Q7r1atUFbH9SscXUgUXonc0K15lRkPT1xmrCU
         gKqQ==
X-Gm-Message-State: AOAM533KjXF9oHKVoiUiAGwG5b/+OROgm0B2T8fi5la9aKyZNj+upuL1
	eQlmMymkH8BLgQ7UEFhHe+7+3yBg07wbpQ==
X-Google-Smtp-Source: ABdhPJx68AjxDIIMRCWvDdfZR/dYetHoH/v/7+E88jAYUQ4d6cZzp6UuwZkld4oRoFl4bU/9FOUOaQ==
X-Received: by 2002:a1c:3d55:: with SMTP id k82mr446889wma.57.1610056907413;
        Thu, 07 Jan 2021 14:01:47 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:8262:2156:a38b:824c])
        by smtp.gmail.com with ESMTPSA id j59sm10962686wrj.13.2021.01.07.14.01.46
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Jan 2021 14:01:47 -0800 (PST)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/3] bash: Set HEREDOC_PIPESIZE deterministically
Date: Thu,  7 Jan 2021 22:01:44 +0000
Message-Id: <20210107220146.594812-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We had reproducibility issues where the pipe size appears to vary on some build
hosts between 65535 and 4096. It should be the former on Linux in general so
standarise on that. Easiest way is to pass in CFLAGS.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-extended/bash/bash.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-extended/bash/bash.inc b/meta/recipes-extended/bash/bash.inc
index feb7483dc34..b0281dadbc2 100644
--- a/meta/recipes-extended/bash/bash.inc
+++ b/meta/recipes-extended/bash/bash.inc
@@ -15,6 +15,9 @@ INHIBIT_PRUNE_M4 = "1"
 # This is what other major distros do. And this is what we wanted. See bug#5359 and bug#7137.
 CFLAGS += "-DNON_INTERACTIVE_LOGIN_SHELLS"
 
+# This can vary depending upon the host
+CFLAGS += "-DHEREDOC_PIPESIZE=65536"
+
 ALTERNATIVE_${PN} = "bash sh"
 ALTERNATIVE_LINK_NAME[bash] = "${base_bindir}/bash"
 ALTERNATIVE_TARGET[bash] = "${base_bindir}/bash"
-- 
2.27.0

