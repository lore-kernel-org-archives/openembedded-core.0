Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1Tlj6U-0000bS-RO
	for openembedded-core@lists.openembedded.org;
	Thu, 20 Dec 2012 17:36:19 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 20 Dec 2012 08:21:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,324,1355126400"; d="scan'208";a="267799658"
Received: from lpalcu-linux (HELO [10.237.105.165]) ([10.237.105.165])
	by fmsmga002.fm.intel.com with ESMTP; 20 Dec 2012 08:21:28 -0800
Message-ID: <50D33B07.7020203@intel.com>
Date: Thu, 20 Dec 2012 18:21:27 +0200
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <1355933032-25392-1-git-send-email-laurentiu.palcu@intel.com>
	<1356016878.24487.187.camel@phil-desktop>
	<CAJTo0Lb5Z67naXx-pFWd_ksEP5SYpd0qnDzv801UO9MpLB1PdQ@mail.gmail.com>
In-Reply-To: <CAJTo0Lb5Z67naXx-pFWd_ksEP5SYpd0qnDzv801UO9MpLB1PdQ@mail.gmail.com>
Cc: Phil Blundell <philb@gnu.org>, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] pango: have postinstalls run at do_rootfs time
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
X-List-Received-Date: Thu, 20 Dec 2012 16:36:21 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 12/20/2012 05:59 PM, Burton, Ross wrote:
> On 20 December 2012 15:21, Phil Blundell <philb@gnu.org> wrote:
>> On Wed, 2012-12-19 at 18:03 +0200, Laurentiu Palcu wrote:
>>> Since pango-native is built anyway and all the modules are in the native
>>> sysroot, create the cache file by scanning those files instead of the
>>> target files. The latter will fail because the shared objects wouldn't
>>> be from the same ELF class.
>>
>> Is it guaranteed that the native build will have the same set of
>> modules?  It seems to me that it would be safer to scan the target ones
>> under qemu as you did for gtk-immodules.
> 
> I suspected there was no such real thing as an out-of-tree Pango
> module, but I was wrong (http://graphite.sil.org/).
But, in this case, we could use the qemu method only for the graphite
package postinstall... We don't have to use it for pango too.

> 
> Digging quickly into the Debian packaging, they generate the modules
> list at build time (not in a postinst) by running pango-querymodules
> over the directories they just built, filtering the paths (this
> happens in dh_pangomodules).  They also generate a modules list file
> per package and ship it, and pango reads the multiple files.  I'm not
> sure if this is upstream behaviour or a Debian-specific patch.
How do they handle the cross-compiling issue? They cannot run the native
pango-querymodules on a cross-compiled shared object. It will fail.

Thanks,
Laurentiu
> 
> Ross
> 


