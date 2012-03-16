Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1S8ZLa-0007gX-9c
	for openembedded-core@lists.openembedded.org;
	Fri, 16 Mar 2012 16:45:42 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q2GFar6k015149
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Mar 2012 08:36:53 -0700 (PDT)
Received: from Macintosh-5.local (172.25.36.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Fri, 16 Mar 2012 08:36:53 -0700
Message-ID: <4F635E14.7000707@windriver.com>
Date: Fri, 16 Mar 2012 10:36:52 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6;
	rv:10.0.2) Gecko/20120216 Thunderbird/10.0.2
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1331799506.1041.55.camel@localhost.localdomain>
	<4F621801.4000308@windriver.com>
	<1331875115.1041.67.camel@localhost.localdomain>
In-Reply-To: <1331875115.1041.67.camel@localhost.localdomain>
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
X-List-Received-Date: Fri, 16 Mar 2012 15:45:42 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 3/16/12 12:18 AM, Ni Qingliang wrote:
> when building qemux86-64 arch core-image-lsb (distro is poky-lsb), I got
> /usr/lib/../lib/libXrandr.so.2: undefined reference to
> `memcpy@GLIBC_2.14' when 'do_compile' gconf 3.2.3.
>
> the default eglibc is 2.13, why it needs 2.14?

Without anything further, the only guess I can make is that either you aren't 
using the version of glibc you think you are, it's gotten some host 
contamination, an explicit reference was added to libXrandr (doubtful), or you 
are using something that was built/cached from a previous build.  (i.e. did you 
build w/ eglibc 2.14/2.15 -- and then switch back to eglibc 2.13 for some reason?)

On 3/15/12 9:38 PM, Ni Qingliang wrote:
 > first, thanks your reply.
 >
 > Because I can't use task-core-lsb on my device (flash space is not
 > enough), I have to make a custom lsb-base image (without
 > perl/python/graphics).
 >
 > I have checked the "linuxstdbase", and it will change the configure
 > option of some packages.
 >
 > Indeed, I think the daemon/failure/warning fuctions should be considered
 > in package lsb's RDEPENDS.
 >
 > what I want to know is the rdepends or where is the
 > daemon/failure/warning.

It certainly looks like a component is missing somewhere in the shell scrips 
that are provided by the LSB functions.  I would assume that the 
depends/provides is setup properly to point to whatever should be providing the 
missing daemon, failure, warning commands.  If it's not (or if by default -- non 
lsb mode) they're not being built, it's a definite bug.  You shouldn't be able 
to build a non-functional systems.

Please file a defect on bugzilla.yoctoproject.org.  I will attempt to 
investigate it (or someone else can).  Hopefully it's just as a simple as a 
missing dependency.

--Mark

> On Fri, 2012-03-16 at 00:25 +0800, Mark Hatle wrote:
>> On 3/15/12 3:18 AM, Ni Qingliang wrote:
>>> Hello, I'm working on custom lsb-base image using oe-core.
>>>
>>> and when using the lsb script, found error:
>>>
>>> lsb_start_daemon line 44: daemon command not found.
>>>
>>> similar thing happend on lsb_log_message: failure and warning command
>>> not found.
>>>
>>> maybe these function should be defined in /etc/init.d/functions?
>>>
>>> but there are not these function in this file (belongs to initscripts).
>>
>> Did you enable the LSB distribution settings?  Without this, various components
>> may not be available.
>>
>> In Poky, there is a "poky-lsb" distribution type:
>>
>> DISTRO = "poky-lsb"
>> DISTROOVERRIDES = "poky:linuxstdbase"
>>
>> DISTRO_FEATURES_append = " pam largefile opengl"
>> PREFERRED_PROVIDER_virtual/libx11 = "libx11"
>>
>> (as well as using the core-image-lsb and/or task-core-lsb components.)
>>
>> If you've tried this and those items are still broken, let me know and I can
>> help investigate further.  (One final note, only LSB 1.4 is currently supported.)
>>
>> --Mark
>>
>>> Any idea?
>>>
>>> thanks!
>>>
>>>
>>
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>



