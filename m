Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D93EFC25B10
	for <webhook@archiver.kernel.org>; Fri, 10 May 2024 07:00:21 +0000 (UTC)
Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
 by mx.groups.io with SMTP id smtpd.web11.6937.1715324413120170419
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 May 2024 00:00:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=Ylhnp8yX;
 spf=pass (domain: mvista.com, ip: 209.85.161.48, mailfrom: vanusuri@mvista.com)
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-5b28c209095so92554eaf.0
        for <openembedded-core@lists.openembedded.org>; Fri, 10 May 2024 00:00:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1715324412; x=1715929212; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0r0ur5+l0FClLcLtiiKZaRhrcXkTt8eCCPnk5eJ/7/8=;
        b=Ylhnp8yX1bcVbgqnZbUkj+z2P9h7lj7mhfIBwX3IFJt30gz4VoEjr6IvhmgX9DMXUY
         gDAAPsJPs5E5zHWwLT0YBoo+cZXvsW9Pr3pnpcOZ/oh9awDZZPY2J8MJVYmM+94nquLW
         djcz4orYy/BiVr+s7OS2foV/rrsON7dcQlMtQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715324412; x=1715929212;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0r0ur5+l0FClLcLtiiKZaRhrcXkTt8eCCPnk5eJ/7/8=;
        b=JDhDh3JxUXh1jkZy3qfMCxe8cjUfh8a+5phebJ5xp249CM29hwWUAac3oyf4rhe6F5
         iikxZUUfrd/0qeSvogxXL3rr6uLcmKn74ZqIR3q4Z0qyc9wNr9txR2bOwxBYRTUQNsDB
         9HshSbf8l53dvD424bZbB9FaG2fT6+I+znxoSzPsxpb+kzpl89JX+6XMCbpJT4efebu2
         QHMwo0g+rX9giFmKhm3XHlLgBO9yU3UXMh8H5znjcYs+scMC3/W+AYLN7ZG0sPA79sSO
         XfI6gxkTgu/3+poxkykqHpjk7CCt9xRxjcE5q3eh/1IhfIcLFjKSkRyAJ9tXD0D78dc3
         Cz5g==
X-Gm-Message-State: AOJu0YzvY4YBVH1AWNbPhovj8BtHi68cTU/pMo4yD394Wg2auTGWavCt
	eQgLGXH/uFD89WMYztyLJhfxXWjYktjGJbwwHfUA3ChH7z/n2zh0amfnKVcm2T5ZVraMvuZQ4lt
	grvk=
X-Google-Smtp-Source: AGHT+IEAV5veXvKeRXbwkrD8gU+GQf6QyT0egk1G1Urio7C3rBC7Tz5Rr5QujBjqZVc2gbpS1z2N4w==
X-Received: by 2002:a4a:5581:0:b0:5ac:da5a:3198 with SMTP id 006d021491bc7-5b2819b295bmr1806165eaf.6.1715324411923;
        Fri, 10 May 2024 00:00:11 -0700 (PDT)
