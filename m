Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 13C07600AC
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jan 2014 19:58:22 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s0DJwK8X004420
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 13 Jan 2014 11:58:20 -0800 (PST)
Received: from Marks-MacBook-Pro.local (128.224.19.223) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.347.0; Mon, 13 Jan 2014 11:58:20 -0800
Message-ID: <52D4455D.5020108@windriver.com>
Date: Mon, 13 Jan 2014 13:58:21 -0600
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: Martin Jansa <martin.jansa@gmail.com>
References: <cover.1386700055.git.mark.hatle@windriver.com>
	<52CEFD48.5070901@windriver.com> <20140109231930.GJ3709@jama>
In-Reply-To: <20140109231930.GJ3709@jama>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [RFC PATCH 0/2] RFC: Implement deterministic uid/gid
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
X-List-Received-Date: Mon, 13 Jan 2014 19:58:22 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 1/9/14, 5:19 PM, Martin Jansa wrote:
> On Thu, Jan 09, 2014 at 01:49:28PM -0600, Mark Hatle wrote:
>> I have updated the git://git.yoctoproject.org/poky-contrib mhatle/uidgid to the
>> latest oe-core master.
>>
>> I haven't seen any comments on this RFC yet.  Does anyone have any opinion
>> either way on the code referenced here?
>
> I wanted to do more tests and find some smaller reproducer, but I'm
> interested in this series.
>
> What I'm seeing in our builds is that when you compare
> files-in-image.txt report from independent (not reusing sstate-cache)
> builds with exactly the same metadata, group owners aren't
> deterministic.

Yes, this is partially to address that.  The issue is that the package install 
order itself is not deterministic.  The only thing that is, is the resulting set 
of files, modes, owner and group -names-.

Since the order the scripts are run is determines the effective uid/gid, the 
non-deterministic ordering causes these issues.

This patch set deals with that by allowing the user to specify -the- one and 
true deterministic set which is then reused.

> Random files in image getting owned by "messagebus" group etc., these
> issues went away when useradd class creating these ad-hoc groups had
> parameter for fixed gid or when I've added these groups directly to
> base-passwd group.master.
>
> Is this the same problem you're addressing in this patchset?

I have never seen a problem where specific files uname/gname are wrong.  It 
might be a related problem, but that shouldn't be happening in any case.

The -names- should always be right compared to the contents of the passwd/group 
files located within the constructed image.

I know there is an open bug where there were a few cases (in the sysroot) where 
things used a uname/gname from the default passwd/group file, but it had not yet 
been written.  So it fell back to the host's passwd/group file which had 
different numbers.  This is certainly incorrect behavior, and I think it's fixed 
by either inheriting the adduser class in those cases (even if they don't add 
users) or requiring the base-passwd in those specific package depends... but 
I've been looking for a reproducer to work though that.

--Mark

>> I'm confident patch 01/02 should be added to master.
>>
>> The patch 02/02 works properly in all of my testing and does implement support
>> for 'deterministic uid/gid' with dynamic passwd/group file construction during
>> package install.  The code is only activated if USERADD_REWRITE_PARAMS is set to
>> '1', so it's low risk -- but it does add a fairly large chunk of code to be
>> maintained over time.
>>
>> --Mark
>>
>> On 12/10/13, 12:31 PM, Mark Hatle wrote:
>>> The following series implements the deterministic uid/gid setting for a
>>> distribution.  Currently when a filesystem is generated the uid/gid values
>>> are generally set at install time, so the install order determines what
>>> the actual uid/gid values become.  In order to create a deterministic uid/gid
>>> set, that still dynamically constructs the passwd/group file, we add an
>>> option to read a special passwd/group file to allow the system to determine
>>> the values.
>>>
>>> It uses the existing parameters, and the values from the special passwd/group
>>> files to reconstruct the parameter set to ensure these items are fully
>>> defined with static values.
>>>
>>> The first patch (01/02) is generally applicable.  It fixes a real bug in
>>> the way the user/group adds occur today within the system.
>>>
>>> Patch 02/02 implements the new functionality.
>>>
>>>
>>> The following changes since commit 8505f0fa48cc79d51616b923c6e2c778c4b46a44:
>>>
>>>     libmatchbox: use PACKAGECONFIG (2013-12-10 14:13:01 +0000)
>>>
>>> are available in the git repository at:
>>>
>>>     git://git.yoctoproject.org/poky-contrib mhatle/uidgid
>>>     http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=mhatle/uidgid
>>>
>>> Mark Hatle (2):
>>>     useradd.bbclass: Fix build time install issues
>>>     useradd.bbclass: Add ability to select a static uid/gid automatically
>>>
>>>    meta/classes/useradd.bbclass         | 247 ++++++++++++++++++++++++++++++++++-
>>>    meta/conf/local.conf.sample.extended |  24 ++++
>>>    2 files changed, 265 insertions(+), 6 deletions(-)
>>>
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>


