Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69DECE77188
	for <webhook@archiver.kernel.org>; Sat, 11 Jan 2025 01:10:23 +0000 (UTC)
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
 by mx.groups.io with SMTP id smtpd.web10.7008.1736557818086310949
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Jan 2025 17:10:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DSckjSNR;
 spf=pass (domain: gmail.com, ip: 209.85.160.44, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-2a01bcd0143so1631640fac.2
        for <openembedded-core@lists.openembedded.org>; Fri, 10 Jan 2025 17:10:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736557817; x=1737162617; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pr68Ca6SCx7mtQGg1a0Aqrd+qbF1u0ufWVMHoIyUBtE=;
        b=DSckjSNRGIjeGTx1asHBqJ7s7tOZlx3auZhuuPlvL7zMsmIIdThrJyzHaIUUJil0+0
         UKgSiGRZbIHWRz6NqsY1IwQ0buEh0XJeOinfe12N+IAMQKjO7NhFEmV/AVf+s09SE2EF
         jb3vsmZYzbsGtTGcmJTiPT3WbdP3T7nZk9v8CN+WEjcb6axiM5fgraKeT/0VUn93eDCN
         xWrarHU3bz2bgKrdZ+gmXMl3PwN5z8RlRYey0UtfT1LIAg7hRQ6YSwdxbDzMM3gSpkZ+
         hFoE51aiDnTda5D6GG2YszO2EtoImo7JNUM4JD4AzYBUUqH4hQh98RaS2/HFJ+7z454N
         F6gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736557817; x=1737162617;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pr68Ca6SCx7mtQGg1a0Aqrd+qbF1u0ufWVMHoIyUBtE=;
        b=c2sEwxUO1GMWhs/jaEweK8Jb6sOIh/DRTxbVbVsrleqENz+S/YAINuwbR1o7sPI3+i
         gqZ6Nup8UofrrY0OT6I8D85bQtw9HdZ/8fLJk+ZqFbXMwCmdl4PR7cDglGvHl7FwsUqx
         fmMVDT67J9BRTpjarxcTsYC77eDIU44XW1d6A7w55HlueZTubGPefSq12sJi5GJb4D0Z
         ShqfyuUti7eOeSAF6Z21NGHDKJXugiXM/dgqBVqTn2+wzBJvLzPLzPtDGV8lF1p6i3eZ
         6oU0hj3nUJA4TW99k4w8uCoqjL7XyiUSqpb4ZgHcdzw3DS6ZsU8IAGqzrb39FaTGJO9k
         J46A==
X-Gm-Message-State: AOJu0YzeeJGo+3vEB+OMLdfcN8JGnfeudE7FmGu8POv3B+l/c9l6qDBL
	3nGV8m0SGFLPOOfWRQc7m8V5aUXOmdXQ+O+hI+rKGx9MHmr70cBZ1J/EQ2ZDQtvwPpqDxmQEbOp
	IZummuQ6FWaDSwEBmMbtQT0/BXv8=
X-Gm-Gg: ASbGncvke1pb7X1523iPx5m0hs7BHLJwJx3b3wgvWF04Hm8v/0RKZ8IXT2o4Yn81nBi
	mRVmNXRjYNa3lu72HmwHeLCfxAwaYCmZ+QQAvjw==
X-Google-Smtp-Source: AGHT+IHfJhLmBM+AfG2Owxif0koKVh0eOUXhaWkVXa0+c5AYzfnY0Lk7LPxXBZQwDDaISXIhVmiP8kmDVYtj185jfvs=
X-Received: by 2002:a05:6870:1712:b0:2a3:d9b3:3d01 with SMTP id
 586e51a60fabf-2aa06919ff4mr7472419fac.29.1736557817117; Fri, 10 Jan 2025
 17:10:17 -0800 (PST)
MIME-Version: 1.0
References: <20250108084226.117178-1-alex.kanavin@gmail.com> <20250108084226.117178-11-alex.kanavin@gmail.com>
In-Reply-To: <20250108084226.117178-11-alex.kanavin@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 10 Jan 2025 17:09:51 -0800
X-Gm-Features: AbW1kvasrL8ZVcqbB8_RVOGYDlkmgF_D-pfHatwtG8GLLvApfkia-xXCHdJBkec
Message-ID: <CAMKF1spQ9Wf0n21VGN5HoBwfx1194o9QwXEwXLzbsuLFUEOAMg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 11/20] boost: update 1.86.0 -> 1.87.0
To: alex.kanavin@gmail.com
Cc: openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 11 Jan 2025 01:10:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209667

