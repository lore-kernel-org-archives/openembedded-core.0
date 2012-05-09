Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1SS8lL-0008IR-7z
	for openembedded-core@lists.openembedded.org;
	Wed, 09 May 2012 17:25:11 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q49FFHoH022353
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 9 May 2012 08:15:17 -0700 (PDT)
Received: from msp-dhcp19.wrs.com (172.25.34.19) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Wed, 9 May 2012 08:15:16 -0700
Message-ID: <4FAA8A03.50309@windriver.com>
Date: Wed, 9 May 2012 10:15:15 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6;
	rv:12.0) Gecko/20120428 Thunderbird/12.0.1
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1336547713.git.liezhi.yang@windriver.com>
	<03d9cdca29477f34348a0f97138504441c5804fa.1336547713.git.liezhi.yang@windriver.com>
	<23E51582-C3C4-4673-B646-F29E74FEB428@dominion.thruhere.net>
	<4FAA84B3.1080108@windriver.com>
	<6122E5DC-EFF1-4592-AB36-22E9D68DF2BF@dominion.thruhere.net>
In-Reply-To: <6122E5DC-EFF1-4592-AB36-22E9D68DF2BF@dominion.thruhere.net>
Subject: Re: [PATCH 2/2] rootfs_rpm.bbclass: don't remove rpmlib when INC_RPM_IMAGE_GEN=1
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
X-List-Received-Date: Wed, 09 May 2012 15:25:11 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 5/9/12 10:01 AM, Koen Kooi wrote:
>
> Op 9 mei 2012, om 16:52 heeft Mark Hatle het volgende geschreven:
>
>> On 5/9/12 3:50 AM, Koen Kooi wrote:
>>>
>>> Op 9 mei 2012, om 10:20 heeft Robert Yang het volgende geschreven:
>>>
>>>> Don't remove rpmlib when INC_RPM_IMAGE_GEN=1, otherwise the
>>>> list_installed_packages would get nothing in the second build.
>>>
>>> What happens when I do a build, enable INC_RPM_IMAGE_GEN and do another build?
>>
>> The intention is that only the packages that have been changed/upgraded will be installed.  Instead of the whole image being generated from scratch each time.
>
> That's what INC_RPM_IMAGE_GEN does, yes. What I'm asking is how this patch addresses the sequence I outlined above.

Explain what you mean by "build".

Using the following:

. ./oe-init-build-env build-test
<setup local.conf w/ rpm packaging and INC_RPM_IMAGE_GEN>
bitbake core-image-core
--- time passes, git pull pulls in changes ---
bitbake core-image-core

The second "build", only the changed packages will be added to the image.

You you are using different build directories, then it doesn't re-use anything. 
  The purpose of this is incremental software development within a single build 
directory.

--Mark

> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



