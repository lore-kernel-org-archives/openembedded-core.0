Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1SloTs-0006Ud-2J
	for openembedded-core@lists.openembedded.org;
	Mon, 02 Jul 2012 23:48:28 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q62LbPJS029443
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 2 Jul 2012 14:37:25 -0700 (PDT)
Received: from msp-dhcp21.wrs.com (172.25.34.21) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Mon, 2 Jul 2012 14:37:25 -0700
Message-ID: <4FF21494.2030105@windriver.com>
Date: Mon, 2 Jul 2012 16:37:24 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:13.0) Gecko/20120614 Thunderbird/13.0.1
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1341032578.git.mark.hatle@windriver.com>
	<28adf5fdb58c3409ec2dcc1a8dfffaaf2a8eab2b.1341032578.git.mark.hatle@windriver.com>
	<1341259953.2886.29.camel@x121e.pbcl.net>
	<4FF20578.9030109@windriver.com>
	<1341263124.2886.44.camel@x121e.pbcl.net>
In-Reply-To: <1341263124.2886.44.camel@x121e.pbcl.net>
Subject: Re: [PATCH 6/6] image.bbclass: Add support to build the SDK in parallel with the image
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
X-List-Received-Date: Mon, 02 Jul 2012 21:48:28 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 7/2/12 4:05 PM, Phil Blundell wrote:
> On Mon, 2012-07-02 at 15:32 -0500, Mark Hatle wrote:
>> On 7/2/12 3:12 PM, Phil Blundell wrote:
>>> On Sat, 2012-06-30 at 00:07 -0500, Mark Hatle wrote:
>>>> diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
>>>> index 4f50376..7e41982 100644
>>>> --- a/meta/classes/image.bbclass
>>>> +++ b/meta/classes/image.bbclass
>>>> @@ -3,6 +3,11 @@ inherit rootfs_${IMAGE_PKGTYPE}
>>>>    IMAGETEST ?= "dummy"
>>>>    inherit imagetest-${IMAGETEST}
>>>>
>>>> +inherit populate_sdk_base
>>>
>>> This seems to haul a vast amount of stuff into image.bbclass.  Is it
>>> really necessary to have all that in there by default?
>>
>> Yes, in order to build an SDK that matches an image, it is.
>>
>> We need to have all of the code that is needed for both IMAGE and SDK
>> generation.  The SDK code is only active if and only if you call the
>> populate_sdk task.
>
> Can the SDK bits not live in another class which is applied on top of
> the images via BBCLASSEXTEND or some such?  I don't entirely understand
> why this all needs to be in image.bbclass if, as you say, it's inactive
> by default.

In order to build an SDK that matches an images behavior, we need information 
that can only be supplied from an image recipe, and corresponding image.bbclass 
processing.  Once we have that information, then we can generate an SDK.

The SDK code needs to be included into this stream in order to get the 
information for all possible image types, otherwise we'd have to modify each 
image type that you might possibly want an SDK for.  I believe that is 
unreasonable, since if it works for one image type, why shouldn't it work for 
all of them.

The code is not enabled by default, i.e. in the main task order, specifically to 
preserve existing behavior for the majority of users who don't want a matching 
SDK each time they build an image.  (Building an SDK usually involves building 
somewhere around 800-1000 extra tasks, depending on configuration.)

The SDK code is only enabled when the bitbake -c populate_sdk <image recipe> is 
called.  This also avoids all of the standard tasks from the image recipe.

> The code itself looks harmless enough to a casual inspection, but the
> increased number of nested "inherits" does make it rather more difficult
> to understand what's going on, since you have to inspect all of the
> inherited files to understand whether or not they are doing anything.

The image class and populate_sdk_base class are designed to continue to be 
managed and handled separately from a development point of view.  The only 
interconnection is (in image.bbclass) the definiton of:

TOOLCHAIN_TARGET_TASK += "${PACKAGE_INSTALL}"
TOOLCHAIN_TARGET_TASK_ATTEMPTONLY += "${PACKAGE_INSTALL_ATTEMPTONLY} 
${PACKAGE_GROUP_dev-pkgs} ${PACKAGE_GROUP_dbg-pkgs}"

(note: the PACKAGE_GROUP_*, PACKAGE_INSTALL and PACKAGE_INSTALL_ATTEMPTONLY are 
the items that are only known by the image recipe/image.bbclass..)

If you are not using the SDK, the values get set and ignored.

> If we really are going to have this included in image.bbclass, though,
> then it might be worth trying to eliminate the duplicate definitions
> between image.bbclass and populate_sdk{_base}.bbclass.  I think PID and
> EXCLUDE_FROM_WORLD, at least, are defined in both places and I suspect
> there are probably some more.

If these duplications were removed, then the standalone SDKs such as 
meta-toolchain or meta-toolchain-gmae would fail.  By leaving them there, the 
behaviors are kept in sync, those values happen to be the same in both, and it 
allows the SDK to continue to be used separately as it has always been.

We could conceivable remove them from the image.bbclass, but if someone decides 
later to break apart this code -- then they'll have to re-add them to get the 
desired behavior.  I felt it was safer to leave the image and populate_sdk as 
complete as possible.

--Mark

> p.
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>




