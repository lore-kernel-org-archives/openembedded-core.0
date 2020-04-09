Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web10.6419.1586429402147485010
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Apr 2020 03:50:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=QUsbAY6p;
 spf=pass (domain: gmail.com, ip: 209.85.221.53, mailfrom: ricardo.ribalda@gmail.com)
Received: by mail-wr1-f53.google.com with SMTP id a25so11406975wrd.0
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Apr 2020 03:50:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=RjJdfavSnl7lsG65MgN4cQpt9UjuoEiZZOaxEDSQBuQ=;
        b=QUsbAY6pZXZQqmcIXenIddHoR97oCJggtpDBw3kTeyrBOwIBgkSq+YFca6I1Q1yu5e
         1Hqk6hiMSYa+vtltsnfbHbQYH+v+667xNg1QPNihaWd2jSEWo4kUpugSsDgnq6Dl9PKz
         wqYg9T1JHakrhBU6/rk8uZHspfqelqVL3tuahczpiu2cjksXLK/idFadU/9OEjuJudTK
         rm7XEHNHCwu3s0IfjmXnbkVeLwGy9ZcGPeIVqpTBAP0j9WXJvaRCtJHepyAMDhCZR+pr
         RH+g/7jQmDwatOPb1Ho+bG9s2zPpdL+gyKSl7/ilU3dkOXPazA1dY2LwQ/NmBlu6uJZ+
         AOWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=RjJdfavSnl7lsG65MgN4cQpt9UjuoEiZZOaxEDSQBuQ=;
        b=MRXTwIq1Q8txDcCd7cVkAP2XrcGPqbLVvHgGxzF+YPa7E2bFiyNXG6rkVQvAdsBkYO
         sbdK1aNXR7td8/wS/jjXpkxUem6oTy0uNrME6ALVq2Ocj7rD9wLVGWyH6DP+lAQCNCeP
         oZvi9zFYaGnZSdryRgOteogwQ9I/tHY5h4POS2Cx2AoDMajCCYPMObMw3IE0eGuf+sSx
         yoxdTh+JQIb/R3bCk5r+MHvvPedTWDDdGigFqUJWrUiI3jdMx+ae4Elg0ut4iyFT7Tz1
         EsZnm5BW1P58IjzSYV93JmYkUtHKowVoYMu0iP6HV4YyaePnzEeInZtGO6/Soa9s35ff
         98Bg==
X-Gm-Message-State: AGi0PuaDRxJIOMGB71fHHEEfvvOlu1jDG13mz2DUgwo6IT3w2bRuf6ro
	QynDNHpsaWTO93fH02Wvhk4xBi5YuOk=
X-Google-Smtp-Source: APiQypKzWM7n46+ne5LM7RYXkMczNBltRvhjqQOFRcWzCmEm8SE+0vba7uS2MDcAE9vbm1/W7FqPfw==
X-Received: by 2002:a5d:69ca:: with SMTP id s10mr13610548wrw.260.1586429400376;
        Thu, 09 Apr 2020 03:50:00 -0700 (PDT)
Return-Path: <ricardo.ribalda@gmail.com>
Received: from piling.lan (80-71-134-83.u.parknet.dk. [80.71.134.83])
        by smtp.gmail.com with ESMTPSA id l5sm4985737wrm.66.2020.04.09.03.49.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2020 03:49:59 -0700 (PDT)
Sender: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
From: "Ricardo Ribalda" <ricardo.ribalda@gmail.com>
To: openembedded-core <openembedded-core@lists.openembedded.org>,
	Paul Barker <pbarker@konsulko.com>
Cc: Ricardo Ribalda Delgado <ricardo@ribalda.com>
Subject: [PATCH v4 4/4] wic: Continue if excluded_path does not exist
Date: Thu,  9 Apr 2020 12:49:51 +0200
Message-Id: <20200409104951.948242-5-ricardo@ribalda.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200409104951.948242-1-ricardo@ribalda.com>
References: <20200409104951.948242-1-ricardo@ribalda.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If an excuded path does not exist, continue without an error.
This allows to seamleasly reuse .wks among different projects.

Eg:

part / --source rootfs --fstype=ext4 --exclude-path=/opt/private_keys

Where /opt/private_keys in only populated by some of the image.bb files.

Signed-off-by: Ricardo Ribalda Delgado <ricardo@ribalda.com>
---
 scripts/lib/wic/plugins/source/rootfs.py | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/scripts/lib/wic/plugins/source/rootfs.py b/scripts/lib/wic/plugins/source/rootfs.py
index d3742802bb..8874ac62c4 100644
--- a/scripts/lib/wic/plugins/source/rootfs.py
+++ b/scripts/lib/wic/plugins/source/rootfs.py
@@ -131,6 +131,9 @@ class RootfsPlugin(SourcePlugin):
                     sys.exit(1)
 
                 full_path = os.path.realpath(os.path.join(new_rootfs, path))
+                
+                if not os.path.lexists(full_path):
+                    continue
 
                 # Disallow climbing outside of parent directory using '..',
                 # because doing so could be quite disastrous (we will delete the
-- 
2.25.1

