Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id D0720731D5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 May 2016 15:21:21 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u4RFLB93008890
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 27 May 2016 08:21:12 -0700 (PDT)
Received: from soho-mhatle-m.local (172.25.36.229) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Fri, 27 May 2016 08:21:11 -0700
To: =?UTF-8?Q?Andr=c3=a9_Draszik?= <git@andred.net>, Ross Burton
	<ross.burton@intel.com>, <openembedded-core@lists.openembedded.org>
References: <1462534000-18539-1-git-send-email-ross.burton@intel.com>
	<1464346463.28160.45.camel@andred.net>
	<a8f703f6-4b7b-d7f0-722f-df7caee70291@windriver.com>
	<1464360133.3815.7.camel@andred.net>
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <351f6c15-c64d-106f-2d73-6c27500d5894@windriver.com>
Date: Fri, 27 May 2016 10:21:10 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:45.0)
	Gecko/20100101 Thunderbird/45.1.0
MIME-Version: 1.0
In-Reply-To: <1464360133.3815.7.camel@andred.net>
Subject: Re: [PATCH] bitbake.conf: add default for IMAGE_FSTYPES_DEBUGFS
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 27 May 2016 15:21:22 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On 5/27/16 9:42 AM, André Draszik wrote:
> On Fr, 2016-05-27 at 09:21 -0500, Mark Hatle wrote:
>> On 5/27/16 5:54 AM, André Draszik wrote:
>>> This doesn't work for me (at least on krogoth):
>>>
>>>     ERROR: poky/meta/recipes-core/images/build-appliance-
>>> image_14.0.0.bb: No IMAGE_CMD defined for IMAGE_FSTYPES entry
>>> 'debugfs_vmdk' - possibly invalid type name or missing support class
>>>     ERROR: Failed to parse recipe: poky/meta/recipes-core/images/build-
>>> appliance-image_14.0.0.bb
>>>
>>> I *instead* am using the attached patch successfully.
>>>
>>> Is anybody else facing the same issue?
>>
>> Ross's patch should have fixed this.  It ensures that
>> IMAGE_FSTYPES_DEBUGFS is
>> always set to 'something'.
> 
> Yes, and now bitbake is looking for an IMAGE_CMD for debugfs_vmdk according
> to the error message. Note that I didn't specify vmdk anywhere, my
> IMAGE_FSTYPES is set to .tar.gz only.
> 
>> You should check if the patch has been applied to the "krogoth" branch.
> 
> I did apply it locally. For me, it only works if i revert Ross' patch and
> apply my patch instead.
> 

Use bitbake -e <image>.  View the IMAGE_FSTYPES and IMAGE_FSTYPES_DEBUGFS.  Do
you see vmdk in the former?  If so, look at the comments above it and it shoudl
show you where it came from.

My guess is you have an image or BSP that is hard coding a specific 'vmdk'.

I agree there is a problem here, some filesystem types do not make sense for
debugfs type.  I'm not sure how to necessarily reconcile this behavior, but vmdk
doesn't seem reasonable to me here..

But first figure out where it's coming from.

Setting IMAGE_FSTYPES_DEBUGFS = "tar.gz" in your local.conf should be enough to
set the value and avoid the behavior.  If it's not, again look at the bitbake -e
output and see what it's saying it's doing.

--Mark

> Cheers,
> André
> 


