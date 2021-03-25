Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
 by mx.groups.io with SMTP id smtpd.web12.5618.1616666231602928025
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Mar 2021 02:57:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=eXV7kkk0;
 spf=pass (domain: gmail.com, ip: 209.85.167.51, mailfrom: hansson.mattias@gmail.com)
Received: by mail-lf1-f51.google.com with SMTP id b14so1601078lfv.8
        for <openembedded-core@lists.openembedded.org>; Thu, 25 Mar 2021 02:57:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GyLM3C5JZ7d2NCtoc6EYbzN5AVXi4b/oqSDcmKkWi8M=;
        b=eXV7kkk0/mK5T+nc0RhW8zZCIkyJ63qcJ5i4CSRQAQuJWqZ4QbT4KSNaxmiuWDUg/e
         elZNM9QnwOidtHRB/8N8e10luw6ftuoSbHzbxOddc9RfDC+Y+kELoUC+rkqMP3KxjC95
         y9/vNmii2jVtzuSKYUDMkPF467UtXwC9ExyrdCyXllDl531aNPJui+QpP7Nfle0QNG1q
         dWG76zxlcPDrV5IgrfDIISuuR/AbVHMBxiGajiEIy7PrLeG5kKb1YF3rg6r8Bs+Dfebr
         Qqs4bpqcw6ZWfvXkRG+e/YFwu5RrGcq+eDhpGI1RsSegBPFhoAm7pKnwSWmtQ2vSj/bF
         nhEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GyLM3C5JZ7d2NCtoc6EYbzN5AVXi4b/oqSDcmKkWi8M=;
        b=O1shfE9n6JRDtjWKgZFZboj8CvVpPj4T/VaFNKkr7RWNqLT9o3W/1GBp982ydfFdhN
         f2ctgXtNo03sZdaBpdFLZ29N7vBzfwGgnQKAjug+pwvvEUjjqUd2EFW7lsj1/G4hdpum
         otuOdQr7mVh78Ltffh9Sfqw3+/9y9kBK3x+gK+8phIiFscXWS7MGQanw1ZNbawLWjCQK
         nWVoYMMdxPsOF2EggQRok0QEmxOSt+DvXHCyNBz4z2Ej2c5jiBReZVr85fpN/07arHB0
         GPQw4wYDecQb0YgVKkf5MpQaHjKtmqHf9nepE8DueeSI5Tv7G4Uaoh87MCD5zXnzRVv9
         p+2w==
X-Gm-Message-State: AOAM530IV+mnAjsaKkMrNzwEtXUzCBcBGZji6j65JLXT/KYGolA4oDo0
	ueR8FeUId2ovaJZ4N/cvLPMIfp4dWJSEPA==
X-Google-Smtp-Source: ABdhPJxDEnuPRphEv2sLFTxylQZZvua6o3b/zHlwA3IwFc4KIzWw0ZoBfjDXBSADEXiTYPbwc4eTdw==
X-Received: by 2002:a05:6512:ba0:: with SMTP id b32mr4695830lfv.127.1616666229224;
        Thu, 25 Mar 2021 02:57:09 -0700 (PDT)
Return-Path: <hansson.mattias@gmail.com>
Received: from localhost.localdomain (84-216-106-29.customers.ownit.se. [84.216.106.29])
        by smtp.gmail.com with ESMTPSA id t11sm670255ljk.65.2021.03.25.02.57.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Mar 2021 02:57:08 -0700 (PDT)
From: hansson.mattias@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Mattias Hansson <hansson.mattias@gmail.com>
Subject: [PATCH] openssh: Wait for local-fs before generating host keys
Date: Thu, 25 Mar 2021 10:54:41 +0100
Message-Id: <20210325095441.4723-1-hansson.mattias@gmail.com>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently, the sshdgenkeys.service wait for the host keys default paths
/var and /run. The service runs a script which picks up the host key
paths from the sshd_config which means that the paths are configurable
and can potentially be placed outside /var and /run.

This patch makes sshdgenkeys.service wait for /etc/fstab to be mounted
and which should include alternative host keys paths.

The requirement for /var and /run is left for backwards compatibility.

Signed-off-by: Mattias Hansson <hansson.mattias@gmail.com>
---
 meta/recipes-connectivity/openssh/openssh/sshdgenkeys.service | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-connectivity/openssh/openssh/sshdgenkeys.service b/meta/recipes-connectivity/openssh/openssh/sshdgenkeys.service
index fd81793d51..44831c9955 100644
--- a/meta/recipes-connectivity/openssh/openssh/sshdgenkeys.service
+++ b/meta/recipes-connectivity/openssh/openssh/sshdgenkeys.service
@@ -1,6 +1,8 @@
 [Unit]
 Description=OpenSSH Key Generation
+Requires=local-fs.target
 RequiresMountsFor=/var /run
+After=local-fs.target
 
 [Service]
 ExecStart=@LIBEXECDIR@/sshd_check_keys
-- 
2.31.0

