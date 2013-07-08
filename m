Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 6604661883
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Jul 2013 20:10:47 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r68KAkNB014728
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 8 Jul 2013 13:10:46 -0700 (PDT)
Received: from msp-dhcp27.wrs.com (172.25.34.27) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.342.3;
	Mon, 8 Jul 2013 13:10:45 -0700
Message-ID: <51DB1CC5.9070908@windriver.com>
Date: Mon, 8 Jul 2013 15:10:45 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:17.0) Gecko/20130620 Thunderbird/17.0.7
MIME-Version: 1.0
To: Martin Jansa <martin.jansa@gmail.com>
References: <cover.1373003615.git.Qi.Chen@windriver.com>
	<341a64b50c13dec0bf01feb5c74d5b32815a7191.1373003615.git.Qi.Chen@windriver.com>
	<20130705083905.GD3259@jama> <51DAF3BC.60107@windriver.com>
	<20130708172715.GO3288@jama> <51DAFE8C.8000506@windriver.com>
	<20130708193131.GP3288@jama>
In-Reply-To: <20130708193131.GP3288@jama>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] image.bbclass: add a method to add/delete/modify user/group settings
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
X-List-Received-Date: Mon, 08 Jul 2013 20:10:47 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 7/8/13 2:31 PM, Martin Jansa wrote:
> On Mon, Jul 08, 2013 at 01:01:48PM -0500, Mark Hatle wrote:
>> On 7/8/13 12:27 PM, Martin Jansa wrote:
>>> On Mon, Jul 08, 2013 at 12:15:40PM -0500, Mark Hatle wrote:
>>>> On 7/5/13 3:39 AM, Martin Jansa wrote:
>>>>> On Fri, Jul 05, 2013 at 02:07:28PM +0800, Qi.Chen@windriver.com wrote:
>>>>>> From: Chen Qi <Qi.Chen@windriver.com>
>>>>>>
>>>>>> We may want to add a user or group which does not logically belong to
>>>>>> any specific package. For example, we may want to add a user with the
>>>>>> name 'tester' to our image. Besides, we may want to delete or modify
>>>>>> user/group in our image.
>>>>>>
>>>>>> This patch adds a variable, USER_GROUP_SETTINGS, which is dedicated
>>>>>> to these tasks. The configuration format is detailed in the local.conf.
>>>>>> sample.extended file.
>>>>>>
>>>>>> This patch also adds a function, set_user_group, which happens at
>>>>>> the end of the ROOTFS_POSTPROCESS_COMMAND. It handles the settings
>>>>>> in the USER_GROUP_SETTINGS variable.
>>>>>
>>>>> Why not use extra package just with user?
>>>>>
>>>>> See "[PATCH v3 0/5] Allow xuser to shutdown (cover letter only)"
>>>>
>>>> The issue is that the users don't want extra (empty) packages to just add
>>>> standard users/groups.  What they want is a post image-generation
>>>> "configuration" mechanism.
>>>>
>>>> Adding users/groups is one of the basic items that they want/need.  This really
>>>> has to be considered to be an administrative activity vs a distribution
>>>> activity.  (I.e. difference between creating a package and performing some kind
>>>> of post-image action.)
>>>>
>>>> The other issue with a package based approach is it then mandates changes occur
>>>> by having to rebuild/reinstall packages.  This is onerous in my experience, for
>>>> something basic like this.  It's really outside of the package manager's control.
>>>
>>> We can have all users in one package
>>> base-users (like we have base-files)
>>>
>>> It can allow someone to just define DEFAULT_USERS = "a b c" in
>>> local.conf and let base-users recipe to create all 3 automatically.
>>>
>>> Post image-generation mechanism doesn't allow to add new required users
>>> in "upgrade" or installing packages from binary feed with all required
>>> users accounts.
>>>
>>
>> That is exactly it..  these are not users that will -ever- be upgraded or worked
>> on via packages.
>>
>> This is equivalent to saying "I'd like users bob, tracy and alice on this image
>> I'm generating."
>>
>> It's NOT saying, all systems generated with this package feed will include bob,
>> tracy and alice.
>
> IMAGE_INSTALL += "base-user-bob base-user-tracy base-user-alice"
>
>> If the user wants to add john, after the initial image is generated, they would
>> do so using the adduser functionality of the system (or modifying the
>> passwd/group files.)
>
> And what if john-the-ripper package in the feed needs john as system
> user and the same system user is also used by thc-hydra package?

These are not system users.. these are -actual- users, people who are going to 
log into this instance and do "something".

> Should both include addusers/addgroup postinsts (like connman,
> xserver-nodm-init do without latest patchset)?

Each package that requires a non-standard system user should add it themselves 
via the existing postinst scripts.

--Mark

>> The fundamental problem is that the package feeds and district from the image
>> itself.  The image is nothing more then an installer that happens to be running
>> on the build machine itself.  Things that are part of the distribution belong in
>> the feed, things that are instance/image specific belong as part of the
>> installation process.
>>
>> --Mark
>


