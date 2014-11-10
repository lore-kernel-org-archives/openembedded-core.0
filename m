Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id AD82C65C91
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Nov 2014 02:02:57 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id sAA22scT013283
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 9 Nov 2014 18:02:54 -0800 (PST)
Received: from [128.224.162.194] (128.224.162.194) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.174.1;
	Sun, 9 Nov 2014 18:02:54 -0800
Message-ID: <54601CC7.1060000@windriver.com>
Date: Mon, 10 Nov 2014 10:02:47 +0800
From: Hongxu Jia <hongxu.jia@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.2.0
MIME-Version: 1.0
To: Koen Kooi <koen@dominion.thruhere.net>, Martin Jansa
	<martin.jansa@gmail.com>
References: <cover.1415346812.git.hongxu.jia@windriver.com>
	<16384282a6c5f4878b1c377bbe38cfae1d311d0b.1415346812.git.hongxu.jia@windriver.com>
	<20141107143813.GF2444@jama>
	<01AE3AA2-1B18-4047-A760-E137E0A245D3@dominion.thruhere.net>
In-Reply-To: <01AE3AA2-1B18-4047-A760-E137E0A245D3@dominion.thruhere.net>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/4] avahi.inc: use avahi-daemon as avahi's provider
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
X-List-Received-Date: Mon, 10 Nov 2014 02:02:58 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 11/09/2014 02:53 AM, Koen Kooi wrote:
>> Op 7 nov. 2014, om 15:38 heeft Martin Jansa <martin.jansa@gmail.com> het volgende geschreven:
>>
>> On Fri, Nov 07, 2014 at 03:57:01PM +0800, Hongxu Jia wrote:
>>> The package avahi does not exist, so we use avahi-daemon as the provider.
>>> It avoids the do_rootfs failure while IMAGE_INSTALL += "avahi"
>> Why don't you fix your IMAGE_INSTALL instead?
> I agree with Martin, this is a non-problem, please fix your IMAGE_INSTALL.

I am afraid it is not the issue of IMAGE_INSTALL

As doc said:
http://www.yoctoproject.org/docs/1.5/ref-manual/ref-manual.html#var-IMAGE_INSTALL
Variable IMAGE_INSTALL is used to specify the packages to install into 
an image.

While adding some packages to image ,the rpm based do_rootfs
failed with '*** not found in the base feeds'

The failure was caused by two kinds of situations:
1. Package does not exist (such as python3), but provided
    by other package (such as python-core), the rpm based
    do_rootfs could not search its provider. And the deb/
    ipk based do_rootfs worked well, it is a defect, and
    I have fixed it (patch sent to community, YOCTO 6918);

2. Package does not exist, and no other package provides it,
    the package installation will fail in any type do_rootfs. We
    met this issue when we set IMAGE_INSTALL = "recipe_name",
    but we don't have the package with that name.

I think what I do is to fix the situation 2.

Further more, we should add checking at the package generating
time, if the package *with recipe name* was empty and not created,
trigger a warn and according the warn, we could fix the issue recipes.

We already have that checking at the package generating time,
but it a note, not warn. I suggest we should use warn instead.

//Hongxu


