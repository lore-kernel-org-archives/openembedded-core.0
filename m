Return-Path: <deepan.shivap@lge.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF2E6D6EBF4
	for <webhook@archiver.kernel.org>; Fri, 29 Nov 2024 10:13:13 +0000 (UTC)
Received: from lgeamrelo11.lge.com (lgeamrelo11.lge.com [156.147.23.51])
 by mx.groups.io with SMTP id smtpd.web10.112657.1732875190921740812
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Nov 2024 02:13:11 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: lge.com, ip: 156.147.23.51, mailfrom: deepan.shivap@lge.com)
Received: from unknown (HELO lgeamrelo04.lge.com) (156.147.1.127)
	by 156.147.23.51 with ESMTP; 29 Nov 2024 19:13:08 +0900
X-Original-SENDERIP: 156.147.1.127
X-Original-MAILFROM: deepan.shivap@lge.com
Received: from unknown (HELO deepan-shivap-deepan.bee-live.svc.cluster.local) (10.185.60.40)
	by 156.147.1.127 with ESMTP; 29 Nov 2024 19:13:08 +0900
X-Original-SENDERIP: 10.185.60.40
X-Original-MAILFROM: deepan.shivap@lge.com
From: deepan.shivap@lge.com
To: openembedded-core@lists.openembedded.org
Cc: "deepan.shivap" <deepan.shivap@lge.com>
Subject: [PATCH] ot-br-posix_git: Fix GCC-14 build
Date: Fri, 29 Nov 2024 19:12:58 +0900
Message-Id: <20241129101258.277088-1-deepan.shivap@lge.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Nov 2024 10:13:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208009

From: "deepan.shivap" <deepan.shivap@lge.com>

GCC 14 compiler uses -fvisibility-inlines-hidden by default and
it creates visibility conflicts.

Add .patch file to resolve build error.

Update SRCREV to latest Upstream.

Signed-off-by: deepan.shivap <deepan.shivap@lge.com>
---
 .../0001-fix-build-on-GCC-14-for-yocto.patch  | 292 ++++++++++++++++++
 .../openthread/ot-br-posix_git.bb             |   8 +-
 2 files changed, 294 insertions(+), 6 deletions(-)
 create mode 100644 meta-networking/recipes-connectivity/openthread/ot-br-posix/0001-fix-build-on-GCC-14-for-yocto.patch

