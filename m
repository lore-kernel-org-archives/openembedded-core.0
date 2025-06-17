Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B485BC7115E
	for <webhook@archiver.kernel.org>; Tue, 17 Jun 2025 16:00:12 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web10.23014.1750176012084381297
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Jun 2025 09:00:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=NdxcsiRc;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.52, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-311c95ddfb5so4867484a91.2
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Jun 2025 09:00:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1750176011; x=1750780811; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rZEUPV95q6vGcuN8DRzlEV469h6ocmGDM5L6+pFuBrg=;
        b=NdxcsiRcD8PQYKHbs5TSRIecPlT3cqzdYqfUB2qVsLbUYpcjjSvEqU0c5vpQOy9ffM
         bljEYONMAuAAA5eNnAB5inE/4lVUHnF/G9fJRj5vrNOwA66atgNYwy3Wr9cXon/HEtEg
         P4ft4pwc7dGk3+BYIeSyPi3x7JUWrpYkrS4icGEbhFZ1TrqAAHiwIjbEWruUfcIE1ZbM
         23+ZKHs8rE1MVwkUnLgbnqPgl5EXCa5Q5pfQ8rBM7Uondku1AAMzdYOUxzqIP+xfGcoc
         oCFBjPtoGINkrpx+uo49otvMbo+OceplL3b4/YzHH/tXZfuk0SXZXffzoggyqGjAAgha
         Xr1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750176011; x=1750780811;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rZEUPV95q6vGcuN8DRzlEV469h6ocmGDM5L6+pFuBrg=;
        b=sD/LsIuFd7Uq1vODEarTIoPSqFs/IYEcV5yxM36zeKuWiqbUj59YRzLzSE2LQc3AAU
         cvOsLP4ea3wYxuC38TCnxwrQ55jRi4HDFtbLBdsIwP/2JVLcm4AR4RTE1tCzsAXPRx34
         tx0ZfcGN/V6s8TofmTvRAkJp10/8I5wqDI1Qh/UIrVRcay/tS4JPUax0JjPBaRcNIvjY
         0ZpUvZjYISmAdXz6PFZpc7DI0quvNrtv2ERgasrt2/fMHfNhrmrgqXNAMhyb/RxoA1ct
         ZhYu4LPIQVpKR14x7nsNDSBlIpkglRF/updN7QQXN1WYqG7Uc4wAfhAb18F4w3X5Bk+A
         Fl5g==
X-Gm-Message-State: AOJu0Ywi2t+1A85oSIDMTpn+7zkmXBdfMi4a3silXCL+A1skXpG2bYhh
	SmVbj0KzoczJrkvi3QZzYxT4SOPuefWMbKlFxec92cWVaF+uG/QDwg5vIok8IPmQ6oiO5/P1X8f
	26vVc
X-Gm-Gg: ASbGncutzZNJYoAIGDOmbQ5eDds3SteYNPKMDNV9DtRw7mwdh2aw/xGQFNvQr9Qkxj6
	WOxdwvQVXioVgvNcF2C48fhQVv5G2y/rXtr7AF+SC+S9hesA7NDvrt8Ey4qTYiTm2XywljabIFv
	0RAClPP/v+6jzkJLZiomYbODMasH4KWdoYIqVXQV5pgV8PnshUgGn9r2W75/QlS/ZoWV+cgl7El
	l6Z8zAJZ0OEnHFlmPa1rjR+37fD/YhOUNBjHGdoxImmYc56KpIrWh2phYsG+iE32lRPmPet2DNA
	zxu7d5X1rrGsz7Ywo2YDABDtn/JJAGSUYHeXpTcPAPjf2Il7eVz/9w==
X-Google-Smtp-Source: AGHT+IE/HOoTDE2Ov/iw7MCs4U3FNb31FwKH0poEGJKAGN4RNlN8XVVLSzGFy4LV/teKPTtdCxFx8g==
X-Received: by 2002:a17:90b:1a86:b0:313:271a:af56 with SMTP id 98e67ed59e1d1-313f1def22bmr20055903a91.30.1750176010320;
        Tue, 17 Jun 2025 09:00:10 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:7ce4:2bd1:2434:c118])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365dea7d82sm81475515ad.146.2025.06.17.09.00.08
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 09:00:09 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar 05/12] kea: upgrade 2.6.1 -> 2.6.3
Date: Tue, 17 Jun 2025 08:59:45 -0700
Message-ID: <76caa09552d5f7baab40d5259ac1a3eaee37e6bd.1750175857.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1750175857.git.steve@sakoman.com>
References: <cover.1750175857.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Jun 2025 16:00:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218893

