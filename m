Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9949C02184
	for <webhook@archiver.kernel.org>; Wed,  8 Jan 2025 08:42:39 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web11.14682.1736325759286748662
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jan 2025 00:42:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RO+O1yUd;
 spf=pass (domain: gmail.com, ip: 209.85.218.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-aafc9d75f8bso402729766b.2
        for <openembedded-core@lists.openembedded.org>; Wed, 08 Jan 2025 00:42:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736325758; x=1736930558; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QxLae0VSZUcGWjtrB/07j5hGq2j+8k/WFCEuWCqlLGo=;
        b=RO+O1yUdhp2esDdJwRWZle/7acKmitgwUU2eN1NCN0wF8ArwJc+qMk0f+VilxjczAk
         ra/ZTf4QSKPCnqbBWjohfMXPPTJcrkSQXdod6QwqTXYId3IDfzOUqE4AagjWVgsUHy4o
         C52fHhtGO/Rpe9X2t2WhHeCGCeMr0whSrVoOKtG3IyYtdZl2pA3Ehc+7Oy4YhGjpvqiC
         5RPAtdoNDhCTJxSrTAZ469dU/qJ/A7O8nIE+Q3RvovpSHIEQnKx+RwDCb7o0qVvS4qks
         Z7lbCgYBWcRJwVh6RAyvE+sNV0k5kMrZD8wJoGtWjcz72GAJo1ULOWNTYSkzQ+6JiySf
         iXqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736325758; x=1736930558;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QxLae0VSZUcGWjtrB/07j5hGq2j+8k/WFCEuWCqlLGo=;
        b=dZ4QvUi1QBEIsGmSDkY7C1He5ufDV5wyoFQSWHrP1AiqW8y+dUwuKBwbpVozCBmJlx
         DV+hpj975L099etjvUmQ6f5I46N8UgQdQ8+jBIynZfJHuUxhJgJNCht6lGH53WPe7oG0
         +Ys76YsBstRfE/g62FWl4yyN6W6ynvKbyPMTR2o31Y1syws0jzjMUA4EMWuEnR37BECW
         zOyPmi3xra0Xcx2Iywaexz4b4awrZGi7mPvk3ZmNCEFuJKHc9RpC736ze9/1pwOXB7zR
         xu3mrlsT9Yk8TaHz0NVfXM+wawkeeUNwzC7bcOk69hSZGWk9gYfCHhHF5rkf1G6IBdqG
         pX8Q==
X-Gm-Message-State: AOJu0YwP5nFYoQZ4usXqAMeU9yU0zojTyZdbXVuc5ELj7gF8lL5mx+3R
	a0ugyiqxNHjqbAbRF30X41wbb2soYiolcOhOwu00bzq+f3EI7TgC0lyKmA==
X-Gm-Gg: ASbGnct3G1JTvmsd5hQYOvf/hiEjf1POoVIVtSDbwsz9tZN+WVyTse4bmNQrIKBMoRw
	AFIEqmWBHvTtEnzOBpSaAh1ujguqIQTAZTXx+Xv+LUp/rF31kWHwKzTzCp1B0XfSPYR1b4hHbCo
	AVmU/tsIhsa03utaqUnTe11UDk3N1KU/r78zVSlvHw2PBT4UEKXJP2TUNxH2/F4sdTReeR81Qwg
	0uxFLQtgoBl2EcGXjzDfgx6iK6hTg9TtYzeXKFrMlfyoOO6fxqglbNzh89AV2H7AgmcPZPDM3tc
	urVQD+SgfAu6x5pw0w==
X-Google-Smtp-Source: AGHT+IGIMFoEw3uaJKWlWie/mQNl6cQDV3NJjZetl0lQqbIfz72P5LOOBZPm3ciNFLr0u1iDvadbxw==
X-Received: by 2002:a17:907:9449:b0:aa6:668b:2733 with SMTP id a640c23a62f3a-ab2ab74100amr132420466b.33.1736325757385;
        Wed, 08 Jan 2025 00:42:37 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0f06c7c2sm2499661766b.188.2025.01.08.00.42.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2025 00:42:37 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 11/20] boost: update 1.86.0 -> 1.87.0
Date: Wed,  8 Jan 2025 09:42:17 +0100
Message-Id: <20250108084226.117178-11-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250108084226.117178-1-alex.kanavin@gmail.com>
References: <20250108084226.117178-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Jan 2025 08:42:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209533

From: Alexander Kanavin <alex@linutronix.de>

