Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1UN8ip-0003yQ-8x
	for openembedded-core@lists.openembedded.org;
	Tue, 02 Apr 2013 23:26:27 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 02 Apr 2013 14:09:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,394,1363158000"; d="scan'208";a="288416638"
Received: from envy.jf.intel.com (HELO envy.home) ([10.7.199.70])
	by orsmga001.jf.intel.com with ESMTP; 02 Apr 2013 14:09:01 -0700
Message-ID: <515B48EB.6040209@linux.intel.com>
Date: Tue, 02 Apr 2013 14:08:59 -0700
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130110 Thunderbird/17.0.2
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Enigmail-Version: 1.5.1
Subject: Xuser has no permissions for event devices (no keyboard and mouse in X)
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 02 Apr 2013 21:26:27 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Current master atom-pc build + pending 3.8 kernel update us using
rootless X, but X fails to open the event devices. Do we need some kind
of default group permissions for the /dev/input/* devices?

root@atom-pc:/etc/X11# cat /var/log/Xorg.0.log | grep EE | grep "event"
[3430478.394] (EE) evdev: Power Button: Unable to open evdev device
"/dev/input/event2".
[3430478.398] (EE) evdev: Video Bus: Unable to open evdev device
"/dev/input/event3".
[3430478.401] (EE) evdev: Power Button: Unable to open evdev device
"/dev/input/event1".
[3430478.410] (EE) evdev: HP HP Wireless Mini Keyboard: Unable to open
evdev device "/dev/input/event5".
[3430478.414] (EE) evdev: HP HP Wireless Mini Keyboard: Unable to open
evdev device "/dev/input/event6".
[3430478.421] (EE) evdev: AT Translated Set 2 keyboard: Unable to open
evdev device "/dev/input/event4".
[3430478.434] (EE) synaptics: SynPS/2 Synaptics TouchPad: no synaptics
event device found
...

root@atom-pc:/etc/X11# cat /etc/group | grep xuser
tty:x:5:xuser
audio:x:29:xuser
video:x:44:xuser
xuser:x:1000:

root@atom-pc:/etc/X11# ls -la /dev/input/event
event0  event1  event2  event3  event4  event5  event6  event7
root@atom-pc:/etc/X11# ls -la /dev/input/event*
crw-r-----    1 root     root       13,  64 Apr  2 20:38 /dev/input/event0
crw-r-----    1 root     root       13,  65 Apr  2 20:38 /dev/input/event1
crw-r-----    1 root     root       13,  66 Apr  2 20:38 /dev/input/event2
crw-r-----    1 root     root       13,  67 Apr  2 20:38 /dev/input/event3
crw-r-----    1 root     root       13,  68 Apr  2 20:38 /dev/input/event4
crw-r-----    1 root     root       13,  69 Apr  2 20:52 /dev/input/event5
crw-r-----    1 root     root       13,  70 Apr  2 20:52 /dev/input/event6
crw-r-----    1 root     root       13,  71 Apr  2 20:38 /dev/input/event7

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Technical Lead - Linux Kernel


