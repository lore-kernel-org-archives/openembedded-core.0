Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31CDBC3DA49
	for <webhook@archiver.kernel.org>; Tue, 16 Jul 2024 07:24:57 +0000 (UTC)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
 by mx.groups.io with SMTP id smtpd.web11.5224.1721114688575869012
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Jul 2024 00:24:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=RfY8Smyu;
 spf=pass (domain: mvista.com, ip: 209.85.128.182, mailfrom: vanusuri@mvista.com)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-65fc94099a6so25227667b3.1
        for <openembedded-core@lists.openembedded.org>; Tue, 16 Jul 2024 00:24:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1721114686; x=1721719486; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fjYh4tE7sbFxtuU5lfp5EO8NaQFpPeSJKXBEcHh0RWM=;
        b=RfY8SmyuEibzGOKXCf35TRdPRnGpbZg1x3zoF43stAYehm44ebMMHA18NSC1E/+Mzq
         gqL0JmFe+DaIAUWE9S+2xKOGr87rpxsTHphSIT7Z91s2xBHUI7ehXA5xtiYG1cf0BGcX
         PUeRqM+Cobf1IAOIK2oEMRuV2OhO3zIWqwyds=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721114686; x=1721719486;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fjYh4tE7sbFxtuU5lfp5EO8NaQFpPeSJKXBEcHh0RWM=;
        b=d88GE0kWnEMCPVhB+WHlcF0PD8cEOvfl9rj3obHxs5n4aQHy/9jufe9VLpBP5668qh
         qphiGGe1uqZ4hKlC0T4XQaJUmtjir14ShCeDWui+kTaVshwDEDUbwP37K4NYeXW23pv3
         CpsOo+oxXQ9S+eKYGw8PIW49tD+PQEEU6e09spzw/h1iEcGCR10sX3A4gk7/hDsxEd20
         fGlResFQu20My8bCHHqJeu91AZEXPtsJ54jiBL/bmqk1LFF+cLt8LLYOkzt6KOznhQgk
         btxLyZ3mscvkVokQGrTXras0zpl8MDKuAr3mp0ne41PADpZmCE2BbchMwb8ZRVzxAo2t
         6oKw==
X-Gm-Message-State: AOJu0YxDSxTYOcFL7POATA9Wy0jiPEVsWGznfo52GB5+kP4999CrjE2X
	/31mqApemzi6mMezq7pkIJrxi2Z9ttLjHk19UrrlLUq87pu0lFsysmJ7u/nHghcB51qTzOQIKvd
	UrmE=
X-Google-Smtp-Source: AGHT+IG07t36EQH7PYp2RjcZ4y98zw8g9/Jflryzmhb0RE/AGJTFhkw2di0OSbNQzTd3BCAXtZFPGg==
X-Received: by 2002:a81:6e02:0:b0:618:2381:2404 with SMTP id 00721157ae682-663814edc12mr14236807b3.44.1721114686390;
        Tue, 16 Jul 2024 00:24:46 -0700 (PDT)
Received: from MVIN00020.mvista.com ([2405:201:c01c:7959:be7c:8d0a:370e:e536])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-65fc29fec84sm10801867b3.56.2024.07.16.00.24.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jul 2024 00:24:45 -0700 (PDT)
From: vanusuri@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][scarthgap][PATCH] openssh: fix CVE-2024-39894
Date: Tue, 16 Jul 2024 12:54:35 +0530
Message-Id: <20240716072435.1591826-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Jul 2024 07:24:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202083

From: Vijay Anusuri <vanusuri@mvista.com>

ssh(1) in OpenSSH versions 9.5p1 to 9.7p1 (inclusive).
Logic error in ObscureKeystrokeTiming option.
A logic error in the implementation of the ssh(1) ObscureKeystrokeTiming option rendered the feature ineffective and additionally exposed limited keystroke timing information when terminal echo was disabled, e.g. while entering passwords to su(8) or sudo(8). This condition could be avoided for affected versions by disabling the feature using ObscureKeystrokeTiming=no.

References:
https://www.openssh.com/security.html
https://www.openssh.com/txt/release-9.8

Upstream-Status: Backport [https://github.com/openssh/openssh-portable/commit/146c420d29d055cc75c8606327a1cf8439fe3a08]

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../openssh/openssh/CVE-2024-39894.patch      | 35 +++++++++++++++++++
 .../openssh/openssh_9.6p1.bb                  |  1 +
 2 files changed, 36 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2024-39894.patch

diff --git a/meta/recipes-connectivity/openssh/openssh/CVE-2024-39894.patch b/meta/recipes-connectivity/openssh/openssh/CVE-2024-39894.patch
new file mode 100644
index 0000000000..898295340d
--- /dev/null
+++ b/meta/recipes-connectivity/openssh/openssh/CVE-2024-39894.patch
@@ -0,0 +1,35 @@
+From 146c420d29d055cc75c8606327a1cf8439fe3a08 Mon Sep 17 00:00:00 2001
+From: "djm@openbsd.org" <djm@openbsd.org>
+Date: Mon, 1 Jul 2024 04:31:17 +0000
+Subject: [PATCH] upstream: when sending ObscureKeystrokeTiming chaff packets,
+ we
+
+can't rely on channel_did_enqueue to tell that there is data to send. This
+flag indicates that the channels code enqueued a packet on _this_ ppoll()
+iteration, not that data was enqueued in _any_ ppoll() iteration in the
+timeslice. ok markus@
+
+OpenBSD-Commit-ID: 009b74fd2769b36b5284a0188ade182f00564136
+
+Upstream-Status: Backport [import from ubuntu https://git.launchpad.net/ubuntu/+source/openssh/tree/debian/patches/CVE-2024-39894.patch?h=ubuntu/noble-security
+Upstream commit https://github.com/openssh/openssh-portable/commit/146c420d29d055cc75c8606327a1cf8439fe3a08]
+CVE: CVE-2024-39894
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ clientloop.c | 7 ++++---
+ 1 file changed, 4 insertions(+), 3 deletions(-)
+
+--- a/clientloop.c
++++ b/clientloop.c
+@@ -612,8 +612,9 @@ obfuscate_keystroke_timing(struct ssh *s
+ 		if (timespeccmp(&now, &chaff_until, >=)) {
+ 			/* Stop if there have been no keystrokes for a while */
+ 			stop_reason = "chaff time expired";
+-		} else if (timespeccmp(&now, &next_interval, >=)) {
+-			/* Otherwise if we were due to send, then send chaff */
++		} else if (timespeccmp(&now, &next_interval, >=) &&
++		    !ssh_packet_have_data_to_write(ssh)) {
++			/* If due to send but have no data, then send chaff */
+ 			if (send_chaff(ssh))
+ 				nchaff++;
+ 		}
diff --git a/meta/recipes-connectivity/openssh/openssh_9.6p1.bb b/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
index 3cdf0327b0..8bc4f4269a 100644
--- a/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
@@ -28,6 +28,7 @@ SRC_URI = "http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar
            file://0001-regress-banner.sh-log-input-and-output-files-on-erro.patch \
            file://0001-systemd-Add-optional-support-for-systemd-sd_notify.patch \
            file://CVE-2024-6387.patch \
+           file://CVE-2024-39894.patch \
            "
 SRC_URI[sha256sum] = "910211c07255a8c5ad654391b40ee59800710dd8119dd5362de09385aa7a777c"
 
-- 
2.25.1


