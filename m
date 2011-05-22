Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QNzDu-0005qD-T9
	for openembedded-core@lists.openembedded.org;
	Sun, 22 May 2011 05:20:59 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 21 May 2011 20:17:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,250,1304319600"; 
   d="scan'208";a="6040932"
Received: from unknown (HELO [10.255.12.39]) ([10.255.12.39])
	by fmsmga001.fm.intel.com with ESMTP; 21 May 2011 20:17:53 -0700
Message-ID: <4DD88061.7040601@linux.intel.com>
Date: Sat, 21 May 2011 20:17:53 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc13 Thunderbird/3.1.10
MIME-Version: 1.0
To: Khem Raj <raj.khem@gmail.com>
References: <cover.1306002889.git.sgw@linux.intel.com>
	<92c28973316e62fd2e4054fe3bab85685c5acc3e.1306002889.git.sgw@linux.intel.com>
	<BANLkTi=y+5qqFiZfrXCcOQ9CtTYdzh0GCw@mail.gmail.com>
In-Reply-To: <BANLkTi=y+5qqFiZfrXCcOQ9CtTYdzh0GCw@mail.gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 8/8] distcc_2.18.3.bb: Fix compilation on uclibc
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
X-List-Received-Date: Sun, 22 May 2011 03:20:59 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 05/21/2011 04:06 PM, Khem Raj wrote:
> On Sat, May 21, 2011 at 11:38 AM, Saul Wold<sgw@linux.intel.com>  wrote:
>> From: Khem Raj<raj.khem@gmail.com>
>>
>> We enable gtk/gnome in distcc that code uses loadavg()
>> a function unimplemented in uclibc. Therefore for uclibc
>> we disable gnome and gtk+ features in distcc
>>
>
>
> This patch had reviews to be addressed which I have done
> the patch is updated in pull branch. Use that one
>
I will pull the lastest into my sgw/stage branch.  When I did the pull, 
I thought things were completed, I guess bad timing on my part.

Sau!


>> Signed-off-by: Khem Raj<raj.khem@gmail.com>
>> ---
>>   meta/recipes-devtools/distcc/distcc_2.18.3.bb |   17 ++++++++++++-----
>>   1 files changed, 12 insertions(+), 5 deletions(-)
>>
>> diff --git a/meta/recipes-devtools/distcc/distcc_2.18.3.bb b/meta/recipes-devtools/distcc/distcc_2.18.3.bb
>> index 1f5c2af..34b04a5 100644
>> --- a/meta/recipes-devtools/distcc/distcc_2.18.3.bb
>> +++ b/meta/recipes-devtools/distcc/distcc_2.18.3.bb
>> @@ -6,7 +6,10 @@ LICENSE = "GPLv2"
>>   LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
>>   PR = "r6"
>>
>> -DEPENDS = "avahi gtk+"
>> +DEPENDS = "avahi ${GTKDEP}"
>> +GTKDEP_libc-uclibc = ""
>> +GTKDEP = "gtk+"
>> +
>>   RRECOMMENDS_${PN} = "avahi-daemon"
>>
>>   # Upstream change this patch periodically so store locally
>> @@ -24,17 +27,21 @@ inherit autotools pkgconfig update-rc.d
>>
>>   INITSCRIPT_NAME = "distcc"
>>
>> -EXTRA_OECONF = " --with-gtk "
>> -
>> +EXTRA_OECONF_libc-glibc = " --with-gtk "
>> +EXTRA_OECONF_libc-uclibc = " --without-gtk --without-gnome "
>>   do_install_append() {
>>      install -d ${D}${sysconfdir}/init.d/
>>      install -d ${D}${sysconfdir}/default
>>      install -m 0755 ${WORKDIR}/distcc ${D}${sysconfdir}/init.d/
>>      install -m 0755 ${WORKDIR}/default ${D}${sysconfdir}/default/distcc
>> +    ${DESKTOPINSTALL}
>> +}
>> +DESKTOPINSTALL = ""
>> +DESKTOPINSTALL_libc-glibc () {
>> +    install -d ${D}${datadir}/distcc/
>>      install -m 0644 ${WORKDIR}/distccmon-gnome.desktop ${D}${datadir}/distcc/
>>   }
>> -
>> -PACKAGES += "distcc-distmon-gnome"
>> +PACKAGES_append_libc-glibc = " distcc-distmon-gnome"
>>
>>   FILES_${PN} = " ${sysconfdir} \
>>                 ${bindir}/distcc \
>> --
>> 1.7.3.4
>>
>>


