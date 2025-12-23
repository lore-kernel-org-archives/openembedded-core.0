Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEBCAE6FE51
	for <webhook@archiver.kernel.org>; Tue, 23 Dec 2025 21:26:26 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.109421.1766525182794678570
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Dec 2025 13:26:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=vRDLFJqB;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.173, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-29efd139227so71968415ad.1
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Dec 2025 13:26:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1766525182; x=1767129982; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aWfEqpYM3HWIXB08uw3JsLHuuubwmxO8xgA7qNgB6P4=;
        b=vRDLFJqBBpIo2Ir5eDWrFBfoEUqMnf9KhESCsmEjgl62pR3aom0smVLkV5QS2K1A6J
         mLnk8Kqgf+E+U8q9xkoEci7caw3hix5Rs780HTaN1VfFUiuD0h2YyrgvR9hRRGOJECDC
         3HUWpfynwt29Q+hMUOnWXaMP+ppNLviy5sL/GyUOiWlWO5iTb5vtCtywtDJlzjPZfTUn
         TOupEc/jUh8AIcHH6l1Jqd+1iWx09kheC9XATtKc3Y7xSDUqoA3ePlg3WYGmSpG+QuYK
         MYbS0o2BFbQ2qkiaAFPLoUsAXSLLK30Ns0dYJxsMCGnKEi/HHzM/LSCz7siBbf1bGHpf
         0dNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766525182; x=1767129982;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aWfEqpYM3HWIXB08uw3JsLHuuubwmxO8xgA7qNgB6P4=;
        b=lRVTw8e/vkxNAv1wrJbHesw1T52RVCRQghES39Qfmp+J5DHPHAcpRGdjld5v2IE1+9
         Yd2QGNLfp34t3Vpyx9qr/Yo5A6Tm9jSh0aCD2fYnMLgN3ZubEGU5TeeB9PK6hkPtT3oE
         RzS4t4kQ9oElPARSDZ7dcqGqltu5y7r73aTxZGeMZtg3+l7Ak0uS3cct6kXVFvXysS9v
         3mb/8iws8WlaGeYDEh8OEkqkvxz3J+2yvbPWuAjyeZkC4jLpKO/1kiaJOKxqE6oLM1Fg
         BEt33kOZNqAvc0t1dF2QEJdtyNbVsIqr4D39m7RZI/sITxL5KI4i48PTdMV9jnbJQkNg
         M8Kw==
X-Gm-Message-State: AOJu0Yx6a9kbDrB+8u5WyE/2vQ8dnc2VxQJHeZ8Qc2f4yvjJrJonpT3P
	0SNDNA04F8zItrnnYczFN9bklocnrDaEHwu+ntCRvf8qRp1HL7K5dqqhwa6v96DTuyZZlE26zuC
	Ju06N
X-Gm-Gg: AY/fxX7YGM/ReNDYbhv5Q+1dY0wbygACAio9B8q3zgY10ruPkzh2N/Y9IWgTe6z8xAS
	ha5jB13FEk5wAWkhmCj/7EfTJE45aKvDQ04xU5/k4/3Bi2vSYoPyAfyn44fn2kKZGbrIvKHTmQu
	RO0Jh/lK8VBxMcW+D5DFWN5iHHsbeiFb5qjeH4rUrCueIbVTmFpif02FN1tEVrgGzkHeBcGfvYT
	OcCOBSxrPL6wQpIivRh070Ao+7WsIYKjOxCCU849Vc1z28sH76LCQIw2OCH/jspHJe/4LASS3Sq
	hVnnKemXk7AzUIWRqLelbWiYYCIMmlH8/cF03CrPPh68cQtJSbZeHvib68TCaxkXR+tiotDGRK+
	5JjaQJlcooPIiZSpvinBqE/OMWnxqbG3+TmbAMJzd68kGG1ZJz47mfqzXFfomhgFqO/X6FwxlA3
	yx54YN14Twi8LD
