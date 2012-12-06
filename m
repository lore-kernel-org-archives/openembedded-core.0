Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1TgfKe-0006AN-Ev
	for openembedded-core@lists.openembedded.org;
	Thu, 06 Dec 2012 18:33:58 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id qB6HJSSq012858
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 6 Dec 2012 09:19:28 -0800 (PST)
Received: from msp-dhcp50.wrs.com (172.25.34.50) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.318.4;
	Thu, 6 Dec 2012 09:19:28 -0800
Message-ID: <50C0D3A4.6010108@windriver.com>
Date: Thu, 6 Dec 2012 11:19:32 -0600
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:16.0) Gecko/20121026 Thunderbird/16.0.2
MIME-Version: 1.0
To: Paul Eggleton <paul.eggleton@linux.intel.com>
References: <cover.1354650148.git.mark.hatle@windriver.com>
	<04747ce39a3fbbd538556c67247452b931a3ccc5.1354650148.git.mark.hatle@windriver.com>
	<1354807886.12928.9.camel@ted> <3896317.iJW1Gi8Xv1@helios>
In-Reply-To: <3896317.iJW1Gi8Xv1@helios>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/6] classes/*_rpm: integrate Smart into RPM filesystem construction
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
X-List-Received-Date: Thu, 06 Dec 2012 17:33:58 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 12/6/12 10:13 AM, Paul Eggleton wrote:
> On Thursday 06 December 2012 15:31:26 Richard Purdie wrote:
>> On Tue, 2012-12-04 at 13:49 -0600, Mark Hatle wrote:
>>> From: Paul Eggleton <paul.eggleton@linux.intel.com>
>>>
>>> Use Smart to construct the root filesystem for images and the contents
>>> of SDKs rather than the custom scripts around rpm we had previously.
>>> This ensures the result when producing an updated image will be the
>>> same as upgrading to the same package versions from an older image on
>>> the target, as well as allowing us to remove a substantial amount of
>>> code making the rpm classes much easier to follow.
>>>
>>> Some bugfixes from Bogdan Marinescu <bogdan.marinescu@intel.com>.
>>> SDK implementation and testing as well as a number of bugfixes from
>>> Mark Hatle <mark.hatle@windriver.com>.
>>>
>>> Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
>>> Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
>>> ---
>>>
>>>   meta/classes/package_rpm.bbclass      |  533
>>>   ++++++--------------------------- meta/classes/populate_sdk_rpm.bbclass
>>>   |   48 +---
>>>   meta/classes/rootfs_rpm.bbclass       |   31 +-
>>>   3 files changed, 117 insertions(+), 495 deletions(-)
>>>
>>> diff --git a/meta/classes/package_rpm.bbclass
>>> b/meta/classes/package_rpm.bbclass index 200a941..aa5b156 100644
>>> --- a/meta/classes/package_rpm.bbclass
>>> +++ b/meta/classes/package_rpm.bbclass
>>> @@ -8,6 +8,8 @@ RPMBUILD="rpmbuild"
>>>
>>>   PKGWRITEDIRRPM = "${WORKDIR}/deploy-rpms"
>>>   PKGWRITEDIRSRPM = "${DEPLOY_DIR}/sources/deploy-srpm"
>>>
>>> +EXTRANATIVEPATH += "python-native"
>>> +
>>
>> Er, no!
>>
>> Why do we need to do this? We now need python-native at package
>> generation time? Why?
>
> Sorry, I meant to come back to this before submitting; the reason I added it
> was so that smart can find its python modules that get installed into the
> native sysroot (which I was surprised to find that the setup did not allow it
> to do out of the box, frankly). I'm sure there is a much better way to handle
> this though - we only actually need the path to be accessible within
> do_rootfs.

This is used by smart which is in the function package_install_internal_rpm, 
which is used by populate_sdk_rpm and rootfs_rpm_do_rootfs.

This could be moved into the populate_sdk_rpm and rootfs_rpm classes, or we need 
an easy way to simply add this to the path in the functions that call python-native.

--Mark

> Cheers,
> Paul
>