This breaks several recipes in meta-openembedded. here is subset from
meta-oe layer
https://valkyrie.yoctoproject.org/#/builders/81/builds/276

On Wed, Jan 8, 2025 at 12:42=E2=80=AFAM Alexander Kanavin via
lists.openembedded.org <alex.kanavin=3Dgmail.com@lists.openembedded.org>
wrote:
>
> From: Alexander Kanavin <alex@linutronix.de>
>
> Backport a kea patch to address 1.87.0 compatibility.
>
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
>  .../0001-Update-asiolink-for-boost-1.87.patch | 190 ++++++++++++++++++
>  meta/recipes-connectivity/kea/kea_2.6.1.bb    |   1 +
>  .../{boost-1.86.0.inc =3D> boost-1.87.0.inc}    |   2 +-
>  ...1.86.0.bb =3D> boost-build-native_1.87.0.bb} |   0
>  ...h-instruction-set-flags-we-do-that-o.patch |   2 +-
>  ...01-dont-setup-compiler-flags-m32-m64.patch |   2 +-
>  .../boost-math-disable-pch-for-gcc.patch      |   8 +-
>  .../{boost_1.86.0.bb =3D> boost_1.87.0.bb}      |   0
>  8 files changed, 198 insertions(+), 7 deletions(-)
>  create mode 100644 meta/recipes-connectivity/kea/files/0001-Update-asiol=
ink-for-boost-1.87.patch
>  rename meta/recipes-support/boost/{boost-1.86.0.inc =3D> boost-1.87.0.in=
c} (90%)
>  rename meta/recipes-support/boost/{boost-build-native_1.86.0.bb =3D> boo=
st-build-native_1.87.0.bb} (100%)
>  rename meta/recipes-support/boost/{boost_1.86.0.bb =3D> boost_1.87.0.bb}=
 (100%)
