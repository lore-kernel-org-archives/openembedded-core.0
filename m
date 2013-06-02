Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id AB31361DDE
	for <openembedded-core@lists.openembedded.org>;
	Sun,  2 Jun 2013 20:31:58 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r52KVx3A018818
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 2 Jun 2013 13:31:59 -0700 (PDT)
Received: from [128.224.21.242] (128.224.21.242) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.342.3;
	Sun, 2 Jun 2013 13:31:57 -0700
Message-ID: <51ABABBA.2030301@windriver.com>
Date: Sun, 2 Jun 2013 16:31:54 -0400
From: Bruce Ashfield <bruce.ashfield@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130510 Thunderbird/17.0.6
MIME-Version: 1.0
To: Koen Martens <gmc@sonologic.nl>
References: <20130516152515.GB25740@monk.dh.sono>
	<5194FE20.6000505@windriver.com>
	<20130602143039.GC26506@monk.dh.sono>
In-Reply-To: <20130602143039.GC26506@monk.dh.sono>
Cc: dvhart@linux.intel.com, openembedded-core@lists.openembedded.org
Subject: Re: adding kernel headers to sysroot
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
X-List-Received-Date: Sun, 02 Jun 2013 20:31:59 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 13-06-02 10:30 AM, Koen Martens wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Hi Bruce,
>
> On Thu, May 16, 2013 at 11:41:20AM -0400, Bruce Ashfield wrote:
>> On 13-05-16 11:25 AM, Koen Martens wrote:
>>> I have added a kernel header file to the linux kernel for my project, that
>>> exposes a public API for new kernel functionality I have implemented. This
>>> header file is needed to compile certain user-space programs. I have been
>>> trying to get this include file in the sysroot used to compile the user-
>>> space programs (as well as in the SDK i build for the project).
>>
>>   - point your application at the STAGING_KERNEL_DIR and include the
>>     header from there. You are already coupled to the kernel, since
>>     you need this header, so it isn't as evil as it seems. This will
>>     also get you SDK support.
>>
>>   - Install the header file to another location in the sysroot and
>>     include it from there. You can do this via an append to the
>>     kernel install. Assuming you don't collide with existing headers,
>>     you could use this to install into a standard location as well,
>>     but things start to get a bit more risk. You can also arrange
>
> I went with the latter option, but i'm still curious as to what part of
> oe magic installs the standard kernel headers?

That's the linux-libc-headers package. It uses the matching linux
release tarball and installs them to the /usr/include/linux
directory structure.

And good choice on the latter option. I've been working with this
more myself lately, and if you attempt to install over top of the
libc-headers location, you'll end up with package ordering issues
if you use the SDK, and in general, not be triggering the right
rebuilds when things change.

Bruce

>
>> How often does the header file change ? If it really is static there's
>> another option, and that is to capture the header in the applications
>> themselves and simply use it that way. iptables, and other user application
>> have done this in the past, and will do it again in the future.
>
> Yep, i'm aware of the way ipfilter does it, from personal experience with the
> insanity that causes :)
>
> Thanks!
>
> Koen
>
> - --
> https://ohm2013.org/            - outdoor hacker conference, August 2013, NL
> http://www.sonologic.nl/        - hosting and DBA
> http://koenmartens.nl/          - curriculum vitae
> https://www.revspace.nl/        - hackerspace in Den Haag, NL
> http://signal.hackerspaces.org/ - hackerspace radio
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.12 (GNU/Linux)
>
> iEYEARECAAYFAlGrVw8ACgkQktDgRrkFPpa0rQCfWUXPWJEUKKn5Ngc8MOdSzlt+
> clcAoIoGA7jIiVBvZXQz2MpiXHD6/6Tj
> =zYrm
> -----END PGP SIGNATURE-----
>


