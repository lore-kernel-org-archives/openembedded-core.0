Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1R3qbO-0002VN-Ff
	for openembedded-core@lists.openembedded.org;
	Wed, 14 Sep 2011 16:38:14 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p8EEX3ub000343
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 14 Sep 2011 07:33:03 -0700 (PDT)
Received: from Macintosh-5.local (172.25.36.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Wed, 14 Sep 2011 07:33:02 -0700
Message-ID: <4E70BB1D.4080805@windriver.com>
Date: Wed, 14 Sep 2011 09:33:01 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6;
	rv:6.0.2) Gecko/20110902 Thunderbird/6.0.2
MIME-Version: 1.0
To: "Xu, Dongxiao" <dongxiao.xu@intel.com>
References: <cover.1315815933.git.dongxiao.xu@intel.com>
	<85e223c8783eca48835226c2786e60b2c67e66df.1315815933.git.dongxiao.xu@intel.com>
	<4E6E1C8A.5060508@windriver.com>
	<D5AB6E638E5A3E4B8F4406B113A5A19A12D754AFF1@shsmsx501.ccr.corp.intel.com>
	<4E6F76C7.6050606@windriver.com>
	<D5AB6E638E5A3E4B8F4406B113A5A19A12D754B5B6@shsmsx501.ccr.corp.intel.com>
	<4E6F7DC2.4010000@windriver.com>
	<D5AB6E638E5A3E4B8F4406B113A5A19A12D81DF002@shsmsx501.ccr.corp.intel.com>
In-Reply-To: <D5AB6E638E5A3E4B8F4406B113A5A19A12D81DF002@shsmsx501.ccr.corp.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] package_rpm: add architecture info in rpm spec file
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
X-List-Received-Date: Wed, 14 Sep 2011 14:38:14 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 9/13/11 8:03 PM, Xu, Dongxiao wrote:
> Hi Mark,
> 

...trimming the thread a bit...

>>>>>> This patch is incorrect.  Architectural information should not be
>>>>>> in the dependencies within RPM packages.
>>>>>>
>>>>>> RPM is expected to find the proper version of a package to install
>>>>>> based on the existing dependency information.  I'm in the process
>>>>>> of investigating why certain items are not found properly.
>>>>>

> Let me take another case as an example during my debugging to this issue.
> 
> Thinking that you have built out an base qemux86-64 image, and several lib32 multilib packages. Due to the wrong selection when doing RPM, we have several packages (like libgtk), which need x86-64 version installed, however they are replace by 32bit packages. The do_rootfs process succeeded, but when booting the image, some Xserver programs fail to find /usr/lib64/libgtk.so, because in the system only /usr/lib/libgtk.so is installed, which caused the X start failure.

That is a completely different issue.  If applications need the 64-bit libraries
and the 32-bit ones are fulfilling the dependencies, then we have a dependency
mismatch.  Libraries should contain dependency information (within RPM) that
properly describe the ELF ABI as an artifact of the dependency generation.  This
is a defect we should be able to resolve in the package_rpm.bbclass.

I'll attempt to look into it today, unless someone beats me to it.

>>
>> There are different strategies we can use to deal with these situations.
>>
>> 1) Resolve the "base" non-multilib system "first", then augment it with the
>> multilib components.  This results in a "base system" + alternative packages.
>>
>> 2) Resolve the system as whole, including multilibs, and use the policy
>> components to determine the "best match".  (best match may not be working
>> right
>> today)  This results in a system based purely on dependency matches.
>>
>> Either way, our current implementation doesn't quite match either of them.
>> We're closer to the second version of the implementation today....
>>
>> If the base system approach is what we want, vs the pure dependency based
>> system, then we will need to change the way the dependencies are being
>> resolved and the ordering of the resolution in the packages_rpm.bbclass (or
>> rootfs_rpm.bbclass).  Basically:
>>
>> *) take the list of dependencies and filter out any multilibs, and only scan them
>> against the base archs.
>>
>> *) add to that resolution any multilib components that had been filtered out
>> and scan against the all archs.
>>
>> ....
>>
>> *) install as we do today
> 
> I ever tried the second approach to fix the problem, however it failed.
> 
> I split the installation into two parts as you mentioned, first part is to install the base arch packages, and it does succeed. The second part is to install resolution to multilib components, when calculating the dependency, we will find "package xxx is already installed" error will be detected again by the "justdb" installation. I think there are wrong RPM dependency when installing lib32 multilib packages. showed as follows:
> 
> Processing locale-base-en-us...
> Processing locale-base-en-gb...
> Processing task-core-boot...
> Processing task-core-apps-console...
> Processing task-core-ssh-dropbear...
> Processing task-core-apps-x11-pimlico...
> Processing task-core-x11-sato...
> Processing zypper...
> Processing task-core-x11-base...
> Processing task-core-apps-x11-games...
> Processing task-core-apps-x11-core...
> Processing task-base-extended...
> Processing rpm...
> Manifest: /distro/dongxiao/build-ml6/tmp/work/qemux86_64-poky-linux/core-image-sato-1.0-r0/rootfs/install/install.manifest
> Preparing...                ##################################################
> libc6                       ##################################################
> update-rc.d-dbg             ##################################################
> gst-meta-audio              ##################################################
> pciutils-ids                ##################################################
> ...
> ...
> Processing lib32-connman-gnome...
> Processing lib32-task-base-3g...
> Processing lib32-task-base-wifi...
> Processing lib32-task-base-bluetooth...
> Manifest: /distro/dongxiao/build-ml6/tmp/work/qemux86_64-poky-linux/core-image-sato-1.0-r0/rootfs/install/install_multilib.manifest
> Preparing...                ##################################################
> error: Install/Erase problems:
>         package libc6-2.13-r14+svnr14157.x86_64 is already installed
>         package update-rc.d-dbg-0.7-r4.all is already installed
>         package gst-meta-audio-0.10-r10.x86_64 is already installed
>         package pciutils-ids-3.1.7-r2.x86_64 is already installed
>         package udev-extraconf-0.0-r1.x86_64 is already installed
> ...

This is a bit strange.  It should have detected from the resolution code that
the item was already installed and doesn't need to be re-installed -- unless the
above ELF types are causing this issue as well as the one described above.

--Mark