From: Yi Zhao <yi.zhao@windriver.com>

ReleaseNotes:
https://downloads.isc.org/isc/kea/2.6.2/Kea-2.6.2-ReleaseNotes.txt
https://downloads.isc.org/isc/kea/2.6.3/Kea-2.6.3-ReleaseNotes.txt

Security fixes:
CVE-2025-32801
CVE-2025-32802
CVE-2025-32803

License-Update: Update copyright years

* Drop backport patches.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../0001-Avoid-assert-on-empty-packet.patch   | 148 --------------
 ...me-NameString-with-vector-of-uint8_t.patch |  90 ---------
 .../0001-Update-asiolink-for-boost-1.87.patch | 190 ------------------
 ...po-in-Name-Name-append-to-ndata_-not.patch |  36 ----
 .../kea/{kea_2.6.1.bb => kea_2.6.3.bb}        |   8 +-
 5 files changed, 2 insertions(+), 470 deletions(-)
 delete mode 100644 meta/recipes-connectivity/kea/files/0001-Avoid-assert-on-empty-packet.patch
 delete mode 100644 meta/recipes-connectivity/kea/files/0001-Replace-Name-NameString-with-vector-of-uint8_t.patch
 delete mode 100644 meta/recipes-connectivity/kea/files/0001-Update-asiolink-for-boost-1.87.patch
 delete mode 100644 meta/recipes-connectivity/kea/files/0002-Fix-unittests-Typo-in-Name-Name-append-to-ndata_-not.patch
 rename meta/recipes-connectivity/kea/{kea_2.6.1.bb => kea_2.6.3.bb} (87%)

