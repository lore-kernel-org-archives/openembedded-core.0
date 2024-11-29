Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 064CBD6EBFC
	for <webhook@archiver.kernel.org>; Fri, 29 Nov 2024 10:22:24 +0000 (UTC)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
 by mx.groups.io with SMTP id smtpd.web11.113489.1732875739879576269
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Nov 2024 02:22:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=D4mXlDJ5;
 spf=pass (domain: gmail.com, ip: 209.85.208.178, mailfrom: martin.jansa@gmail.com)
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2ffc016f301so19103651fa.1
        for <openembedded-core@lists.openembedded.org>; Fri, 29 Nov 2024 02:22:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732875738; x=1733480538; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XG2WE+PwSmd/j9jJtnuzZYJHYIUtnJVzUZOHGwM/FCA=;
        b=D4mXlDJ5YVAe069qat8ROy9tsEsCi1zjqPvkZh99CJfG7bj6Agz/dk5dwi36ClcT3j
         xHcUbJOgBMg0khqPoGaGtXiZbfT1n9hzxRkWBBTDk6Q19AeQz0gAQk6YsUTK5YUWKQrn
         Us4eX8Qey8JRBfWXSaeipRH1gJ4rpamRnEyDGziiyV4bDhJWRN9urr6QU4loWLdRA5B7
         44shEV91fWGgIke0VquuJvnhVlJuQXFDYIleajFD/CuRCS2p6JgUZTymoi9p1ajG+9LW
         UuSNUZ7Iuze1oHvKhkON9qw5CwG/QbWfseo0wAbbSuqOnilGvIdtGaI7QlVlcMcWRaGG
         FTvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732875738; x=1733480538;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XG2WE+PwSmd/j9jJtnuzZYJHYIUtnJVzUZOHGwM/FCA=;
        b=xSCNvBLki5B81uiTKKqQ57eCKQIoMIIIpHNKJyqL+JdWaYQPk4BM9PxGmDUzdYGdoD
         feuZn+QIwNdBxOQ+undJ4bbGOuUcnZpyn2B/WN0JhQ0JsRYC1MRaKKEhRiDG9f89L5HW
         SIEVO6aIp4ufTnrR8IXZuQFq+7r4k9tV9NlPbClUSWGWdeSsWEMWhH6B9otxpq3zrU67
         LKPkdT1KEr7DOdpnD6skJUaDaI5FaSh8AHfGcv7zH/accA0jE2+/P3yLnxh6tLy8TVGz
         jyRZUg/5Gt6ZdDJ7ix+G4J/Z/XXfECAt8yHS3utsWFWuJXRWpsAS2f/PmTcXSSk5vXxV
         I5KA==
X-Gm-Message-State: AOJu0Yyv/3Tf3aR6VJ7jDDAHpIGNsCHlVXbWQXX3WivRLo+W4O/yUmUP
	h3rSLyE7pR8M38+MOXVVXCyZBgut2cDxEug1BtUYeW6IZ+IzDF+UzQJcPDnsnJjs0+6uQ3oq1Hy
	aeVUK2f7mqDNEFfcNtjcKBDMG4KY=
X-Gm-Gg: ASbGncul88e+14jxSxjm7YdYDj1/Rk0StDcLS7cygwkODEHIPLEC8+gI7O3fYVCyY7x
	Cb5FY76SsvdJ4vqNvZbgpM6GsP9SKSB0KGg==
X-Google-Smtp-Source: AGHT+IEkLkkdNm2CiqMNXCYmhtOvpKYsn8re8Q5j/HU/5U3emuwFoCEpld/DAVmDZgsNU/j41SqQZneUg3Tpg1GiqWM=
X-Received: by 2002:a2e:a9a4:0:b0:2ff:cc70:1d8c with SMTP id
 38308e7fff4ca-2ffd60a50e3mr69054601fa.21.1732875737581; Fri, 29 Nov 2024
 02:22:17 -0800 (PST)
