Received: from mail-ve0-f171.google.com ([209.85.128.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>)
	id 1UNOXT-0006on-O5; Wed, 03 Apr 2013 16:19:47 +0200
Received: by mail-ve0-f171.google.com with SMTP id b10so1727738vea.30
	for <multiple recipients>; Wed, 03 Apr 2013 07:02:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:x-received:date:message-id:subject:from:to
	:content-type; bh=oT+k3/maL+b8N5iOZFQ7NVoXllJ+hFDd3W8rJU+GT+0=;
	b=wSim8VMNY6NnhbJIsBs0kVBVMib8N002KHX0rPRQOV/2xo1TJ6SeS0wrhPp6TXqHYC
	gUP0GhFGmXYxZSFlGn4AxAtcDqwp575EoQV/HZJkWG6IvSJbu5JDBEQuXkhjf0hzWX5K
	F0Nq9leYAN6rw1niem6y4QL5WivXLXn8IaNXe0PjhExOI9Gn+FauvklqkqcT3VxgmMvK
	n+cvBnH08wN813d2ElgnStit9B93d3ge1Ybfj0G+lW777CVhUicAHYiLpCG0scldyiJO
	L+nRLb6Dnl0G83fYI5vkLbCrdhL8a9lrPag6istm1T93x26sIR4jLC8irfKYVwSchXEV
	2GCA==
MIME-Version: 1.0
X-Received: by 10.58.50.7 with SMTP id y7mr1310614ven.24.1364997755974; Wed,
	03 Apr 2013 07:02:35 -0700 (PDT)
Received: by 10.52.185.168 with HTTP; Wed, 3 Apr 2013 07:02:35 -0700 (PDT)
Date: Wed, 3 Apr 2013 16:02:35 +0200
Message-ID: <CALbNGRSj7uahrGy1DoSe5zJasciTf2Q7j1xj5N8V-cs_WOW+4g@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org, 
	openembedded-core@lists.openembedded.org
Subject: experiences with images based on current layer heads
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
X-List-Received-Date: Wed, 03 Apr 2013 14:19:48 -0000
Content-Type: text/plain; charset=UTF-8

Hi,

when migration of systemd to oe-core turned to unbuildable I decided
to freeze my images and stopped further tests. Now that many issues
were fixed and we are close to another release I built my standard
xfce-based image based on latest layer HEADs. With this I face some
issues which I would like to share:

1. X sessions crash with OOM. This is reproducible by opening
google-maps with midori and changing to satellite view. In
Xorg.0.log.old I see only

| (EE)
| (EE) Backtrace:
| (EE)
| (EE) Segmentation fault at address 0x9
| (EE) BUG: triggered 'if (inSignalContext)'
| (EE) BUG: log.c:502 in LogVMessageVerb()
| (EE) Warning: attempting to log data in a signal unsafe manner while
in signal context.
| Please update to check inSignalContext and/or use
LogMessageVerbSigSafe() or ErrorFSigSafe().
| The offending log format message is:
|
| Fatal server error:
|
| (EE)
| (EE) Backtrace:
| (EE)

With old images only the process causing OOM were stopped. I did not
fully cross check but I have the feeling that OOM appears much much
more often than with old images. Sometimes x- session is closed
without opening an additional application.

2. Something with udisks/gvfs/thunar-volman seems broken. When
auto-mounting, the partitions cannot be mounted by label-name. On
plugging a memory stick I see in kernel log

| VFS: could not find a valid V7 on sda.

Same kernel works properly with old images.

3. dhclient.service does not start (this has never worked):

root@overo:~# systemctl status dhclient.service
dhclient.service - Dynamic Host Configuration Protocol (DHCP)
          Loaded: loaded (/lib/systemd/system/dhclient.service; enabled)
          Active: failed (Result: resources) since Sat 2000-01-01
00:58:02 UTC; 7min ago
         Process: 177 ExecStart=/sbin/dhclient -cf
/etc/dhcp/dhclient.conf -q -lf /var/lib/dhcp/dhclient.leases
$INTERFACES (code=exited, status=0/SUCCESS)

Jan 01 00:58:01 overo systemd[1]: Starting Dynamic Host Configuration
Protocol (DHCP)...
Jan 01 00:58:02 overo systemd[1]: PID file /var/run/dhclient.pid not
readable (yet?) after start.

I wonder what happens to networkmanager once this autostart will work...

will test further...

Andreas


