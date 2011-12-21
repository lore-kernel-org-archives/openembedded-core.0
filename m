Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1RdOfI-0005hH-5r
	for openembedded-core@lists.openembedded.org;
	Wed, 21 Dec 2011 17:05:12 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 21 Dec 2011 07:58:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="88966660"
Received: from unknown (HELO envy.home) ([10.255.12.115])
	by orsmga001.jf.intel.com with ESMTP; 21 Dec 2011 07:58:05 -0800
Message-ID: <4EF201FB.3050008@linux.intel.com>
Date: Wed, 21 Dec 2011 07:57:47 -0800
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: Koen Kooi <koen@dominion.thruhere.net>
References: <cover.1324456294.git.dvhart@linux.intel.com>
	<2ad76233b10f9e4a61a6ecb5490f92fecdc1f1e1.1324456294.git.dvhart@linux.intel.com>
	<20111221100909.GD12791@jama.jama.net>
	<F499A5D5-2BC5-45CC-8DF0-ABD5146E1897@dominion.thruhere.net>
In-Reply-To: <F499A5D5-2BC5-45CC-8DF0-ABD5146E1897@dominion.thruhere.net>
X-Enigmail-Version: 1.3.3
Cc: Martin Jansa <martin.jansa@gmail.com>,
	Yocto Project <yocto@yoctoproject.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [yocto] [PATCH 5/9] task-core-boot: Allow DISTRO to disable keymaps
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
X-List-Received-Date: Wed, 21 Dec 2011 16:05:12 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1



On 12/21/2011 05:19 AM, Koen Kooi wrote:
> 
> Op 21 dec. 2011, om 11:09 heeft Martin Jansa het volgende 
> geschreven:
> 
>> On Wed, Dec 21, 2011 at 01:02:51AM -0800, Darren Hart wrote:
>>> NOTE: I'm looking for a better way to do this.
>>> 
>>> keymaps pulls in gettext, which can't build without wide 
>>> character support.
>>> 
>>> Rather than have to add a -tiny variant of every MACHINE to
>>> drop "keyboard" from the MACHINE_FEATURES, just enable the
>>> DISTRO to define what gets added to RDEPENDS_task-core-boot
>>> when MACHINE_FEATURES includes keyboard. By default, keep
>>> "keymaps", but use DISTRO_KEYMAPS if it is set (to "" for
>>> example).
>>> 
>>> Signed-off-by: Darren Hart <dvhart@linux.intel.com> --- 
>>> meta/recipes-core/tasks/task-core-boot.bb |    7 ++++++- 1
>>> files changed, 6 insertions(+), 1 deletions(-)
>>> 
>>> diff --git a/meta/recipes-core/tasks/task-core-boot.bb 
>>> b/meta/recipes-core/tasks/task-core-boot.bb index 
>>> 05c280d..e097836 100644 --- 
>>> a/meta/recipes-core/tasks/task-core-boot.bb +++ 
>>> b/meta/recipes-core/tasks/task-core-boot.bb @@ -17,6 +17,11 @@
>>> PR = "r9" MACHINE_ESSENTIAL_EXTRA_RDEPENDS ?= "" 
>>> MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS ?= ""
>>> 
>>> +# +# Set by the distro configuration to empty if not supported
>>>  +# +DISTRO_KEYMAPS ?= "keymaps"
>> 
>> Why not VIRTUAL-RUNTIME_keymaps like everywhere else?
> 
> Why not just create a proper task for -tiny instead of making the 
> already horrible task-core-boot even more horrible?
> 
> Besided that: this patch needs to go to the oe-core list

I addressed both of these in 0/9.

task-core-boot really doesn't seem horrible to me. Recreating it
everytime somone wanted a slightly different image config seems like
it would explode into a ton of mostly duplicated
task-core-boot-VARIANT.bb files.

As for the list, I opted to keep everything together for the RFC as
without the distro definition patches the rest had no real context,
and that meant picking a list oe-core or yocto - since the ultimate
goal was a distro definition for yocto, I sent to yocto. I could have
sent to oe, then someone would have been upset that I didn't send to
yocto. As I said in 0/9, the non-RFC patches will go to their
respective lists.

- -- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iQEcBAEBAgAGBQJO8gH7AAoJEKbMaAwKp3642RkH/iAXzR42uEF5MfCrcQQtuKd+
W5VieJRmMZ8Yfdd9DtNxBcBLuoLSECETFKQihBq95SaEgHacTsw7H3mAY2lPA/qq
ZUa4RczNC/21CHkKh5VZIYJYY0cIqMJou/7hvyuLyqNuMp9DYAAw4tNWKNNd78QI
WUvsB9BRW4fDw17lx3ZopyK1ge7U/tWhmCaxlcls0g9s++vWZPiUxQN9h+ZPPluj
qQ86sb8M3mO6kM6AvWafgQgMAc2fRaKlvvns9YR49kltaeAq/6yBRvowR5x3FLSq
xz4F2tbtlUuhz56q72y23wJN9/eF0ll1VnKwACTquYNpmWPQGcHe6KQICEluo3Y=
=JJu4
-----END PGP SIGNATURE-----