MIME-Version: 1.0
References: <20241129101258.277088-1-deepan.shivap@lge.com>
In-Reply-To: <20241129101258.277088-1-deepan.shivap@lge.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 29 Nov 2024 11:22:06 +0100
Message-ID: <CA+chaQe8n08_33ieSLwOo7D+s+yJPFiSnF85E1WP62893g+J6w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] ot-br-posix_git: Fix GCC-14 build
To: deepan.shivap@lge.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Nov 2024 10:22:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208010

Please read README file and send meta-oe changes to openembedded-devel ML.

On Fri, Nov 29, 2024 at 11:13=E2=80=AFAM deepan.shivap via
lists.openembedded.org <deepan.shivap=3Dlge.com@lists.openembedded.org>
wrote:
>
> From: "deepan.shivap" <deepan.shivap@lge.com>
>
> GCC 14 compiler uses -fvisibility-inlines-hidden by default and
> it creates visibility conflicts.
>
> Add .patch file to resolve build error.
>
> Update SRCREV to latest Upstream.
>
> Signed-off-by: deepan.shivap <deepan.shivap@lge.com>
> ---
>  .../0001-fix-build-on-GCC-14-for-yocto.patch  | 292 ++++++++++++++++++
>  .../openthread/ot-br-posix_git.bb             |   8 +-
>  2 files changed, 294 insertions(+), 6 deletions(-)
>  create mode 100644 meta-networking/recipes-connectivity/openthread/ot-br=
-posix/0001-fix-build-on-GCC-14-for-yocto.patch
>
> diff --git a/meta-networking/recipes-connectivity/openthread/ot-br-posix/=
0001-fix-build-on-GCC-14-for-yocto.patch b/meta-networking/recipes-connecti=
vity/openthread/ot-br-posix/0001-fix-build-on-GCC-14-for-yocto.patch
> new file mode 100644
> index 000000000..53fc0aac7
> --- /dev/null
> +++ b/meta-networking/recipes-connectivity/openthread/ot-br-posix/0001-fi=
x-build-on-GCC-14-for-yocto.patch
> @@ -0,0 +1,292 @@
> +From b34d0665b790016165b4a9b565f462712057b2b5 Mon Sep 17 00:00:00 2001
> +From: "deepan.shivap" <deepan.shivap@lge.com>
> +Date: Wed, 13 Nov 2024 21:30:38 +0900
> +Subject: [PATCH] fix build on GCC 14 for yocto
> +
> +GCC 14 compiler uses -fvisibility-inlines-hidden by default and
> +it creates visibility conflicts.
> +
> +Compilation error:
> +
> +error: 'ot::BorderRouter::RoutingManager::RxRaTracker' declared with
> +greater visibility than the type of its field 'ot::BorderRouter::
> +RoutingManager::RxRaTracker::mSignalTask' [-Werror=3Dattributes]
> +| 814 | class RxRaTracker : public InstanceLocator
> +| | ^~~~~~~~~~~
> +| compilation terminated due to -Wfatal-errors.
> +| cc1: all warnings being treated as errors
> +
> +In addition, for below error I have added changes refering -
> +https://github.com/openwrt/openwrt/blob/main/package/libs/mbedtls/patche=
s/100-fix-gcc14-build.patch
> +
> +error: array subscript 48 is outside array bounds of 'unsigned char[48]'=
 [-Werror=3Darray-bounds=3D]
