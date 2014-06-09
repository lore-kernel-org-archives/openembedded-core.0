Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id CCE0160E24
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Jun 2014 17:03:05 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s59H30Od024584
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 9 Jun 2014 10:03:00 -0700 (PDT)
Received: from Marks-MacBook-Pro.local (172.25.36.228) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.169.1; Mon, 9 Jun 2014 10:03:00 -0700
Message-ID: <5395E8C2.6080808@windriver.com>
Date: Mon, 9 Jun 2014 12:02:58 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:24.0) Gecko/20100101 Thunderbird/24.5.0
MIME-Version: 1.0
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>, "OE Core
	(openembedded-core@lists.openembedded.org)"
	<openembedded-core@lists.openembedded.org>
References: <A612847CFE53224C91B23E3A5B48BAC7A7A21EFE0D@xmail3.se.axis.com>	<A612847CFE53224C91B23E3A5B48BAC7A7A2BE80C7@xmail3.se.axis.com>
	<5395C8F2.7040600@windriver.com>
	<A612847CFE53224C91B23E3A5B48BAC7A7A2BE817E@xmail3.se.axis.com>
In-Reply-To: <A612847CFE53224C91B23E3A5B48BAC7A7A2BE817E@xmail3.se.axis.com>
Subject: Re: Using users/groups from another recipe than the one creating them
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
X-List-Received-Date: Mon, 09 Jun 2014 17:03:08 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 6/9/14, 11:47 AM, Peter Kjellerstedt wrote:
>> -----Original Message-----
>> From: openembedded-core-bounces@lists.openembedded.org
>> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
>> Mark Hatle
>> Sent: den 9 juni 2014 16:47
>> To: Peter Kjellerstedt; OE Core (openembedded-
>> core@lists.openembedded.org)
>> Subject: Re: [OE-core] Using users/groups from another recipe than the
>> one creating them
>>
>> On 6/9/14, 8:39 AM, Peter Kjellerstedt wrote:
>>>> -----Original Message-----
>>>> From: openembedded-core-bounces@lists.openembedded.org
>>>> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf
>>>> Of Peter Kjellerstedt
>>>> Sent: den 23 maj 2014 12:38
>>>> To: OE Core (openembedded-core@lists.openembedded.org)
>>>> Subject: Re: [OE-core] Using users/groups from another recipe than
>>>> the one creating them
>>>>
>>>>> -----Original Message-----
>>>>> From: openembedded-core-bounces@lists.openembedded.org
>>>>> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf
>>>>> Of Peter Kjellerstedt
>>>>> Sent: den 19 maj 2014 10:15
>>>>> To: OE Core (openembedded-core@lists.openembedded.org)
>>>>> Subject: [OE-core] Using users/groups from another recipe than the
>>>>> one creating them
>>>>>
>>>>> Which assumption is correct: "a recipe A that depends on another
>>>>> recipe B can use users/groups that B creates" or "all recipes must
>>>>> create the users/groups they require themselves"?
>>>>>
>>>>> The problem for us is that we have a lot of recipes that create
>>>>> users and groups, and subsequently a number of other related
>>>>> recipes that need to use those users and groups.
>>>>>
>>>>> If the first assumption is correct then the useradd.bbclass needs
>>>>> to be corrected so that it adds a dependency from do_install to
>>>>> base-passwd:do_populate_sysroot and
>>>>> base-passwd:do_populate_sysroot_setscene, because if either of
>>>>> those tasks execute they will overwrite /etc/passwd and /etc/group,
>>>>> effectively removing any users/groups that were created earlier...
>>>>>
>>>>> On the other hand, if it is the second assumption that is correct,
>>>>> then there should be QA tests in place to make sure all recipes
>>>>> create the users/groups they use.
>>>>>
>>>>> //Peter
>>>>
>>>> *ping*
>>>>
>>>> Doesn't anyone know how users and groups are supposed to work?
>>>>
>>>> //Peter
>>>
>>> *ping again*
>>
>> I never saw the original emails, either of them.
>>
>>> Well, this is somewhat discouraging. Three weeks and not a single
>>> response. Are we really the only ones that care about users and
>>> groups and how they are created? Doesn't anyone know which of my
>>> two assumptions above are correct?
>>>
>>> Personally I would prefer that all recipes create the users and
>>> groups they require themselves as this keeps them more self
>>> contained. I have no idea how to write a QA test to verify this,
>>> but I assume it should be possible...
>>
>> The rule is:
>>
>> There is a limited number of base users and groups, if your package
>> uses a user/group in that base set nothing else is needed.
>>
>> If your package needs an additional user/group, then it must either:
>>
>> *) Add the user/group itself.  Multiple packages are allowed to add
>>     the same users/groups, with the understanding that the options
>>     -must- be identical!
>
> I have actually been toying with an extension to the
> useradd.bbclass that allows one to configure the user and group
> options in one configuration file, and then just state in the
> recipes which users are needed. That way there is no risk of using
> different options for the same user if it is created from different
> recipes. Haven't finished it though. One thing I have not solved is
> how to handle requiring the configuration file from all layers as
> they may all need to add users (or what to do if multiple layers
> define the same user differently...)

