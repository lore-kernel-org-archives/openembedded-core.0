Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 398A0C44529
	for <webhook@archiver.kernel.org>; Mon, 20 Jul 2026 17:23:58 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2904.1784568228004449208
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Jul 2026 10:23:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=gJmKdj7G;
 spf=pass (domain: smile.fr, ip: 209.85.128.48, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4954afac04bso28554685e9.0
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2026 10:23:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1784568226; x=1785173026; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=OJQooEbaZu/ch0pBfY9jld10bhvdE+/PH3eWlIwnxEs=;
        b=gJmKdj7GuFWqbmVhgkuUqp0E/M//PBWAc6Hu9n9Fk1MK3nDB2UTuT8oAcoA3rw0hBJ
         4Z/nMQfenDivb0Dm384f1x/Mg6AceS1yEbWGgqxgP9GBgsmiitvzXJlLptrHYJNBn7y2
         jsp6YXYM4uvA/ySOJ21ytBlTOnnzAU1xq2s2U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784568226; x=1785173026;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=OJQooEbaZu/ch0pBfY9jld10bhvdE+/PH3eWlIwnxEs=;
        b=PiUlzMyrcLA107x35M/YOaWr8rex1axbGzBgUif8qqwpCuExf8Q0NZFd/cg/KUuedO
         Wb7qvPqRt/lUz3FIrqwS+wHx+nne/aluT8xV2XjumajJTBKFm5emAhJukubZfWuJFbyr
         9M5/L+Ox65316bT0q/AccbLIaQedeIPQCb+WKOsoQLy/gFewSbW9rlCHAAL5xhraooto
         a3LDCwd5R/0YJgQYcA7xKxwL36zhUvJrQKWDe6UOZ1+j3EMYhXUr/LhWIuuaPQ3nKYJJ
         SlrWVadxvtiNVTOmjdZ+LzxTI7oHXLNh+3VXJQR4Ba4uHU3UKLojNF8L+3xwv61VpinB
         5Aww==
X-Gm-Message-State: AOJu0Ywup8hl8fzFrprfrluz3rWg/4KbKuowZq/lpHpjg5h8ep3VgAYT
	t06Ex9mTZ93pZm+pFlnULW7KxQplQGZdNTe16jUW4rUnI7sIx6tY1uL8/ZPqSMYzHd2rKVsczGk
	qHkeaaz0=
X-Gm-Gg: AfdE7cl4VhsVxnWBJ4XBeGD504nSGi9HBuDcvlq6oM9iUpckC2bPDOcfZjF0uNB8iam
	mMrsPs12/AW8uBCVpLI0Ox1H+8nDxJ5bsapeOs8LAaKsqCe7zO0MFsKuxc+3lSuO1Hpw3z+Iw61
	Czmfk6f8CtzM75G+QImDiAOfmzbW36Q+68SzfsKXqCl3lASsyON5jqEDx0NN7wboNln2RmLlexT
	4R7Fl/1fc7pHJEwtng6Ww07mJV9wlCCF48jTkDfKAI29QFbixN6M60SMg8RYOVOQIvKwCUinGtW
	myATWVpQH8mhicN5WhTKyQHw4kvHOrqNmjgJSOoTJ9niPswSpFSsqpuvnXexUtU+9OdFtQoh33u
	NQTFjJPUXSV+jQxtqcDqjt1iKl3t+azNWeU5oK0OouhjykMauLasNRduxpHoYJK4ZIk21edyB0B
	ojDyHeC7YX61H2ZVY74gvYDRmSef30FJ8vEd9uXD0IRKb4tW2R0DOiGGbQ3AHfzmZi3QScUNGNt
	+z9dWrR
X-Received: by 2002:a05:600c:3512:b0:495:4572:21af with SMTP id 5b1f17b1804b1-4954a3ef7dbmr161530355e9.9.1784568226223;
        Mon, 20 Jul 2026 10:23:46 -0700 (PDT)
Received: from localhost.localdomain (2a02-8440-b501-5b7b-2580-caa3-ecc1-dea5.rev.sfr.net. [2a02:8440:b501:5b7b:2580:caa3:ecc1:dea5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49563eee22esm36508575e9.1.2026.07.20.10.23.45
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 10:23:45 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 25/33] openssh: set status for CVE-2026-3497
Date: Mon, 20 Jul 2026 19:22:58 +0200
Message-ID: <51f07e58e3d40f6d83ba0ec7913a5ebe51fbf031.1784567958.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1784567958.git.yoann.congal@smile.fr>
References: <cover.1784567958.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2026 17:23:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241459

From: Sudhir Dumbhare <sudumbha@cisco.com>

Analysis:
 - CVE-2026-3497 affects downstream OpenSSH GSSAPI Key Exchange patches.
 - The vulnerable code uses sshpkt_disconnect() in the GSSAPI KEX server path.
 - Upstream OpenSSH/OE-Core does not carry the vulnerable GSSAPI key-exchange delta.
 - Hence ignoring the CVE for this version.

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2026-3497
https://github.com/advisories/ghsa-wcpp-3x59-h8vp
https://ubuntu.com/security/CVE-2026-3497
https://security-tracker.debian.org/tracker/CVE-2026-3497
https://www.openwall.com/lists/oss-security/2026/03/12/3

Signed-off-by: Sudhir Dumbhare <sudumbha@cisco.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit c2bd43b373d65d717e606cab3793b8a64facd946)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-connectivity/openssh/openssh_9.6p1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-connectivity/openssh/openssh_9.6p1.bb b/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
index 4193bc8a5b4..4ab3174924c 100644
--- a/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
@@ -49,6 +49,7 @@ Red Hat Enterprise Linux 7 and when running in a Kerberos environment"
 
 CVE_STATUS[CVE-2008-3844] = "not-applicable-platform: Only applies to some distributed RHEL binaries."
 CVE_STATUS[CVE-2023-51767] = "upstream-wontfix: It was demonstrated on modified sshd and does not exist in upstream openssh https://bugzilla.mindrot.org/show_bug.cgi?id=3656#c1."
+CVE_STATUS[CVE-2026-3497] = "not-applicable-platform: Only affects GSSAPI Key Exchange patches used by some Linux distributions and does not exist in upstream openssh."
 
 PAM_SRC_URI = "file://sshd"
 