Backport a kea patch to address 1.87.0 compatibility.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../0001-Update-asiolink-for-boost-1.87.patch | 190 ++++++++++++++++++
 meta/recipes-connectivity/kea/kea_2.6.1.bb    |   1 +
 .../{boost-1.86.0.inc => boost-1.87.0.inc}    |   2 +-
 ...1.86.0.bb => boost-build-native_1.87.0.bb} |   0
 ...h-instruction-set-flags-we-do-that-o.patch |   2 +-
 ...01-dont-setup-compiler-flags-m32-m64.patch |   2 +-
 .../boost-math-disable-pch-for-gcc.patch      |   8 +-
 .../{boost_1.86.0.bb => boost_1.87.0.bb}      |   0
 8 files changed, 198 insertions(+), 7 deletions(-)
 create mode 100644 meta/recipes-connectivity/kea/files/0001-Update-asiolink-for-boost-1.87.patch
 rename meta/recipes-support/boost/{boost-1.86.0.inc => boost-1.87.0.inc} (90%)
 rename meta/recipes-support/boost/{boost-build-native_1.86.0.bb => boost-build-native_1.87.0.bb} (100%)
 rename meta/recipes-support/boost/{boost_1.86.0.bb => boost_1.87.0.bb} (100%)

diff --git a/meta/recipes-connectivity/kea/files/0001-Update-asiolink-for-boost-1.87.patch b/meta/recipes-connectivity/kea/files/0001-Update-asiolink-for-boost-1.87.patch
new file mode 100644
index 00000000000..794726f1f10
--- /dev/null
+++ b/meta/recipes-connectivity/kea/files/0001-Update-asiolink-for-boost-1.87.patch
@@ -0,0 +1,190 @@
+From dab0f3daafb760ace0d4091f74ff90edb225ca02 Mon Sep 17 00:00:00 2001
+From: q66 <q66@chimera-linux.org>
+Date: Sun, 15 Dec 2024 03:04:53 +0100
+Subject: [PATCH] Update asiolink for boost 1.87
+
+Upstream-Status: Submitted [https://gitlab.isc.org/isc-projects/kea/-/merge_requests/2523]
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+---
+ src/lib/asiolink/io_address.cc         |  4 ++--
+ src/lib/asiolink/io_service.cc         |  8 ++++----
+ src/lib/asiolink/tcp_endpoint.h        |  2 +-
+ src/lib/asiolink/udp_endpoint.h        |  2 +-
+ src/lib/asiolink/unix_domain_socket.cc | 16 ++++++++--------
+ src/lib/dhcp/iface_mgr.cc              |  2 +-
+ 6 files changed, 17 insertions(+), 17 deletions(-)
+
+diff --git a/src/lib/asiolink/io_address.cc b/src/lib/asiolink/io_address.cc
+index 43459bf..06b7d3d 100644
+--- a/src/lib/asiolink/io_address.cc
++++ b/src/lib/asiolink/io_address.cc
+@@ -37,7 +37,7 @@ IOAddress::Hash::operator()(const IOAddress &io_address) const {
+ // because we'd like to throw our own exception on failure.
+ IOAddress::IOAddress(const std::string& address_str) {
+     boost::system::error_code err;
+-    asio_address_ = ip::address::from_string(address_str, err);
++    asio_address_ = ip::make_address(address_str, err);
+     if (err) {
+         isc_throw(IOError, "Failed to convert string to address '"
+                   << address_str << "': " << err.message());
+@@ -116,7 +116,7 @@ IOAddress::isV6Multicast() const {
+ uint32_t
+ IOAddress::toUint32() const {
+     if (asio_address_.is_v4()) {
+-        return (asio_address_.to_v4().to_ulong());
++        return (asio_address_.to_v4().to_uint());
+     } else {
+         isc_throw(BadValue, "Can't convert " << toText()
+                   << " address to IPv4.");
+diff --git a/src/lib/asiolink/io_service.cc b/src/lib/asiolink/io_service.cc
+index 411de64..cc28d24 100644
+--- a/src/lib/asiolink/io_service.cc
++++ b/src/lib/asiolink/io_service.cc
+@@ -30,7 +30,7 @@ public:
+     /// @brief The constructor.
+     IOServiceImpl() :
+         io_service_(),
+-        work_(new boost::asio::io_service::work(io_service_)) {
++        work_(boost::asio::make_work_guard(io_service_)) {
+     };
+ 
+     /// @brief The destructor.
+@@ -92,7 +92,7 @@ public:
+ 
+     /// @brief Restarts the IOService in preparation for a subsequent @ref run() invocation.
+     void restart() {
+-        io_service_.reset();
++        io_service_.restart();
+     }
+ 
+     /// @brief Removes IO service work object to let it finish running
+@@ -115,12 +115,12 @@ public:
+     ///
+     /// @param callback The callback to be run on the IO service.
+     void post(const std::function<void ()>& callback) {
+-        io_service_.post(callback);
++        boost::asio::post(io_service_, callback);
+     }
+ 
+ private:
+     boost::asio::io_service io_service_;
+-    boost::shared_ptr<boost::asio::io_service::work> work_;
++    boost::asio::executor_work_guard<boost::asio::io_service::executor_type> work_;
+ };
+ 
+ IOService::IOService() : io_impl_(new IOServiceImpl()) {
+diff --git a/src/lib/asiolink/tcp_endpoint.h b/src/lib/asiolink/tcp_endpoint.h
+index 8ebd575..7c8cb35 100644
+--- a/src/lib/asiolink/tcp_endpoint.h
++++ b/src/lib/asiolink/tcp_endpoint.h
+@@ -42,7 +42,7 @@ public:
+     /// \param port The TCP port number of the endpoint.
+     TCPEndpoint(const IOAddress& address, const unsigned short port) :
+         asio_endpoint_placeholder_(
+-            new boost::asio::ip::tcp::endpoint(boost::asio::ip::address::from_string(address.toText()),
++            new boost::asio::ip::tcp::endpoint(boost::asio::ip::make_address(address.toText()),
+                               port)),
+         asio_endpoint_(*asio_endpoint_placeholder_)
+     {}
+diff --git a/src/lib/asiolink/udp_endpoint.h b/src/lib/asiolink/udp_endpoint.h
+index f960bf3..2a3da9f 100644
+--- a/src/lib/asiolink/udp_endpoint.h
++++ b/src/lib/asiolink/udp_endpoint.h
+@@ -42,7 +42,7 @@ public:
+     /// \param port The UDP port number of the endpoint.
+     UDPEndpoint(const IOAddress& address, const unsigned short port) :
+         asio_endpoint_placeholder_(
+-            new boost::asio::ip::udp::endpoint(boost::asio::ip::address::from_string(address.toText()),
++            new boost::asio::ip::udp::endpoint(boost::asio::ip::make_address(address.toText()),
+                               port)),
+         asio_endpoint_(*asio_endpoint_placeholder_)
+     {}
+diff --git a/src/lib/asiolink/unix_domain_socket.cc b/src/lib/asiolink/unix_domain_socket.cc
+index f43e1c9..43ff3c8 100644
+--- a/src/lib/asiolink/unix_domain_socket.cc
++++ b/src/lib/asiolink/unix_domain_socket.cc
+@@ -83,7 +83,7 @@ public:
+     /// @param buffer Buffers holding the data to be sent.
+     /// @param handler User supplied callback to be invoked when data have
+     /// been sent or sending error is signalled.
+-    void doSend(const boost::asio::const_buffers_1& buffer,
++    void doSend(const boost::asio::const_buffer& buffer,
+                 const UnixDomainSocket::Handler& handler);
+ 
+ 
+@@ -103,7 +103,7 @@ public:
+     /// @param ec Error code returned as a result of sending the data.
+     /// @param length Length of the data sent.
+     void sendHandler(const UnixDomainSocket::Handler& remote_handler,
+-                     const boost::asio::const_buffers_1& buffer,
++                     const boost::asio::const_buffer& buffer,
+                      const boost::system::error_code& ec,
+                      size_t length);
+ 
+@@ -127,7 +127,7 @@ public:
+     /// @param buffer A buffer into which the data should be received.
+     /// @param handler User supplied callback invoked when data have been
+     /// received on an error is signalled.
+-    void doReceive(const boost::asio::mutable_buffers_1& buffer,
++    void doReceive(const boost::asio::mutable_buffer& buffer,
+                    const UnixDomainSocket::Handler& handler);
+ 
+     /// @brief Local handler invoked as a result of asynchronous receive.
+@@ -146,7 +146,7 @@ public:
+     /// @param ec Error code returned as a result of asynchronous receive.
+     /// @param length Size of the received data.
+     void receiveHandler(const UnixDomainSocket::Handler& remote_handler,
+-                        const boost::asio::mutable_buffers_1& buffer,
++                        const boost::asio::mutable_buffer& buffer,
+                         const boost::system::error_code& ec,
+                         size_t length);
+ 
+@@ -197,7 +197,7 @@ UnixDomainSocketImpl::asyncSend(const void* data, const size_t length,
+ }
+ 
+ void
+-UnixDomainSocketImpl::doSend(const boost::asio::const_buffers_1& buffer,
++UnixDomainSocketImpl::doSend(const boost::asio::const_buffer& buffer,
+                              const UnixDomainSocket::Handler& handler) {
+     auto local_handler = std::bind(&UnixDomainSocketImpl::sendHandler,
+                                    shared_from_this(),
+@@ -207,7 +207,7 @@ UnixDomainSocketImpl::doSend(const boost::asio::const_buffers_1& buffer,
+ 
+ void
+ UnixDomainSocketImpl::sendHandler(const UnixDomainSocket::Handler& remote_handler,
+-                                  const boost::asio::const_buffers_1& buffer,
++                                  const boost::asio::const_buffer& buffer,
+                                   const boost::system::error_code& ec,
+                                   size_t length) {
+     // The asynchronous send may return EWOULDBLOCK or EAGAIN on some
+@@ -230,7 +230,7 @@ UnixDomainSocketImpl::asyncReceive(void* data, const size_t length,
+ }
+ 
+ void
+-UnixDomainSocketImpl::doReceive(const boost::asio::mutable_buffers_1& buffer,
++UnixDomainSocketImpl::doReceive(const boost::asio::mutable_buffer& buffer,
+                                 const UnixDomainSocket::Handler& handler) {
+     auto local_handler = std::bind(&UnixDomainSocketImpl::receiveHandler,
+                                    shared_from_this(),
+@@ -240,7 +240,7 @@ UnixDomainSocketImpl::doReceive(const boost::asio::mutable_buffers_1& buffer,
+ 
+ void
+ UnixDomainSocketImpl::receiveHandler(const UnixDomainSocket::Handler& remote_handler,
+-                                     const boost::asio::mutable_buffers_1& buffer,
++                                     const boost::asio::mutable_buffer& buffer,
+                                      const boost::system::error_code& ec,
+                                      size_t length) {
+     // The asynchronous receive may return EWOULDBLOCK or EAGAIN on some
+diff --git a/src/lib/dhcp/iface_mgr.cc b/src/lib/dhcp/iface_mgr.cc
+index 01a1d63..419268b 100644
+--- a/src/lib/dhcp/iface_mgr.cc
++++ b/src/lib/dhcp/iface_mgr.cc
+@@ -1034,7 +1034,7 @@ IfaceMgr::getLocalAddress(const IOAddress& remote_addr, const uint16_t port) {
+     }
+ 
+     // Create socket that will be used to connect to remote endpoint.
+-    boost::asio::io_service io_service;
++    boost::asio::io_context io_service;
+     boost::asio::ip::udp::socket sock(io_service);
+ 
+     boost::system::error_code err_code;
diff --git a/meta/recipes-connectivity/kea/kea_2.6.1.bb b/meta/recipes-connectivity/kea/kea_2.6.1.bb
index 4f8c4124cb4..19e07f5da39 100644
--- a/meta/recipes-connectivity/kea/kea_2.6.1.bb
+++ b/meta/recipes-connectivity/kea/kea_2.6.1.bb
@@ -19,6 +19,7 @@ SRC_URI = "http://ftp.isc.org/isc/kea/${PV}/${BP}.tar.gz \
            file://0001-src-lib-log-logger_unittest_support.cc-do-not-write-.patch \
            file://0001-Replace-Name-NameString-with-vector-of-uint8_t.patch \
            file://0002-Fix-unittests-Typo-in-Name-Name-append-to-ndata_-not.patch \
+           file://0001-Update-asiolink-for-boost-1.87.patch \
            "
 SRC_URI[sha256sum] = "d2ce14a91c2e248ad2876e29152d647bcc5e433bc68dafad0ee96ec166fcfad1"
 
diff --git a/meta/recipes-support/boost/boost-1.86.0.inc b/meta/recipes-support/boost/boost-1.87.0.inc
similarity index 90%
rename from meta/recipes-support/boost/boost-1.86.0.inc
rename to meta/recipes-support/boost/boost-1.87.0.inc
index 7113a500491..c6e55b239eb 100644
--- a/meta/recipes-support/boost/boost-1.86.0.inc
+++ b/meta/recipes-support/boost/boost-1.87.0.inc
@@ -12,7 +12,7 @@ BOOST_MAJ = "${@"_".join(d.getVar("PV").split(".")[0:2])}"
 BOOST_P = "boost_${BOOST_VER}"
 
 SRC_URI = "https://archives.boost.io/release/${PV}/source/${BOOST_P}.tar.bz2"
-SRC_URI[sha256sum] = "1bed88e40401b2cb7a1f76d4bab499e352fa4d0c5f31c0dbae64e24d34d7513b"
+SRC_URI[sha256sum] = "af57be25cb4c4f4b413ed692fe378affb4352ea50fbe294a11ef548f4d527d89"
 
 UPSTREAM_CHECK_URI = "http://www.boost.org/users/download/"
 UPSTREAM_CHECK_REGEX = "release/(?P<pver>.*)/source/"
diff --git a/meta/recipes-support/boost/boost-build-native_1.86.0.bb b/meta/recipes-support/boost/boost-build-native_1.87.0.bb
similarity index 100%
rename from meta/recipes-support/boost/boost-build-native_1.86.0.bb
rename to meta/recipes-support/boost/boost-build-native_1.87.0.bb
diff --git a/meta/recipes-support/boost/boost/0001-Don-t-set-up-arch-instruction-set-flags-we-do-that-o.patch b/meta/recipes-support/boost/boost/0001-Don-t-set-up-arch-instruction-set-flags-we-do-that-o.patch
index 78f652f619c..04bede45787 100644
--- a/meta/recipes-support/boost/boost/0001-Don-t-set-up-arch-instruction-set-flags-we-do-that-o.patch
+++ b/meta/recipes-support/boost/boost/0001-Don-t-set-up-arch-instruction-set-flags-we-do-that-o.patch
@@ -1,4 +1,4 @@
-From f88354966fe3af33fd6d9ec889a8e3926b886a8a Mon Sep 17 00:00:00 2001
+From e2cc24d6d8b7b24a6d0a30c52c7ad69a001a0ad5 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Tue, 18 Dec 2018 15:42:57 +0100
 Subject: [PATCH] Don't set up arch/instruction-set flags, we do that
diff --git a/meta/recipes-support/boost/boost/0001-dont-setup-compiler-flags-m32-m64.patch b/meta/recipes-support/boost/boost/0001-dont-setup-compiler-flags-m32-m64.patch
index 8f130348b0a..db1ee038987 100644
--- a/meta/recipes-support/boost/boost/0001-dont-setup-compiler-flags-m32-m64.patch
+++ b/meta/recipes-support/boost/boost/0001-dont-setup-compiler-flags-m32-m64.patch
@@ -1,4 +1,4 @@
-From 7130850d74863d1e9a0ae3e85462f1466bdf6d88 Mon Sep 17 00:00:00 2001
+From b0728812241c048907e6f1ba168292cd9948347d Mon Sep 17 00:00:00 2001
 From: Anuj Mittal <anuj.mittal@intel.com>
 Date: Thu, 14 Nov 2019 10:13:53 +0800
 Subject: [PATCH] dont setup compiler flags -m32/-m64
diff --git a/meta/recipes-support/boost/boost/boost-math-disable-pch-for-gcc.patch b/meta/recipes-support/boost/boost/boost-math-disable-pch-for-gcc.patch
index dde21fa0763..ad90d96dddf 100644
--- a/meta/recipes-support/boost/boost/boost-math-disable-pch-for-gcc.patch
+++ b/meta/recipes-support/boost/boost/boost-math-disable-pch-for-gcc.patch
@@ -1,4 +1,4 @@
-From c6009cdc1fe76db0092443593396e4d5f0eaa86b Mon Sep 17 00:00:00 2001
+From e7491f9874411fd9855957812ba9bac948a61356 Mon Sep 17 00:00:00 2001
 From: Jackie Huang <jackie.huang@windriver.com>
 Date: Fri, 23 Sep 2016 01:04:50 -0700
 Subject: [PATCH] boost-math: disable pch for gcc
@@ -14,11 +14,11 @@ Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/libs/math/build/Jamfile.v2 b/libs/math/build/Jamfile.v2
-index 6549e06b7..342cbf0b1 100644
+index 500c77363..504d7d8c6 100644
 --- a/libs/math/build/Jamfile.v2
 +++ b/libs/math/build/Jamfile.v2
-@@ -13,7 +13,7 @@ project
-       <toolset>intel-win:<linkflags>-nologo 
+@@ -15,7 +15,7 @@ project
+       <toolset>intel-win:<linkflags>-nologo
        #<toolset>intel-linux:<pch>off
        <toolset>intel-darwin:<pch>off
 -      <toolset>gcc,<target-os>windows:<pch>off
diff --git a/meta/recipes-support/boost/boost_1.86.0.bb b/meta/recipes-support/boost/boost_1.87.0.bb
similarity index 100%
rename from meta/recipes-support/boost/boost_1.86.0.bb
rename to meta/recipes-support/boost/boost_1.87.0.bb
-- 
2.39.5


