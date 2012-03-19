Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1S9fFs-0003zY-SZ
	for openembedded-core@lists.openembedded.org;
	Mon, 19 Mar 2012 17:16:21 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q2JG7Smi003645
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Mar 2012 09:07:28 -0700 (PDT)
Received: from Macintosh-5.local (172.25.36.231) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Mon, 19 Mar 2012 09:07:27 -0700
Message-ID: <4F6759BE.7080800@windriver.com>
Date: Mon, 19 Mar 2012 11:07:26 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6;
	rv:10.0.2) Gecko/20120216 Thunderbird/10.0.2
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1331799506.1041.55.camel@localhost.localdomain>
	<4F621801.4000308@windriver.com>
	<1331875115.1041.67.camel@localhost.localdomain>
	<4F635E14.7000707@windriver.com>
	<1332121654.1041.78.camel@localhost.localdomain>
In-Reply-To: <1332121654.1041.78.camel@localhost.localdomain>
Subject: Re: LSB support?
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
X-List-Received-Date: Mon, 19 Mar 2012 16:16:21 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 3/18/12 8:47 PM, Ni Qingliang wrote:
> I have encountered a similar problem when do a clean building in another
> VM (running archlinux).
>
> after remove /usr//lib/libXrandr.so.2:
> mv /usr/lib/../lib/libXrandr.so.2 /usr/lib/../lib/libXrandr.so.2.bak
>
> I got a new error:
> /usr/lib/../lib/libXext.so.6: undefined reference to `memcpy@GLIBC_2.14'
>
> so IMO, it used the wrong lib path. following is the output section of
> 'do_compile', the key is '/usr/lib/../lib', maybe it should be
> '<xxxdir>/usr/lib/../lib'.

I don't see anything obvious in the code below.  Search the build logs for 
libXrandr, libXext for references to /usr/lib or similar.

Are you using the stock oe-core toolchain?  If so there is a patch that detects 
and attempts to poison (cause an error) usage of system directories while cross 
compiling.  If you are using your own toolchain, a vendor toolchain, or a 
CS/Mentor toolchain.. then you may not have this patch and the system won't auto 
detect that type of contamination.

Check the version of glibc on your host, is it 2.14 (or newer)?  Then check the 
version of eglibc in your build, I assume it's 2.13...

if the above is true, that would seem to indicate that it is likely host 
contamination...

The other tool you can enable is "swabber", in your local.conf in the 
"USER_CLASSES" you can enable "image-swab".  Swabber can be a -very- slow 
process, but is a good last resort for identifying host contamination.

It's been a while since I used swabber, and I don't remember how.  I've been 
looking and I'm having problems finding the documentation on setup and usage of 
swabber.  You may need to join and ask on the Yocto Project mailing list for 
help on that.

--Mark

> output section:
> Making all in gconf
> make[2]: Entering directory
> `/media/pangu/lsbt/tmp/work/x86_64-poky-linux/gconf-3.2.3-r8/GConf-3.2.3/gconf'
> make  all-am
> make[3]: Entering directory
> `/media/pangu/lsbt/tmp/work/x86_64-poky-linux/gconf-3.2.3-r8/GConf-3.2.3/gconf'
> ../x86_64-poky-linux-libtool  --tag=CC   --mode=link
> x86_64-poky-linux-gcc    -m64
> --sysroot=/media/pangu/lsbt/tmp/sysroots/qemux86-64  -O2 -pipe -g
> -feliminate-unused-debug-types -Wall -DGCONF_ENABLE_DEBUG=1  -Wl,-O1
> -Wl,--hash-style=gnu -Wl,--as-needed -o gconf-sanity-check-2
> gconf-sanity-check.o libgconf-2.la   -pthread -Wl,--export-dynamic
> -lgtk-x11-2.0 -lgdk-x11-2.0 -latk-1.0 -lgio-2.0 -lpangoft2-1.0
> -lpangocairo-1.0 -lgdk_pixbuf-2.0 -lcairo -lpango-1.0 -lfreetype
> -lfontconfig -lgobject-2.0 -lgmodule-2.0 -lgthread-2.0 -lrt -lglib-2.0
> -lxml2
> x86_64-poky-linux-libtool: link: x86_64-poky-linux-gcc -m64
> --sysroot=/media/pangu/lsbt/tmp/sysroots/qemux86-64 -O2 -pipe -g
> -feliminate-unused-debug-types -Wall -DGCONF_ENABLE_DEBUG=1 -Wl,-O1
> -Wl,--hash-style=gnu -Wl,--as-needed -o .libs/gconf-sanity-check-2
> gconf-sanity-check.o -pthread
> -Wl,--export-dynamic  ./.libs/libgconf-2.so /media/pangu/lsbt/tmp/sysroots/qemux86-64/usr/lib/libdbus-glib-1.so /media/pangu/lsbt/tmp/sysroots/qemux86-64/usr/lib/libdbus-1.so /media/pangu/lsbt/tmp/sysroots/qemux86-64/usr/lib/libgtk-x11-2.0.so /media/pangu/lsbt/tmp/sysroots/qemux86-64/usr/lib/libgdk-x11-2.0.so /media/pangu/lsbt/tmp/sysroots/qemux86-64/usr/lib/libatk-1.0.so /media/pangu/lsbt/tmp/sysroots/qemux86-64/usr/lib/libpangocairo-1.0.so -L=/usr/lib /media/pangu/lsbt/tmp/sysroots/qemux86-64/usr/lib/libpangoft2-1.0.so /media/pangu/lsbt/tmp/sysroots/qemux86-64/usr/lib/../lib/libstdc++.so /media/pangu/lsbt/tmp/sysroots/qemux86-64/usr/lib/libgdk_pixbuf-2.0.so /media/pangu/lsbt/tmp/sysroots/qemux86-64/usr/lib/libgio-2.0.so -lresolv /media/pangu/lsbt/tmp/sysroots/qemux86-64/usr/lib/libcairo.so /media/pangu/lsbt/tmp/sysroots/qemux86-64/usr/lib/libpixman-1.so /media/pangu/lsbt/tmp/sysroots/qemux86-64/usr/lib/libpng12.so /media/pangu/lsbt/tmp/sysroots/qemux86-64/usr/lib/libXren!
 de!
>   r.so /media/pangu/lsbt/tmp/sysroots/qemux86-64/usr/lib/libX11.so /media/pangu/lsbt/tmp/sysroots/qemux86-64/usr/lib/libxcb.so /media/pangu/lsbt/tmp/sysroots/qemux86-64/usr/lib/libXau.so /media/pangu/lsbt/tmp/sysroots/qemux86-64/usr/lib/libXdmcp.so /media/pangu/lsbt/tmp/sysroots/qemux86-64/usr/lib/libpango-1.0.so /media/pangu/lsbt/tmp/sysroots/qemux86-64/usr/lib/libfontconfig.so /media/pangu/lsbt/tmp/sysroots/qemux86-64/usr/lib/libfreetype.so /media/pangu/lsbt/tmp/sysroots/qemux86-64/usr/lib/libexpat.so /media/pangu/lsbt/tmp/sysroots/qemux86-64/usr/lib/libgobject-2.0.so /media/pangu/lsbt/tmp/sysroots/qemux86-64/usr/lib/libffi.so /media/pangu/lsbt/tmp/sysroots/qemux86-64/usr/lib/libgmodule-2.0.so /media/pangu/lsbt/tmp/sysroots/qemux86-64/usr/lib/libgthread-2.0.so -lpthread /media/pangu/lsbt/tmp/sysroots/qemux86-64/usr/lib/libglib-2.0.so -lrt /media/pangu/lsbt/tmp/sysroots/qemux86-64/usr/lib/libxml2.so -ldl -lz -lm -pthread -Wl,-rpath -Wl,/usr/lib/../lib
> /usr/lib/../lib/libXext.so.6: undefined reference to `memcpy@GLIBC_2.14'
> collect2: ld returned 1 exit status
> make[3]: *** [gconf-sanity-check-2] Error 1
>
> On Fri, 2012-03-16 at 23:36 +0800, Mark Hatle wrote:
>> On 3/16/12 12:18 AM, Ni Qingliang wrote:
>>> when building qemux86-64 arch core-image-lsb (distro is poky-lsb), I got
>>> /usr/lib/../lib/libXrandr.so.2: undefined reference to
>>> `memcpy@GLIBC_2.14' when 'do_compile' gconf 3.2.3.
>>>
>>> the default eglibc is 2.13, why it needs 2.14?
>>
>> Without anything further, the only guess I can make is that either you aren't
>> using the version of glibc you think you are, it's gotten some host
>> contamination, an explicit reference was added to libXrandr (doubtful), or you
>> are using something that was built/cached from a previous build.  (i.e. did you
>> build w/ eglibc 2.14/2.15 -- and then switch back to eglibc 2.13 for some reason?)
>>
>> On 3/15/12 9:38 PM, Ni Qingliang wrote:
>>   >  first, thanks your reply.
>>   >
>>   >  Because I can't use task-core-lsb on my device (flash space is not
>>   >  enough), I have to make a custom lsb-base image (without
>>   >  perl/python/graphics).
>>   >
>>   >  I have checked the "linuxstdbase", and it will change the configure
>>   >  option of some packages.
>>   >
>>   >  Indeed, I think the daemon/failure/warning fuctions should be considered
>>   >  in package lsb's RDEPENDS.
>>   >
>>   >  what I want to know is the rdepends or where is the
>>   >  daemon/failure/warning.
>>
>> It certainly looks like a component is missing somewhere in the shell scrips
>> that are provided by the LSB functions.  I would assume that the
>> depends/provides is setup properly to point to whatever should be providing the
>> missing daemon, failure, warning commands.  If it's not (or if by default -- non
>> lsb mode) they're not being built, it's a definite bug.  You shouldn't be able
>> to build a non-functional systems.
>>
>> Please file a defect on bugzilla.yoctoproject.org.  I will attempt to
>> investigate it (or someone else can).  Hopefully it's just as a simple as a
>> missing dependency.
>>
>> --Mark
>>
>>> On Fri, 2012-03-16 at 00:25 +0800, Mark Hatle wrote:
>>>> On 3/15/12 3:18 AM, Ni Qingliang wrote:
>>>>> Hello, I'm working on custom lsb-base image using oe-core.
>>>>>
>>>>> and when using the lsb script, found error:
>>>>>
>>>>> lsb_start_daemon line 44: daemon command not found.
>>>>>
>>>>> similar thing happend on lsb_log_message: failure and warning command
>>>>> not found.
>>>>>
>>>>> maybe these function should be defined in /etc/init.d/functions?
>>>>>
>>>>> but there are not these function in this file (belongs to initscripts).
>>>>
>>>> Did you enable the LSB distribution settings?  Without this, various components
>>>> may not be available.
>>>>
>>>> In Poky, there is a "poky-lsb" distribution type:
>>>>
>>>> DISTRO = "poky-lsb"
>>>> DISTROOVERRIDES = "poky:linuxstdbase"
>>>>
>>>> DISTRO_FEATURES_append = " pam largefile opengl"
>>>> PREFERRED_PROVIDER_virtual/libx11 = "libx11"
>>>>
>>>> (as well as using the core-image-lsb and/or task-core-lsb components.)
>>>>
>>>> If you've tried this and those items are still broken, let me know and I can
>>>> help investigate further.  (One final note, only LSB 1.4 is currently supported.)
>>>>
>>>> --Mark
>>>>
>>>>> Any idea?
>>>>>
>>>>> thanks!
>>>>>
>>>>>
>>>>
>>>>
>>>> _______________________________________________
>>>> Openembedded-core mailing list
>>>> Openembedded-core@lists.openembedded.org
>>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>>>
>>
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>



