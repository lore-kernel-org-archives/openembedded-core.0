Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85EF2C25B7A
	for <webhook@archiver.kernel.org>; Mon, 13 May 2024 12:18:29 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web11.58753.1715602703542971906
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 May 2024 05:18:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=yrflp0Xn;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.181, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-1ecc23e6c9dso26917435ad.2
        for <openembedded-core@lists.openembedded.org>; Mon, 13 May 2024 05:18:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1715602703; x=1716207503; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0PwwVO16PUEiypLLYTxQ73kQYnxeuDUJ+Wi6kkC3TMU=;
        b=yrflp0XnYAJapjA/+H/H52ibwVBCK6cqoUWN3H1UpQuGGyak1LCSsurl8dtufvA2ku
         qedY3+kXfnLcsEOXqIP4RbnEhrG/x2rVuJQcc9UR7EM7d2kEjsugChy9qebWR8PQhTmv
         N9d5jxt36FsMLjt4nS7kEYQXyXgOZta/DBFJg0Suc3DvycO9k5QUhhD157CVB84M4ujo
         G9Dcr/G8G0imHnFVQRdDKwid0uW0wlBbnvjzG4zClaQvVvQoE0KX+CGRAHBUe5cSeDao
         AvJKc8eNjMccRjhR1pBV2iu8gThUyuk8DfMoukuREUIgOYFXh5/2W8mlyrcxWz+OBzkL
         s0zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715602703; x=1716207503;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0PwwVO16PUEiypLLYTxQ73kQYnxeuDUJ+Wi6kkC3TMU=;
        b=EUiADc6icuqRdT7br1us3sbDRCGC1NPHJNctOErzom7G7HaS0Enafokr2d1APq5sPR
         /qmgQgRXFlcUUQWvAaHn7aHaBcvTW4aezVsZjI/lY6GyqISltae5WbNomugzD/mS9Uye
         QmI1LP57MLZcvEudd1QmkuercqOjZFlhJAHB7bN8+t1iDDgI6YL00copHbugmjiP1euQ
         Ryda5hNeRf5I0I2AGT3TvBNnG57zQNKuv1klop8SuNqNwrZnoM+espZi6HNmby4q4dHB
         ybPAI6Ffd021OG50yS9YgmRLPpTk2TL90w8qniJ9d22741btcrcGtxEYdKy4nIElZ6Tr
         TUsg==
X-Gm-Message-State: AOJu0YyN5djR0jaNzY/0encj/ysw2FHCGpD+0s5M1DbDzs7KVj1dc4Q3
	6uGGZWdVmfaNsWbR8J2hlmBJqghEap0GwY+aO+wx8HLH+O7RtaDZ2Rs8puZonlHTypm/+SPbmhj
	Hhi8=
X-Google-Smtp-Source: AGHT+IG3VZopxoKgMzAESOtR41QqgSCTZwFQqx08wRyKLC9WxGjCPL+NFR6Z5g3c6FsCG8S6tvT52g==
X-Received: by 2002:a17:902:a389:b0:1e9:6609:37d4 with SMTP id d9443c01a7336-1ef43d0a0a4mr85795935ad.9.1715602702625;
        Mon, 13 May 2024 05:18:22 -0700 (PDT)
Received: from xps13.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ef0bf30b85sm77599225ad.181.2024.05.13.05.18.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 May 2024 05:18:22 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 3/6] bluez5: Fix CVE-2023-27349 CVE-2023-50229 & CVE-2023-50230
Date: Mon, 13 May 2024 05:18:09 -0700
Message-Id: <adaebd54ea6f53bfbc093c3bdac4f02b0975cb15.1715602539.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1715602539.git.steve@sakoman.com>
References: <cover.1715602539.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 May 2024 12:18:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199235

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport
[https://github.com/bluez/bluez/commit/f54299a850676d92c3dafd83e9174fcfe420ccc9
&
https://github.com/bluez/bluez/commit/5ab5352531a9cc7058cce569607f3a6831464443]

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.34.1