X-Google-Smtp-Source: AGHT+IE1tAz9vCHZ3YnmfjslzY4IGlfmDpbmtAkT7tv2uNe6A+91d3e4zZCIEXVl/hq5NjNNTFN0RA==
X-Received: by 2002:a17:902:fc46:b0:2a0:9411:e8c0 with SMTP id d9443c01a7336-2a2f272bd84mr156414525ad.32.1766525181997;
        Tue, 23 Dec 2025 13:26:21 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:74b3:f61b:a7a7:fafc])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3c6a80esm133756765ad.8.2025.12.23.13.26.20
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 13:26:21 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 08/10] libsoup: fix CVE-2025-12105
Date: Tue, 23 Dec 2025 13:25:59 -0800
Message-ID: <86ea41fa42aeff0789932a9eea480d05454efe01.1766525021.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1766525021.git.steve@sakoman.com>
References: <cover.1766525021.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Dec 2025 21:26:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228501

From: Changqing Li <changqing.li@windriver.com>

Refer:
https://gitlab.gnome.org/GNOME/libsoup/-/merge_requests/481

Signed-off-by: Changqing Li <changqing.li@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libsoup/libsoup/CVE-2025-12105.patch      | 34 +++++++++++++++++++
 meta/recipes-support/libsoup/libsoup_3.0.7.bb |  1 +
 2 files changed, 35 insertions(+)
 create mode 100644 meta/recipes-support/libsoup/libsoup/CVE-2025-12105.patch

diff --git a/meta/recipes-support/libsoup/libsoup/CVE-2025-12105.patch b/meta/recipes-support/libsoup/libsoup/CVE-2025-12105.patch
new file mode 100644
index 0000000000..99b2937922
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup/CVE-2025-12105.patch
@@ -0,0 +1,34 @@
+From 465410f833e4288ad053b4e18d5fa6c3be3148e1 Mon Sep 17 00:00:00 2001
+From: Eugene Mutavchi <Ievgen_Mutavchi@comcast.com>
+Date: Fri, 10 Oct 2025 16:24:27 +0000
+Subject: [PATCH] fix 'heap-use-after-free' caused by 'finishing' queue item
+ twice
+
+CVE: CVE-2025-12105
+Upsteam-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/commit/9ba1243a24e442fa5ec44684617a4480027da960]
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ libsoup/soup-session.c | 6 ++++--
+ 1 file changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/libsoup/soup-session.c b/libsoup/soup-session.c
+index 5f2929f..b9f3e42 100644
+--- a/libsoup/soup-session.c
++++ b/libsoup/soup-session.c
+@@ -3093,8 +3093,10 @@ run_until_read_done (SoupMessage          *msg,
+ 		if (soup_message_io_in_progress (msg))
+ 			soup_message_io_finished (msg);
+ 		item->paused = FALSE;
+-		item->state = SOUP_MESSAGE_FINISHING;
+-		soup_session_process_queue_item (item->session, item, NULL, FALSE);
++		if (item->state != SOUP_MESSAGE_FINISHED) {
++			item->state = SOUP_MESSAGE_FINISHING;
++			soup_session_process_queue_item (item->session, item, NULL, FALSE);
++		}
+ 	}
+ 	async_send_request_return_result (item, NULL, error);
+ }
+-- 
+2.34.1
+
diff --git a/meta/recipes-support/libsoup/libsoup_3.0.7.bb b/meta/recipes-support/libsoup/libsoup_3.0.7.bb
index af8554aa78..0f82736727 100644
--- a/meta/recipes-support/libsoup/libsoup_3.0.7.bb
+++ b/meta/recipes-support/libsoup/libsoup_3.0.7.bb
@@ -45,6 +45,7 @@ SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz \
            file://CVE-2025-46421.patch \
            file://CVE-2025-4948.patch \
            file://CVE-2025-4945.patch \
+           file://CVE-2025-12105.patch \
           "
 SRC_URI[sha256sum] = "ebdf90cf3599c11acbb6818a9d9e3fc9d2c68e56eb829b93962972683e1bf7c8"
 
-- 
2.43.0


