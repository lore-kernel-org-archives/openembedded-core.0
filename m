Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1S5hc9-00035d-NY
	for openembedded-core@lists.openembedded.org;
	Thu, 08 Mar 2012 18:58:58 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q28HoITY010800
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 8 Mar 2012 09:50:18 -0800 (PST)
Received: from Macintosh-5.local (172.25.36.231) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Thu, 8 Mar 2012 09:50:12 -0800
Message-ID: <4F58F14E.60308@windriver.com>
Date: Thu, 8 Mar 2012 11:50:06 -0600
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6;
	rv:10.0.2) Gecko/20120216 Thunderbird/10.0.2
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <4F581912.1090708@opendreambox.org>
In-Reply-To: <4F581912.1090708@opendreambox.org>
Subject: Re: Undeterministic builds with different distributions
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
X-List-Received-Date: Thu, 08 Mar 2012 17:58:58 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 3/7/12 8:27 PM, Andreas Oberritter wrote:
> Hi,
>
> I've built an image for the opendreambox distribution on two hosts:
>
> a) Ubuntu 11.10 ("oneiric"), amd64
> b) Debian 6.0.4 ("Squeeze"), i386
>
> Afterwards I compared image statistics of both runs recorded by
> buildhistory. Before building the images, I disabled image-prelink
> on both hosts.
>
> I did this test, because I had a report that python was broken in
> this image. The broken image was built on squeeze and I was able to
> reproduce it, by building on another squeeze machine (b).
>
> The result was a little surprising. I'm including diffs (excerpts)
> from host a to host b.
>
> 1.) depends.dot
>
>   python_fcntl ->  libc6;
>   python_image ->  python_core;
> +python_image ->  libpython2_7_1_0;
> +python_image ->  libc6;
>   python_imaging ->  libpython2_7_1_0;
>
> I'm not sure how this could happen. It's the only package that actually
> changed dependencies.
>
> 2.) files-in-image.txt
>
> * Many, but not all, shared libraries differ. E.g.:

When comparing binaries, always use objdump and strip off everything except the 
text section.  In most cases this will allow for a proper (binary) comparison. 
For places that have differences, run a hexdump w/ ASCII.. usually these get 
embedded paths from the host-side in them.

Any code differences is something worth investigating.  This means a header 
difference, a compiler (output) difference, or host contamination.  All 
certainly possibilities when chasing down failure conditions.

(In previous OE-Core builds, I've done builds on multiple machines, multiple 
hosts and done what I suggest above.  I did not observe anything unexpected in 
the binary comparison.)

> --rw-r--r-- root       root            47427 ./lib/libcap.so.2.22
> +-rw-r--r-- root       root            47311 ./lib/libcap.so.2.22
>
> They may contain build-timestamps. I haven't done a thorough analysis
> yet.
>
> * There are even differences between text files, e.g.:
>
> --rw-r--r-- root       root            17792 ./etc/mc/mc.ext
> +-rw-r--r-- root       root            17782 ./etc/mc/mc.ext
>
> In detail:
>
> -	Open=(if test -n "opera"&&  test -n "$DISPLAY"; then (opera file://%d/%p&) 1>&2; else links %f || lynx -force_html %f || ${PAGER:-more} %f; fi) 2>/dev/null
> +	Open=(if test -n ""&&  test -n "$DISPLAY"; then ( file://%d/%p&) 1>&2; else links %f || lynx -force_html %f || ${PAGER:-more} %f; fi) 2>/dev/null

Yup, that is a real bug.  Be sure to either find/fix it -- or file it with the 
YoctoProject bugzilla (bugzilla.yoctoproject.org) and we'll try to fix it.

> Opera is installed on machine a.
>
> * Owners differ, e.g.:
>
> --rw-rw-r-- 1000       1000             2048 ./lib/firmware/rt73.bin
> +-rw-r--r-- root       root             2048 ./lib/firmware/rt73.bin
>
> Builds were done by userids 1000 (a) and 1001 (b).

Are you comparing final images, sysroots or?

If you are comparing tarball images, be sure to either actually be root when you 
extract it, or enable pseudo for the proper root permissions/user/groups emulation.

> * Permissions differ, most notably in /var/lib/opkg/info, e.g.:
>
> --rw-rw-r-- root       root               29 ./var/lib/opkg/info/avahi-daemon.conffiles
> --rw-rw-r-- root       root             1120 ./var/lib/opkg/info/avahi-daemon.control
> +-rw-r--r-- root       root               29 ./var/lib/opkg/info/avahi-daemon.conffiles
> +-rw-r--r-- root       root             1120 ./var/lib/opkg/info/avahi-daemon.control
>
> Actually the whole directory is affected. This may be caused by different umasks,
> 0002 (a) and 0022 (b).

umask is supposed to be set by the OE build environment.  If you can find cases 
where it's not preserved, these are definitely errors that must be fixed.

umask is supposed to be 022 for all OE operations.  (see meta/base.bbclass, 
image.bbclass, sanity.bbclass and staging.bbclass...)

> * Python seems to pick up the build-host's kernel version:
>
> -drwxr-xr-x root       root             4096 ./usr/lib/python2.7/plat-linux3
> --rw-r--r-- root       root              195 ./usr/lib/python2.7/plat-linux3/regen
> +drwxr-xr-x root       root             4096 ./usr/lib/python2.7/plat-linux2
> +-rw-r--r-- root       root             5035 ./usr/lib/python2.7/plat-linux2/CDROM.py
> +-rw-r--r-- root       root             6735 ./usr/lib/python2.7/plat-linux2/CDROM.pyo
> +-rw-r--r-- root       root             1628 ./usr/lib/python2.7/plat-linux2/DLFCN.py
> +-rw-r--r-- root       root             2708 ./usr/lib/python2.7/plat-linux2/DLFCN.pyo
> +-rw-r--r-- root       root            13030 ./usr/lib/python2.7/plat-linux2/IN.py
> +-rw-r--r-- root       root            20436 ./usr/lib/python2.7/plat-linux2/IN.pyo
> +-rw-r--r-- root       root             3420 ./usr/lib/python2.7/plat-linux2/TYPES.py
> +-rw-r--r-- root       root             6036 ./usr/lib/python2.7/plat-linux2/TYPES.pyo
> +-rwxr-xr-x root       root              195 ./usr/lib/python2.7/plat-linux2/regen
>
> I haven't yet figured out which of the changes actually causes python to misbehave.
> Creating a symlink plat-linux3 doesn't help, at least.

I've seen problems in the past when cross compiling python.  To address them we 
ended up having to generate very precise python configuration files, and avoid 
letting python autodiscover -anything- about the host system.  This is the first 
I've seen of a similar issue within OE....

Please be sure to file this as a defect, unless you believe you will be able to 
fix it.

--Mark

> The python error looks like this:
>
>    File "/usr/lib/python2.7/random.py", line 70, in<module>
>      import _random
> ImportError: invalid mode parameter
>
> or
>
>    File "/usr/lib/python2.7/site-packages/pythonwifi/iwlibs.py", line 25, in<module>
>      import array
> ImportError: invalid mode parameter
>
> and happens in many different modules.
>
> Regards,
> Andreas
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



