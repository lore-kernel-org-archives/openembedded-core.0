Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
 by mx.groups.io with SMTP id smtpd.web11.11165.1586871387367459123
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Apr 2020 06:36:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=bpUoxYeJ;
 spf=pass (domain: gmail.com, ip: 209.85.208.172, mailfrom: ricardo.ribalda@gmail.com)
Received: by mail-lj1-f172.google.com with SMTP id n17so12466726lji.8
        for <openembedded-core@lists.openembedded.org>; Tue, 14 Apr 2020 06:36:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=TXSWYCk+ydjvpcJpD7N8q/2i9fkH2MhUboCa+m+r8P4=;
        b=bpUoxYeJXS9j4P29WCeAzsDfeeu8sQ20zy4PknVrNJTBkFoTBcWBlDWPc4lPZpHKbb
         GOx7QS809fe7j3M4TrPtMmZAaSykosdO032u4bReOsmbiAkWlyF1v97nJz51r37Dd5q/
         3FDy4Vs+/fPOC/Bt7gK0ZAeHdA846t6GgH0dAv21b8f4hjEXuytMomtY5dQAe2deHWbY
         1tWQ4kmu8MqgNoQllnCOkRYEIATJCP+dmiNNYH1vGD1erQsYC5pJcaWYxjPv4GvuWtxu
         erK++HK8fS/oURR9E6yTr0oUwb0JTt2/IrkmohrHT6RhH89rTpv1M/iRn4yAOK8gc4o+
         HBjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=TXSWYCk+ydjvpcJpD7N8q/2i9fkH2MhUboCa+m+r8P4=;
        b=cWQr5sS+ImqShh5RR7kM/XNJfXxz893lLtS+JIreDgyJx/Dt+6+791gY0PjsHKWZ9q
         fNxpKJg0rTzHHxAbM0y+zMjEQQfEu/7noMiSo9uSQLRA50bu4Hy9dndhUGdpdiz6oGND
         45MZO7sFWD1avFuLAeSKMlANhzsfZLbvAD7KyPt8qV9VijcK2Wg8WZiwEcni+Ha072KI
         FQ67RJjBmJK78a7s9nBvq8MPyLUpPmmUtR3VTRdvulvJPqZ3lKmwaCRYBzTTw/aIv9KS
         73/eQBT4MlmZBpgO4uB7B7RaehtWOcrjVkm8Np8ZllsYRZGwugMpfVvmT0t4lPHgapPs
         /ziw==
X-Gm-Message-State: AGi0PuaCZyKcl7+7gPBzaXRv+VtzRQEaxipOnfbxl4FTOKmhwBO2giXI
	n17Vz9+vPgsqaMqaM+rJccqbP3XrubE=
X-Google-Smtp-Source: APiQypL3lPe49h1v7JlxuwWePlxcnZRNXiNfNZTmjDm29IbnbJzRythbGQZSaXEfijft91JLArelKQ==
X-Received: by 2002:a2e:908c:: with SMTP id l12mr158669ljg.40.1586871385428;
        Tue, 14 Apr 2020 06:36:25 -0700 (PDT)
Return-Path: <ricardo.ribalda@gmail.com>
Received: from neopili.qtec.com (cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
        by smtp.gmail.com with ESMTPSA id o6sm9218344lji.15.2020.04.14.06.36.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2020 06:36:24 -0700 (PDT)
Sender: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
From: "Ricardo Ribalda" <ricardo.ribalda@gmail.com>
To: openembedded-core <openembedded-core@lists.openembedded.org>,
	Paul Barker <pbarker@konsulko.com>
Cc: Ricardo Ribalda Delgado <ricardo@ribalda.com>
Subject: [PATCH v6 04/10] wic: Continue if excluded_path does not exist
Date: Tue, 14 Apr 2020 15:36:08 +0200
Message-Id: <20200414133614.1830058-5-ricardo@ribalda.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200414133614.1830058-1-ricardo@ribalda.com>
References: <20200414133614.1830058-1-ricardo@ribalda.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If an excuded path does not exist, continue without an error.
This allows to seamleasly reuse .wks among different projects.

Eg:

part / --source rootfs --fstype=ext4 --exclude-path=opt/private_keys

Where /opt/private_keys in only populated by some of the image.bb files.

Cc: Paul Barker <pbarker@konsulko.com>
Signed-off-by: Ricardo Ribalda Delgado <ricardo@ribalda.com>
---
 scripts/lib/wic/plugins/source/rootfs.py | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/scripts/lib/wic/plugins/source/rootfs.py b/scripts/lib/wic/plugins/source/rootfs.py
index c831829398..1d21ec2252 100644
--- a/scripts/lib/wic/plugins/source/rootfs.py
+++ b/scripts/lib/wic/plugins/source/rootfs.py
@@ -135,7 +135,6 @@ class RootfsPlugin(SourcePlugin):
                     sys.exit(1)
 
                 full_path = os.path.realpath(os.path.join(new_rootfs, path))
-
                 # Disallow climbing outside of parent directory using '..',
                 # because doing so could be quite disastrous (we will delete the
                 # directory).
@@ -143,6 +142,9 @@ class RootfsPlugin(SourcePlugin):
                     logger.error("'%s' points to a path outside the rootfs" % orig_path)
                     sys.exit(1)
 
+                if not os.path.lexists(full_path):
+                    continue
+
                 if path.endswith(os.sep):
                     # Delete content only.
                     for entry in os.listdir(full_path):
-- 
2.25.1

