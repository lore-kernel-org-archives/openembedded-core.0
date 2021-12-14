Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0C0AC433EF
	for <webhook@archiver.kernel.org>; Tue, 14 Dec 2021 12:56:51 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web11.25221.1639486610887362183
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Dec 2021 04:56:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=J87PkSt5;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.46,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f46.google.com with SMTP id t18so32178705wrg.11
        for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Dec 2021 04:56:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=NEZK7XYMDeDMgWgYKwJ4QNB/jTmHysHQJYxOxmv12xk=;
        b=J87PkSt5S6l1NHtnHZ5SJ11IsKBurITj6B6ycqXUeuVikYZoX1TF5f7VrhrRi0sFSc
         OEmEMfas8v5G5C+77imqu2etJFjSCcL401P2I/351k3TbXvMkQv0U9IxizBup+L2uuMn
         r2Bap3gg+3j4tu351+TRe/gCbSw/+aGiiWDzg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NEZK7XYMDeDMgWgYKwJ4QNB/jTmHysHQJYxOxmv12xk=;
        b=8N6wMqTil7yWDTRMT6HIj9RaB1rA4gZuzgdoE2VrxDLp8p3/DqCd0Y0ackDW3XMsNe
         14hvhMsVOp+LgUY59qfVr0QCnw/6vwuep5uzZ7TsB4ihUqzEtbLq8NEL8Ktw+QldGGOn
         5t/r3MbMtLLTL9dRxF5UTsiWwQCTrlpobE+TO4fiWov8HEGDgF3UFQZXLcKFuVDCUX8y
         XjVE8ZrRPiBsXMENgG50OxUROJ0CvZN38YPG2W/WPCtjWhhtJObWgGuz4Nt3Ynws33cG
         1Qp42JPRCXkOu/nOXrQhDu9GDBOCWoAgmexKh6MWGs7bwhkWZSRr2tadbjRnJDdZwKzF
         8MMA==
X-Gm-Message-State: AOAM531m3TbgCdrTzv4BIkKbDiogMJjh9sHVBREulBr2fT/Bv/2wuVWQ
	9YuHMepGSqcvVcq5ij004uxJy/8WnP5Zpg==
X-Google-Smtp-Source: 
 ABdhPJxB6f7/kXBYbfBp4GkbjkDVMh2i+4yexXVDM7mA/nTvsAIoDh2ZUkpDSvLf/oMmVGfNvkZ9+A==
X-Received: by 2002:adf:fe8e:: with SMTP id l14mr5404878wrr.177.1639486608919;
        Tue, 14 Dec 2021 04:56:48 -0800 (PST)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:aeee:ee3b:3dbf:6d62])
        by smtp.gmail.com with ESMTPSA id
 bd18sm1987683wmb.43.2021.12.14.04.56.48
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Dec 2021 04:56:48 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] lttng-tools: Disable problem tests
Date: Tue, 14 Dec 2021 12:56:47 +0000
Message-Id: <20211214125647.797421-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211214125647.797421-1-richard.purdie@linuxfoundation.org>
References: <20211214125647.797421-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Dec 2021 12:56:51 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159688

There is a pattern of the notification tests hanging. Whilst we need to get to the
bottom of that, disable them for now as it is causing high load for triage/SWAT
and masking other failures.

[YOCTO #14263]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../lttng/lttng-tools/disable-tests.patch     | 34 +++++++++++++++++++
 .../lttng/lttng-tools_2.13.1.bb               |  1 +
 2 files changed, 35 insertions(+)
 create mode 100644 meta/recipes-kernel/lttng/lttng-tools/disable-tests.patch

diff --git a/meta/recipes-kernel/lttng/lttng-tools/disable-tests.patch b/meta/recipes-kernel/lttng/lttng-tools/disable-tests.patch
new file mode 100644
index 00000000000..3a77ea2e439
--- /dev/null
+++ b/meta/recipes-kernel/lttng/lttng-tools/disable-tests.patch
@@ -0,0 +1,34 @@
+Upstream-Status: Inappropriate [need to root cause the test hangs]
+
+We keep seeing hangs in the tools/notifications tests on x86 and arm for
+a variety of distros. Exclude them for now to work out if this is the
+only place we see them and give SWAT/triage a break from the stream
+of them.
+
+https://bugzilla.yoctoproject.org/show_bug.cgi?id=14263
+
+Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
+
+Index: lttng-tools-2.13.1/tests/regression/Makefile.am
+===================================================================
+--- lttng-tools-2.13.1.orig/tests/regression/Makefile.am
++++ lttng-tools-2.13.1/tests/regression/Makefile.am
+@@ -29,18 +29,6 @@ TESTS = tools/base-path/test_ust \
+ 	tools/crash/test_crash \
+ 	tools/regen-metadata/test_ust \
+ 	tools/regen-statedump/test_ust \
+-	tools/notification/test_notification_ust_error \
+-	tools/notification/test_notification_ust_buffer_usage \
+-	tools/notification/test_notification_ust_capture \
+-	tools/notification/test_notification_ust_event_rule_condition_exclusion \
+-	tools/notification/test_notification_kernel_error \
+-	tools/notification/test_notification_kernel_buffer_usage \
+-	tools/notification/test_notification_kernel_capture \
+-	tools/notification/test_notification_kernel_instrumentation \
+-	tools/notification/test_notification_kernel_syscall \
+-	tools/notification/test_notification_notifier_discarded_count \
+-	tools/notification/test_notification_kernel_userspace_probe \
+-	tools/notification/test_notification_multi_app \
+ 	tools/rotation/test_ust \
+ 	tools/rotation/test_kernel \
+ 	tools/rotation/test_save_load_mi \
diff --git a/meta/recipes-kernel/lttng/lttng-tools_2.13.1.bb b/meta/recipes-kernel/lttng/lttng-tools_2.13.1.bb
index 187eff9619e..7ae02d92d2d 100644
--- a/meta/recipes-kernel/lttng/lttng-tools_2.13.1.bb
+++ b/meta/recipes-kernel/lttng/lttng-tools_2.13.1.bb
@@ -39,6 +39,7 @@ SRC_URI = "https://lttng.org/files/lttng-tools/lttng-tools-${PV}.tar.bz2 \
            file://0001-src-common-correct-header-location.patch \
            file://8f0646a03fbf31c19b85ec367dc2c3db56e6dbf7.patch \
            file://87250ba19aec78f36e301494a03f5678fcb6fbb4.patch \
+           file://disable-tests.patch \
            "
 
 SRC_URI[sha256sum] = "cfe6df7da831fc07fd07ce46b442c2ec1074c167af73f3a1b1d2fba0c453c8b5"
-- 
2.32.0


