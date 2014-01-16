Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8631E6E472
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Jan 2014 16:37:53 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s0GGbrmA011428
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Jan 2014 08:37:54 -0800 (PST)
Received: from Marks-MacBook-Pro.local (172.25.36.229) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.347.0; Thu, 16 Jan 2014 08:37:53 -0800
Message-ID: <52D80AE0.2020306@windriver.com>
Date: Thu, 16 Jan 2014 10:37:52 -0600
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1386700055.git.mark.hatle@windriver.com>
	<52CEFD48.5070901@windriver.com>
In-Reply-To: <52CEFD48.5070901@windriver.com>
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
X-List-Received-Date: Thu, 16 Jan 2014 16:37:53 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 1/9/14, 1:49 PM, Mark Hatle wrote:
> I have updated the git://git.yoctoproject.org/poky-contrib mhatle/uidgid to the
> latest oe-core master.
>
> I haven't seen any comments on this RFC yet.  Does anyone have any opinion
> either way on the code referenced here?
>
> I'm confident patch 01/02 should be added to master.
>
> The patch 02/02 works properly in all of my testing and does implement support
> for 'deterministic uid/gid' with dynamic passwd/group file construction during
> package install.  The code is only activated if USERADD_REWRITE_PARAMS is set to
> '1', so it's low risk -- but it does add a fairly large chunk of code to be
> maintained over time.

I'm replying to myself on behalf of an external reviewer who is not on this 
mailing list.  They identified one item that they would like to see:

> Looking at how to override the passwd fields, it seems like it's an
> 'all-or-nothing' scenario for each user?
> E.g., if you specify a passwd line for a user, all fields has to be set
> and will be overridden?
> Look at lines like 227 and 248-252 in the patched file (I looked at
> http://git.yoctoproject.org/cgit.cgi/poky-contrib/tree/meta/classes/useradd.bbclass?h=mhatle/uidgid&id=21a7d772b9aee15d16ee8e29cb00a22e5fe21aac
>
> ).
> We've discussed the possibility to have this kind of scenario where we
> only want to e.g. override the default shell for the user (that is, not
> override uid, comment, etc). Is it maybe possible to e.g. add some kind
> of special marker to fields that should be discarded in the overridden
> file (like username:#:#:#:#:#:/bin/tcsh). That way we can automatically
> track upstream changes of the user but still override the shell.

It should be pretty easy for me to generate a third commit that implements this 
type of functional.  Does anyone have any opinions on a proper marker to 
indicate re-use the dynamic value?  (I'd like to stay away from a blank, as 
there are valid reasons to set fields to blank.  They're suggesting in the above 
a single '#' statement -- does this seem reasonable?

--Mark

> --Mark
>
> On 12/10/13, 12:31 PM, Mark Hatle wrote:
>> The following series implements the deterministic uid/gid setting for a
>> distribution.  Currently when a filesystem is generated the uid/gid values
>> are generally set at install time, so the install order determines what
>> the actual uid/gid values become.  In order to create a deterministic uid/gid
>> set, that still dynamically constructs the passwd/group file, we add an
>> option to read a special passwd/group file to allow the system to determine
>> the values.
>>
>> It uses the existing parameters, and the values from the special passwd/group
>> files to reconstruct the parameter set to ensure these items are fully
>> defined with static values.
>>
>> The first patch (01/02) is generally applicable.  It fixes a real bug in
>> the way the user/group adds occur today within the system.
>>
>> Patch 02/02 implements the new functionality.
>>
>>
>> The following changes since commit 8505f0fa48cc79d51616b923c6e2c778c4b46a44:
>>
>>     libmatchbox: use PACKAGECONFIG (2013-12-10 14:13:01 +0000)
>>
>> are available in the git repository at:
>>
>>     git://git.yoctoproject.org/poky-contrib mhatle/uidgid
>>     http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=mhatle/uidgid
>>
>> Mark Hatle (2):
>>     useradd.bbclass: Fix build time install issues
>>     useradd.bbclass: Add ability to select a static uid/gid automatically
>>
>>    meta/classes/useradd.bbclass         | 247 ++++++++++++++++++++++++++++++++++-
>>    meta/conf/local.conf.sample.extended |  24 ++++
>>    2 files changed, 265 insertions(+), 6 deletions(-)
>>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>