diff --git a/meta/recipes-connectivity/kea/files/0001-Avoid-assert-on-empty-packet.patch b/meta/recipes-connectivity/kea/files/0001-Avoid-assert-on-empty-packet.patch
deleted file mode 100644
index 14f3424570..0000000000
--- a/meta/recipes-connectivity/kea/files/0001-Avoid-assert-on-empty-packet.patch
+++ /dev/null
@@ -1,148 +0,0 @@
-From 9cf3b6e8d705957927c2fbc9928318f4eda265c8 Mon Sep 17 00:00:00 2001
-From: Thomas Markwalder <tmark@isc.org>
-Date: Tue, 11 Feb 2025 18:52:41 +0000
-Subject: [PATCH 1/2] Avoid assert on empty packet
-
-/src/lib/dhcp/pkt_filter_lpf.cc
-    PktFilterLPF::receive() - throw if packet has no data
-
-/src/lib/util/buffer.h
-    InputBuffer::readVecotr() - avoid peek if read request length is 0
-
-/src/lib/util/tests/buffer_unittest.cc
-    Updated test
-
-Upstream-Status: Backport
-[https://gitlab.isc.org/isc-projects/kea/-/commit/0b98eae16d9b6ecdf57005624712b9b26fa05bc0]
-[https://gitlab.isc.org/isc-projects/kea/-/commit/16306026e37b32a2ce4b16fb5b78561ae153d570]
-
-Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
----
- src/lib/dhcp/pkt_filter_lpf.cc        | 10 +++++++---
- src/lib/util/buffer.h                 |  9 ++++++---
- src/lib/util/tests/buffer_unittest.cc |  8 +++++++-
- 3 files changed, 20 insertions(+), 7 deletions(-)
-
-diff --git a/src/lib/dhcp/pkt_filter_lpf.cc b/src/lib/dhcp/pkt_filter_lpf.cc
-index 69bdecc0e1..b0c8f108d3 100644
---- a/src/lib/dhcp/pkt_filter_lpf.cc
-+++ b/src/lib/dhcp/pkt_filter_lpf.cc
-@@ -318,9 +318,14 @@ PktFilterLPF::receive(Iface& iface, const SocketInfo& socket_info) {
-     decodeEthernetHeader(buf, dummy_pkt);
-     decodeIpUdpHeader(buf, dummy_pkt);
- 
-+    auto v4_len = buf.getLength() - buf.getPosition();
-+    if (v4_len <= 0) {
-+        isc_throw(SocketReadError, "Pkt4FilterLpf:: packet has no DHCPv4 data");
-+    }
-+
-     // Read the DHCP data.
-     std::vector<uint8_t> dhcp_buf;
--    buf.readVector(dhcp_buf, buf.getLength() - buf.getPosition());
-+    buf.readVector(dhcp_buf, v4_len);
- 
-     // Decode DHCP data into the Pkt4 object.
-     Pkt4Ptr pkt = Pkt4Ptr(new Pkt4(&dhcp_buf[0], dhcp_buf.size()));
-@@ -344,8 +349,7 @@ PktFilterLPF::receive(Iface& iface, const SocketInfo& socket_info) {
- 
-             struct timeval cmsg_time;
-             memcpy(&cmsg_time, CMSG_DATA(cmsg), sizeof(cmsg_time));
--            pkt->addPktEvent(PktEvent::SOCKET_RECEIVED, cmsg_time);
--            break;
-+            pkt->addPktEvent(PktEvent::SOCKET_RECEIVED, cmsg_time); break;
-         }
- 
-         cmsg = CMSG_NXTHDR(&m, cmsg);
-diff --git a/src/lib/util/buffer.h b/src/lib/util/buffer.h
-index 41ecdf3375..c426a14495 100644
---- a/src/lib/util/buffer.h
-+++ b/src/lib/util/buffer.h
-@@ -1,4 +1,4 @@
--// Copyright (C) 2009-2024 Internet Systems Consortium, Inc. ("ISC")
-+// Copyright (C) 2009-2025 Internet Systems Consortium, Inc. ("ISC")
- //
- // This Source Code Form is subject to the terms of the Mozilla Public
- // License, v. 2.0. If a copy of the MPL was not distributed with this
-@@ -233,7 +233,8 @@ public:
-     /// @details If specified buffer is too short, it will be expanded using
-     /// vector::resize() method. If the remaining length of the buffer
-     /// is smaller than the specified length, an exception of class
--    /// @c isc::OutOfRange will be thrown.
-+    /// @c isc::OutOfRange will be thrown.  Read length zero results
-+    /// in an empty vector.
-     ///
-     /// @param data Reference to a buffer (data will be stored there).
-     /// @param len Size specified number of bytes to read in a vector.
-@@ -244,7 +245,9 @@ public:
-         }
- 
-         data.resize(len);
--        peekData(&data[0], len);
-+        if (len) {
-+            peekData(&data[0], len);
-+        }
-     }
- 
-     /// @brief Read specified number of bytes as a vector.
-diff --git a/src/lib/util/tests/buffer_unittest.cc b/src/lib/util/tests/buffer_unittest.cc
-index 66c43e8f21..bae051dd16 100644
---- a/src/lib/util/tests/buffer_unittest.cc
-+++ b/src/lib/util/tests/buffer_unittest.cc
-@@ -1,4 +1,4 @@
--// Copyright (C) 2009-2024 Internet Systems Consortium, Inc. ("ISC")
-+// Copyright (C) 2009-2025 Internet Systems Consortium, Inc. ("ISC")
- //
- // This Source Code Form is subject to the terms of the Mozilla Public
- // License, v. 2.0. If a copy of the MPL was not distributed with this
-@@ -197,6 +197,12 @@ TEST_F(BufferTest, inputBufferRead) {
-     ASSERT_EQ(sizeof(vdata), datav.size());
-     ASSERT_EQ(0, memcmp(&vdata[0], testdata, sizeof(testdata)));
-     ASSERT_EQ(sizeof(vdata), ibuffer.getPosition());
-+
-+    // Verify that read len of zero results in an empty
-+    // vector without throwing.
-+    datav.resize(8);
-+    ASSERT_NO_THROW(ibuffer.readVector(datav, 0));
-+    ASSERT_EQ(datav.size(), 0);
- }
- 
- TEST_F(BufferTest, outputBufferReadAt) {
--- 
-2.25.1
-
-From 614a6c136fc20ee428b1c880889ef61253657499 Mon Sep 17 00:00:00 2001
-From: Thomas Markwalder <tmark@isc.org>
-Date: Tue, 18 Feb 2025 15:03:12 +0000
-Subject: [PATCH 2/2] Addressed review comments
-
-Couple of typos fixed.
----
- src/lib/dhcp/pkt_filter_lpf.cc | 5 +++--
- 1 file changed, 3 insertions(+), 2 deletions(-)
-
-diff --git a/src/lib/dhcp/pkt_filter_lpf.cc b/src/lib/dhcp/pkt_filter_lpf.cc
-index b0c8f108d3..3642915cc1 100644
---- a/src/lib/dhcp/pkt_filter_lpf.cc
-+++ b/src/lib/dhcp/pkt_filter_lpf.cc
-@@ -320,7 +320,7 @@ PktFilterLPF::receive(Iface& iface, const SocketInfo& socket_info) {
- 
-     auto v4_len = buf.getLength() - buf.getPosition();
-     if (v4_len <= 0) {
--        isc_throw(SocketReadError, "Pkt4FilterLpf:: packet has no DHCPv4 data");
-+        isc_throw(SocketReadError, "Pkt4FilterLpf packet has no DHCPv4 data");
-     }
- 
-     // Read the DHCP data.
-@@ -349,7 +349,8 @@ PktFilterLPF::receive(Iface& iface, const SocketInfo& socket_info) {
- 
-             struct timeval cmsg_time;
-             memcpy(&cmsg_time, CMSG_DATA(cmsg), sizeof(cmsg_time));
--            pkt->addPktEvent(PktEvent::SOCKET_RECEIVED, cmsg_time); break;
-+            pkt->addPktEvent(PktEvent::SOCKET_RECEIVED, cmsg_time);
-+            break;
-         }
- 
-         cmsg = CMSG_NXTHDR(&m, cmsg);
--- 
-2.25.1
-
diff --git a/meta/recipes-connectivity/kea/files/0001-Replace-Name-NameString-with-vector-of-uint8_t.patch b/meta/recipes-connectivity/kea/files/0001-Replace-Name-NameString-with-vector-of-uint8_t.patch
deleted file mode 100644
index a7deeca243..0000000000
--- a/meta/recipes-connectivity/kea/files/0001-Replace-Name-NameString-with-vector-of-uint8_t.patch
+++ /dev/null
@@ -1,90 +0,0 @@
-From 6b9fb56e3573aa65923df9a08201dd5321a1b1f1 Mon Sep 17 00:00:00 2001
-From: Dimitry Andric <dimitry@andric.com>
-Date: Sat, 3 Aug 2024 14:37:52 +0200
-Subject: [PATCH 1/2] Replace Name::NameString with vector of uint8_t
-
-As noted in the libc++ 19 release notes, it now only provides
-std::char_traits<> for types char, char8_t, char16_t, char32_t and
-wchar_t, and any instantiation for other types will fail.
-
-Name::NameString is defined as a std::basic_string<uint8_t>, so that
-will no longer work. Redefine it as a std::vector<uint8_t> instead.
-
-Upstream-Status: Submitted [https://gitlab.isc.org/isc-projects/kea/-/merge_requests/2410]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/lib/dns/name.cc | 12 ++++++------
- src/lib/dns/name.h  |  2 +-
- 2 files changed, 7 insertions(+), 7 deletions(-)
-
-diff --git a/src/lib/dns/name.cc b/src/lib/dns/name.cc
-index ac48205..085229b 100644
---- a/src/lib/dns/name.cc
-+++ b/src/lib/dns/name.cc
-@@ -303,7 +303,7 @@ Name::Name(const std::string &namestring, bool downcase) {
-     // And get the output
-     labelcount_ = offsets.size();
-     isc_throw_assert(labelcount_ > 0 && labelcount_ <= Name::MAX_LABELS);
--    ndata_.assign(ndata.data(), ndata.size());
-+    ndata_.assign(ndata.data(), ndata.data() + ndata.size());
-     length_ = ndata_.size();
-     offsets_.assign(offsets.begin(), offsets.end());
- }
-@@ -336,7 +336,7 @@ Name::Name(const char* namedata, size_t data_len, const Name* origin,
-     // Get the output
-     labelcount_ = offsets.size();
-     isc_throw_assert(labelcount_ > 0 && labelcount_ <= Name::MAX_LABELS);
--    ndata_.assign(ndata.data(), ndata.size());
-+    ndata_.assign(ndata.data(), ndata.data() + ndata.size());
-     length_ = ndata_.size();
-     offsets_.assign(offsets.begin(), offsets.end());
- 
-@@ -347,7 +347,7 @@ Name::Name(const char* namedata, size_t data_len, const Name* origin,
-         // Drop the last character of the data (the \0) and append a copy of
-         // the origin's data
-         ndata_.erase(ndata_.end() - 1);
--        ndata_.append(origin->ndata_);
-+        ndata_.insert(ndata.end(), origin->ndata_.begin(), origin->ndata_.end());
- 
-         // Do a similar thing with offsets. However, we need to move them
-         // so they point after the prefix we parsed before.
-@@ -582,7 +582,7 @@ Name::concatenate(const Name& suffix) const {
- 
-     Name retname;
-     retname.ndata_.reserve(length);
--    retname.ndata_.assign(ndata_, 0, length_ - 1);
-+    retname.ndata_.assign(ndata_.data(), ndata_.data() + length_ - 1);
-     retname.ndata_.insert(retname.ndata_.end(),
-                           suffix.ndata_.begin(), suffix.ndata_.end());
-     isc_throw_assert(retname.ndata_.size() == length);
-@@ -622,7 +622,7 @@ Name::reverse() const {
-     NameString::const_iterator n0 = ndata_.begin();
-     retname.offsets_.push_back(0);
-     while (rit1 != offsets_.rend()) {
--        retname.ndata_.append(n0 + *rit1, n0 + *rit0);
-+        retname.ndata_.insert(retname.ndata_.end(), n0 + *rit1, n0 + *rit0);
-         retname.offsets_.push_back(retname.ndata_.size());
-         ++rit0;
-         ++rit1;
-@@ -662,7 +662,7 @@ Name::split(const unsigned int first, const unsigned int n) const {
-     // original name, and append the trailing dot explicitly.
-     //
-     retname.ndata_.reserve(retname.offsets_.back() + 1);
--    retname.ndata_.assign(ndata_, offsets_[first], retname.offsets_.back());
-+    retname.ndata_.assign(ndata_.data() + offsets_[first], ndata_.data() + retname.offsets_.back());
-     retname.ndata_.push_back(0);
- 
-     retname.length_ = retname.ndata_.size();
-diff --git a/src/lib/dns/name.h b/src/lib/dns/name.h
-index 37723e8..fac0036 100644
---- a/src/lib/dns/name.h
-+++ b/src/lib/dns/name.h
-@@ -228,7 +228,7 @@ class Name {
-     //@{
- private:
-     /// \brief Name data string
--    typedef std::basic_string<uint8_t> NameString;
-+    typedef std::vector<uint8_t> NameString;
-     /// \brief Name offsets type
-     typedef std::vector<uint8_t> NameOffsets;
- 
diff --git a/meta/recipes-connectivity/kea/files/0001-Update-asiolink-for-boost-1.87.patch b/meta/recipes-connectivity/kea/files/0001-Update-asiolink-for-boost-1.87.patch
deleted file mode 100644
index 794726f1f1..0000000000
--- a/meta/recipes-connectivity/kea/files/0001-Update-asiolink-for-boost-1.87.patch
+++ /dev/null
@@ -1,190 +0,0 @@
-From dab0f3daafb760ace0d4091f74ff90edb225ca02 Mon Sep 17 00:00:00 2001
-From: q66 <q66@chimera-linux.org>
-Date: Sun, 15 Dec 2024 03:04:53 +0100
-Subject: [PATCH] Update asiolink for boost 1.87
-
-Upstream-Status: Submitted [https://gitlab.isc.org/isc-projects/kea/-/merge_requests/2523]
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
----
- src/lib/asiolink/io_address.cc         |  4 ++--
- src/lib/asiolink/io_service.cc         |  8 ++++----
- src/lib/asiolink/tcp_endpoint.h        |  2 +-
- src/lib/asiolink/udp_endpoint.h        |  2 +-
- src/lib/asiolink/unix_domain_socket.cc | 16 ++++++++--------
- src/lib/dhcp/iface_mgr.cc              |  2 +-
- 6 files changed, 17 insertions(+), 17 deletions(-)
-
-diff --git a/src/lib/asiolink/io_address.cc b/src/lib/asiolink/io_address.cc
-index 43459bf..06b7d3d 100644
---- a/src/lib/asiolink/io_address.cc
-+++ b/src/lib/asiolink/io_address.cc
-@@ -37,7 +37,7 @@ IOAddress::Hash::operator()(const IOAddress &io_address) const {
- // because we'd like to throw our own exception on failure.
- IOAddress::IOAddress(const std::string& address_str) {
-     boost::system::error_code err;
--    asio_address_ = ip::address::from_string(address_str, err);
-+    asio_address_ = ip::make_address(address_str, err);
-     if (err) {
-         isc_throw(IOError, "Failed to convert string to address '"
-                   << address_str << "': " << err.message());
-@@ -116,7 +116,7 @@ IOAddress::isV6Multicast() const {
- uint32_t
- IOAddress::toUint32() const {
-     if (asio_address_.is_v4()) {
--        return (asio_address_.to_v4().to_ulong());
-+        return (asio_address_.to_v4().to_uint());
-     } else {
-         isc_throw(BadValue, "Can't convert " << toText()
-                   << " address to IPv4.");
-diff --git a/src/lib/asiolink/io_service.cc b/src/lib/asiolink/io_service.cc
-index 411de64..cc28d24 100644
---- a/src/lib/asiolink/io_service.cc
-+++ b/src/lib/asiolink/io_service.cc
-@@ -30,7 +30,7 @@ public:
-     /// @brief The constructor.
-     IOServiceImpl() :
-         io_service_(),
--        work_(new boost::asio::io_service::work(io_service_)) {
-+        work_(boost::asio::make_work_guard(io_service_)) {
-     };
- 
-     /// @brief The destructor.
-@@ -92,7 +92,7 @@ public:
- 
-     /// @brief Restarts the IOService in preparation for a subsequent @ref run() invocation.
-     void restart() {
--        io_service_.reset();
-+        io_service_.restart();
-     }
- 
-     /// @brief Removes IO service work object to let it finish running
-@@ -115,12 +115,12 @@ public:
-     ///
-     /// @param callback The callback to be run on the IO service.
-     void post(const std::function<void ()>& callback) {
--        io_service_.post(callback);
-+        boost::asio::post(io_service_, callback);
-     }
- 
- private:
-     boost::asio::io_service io_service_;
--    boost::shared_ptr<boost::asio::io_service::work> work_;
-+    boost::asio::executor_work_guard<boost::asio::io_service::executor_type> work_;
- };
- 
- IOService::IOService() : io_impl_(new IOServiceImpl()) {
-diff --git a/src/lib/asiolink/tcp_endpoint.h b/src/lib/asiolink/tcp_endpoint.h
-index 8ebd575..7c8cb35 100644
---- a/src/lib/asiolink/tcp_endpoint.h
-+++ b/src/lib/asiolink/tcp_endpoint.h
-@@ -42,7 +42,7 @@ public:
-     /// \param port The TCP port number of the endpoint.
-     TCPEndpoint(const IOAddress& address, const unsigned short port) :
-         asio_endpoint_placeholder_(
--            new boost::asio::ip::tcp::endpoint(boost::asio::ip::address::from_string(address.toText()),
-+            new boost::asio::ip::tcp::endpoint(boost::asio::ip::make_address(address.toText()),
-                               port)),
-         asio_endpoint_(*asio_endpoint_placeholder_)
-     {}
-diff --git a/src/lib/asiolink/udp_endpoint.h b/src/lib/asiolink/udp_endpoint.h
-index f960bf3..2a3da9f 100644
---- a/src/lib/asiolink/udp_endpoint.h
-+++ b/src/lib/asiolink/udp_endpoint.h
-@@ -42,7 +42,7 @@ public:
-     /// \param port The UDP port number of the endpoint.
-     UDPEndpoint(const IOAddress& address, const unsigned short port) :
-         asio_endpoint_placeholder_(
--            new boost::asio::ip::udp::endpoint(boost::asio::ip::address::from_string(address.toText()),
-+            new boost::asio::ip::udp::endpoint(boost::asio::ip::make_address(address.toText()),
-                               port)),
-         asio_endpoint_(*asio_endpoint_placeholder_)
-     {}
-diff --git a/src/lib/asiolink/unix_domain_socket.cc b/src/lib/asiolink/unix_domain_socket.cc
-index f43e1c9..43ff3c8 100644
---- a/src/lib/asiolink/unix_domain_socket.cc
-+++ b/src/lib/asiolink/unix_domain_socket.cc
-@@ -83,7 +83,7 @@ public:
-     /// @param buffer Buffers holding the data to be sent.
-     /// @param handler User supplied callback to be invoked when data have
-     /// been sent or sending error is signalled.
--    void doSend(const boost::asio::const_buffers_1& buffer,
-+    void doSend(const boost::asio::const_buffer& buffer,
-                 const UnixDomainSocket::Handler& handler);
- 
- 
-@@ -103,7 +103,7 @@ public:
-     /// @param ec Error code returned as a result of sending the data.
-     /// @param length Length of the data sent.
-     void sendHandler(const UnixDomainSocket::Handler& remote_handler,
--                     const boost::asio::const_buffers_1& buffer,
-+                     const boost::asio::const_buffer& buffer,
-                      const boost::system::error_code& ec,
-                      size_t length);
- 
-@@ -127,7 +127,7 @@ public:
-     /// @param buffer A buffer into which the data should be received.
-     /// @param handler User supplied callback invoked when data have been
-     /// received on an error is signalled.
--    void doReceive(const boost::asio::mutable_buffers_1& buffer,
-+    void doReceive(const boost::asio::mutable_buffer& buffer,
-                    const UnixDomainSocket::Handler& handler);
- 
-     /// @brief Local handler invoked as a result of asynchronous receive.
-@@ -146,7 +146,7 @@ public:
-     /// @param ec Error code returned as a result of asynchronous receive.
-     /// @param length Size of the received data.
-     void receiveHandler(const UnixDomainSocket::Handler& remote_handler,
--                        const boost::asio::mutable_buffers_1& buffer,
-+                        const boost::asio::mutable_buffer& buffer,
-                         const boost::system::error_code& ec,
-                         size_t length);
- 
-@@ -197,7 +197,7 @@ UnixDomainSocketImpl::asyncSend(const void* data, const size_t length,
- }
- 
- void
--UnixDomainSocketImpl::doSend(const boost::asio::const_buffers_1& buffer,
-+UnixDomainSocketImpl::doSend(const boost::asio::const_buffer& buffer,
-                              const UnixDomainSocket::Handler& handler) {
-     auto local_handler = std::bind(&UnixDomainSocketImpl::sendHandler,
-                                    shared_from_this(),
-@@ -207,7 +207,7 @@ UnixDomainSocketImpl::doSend(const boost::asio::const_buffers_1& buffer,
- 
- void
- UnixDomainSocketImpl::sendHandler(const UnixDomainSocket::Handler& remote_handler,
--                                  const boost::asio::const_buffers_1& buffer,
-+                                  const boost::asio::const_buffer& buffer,
-                                   const boost::system::error_code& ec,
-                                   size_t length) {
-     // The asynchronous send may return EWOULDBLOCK or EAGAIN on some
-@@ -230,7 +230,7 @@ UnixDomainSocketImpl::asyncReceive(void* data, const size_t length,
- }
- 
- void
--UnixDomainSocketImpl::doReceive(const boost::asio::mutable_buffers_1& buffer,
-+UnixDomainSocketImpl::doReceive(const boost::asio::mutable_buffer& buffer,
-                                 const UnixDomainSocket::Handler& handler) {
-     auto local_handler = std::bind(&UnixDomainSocketImpl::receiveHandler,
-                                    shared_from_this(),
-@@ -240,7 +240,7 @@ UnixDomainSocketImpl::doReceive(const boost::asio::mutable_buffers_1& buffer,
- 
- void
- UnixDomainSocketImpl::receiveHandler(const UnixDomainSocket::Handler& remote_handler,
--                                     const boost::asio::mutable_buffers_1& buffer,
-+                                     const boost::asio::mutable_buffer& buffer,
-                                      const boost::system::error_code& ec,
-                                      size_t length) {
-     // The asynchronous receive may return EWOULDBLOCK or EAGAIN on some
-diff --git a/src/lib/dhcp/iface_mgr.cc b/src/lib/dhcp/iface_mgr.cc
-index 01a1d63..419268b 100644
---- a/src/lib/dhcp/iface_mgr.cc
-+++ b/src/lib/dhcp/iface_mgr.cc
-@@ -1034,7 +1034,7 @@ IfaceMgr::getLocalAddress(const IOAddress& remote_addr, const uint16_t port) {
-     }
- 
-     // Create socket that will be used to connect to remote endpoint.
--    boost::asio::io_service io_service;
-+    boost::asio::io_context io_service;
-     boost::asio::ip::udp::socket sock(io_service);
- 
-     boost::system::error_code err_code;
diff --git a/meta/recipes-connectivity/kea/files/0002-Fix-unittests-Typo-in-Name-Name-append-to-ndata_-not.patch b/meta/recipes-connectivity/kea/files/0002-Fix-unittests-Typo-in-Name-Name-append-to-ndata_-not.patch
deleted file mode 100644
index a24a25f1c9..0000000000
--- a/meta/recipes-connectivity/kea/files/0002-Fix-unittests-Typo-in-Name-Name-append-to-ndata_-not.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From b5f6cc6b3a2b2c35c9b9bb856861c502771079cc Mon Sep 17 00:00:00 2001
-From: Dimitry Andric <dimitry@unified-streaming.com>
-Date: Wed, 28 Aug 2024 22:32:44 +0200
-Subject: [PATCH 2/2] Fix unittests: * Typo in `Name::Name`: append to
- `ndata_`, not `ndata` * In `Name::split`, use the correct iterators for
- assigning
-
-Upstream-Status: Submitted [https://gitlab.isc.org/isc-projects/kea/-/merge_requests/2410]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/lib/dns/name.cc | 5 +++--
- 1 file changed, 3 insertions(+), 2 deletions(-)
-
-diff --git a/src/lib/dns/name.cc b/src/lib/dns/name.cc
-index 085229b..47d9b8f 100644
---- a/src/lib/dns/name.cc
-+++ b/src/lib/dns/name.cc
-@@ -347,7 +347,7 @@ Name::Name(const char* namedata, size_t data_len, const Name* origin,
-         // Drop the last character of the data (the \0) and append a copy of
-         // the origin's data
-         ndata_.erase(ndata_.end() - 1);
--        ndata_.insert(ndata.end(), origin->ndata_.begin(), origin->ndata_.end());
-+        ndata_.insert(ndata_.end(), origin->ndata_.begin(), origin->ndata_.end());
- 
-         // Do a similar thing with offsets. However, we need to move them
-         // so they point after the prefix we parsed before.
-@@ -662,7 +662,8 @@ Name::split(const unsigned int first, const unsigned int n) const {
-     // original name, and append the trailing dot explicitly.
-     //
-     retname.ndata_.reserve(retname.offsets_.back() + 1);
--    retname.ndata_.assign(ndata_.data() + offsets_[first], ndata_.data() + retname.offsets_.back());
-+    auto it = ndata_.data() + offsets_[first];
-+    retname.ndata_.assign(it, it + retname.offsets_.back());
-     retname.ndata_.push_back(0);
- 
-     retname.length_ = retname.ndata_.size();
diff --git a/meta/recipes-connectivity/kea/kea_2.6.1.bb b/meta/recipes-connectivity/kea/kea_2.6.3.bb
similarity index 87%
rename from meta/recipes-connectivity/kea/kea_2.6.1.bb
rename to meta/recipes-connectivity/kea/kea_2.6.3.bb
index ff7fb51fe0..45e98e516f 100644
--- a/meta/recipes-connectivity/kea/kea_2.6.1.bb
+++ b/meta/recipes-connectivity/kea/kea_2.6.3.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "Kea is the next generation of DHCP software developed by ISC. It
 HOMEPAGE = "http://kea.isc.org"
 SECTION = "connectivity"
 LICENSE = "MPL-2.0"
-LIC_FILES_CHKSUM = "file://COPYING;md5=618093ea9de92c70a115268c1d53421f"
+LIC_FILES_CHKSUM = "file://COPYING;md5=ee16e7280a6cf2a1487717faf33190dc"
 
 DEPENDS = "boost log4cplus openssl"
 
@@ -17,13 +17,9 @@ SRC_URI = "http://ftp.isc.org/isc/kea/${PV}/${BP}.tar.gz \
            file://fix-multilib-conflict.patch \
            file://fix_pid_keactrl.patch \
            file://0001-src-lib-log-logger_unittest_support.cc-do-not-write-.patch \
-           file://0001-Replace-Name-NameString-with-vector-of-uint8_t.patch \
-           file://0002-Fix-unittests-Typo-in-Name-Name-append-to-ndata_-not.patch \
-           file://0001-Update-asiolink-for-boost-1.87.patch \
            file://0001-make-kea-environment-available-to-lfc.patch \
-           file://0001-Avoid-assert-on-empty-packet.patch \
            "
-SRC_URI[sha256sum] = "d2ce14a91c2e248ad2876e29152d647bcc5e433bc68dafad0ee96ec166fcfad1"
+SRC_URI[sha256sum] = "00241a5955ffd3d215a2c098c4527f9d7f4b203188b276f9a36250dd3d9dd612"
 
 inherit autotools systemd update-rc.d upstream-version-is-even
 
-- 
2.43.0