> +| 235 | r[i] =3D a[i] ^ b[i];
> +| | ~^~~
> +| compilation terminated due to -Wfatal-errors.
> +| cc1: all warnings being treated as errors
> +
> +---
> +Upstream-Status: Denied [Reason -  https://github.com/openthread/openthr=
ead/pull/10925]
> +
> + src/core/border_router/routing_manager.cpp | 58 ++++++++++++++++++++++
> + src/core/border_router/routing_manager.hpp | 18 +++----
> + src/core/mac/data_poll_sender.cpp          |  5 ++
> + src/core/mac/data_poll_sender.hpp          |  2 +-
> + src/core/net/srp_client.cpp                |  2 +
> + src/core/net/srp_client.hpp                |  2 +-
> + src/core/thread/mle.cpp                    | 10 ++++
> + src/core/thread/mle.hpp                    |  4 +-
> + third_party/mbedtls/repo/library/common.h  |  2 +-
> + 9 files changed, 89 insertions(+), 14 deletions(-)
> +
> +diff --git a/src/core/border_router/routing_manager.cpp b/src/core/borde=
r_router/routing_manager.cpp
> +index 5f7916ba4..664963757 100644
> +--- a/src/core/border_router/routing_manager.cpp
> ++++ b/src/core/border_router/routing_manager.cpp
> +@@ -806,6 +806,64 @@ bool RoutingManager::NetworkDataContainsUlaRoute(vo=
id) const
> +     return contains;
> + }
> +
> ++void RoutingManager::HandleRxRaTrackerSignalTask(void)
> ++{
> ++    mRxRaTracker.HandleSignalTask();
> ++}
> ++
> ++void RoutingManager::HandleRxRaTrackerExpirationTimer(void)
> ++{
> ++    mRxRaTracker.HandleExpirationTimer();
> ++}
> ++
> ++void RoutingManager::HandleRxRaTrackerStaleTimer(void)
> ++{
> ++    mRxRaTracker.HandleStaleTimer();
> ++}
> ++
> ++void RoutingManager::HandleRxRaTrackerRouterTimer(void)
> ++{
> ++    mRxRaTracker.HandleRouterTimer();
> ++}
> ++
> ++void RoutingManager::HandleOnLinkPrefixManagerTimer(void)
> ++{
> ++    mOnLinkPrefixManager.HandleTimer();
> ++}
> ++
> ++void RoutingManager::HandleRioAdvertiserimer(void)
> ++{
> ++    mRioAdvertiser.HandleTimer();
> ++}
> ++
> ++#if OPENTHREAD_CONFIG_NAT64_BORDER_ROUTING_ENABLE
> ++
> ++void RoutingManager::HandleNat64PrefixManagerTimer(void)
> ++{
> ++    mNat64PrefixManager.HandleTimer();
> ++}
> ++
> ++#endif // OPENTHREAD_CONFIG_NAT64_BORDER_ROUTING_ENABLE
> ++
> ++void RoutingManager::HandleRoutePublisherTimer(void)
> ++{
> ++    mRoutePublisher.HandleTimer();
> ++}
> ++
> ++void RoutingManager::HandleRsSenderTimer(void)
> ++{
> ++    mRsSender.HandleTimer();
> ++}
> ++
> ++#if OPENTHREAD_CONFIG_BORDER_ROUTING_DHCP6_PD_ENABLE
> ++
> ++void HandlePdPrefixManagerTimer(void)
> ++{
> ++    mPdPrefixManager.HandleTimer();
> ++}
> ++
> ++#endif // OPENTHREAD_CONFIG_BORDER_ROUTING_DHCP6_PD_ENABLE
> ++
> + #if OPENTHREAD_CONFIG_BORDER_ROUTING_REACHABILITY_CHECK_ICMP6_ERROR_ENA=
BLE
> +
> + void RoutingManager::CheckReachabilityToSendIcmpError(const Message &aM=
essage, const Ip6::Header &aIp6Header)
> +diff --git a/src/core/border_router/routing_manager.hpp b/src/core/borde=
r_router/routing_manager.hpp
> +index bfc138957..cc866e308 100644
> +--- a/src/core/border_router/routing_manager.hpp
> ++++ b/src/core/border_router/routing_manager.hpp
> +@@ -804,10 +804,10 @@ private:
> +
> +     //- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -=
 - - - - - - - - - - - - - - - - - - - - - - - -
