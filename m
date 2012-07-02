Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1Sljde-00047K-0X
	for openembedded-core@lists.openembedded.org;
	Mon, 02 Jul 2012 18:38:14 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q62GR7YF006990
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 2 Jul 2012 09:27:07 -0700 (PDT)
Received: from msp-dhcp21.wrs.com (172.25.34.21) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Mon, 2 Jul 2012 09:27:06 -0700
Message-ID: <4FF1CBE1.5080802@windriver.com>
Date: Mon, 2 Jul 2012 11:27:13 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:13.0) Gecko/20120614 Thunderbird/13.0.1
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1341032578.git.mark.hatle@windriver.com>
	<CAEsOVNdKPAY8yOdGUXo18Scn8qMrgckrfe_jJ7ojMxVSg0raBw@mail.gmail.com>
In-Reply-To: <CAEsOVNdKPAY8yOdGUXo18Scn8qMrgckrfe_jJ7ojMxVSg0raBw@mail.gmail.com>
Subject: Re: [PATCH 0/6 v2] Enable the ability to create an image matching SDK
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
X-List-Received-Date: Mon, 02 Jul 2012 16:38:14 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 7/2/12 10:20 AM, McClintock Matthew-B29882 wrote:
> Mark,
>
> By 'match the image' you mean the libraries in the toolchain tarball
> will contain matching versions that are on the root file system?


If you create an image that only has busybox, and glibc.. a matching SDK would 
only include busybox and glibc (development) components as well.

You won't get libstdc++, glib, libX11, or anything else that is not part of the 
image..

For my customers they create a base platform image.  This image defines all of 
the (external to them) software that will be running on their devices.  They 
then use that image to create an SDK to pass to their internal (and external) 
application developers.  So it's critical the SDK match the image they 
generated.  (And they, and I, don't see why in this case making an external SDK 
recipe makes sense.. the SDK should simply match the image...  Note, there is 
definitely a case where you want to build an application SDK that does not match 
the image...  Usually this is done when you only want app developers to use a 
limited set of APIs for their apps.)


So yes, the SDK will match the libraires selected for an image, and provide the 
-dev and -dbg versions of the components.  (-staticdev is not included...)

--Mark

> -M
>
> On Sat, Jun 30, 2012 at 12:18 AM, Mark Hatle <mark.hatle@windriver.com> wrote:
>> Only difference is patch 1/6, I accidently sent and older broken version of the
>> patch.  This is the correct version.
>>
>> ---
>>
>> After this series of patches, it is possible to generate an SDK that
>> matches the image.  The SDK and all related code is only activated if an image
>> recipe is built using the "populate_sdk" task, such as:
>>
>> bitbake core-image-sato -c populate_sdk
>>
>> Existing SDK images, such as meta-toolchain or meta-toolchain-gmae continue to
>> work without modifications.
>>
>> The following changes since commit 54429dfcca0e35a3aeaa78e509240b87d6a8f4ac:
>>
>>    mklibs-native: Upgrade to 0.1.34 (2012-06-29 13:21:19 +0100)
>>
>> are available in the git repository at:
>>    git://git.pokylinux.org/poky-contrib mhatle/sdk
>>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=mhatle/sdk
>>
>> Mark Hatle (6):
>>    Fix manual log file paths
>>    populate_sdk.bbclass: Split into two parts
>>    populate_sdk: Allow for attempt only packages in the SDK
>>    populate_sdk_base.bbclass: Change to using task specific depends
>>    populate_sdk: enable basic multilib support
>>    image.bbclass: Add support to build the SDK in parallel with the
>>      image
>>
>>   meta/classes/image.bbclass             |    7 ++-
>>   meta/classes/package_deb.bbclass       |    4 +-
>>   meta/classes/package_ipk.bbclass       |    2 +-
>>   meta/classes/package_rpm.bbclass       |   10 +-
>>   meta/classes/populate_sdk.bbclass      |   91 +---------------------
>>   meta/classes/populate_sdk_base.bbclass |  128 ++++++++++++++++++++++++++++++++
>>   meta/classes/populate_sdk_deb.bbclass  |    6 +-
>>   meta/classes/populate_sdk_ipk.bbclass  |    5 +-
>>   meta/classes/populate_sdk_rpm.bbclass  |    4 +-
>>   meta/classes/rootfs_deb.bbclass        |    2 +
>>   meta/classes/rootfs_ipk.bbclass        |    2 +
>>   meta/classes/toolchain-scripts.bbclass |   16 +++--
>>   12 files changed, 170 insertions(+), 107 deletions(-)
>>   create mode 100644 meta/classes/populate_sdk_base.bbclass
>>
>> --
>> 1.7.3.4
>>
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>




