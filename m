Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id A1F1A60667
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Jan 2016 14:03:00 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u05E2ueW029415
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 5 Jan 2016 06:02:57 -0800 (PST)
Received: from Marks-MacBook-Pro.local (147.11.119.194) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.248.2; Tue, 5 Jan 2016 06:02:53 -0800
To: Matthias Schiffer <mschiffer@universe-factory.net>
References: <cover.1451912446.git.ian.ray@ge.com>
	<4e736dcbaf5c32f9d7728990ad4ac0ca975dfd6d.1451912446.git.ian.ray@ge.com>
	<568A99CD.9000800@universe-factory.net>
	<568A9E97.2050909@windriver.com>
	<568AF189.5010801@universe-factory.net>
	<568AF894.1010405@windriver.com>
	<568B06D3.7030205@universe-factory.net>
	<568B0E13.6090108@windriver.com>
	<568B1BB5.7060303@universe-factory.net>
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <568BCD2F.6030700@windriver.com>
Date: Tue, 5 Jan 2016 08:03:27 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:38.0)
	Gecko/20100101 Thunderbird/38.5.0
MIME-Version: 1.0
In-Reply-To: <568B1BB5.7060303@universe-factory.net>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] linux-firmware: remove hard-coded paths
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
X-List-Received-Date: Tue, 05 Jan 2016 14:03:02 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit

On 1/4/16 7:26 PM, Matthias Schiffer wrote:
> On 01/05/2016 01:28 AM, Mark Hatle wrote:
>> On 1/4/16 5:57 PM, Matthias Schiffer wrote:
>>> On 01/04/2016 11:56 PM, Mark Hatle wrote:
>>>> On 1/4/16 4:26 PM, Matthias Schiffer wrote:
>>>>> On 01/04/2016 05:32 PM, Mark Hatle wrote:
>>>>>> On 1/4/16 10:11 AM, Matthias Schiffer wrote:
>>>>>>> On 01/04/2016 02:14 PM, Ian Ray wrote:
>>>>>>>> The recipe uses hard-coded paths (specifically /lib) in do_install
>>>>>>>> and in FILES, however on a merged /usr system this directory might
>>>>>>>> not exist. Prefer base_libdir.
>>>>>>>>
>>>>>>>> Signed-off-by: Ian Ray <ian.ray@ge.com>
>>>>>>>> ---
>>>>>>>
>>>>>>> This should use nonarch_base_libdir, base_libdir defaults to /lib64 on
>>>>>>> ppc64, which is not where the firmware is expected.
>>>>>>>
>>>>>>
>>>>>> At a minimum, I would agree nonarch_base_libdir, however..
>>>>>>
>>>>>> I believe that the kernel loader/modules/tools themselves actually have '/lib'
>>>>>> hard coded into them.  This is the reason why /lib/firmware was used and not one
>>>>>> of the variables.
>>>>>>
>>>>>> This is one of the cases were /lib is actually correct, since that is what the
>>>>>> system is expecting.  We can make some kind of accommodation for systems where
>>>>>> /lib -> /usr/lib... but that should be done inside of the filesystem setup
>>>>>> processing and not the package itself.  (I'm referring to the
>>>>>> 'meta/files/fs-perms.txt' file.
>>>>>>
>>>>>> --Mark
>>>>>>
>>>>>
>>>>> There seem to be some intresting ideas going around about what can or
>>>>> should be done via fs-perms.txt... AFAICT, fs-perms.txt can't move
>>>>> around files, so moving files form /lib to /usr/lib must be done in the
>>>>> package recipes themselves. (In my opinion, fs-perms.txt is a bad hack
>>>>> for broken recipes that shouldn't exist anyways, but that's another
>>>>> discussion)
>>>>
>>>> Since I wrote fs-perms.txt, I'll explain the purpose.  Individual packages don't
>>>> know if something is a directory, symbolic link, or what owner/group/permissions
>>>> a system level directory should be set to.
>>>>
>>>> The entire purpose of it is to declare a common set of -system- directories.
>>>> (Packages/layers can amend and override this as necessary to add their own
>>>> system directories.)
>>>>
>>>> FYI System directories are things like /usr/bin.  Having every package in the
>>>> system need to define /usr/bin as a directory with an owner/group of root:root
>>>> and permission of 0755 is a REALLY bad practice.. but putting this knowledge
>>>> into a single file that synchronizes everything is very practical.
>>>>
>>>> When the system level directories are mapped to symlinks.. the case where
>>>> everyone is trying to folks /usr -> / or /bin -> /usr/bin.. then it can
>>>> AUTOMATICALLY map and move the files in these places..
>>>
>>> Thanks for the explanation, I asked a similar question a few weeks ago
>>> and didn't get a satisfactory answer about what fs-perms can do. I'll
>>> rethink my approach for the merged-usr patchset.
>>
>> (I've been out since near the beginning of December, but I'm back now..)
>>
>>> So the remaining issue is how to conditionalize this. I'd like to find a
>>> solution which doesn't require distros to define their own fs-perms when
>>> they just want to use a merged /usr dir.
>>
>> You conditionalize it by providing different default fs-perms files -- OR since
>> more then one file can be loaded -- additional fs-perms with the permutations
>> you desire.
>>
>> I could easily see having an files/fs-perms-usr-only.txt and an
>> files/fs-perms-no-usr.txt
>>
>> Where the first would be something like:
>>
>> # Define symlinks from base directories to their prefix versions
>> /bin	link ${bindir}
>> /sbin	link ${sbindir}
>> ...
>>
>> fs-perms-no-user would be:
>>
>> # Define that $prefix as simply pointing back to root for compatibility
>> /usr	link /
>>
>>
>> Then in your distro.conf file:
>>
>> FILESYSTEM_PERMS_TABLES = "files/fs-perms.txt"
>> FILESYSTEM_PERMS_TABLES_append_usronly = " files/fs-perms-usr-only.txt"
>> FILESYSTEM_PERMS_TABLES_append_nousr = " files/fs-perms-no-user.txt"
>>
>>
>> The above will cause packages to produce the symlinks ONLY if the package itself
>> creates a matching directory.  If the package is moving all of it's files to the
>> new configured location (from the distro.conf file) then no link is present.
>>
>> Assuming you want the links, I would add some kind of a change or configuration
>> to the base-files to do this.
>>
>> (I did argue in the past, unsuccessfully, that base-files or something it calls
>> should process the fs-perms files and simply generate a base configuration based
>> on this setup.  Ensuring symlinks and final directories were always created..
>> but that was rejected at the time..)
> 
> I see. Do you think it would make sense to provide a fs-perms snippet in
> oe-core for the Fedora-style merged-usr setup?

This has always been a question, and I leave the answer more up to the oe-core
community as a whole.

Right now oe-core has a basic distribution configuration, and it's expected that
developers will override this configuration with their own requirements.  (I.e.
the Yocto Project does this by providing the poky configuration.)

If oe-core provides multiple configurations, then we'll need a test plan and
resources to test them (not necessarily a bad thing, but there are ramifications
outside of the code base when making these kinds of changes.)

The immediate alternative is create a distribution layer that implements this
work.. it can be used to show everything is functional or highlight areas where
there are bugs in oe-core so they can be fixed.  (Supporting this workflow has
always been intended, so I'm fully behind finding and fixing bugs with this kind
of filesystem merge.)

>>
>>>>
>>>>> I think if a distro config changes any of the base paths
>>>>> ({nonarch_,}base_libdir, base_{,s}bindir), *all* packages should respect
>>>>> this. It's the distro's reponsiblity to create symlinks so everything is
>>>>> found again at the expected paths (other examples for such hardcoded
>>>>> paths: /bin/sh; the dynamic linker). See also my patchset I submitted to
>>>>> this mailing list, which introduces a distro feature to have such
>>>>> symlinks created by base-files.
>>>>
>>>> When this was written it was heavily argued against this knowledge being in
>>>> base-files or base-dirs (suggested at the time) packages.
>>>
>>> Is that discussion archived somewhere? I'm interested in the
>>> argumentation. Do any non-OE distros have a similar feature?
>>
>> This would have been discussed back in the original oe-core days.  Likely around
>> 2010 on the oe-core list....
> 
> Okay, I've found at least some fragments of the discussion.
> 
>>
>>>>
>>>> Defining a base setup, and then using a synchronization pass using the
>>>> fs-perms.txt was the way to go.
>>>>
>>>> Note, fs-perms process is absolutely supposed to move files around -if- a
>>>> symlink is generated.. i.e.:
>>>>
>>>> /lib -> /usr/lib
>>>>
>>>> if you write to /lib/firmware, the code is supposed to see the directory of
>>>> '/lib', create a new /usr/lib (set perms properly) and move the contents if /lib
>>>> to /usr/lib, then replace the directory with a symbolic link.
>>>>
>>>> If it's NOT doing that, lets fix it.
>>>
>>> I didn't try yet as I didn't now that it is supposed to to that.
>>
>> This is a good example where the upstream software is always going to use
>> '/lib', but you want it to go somewhere else.  Without this fs-perms mechanism,
>> you would need to patch this package and potentially others.  But by using
>> fs-perms, they can continue to rely on their special knowledge of '/lib', and
>> the system will fix it up before packaging to where the distribution actually
>> wants the files.
>>
> 
> I guess I'm fine with fs-perms.txt fixing permissions and owners, but
> moving around files goes a bit too far in my opinion. Doing so will
> potentially break relative symlinks and other relative paths used by
> packages. I'd have implemented the "link" feature as a QA-only thing:
> make the build fail if there are any files where a symlink is supposed
> to go, but don't try to fix it up.
> 
> Another (more easily fixable) issue is that the automagic renaming
> doesn't work if the target dir already exists (if I understand the code
> correctly). So fixing up a package containing both files in /bin and
> /usr/bin, where /bin is supposed to link to /usr/bin, will fail.

I would consider this a bug we should fix in the code.  The only failure should
be if moving the contents results in two non-identical files clashing.

--Mark

> Matthias
> 
> 


