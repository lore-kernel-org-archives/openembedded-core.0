Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web12.11907.1586447582345123248
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Apr 2020 08:53:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=dGhXwaid;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: ricardo.ribalda@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id x25so279884wmc.0
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Apr 2020 08:53:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=RjJdfavSnl7lsG65MgN4cQpt9UjuoEiZZOaxEDSQBuQ=;
        b=dGhXwaidtc04Uxww9D8WXDjSN0PUy7Lw6qzcTQpi8WF+dq9U/piyv6iMGUTM4eN2xY
         8EIonRLmG37ytrHH5H36+y01kOniqsluF6VnHqSJelz9rC98FPqsK/z3Xa0ILaDenl8G
         M2IdpQFJMSWbDGeCOxrQRavsOEHLFkTDB3eBLB05NCHgzlvwmCwRqGJxLhQQ8nYIWseg
         CHXT3IQzNb15YbE8PJ6TvthlV7DEMLxW6TsOrE/o6Y0UQzFBAfm0Olzo5q9+Ws/uh34W
         3Bt2YMRawj8TvfRPMmwI/3k9HABOVg6xyKkzlF1gho+QO2EXyQjkIaeZQMA/4wj2DyDR
         uNpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=RjJdfavSnl7lsG65MgN4cQpt9UjuoEiZZOaxEDSQBuQ=;
        b=LjmdwWB7k+nRha6la/pOtQD/atiX5UxzRnJ3iJ/l4uuUlUt6P5rD5o2qJsOBRfDNfp
         3LwG4TxUshrdH4f4oiiJTxg3c5ZNqNx6ydz7jgw8uvL1fBlXBZQr6yvkN9/xlqspqX23
         JOfw7rRJZs4KcJQp7FtELX3nEDgZ09xS+QMMRjAR+7aKhteMELpFB9OuyiTi61+5YAjF
         5owJPTq4pl4A85l+R7bgLKWF4RZGryGIvT0fwho/NrrouAzolhQwV3koQ/D8ryjcQXlt
         eFR1FT0MkoaCIMZKYrK3ihBBVl+RKspSf+rqGzNEkru9S7zX3MT3kIAgDxNL4Rs9R8x7
         XpIA==
X-Gm-Message-State: AGi0PubXlBMRHbFnk4xgMHg86+4N1kmghTdV2KIyFdQ4DN8aoyQJLZw5
	LLTMxfnbOTtO4tRX+rQ8GagouJ3cU+o=
X-Google-Smtp-Source: APiQypLIKhg4U/W8N8Z5vLkwjLcVxJpuYOYRpC7fk4G16Rtpr1I0rvp1aEe9rk0VLboNAm2M+AqjYw==
X-Received: by 2002:a05:600c:c8:: with SMTP id u8mr554680wmm.142.1586447580408;
        Thu, 09 Apr 2020 08:53:00 -0700 (PDT)
Return-Path: <ricardo.ribalda@gmail.com>
Received: from piling.lan (80-71-134-83.u.parknet.dk. [80.71.134.83])
        by smtp.gmail.com with ESMTPSA id t67sm4253635wmt.48.2020.04.09.08.52.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2020 08:52:58 -0700 (PDT)
Sender: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
From: "Ricardo Ribalda" <ricardo.ribalda@gmail.com>
To: openembedded-core <openembedded-core@lists.openembedded.org>,
	Paul Barker <pbarker@konsulko.com>
Cc: Ricardo Ribalda Delgado <ricardo@ribalda.com>
Subject: [PATCH v5 4/6] wic: Continue if excluded_path does not exist
Date: Thu,  9 Apr 2020 17:52:49 +0200
Message-Id: <20200409155251.982424-5-ricardo@ribalda.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200409155251.982424-1-ricardo@ribalda.com>
References: <20200409155251.982424-1-ricardo@ribalda.com>
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