Received: from MVIN00020.mvista.com ([2401:4900:882d:9a7a:1286:c90b:57b3:b7bc])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-5b26dec43b2sm597254eaf.43.2024.05.10.00.00.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 May 2024 00:00:11 -0700 (PDT)
From: vanusuri@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][kirkstone][PATCH] bluez5: Fix CVE-2023-27349 CVE-2023-50229 & CVE-2023-50230
Date: Fri, 10 May 2024 12:30:02 +0530
Message-Id: <20240510070002.4814-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 May 2024 07:00:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199191

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport
[https://github.com/bluez/bluez/commit/f54299a850676d92c3dafd83e9174fcfe420ccc9
&
https://github.com/bluez/bluez/commit/5ab5352531a9cc7058cce569607f3a6831464443]

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 meta/recipes-connectivity/bluez5/bluez5.inc   |  2 +
 .../bluez5/bluez5/CVE-2023-27349.patch        | 48 +++++++++++++
 .../CVE-2023-50229_CVE-2023-50230.patch       | 67 +++++++++++++++++++
 3 files changed, 117 insertions(+)
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5/CVE-2023-27349.patch
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5/CVE-2023-50229_CVE-2023-50230.patch

diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-connectivity/bluez5/bluez5.inc
index 7786b65670..97193a5f1c 100644
--- a/meta/recipes-connectivity/bluez5/bluez5.inc
+++ b/meta/recipes-connectivity/bluez5/bluez5.inc
@@ -55,6 +55,8 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/bluetooth/bluez-${PV}.tar.xz \
            file://0001-tests-add-a-target-for-building-tests-without-runnin.patch \
            file://0001-test-gatt-Fix-hung-issue.patch \
 	   file://CVE-2023-45866.patch \
+	   file://CVE-2023-27349.patch \
+	   file://CVE-2023-50229_CVE-2023-50230.patch \
            "
 S = "${WORKDIR}/bluez-${PV}"
 
diff --git a/meta/recipes-connectivity/bluez5/bluez5/CVE-2023-27349.patch b/meta/recipes-connectivity/bluez5/bluez5/CVE-2023-27349.patch
new file mode 100644
index 0000000000..946208099a
--- /dev/null
+++ b/meta/recipes-connectivity/bluez5/bluez5/CVE-2023-27349.patch
@@ -0,0 +1,48 @@
+From f54299a850676d92c3dafd83e9174fcfe420ccc9 Mon Sep 17 00:00:00 2001
+From: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
+Date: Wed, 22 Mar 2023 11:34:24 -0700
+Subject: [PATCH] avrcp: Fix crash while handling unsupported events
+
+The following crash can be observed if the remote peer send and
+unsupported event:
+
+ERROR: AddressSanitizer: heap-use-after-free on address 0x60b000148f11
+ at pc 0x559644552088 bp 0x7ffe28b3c7b0 sp 0x7ffe28b3c7a0
+ WRITE of size 1 at 0x60b000148f11 thread T0
+     #0 0x559644552087 in avrcp_handle_event profiles/audio/avrcp.c:3907
+     #1 0x559644536c22 in control_response profiles/audio/avctp.c:939
+     #2 0x5596445379ab in session_cb profiles/audio/avctp.c:1108
+     #3 0x7fbcb3e51c43 in g_main_context_dispatch (/lib/x86_64-linux-gnu/libglib-2.0.so.0+0x55c43)
+     #4 0x7fbcb3ea66c7  (/lib/x86_64-linux-gnu/libglib-2.0.so.0+0xaa6c7)
+     #5 0x7fbcb3e512b2 in g_main_loop_run (/lib/x86_64-linux-gnu/libglib-2.0.so.0+0x552b2)
+     #6 0x559644754ab6 in mainloop_run src/shared/mainloop-glib.c:66
+     #7 0x559644755606 in mainloop_run_with_signal src/shared/mainloop-notify.c:188
+     #8 0x5596445bb963 in main src/main.c:1289
+     #9 0x7fbcb3bafd8f in __libc_start_call_main ../sysdeps/nptl/libc_start_call_main.h:58
+     #10 0x7fbcb3bafe3f in __libc_start_main_impl ../csu/libc-start.c:392
+     #11 0x5596444e8224 in _start (/usr/local/libexec/bluetooth/bluetoothd+0xf0224)
+
+Upstream-Status: Backport [https://github.com/bluez/bluez/commit/f54299a850676d92c3dafd83e9174fcfe420ccc9]
+CVE: CVE-2023-27349
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ profiles/audio/avrcp.c | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/profiles/audio/avrcp.c b/profiles/audio/avrcp.c
+index 80f34c7a77..dda9a303fb 100644
+--- a/profiles/audio/avrcp.c
++++ b/profiles/audio/avrcp.c
+@@ -3901,6 +3901,12 @@ static gboolean avrcp_handle_event(struct avctp *conn, uint8_t code,
+ 	case AVRCP_EVENT_UIDS_CHANGED:
+ 		avrcp_uids_changed(session, pdu);
+ 		break;
++	default:
++		if (event > AVRCP_EVENT_LAST) {
++			warn("Unsupported event: %u", event);
++			return FALSE;
++		}
++		break;
+ 	}
+ 
+ 	session->registered_events |= (1 << event);
diff --git a/meta/recipes-connectivity/bluez5/bluez5/CVE-2023-50229_CVE-2023-50230.patch b/meta/recipes-connectivity/bluez5/bluez5/CVE-2023-50229_CVE-2023-50230.patch
new file mode 100644
index 0000000000..92684d8210
--- /dev/null
+++ b/meta/recipes-connectivity/bluez5/bluez5/CVE-2023-50229_CVE-2023-50230.patch
@@ -0,0 +1,67 @@
+From 5ab5352531a9cc7058cce569607f3a6831464443 Mon Sep 17 00:00:00 2001
+From: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
+Date: Tue, 19 Sep 2023 12:14:01 -0700
+Subject: [PATCH] pbap: Fix not checking Primary/Secundary Counter length
+
+Primary/Secundary Counters are supposed to be 16 bytes values, if the
+server has implemented them incorrectly it may lead to the following
+crash:
+
+=================================================================
+==31860==ERROR: AddressSanitizer: heap-buffer-overflow on address
+0x607000001878 at pc 0x7f95a1575638 bp 0x7fff58c6bb80 sp 0x7fff58c6b328
+
+ READ of size 48 at 0x607000001878 thread T0
+     #0 0x7f95a1575637 in MemcmpInterceptorCommon(void*, int (*)(void const*, void const*, unsigned long), void const*, void const*, unsigned long) ../../../../src/libsanitizer/sanitizer_common/sanitizer_common_interceptors.inc:860
+     #1 0x7f95a1575ba6 in __interceptor_memcmp ../../../../src/libsanitizer/sanitizer_common/sanitizer_common_interceptors.inc:892
+     #2 0x7f95a1575ba6 in __interceptor_memcmp ../../../../src/libsanitizer/sanitizer_common/sanitizer_common_interceptors.inc:887
+     #3 0x564df69c77a0 in read_version obexd/client/pbap.c:288
+     #4 0x564df69c77a0 in read_return_apparam obexd/client/pbap.c:352
+     #5 0x564df69c77a0 in phonebook_size_callback obexd/client/pbap.c:374
+     #6 0x564df69bea3c in session_terminate_transfer obexd/client/session.c:921
+     #7 0x564df69d56b0 in get_xfer_progress_first obexd/client/transfer.c:729
+     #8 0x564df698b9ee in handle_response gobex/gobex.c:1140
+     #9 0x564df698cdea in incoming_data gobex/gobex.c:1385
+     #10 0x7f95a12fdc43 in g_main_context_dispatch (/lib/x86_64-linux-gnu/libglib-2.0.so.0+0x55c43)
+     #11 0x7f95a13526c7  (/lib/x86_64-linux-gnu/libglib-2.0.so.0+0xaa6c7)
+     #12 0x7f95a12fd2b2 in g_main_loop_run (/lib/x86_64-linux-gnu/libglib-2.0.so.0+0x552b2)
+     #13 0x564df6977d41 in main obexd/src/main.c:307
+     #14 0x7f95a10a7d8f in __libc_start_call_main ../sysdeps/nptl/libc_start_call_main.h:58
+     #15 0x7f95a10a7e3f in __libc_start_main_impl ../csu/libc-start.c:392
+     #16 0x564df6978704 in _start (/usr/local/libexec/bluetooth/obexd+0x8b704)
+ 0x607000001878 is located 0 bytes to the right of 72-byte region [0x607000001830,0x607000001878)
+
+ allocated by thread T0 here:
+     #0 0x7f95a1595a37 in __interceptor_calloc ../../../../src/libsanitizer/asan/asan_malloc_linux.cpp:154
+     #1 0x564df69c8b6a in pbap_probe obexd/client/pbap.c:1259
+
+Upstream-Status: Backport [https://github.com/bluez/bluez/commit/5ab5352531a9cc7058cce569607f3a6831464443]
+CVE: CVE-2023-50229 CVE-2023-50230
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ obexd/client/pbap.c | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/obexd/client/pbap.c b/obexd/client/pbap.c
+index 1ed8c68ecc..2d2aa95089 100644
+--- a/obexd/client/pbap.c
++++ b/obexd/client/pbap.c
+@@ -285,7 +285,7 @@ static void read_version(struct pbap_data *pbap, GObexApparam *apparam)
+ 		data = value;
+ 	}
+ 
+-	if (memcmp(pbap->primary, data, len)) {
++	if (len == sizeof(pbap->primary) && memcmp(pbap->primary, data, len)) {
+ 		memcpy(pbap->primary, data, len);
+ 		g_dbus_emit_property_changed(conn,
+ 					obc_session_get_path(pbap->session),
+@@ -299,7 +299,8 @@ static void read_version(struct pbap_data *pbap, GObexApparam *apparam)
+ 		data = value;
+ 	}
+ 
+-	if (memcmp(pbap->secondary, data, len)) {
++	if (len == sizeof(pbap->secondary) &&
++			memcmp(pbap->secondary, data, len)) {
+ 		memcpy(pbap->secondary, data, len);
+ 		g_dbus_emit_property_changed(conn,
+ 					obc_session_get_path(pbap->session),
-- 
2.25.1


