Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com [209.85.208.67])
 by mx.groups.io with SMTP id smtpd.web12.6810.1594371992429633971
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Jul 2020 02:06:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=H+en/ftn;
 spf=pass (domain: gmail.com, ip: 209.85.208.67, mailfrom: max.oss.09@gmail.com)
Received: by mail-ed1-f67.google.com with SMTP id by13so4047102edb.11
        for <openembedded-core@lists.openembedded.org>; Fri, 10 Jul 2020 02:06:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+u1gjvbBrx08EsPdHfg+HF46NCMuD1MMuXMbTaSkrfo=;
        b=H+en/ftnQTZrokJZ0BPsiJWINIAegXZAow+irAVPFHfLGTDppmStyDWoWrtDtvOVKJ
         jwOB1v3vWHiIEHJX10BVgvO4tahvVuU8GrYp5qmCAJU07w8XeZm77Ffs2hUgm14g5dwT
         Q5umcP9r+4Sb1zARNQrauvQYHU/5G2GmkkErPAlR5tib8S1xybjAqeQo6Wr/aTVU75dh
         QXsYaWi48QonTIGr5QkljCVuTe3sd2Eqq5xe/64BfUlnge0vZqNkqx07aSwBMdkJbVdQ
         i/jm7+ISfq/SFJxaHTGGVyNvAV09sOCbiWxeqB1K5Ep1H6YjtyLSkEQwkcAF9BcMaz2i
         /5BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+u1gjvbBrx08EsPdHfg+HF46NCMuD1MMuXMbTaSkrfo=;
        b=mt/QEpNYMXTaLrzssZyYl9il9L2dQD5s3M8wKWM9Qo7ZRLfaYY5U/sYgdxBFbJGnGm
         r076YNEsfwwBevfmH2ftDE3KHqmx3YMetvYtOXV+0SfzUPVHEUW5Q7ZGjJY7imHBsCt8
         jDoJdmvHs8rlKr93OojVBJiIe8RGBJISeDcld4i4PpyLmLBiCwqhuRgcQFgbHFAXh5Rw
         0kiJWzRS1nJYX1lXahQPEpuZw3e3J5E+5ImsFGEQr9ThIrc7j8yOSeHh7S9CHWrzZnZM
         1chbp8C8sU3PDiI273jKr+QCMnRkMl5U/XrAE7WFaAejqHMqxrdU0KeOJ11BNNpaxzTa
         NRSA==
X-Gm-Message-State: AOAM531p8fdSCIAtaC9HUm8h8By9PygY7rXDT5fC8YLMVCsgMNEwvUkD
	K4Vf3Ic2ybRkZX9Ujje+ipZOBQ1p
X-Google-Smtp-Source: ABdhPJxNjcuHS+3zWSm4QyM5UytjpEp9UC7NJh/X81ibkM4A0e2W27VSaIbesRkzfWP/hGW3fWCQjQ==
X-Received: by 2002:aa7:c883:: with SMTP id p3mr78523470eds.128.1594371990936;
        Fri, 10 Jul 2020 02:06:30 -0700 (PDT)
Return-Path: <max.oss.09@gmail.com>
Received: from linuxdev2.toradex.int (31-10-206-124.static.upc.ch. [31.10.206.124])
        by smtp.gmail.com with ESMTPSA id d22sm3249773ejc.90.2020.07.10.02.06.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2020 02:06:30 -0700 (PDT)
From: "Max Krummenacher" <max.oss.09@gmail.com>
X-Google-Original-From: Max Krummenacher <max.krummenacher@toradex.com>
To: openembedded-core@lists.openembedded.org
Cc: Max Krummenacher <max.krummenacher@toradex.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>
Subject: [OE-core][Patch 2/2] kernel-yocto.bbclass: force creation of config.queue
Date: Fri, 10 Jul 2020 11:05:14 +0200
Message-Id: <20200710090514.440-2-max.krummenacher@toradex.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200710090514.440-1-max.krummenacher@toradex.com>
References: <20200710090514.440-1-max.krummenacher@toradex.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In the case of no patches or no configure fragments, during
do_kernel_metadata() scc is not called, and thus
kernel-sources/${meta_dir}/config.queue is not created.
Later do_kernel_configme fails because the file is missing.

| ERROR: Execution of 'run.do_kernel_configme.24874' failed with exit code 1:
| exit 1 from 'configs="$(scc --configs -o ${meta_dir})"'

Forcing at least an empty config.queue file fixes this.

Fixes: 23dcff0d396c (kernel/yocto: ensure that defconfigs are processed first)
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
---
 meta/classes/kernel-yocto.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
index 7cedb05e93..7ea3cb5e51 100644
--- a/meta/classes/kernel-yocto.bbclass
+++ b/meta/classes/kernel-yocto.bbclass
@@ -220,6 +220,8 @@ do_kernel_metadata() {
 		if [ $? -ne 0 ]; then
 			bbfatal_log "Could not generate configuration queue for ${KMACHINE}."
 		fi
+	else
+		touch ${S}/${meta_dir}/config.queue
 	fi
 
 	# if KMETA_EXTERNAL_BSPS has been set, or it has been detected from
-- 
2.20.1

