Received: from mail.dream-property.net ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1S5TDF-0004IV-8M
	for openembedded-core@lists.openembedded.org;
	Thu, 08 Mar 2012 03:36:17 +0100
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id E123D3159B93
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Mar 2012 03:27:41 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id DkRnONY9pj7D
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Mar 2012 03:27:32 +0100 (CET)
Received: from [172.22.22.61] (drms-590ec29b.pool.mediaWays.net
	[89.14.194.155])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id 4589B3159B66
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Mar 2012 03:27:32 +0100 (CET)
Message-ID: <4F581912.1090708@opendreambox.org>
Date: Thu, 08 Mar 2012 03:27:30 +0100
From: Andreas Oberritter <obi@opendreambox.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.2) Gecko/20120216 Thunderbird/10.0.2
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
Subject: Undeterministic builds with different distributions
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
X-List-Received-Date: Thu, 08 Mar 2012 02:36:17 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hi,

I've built an image for the opendreambox distribution on two hosts:

a) Ubuntu 11.10 ("oneiric"), amd64
b) Debian 6.0.4 ("Squeeze"), i386

Afterwards I compared image statistics of both runs recorded by 
buildhistory. Before building the images, I disabled image-prelink
on both hosts.

I did this test, because I had a report that python was broken in
this image. The broken image was built on squeeze and I was able to
reproduce it, by building on another squeeze machine (b).

The result was a little surprising. I'm including diffs (excerpts) 
from host a to host b.

1.) depends.dot

 python_fcntl -> libc6;
 python_image -> python_core;
+python_image -> libpython2_7_1_0;
+python_image -> libc6;
 python_imaging -> libpython2_7_1_0;

I'm not sure how this could happen. It's the only package that actually 
changed dependencies.

2.) files-in-image.txt

* Many, but not all, shared libraries differ. E.g.:

--rw-r--r-- root       root            47427 ./lib/libcap.so.2.22  
+-rw-r--r-- root       root            47311 ./lib/libcap.so.2.22  

They may contain build-timestamps. I haven't done a thorough analysis
yet.

* There are even differences between text files, e.g.:

--rw-r--r-- root       root            17792 ./etc/mc/mc.ext  
+-rw-r--r-- root       root            17782 ./etc/mc/mc.ext  

In detail:

-	Open=(if test -n "opera" && test -n "$DISPLAY"; then (opera file://%d/%p &) 1>&2; else links %f || lynx -force_html %f || ${PAGER:-more} %f; fi) 2>/dev/null
+	Open=(if test -n "" && test -n "$DISPLAY"; then ( file://%d/%p &) 1>&2; else links %f || lynx -force_html %f || ${PAGER:-more} %f; fi) 2>/dev/null

Opera is installed on machine a.

* Owners differ, e.g.:

--rw-rw-r-- 1000       1000             2048 ./lib/firmware/rt73.bin  
+-rw-r--r-- root       root             2048 ./lib/firmware/rt73.bin

Builds were done by userids 1000 (a) and 1001 (b).

* Permissions differ, most notably in /var/lib/opkg/info, e.g.:

--rw-rw-r-- root       root               29 ./var/lib/opkg/info/avahi-daemon.conffiles  
--rw-rw-r-- root       root             1120 ./var/lib/opkg/info/avahi-daemon.control  
+-rw-r--r-- root       root               29 ./var/lib/opkg/info/avahi-daemon.conffiles  
+-rw-r--r-- root       root             1120 ./var/lib/opkg/info/avahi-daemon.control  

Actually the whole directory is affected. This may be caused by different umasks,
0002 (a) and 0022 (b).

* Python seems to pick up the build-host's kernel version:

-drwxr-xr-x root       root             4096 ./usr/lib/python2.7/plat-linux3  
--rw-r--r-- root       root              195 ./usr/lib/python2.7/plat-linux3/regen  
+drwxr-xr-x root       root             4096 ./usr/lib/python2.7/plat-linux2  
+-rw-r--r-- root       root             5035 ./usr/lib/python2.7/plat-linux2/CDROM.py  
+-rw-r--r-- root       root             6735 ./usr/lib/python2.7/plat-linux2/CDROM.pyo  
+-rw-r--r-- root       root             1628 ./usr/lib/python2.7/plat-linux2/DLFCN.py  
+-rw-r--r-- root       root             2708 ./usr/lib/python2.7/plat-linux2/DLFCN.pyo  
+-rw-r--r-- root       root            13030 ./usr/lib/python2.7/plat-linux2/IN.py  
+-rw-r--r-- root       root            20436 ./usr/lib/python2.7/plat-linux2/IN.pyo  
+-rw-r--r-- root       root             3420 ./usr/lib/python2.7/plat-linux2/TYPES.py  
+-rw-r--r-- root       root             6036 ./usr/lib/python2.7/plat-linux2/TYPES.pyo  
+-rwxr-xr-x root       root              195 ./usr/lib/python2.7/plat-linux2/regen  

I haven't yet figured out which of the changes actually causes python to misbehave.
Creating a symlink plat-linux3 doesn't help, at least.

The python error looks like this:

  File "/usr/lib/python2.7/random.py", line 70, in <module>
    import _random
ImportError: invalid mode parameter

or

  File "/usr/lib/python2.7/site-packages/pythonwifi/iwlibs.py", line 25, in <module>
    import array
ImportError: invalid mode parameter

and happens in many different modules.

Regards,
Andreas


