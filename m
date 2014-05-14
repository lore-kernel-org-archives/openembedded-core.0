Return-Path: <Chong.Lu@windriver.com>
Received: from mail.windriver.com (unknown [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8010E66114
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 May 2014 09:29:08 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s4E9T9hb002108
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 May 2014 02:29:09 -0700 (PDT)
Received: from pek-hostel-vm06.wrs.com (128.224.153.176) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Wed, 14 May 2014 02:29:08 -0700
From: Chong Lu <Chong.Lu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 14 May 2014 17:29:06 +0800
Message-ID: <cover.1400058860.git.Chong.Lu@windriver.com>
X-Mailer: git-send-email 1.8.1.2
MIME-Version: 1.0
Subject: [PATCH 0/1] dbus: Update to 1.8.2 version
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
X-List-Received-Date: Wed, 14 May 2014 09:29:13 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Start with systemd:
root@qemuarm:~# systemctl status dbus.service
● dbus.service - D-Bus System Message Bus
   Loaded: loaded (/lib/systemd/system/dbus.service; static)
   Active: active (running) since Wed 2014-05-14 09:15:33 UTC; 19s ago
     Docs: man:dbus-daemon(1)
 Main PID: 98 (dbus-daemon)
   CGroup: /system.slice/dbus.service
           └─98 /usr/bin/dbus-daemon --system --address=systemd: --nofork --n...

May 14 09:15:33 qemuarm systemd[1]: Started D-Bus System Message Bus.
root@qemuarm:~# systemctl status dbus.socket 
● dbus.socket - D-Bus System Message Bus Socket
   Loaded: loaded (/lib/systemd/system/dbus.socket; static)
   Active: active (running) since Wed 2014-05-14 09:15:33 UTC; 25s ago
   Listen: /var/run/dbus/system_bus_socket (Stream)

May 14 09:15:33 qemuarm systemd[1]: Starting D-Bus System Message Bus Socket.
May 14 09:15:33 qemuarm systemd[1]: Listening on D-Bus System Message Bus S...t.
Hint: Some lines were ellipsized, use -l to show in full.

Start with sysvinit:
root@qemuarm:~# /etc/init.d/dbus-1 status
/usr/bin/dbus-daemon (pid 324) is running...

Test ptest suite:
root@qemuarm:/usr/lib/dbus-test/ptest# ./run-ptest 
PASS: test/test-bus
PASS: test/test-bus-launch-helper
PASS: test/test-bus-system
PASS: test/test-corrupt
PASS: test/test-dbus
** Message: ProcessID of this process is 124
** Message: UnixUserID of this process is 0
** Message: SKIP: set DBUS_TEST_DATA to a directory containing valid-config-files/incoming-limit.conf
PASS: test/test-dbus-daemon
PASS: test/test-dbus-daemon-eavesdrop
...


The following changes since commit d6900a5fe7670cb4514969d60e0ca65372121c87:

  wic: Extend indirect string connection to support image names and rootfs (2014-05-13 19:35:11 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib chonglu/dbus
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=chonglu/dbus

Chong Lu (1):
  dbus: Update to 1.8.2 version

 .../{dbus-test_1.6.18.bb => dbus-test_1.8.2.bb}    |  13 +-
 meta/recipes-core/dbus/dbus.inc                    |  14 +-
 ...orrect-address-when-using-address-systemd.patch | 193 ---------------------
 ...y-freeing-if-error-during-listing-service.patch |  45 -----
 meta/recipes-core/dbus/dbus/ptest.patch            | 154 ----------------
 meta/recipes-core/dbus/dbus/run-ptest              |  11 +-
 meta/recipes-core/dbus/dbus_1.6.18.bb              |   4 -
 meta/recipes-core/dbus/dbus_1.8.2.bb               |   4 +
 8 files changed, 34 insertions(+), 404 deletions(-)
 rename meta/recipes-core/dbus/{dbus-test_1.6.18.bb => dbus-test_1.8.2.bb} (74%)
 delete mode 100644 meta/recipes-core/dbus/dbus/Set-correct-address-when-using-address-systemd.patch
 delete mode 100644 meta/recipes-core/dbus/dbus/fixed-memory-freeing-if-error-during-listing-service.patch
 delete mode 100644 meta/recipes-core/dbus/dbus/ptest.patch
 delete mode 100644 meta/recipes-core/dbus/dbus_1.6.18.bb
 create mode 100644 meta/recipes-core/dbus/dbus_1.8.2.bb

-- 
1.8.1.2


