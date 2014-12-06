Return-Path: <pab@pabigot.com>
Received: from p3plsmtpa06-03.prod.phx3.secureserver.net
	(p3plsmtpa06-03.prod.phx3.secureserver.net [173.201.192.104])
	by mail.openembedded.org (Postfix) with ESMTP id 8C4F3723ED
	for <openembedded-core@lists.openembedded.org>;
	Sat,  6 Dec 2014 13:40:48 +0000 (UTC)
Received: from [192.168.65.10] ([75.72.225.8])
	by p3plsmtpa06-03.prod.phx3.secureserver.net with 
	id QDgo1p0040BVjqb01DgozY; Sat, 06 Dec 2014 06:40:49 -0700
Message-ID: <54830760.7020708@pabigot.com>
Date: Sat, 06 Dec 2014 07:40:48 -0600
From: "Peter A. Bigot" <pab@pabigot.com>
Organization: Peter Bigot Consulting, LLC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.3.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <cover.1417802944.git.paul.eggleton@linux.intel.com>	<b16b90e4646b1eb5ae59f98fca123f2f55f7ad3c.1417802944.git.paul.eggleton@linux.intel.com>	<CAP9ODKqGkqK7rMKudFGcjcEyXc+VquhtRPZpioXbXhTOc-kt2Q@mail.gmail.com>	<2398845.3Ch9h31VYL@peggleto-mobl5.ger.corp.intel.com>
	<CAP9ODKrLxhKNi+TS4T+e86zBJ1Rnu-Q443AoztfudrwpvGAUrg@mail.gmail.com>
In-Reply-To: <CAP9ODKrLxhKNi+TS4T+e86zBJ1Rnu-Q443AoztfudrwpvGAUrg@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] buildtools-tarball: restore missing git tools
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
X-List-Received-Date: Sat, 06 Dec 2014 13:40:53 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 12/06/2014 07:01 AM, Otavio Salvador wrote:
> On Fri, Dec 5, 2014 at 11:39 PM, Paul Eggleton
> <paul.eggleton@linux.intel.com> wrote:
>> On Friday 05 December 2014 16:30:44 Otavio Salvador wrote:
>>> On Fri, Dec 5, 2014 at 4:09 PM, Paul Eggleton
>>>
>>> <paul.eggleton@linux.intel.com> wrote:
>>>> Since the split out of git-perltools, some git tools (such as "git am",
>>>> "git send-email" and "git-submodule") have no longer been part of the
>>>> buildtools. We need these, so add them back in.
>>>>
>>>> However, adding git-perltools to buildtools triggers perl itself being
>>>> brought into buildtools as well, and we don't want that; but we also
>>>> don't want to have to hack the git recipe or indeed anything else that
>>>> starts depending on perl. Thus, add a dummy package which gets installed
>>>> in its place, in a separate package architecture that is only enabled
>>>> for buildtools to ensure it doesn't start appearing in place of
>>>> nativesdk-perl anywhere else.
>>>>
>>>> Fixes [YOCTO #7033].
>>>>
>>>> Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
>>> This dummy thing looks like a hack to me :-(
>> Perhaps - I'm all ears for an alternative solution, but it absolutely has to
>> be fixed, and soon. Shipping an incomplete git (or incomplete perl) in
>> buildtools basically defeats a major part of having the thing in the first
>> place.
> We should split out the tools we really want (so we skip the perl
> runtime dependency) or include perl. Use a dummy package for it is
> wrong in my opinion. You cannot guarantee host perl will work as
> expected for our git release.

I vote for "include perl".

I was surprised that I had to submit a patch to get git-perltools to 
include the git Perl module which is required by git add --interactive.

Why are there things in git-perltools that don't have a true dependency 
on perl?  And if they do, then is the issue that some of them are usable 
in restricted ways that don't invoke that dependency?

If so there probably needs to be a 
git-tools-that-could-use-perl-but-dont-have-to package to hold them, if 
it's important enough to provide them in a partly-crippled form instead 
of including perl.  But as a user I expect something called 
"git-perltools" to have everything necessary to use the tools it 
contains in all ways they're documented to be usable, whether it's on 
target or native.

Peter

