Return-Path: <cristian.iorga@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id B356471F05
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Feb 2015 19:26:35 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga103.jf.intel.com with ESMTP; 17 Feb 2015 11:21:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.09,595,1418112000"; d="scan'208";a="455858183"
Received: from sentry.rb.intel.com ([10.237.105.37])
	by FMSMGA003.fm.intel.com with ESMTP; 17 Feb 2015 11:11:32 -0800
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Feb 2015 21:26:27 +0200
Message-Id: <3e728ce2670ca737690d5e6053c4edcfd266b2d4.1424201137.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1424201137.git.cristian.iorga@intel.com>
References: <cover.1424201137.git.cristian.iorga@intel.com>
In-Reply-To: <cover.1424201137.git.cristian.iorga@intel.com>
References: <cover.1424201137.git.cristian.iorga@intel.com>
Subject: [PATCH 1/1] qt-mobility: Add patch to fix no bluez compile issues
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 17 Feb 2015 19:26:37 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 .../fix-compile-error-no-bluez.patch               | 338 +++++++++++++++++++++
 meta/recipes-qt/qt4/qt-mobility_1.2.0.inc          |   1 +
 2 files changed, 339 insertions(+)
 create mode 100644 meta/recipes-qt/qt4/qt-mobility-1.2.0/fix-compile-error-no-bluez.patch

