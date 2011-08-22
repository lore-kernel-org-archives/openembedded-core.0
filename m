Received: from mga06.intel.com ([134.134.136.21] helo=orsmga101.jf.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1QvKN8-0007Zi-QO
	for openembedded-core@lists.openembedded.org;
	Mon, 22 Aug 2011 04:36:19 +0200
Received: from mail-yx0-f180.google.com ([209.85.213.180])
	by mga02.intel.com with ESMTP/TLS/RC4-SHA; 21 Aug 2011 19:30:28 -0700
Received: by yxi11 with SMTP id 11so7483784yxi.25
	for <openembedded-core@lists.openembedded.org>;
	Sun, 21 Aug 2011 19:30:28 -0700 (PDT)
Received: by 10.101.72.10 with SMTP id z10mr1727199ank.114.1313980228260;
	Sun, 21 Aug 2011 19:30:28 -0700 (PDT)
Received: from [192.168.1.12] (c-98-246-165-28.hsd1.or.comcast.net
	[98.246.165.28])
	by mx.google.com with ESMTPS id b5sm4827965anm.21.2011.08.21.19.30.27
	(version=SSLv3 cipher=OTHER); Sun, 21 Aug 2011 19:30:27 -0700 (PDT)
Message-ID: <4E51BF42.307@intel.com>
Date: Sun, 21 Aug 2011 19:30:26 -0700
From: Scott Garman <scott.a.garman@intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.18) Gecko/20110617 Lightning/1.0b2 Thunderbird/3.1.11
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <cover.1313826618.git.wenzong.fan@windriver.com>	<fc4770ac723a1fa69bc53a8a887b5892cfb99968.1313826618.git.wenzong.fan@windriver.com>
	<4E4FDB65.1010306@gmail.com>
In-Reply-To: <4E4FDB65.1010306@gmail.com>
Subject: Re: [PATCH 1/1] libpam: Setting suid bit for unix_chkpwd
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
X-List-Received-Date: Mon, 22 Aug 2011 02:36:19 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/20/2011 09:05 AM, Khem Raj wrote:
> On 8/20/2011 12:58 AM, wenzong.fan@windriver.com wrote:
>> From: Wenzong Fan<wenzong.fan@windriver.com>
>>
>> [YOCTO #1252]
>>
>> While pam_unix.so required by an application on lsb image, it will
>> need to
>> call the unix_chkpwd to get userinfo from shadow file. This fix get a
>> normal
>> user could read shadow file via unix_chkpwd.
>>
>> Signed-off-by: Wenzong Fan<wenzong.fan@windriver.com>
>> ---
>> meta/recipes-extended/pam/libpam_1.1.4.bb | 8 +++++++-
>> 1 files changed, 7 insertions(+), 1 deletions(-)
>>
>> diff --git a/meta/recipes-extended/pam/libpam_1.1.4.bb
>> b/meta/recipes-extended/pam/libpam_1.1.4.bb
>> index ae20a97..ca54bd8 100644
>> --- a/meta/recipes-extended/pam/libpam_1.1.4.bb
>> +++ b/meta/recipes-extended/pam/libpam_1.1.4.bb
>> @@ -9,7 +9,7 @@ SECTION = "base"
>> LICENSE = "GPLv2+ | BSD"
>> LIC_FILES_CHKSUM = "file://COPYING;md5=ca0395de9a86191a078b8b79302e3083"
>>
>> -PR = "r1"
>> +PR = "r2"
>>
>> DEPENDS = "bison flex cracklib"
>> RDEPENDS_${PN}-runtime = "libpam pam-plugin-deny pam-plugin-permit
>> pam-plugin-warn pam-plugin-unix"
>> @@ -85,3 +85,9 @@ do_install() {
>> install -d ${D}${sysconfdir}/pam.d/
>> install -m 0644 ${WORKDIR}/pam.d/* ${D}${sysconfdir}/pam.d/
>> }
>> +
>> +pkg_postinst_pam-plugin-unix () {
>> + # below is necessary to allow unix_chkpwd get user info from shadow
>> file
>> + # on lsb images
>> + chmod 4755 /usr/sbin/unix_chkpwd
>
> may be its better to use corresponding metadata variables instead of
> hardcoding /usr/sbin here

With Khem's recommended tweak:

Acked-by: Scott Garman <scott.a.garman@intel.com>

-- 
Scott Garman
Embedded Linux Engineer - Yocto Project
Intel Open Source Technology Center


