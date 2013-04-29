Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1UWwwc-00041K-QU
	for openembedded-core@lists.linuxtogo.org;
	Tue, 30 Apr 2013 00:53:25 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 29 Apr 2013 15:33:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,576,1363158000"; d="scan'208";a="295124142"
Received: from unknown (HELO [10.255.12.150]) ([10.255.12.150])
	by azsmga001.ch.intel.com with ESMTP; 29 Apr 2013 15:33:07 -0700
Message-ID: <517EF523.2060405@linux.intel.com>
Date: Mon, 29 Apr 2013 15:33:07 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
References: <1367249183-2579-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
	<CAJTo0Laf-d0hz5kkRZZAr7W4yGs+aYaTu51XU2k2q-s0p57q5A@mail.gmail.com>
	<lyip35jpw8.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<CAJTo0LYGf=QtQ_dEbaUiFWOGjpAjfNXqCPY_XYrt+G-rUhcsOg@mail.gmail.com>
	<lyehdtjmkw.fsf@ensc-virt.intern.sigma-chemnitz.de>
In-Reply-To: <lyehdtjmkw.fsf@ensc-virt.intern.sigma-chemnitz.de>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.linuxtogo.org>
Subject: Re: [PATCH 1/7] bitbake.conf: fix definition of ${libexecdir}
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
X-List-Received-Date: Mon, 29 Apr 2013 22:53:36 -0000
X-List-Received-Date: Mon, 29 Apr 2013 22:53:36 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit

On 04/29/2013 10:03 AM, Enrico Scholz wrote:
> "Burton, Ross" <ross.burton-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
> writes:
>
>>> Things *are* expected to move around.  E.g. /usr/lib/openssh/sftp-server
>>> becomes /usr/lib/sftp-server now.
>>
>> Right, so don't use Debian as a rationale for this approach.
>
> Debian defines libexecdir to be /usr/lib (+multiarch).  It might set
> sometimes per-package '--libexecdir=${libexecdir}/<package>' configure
> options, but libexecdir is always /usr/lib there.
>

As I read though this, a couple things I noted from some of the 
available information, the GNU Directory section you quoted earlier 
actually suggests a package-name directory should be included.

   The definition of ‘libexecdir’ is the same for all packages, so you
   should install your data in a subdirectory thereof. Most packages
   install their data under $(libexecdir)/package-name/, possibly within
   additional subdirectories thereof, such as $(libexecdir)/package-
   name/machine/version.

And as you pointed out below, the FHS also touches on having a 
sub-directory for applications to use for non-user object and internal 
binaries (like plugins).


>
>> $ ls /usr/lib/openssh/
>> sftp-server  ssh-keysign  ssh-pkcs11-helper
>>
>> For reference, on Fedora this binary is /usr/libexec/openssh/sftp-server,
>> with the split between dropping binaries directly into /usr/libexec or
>> using a subdirectory apparently arbitrary.
>
> Placing openssh helpers in own subdirectory can make sense when
> there are alternative implementations.  Nevertheless, programs
> expect ${libexecdir}/sftp-server there.
>
There seems to be a specific case here with openssh and dropbear having 
alternatives for similar binaries provided by multiple packages, then we 
should handle that special case.

> Every recipe using libexecdir must be investigated whether it is placing
> only private files into it (--> candidate for ${pkglibexecdir}), or
> whether files are part of its public api (--> must be directly below
> ${libexecdir}).
>
>
>> Every package that I looked at on Debian is using
>> /usr/lib/[packagenameish]/[binary].  /usr/lib/upower/upowerd.
>> /usr/lib/telepathy/telepathy-gabble.  I say packagenameish as it's
>> often changed to be a more general name - i.e. all of the Telepathy
>> backends use /usr/lib/telepathy.
>>
>> There are no *executables*, only libraries, in /usr/lib on Debian or
>
> I do not have Debian for reference; but Ubuntu-12.04 (only a minimal,
> GUI-less installation) has
>
> /usr/lib/command-not-found
> /usr/lib/pt_chown
>
> and
>
> /usr/lib/sftp-server -> openssh/sftp-server
>
This could be done via the update-alternatives mechanism in the oe-core 
space.

>
>
>> Fedora.
>
> Fedora has /usr/libexec with lot of executables directly below it.
>
>
>> I'm really not liking dropping the executables into a directory that
>> on non-multilib is the same as libdir.
>
> When we want to follow FHS strictly, nothing prevents us from placing
> files into /usr/lib.
>
>    /usr/lib includes object files, libraries, and internal binaries
>    that are not intended to be executed directly by users or shell
>    scripts.
>
>    Applications may use a single subdirectory under /usr/lib. If an
>    application uses a subdirectory, all architecture-dependent data
>    exclusively used by the application must be placed within that
>    subdirectory.
>
>
> When we really do not want executables under ${libdir}, we can set
>
>    libexecdir = ${prefix}/lib/libexec
>
> (which might be a good setting for world-builds to detect some kind of
> libexecdir related problems).
>
I prefer what Ross suggested, fixing libexecdir to be 
${exec_prefix}/lib/${BPN}

>
>> If we want to be like the half of the world that does the same as
>> Fedora then we can revert back to /usr/libexec.  Or we can be like
>> the half of the world that does the same as Debian and use something
>> similar to ${prefix}/lib/$(DEB_SOURCE_PACKAGE) (as used in CDBS and
>> Debhelper):
>
> Debian does *not* include the package name since mid 2011
>
>          http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=541458
>
I just looked at a Debian build and /usr/lib is abound with package 
directories. So given the direction we already have going with the half 
that does ${prefix}/lib/${package name} makes the most sense.  We are 
not exactly Fedora nor Debian, OE-Core is an embedded system, we are 
doing our best to match with the FHS as LSB is one of the design features.

Since I did the last libexecdir change, I will start to investigate 
changing libexecdir to be ${exec_prefix}/lib/${BPN}.  The concern I have 
with this will be plugins and other executable binaries created in a 
multilib environment.

Sau!

>
> Enrico
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
>


