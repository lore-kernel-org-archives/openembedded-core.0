Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 2CE6775A1A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jun 2015 22:55:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t5NMtDb4018044; Tue, 23 Jun 2015 23:55:13 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id eVqlsHeoJmNy; Tue, 23 Jun 2015 23:55:13 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t5NMsxUc018032
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 23 Jun 2015 23:55:10 +0100
Message-ID: <1435100099.11489.115.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Saul Wold <sgw@linux.intel.com>
Date: Tue, 23 Jun 2015 23:54:59 +0100
In-Reply-To: <5589E159.4080909@linux.intel.com>
References: <1435087374-18117-1-git-send-email-sgw@linux.intel.com>
	<1435096427.11489.102.camel@linuxfoundation.org>
	<5589E159.4080909@linux.intel.com>
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH][master&fido] image.bbclass: Disable USE_DEPMOD for the dummy kernel
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
X-List-Received-Date: Tue, 23 Jun 2015 22:55:27 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2015-06-23 at 15:44 -0700, Saul Wold wrote:
> On 06/23/2015 02:53 PM, Richard Purdie wrote:
> > On Tue, 2015-06-23 at 12:22 -0700, Saul Wold wrote:
> >> The image bbclass will try to find the kernel-abiversion file which is not part
> >> of the linux-dummy kernel since there is no actual kernel. In this case using
> >> depmod also does not make sense since there should not be any kernel module built.
> >>
> >> [YOCTO #7884]
> >>
> >> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> >> ---
> >>   meta/classes/image.bbclass | 2 +-
> >>   1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
> >> index 01f8b3f..be245e9 100644
> >> --- a/meta/classes/image.bbclass
> >> +++ b/meta/classes/image.bbclass
> >> @@ -66,7 +66,7 @@ PACKAGE_INSTALL_ATTEMPTONLY ?= "${FEATURE_INSTALL_OPTIONAL}"
> >>   EXCLUDE_FROM_WORLD = "1"
> >>
> >>   USE_DEVFS ?= "1"
> >> -USE_DEPMOD ?= "1"
> >> +USE_DEPMOD ?= '${@oe.utils.conditional("PREFERRED_PROVIDER_virtual/kernel", "linux-dummy", "0", "1", d)}'
> >>
> >
> > I'm not convinced this is the right way to solve this. How about we
> > teach the code in rootfs.py not to generate a modules.dep file if there
> > are no kernel modules to generate dependency information for?
> >
> I guess we could check for /lib/modules, but I think checking for 
> virtual/kernel is cleaner and safer since we know we don't want to run 
> this for linux-dummy, but if some random recipe happens to create 
> /lib/modules it will break.
> 
> Unless you has some other check in mind to verify no modules are created

Something like "find -name *.ko" on /lib/modules was what I was
wondering about. Extrapolating, perhaps this code should iterate any
version directories here in case multiple sets of modules for different
kernel versions were installed? That way it wouldn't need to know about
the kernel-abiversion file?

> I also thought about a change to linux-dummy to place an 
> kernel-abiversion, but that had other dangers.

Right. Unfortunately this file is used to populate KERNEL_VERSION
elsewhere and we may also have problems in those places with linux-dummy
too :/

Cheers,

Richard


