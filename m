Return-Path: <luca.boccassi@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76EC1C433FE
	for <webhook@archiver.kernel.org>; Wed, 17 Nov 2021 12:32:13 +0000 (UTC)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com
 [209.85.208.45])
 by mx.groups.io with SMTP id smtpd.web12.6353.1637152332750679042
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Nov 2021 04:32:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=NfWN0YfA;
 spf=pass (domain: gmail.com, ip: 209.85.208.45,
 mailfrom: luca.boccassi@gmail.com)
Received: by mail-ed1-f45.google.com with SMTP id b15so10389445edd.7
        for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Nov 2021 04:32:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=oVD6VCVhw+r5G+gJBdWuC0VmfRn/Ttt83CBtoQVvyjg=;
        b=NfWN0YfA9Ev+wbK3ALFY1zOVHg/iOZ3gyDEp6vSfZ30b/teY7qNNcUVFYAL4kxfd0e
         5Plb+QgoVYDqUGHTgdCwQ7LXzAgFA/tclLwWxrD/C9WBA7/tJr6fisVnT33/5KENz9Rx
         BeSO8vSmkzZWV/RW6EL5Po+dAZGyiwsttzTH5egRERoDqBQ/D6hvq8thxBqfse2m+wVa
         R/qQIBaEyXtWk65nrF9FjlCiOe/GVNXQGuFq7e0JM4dU39bwb60KgYCHxraVsHdFhshV
         eMim1P42VEt0YjeAtLkrL6XK7m/kDLbyDM+Iw0uMiWxxbXEHO/UD4D96qcl3ps8h3SI4
         36gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=oVD6VCVhw+r5G+gJBdWuC0VmfRn/Ttt83CBtoQVvyjg=;
        b=lrLg5B/AzUiOTOmlr2d3wqGu7pugk888/YwsZlXpiG/eNZjGPayx6Qjv9nIrCiqh96
         yO/r+TEbqtXfhrkyZc5+pni6jy3iFiGGxiY3NYyG0Wy7PfDTv7ChrovfV3w84Mr4Gox1
         FudY9lntA/9wQausbcOyWrlO1wZx12d4ZyTH4vrRrIZtd32SLBWpfRFSyJfkE/hlPrCi
         LEnI/mCP1CyvwilHcHiiTqNjhivVEEGRkB1v1AbFtULlLo3wPCBhOV27oyWKvubGyfjd
         6ICpLlp9XDwNKTXUTQrbrOX49NgrKyBJivzThzGiBP1rypGDsbqGhf0WYJQrsD8g3kJ6
         +ZZw==
X-Gm-Message-State: AOAM5306ipZRSiP7Gfp1OKL2qY6DNKEXjWlcODetDV8UVYRyOAkgBKc4
	XGjHYSSY4SAcBm5zL0BfUC8DcX2+BRXq9A==
X-Google-Smtp-Source: 
 ABdhPJxxoKNmjqiGfDGDESIgLxikuGTzbRCpBT9gdnCZzrDhlkDO+wjJ9E6z9chuWajEiDy0P0P4KQ==
X-Received: by 2002:a17:907:1b25:: with SMTP id
 mp37mr20762200ejc.140.1637152331103;
        Wed, 17 Nov 2021 04:32:11 -0800 (PST)
Received: from localhost ([137.220.125.106])
        by smtp.gmail.com with ESMTPSA id
 gn16sm10256213ejc.67.2021.11.17.04.32.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Nov 2021 04:32:10 -0800 (PST)
From: luca.boccassi@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: paul.eggleton@microsoft.com
Subject: [PATCH 3/8] systemd: remove /var in nativesdk builds
Date: Wed, 17 Nov 2021 12:31:56 +0000
Message-Id: <20211117123201.111905-4-luca.boccassi@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211117123201.111905-1-luca.boccassi@gmail.com>
References: <20211117123201.111905-1-luca.boccassi@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Nov 2021 12:32:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158387

From: Luca Boccassi <luca.boccassi@microsoft.com>

Nothing picks it up, so it fails QA checks

Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
---
 meta/recipes-core/systemd/systemd_249.5.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-core/systemd/systemd_249.5.bb b/meta/recipes-core/systemd/systemd_249.5.bb
index 38a2f5d474..016058cd7f 100644
--- a/meta/recipes-core/systemd/systemd_249.5.bb
+++ b/meta/recipes-core/systemd/systemd_249.5.bb
@@ -772,6 +772,11 @@ ALTERNATIVE_TARGET[runlevel] = "${base_bindir}/systemctl"
 ALTERNATIVE_LINK_NAME[runlevel] = "${base_sbindir}/runlevel"
 ALTERNATIVE_PRIORITY[runlevel] ?= "300"
 
+# Nothing picks up /var in the nativesdk case
+do_install_append_class-nativesdk () {
+	rm -rf ${D}/var
+}
+
 pkg_postinst:${PN}:libc-glibc () {
 	if [ "${PN}" = "nativesdk-systemd" ]; then
 		exit 0
-- 
2.30.2


