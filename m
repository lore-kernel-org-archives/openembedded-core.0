Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web11.8050.1586337458845600322
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Apr 2020 02:17:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=eSXdG5jl;
 spf=pass (domain: gmail.com, ip: 209.85.221.42, mailfrom: ricardo.ribalda@gmail.com)
Received: by mail-wr1-f42.google.com with SMTP id c15so6900683wro.11
        for <openembedded-core@lists.openembedded.org>; Wed, 08 Apr 2020 02:17:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=avRbMLAdK5uCBFwWUhbkvhKBjHP7RBdXVVsuPVsZfoQ=;
        b=eSXdG5jlDRWYHlhoUKca/ySfteAN+0lnApjijM9oFaPPD1jhZOr85OE9VjzolblBBN
         T9pY6s/eovt5cFXQlA59ig5h4M2SrCwZwxEYYGDoMcm2GjcWAmu9VGPoYzYv/RP+l//R
         VPpReOxcKsHzR+RjvVT1izuLb+FT4v3UQMliN50hnDhXti2vEgGMtFUPWF1nf0xP13at
         QR3XcIv8wlJjLxKw7Lt9g84a2hjAv6wRgZQHh9c4T9hvSxnVm16dOd8P7R+tTBvkjsZ3
         5lQheBPh881yI/Kg5dVYNtG1Eg0D3gP7XZ0NyJlOk7e4czk1rjqFfT0i7bECJP0FRLkX
         e2og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=avRbMLAdK5uCBFwWUhbkvhKBjHP7RBdXVVsuPVsZfoQ=;
        b=KnshfZO9F1ktMCvg4jOfuPM6djpXTMLkOiIKxwhbwOWtebjrJn6SEFIxwcX+/i1CgY
         oaVYQkQmDlQRZsjYBFpfyJBP1/TDXALAbKgwYk8kndVMvrGxo+7bC+UzXsVkD5Zk6RNY
         baK0cbapdWyMlCOqWxt9m2GX+86NrazYdYiASJpjnAFE7IErzx4Kh/2RVmruD8btJQ16
         vuwVCuyIuMsunkobPGQyYtRIFgPJczNOewd0aFQufaYKP8O12820D3qfDo0qGA6JhuCk
         A7td9w+XHAuVft5TpG0D7w38pvA87zEpMXdv1bAzoaYz93b4iNGg5Ss63GOFIevYux16
         JDPw==
X-Gm-Message-State: AGi0PuaROLcVURmR8zfVM6nFrpzWbw6rKD9WSwUt4VwQTK8Z7BY8KDKY
	TmXH74QS2OrvokjTdctMamU4a5lemls=
X-Google-Smtp-Source: APiQypLzw9cSFv6pvySaX7d/zKV3/xrYKUIrsepAGh1RHgu7T8G631SgnqxYU6QkZPfhHJoHT0wAEQ==
X-Received: by 2002:adf:fd4e:: with SMTP id h14mr7295229wrs.297.1586337457122;
        Wed, 08 Apr 2020 02:17:37 -0700 (PDT)
Return-Path: <ricardo.ribalda@gmail.com>
Received: from piling.lan (80-71-134-83.u.parknet.dk. [80.71.134.83])
        by smtp.gmail.com with ESMTPSA id a2sm34789591wrp.13.2020.04.08.02.17.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2020 02:17:36 -0700 (PDT)
Sender: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
From: "Ricardo Ribalda" <ricardo.ribalda@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Ricardo Ribalda Delgado <ricardo@ribalda.com>
Subject: [PATCH v3 2/2] wic: Continue if excluded_path does not exist
Date: Wed,  8 Apr 2020 11:17:22 +0200
Message-Id: <20200408091722.15992-2-ricardo@ribalda.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200408091722.15992-1-ricardo@ribalda.com>
References: <20200408091722.15992-1-ricardo@ribalda.com>
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
index f161d1eae0..871f349b8c 100644
--- a/scripts/lib/wic/plugins/source/rootfs.py
+++ b/scripts/lib/wic/plugins/source/rootfs.py
@@ -117,6 +117,9 @@ class RootfsPlugin(SourcePlugin):
                     sys.exit(1)
 
                 full_path = os.path.realpath(os.path.join(new_rootfs, path))
+                
+                if not os.path.lexists(full_path):
+                    continue
 
                 # Disallow climbing outside of parent directory using '..',
                 # because doing so could be quite disastrous (we will delete the
-- 
2.25.1

