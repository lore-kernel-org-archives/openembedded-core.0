Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 8919F731C2
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Jan 2016 22:56:22 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u04MuMLV014044
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 4 Jan 2016 14:56:22 -0800 (PST)
Received: from Marks-MacBook-Pro.local (172.25.36.231) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.248.2; Mon, 4 Jan 2016 14:56:21 -0800
To: <openembedded-core@lists.openembedded.org>
References: <cover.1451912446.git.ian.ray@ge.com>
	<4e736dcbaf5c32f9d7728990ad4ac0ca975dfd6d.1451912446.git.ian.ray@ge.com>
	<568A99CD.9000800@universe-factory.net>
	<568A9E97.2050909@windriver.com>
	<568AF189.5010801@universe-factory.net>
From: Mark Hatle <mark.hatle@windriver.com>
X-Enigmail-Draft-Status: N1110
Organization: Wind River Systems
Message-ID: <568AF894.1010405@windriver.com>
Date: Mon, 4 Jan 2016 16:56:20 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:38.0)
	Gecko/20100101 Thunderbird/38.5.0
MIME-Version: 1.0
In-Reply-To: <568AF189.5010801@universe-factory.net>
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
X-List-Received-Date: Mon, 04 Jan 2016 22:56:23 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 8bit

On 1/4/16 4:26 PM, Matthias Schiffer wrote:
> On 01/04/2016 05:32 PM, Mark Hatle wrote:
>> On 1/4/16 10:11 AM, Matthias Schiffer wrote:
>>> On 01/04/2016 02:14 PM, Ian Ray wrote:
>>>> The recipe uses hard-coded paths (specifically /lib) in do_install
>>>> and in FILES, however on a merged /usr system this directory might
>>>> not exist. Prefer base_libdir.
>>>>
>>>> Signed-off-by: Ian Ray <ian.ray@ge.com>
>>>> ---
>>>
>>> This should use nonarch_base_libdir, base_libdir defaults to /lib64 on
>>> ppc64, which is not where the firmware is expected.
>>>
>>
>> At a minimum, I would agree nonarch_base_libdir, however..
>>
>> I believe that the kernel loader/modules/tools themselves actually have '/lib'
>> hard coded into them.  This is the reason why /lib/firmware was used and not one
>> of the variables.
>>
>> This is one of the cases were /lib is actually correct, since that is what the
>> system is expecting.  We can make some kind of accommodation for systems where
>> /lib -> /usr/lib... but that should be done inside of the filesystem setup
>> processing and not the package itself.  (I'm referring to the
>> 'meta/files/fs-perms.txt' file.
>>
>> --Mark
>>
> 
> There seem to be some intresting ideas going around about what can or
> should be done via fs-perms.txt... AFAICT, fs-perms.txt can't move
> around files, so moving files form /lib to /usr/lib must be done in the
> package recipes themselves. (In my opinion, fs-perms.txt is a bad hack
> for broken recipes that shouldn't exist anyways, but that's another
> discussion)

Since I wrote fs-perms.txt, I'll explain the purpose.  Individual packages don't
know if something is a directory, symbolic link, or what owner/group/permissions
a system level directory should be set to.

The entire purpose of it is to declare a common set of -system- directories.
(Packages/layers can amend and override this as necessary to add their own
system directories.)

FYI System directories are things like /usr/bin.  Having every package in the
system need to define /usr/bin as a directory with an owner/group of root:root
and permission of 0755 is a REALLY bad practice.. but putting this knowledge
into a single file that synchronizes everything is very practical.

When the system level directories are mapped to symlinks.. the case where
everyone is trying to folks /usr -> / or /bin -> /usr/bin.. then it can
AUTOMATICALLY map and move the files in these places..

> I think if a distro config changes any of the base paths
> ({nonarch_,}base_libdir, base_{,s}bindir), *all* packages should respect
> this. It's the distro's reponsiblity to create symlinks so everything is
> found again at the expected paths (other examples for such hardcoded
> paths: /bin/sh; the dynamic linker). See also my patchset I submitted to
> this mailing list, which introduces a distro feature to have such
> symlinks created by base-files.

When this was written it was heavily argued against this knowledge being in
base-files or base-dirs (suggested at the time) packages.

Defining a base setup, and then using a synchronization pass using the
fs-perms.txt was the way to go.

Note, fs-perms process is absolutely supposed to move files around -if- a
symlink is generated.. i.e.:

/lib -> /usr/lib

if you write to /lib/firmware, the code is supposed to see the directory of
'/lib', create a new /usr/lib (set perms properly) and move the contents if /lib
to /usr/lib, then replace the directory with a symbolic link.

If it's NOT doing that, lets fix it.

--Mark

> Matthias
> 
> 
> 


