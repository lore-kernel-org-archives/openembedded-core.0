Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.web10.9447.1590077761024797863
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 May 2020 09:16:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=lCP072HF;
 spf=pass (domain: gmail.com, ip: 209.85.215.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f181.google.com with SMTP id f21so392139pgg.12
        for <openembedded-core@lists.openembedded.org>; Thu, 21 May 2020 09:16:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=bJM1rls6Hqf0tzQuhZ/9MiMur2Ry/SncNcW21YXgBiM=;
        b=lCP072HFRM2uDXmsph9oI9AGJgMyf6ryZVHS0bFd+MWJnjfQYNsXtLOWiNZToYTqUK
         098FcFvOX36kN8qHcdyZP8clUasQLzu0fOuKk4snYdypA7W++mwimhO1DLyeBSfn7nG3
         8an2GobB0IvAF5Fugl0NnE/romc57tZMOUePYedlYDBzYS3AtmTia8ktU48ZjD6g7CqK
         5TW14iS1WsbL6IwRPndkPHcmWwchLq/N9//ipUAKsf1A2JmeRm/FrdcAPHISG0XaiCLc
         Qbw5ab+VDRy7yYvF8gc+YZE8y5oHMJeyW6cfGdX5xeBu/VG2AdZvUIYlyOnpFeM24wp5
         dWcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bJM1rls6Hqf0tzQuhZ/9MiMur2Ry/SncNcW21YXgBiM=;
        b=mVOnrQem1el/aqBXdF2/Ywieu7Aoc2QtfMLU4hBTTiHcGKLnbfONAUkLpdHG59YQ6H
         4Si6Dut6smajaAS0x70Ivs/EStk/1RecnUxmsYW+GnHGBI71JT6byg1uwQDLPsSLcQF+
         U0+uEwqN8bpNgaCuN34st31qGIu9aTyQB0TUZt4gvHlHonbGRJ60tesgtxWh8Z6exMRr
         ndNKESVW+nzc3uDXvPNLaIj53/XSQGJh64HpgqTJPOX7C1t5TmiN5tudt/smxIb0SzRv
         +wpK4qQXI6bKPTSHbq1XyDvyRsKZztPNB8YDaRddL2/jZKs6Zr1Yuuc94t/RWKfTBmnz
         dUwQ==
X-Gm-Message-State: AOAM532nLnNECbvd3w7L6FMuWiriM+HyRGPCmj7dP1oIC0ei3NSMMWxO
	DhGDLrXra023zJU1ABvU2+CTqf2wnCI=
X-Google-Smtp-Source: ABdhPJw6LoR1hlHvBQMORKAqnK3dLSQ7gRLqEPx9lEwxfLkvRFLd4AqqHVh/TZ6ie48WlV5Rs+mnpw==
X-Received: by 2002:a63:4911:: with SMTP id w17mr9402092pga.13.1590077760250;
        Thu, 21 May 2020 09:16:00 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::e62a])
        by smtp.gmail.com with ESMTPSA id r24sm3636427pgm.25.2020.05.21.09.15.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2020 09:15:59 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [dunfell][ 10/10] cve-check: Run it after do_fetch
Date: Thu, 21 May 2020 09:15:43 -0700
Message-Id: <20200521161543.3273063-10-raj.khem@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200521161543.3273063-1-raj.khem@gmail.com>
References: <20200521161543.3273063-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Certain recipes e.g. bash readline ( from meta-gplv2 ) download patches instead of having them in
metadata, this could fail cve_check

ERROR: readline-5.2-r9 do_cve_check: File Not found: qemuarm/build/../downloads/readline52-001

This patch ensures that download is done before running CVE scan, even
though these will be external patches and may not contain CVE tags as it
expects, but it will fix the run failures as seen above

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes/cve-check.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
index 2a530a0489..556ac6e67f 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -65,7 +65,7 @@ python do_cve_check () {
 
 }
 
-addtask cve_check before do_build
+addtask cve_check before do_build after do_fetch
 do_cve_check[depends] = "cve-update-db-native:do_populate_cve_db"
 do_cve_check[nostamp] = "1"
 
-- 
2.26.2

