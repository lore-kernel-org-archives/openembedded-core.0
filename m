Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1QUh51-0002Mj-6p
	for openembedded-core@lists.openembedded.org;
	Thu, 09 Jun 2011 17:23:31 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p59FKAjU025906
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 9 Jun 2011 08:20:10 -0700 (PDT)
Received: from Macintosh-5.local (172.25.36.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Thu, 9 Jun 2011 08:20:09 -0700
Message-ID: <4DF0E4A8.1000608@windriver.com>
Date: Thu, 9 Jun 2011 10:20:08 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.2.17) Gecko/20110414 Thunderbird/3.1.10
MIME-Version: 1.0
To: Kang Kai <Kai.Kang@windriver.com>
References: <4DF0A70C.7080501@windriver.com>
In-Reply-To: <4DF0A70C.7080501@windriver.com>
Cc: "poky@yoctoproject.org" <poky@yoctoproject.org>, Patches,
	about the oe-core layer <openembedded-core@lists.openembedded.org>
Subject: Re: Question about apply eglibc configurability to create minimal image
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
X-List-Received-Date: Thu, 09 Jun 2011 15:23:31 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 6/9/11 5:57 AM, Kang Kai wrote:
> Hi Mark,
> 
> I am focus on eglibc itself compilation with disabling all the 
> configurable options, right now eglibc can be compiled with disable all 
> the configurable options.
> 
> But when I build core-image-minimal in a clear new directory, some 
> packages build failed and they need eglibc supports, such as

core-image-minimal is simply to large of an image to see some of the advantages
of the eglibc configuration.  Realistically the advantages come on single
application or small (busybox + single application) systems.

> gcc-runtime    depends on     libc-libm

The above looks like a bug to me and should be investigated.. (a bug in gcc that
is..)

> ncurse            depends on    libc-posix-wchar-io libc-posix-clang-wchar

ncurses can be configured WITHOUT wide character support, the needs to be done
with any of the wchar options disabled in eglibc.

> openssl           depends on    libc-inet libc-nsswitch

I'm not sure why openssl needs either inet or nsswitch.  inet perhaps if it
tries to make certain socket calls, but libc-nsswitch should never be required
outside of eglibc.  This is likely a configuration issue in openssl -- or a bug
in eglibc.

> gettext            depends on    libc-spawn libc-locale-code 
> libc-getlogin libc-utmp
> ...

Once we introduce gettext (beyond simply it's m4 macros) we're no longer in
"small" system territory.  gettext and many others really want some of the
larger system capabilities as they are designed for multilingual systems.

> After enable those options, the image size only decrease from 9.6M  to 
> 9.4M(qemux86). And the dependencies on eglibc is hard to break, 
> something like  libcrypt getlogin(function) can't be breaken.
> Could you give me some directions what should I do with eglibc 
> configurability?

My suggest is to start with a new custom configuration.  (ignore the gcc-runtime
for right now and enable libm.)  The goal of this configuration is a small,
local system -- without network connectivity.

Walk through the core-image-minimal, and you'll see:
IMAGE_INSTALL = "task-core-boot ${ROOTFS_PKGMANAGE_BOOTSTRAP}"

Looking at task-core-boot:

RDEPENDS_task-core-boot = "\
    base-files \
    base-passwd \
    busybox \
    initscripts \
    ${@base_contains("MACHINE_FEATURES", "keyboard", "keymaps", "", d)} \
    modutils-initscripts \
    netbase \
    sysvinit \
    tinylogin \
    udev \
    ${VIRTUAL-RUNTIME_update-alternatives} \
    ${MACHINE_ESSENTIAL_EXTRA_RDEPENDS}"

RRECOMMENDS_task-core-boot = "\
    ${MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS}"

From the above, I'm pretty sure that "netbase" will require a lot of networking
components, specifically adding things like libc-inet.  So avoid netbase.

It's possible that keyboard/keymaps may cause additional stuff to come in due to
locale requirements.. so I'd dump those as well..

sysvinit may also introduce some additional items -- so if it causes problems,
remove it and switch to the init located within busybox.

update-alternatives is what included gettext -- so this might need some
enhancement to avoid gettext as a requirement.  So I'd suggest skipping it.
(Note without it, it's likely busybox, tinylogin may not get setup properly...)

udev is quite complex and drags in a number of components -- so drop that..

Leaving:

    base-files \
    base-passwd \
    busybox \
    initscripts \
    modutils-initscripts \
    sysvinit \
    tinylogin

First see if you can compile the above with a minimal eglibc configuration.  If
not I can help you work through those issues..  If you can, you SHOULD see a
fairly dramatic decrease in size.

--Mark

> Thanks a lot!
> 
> I made a mistake that try eglibc configurability in a directory which 
> has build core-image-minimal, so the packages which depend on eglibc 
> didn't rebuild, and I didn't find the dependency before. I am sorry!
> 
> Regards,
> Kai