> +
> +-    void HandleRxRaTrackerSignalTask(void) { mRxRaTracker.HandleSignalT=
ask(); }
> +-    void HandleRxRaTrackerExpirationTimer(void) { mRxRaTracker.HandleEx=
pirationTimer(); }
> +-    void HandleRxRaTrackerStaleTimer(void) { mRxRaTracker.HandleStaleTi=
mer(); }
> +-    void HandleRxRaTrackerRouterTimer(void) { mRxRaTracker.HandleRouter=
Timer(); }
> ++    void HandleRxRaTrackerSignalTask(void);
> ++    void HandleRxRaTrackerExpirationTimer(void);
> ++    void HandleRxRaTrackerStaleTimer(void);
> ++    void HandleRxRaTrackerRouterTimer(void);
> +
> +     class RxRaTracker : public InstanceLocator
> +     {
> +@@ -1144,7 +1144,7 @@ private:
> +
> +     //- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -=
 - - - - - - - - - - - - - - - - - - - - - - - -
> +
> +-    void HandleOnLinkPrefixManagerTimer(void) { mOnLinkPrefixManager.Ha=
ndleTimer(); }
> ++    void HandleOnLinkPrefixManagerTimer(void);
> +
> +     class OnLinkPrefixManager : public InstanceLocator
> +     {
> +@@ -1215,7 +1215,7 @@ private:
> +
> +     //- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -=
 - - - - - - - - - - - - - - - - - - - - - - - -
> +
> +-    void HandleRioAdvertiserimer(void) { mRioAdvertiser.HandleTimer(); =
}
> ++    void HandleRioAdvertiserimer(void);
> +
> +     class RioAdvertiser : public InstanceLocator
> +     {
> +@@ -1278,7 +1278,7 @@ private:
> +
> + #if OPENTHREAD_CONFIG_NAT64_BORDER_ROUTING_ENABLE
> +
> +-    void HandleNat64PrefixManagerTimer(void) { mNat64PrefixManager.Hand=
leTimer(); }
> ++    void HandleNat64PrefixManagerTimer(void);
> +
> +     class Nat64PrefixManager : public InstanceLocator
> +     {
> +@@ -1326,7 +1326,7 @@ private:
> +
> +     //- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -=
 - - - - - - - - - - - - - - - - - - - - - - - -
> +
> +-    void HandleRoutePublisherTimer(void) { mRoutePublisher.HandleTimer(=
); }
> ++    void HandleRoutePublisherTimer(void);
> +
> +     class RoutePublisher : public InstanceLocator // Manages the routes=
 that are published in net data
> +     {
> +@@ -1411,7 +1411,7 @@ private:
> +
> +     //- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -=
 - - - - - - - - - - - - - - - - - - - - - - - -
> +
> +-    void HandleRsSenderTimer(void) { mRsSender.HandleTimer(); }
> ++    void HandleRsSenderTimer(void);
> +
> +     class RsSender : public InstanceLocator
> +     {
> +diff --git a/src/core/mac/data_poll_sender.cpp b/src/core/mac/data_poll_=
sender.cpp
> +index c21bbacfe..6b974e164 100644
> +--- a/src/core/mac/data_poll_sender.cpp
> ++++ b/src/core/mac/data_poll_sender.cpp
> +@@ -517,6 +517,11 @@ uint32_t DataPollSender::CalculatePollPeriod(void) =
const
> +     return period;
> + }
> +
> ++void DataPollSender::HandlePollTimer(void)
> ++{
> ++    IgnoreError(SendDataPoll());
> ++}
> ++
> + uint32_t DataPollSender::GetDefaultPollPeriod(void) const
> + {
> +     uint32_t pollAhead =3D static_cast<uint32_t>(kRetxPollPeriod) * kMa=
xPollRetxAttempts;
> +diff --git a/src/core/mac/data_poll_sender.hpp b/src/core/mac/data_poll_=
sender.hpp
> +index 1c532ab51..4db8e5923 100644
> +--- a/src/core/mac/data_poll_sender.hpp
> ++++ b/src/core/mac/data_poll_sender.hpp
> +@@ -257,7 +257,7 @@ private:
> +     void            ScheduleNextPoll(PollPeriodSelector aPollPeriodSele=
ctor);
> +     uint32_t        CalculatePollPeriod(void) const;
> +     const Neighbor &GetParent(void) const;
> +-    void            HandlePollTimer(void) { IgnoreError(SendDataPoll())=
; }
> ++    void            HandlePollTimer(void);
> + #if OPENTHREAD_CONFIG_MULTI_RADIO
> +     Error GetPollDestinationAddress(Mac::Address &aDest, Mac::RadioType=
 &aRadioType) const;
> + #else
> +diff --git a/src/core/net/srp_client.cpp b/src/core/net/srp_client.cpp
> +index b7150ff7f..12b8f0b4f 100644
> +--- a/src/core/net/srp_client.cpp
> ++++ b/src/core/net/srp_client.cpp
> +@@ -2444,6 +2444,8 @@ exit:
> +     return error;
> + }
> +
> ++void Client::HandleGuardTimer(void){}
> ++
> + #if OPENTHREAD_CONFIG_SRP_CLIENT_SWITCH_SERVER_ON_FAILURE
> + void Client::SelectNextServer(bool aDisallowSwitchOnRegisteredHost)
> + {
> +diff --git a/src/core/net/srp_client.hpp b/src/core/net/srp_client.hpp
> +index 8f5891bd0..367b1d280 100644
> +--- a/src/core/net/srp_client.hpp
> ++++ b/src/core/net/srp_client.hpp
> +@@ -1052,7 +1052,7 @@ private:
> +     void  ApplyAutoStartGuardOnAttach(void);
> +     void  ProcessAutoStart(void);
> +     Error SelectUnicastEntry(DnsSrpUnicastType aType, DnsSrpUnicastInfo=
 &aInfo) const;
> +-    void  HandleGuardTimer(void) {}
> ++    void  HandleGuardTimer(void);
> + #if OPENTHREAD_CONFIG_SRP_CLIENT_SWITCH_SERVER_ON_FAILURE
> +     void SelectNextServer(bool aDisallowSwitchOnRegisteredHost);
> + #endif
> +diff --git a/src/core/thread/mle.cpp b/src/core/thread/mle.cpp
> +index 4de4705be..2e07222fc 100644
> +--- a/src/core/thread/mle.cpp
> ++++ b/src/core/thread/mle.cpp
> +@@ -3853,6 +3853,11 @@ exit:
> +
> + #if OPENTHREAD_CONFIG_PARENT_SEARCH_ENABLE
> +
> ++void Mle::HandleParentSearchTimer(void)
> ++{
> ++    mParentSearch.HandleTimer();
> ++}
> ++
> + void Mle::ParentSearch::SetEnabled(bool aEnabled)
> + {
> +     VerifyOrExit(mEnabled !=3D aEnabled);
> +@@ -4423,6 +4428,11 @@ void Mle::TlvList::AddElementsFrom(const TlvList =
&aTlvList)
> + //---------------------------------------------------------------------=
------------------------------------------------
> + // DelayedSender
> +
> ++void Mle::HandleDelayedSenderTimer(void)
> ++{
> ++    mDelayedSender.HandleTimer();
> ++}
> ++
> + Mle::DelayedSender::DelayedSender(Instance &aInstance)
> +     : InstanceLocator(aInstance)
> +     , mTimer(aInstance)
> +diff --git a/src/core/thread/mle.hpp b/src/core/thread/mle.hpp
> +index 58dcea1e7..613334896 100644
> +--- a/src/core/thread/mle.hpp
> ++++ b/src/core/thread/mle.hpp
> +@@ -1087,7 +1087,7 @@ private:
> +
> +     //- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -=
 - - - - - - - - - - - - - - - - - - - - - - - -
> +
> +-    void HandleDelayedSenderTimer(void) { mDelayedSender.HandleTimer();=
 }
> ++    void HandleDelayedSenderTimer(void);
> +
> +     class DelayedSender : public InstanceLocator
> +     {
> +@@ -1210,7 +1210,7 @@ private:
> +     //- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -=
 - - - - - - - - - - - - - - - - - - - - - - - -
> +
> + #if OPENTHREAD_CONFIG_PARENT_SEARCH_ENABLE
> +-    void HandleParentSearchTimer(void) { mParentSearch.HandleTimer(); }
> ++    void HandleParentSearchTimer(void);
> +
> +     class ParentSearch : public InstanceLocator
> +     {
> +diff --git a/third_party/mbedtls/repo/library/common.h b/third_party/mbe=
dtls/repo/library/common.h
> +index 3936ffdfe..ce4dc1130 100644
> +--- a/third_party/mbedtls/repo/library/common.h
> ++++ b/third_party/mbedtls/repo/library/common.h
> +@@ -199,7 +199,7 @@ static inline void mbedtls_xor(unsigned char *r,
> +         uint8x16_t x =3D veorq_u8(v1, v2);
> +         vst1q_u8(r + i, x);
> +     }
> +-#if defined(__IAR_SYSTEMS_ICC__)
> ++#if defined(__IAR_SYSTEMS_ICC__) || (defined(MBEDTLS_COMPILER_IS_GCC) &=
& MBEDTLS_GCC_VERSION >=3D 140100)
> +     /* This if statement helps some compilers (e.g., IAR) optimise out =
the byte-by-byte tail case
> +      * where n is a constant multiple of 16.
> +      * For other compilers (e.g. recent gcc and clang) it makes no diff=
erence if n is a compile-time
> diff --git a/meta-networking/recipes-connectivity/openthread/ot-br-posix_=
git.bb b/meta-networking/recipes-connectivity/openthread/ot-br-posix_git.bb
> index ec930de27..8183f5203 100644
> --- a/meta-networking/recipes-connectivity/openthread/ot-br-posix_git.bb
> +++ b/meta-networking/recipes-connectivity/openthread/ot-br-posix_git.bb
> @@ -11,14 +11,14 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D87109e44b2=
fda96a8991f27684a7349c \
>                      file://third_party/openthread/repo/LICENSE;md5=3D543=
b6fe90ec5901a683320a36390c65f \
>                      "
>  DEPENDS =3D "autoconf-archive dbus readline avahi jsoncpp boost libnetfi=
lter-queue protobuf protobuf-native"
> -SRCREV =3D "a35cc682305bb2201c314472adf06a4960536750"
> +SRCREV =3D "b041fa52daaa4dfbf6aa4665d8925c1be0350ca5"
>  PV =3D "0.3.0+git"
>
>  SRC_URI =3D "gitsm://github.com/openthread/ot-br-posix.git;protocol=3Dht=
tps;branch=3Dmain \
>             file://0001-otbr-agent.service.in-remove-pre-exec-hook-for-md=
ns-.patch \
>             file://0001-cmake-Disable-nonnull-compare-warning-on-gcc.patc=
h \
>             file://default-cxx-std.patch \
> -           file://musl-fixes.patch \
> +           file://0001-fix-build-on-GCC-14-for-yocto.patch;patchdir=3Dth=
ird_party/openthread/repo \
>             "
>
>  S =3D "${WORKDIR}/git"
> @@ -67,7 +67,3 @@ RCONFLICTS:${PN} =3D "ot-daemon"
>
>  FILES:${PN} +=3D "${systemd_unitdir}/*"
>  FILES:${PN} +=3D "${datadir}/*"
> -
> -# http://errors.yoctoproject.org/Errors/Details/766903/
> -# git/third_party/openthread/repo/src/core/border_router/routing_manager=
.hpp:615:11: error: 'ot::BorderRouter::RoutingManager::DiscoveredPrefixTabl=
e' declared with greater visibility than the type of its field 'ot::BorderR=
outer::RoutingManager::DiscoveredPrefixTable::mEntryTimer' [-Werror=3Dattri=
butes]
> -CXXFLAGS +=3D "-Wno-error=3Dattributes"
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#208009): https://lists.openembedded.org/g/openembedde=
d-core/message/208009
> Mute This Topic: https://lists.openembedded.org/mt/109832304/3617156
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ma=
rtin.jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

