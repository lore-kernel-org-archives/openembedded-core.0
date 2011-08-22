Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Wenzong.Fan@windriver.com>) id 1QvKfZ-00085Z-LB
	for openembedded-core@lists.openembedded.org;
	Mon, 22 Aug 2011 04:55:22 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p7M2oaoe016665
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 21 Aug 2011 19:50:36 -0700 (PDT)
Received: from [128.224.162.169] (128.224.162.169) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Sun, 21 Aug 2011 19:50:36 -0700
Message-ID: <4E51C400.2010209@windriver.com>
Date: Mon, 22 Aug 2011 10:50:40 +0800
From: wenzong fan <wenzong.fan@windriver.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.11) Gecko/20100713 Thunderbird/3.0.6
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1313826618.git.wenzong.fan@windriver.com>	<fc4770ac723a1fa69bc53a8a887b5892cfb99968.1313826618.git.wenzong.fan@windriver.com>	<4E4FDB65.1010306@gmail.com>
	<4E51BF42.307@intel.com>
In-Reply-To: <4E51BF42.307@intel.com>
Cc: Scott Garman <scott.a.garman@intel.com>
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
X-List-Received-Date: Mon, 22 Aug 2011 02:55:22 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 08/22/2011 10:30 AM, Scott Garman wrote:
> On 08/20/2011 09:05 AM, Khem Raj wrote:
>> On 8/20/2011 12:58 AM, wenzong.fan@windriver.com wrote:
>>> From: Wenzong Fan<wenzong.fan@windriver.com>
>>>
>>> [YOCTO #1252]
>>>
>>> While pam_unix.so required by an application on lsb image, it will
>>> need to
>>> call the unix_chkpwd to get userinfo from shadow file. This fix get a
>>> normal
>>> user could read shadow file via unix_chkpwd.
>>>
>>> Signed-off-by: Wenzong Fan<wenzong.fan@windriver.com>
>>> ---
>>> meta/recipes-extended/pam/libpam_1.1.4.bb | 8 +++++++-
>>> 1 files changed, 7 insertions(+), 1 deletions(-)
>>>
>>> diff --git a/meta/recipes-extended/pam/libpam_1.1.4.bb
>>> b/meta/recipes-extended/pam/libpam_1.1.4.bb
>>> index ae20a97..ca54bd8 100644
>>> --- a/meta/recipes-extended/pam/libpam_1.1.4.bb
>>> +++ b/meta/recipes-extended/pam/libpam_1.1.4.bb
>>> @@ -9,7 +9,7 @@ SECTION = "base"
>>> LICENSE = "GPLv2+ | BSD"
>>> LIC_FILES_CHKSUM = 
>>> "file://COPYING;md5=ca0395de9a86191a078b8b79302e3083"
>>>
>>> -PR = "r1"
>>> +PR = "r2"
>>>
>>> DEPENDS = "bison flex cracklib"
>>> RDEPENDS_${PN}-runtime = "libpam pam-plugin-deny pam-plugin-permit
>>> pam-plugin-warn pam-plugin-unix"
>>> @@ -85,3 +85,9 @@ do_install() {
>>> install -d ${D}${sysconfdir}/pam.d/
>>> install -m 0644 ${WORKDIR}/pam.d/* ${D}${sysconfdir}/pam.d/
>>> }
>>> +
>>> +pkg_postinst_pam-plugin-unix () {
>>> + # below is necessary to allow unix_chkpwd get user info from shadow
>>> file
>>> + # on lsb images
>>> + chmod 4755 /usr/sbin/unix_chkpwd
>>
>> may be its better to use corresponding metadata variables instead of
>> hardcoding /usr/sbin here
>
> With Khem's recommended tweak:

Good point, patch v2 will be sent with this updates.

Thanks
Wenzong
>
> Acked-by: Scott Garman <scott.a.garman@intel.com>
>



