Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web08.2842.1615770209328393994
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Mar 2021 18:03:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Tc0W7I/y;
 spf=pass (domain: gmail.com, ip: 209.85.216.47, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f47.google.com with SMTP id a22-20020a17090aa516b02900c1215e9b33so13446482pjq.5
        for <openembedded-core@lists.openembedded.org>; Sun, 14 Mar 2021 18:03:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OMXKHbkZFOqiAVS436E0+JlI3l2lHQ8+gybL65g/ek4=;
        b=Tc0W7I/yz8g6nri3YFM/E65YoEB5Dkz0/jWZ9ZVB4bQTkAZIZVL1tGkHZmIa6LJh2H
         835/GjHrog1kuj5l5CyZE2QAxw0BGiGavf/AtMGqmhs1BCzt0PMKMvFzLWnWymYwxyKi
         2NYEUkjtrdFiEYutltC4SJAAQpDY1w8VZ50xTrEXX/u24qPu+pK5bRuh2bIOuP8ivewD
         hAB4Qev1ENqh4tUM2SZz8sYos//cTCmAonXfzC5cUs/5Ou7nb987cm+cGnFVzPwufMZO
         jMqmaTSrLEvOrxb2MmcfkvgOlBAz8dEj5sf0zZO/BgoL/sxDmYB2fRunY3/qxu1OCf0d
         MBhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OMXKHbkZFOqiAVS436E0+JlI3l2lHQ8+gybL65g/ek4=;
        b=UjL/xeUCyWZV+2IeFf1KFvDJOenbjuS2WS7sybVpMOpfPALsTyz7F3PNr/VIjETdgT
         eINMMFP6yCg/lvHuEoUVbtHQ3rKBrx8t10h2tNEU8pJCrS8dC8RwqCmMRxnfZWRR1JWA
         aCE6KrjaTa+4pxaat8vIQVVeWYhxjHKEzF8+5XZ1c+ditdo7NP7TSlhbPVQHkc3WSgV1
         Da/8eu47r8IjXM/XRUnG7MPfnnc8393OuPstPwTbH059WJZnBL6un/hLO3k1131/9gNM
         3Cb3vhgVUCSGCKjdacZYs/KOWwfP11kC244+FIFcuk9UzWDYchmn9kEzFDjF5yQDWriG
         Wexw==
X-Gm-Message-State: AOAM531+qY5cDQ9CCX4VzO4nzUJvW+2T9pI634FTLeWHp5QTo8bvAZkW
	V18CwjxMboTJI3z70IgdVcG8YRjiiNe2ng==
X-Google-Smtp-Source: ABdhPJxqzfJIjXYAEUKFs8fo9GIKD4T1xkMi2nEELiKIbn4+Sc5Ll2G7Vwc0A72FT3lgvLPAlejgNA==
X-Received: by 2002:a17:902:d2c7:b029:e6:34e2:7a83 with SMTP id n7-20020a170902d2c7b02900e634e27a83mr8948554plc.60.1615770208052;
        Sun, 14 Mar 2021 18:03:28 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::c2dd])
        by smtp.gmail.com with ESMTPSA id g26sm11411817pge.67.2021.03.14.18.03.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Mar 2021 18:03:27 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Changqing Li <changqing.li@windriver.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] report-error.bbclass: replace angle brackets with &lt; and &gt;
Date: Sun, 14 Mar 2021 18:03:25 -0700
Message-Id: <20210315010325.3303436-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Changqing Li <changqing.li@windriver.com>

when we have below content in local.conf or auto.conf:
BUILDHISTORY_COMMIT_AUTHOR ?= "Khem Raj <raj.khem@gmail.com>"
send-error-report will fail with "HTTP Error 500: OK"

error-report-web do rudimentary check on all fields that are
passed to the graphs page to avoid any XSS happening, if contains
'<', the server will return error(Invalid characters in json).
fixed by use escape of <> to replace it.

NOTE: with this change, error-report-web need to add filter 'safe'
for the string wanted to display to avoid further HTML escaping
prior to output. Below is how the content displayed on webpage:
with the filter 'safe':
BUILDHISTORY_COMMIT_AUTHOR ?= "Khem Raj <raj.khem@gmail.com>"
without the filter 'safe':
BUILDHISTORY_COMMIT_AUTHOR ?= "Khem Raj &lt;raj.khem@gmail.com&gt;"

Another patch for error-report-web will send to yocto mail list.

[YOCTO #13252]

Signed-off-by: Changqing Li <changqing.li@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes/report-error.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/report-error.bbclass b/meta/classes/report-error.bbclass
index 9cb6b0bd31..8dac854944 100644
--- a/meta/classes/report-error.bbclass
+++ b/meta/classes/report-error.bbclass
@@ -38,6 +38,7 @@ def get_conf_data(e, filename):
                     continue
                 else:
                     jsonstring=jsonstring + line
+    jsonstring = jsonstring.replace("<", "&lt;").replace(">", "&gt;")
     return jsonstring
 
 python errorreport_handler () {
-- 
2.30.2