If you implement this, you should follow the example of the 
"useradd-staticids.bbclass".  This is something that a user can optionally add 
into their environment to better define how things are configured.

I still contend that these items belong in the recipes and that it's a recipe 
bug if they're not done properly.  We can help automate this, but I don't know 
if that is yet a reasonable general solution.

The staticids class collects together "USERADD_UID_TABLES" values, and then 
rewrites the USERADD_PARAMS/GROUPADD_PARAMS to match whatever the table(s) say. 
  This is the same mechanism that we use for the filesystem table to synchronize 
standard owners/groups/perms in various recipes.

I would still expect the recipe to say I need the following users/groups.. and 
then to pick up the data from the tables if necessary.

>> *) Must -require- (not recommend) a package that adds the group that
>>     they require.  It's a good idea in the recipe to comment that the
>>     'require' adds the user/group as well.
>>
>> This is pretty common where a single recipe provides multiple packages.
>> If a common package creates the user/group, then all of the other
>> packages [that need that user/group] should then require the common
>> package.
>
> Ok, then my first assumption was the correct one. In that case I
> will look into fixing the useradd.bbclass so that the missing
> dependency is added.

useradd isn't the right place for the dependency, it really is a recipe level 
dependency.

>> As far as the QA resources go.  There are actually two sides to
>> the QA. The first is in the do_install step, if the users/groups
>> are being used there -- and don't exist -- a failure should be
>> generated.  That exists just by the nature of the system build
>> processes.
>>
>> The second is that once a package has been generated (the package
>> directory that is), it should be verified that all files are owned
>> by in the base set of users/groups, the user/group has been added,
>> or a dependency on the package that added them exist.  This is
>> difficult to do though.  There is currently no tracking mechanism
>> in the system to say which recipes added which users/groups to the
>> system.  A mechanism similar to the sysroot file population would
>> be required to capture the user and group changes and by which
>> package(s). This of course would also have to work with the
>> sstate-cache mechanism.
>>
>> The first step in implementing this would be to capture the
>> user/group changes and record them in a database.  (again, I think
>> similar to the populate sysroot file).  Then during the QA process,
>> you can iterate over the files and find out where each user/group
>> in use comes from.  If the provider is not in the 'required' set of
>> packages generate a QA -warning- (since this is new and unproven
>> code).. We can upgrade it to an error once it's stable.
>
> Hmm, ok. This all sound like something we want. However, my Python
> skills are probably not up to the task, unfortunately.

You should look into how the populate_sysroot function writes out the list of 
files installed into the sysroot.. and see if you can do something similar for 
the packages.  It's python, but I don't think it's that heavy of a python code.

--Mark

>> --Mark
>>
>>> //Peter
>
> //Peter
>


