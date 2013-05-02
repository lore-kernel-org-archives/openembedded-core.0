Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1UXwxM-0000JT-RR
	for openembedded-core@lists.openembedded.org;
	Thu, 02 May 2013 19:06:13 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r42GmDNG007174
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 2 May 2013 09:48:14 -0700 (PDT)
Received: from msp-dhcp2.wrs.com (172.25.34.2) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.342.3;
	Thu, 2 May 2013 09:48:13 -0700
Message-ID: <518298CD.4080109@windriver.com>
Date: Thu, 2 May 2013 11:48:13 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:17.0) Gecko/20130328 Thunderbird/17.0.5
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <CAJTo0LZdtT=qg2k3eBJ_DQHQzMvqS0vwFSmkgCxxG7KOiPWfzQ@mail.gmail.com>
In-Reply-To: <CAJTo0LZdtT=qg2k3eBJ_DQHQzMvqS0vwFSmkgCxxG7KOiPWfzQ@mail.gmail.com>
Subject: Re: libexecdir and multilib
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
X-List-Received-Date: Thu, 02 May 2013 17:06:19 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 5/2/13 11:10 AM, Burton, Ross wrote:
> Hi all,
>
> There were several issues being discussed here under the topic of
> libexecdir, some simple and some less so.  I'll ramble for a bit to
> try and get a proper conclusion debated.
>
> The situation where you have a 32-bit dropbear but a 64-bit openssh is
> rather pathological and I'd like to know if this was a real-world
> problem and the rationale behind it, or whether it was an example of a
> hypothetical issue.  Note that the example of Debian using "/usr/lib"
> as libexecdir is true only in the case where ML isn't being used, then
> libexecdir is $prefix/lib/$arch, which will have the same hypothetical
> problem.  Debian's SSH works because dropboard and openssh aren't
> multilib-enabled - if you look at e.g. libgstreamer in Debian you'll
> see the libexecdir there is arch-qualified.
>
> Looking at the latest FHS drafts and the revised automake
> documentation, I agree that our default --libexecdir shouldn't contain
> ${BPN}.  There may be packages that drop unrealistic numbers of
> binaries into libexecdir and for those we can join most other
> distributions and change libexecdir on a per-package basis.  However
> the exact choice of libexecdir depends on what ML behaviour we expect
> and have from the package managers, which predictably isn't uniform.
>
> If it wasn't for multilib, this wouldn't be a issue - we could just
> change the libexecdir definition to whatever we wanted.  However,
> multilib does exist and causes all sorts of annoyances, mainly around
> conflicting binaries.  As far as I'm aware rpm and opkg have different
> behaviour when binaries conflict in packages: rpm allows "executables"
> (but not libraries) to conflict and will prefer the 64-bit version,

Minor clarification.  RPM permits ELF executables to "conflict" and resolves 
them using a local policy.  The default local policy happens to be 64-bit right 
now.  (We've got an open defect to permit this policy to change.)

> whereas opkg allows files in $bindir (etc) to conflict.  So, rpm can
> handle an arbitrary libexecdir but opkg can't at present.
>
> So there are three options that I can see:
>
> libexecdir = "$libdir"
> ===
>
> No conflicting binaries in libexecdir when multilib is used, so
> companion binaries used by libraries don't get used by different
> architectures.  Other packages accessing the libexecdir could have
> different architecture, but this is likely a rare situation.

Do we have any cases where a library will care about the byte size of the 
libexecdir executable?  I'm not aware of any....

> libexecdir = "${exec_prefix}/lib"
> ===
>
> Conflicting binaries with multilib, would likely need improvements in
> the opkg bbclass.  Consistent name so cross-architecture file paths
> are consistent, although the binary architecture isn't.  There is the
> possibility of a /usr/lib solely containing libexecdir binaries if the
> ML configuration means that the libdirs used are lib32 and lib64,
> which would look odd.
>
> libexecdir = ${exec_prefix}/libexec"
> ===
>
> Conflicting binaries with multilib, would likely need improvements in
> the opkg bbclass.  Consistent name so cross-architecture file paths
> are consistent, although the binary architecture isn't.
>
> What's clear from the research I've done is that there isn't a clear
> answer - upstreams have different expectations of how
> libexecdir/bindir are used, and different distributions do different
> things to solve the multilib problems - even when the distribution
> maintainers are also upstream developers.  Some examples:
>
> dbus has a helper dbus-daemon-launch-helper, which is installed into
> libexecdir.  Fedora moves it into $libdir, where as Debian moves this
> same binary to /usr/lib/dbus-1 avoiding the $arch... Some disagreement
> there apparently.
>
> gdk-pixbuf has a tool to introspect/register the installed loader
> modules.  As this loads the libraries, it needs to match the
> architecture of the libgdk-pixbuf being used.  Upstream has this tool
> installing to $bindir yet multilib distributions can't have this tool
> being replaced with different architectures, so Fedora adds a
> word-size suffix to the binary, and Debian moves it to their
> libexecdir (which in ML-compatible packages in $libdir/$arch), and
> both adapt their postinst scripts to match.
>
> Both of these examples are in mainstream packages where the package
> maintainers in the distro are also upstream developers, and yet these
> kludges exist (note that our gdk-pixbuf is currently broken in this
> respect).
>
> My personal opinion at this point in time is that we should change
> libexecdir to be $libdir.  My rationale for this is these internal
> binaries then "stick" with their architecture, and that the number of
> binaries that need to be invoked and match their library's
> architecture is likely higher than the number of cross-package and
> cross-architecture hard-coded execution paths (such as 32-bit dropbear
> running 64-bit openssh helpers).

I'm looking for examples of a libexecdir that -is- architecture specific.  I.e. 
a library (or something external) calls it and expects a specific byte size 
version.  If this is the case (gstreamer, dbus, etc?) then $libdir does make 
sense with the update-alternative link being in ${exec_prefix}/lib/... so that 
shell scripts and other things can find it..

--Mark

> Hopefully nobody got too bored reading this, any comments?
>
> Ross
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>



