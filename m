Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SPEiI-0008DM-52
	for openembedded-core@lists.openembedded.org;
	Tue, 01 May 2012 17:10:02 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 01 May 2012 08:00:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="135724600"
Received: from unknown (HELO [10.255.12.182]) ([10.255.12.182])
	by orsmga001.jf.intel.com with ESMTP; 01 May 2012 08:00:17 -0700
Message-ID: <4F9FFA81.1040900@linux.intel.com>
Date: Tue, 01 May 2012 08:00:17 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:11.0) Gecko/20120329 Thunderbird/11.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1335824356.git.sgw@linux.intel.com>
	<c5a3097cc2507d3fe49f113684912d4804ed02bd.1335824356.git.sgw@linux.intel.com>
	<1335878270.7415.104.camel@ted> <4F9FE478.6070107@gmail.com>
In-Reply-To: <4F9FE478.6070107@gmail.com>
Subject: Re: [CONSOLIDATED PULL 19/19] gcc-package-target: add libexec for plugins
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
X-List-Received-Date: Tue, 01 May 2012 15:10:02 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/01/2012 06:26 AM, Khem Raj wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> On 05/01/2012 06:17 AM, Richard Purdie wrote:
>> On Mon, 2012-04-30 at 15:21 -0700, Saul Wold wrote:
>>> Fixes:
>>>
>>> ERROR: For recipe gcc, the following files/directories were
>>> installed but not shipped in any package: ERROR:
>>> /usr/libexec/gcc/i586-poky-linux/4.7.1/plugin/gengtype
>
> see part of this commit
> http://git.openembedded.org/openembedded-core-contrib/commit/?h=kraj/misc&id=86542ceef469a20a77d2191f7c1f6e36911174d3
>
Khem, this patch also seems to to multiple things.

>>> Signed-off-by: Saul Wold<sgw@linux.intel.com>  ---
>>> meta/recipes-devtools/gcc/gcc-4.7.inc            |    2 +-
>>> meta/recipes-devtools/gcc/gcc-package-target.inc |   11
>>> ++++------- 2 files changed, 5 insertions(+), 8 deletions(-)
>>
>> Saul, this patch does other things in addition to what is
>> described above. Why?
>>
I had a different change, and should have changed that back to not 
remove the plug-in package.  I will update this patch in the tree.

Sau!

>> Cheers,
>>
>> Richard
>>
>>
>>> diff --git a/meta/recipes-devtools/gcc/gcc-4.7.inc
>>> b/meta/recipes-devtools/gcc/gcc-4.7.inc index 784a3be..8adeb8d
>>> 100644 --- a/meta/recipes-devtools/gcc/gcc-4.7.inc +++
>>> b/meta/recipes-devtools/gcc/gcc-4.7.inc @@ -1,6 +1,6 @@ require
>>> gcc-common.inc
>>>
>>> -PR = "r0" +PR = "r1"
>>>
>>> # Third digit in PV should be incremented after a minor release #
>>> happens from this branch on gcc e.g. currently its 4.7.0 diff
>>> --git a/meta/recipes-devtools/gcc/gcc-package-target.inc
>>> b/meta/recipes-devtools/gcc/gcc-package-target.inc index
>>> d58e001..392dfc4 100644 ---
>>> a/meta/recipes-devtools/gcc/gcc-package-target.inc +++
>>> b/meta/recipes-devtools/gcc/gcc-package-target.inc @@ -1,5 +1,5
>>> @@ PACKAGES = "\ -  ${PN} ${PN}-plugins ${PN}-symlinks \ +  ${PN}
>>> ${PN}-symlinks \ g++ g++-symlinks \ cpp cpp-symlinks \ g77
>>> g77-symlinks \ @@ -36,20 +36,17 @@ FILES_${PN}-dev = "\ "
>>> FILES_${PN}-plugin-dev = "\
>>> ${gcclibdir}/${TARGET_SYS}/${BINV}/plugin/include/ \ -
>>> ${gcclibdir}/${TARGET_SYS}/${BINV}/plugin/gengtype \
>>> ${gcclibdir}/${TARGET_SYS}/${BINV}/plugin/gtype.state \ +
>>> ${libexecdir}/gcc/${TARGET_SYS}/${BINV}/plugin/gengtype \ "
>>> +ALLOW_EMPTY_${PN}-plugin-dev = "1" + FILES_${PN}-symlinks = "\
>>> ${bindir}/cc \ ${bindir}/gcc \ ${bindir}/gccbug \ "
>>>
>>> -FILES_${PN}-plugins = "\ -
>>> ${gcclibdir}/${TARGET_SYS}/${BINV}/plugin \ -"
>>> -ALLOW_EMPTY_${PN}-plugins = "1" - FILES_g77 = "\
>>> ${bindir}/${TARGET_PREFIX}g77 \
>>> ${libexecdir}/gcc/${TARGET_SYS}/${BINV}/f771 \
>>
>>
>>
>> _______________________________________________ Openembedded-core
>> mailing list Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.11 (GNU/Linux)
> Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/
>
> iEYEARECAAYFAk+f5HcACgkQuwUzVZGdMxTCWgCZAb0BcPwGMsign36/AGoPBQpk
> ABoAn3lqySL2xGTUFvwQoAbXUz3eNQzr
> =NpaZ
> -----END PGP SIGNATURE-----
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