diff --git a/meta-networking/recipes-connectivity/openthread/ot-br-posix/0001-fix-build-on-GCC-14-for-yocto.patch b/meta-networking/recipes-connectivity/openthread/ot-br-posix/0001-fix-build-on-GCC-14-for-yocto.patch
new file mode 100644
index 000000000..53fc0aac7
--- /dev/null
+++ b/meta-networking/recipes-connectivity/openthread/ot-br-posix/0001-fix-build-on-GCC-14-for-yocto.patch
@@ -0,0 +1,292 @@
+From b34d0665b790016165b4a9b565f462712057b2b5 Mon Sep 17 00:00:00 2001
+From: "deepan.shivap" <deepan.shivap@lge.com>
+Date: Wed, 13 Nov 2024 21:30:38 +0900
+Subject: [PATCH] fix build on GCC 14 for yocto
+
+GCC 14 compiler uses -fvisibility-inlines-hidden by default and
+it creates visibility conflicts.
+
+Compilation error:
+
+error: 'ot::BorderRouter::RoutingManager::RxRaTracker' declared with
+greater visibility than the type of its field 'ot::BorderRouter::
+RoutingManager::RxRaTracker::mSignalTask' [-Werror=attributes]
+| 814 | class RxRaTracker : public InstanceLocator
+| | ^~~~~~~~~~~
+| compilation terminated due to -Wfatal-errors.
+| cc1: all warnings being treated as errors
+
+In addition, for below error I have added changes refering -
+https://github.com/openwrt/openwrt/blob/main/package/libs/mbedtls/patches/100-fix-gcc14-build.patch
+
+error: array subscript 48 is outside array bounds of 'unsigned char[48]' [-Werror=array-bounds=]
+| 235 | r[i] = a[i] ^ b[i];
+| | ~^~~
+| compilation terminated due to -Wfatal-errors.
+| cc1: all warnings being treated as errors
+
+---
+Upstream-Status: Denied [Reason -  https://github.com/openthread/openthread/pull/10925]
+
+ src/core/border_router/routing_manager.cpp | 58 ++++++++++++++++++++++
+ src/core/border_router/routing_manager.hpp | 18 +++----
+ src/core/mac/data_poll_sender.cpp          |  5 ++
+ src/core/mac/data_poll_sender.hpp          |  2 +-
+ src/core/net/srp_client.cpp                |  2 +
+ src/core/net/srp_client.hpp                |  2 +-
+ src/core/thread/mle.cpp                    | 10 ++++
+ src/core/thread/mle.hpp                    |  4 +-
+ third_party/mbedtls/repo/library/common.h  |  2 +-
+ 9 files changed, 89 insertions(+), 14 deletions(-)
+
+diff --git a/src/core/border_router/routing_manager.cpp b/src/core/border_router/routing_manager.cpp
+index 5f7916ba4..664963757 100644
+--- a/src/core/border_router/routing_manager.cpp
++++ b/src/core/border_router/routing_manager.cpp
+@@ -806,6 +806,64 @@ bool RoutingManager::NetworkDataContainsUlaRoute(void) const
+     return contains;
+ }
+
++void RoutingManager::HandleRxRaTrackerSignalTask(void)
++{
++    mRxRaTracker.HandleSignalTask();
++}
++
++void RoutingManager::HandleRxRaTrackerExpirationTimer(void)
++{
++    mRxRaTracker.HandleExpirationTimer();
++}
++
++void RoutingManager::HandleRxRaTrackerStaleTimer(void)
++{
++    mRxRaTracker.HandleStaleTimer();
++}
++
++void RoutingManager::HandleRxRaTrackerRouterTimer(void)
++{
++    mRxRaTracker.HandleRouterTimer();
++}
++
++void RoutingManager::HandleOnLinkPrefixManagerTimer(void)
++{
++    mOnLinkPrefixManager.HandleTimer();
++}
++
++void RoutingManager::HandleRioAdvertiserimer(void)
++{
++    mRioAdvertiser.HandleTimer();
++}
++
++#if OPENTHREAD_CONFIG_NAT64_BORDER_ROUTING_ENABLE
++
++void RoutingManager::HandleNat64PrefixManagerTimer(void)
++{
++    mNat64PrefixManager.HandleTimer();
++}
++
++#endif // OPENTHREAD_CONFIG_NAT64_BORDER_ROUTING_ENABLE
++
++void RoutingManager::HandleRoutePublisherTimer(void)
++{
++    mRoutePublisher.HandleTimer();
++}
++
++void RoutingManager::HandleRsSenderTimer(void)
++{
++    mRsSender.HandleTimer();
++}
++
++#if OPENTHREAD_CONFIG_BORDER_ROUTING_DHCP6_PD_ENABLE
++
++void HandlePdPrefixManagerTimer(void)
++{
++    mPdPrefixManager.HandleTimer();
++}
++
++#endif // OPENTHREAD_CONFIG_BORDER_ROUTING_DHCP6_PD_ENABLE
++
+ #if OPENTHREAD_CONFIG_BORDER_ROUTING_REACHABILITY_CHECK_ICMP6_ERROR_ENABLE
+
+ void RoutingManager::CheckReachabilityToSendIcmpError(const Message &aMessage, const Ip6::Header &aIp6Header)
+diff --git a/src/core/border_router/routing_manager.hpp b/src/core/border_router/routing_manager.hpp
+index bfc138957..cc866e308 100644
+--- a/src/core/border_router/routing_manager.hpp
++++ b/src/core/border_router/routing_manager.hpp
+@@ -804,10 +804,10 @@ private:
+
+     //- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
+
+-    void HandleRxRaTrackerSignalTask(void) { mRxRaTracker.HandleSignalTask(); }
+-    void HandleRxRaTrackerExpirationTimer(void) { mRxRaTracker.HandleExpirationTimer(); }
+-    void HandleRxRaTrackerStaleTimer(void) { mRxRaTracker.HandleStaleTimer(); }
+-    void HandleRxRaTrackerRouterTimer(void) { mRxRaTracker.HandleRouterTimer(); }
++    void HandleRxRaTrackerSignalTask(void);
++    void HandleRxRaTrackerExpirationTimer(void);
++    void HandleRxRaTrackerStaleTimer(void);
++    void HandleRxRaTrackerRouterTimer(void);
+
+     class RxRaTracker : public InstanceLocator
+     {
+@@ -1144,7 +1144,7 @@ private:
+
+     //- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
+
+-    void HandleOnLinkPrefixManagerTimer(void) { mOnLinkPrefixManager.HandleTimer(); }
++    void HandleOnLinkPrefixManagerTimer(void);
+
+     class OnLinkPrefixManager : public InstanceLocator
+     {
+@@ -1215,7 +1215,7 @@ private:
+
+     //- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
+
+-    void HandleRioAdvertiserimer(void) { mRioAdvertiser.HandleTimer(); }
++    void HandleRioAdvertiserimer(void);
+
+     class RioAdvertiser : public InstanceLocator
+     {
+@@ -1278,7 +1278,7 @@ private:
+
+ #if OPENTHREAD_CONFIG_NAT64_BORDER_ROUTING_ENABLE
+
+-    void HandleNat64PrefixManagerTimer(void) { mNat64PrefixManager.HandleTimer(); }
++    void HandleNat64PrefixManagerTimer(void);
+
+     class Nat64PrefixManager : public InstanceLocator
+     {
+@@ -1326,7 +1326,7 @@ private:
+
+     //- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
+
+-    void HandleRoutePublisherTimer(void) { mRoutePublisher.HandleTimer(); }
++    void HandleRoutePublisherTimer(void);
+
+     class RoutePublisher : public InstanceLocator // Manages the routes that are published in net data
+     {
+@@ -1411,7 +1411,7 @@ private:
+
+     //- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
+
+-    void HandleRsSenderTimer(void) { mRsSender.HandleTimer(); }
++    void HandleRsSenderTimer(void);
+
+     class RsSender : public InstanceLocator
+     {
+diff --git a/src/core/mac/data_poll_sender.cpp b/src/core/mac/data_poll_sender.cpp
+index c21bbacfe..6b974e164 100644
+--- a/src/core/mac/data_poll_sender.cpp
++++ b/src/core/mac/data_poll_sender.cpp
+@@ -517,6 +517,11 @@ uint32_t DataPollSender::CalculatePollPeriod(void) const
+     return period;
+ }
+
++void DataPollSender::HandlePollTimer(void)
++{
++    IgnoreError(SendDataPoll());
++}
++
+ uint32_t DataPollSender::GetDefaultPollPeriod(void) const
+ {
+     uint32_t pollAhead = static_cast<uint32_t>(kRetxPollPeriod) * kMaxPollRetxAttempts;
+diff --git a/src/core/mac/data_poll_sender.hpp b/src/core/mac/data_poll_sender.hpp
+index 1c532ab51..4db8e5923 100644
+--- a/src/core/mac/data_poll_sender.hpp
++++ b/src/core/mac/data_poll_sender.hpp
+@@ -257,7 +257,7 @@ private:
+     void            ScheduleNextPoll(PollPeriodSelector aPollPeriodSelector);
+     uint32_t        CalculatePollPeriod(void) const;
+     const Neighbor &GetParent(void) const;
+-    void            HandlePollTimer(void) { IgnoreError(SendDataPoll()); }
++    void            HandlePollTimer(void);
+ #if OPENTHREAD_CONFIG_MULTI_RADIO
+     Error GetPollDestinationAddress(Mac::Address &aDest, Mac::RadioType &aRadioType) const;
+ #else
+diff --git a/src/core/net/srp_client.cpp b/src/core/net/srp_client.cpp
+index b7150ff7f..12b8f0b4f 100644
+--- a/src/core/net/srp_client.cpp
++++ b/src/core/net/srp_client.cpp
+@@ -2444,6 +2444,8 @@ exit:
+     return error;
+ }
+
++void Client::HandleGuardTimer(void){}
++
+ #if OPENTHREAD_CONFIG_SRP_CLIENT_SWITCH_SERVER_ON_FAILURE
+ void Client::SelectNextServer(bool aDisallowSwitchOnRegisteredHost)
+ {
+diff --git a/src/core/net/srp_client.hpp b/src/core/net/srp_client.hpp
+index 8f5891bd0..367b1d280 100644
+--- a/src/core/net/srp_client.hpp
++++ b/src/core/net/srp_client.hpp
+@@ -1052,7 +1052,7 @@ private:
+     void  ApplyAutoStartGuardOnAttach(void);
+     void  ProcessAutoStart(void);
+     Error SelectUnicastEntry(DnsSrpUnicastType aType, DnsSrpUnicastInfo &aInfo) const;
+-    void  HandleGuardTimer(void) {}
++    void  HandleGuardTimer(void);
+ #if OPENTHREAD_CONFIG_SRP_CLIENT_SWITCH_SERVER_ON_FAILURE
+     void SelectNextServer(bool aDisallowSwitchOnRegisteredHost);
+ #endif
+diff --git a/src/core/thread/mle.cpp b/src/core/thread/mle.cpp
+index 4de4705be..2e07222fc 100644
+--- a/src/core/thread/mle.cpp
++++ b/src/core/thread/mle.cpp
+@@ -3853,6 +3853,11 @@ exit:
+
+ #if OPENTHREAD_CONFIG_PARENT_SEARCH_ENABLE
+
++void Mle::HandleParentSearchTimer(void)
++{
++    mParentSearch.HandleTimer();
++}
++
+ void Mle::ParentSearch::SetEnabled(bool aEnabled)
+ {
+     VerifyOrExit(mEnabled != aEnabled);
+@@ -4423,6 +4428,11 @@ void Mle::TlvList::AddElementsFrom(const TlvList &aTlvList)
+ //---------------------------------------------------------------------------------------------------------------------
+ // DelayedSender
+
++void Mle::HandleDelayedSenderTimer(void)
++{
++    mDelayedSender.HandleTimer();
++}
++
+ Mle::DelayedSender::DelayedSender(Instance &aInstance)
+     : InstanceLocator(aInstance)
+     , mTimer(aInstance)
+diff --git a/src/core/thread/mle.hpp b/src/core/thread/mle.hpp
+index 58dcea1e7..613334896 100644
+--- a/src/core/thread/mle.hpp
++++ b/src/core/thread/mle.hpp
+@@ -1087,7 +1087,7 @@ private:
+
+     //- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
+
+-    void HandleDelayedSenderTimer(void) { mDelayedSender.HandleTimer(); }
++    void HandleDelayedSenderTimer(void);
+
+     class DelayedSender : public InstanceLocator
+     {
+@@ -1210,7 +1210,7 @@ private:
+     //- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
+
+ #if OPENTHREAD_CONFIG_PARENT_SEARCH_ENABLE
+-    void HandleParentSearchTimer(void) { mParentSearch.HandleTimer(); }
++    void HandleParentSearchTimer(void);
+
+     class ParentSearch : public InstanceLocator
+     {
+diff --git a/third_party/mbedtls/repo/library/common.h b/third_party/mbedtls/repo/library/common.h
+index 3936ffdfe..ce4dc1130 100644
+--- a/third_party/mbedtls/repo/library/common.h
++++ b/third_party/mbedtls/repo/library/common.h
+@@ -199,7 +199,7 @@ static inline void mbedtls_xor(unsigned char *r,
+         uint8x16_t x = veorq_u8(v1, v2);
+         vst1q_u8(r + i, x);
+     }
+-#if defined(__IAR_SYSTEMS_ICC__)
++#if defined(__IAR_SYSTEMS_ICC__) || (defined(MBEDTLS_COMPILER_IS_GCC) && MBEDTLS_GCC_VERSION >= 140100)
+     /* This if statement helps some compilers (e.g., IAR) optimise out the byte-by-byte tail case
+      * where n is a constant multiple of 16.
+      * For other compilers (e.g. recent gcc and clang) it makes no difference if n is a compile-time
diff --git a/meta-networking/recipes-connectivity/openthread/ot-br-posix_git.bb b/meta-networking/recipes-connectivity/openthread/ot-br-posix_git.bb
index ec930de27..8183f5203 100644
--- a/meta-networking/recipes-connectivity/openthread/ot-br-posix_git.bb
+++ b/meta-networking/recipes-connectivity/openthread/ot-br-posix_git.bb
@@ -11,14 +11,14 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=87109e44b2fda96a8991f27684a7349c \
                     file://third_party/openthread/repo/LICENSE;md5=543b6fe90ec5901a683320a36390c65f \
                     "
 DEPENDS = "autoconf-archive dbus readline avahi jsoncpp boost libnetfilter-queue protobuf protobuf-native"
-SRCREV = "a35cc682305bb2201c314472adf06a4960536750"
+SRCREV = "b041fa52daaa4dfbf6aa4665d8925c1be0350ca5"
 PV = "0.3.0+git"
 
 SRC_URI = "gitsm://github.com/openthread/ot-br-posix.git;protocol=https;branch=main \
            file://0001-otbr-agent.service.in-remove-pre-exec-hook-for-mdns-.patch \
            file://0001-cmake-Disable-nonnull-compare-warning-on-gcc.patch \
            file://default-cxx-std.patch \
-           file://musl-fixes.patch \
+           file://0001-fix-build-on-GCC-14-for-yocto.patch;patchdir=third_party/openthread/repo \
            "
 
 S = "${WORKDIR}/git"
@@ -67,7 +67,3 @@ RCONFLICTS:${PN} = "ot-daemon"
 
 FILES:${PN} += "${systemd_unitdir}/*"
 FILES:${PN} += "${datadir}/*"
-
-# http://errors.yoctoproject.org/Errors/Details/766903/
-# git/third_party/openthread/repo/src/core/border_router/routing_manager.hpp:615:11: error: 'ot::BorderRouter::RoutingManager::DiscoveredPrefixTable' declared with greater visibility than the type of its field 'ot::BorderRouter::RoutingManager::DiscoveredPrefixTable::mEntryTimer' [-Werror=attributes]
-CXXFLAGS += "-Wno-error=attributes"

