Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1T9gDj-00086U-AC
	for openembedded-core@lists.openembedded.org;
	Thu, 06 Sep 2012 19:50:27 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q86Hc1n0006571
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 6 Sep 2012 10:38:01 -0700 (PDT)
Received: from msp-dhcp21.wrs.com (172.25.34.21) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.309.2;
	Thu, 6 Sep 2012 10:38:01 -0700
Message-ID: <5048DF79.1060305@windriver.com>
Date: Thu, 6 Sep 2012 12:38:01 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:15.0) Gecko/20120824 Thunderbird/15.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1346138100.git.liezhi.yang@windriver.com>
	<d44a05ea08917e27279740f258bdf28424a7e055.1346138100.git.liezhi.yang@windriver.com>
	<5048D4D3.3080009@windriver.com>
In-Reply-To: <5048D4D3.3080009@windriver.com>
Subject: Re: [PATCH 1/1] package_rpm.bbclass: fix the arch (replace "-" with "_")
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
X-List-Received-Date: Thu, 06 Sep 2012 17:50:27 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 9/6/12 11:52 AM, Mark Hatle wrote:
> I've looked at the patch and it looks find to me.
>
> Acked-by: Mark Hatle <mark.hatle@windriver.com>
>
>
> One note, however..  Whatever arch fields we use need to also match the fields
> that get encoded into Zypper and the sat-solver stuff..  So there may be a
> second chunk of code that needs to be updated to match.

It's the do_archgen functions in both sat-solver and libzypp recipes.  They need 
to match the arch namings.

--Mark

> --Mark
>
> On 8/28/12 10:45 AM, Robert Yang wrote:
>> rpm can't use the "-" as the arch, which causes problem, e.g., when
>> MACHINE = "beagleboard":
>>
>> * The arch should be armv7a-vfp-neon, but rpm only takes the armv7a,
>>     this is incorrect since it is mixed with real arch armv7a.
>>
>> * The nativesdk's arch should be i686-nativesdk (or x86_64-nativesdk),
>>     but rpm only takes the i686 (or x86_64), this in incorrect since it is
>>     mixed with the arch i686 (or x86_64).
>>
>> Replace "-" with "_" when rpm package and the rootfs generation would
>> fix the problem, I think this is fine since it doesn't change the tune's
>> arch, the package manager doesn't care about the arch's name, but it
>> needs a unify arch system to avoid confusing. This is similar to what we
>> have done on the deb which fixed the arch i486, i586 and so on to i386.
>>
>> [YOCTO #2328]
>>
>> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>> ---
>>    meta/classes/package_rpm.bbclass | 8 ++++----
>>    1 file changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
>> index 9abad5e..87dd367 100644
>> --- a/meta/classes/package_rpm.bbclass
>> +++ b/meta/classes/package_rpm.bbclass
>> @@ -27,12 +27,12 @@ package_update_index_rpm () {
>>    	fi
>>
>>    	# Update target packages
>> -	base_archs="${PACKAGE_ARCHS}"
>> -	ml_archs="${MULTILIB_PACKAGE_ARCHS}"
>> +	base_archs="`echo ${PACKAGE_ARCHS} | sed 's/-/_/g'`"
>> +	ml_archs="`echo ${MULTILIB_PACKAGE_ARCHS} | sed 's/-/_/g'`"
>>    	package_update_index_rpm_common "${RPMCONF_TARGET_BASE}" base_archs ml_archs
>>
>>    	# Update SDK packages
>> -	base_archs="${SDK_PACKAGE_ARCHS}"
>> +	base_archs="`echo ${SDK_PACKAGE_ARCHS} | sed 's/-/_/g'`"
>>    	package_update_index_rpm_common "${RPMCONF_HOST_BASE}" base_archs
>>    }
>>
>> @@ -1118,7 +1118,7 @@ python do_package_rpm () {
>>        rpmbuild = d.getVar('RPMBUILD', True)
>>        targetsys = d.getVar('TARGET_SYS', True)
>>        targetvendor = d.getVar('TARGET_VENDOR', True)
>> -    package_arch = d.getVar('PACKAGE_ARCH', True) or ""
>> +    package_arch = (d.getVar('PACKAGE_ARCH', True) or "").replace("-", "_")
>>        if package_arch not in "all any noarch".split():
>>            ml_prefix = (d.getVar('MLPREFIX', True) or "").replace("-", "_")
>>            d.setVar('PACKAGE_ARCH_EXTEND', ml_prefix + package_arch)
>>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>



