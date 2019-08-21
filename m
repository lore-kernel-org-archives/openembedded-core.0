Return-Path: <jwessel@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id DC1A77E97A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Aug 2019 00:27:50 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x7L0RqJh006478
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Aug 2019 17:27:52 -0700 (PDT)
Received: from ala-lpggp2.wrs.com (147.11.105.123) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.468.0;
	Tue, 20 Aug 2019 17:27:51 -0700
Received: by ala-lpggp2.wrs.com (Postfix, from userid 5002)	id B7B39AA3505;
	Tue, 20 Aug 2019 17:27:51 -0700 (PDT)
From: Jason Wessel <jason.wessel@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 20 Aug 2019 17:27:50 -0700
Message-ID: <20190821002750.52062-1-jason.wessel@windriver.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [PATCH] serial-getty@.service: Allow device to fast fail if it does not exist
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
X-List-Received-Date: Wed, 21 Aug 2019 00:27:51 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Some BSPs use a USB serial port which may or may not actually be
plugged all the time.  It is quite useful to have a USB serial port
have a getty running but it does not make sense to wait for it for 90
seconds before completing the system startup if it might never get
plugged in.  The typical example is that a USB serial device might
only need to be plugged in when debugging, upgrading, or initially
configuring a device.

This change is somewhat subtle.  Systemd uses the "BindsTo" directive
to ensure existence of the device in order to start the service as
well as to terminate the service if the device goes away.  The "After"
directive makes that same relationship stronger, and has the undesired
side effect that systemd will wait until its internal time out value
for the device to come on line before executing a fail operation or
letting other tasks and groups continue.  This is certainly the kind
of behavior we want for a disk, but not for serial ports in general.

The kernel module loader and device detection will have run a long
time before the getty startup.  By the time the getty startup occurs
the system has all the serial devices its going to get.

If you want to observe the problem with qemu, it is easy to replicate.
Simply add the following line to your local.conf for a x86-64 qemu
build.

    SERIAL_CONSOLES="115200;ttyS0 115200;ttyUSB0"

Login right after the system boots and observe:

   root@qemux86-64:~# systemctl list-jobs |cat
   JOB UNIT                                 TYPE  STATE
     1 multi-user.target                    start waiting
    69 serial-getty@ttyUSB0.service         start waiting
    64 getty.target                         start waiting
    71 dev-ttyUSB0.device                   start running
    62 systemd-update-utmp-runlevel.service start waiting

   5 jobs listed.

You can see above that the dev-ttyUSB0.device will block for 1min 30
seconds.  While that might not be a problem for this reference build.
It is certainly a problem for images that have software watchdogs that
verify the system booted up all the way to systemd completion in less
than 90 seconds.

This other nice effect of this change is that the fast fail device
extend to additional serial ports that may not exist on ARM BSPs or
that might be configured in or out by the dtb files on different
boards.

Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
---
 .../systemd/systemd-serialgetty/serial-getty@.service           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd-serialgetty/serial-getty@.service b/meta/recipes-core/systemd/systemd-serialgetty/serial-getty@.service
index e8b027e97d..a20092a173 100644
--- a/meta/recipes-core/systemd/systemd-serialgetty/serial-getty@.service
+++ b/meta/recipes-core/systemd/systemd-serialgetty/serial-getty@.service
@@ -10,7 +10,7 @@ Description=Serial Getty on %I
 Documentation=man:agetty(8) man:systemd-getty-generator(8)
 Documentation=http://0pointer.de/blog/projects/serial-console.html
 BindsTo=dev-%i.device
-After=dev-%i.device systemd-user-sessions.service plymouth-quit-wait.service
+After=systemd-user-sessions.service plymouth-quit-wait.service
 After=rc-local.service
 
 # If additional gettys are spawned during boot then we should make
-- 
2.21.0