diff --git a/meta/recipes-qt/qt4/qt-mobility-1.2.0/fix-compile-error-no-bluez.patch b/meta/recipes-qt/qt4/qt-mobility-1.2.0/fix-compile-error-no-bluez.patch
new file mode 100644
index 0000000..3f03cf7
--- /dev/null
+++ b/meta/recipes-qt/qt4/qt-mobility-1.2.0/fix-compile-error-no-bluez.patch
@@ -0,0 +1,338 @@
+From bb05733bd5a685b00f80ddc73a1b7a9a2ba0eb11 Mon Sep 17 00:00:00 2001
+From: Andrew Stanley-Jones <andrew.stanley-jones@nokia.com>
+Date: Thu, 12 May 2011 13:07:13 +1000
+Subject: [PATCH] Fix compile error if bluez is not installed
+
+Upstream-Status: Backport
+
+Task-number: QTMOBILITY-1576
+---
+ src/connectivity/bluetooth/bluetooth.pri           |    1 +
+ .../bluetooth/qbluetoothdevicediscoveryagent.h     |    2 +-
+ .../bluetooth/qbluetoothdevicediscoveryagent_p.cpp |    2 +-
+ .../bluetooth/qbluetoothdevicediscoveryagent_p.h   |    6 +++---
+ .../bluetooth/qbluetoothlocaldevice_p.h            |    4 ++--
+ .../bluetooth/qbluetoothservicediscoveryagent.h    |    2 +-
+ .../bluetooth/qbluetoothservicediscoveryagent_p.h  |    8 ++++----
+ .../bluetooth/qbluetoothserviceinfo_p.cpp          |    2 +-
+ .../bluetooth/qbluetoothserviceinfo_p.h            |    4 ++--
+ src/connectivity/bluetooth/ql2capserver.h          |    2 +-
+ src/connectivity/bluetooth/ql2capserver_p.cpp      |    2 +-
+ src/connectivity/bluetooth/ql2capserver_p.h        |    6 +++---
+ src/connectivity/bluetooth/qrfcommserver.h         |    2 +-
+ src/connectivity/bluetooth/qrfcommserver_p.cpp     |    2 +-
+ src/connectivity/bluetooth/qrfcommserver_p.h       |    6 +++---
+ tests/tests.pro                                    |    4 +++-
+ 16 files changed, 29 insertions(+), 26 deletions(-)
+
+diff --git a/src/connectivity/bluetooth/bluetooth.pri b/src/connectivity/bluetooth/bluetooth.pri
+index 717a1ad..4fa2c15 100644
+--- a/src/connectivity/bluetooth/bluetooth.pri
++++ b/src/connectivity/bluetooth/bluetooth.pri
+@@ -103,6 +103,7 @@ symbian {
+     }
+ } else:contains(bluez_enabled, yes):contains(QT_CONFIG, dbus) {
+     QT *= dbus
++    DEFINES += QTM_BLUEZ_BLUETOOTH
+ 
+     include(bluez/bluez.pri)
+ 
+diff --git a/src/connectivity/bluetooth/qbluetoothdevicediscoveryagent.h b/src/connectivity/bluetooth/qbluetoothdevicediscoveryagent.h
+index a95c467..00cfd14 100644
+--- a/src/connectivity/bluetooth/qbluetoothdevicediscoveryagent.h
++++ b/src/connectivity/bluetooth/qbluetoothdevicediscoveryagent.h
+@@ -101,7 +101,7 @@ private:
+     Q_DECLARE_PRIVATE(QBluetoothDeviceDiscoveryAgent)
+     QBluetoothDeviceDiscoveryAgentPrivate *d_ptr;
+ 
+-#ifndef QT_NO_DBUS
++#ifdef QTM_BLUEZ_BLUETOOTH
+     Q_PRIVATE_SLOT(d_func(), void _q_deviceFound(const QString &address, const QVariantMap &dict));
+     Q_PRIVATE_SLOT(d_func(), void _q_propertyChanged(const QString &name, const QDBusVariant &value));
+ #endif
+diff --git a/src/connectivity/bluetooth/qbluetoothdevicediscoveryagent_p.cpp b/src/connectivity/bluetooth/qbluetoothdevicediscoveryagent_p.cpp
+index 6edbd16..512002d 100644
+--- a/src/connectivity/bluetooth/qbluetoothdevicediscoveryagent_p.cpp
++++ b/src/connectivity/bluetooth/qbluetoothdevicediscoveryagent_p.cpp
+@@ -69,7 +69,7 @@ void QBluetoothDeviceDiscoveryAgentPrivate::start()
+ void QBluetoothDeviceDiscoveryAgentPrivate::stop()
+ {
+ }
+-#ifndef QT_NO_DBUS
++#ifdef QTM_BLUEZ_BLUETOOTH
+ void QBluetoothDeviceDiscoveryAgentPrivate::_q_deviceFound(const QString &address,
+                                                            const QVariantMap &dict)
+ {
+diff --git a/src/connectivity/bluetooth/qbluetoothdevicediscoveryagent_p.h b/src/connectivity/bluetooth/qbluetoothdevicediscoveryagent_p.h
+index 0e34e05..700e78d 100644
+--- a/src/connectivity/bluetooth/qbluetoothdevicediscoveryagent_p.h
++++ b/src/connectivity/bluetooth/qbluetoothdevicediscoveryagent_p.h
+@@ -46,7 +46,7 @@
+ 
+ #include <QVariantMap>
+ 
+-#ifndef QT_NO_DBUS
++#ifdef QTM_BLUEZ_BLUETOOTH
+ class OrgBluezManagerInterface;
+ class OrgBluezAdapterInterface;
+ class QDBusVariant;
+@@ -80,7 +80,7 @@ public:
+             QString errorDescription);
+ #endif
+ 
+-#ifndef QT_NO_DBUS
++#ifdef QTM_BLUEZ_BLUETOOTH
+     void _q_deviceFound(const QString &address, const QVariantMap &dict);
+     void _q_propertyChanged(const QString &name, const QDBusVariant &value);
+ #endif
+@@ -100,7 +100,7 @@ private:
+     bool pendingCancel;
+     bool pendingStart;
+ 
+-#if !defined(QT_NO_DBUS)
++#ifdef QTM_BLUEZ_BLUETOOTH
+     OrgBluezManagerInterface *manager;
+     OrgBluezAdapterInterface *adapter;
+ #endif
+diff --git a/src/connectivity/bluetooth/qbluetoothlocaldevice_p.h b/src/connectivity/bluetooth/qbluetoothlocaldevice_p.h
+index 750c286..381d6b5 100644
+--- a/src/connectivity/bluetooth/qbluetoothlocaldevice_p.h
++++ b/src/connectivity/bluetooth/qbluetoothlocaldevice_p.h
+@@ -51,7 +51,7 @@
+ #include <btengsettings.h>
+ #endif
+ 
+-#ifndef QT_NO_DBUS
++#ifdef QTM_BLUEZ_BLUETOOTH
+ #include <QObject>
+ #include <QDBusContext>
+ #include <QDBusObjectPath>
+@@ -68,7 +68,7 @@ QTM_BEGIN_NAMESPACE
+ 
+ class QBluetoothAddress;
+ 
+-#ifndef QT_NO_DBUS
++#ifdef QTM_BLUEZ_BLUETOOTH
+ class QBluetoothLocalDevicePrivate : public QObject,
+                                      protected QDBusContext
+ {
+diff --git a/src/connectivity/bluetooth/qbluetoothservicediscoveryagent.h b/src/connectivity/bluetooth/qbluetoothservicediscoveryagent.h
+index 6279432..7eeccfc 100644
+--- a/src/connectivity/bluetooth/qbluetoothservicediscoveryagent.h
++++ b/src/connectivity/bluetooth/qbluetoothservicediscoveryagent.h
+@@ -105,7 +105,7 @@ private:
+     Q_PRIVATE_SLOT(d_func(), void _q_deviceDiscovered(const QBluetoothDeviceInfo &info))
+     Q_PRIVATE_SLOT(d_func(), void _q_deviceDiscoveryFinished())
+     Q_PRIVATE_SLOT(d_func(), void _q_serviceDiscoveryFinished())
+-#ifndef QT_NO_DBUS
++#ifdef QTM_BLUEZ_BLUETOOTH
+     Q_PRIVATE_SLOT(d_func(), void _q_discoveredServices(QDBusPendingCallWatcher*))
+     Q_PRIVATE_SLOT(d_func(), void _q_createdDevice(QDBusPendingCallWatcher*))
+ #endif
+diff --git a/src/connectivity/bluetooth/qbluetoothservicediscoveryagent_p.h b/src/connectivity/bluetooth/qbluetoothservicediscoveryagent_p.h
+index 5e7da43..f25c293 100644
+--- a/src/connectivity/bluetooth/qbluetoothservicediscoveryagent_p.h
++++ b/src/connectivity/bluetooth/qbluetoothservicediscoveryagent_p.h
+@@ -53,7 +53,7 @@
+ #include <btsdp.h>
+ #endif
+ 
+-#ifndef QT_NO_DBUS
++#ifdef QTM_BLUEZ_BLUETOOTH
+ class OrgBluezManagerInterface;
+ class OrgBluezAdapterInterface;
+ class OrgBluezDeviceInterface;
+@@ -99,7 +99,7 @@ public:
+     void _q_deviceDiscoveryFinished();
+     void _q_deviceDiscovered(const QBluetoothDeviceInfo &info);
+     void _q_serviceDiscoveryFinished();
+-#ifndef QT_NO_DBUS
++#ifdef QTM_BLUEZ_BLUETOOTH
+     void _q_discoveredServices(QDBusPendingCallWatcher *watcher);
+     void _q_createdDevice(QDBusPendingCallWatcher *watcher);
+ #endif
+@@ -123,7 +123,7 @@ private:
+ #ifdef QTM_SYMBIAN_BLUETOOTH
+     void startL(const QBluetoothAddress &address);
+     void initL(const QBluetoothAddress &address);
+-#elif !defined(QT_NO_DBUS)
++#elif defined(QTM_BLUEZ_BLUETOOTH)
+     QVariant readAttributeValue(QXmlStreamReader &xml);
+ #endif
+ 
+@@ -153,7 +153,7 @@ private:
+     TSdpAttributeID m_currentAttributeId;
+ 
+     QStack<QVariant> m_stack;
+-#elif !defined(QT_NO_DBUS)
++#elif defined(QTM_BLUEZ_BLUETOOTH)
+     OrgBluezManagerInterface *manager;
+     OrgBluezAdapterInterface *adapter;
+     OrgBluezDeviceInterface *device;
+diff --git a/src/connectivity/bluetooth/qbluetoothserviceinfo_p.cpp b/src/connectivity/bluetooth/qbluetoothserviceinfo_p.cpp
+index 814458c..dd96dcc 100644
+--- a/src/connectivity/bluetooth/qbluetoothserviceinfo_p.cpp
++++ b/src/connectivity/bluetooth/qbluetoothserviceinfo_p.cpp
+@@ -79,7 +79,7 @@ void QBluetoothServiceInfoPrivate::removeRegisteredAttribute(quint16 attributeId
+     Q_UNUSED(attributeId);
+ }
+ 
+-#ifndef QT_NO_DBUS
++#ifdef QTM_BLUEZ_BLUETOOTH
+ bool QBluetoothServiceInfoPrivate::registerService() const
+ {
+     return false;
+diff --git a/src/connectivity/bluetooth/qbluetoothserviceinfo_p.h b/src/connectivity/bluetooth/qbluetoothserviceinfo_p.h
+index 5be7341..8e4254c 100644
+--- a/src/connectivity/bluetooth/qbluetoothserviceinfo_p.h
++++ b/src/connectivity/bluetooth/qbluetoothserviceinfo_p.h
+@@ -72,7 +72,7 @@ public:
+ 
+     bool ensureSdpConnection() const;
+ 
+-#ifndef QT_NO_DBUS
++#ifdef QTM_BLUEZ_BLUETOOTH
+     bool registerService() const;
+ #endif
+ 
+@@ -89,7 +89,7 @@ public:
+     mutable TSdpServRecordHandle serviceRecord;
+ #endif
+ 
+-#ifndef QT_NO_DBUS
++#ifdef QTM_BLUEZ_BLUETOOTH
+     mutable OrgBluezServiceInterface *service;
+     mutable quint32 serviceRecord;
+     mutable bool registered;
+diff --git a/src/connectivity/bluetooth/ql2capserver.h b/src/connectivity/bluetooth/ql2capserver.h
+index 99c20a5..bed65a3 100644
+--- a/src/connectivity/bluetooth/ql2capserver.h
++++ b/src/connectivity/bluetooth/ql2capserver.h
+@@ -97,7 +97,7 @@ private:
+     Q_PRIVATE_SLOT(d_func(), void _q_disconnected())
+ #endif //QTM_SYMBIAN_BLUETOOTH
+     
+-#ifndef QT_NO_DBUS
++#ifdef QTM_BLUEZ_BLUETOOTH
+     Q_PRIVATE_SLOT(d_func(), void _q_newConnection())
+ #endif
+ 
+diff --git a/src/connectivity/bluetooth/ql2capserver_p.cpp b/src/connectivity/bluetooth/ql2capserver_p.cpp
+index 3a2199f..f19977e 100644
+--- a/src/connectivity/bluetooth/ql2capserver_p.cpp
++++ b/src/connectivity/bluetooth/ql2capserver_p.cpp
+@@ -101,7 +101,7 @@ QBluetooth::SecurityFlags QL2capServer::securityFlags() const
+ 
+ 
+ 
+-#ifndef QT_NO_DBUS
++#ifdef QTM_BLUEZ_BLUETOOTH
+ void QL2capServerPrivate::_q_newConnection()
+ {
+ }
+diff --git a/src/connectivity/bluetooth/ql2capserver_p.h b/src/connectivity/bluetooth/ql2capserver_p.h
+index b5e76d9..2823106 100644
+--- a/src/connectivity/bluetooth/ql2capserver_p.h
++++ b/src/connectivity/bluetooth/ql2capserver_p.h
+@@ -50,7 +50,7 @@
+ #include <bt_sock.h>
+ #endif //QTM_SYMBIAN_BLUETOOTH
+ 
+-#ifndef QT_NO_DBUS
++#ifdef QTM_BLUEZ_BLUETOOTH
+ QT_FORWARD_DECLARE_CLASS(QSocketNotifier)
+ #endif
+ 
+@@ -82,7 +82,7 @@ public:
+     void _q_disconnected();
+ #endif //QTM_SYMBIAN_BLUETOOTH
+     
+-#ifndef QT_NO_DBUS
++#ifdef QTM_BLUEZ_BLUETOOTH
+     void _q_newConnection();
+ #endif
+ 
+@@ -103,7 +103,7 @@ protected:
+     QL2capServer *q_ptr;
+ 
+ private:
+-#ifndef QT_NO_DBUS
++#ifdef QTM_BLUEZ_BLUETOOTH
+     QSocketNotifier *socketNotifier;
+ #endif
+ };
+diff --git a/src/connectivity/bluetooth/qrfcommserver.h b/src/connectivity/bluetooth/qrfcommserver.h
+index 3f348dd..7974ba6 100644
+--- a/src/connectivity/bluetooth/qrfcommserver.h
++++ b/src/connectivity/bluetooth/qrfcommserver.h
+@@ -97,7 +97,7 @@ private:
+     Q_PRIVATE_SLOT(d_func(), void _q_disconnected())
+ #endif //QTM_SYMBIAN_BLUETOOTH  
+     
+-#ifndef QT_NO_DBUS
++#ifdef QTM_BLUEZ_BLUETOOTH
+     Q_PRIVATE_SLOT(d_func(), void _q_newConnection())
+ #endif
+ };
+diff --git a/src/connectivity/bluetooth/qrfcommserver_p.cpp b/src/connectivity/bluetooth/qrfcommserver_p.cpp
+index f8145d9..eb14d64 100644
+--- a/src/connectivity/bluetooth/qrfcommserver_p.cpp
++++ b/src/connectivity/bluetooth/qrfcommserver_p.cpp
+@@ -90,7 +90,7 @@ quint16 QRfcommServer::serverPort() const
+ }
+ 
+ 
+-#ifndef QT_NO_DBUS
++#ifdef QTM_BLUEZ_BLUETOOTH
+ void QRfcommServerPrivate::_q_newConnection()
+ {
+ }
+diff --git a/src/connectivity/bluetooth/qrfcommserver_p.h b/src/connectivity/bluetooth/qrfcommserver_p.h
+index da6e28b..af40df7 100644
+--- a/src/connectivity/bluetooth/qrfcommserver_p.h
++++ b/src/connectivity/bluetooth/qrfcommserver_p.h
+@@ -51,7 +51,7 @@
+ #include <bt_sock.h>
+ #endif
+ 
+-#ifndef QT_NO_DBUS
++#ifdef QTM_BLUEZ_BLUETOOTH
+ QT_FORWARD_DECLARE_CLASS(QSocketNotifier)
+ #endif
+ 
+@@ -83,7 +83,7 @@ public:
+     void _q_disconnected();
+ #endif //QTM_SYMBIAN_BLUETOOTH
+ 
+-#ifndef QT_NO_DBUS
++#ifdef QTM_BLUEZ_BLUETOOTH
+     void _q_newConnection();
+ #endif
+ 
+@@ -102,7 +102,7 @@ protected:
+     QRfcommServer *q_ptr;
+ 
+ private:
+-#ifndef QT_NO_DBUS
++#ifdef QTM_BLUEZ_BLUETOOTH
+     QSocketNotifier *socketNotifier;
+ #endif
+ };
+diff --git a/tests/tests.pro b/tests/tests.pro
+index 2f2c355..4800e5e 100644
+--- a/tests/tests.pro
++++ b/tests/tests.pro
+@@ -16,7 +16,9 @@ contains(mobility_modules,systeminfo): SUBDIRS += sysinfo-tester
+ contains(mobility_modules,connectivity) {
+     SUBDIRS += nfctestserver
+ 
+-    linux*:!linux-armcc: SUBDIRS += btclient
++    linux*:!linux-armcc:contains(bluez_enabled, yes):contains(QT_CONFIG, dbus) {
++        SUBDIRS += btclient
++    }
+ }
+ 
+ symbian {
+-- 
+1.7.1
+
diff --git a/meta/recipes-qt/qt4/qt-mobility_1.2.0.inc b/meta/recipes-qt/qt4/qt-mobility_1.2.0.inc
index 5758e1e..56631bb 100644
--- a/meta/recipes-qt/qt4/qt-mobility_1.2.0.inc
+++ b/meta/recipes-qt/qt4/qt-mobility_1.2.0.inc
@@ -22,6 +22,7 @@ SRC_URI = "http://pkgs.fedoraproject.org/repo/pkgs/qt-mobility/qt-mobility-opens
            file://qt-mobility-no-xvideo.patch \
            file://fix_metaobjectbuilder_build_err.patch \
            file://0001-fix-embedded-usage-doesn-t-work-outside-of-Qt.patch \
+           file://fix-compile-error-no-bluez.patch \
 	   "
 
 SRC_URI[md5sum]="ea5db5a8d3dd4709c2926dceda646bd8"
-- 
2.1.0