>
> diff --git a/meta/recipes-connectivity/kea/files/0001-Update-asiolink-for=
-boost-1.87.patch b/meta/recipes-connectivity/kea/files/0001-Update-asiolin=
k-for-boost-1.87.patch
> new file mode 100644
> index 00000000000..794726f1f10
> --- /dev/null
> +++ b/meta/recipes-connectivity/kea/files/0001-Update-asiolink-for-boost-=
1.87.patch
> @@ -0,0 +1,190 @@
> +From dab0f3daafb760ace0d4091f74ff90edb225ca02 Mon Sep 17 00:00:00 2001
> +From: q66 <q66@chimera-linux.org>
> +Date: Sun, 15 Dec 2024 03:04:53 +0100
> +Subject: [PATCH] Update asiolink for boost 1.87
> +
> +Upstream-Status: Submitted [https://gitlab.isc.org/isc-projects/kea/-/me=
rge_requests/2523]
> +Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> +---
> + src/lib/asiolink/io_address.cc         |  4 ++--
> + src/lib/asiolink/io_service.cc         |  8 ++++----
> + src/lib/asiolink/tcp_endpoint.h        |  2 +-
> + src/lib/asiolink/udp_endpoint.h        |  2 +-
> + src/lib/asiolink/unix_domain_socket.cc | 16 ++++++++--------
> + src/lib/dhcp/iface_mgr.cc              |  2 +-
> + 6 files changed, 17 insertions(+), 17 deletions(-)
> +
> +diff --git a/src/lib/asiolink/io_address.cc b/src/lib/asiolink/io_addres=
s.cc
> +index 43459bf..06b7d3d 100644
> +--- a/src/lib/asiolink/io_address.cc
> ++++ b/src/lib/asiolink/io_address.cc
> +@@ -37,7 +37,7 @@ IOAddress::Hash::operator()(const IOAddress &io_addres=
s) const {
> + // because we'd like to throw our own exception on failure.
> + IOAddress::IOAddress(const std::string& address_str) {
> +     boost::system::error_code err;
> +-    asio_address_ =3D ip::address::from_string(address_str, err);
> ++    asio_address_ =3D ip::make_address(address_str, err);
> +     if (err) {
> +         isc_throw(IOError, "Failed to convert string to address '"
> +                   << address_str << "': " << err.message());
> +@@ -116,7 +116,7 @@ IOAddress::isV6Multicast() const {
> + uint32_t
> + IOAddress::toUint32() const {
> +     if (asio_address_.is_v4()) {
> +-        return (asio_address_.to_v4().to_ulong());
> ++        return (asio_address_.to_v4().to_uint());
> +     } else {
> +         isc_throw(BadValue, "Can't convert " << toText()
> +                   << " address to IPv4.");
> +diff --git a/src/lib/asiolink/io_service.cc b/src/lib/asiolink/io_servic=
e.cc
> +index 411de64..cc28d24 100644
> +--- a/src/lib/asiolink/io_service.cc
> ++++ b/src/lib/asiolink/io_service.cc
> +@@ -30,7 +30,7 @@ public:
> +     /// @brief The constructor.
> +     IOServiceImpl() :
> +         io_service_(),
> +-        work_(new boost::asio::io_service::work(io_service_)) {
> ++        work_(boost::asio::make_work_guard(io_service_)) {
> +     };
> +
> +     /// @brief The destructor.
> +@@ -92,7 +92,7 @@ public:
> +
> +     /// @brief Restarts the IOService in preparation for a subsequent @=
ref run() invocation.
> +     void restart() {
> +-        io_service_.reset();
> ++        io_service_.restart();
> +     }
> +
> +     /// @brief Removes IO service work object to let it finish running
> +@@ -115,12 +115,12 @@ public:
> +     ///
> +     /// @param callback The callback to be run on the IO service.
> +     void post(const std::function<void ()>& callback) {
> +-        io_service_.post(callback);
> ++        boost::asio::post(io_service_, callback);
> +     }
> +
> + private:
> +     boost::asio::io_service io_service_;
> +-    boost::shared_ptr<boost::asio::io_service::work> work_;
> ++    boost::asio::executor_work_guard<boost::asio::io_service::executor_=
type> work_;
> + };
> +
> + IOService::IOService() : io_impl_(new IOServiceImpl()) {
> +diff --git a/src/lib/asiolink/tcp_endpoint.h b/src/lib/asiolink/tcp_endp=
oint.h
> +index 8ebd575..7c8cb35 100644
> +--- a/src/lib/asiolink/tcp_endpoint.h
> ++++ b/src/lib/asiolink/tcp_endpoint.h
> +@@ -42,7 +42,7 @@ public:
> +     /// \param port The TCP port number of the endpoint.
> +     TCPEndpoint(const IOAddress& address, const unsigned short port) :
> +         asio_endpoint_placeholder_(
> +-            new boost::asio::ip::tcp::endpoint(boost::asio::ip::address=
::from_string(address.toText()),
> ++            new boost::asio::ip::tcp::endpoint(boost::asio::ip::make_ad=
dress(address.toText()),
> +                               port)),
> +         asio_endpoint_(*asio_endpoint_placeholder_)
> +     {}
> +diff --git a/src/lib/asiolink/udp_endpoint.h b/src/lib/asiolink/udp_endp=
oint.h
> +index f960bf3..2a3da9f 100644
> +--- a/src/lib/asiolink/udp_endpoint.h
> ++++ b/src/lib/asiolink/udp_endpoint.h
> +@@ -42,7 +42,7 @@ public:
> +     /// \param port The UDP port number of the endpoint.
> +     UDPEndpoint(const IOAddress& address, const unsigned short port) :
> +         asio_endpoint_placeholder_(
> +-            new boost::asio::ip::udp::endpoint(boost::asio::ip::address=
::from_string(address.toText()),
> ++            new boost::asio::ip::udp::endpoint(boost::asio::ip::make_ad=
dress(address.toText()),
> +                               port)),
> +         asio_endpoint_(*asio_endpoint_placeholder_)
> +     {}
> +diff --git a/src/lib/asiolink/unix_domain_socket.cc b/src/lib/asiolink/u=
nix_domain_socket.cc
> +index f43e1c9..43ff3c8 100644
> +--- a/src/lib/asiolink/unix_domain_socket.cc
> ++++ b/src/lib/asiolink/unix_domain_socket.cc
> +@@ -83,7 +83,7 @@ public:
> +     /// @param buffer Buffers holding the data to be sent.
> +     /// @param handler User supplied callback to be invoked when data h=
ave
> +     /// been sent or sending error is signalled.
> +-    void doSend(const boost::asio::const_buffers_1& buffer,
> ++    void doSend(const boost::asio::const_buffer& buffer,
> +                 const UnixDomainSocket::Handler& handler);
> +
> +
> +@@ -103,7 +103,7 @@ public:
> +     /// @param ec Error code returned as a result of sending the data.
> +     /// @param length Length of the data sent.
> +     void sendHandler(const UnixDomainSocket::Handler& remote_handler,
> +-                     const boost::asio::const_buffers_1& buffer,
> ++                     const boost::asio::const_buffer& buffer,
> +                      const boost::system::error_code& ec,
> +                      size_t length);
> +
> +@@ -127,7 +127,7 @@ public:
> +     /// @param buffer A buffer into which the data should be received.
> +     /// @param handler User supplied callback invoked when data have be=
en
> +     /// received on an error is signalled.
> +-    void doReceive(const boost::asio::mutable_buffers_1& buffer,
> ++    void doReceive(const boost::asio::mutable_buffer& buffer,
> +                    const UnixDomainSocket::Handler& handler);
> +
> +     /// @brief Local handler invoked as a result of asynchronous receiv=
e.
> +@@ -146,7 +146,7 @@ public:
> +     /// @param ec Error code returned as a result of asynchronous recei=
ve.
> +     /// @param length Size of the received data.
> +     void receiveHandler(const UnixDomainSocket::Handler& remote_handler=
,
> +-                        const boost::asio::mutable_buffers_1& buffer,
> ++                        const boost::asio::mutable_buffer& buffer,
> +                         const boost::system::error_code& ec,
> +                         size_t length);
> +
> +@@ -197,7 +197,7 @@ UnixDomainSocketImpl::asyncSend(const void* data, co=
nst size_t length,
> + }
> +
> + void
> +-UnixDomainSocketImpl::doSend(const boost::asio::const_buffers_1& buffer=
,
> ++UnixDomainSocketImpl::doSend(const boost::asio::const_buffer& buffer,
> +                              const UnixDomainSocket::Handler& handler) =
{
> +     auto local_handler =3D std::bind(&UnixDomainSocketImpl::sendHandler=
,
> +                                    shared_from_this(),
> +@@ -207,7 +207,7 @@ UnixDomainSocketImpl::doSend(const boost::asio::cons=
t_buffers_1& buffer,
> +
> + void
> + UnixDomainSocketImpl::sendHandler(const UnixDomainSocket::Handler& remo=
te_handler,
> +-                                  const boost::asio::const_buffers_1& b=
uffer,
> ++                                  const boost::asio::const_buffer& buff=
er,
> +                                   const boost::system::error_code& ec,
> +                                   size_t length) {
> +     // The asynchronous send may return EWOULDBLOCK or EAGAIN on some
> +@@ -230,7 +230,7 @@ UnixDomainSocketImpl::asyncReceive(void* data, const=
 size_t length,
> + }
> +
> + void
> +-UnixDomainSocketImpl::doReceive(const boost::asio::mutable_buffers_1& b=
uffer,
> ++UnixDomainSocketImpl::doReceive(const boost::asio::mutable_buffer& buff=
er,
> +                                 const UnixDomainSocket::Handler& handle=
r) {
> +     auto local_handler =3D std::bind(&UnixDomainSocketImpl::receiveHand=
ler,
> +                                    shared_from_this(),
> +@@ -240,7 +240,7 @@ UnixDomainSocketImpl::doReceive(const boost::asio::m=
utable_buffers_1& buffer,
> +
> + void
> + UnixDomainSocketImpl::receiveHandler(const UnixDomainSocket::Handler& r=
emote_handler,
> +-                                     const boost::asio::mutable_buffers=
_1& buffer,
> ++                                     const boost::asio::mutable_buffer&=
 buffer,
> +                                      const boost::system::error_code& e=
c,
> +                                      size_t length) {
> +     // The asynchronous receive may return EWOULDBLOCK or EAGAIN on som=
e
> +diff --git a/src/lib/dhcp/iface_mgr.cc b/src/lib/dhcp/iface_mgr.cc
> +index 01a1d63..419268b 100644
> +--- a/src/lib/dhcp/iface_mgr.cc
> ++++ b/src/lib/dhcp/iface_mgr.cc
> +@@ -1034,7 +1034,7 @@ IfaceMgr::getLocalAddress(const IOAddress& remote_=
addr, const uint16_t port) {
> +     }
> +
> +     // Create socket that will be used to connect to remote endpoint.
> +-    boost::asio::io_service io_service;
> ++    boost::asio::io_context io_service;
> +     boost::asio::ip::udp::socket sock(io_service);
> +
> +     boost::system::error_code err_code;
> diff --git a/meta/recipes-connectivity/kea/kea_2.6.1.bb b/meta/recipes-co=
nnectivity/kea/kea_2.6.1.bb
> index 4f8c4124cb4..19e07f5da39 100644
> --- a/meta/recipes-connectivity/kea/kea_2.6.1.bb
> +++ b/meta/recipes-connectivity/kea/kea_2.6.1.bb
> @@ -19,6 +19,7 @@ SRC_URI =3D "http://ftp.isc.org/isc/kea/${PV}/${BP}.tar=
.gz \
>             file://0001-src-lib-log-logger_unittest_support.cc-do-not-wri=
te-.patch \
>             file://0001-Replace-Name-NameString-with-vector-of-uint8_t.pa=
tch \
>             file://0002-Fix-unittests-Typo-in-Name-Name-append-to-ndata_-=
not.patch \
> +           file://0001-Update-asiolink-for-boost-1.87.patch \
>             "
>  SRC_URI[sha256sum] =3D "d2ce14a91c2e248ad2876e29152d647bcc5e433bc68dafad=
0ee96ec166fcfad1"
>
> diff --git a/meta/recipes-support/boost/boost-1.86.0.inc b/meta/recipes-s=
upport/boost/boost-1.87.0.inc
> similarity index 90%
> rename from meta/recipes-support/boost/boost-1.86.0.inc
> rename to meta/recipes-support/boost/boost-1.87.0.inc
> index 7113a500491..c6e55b239eb 100644
> --- a/meta/recipes-support/boost/boost-1.86.0.inc
> +++ b/meta/recipes-support/boost/boost-1.87.0.inc
> @@ -12,7 +12,7 @@ BOOST_MAJ =3D "${@"_".join(d.getVar("PV").split(".")[0:=
2])}"
>  BOOST_P =3D "boost_${BOOST_VER}"
>
>  SRC_URI =3D "https://archives.boost.io/release/${PV}/source/${BOOST_P}.t=
ar.bz2"
> -SRC_URI[sha256sum] =3D "1bed88e40401b2cb7a1f76d4bab499e352fa4d0c5f31c0db=
ae64e24d34d7513b"
> +SRC_URI[sha256sum] =3D "af57be25cb4c4f4b413ed692fe378affb4352ea50fbe294a=
11ef548f4d527d89"
>
>  UPSTREAM_CHECK_URI =3D "http://www.boost.org/users/download/"
>  UPSTREAM_CHECK_REGEX =3D "release/(?P<pver>.*)/source/"
> diff --git a/meta/recipes-support/boost/boost-build-native_1.86.0.bb b/me=
ta/recipes-support/boost/boost-build-native_1.87.0.bb
> similarity index 100%
> rename from meta/recipes-support/boost/boost-build-native_1.86.0.bb
> rename to meta/recipes-support/boost/boost-build-native_1.87.0.bb
> diff --git a/meta/recipes-support/boost/boost/0001-Don-t-set-up-arch-inst=
ruction-set-flags-we-do-that-o.patch b/meta/recipes-support/boost/boost/000=
1-Don-t-set-up-arch-instruction-set-flags-we-do-that-o.patch
> index 78f652f619c..04bede45787 100644
> --- a/meta/recipes-support/boost/boost/0001-Don-t-set-up-arch-instruction=
-set-flags-we-do-that-o.patch
> +++ b/meta/recipes-support/boost/boost/0001-Don-t-set-up-arch-instruction=
-set-flags-we-do-that-o.patch
> @@ -1,4 +1,4 @@
> -From f88354966fe3af33fd6d9ec889a8e3926b886a8a Mon Sep 17 00:00:00 2001
> +From e2cc24d6d8b7b24a6d0a30c52c7ad69a001a0ad5 Mon Sep 17 00:00:00 2001
>  From: Alexander Kanavin <alex.kanavin@gmail.com>
>  Date: Tue, 18 Dec 2018 15:42:57 +0100
>  Subject: [PATCH] Don't set up arch/instruction-set flags, we do that
> diff --git a/meta/recipes-support/boost/boost/0001-dont-setup-compiler-fl=
ags-m32-m64.patch b/meta/recipes-support/boost/boost/0001-dont-setup-compil=
er-flags-m32-m64.patch
> index 8f130348b0a..db1ee038987 100644
> --- a/meta/recipes-support/boost/boost/0001-dont-setup-compiler-flags-m32=
-m64.patch
> +++ b/meta/recipes-support/boost/boost/0001-dont-setup-compiler-flags-m32=
-m64.patch
> @@ -1,4 +1,4 @@
> -From 7130850d74863d1e9a0ae3e85462f1466bdf6d88 Mon Sep 17 00:00:00 2001
> +From b0728812241c048907e6f1ba168292cd9948347d Mon Sep 17 00:00:00 2001
>  From: Anuj Mittal <anuj.mittal@intel.com>
>  Date: Thu, 14 Nov 2019 10:13:53 +0800
>  Subject: [PATCH] dont setup compiler flags -m32/-m64
> diff --git a/meta/recipes-support/boost/boost/boost-math-disable-pch-for-=
gcc.patch b/meta/recipes-support/boost/boost/boost-math-disable-pch-for-gcc=
.patch
> index dde21fa0763..ad90d96dddf 100644
> --- a/meta/recipes-support/boost/boost/boost-math-disable-pch-for-gcc.pat=
ch
> +++ b/meta/recipes-support/boost/boost/boost-math-disable-pch-for-gcc.pat=
ch
> @@ -1,4 +1,4 @@
> -From c6009cdc1fe76db0092443593396e4d5f0eaa86b Mon Sep 17 00:00:00 2001
> +From e7491f9874411fd9855957812ba9bac948a61356 Mon Sep 17 00:00:00 2001
>  From: Jackie Huang <jackie.huang@windriver.com>
>  Date: Fri, 23 Sep 2016 01:04:50 -0700
>  Subject: [PATCH] boost-math: disable pch for gcc
> @@ -14,11 +14,11 @@ Signed-off-by: Jackie Huang <jackie.huang@windriver.c=
om>
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
>  diff --git a/libs/math/build/Jamfile.v2 b/libs/math/build/Jamfile.v2
> -index 6549e06b7..342cbf0b1 100644
> +index 500c77363..504d7d8c6 100644
>  --- a/libs/math/build/Jamfile.v2
>  +++ b/libs/math/build/Jamfile.v2
> -@@ -13,7 +13,7 @@ project
> -       <toolset>intel-win:<linkflags>-nologo
> +@@ -15,7 +15,7 @@ project
> +       <toolset>intel-win:<linkflags>-nologo
>         #<toolset>intel-linux:<pch>off
>         <toolset>intel-darwin:<pch>off
>  -      <toolset>gcc,<target-os>windows:<pch>off
> diff --git a/meta/recipes-support/boost/boost_1.86.0.bb b/meta/recipes-su=
pport/boost/boost_1.87.0.bb
> similarity index 100%
> rename from meta/recipes-support/boost/boost_1.86.0.bb
> rename to meta/recipes-support/boost/boost_1.87.0.bb
> --
> 2.39.5
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#209533): https://lists.openembedded.org/g/openembedde=
d-core/message/209533
> Mute This Topic: https://lists.openembedded.org/mt/110493599/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

