Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1SgYFc-00013u-9u
	for openembedded-core@lists.openembedded.org;
	Mon, 18 Jun 2012 11:28:00 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q5I9HG4t027311
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jun 2012 02:17:16 -0700 (PDT)
Received: from [128.224.163.142] (128.224.163.142) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Mon, 18 Jun 2012 02:17:16 -0700
Message-ID: <4FDEF21A.5020004@windriver.com>
Date: Mon, 18 Jun 2012 17:17:14 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: "Zhao, Zhenfeng" <Zhenfeng.Zhao@windriver.com>
Subject: glibc detected *** groupadd: malloc(): memory corruption
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 18 Jun 2012 09:28:01 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit


Hi Experts:

I've met a strange issue, when set the length of builddir to
266 (Why I did this is that I need to know how long the tmpdir
that oe-core can support):

NOTE: package dbus-1.4.20-r3.0: task do_install: Started
*** glibc detected *** groupadd: malloc(): memory corruption: 0x000000000101da70 ***
*** glibc detected *** groupadd: malloc(): memory corruption: 0x000000000101da70 ***

Then the build would hang, this is caused by the command:

PSEUDO_PREFIX=/too/long/path/tmp/sysroots/x86_64-linux/usr
PSEUDO_LOCALSTATEDIR=... PSEUDO_PASSWD=...
PSEUDO_NOSYMLINKEXP=1 PSEUDO_DISABLED=0 PSEUDO_LOCALSTATEDIR
... /too/long/path/to/tmp/sysroots/x86_64-linux/usr/bin/pseudo
groupadd --root /too/long/path/to/tmp/sysroots/qemux86 -r netdev -f

1) I had looked into the code of groupadd, and found that this would
happen when it used the glibc function which needs malloc(for example,
the access()), so it seemed this was caused by the glibc or pseudo,
but I didn't know why it only happened to groupadd/useradd.

2) I had tried not to use pseudo, it worked well:

sudo groupadd --root /too/long/path/to/tmp/sysroots/qemux86 -r netdev -f

 From this, it seemed that the glibc was ok

3) I had tried to write a small piece of code which used the access(), and
used pseudo to run it, it worked well:

/too/long/path/for/pseudo/settings/and/then/run/pseudo my_app

 From this, it seemed that both pseudo and glibc were OK.

These 3 steps make me puzzle, maybe we can think that the tmpdir can not
be too long, and limit it to a proper length, please see this:

http://lists.linuxtogo.org/pipermail/openembedded-core/2012-May/022112.html

BTW. the "argument list too long" error has been fixed.

Any suggestion is appreciated.

-- 
Thanks

Robert


