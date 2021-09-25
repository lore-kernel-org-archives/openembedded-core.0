X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Message-ID: <77b48aa1-3f41-3185-d820-9f956ce48a2a@pr.hu>
Date: Sat, 25 Sep 2021 10:48:51 +0200
MIME-Version: 1.0
Subject: Re: [OE-core] user/group XXX does not exist, using root with RPM/DNF packaging in Hardknott and Honister
References: <dc967621-9759-1ab4-e526-36f9010ae3c0@pr.hu>
 <c1c5df22-9bed-6d90-6d04-aec9e44a4efd@kernel.crashing.org>
From: "Zoltan Boszormenyi" <zboszor@pr.hu>
In-Reply-To: <c1c5df22-9bed-6d90-6d04-aec9e44a4efd@kernel.crashing.org>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: Mark Hatle <mark.hatle@kernel.crashing.org>, openembedded-core@lists.openembedded.org

On 2021. 09. 24. 19:17, Mark Hatle wrote:
> 
> 
> On 9/24/21 9:02 AM, Zoltan Boszormenyi via lists.openembedded.org wrote:
>> Hi,
>>
>> I have a special package that creates users and groups
>> via inherit useradd. This package doesn't depend on any
>> others but it is depended on, both via DEPENDS and RDEPENDS
>> by packages using those users/groups in their do_install
>> scripts.
>>
>> This works for packaging becase these ownerships
>> are encoded in the packages, confirmed by rpm -qp --dump ...
> 
> Does it show the useradd in the _PREINSTALL_ (you can use --scriptlets in the
> rpm -qp)?

For the package that adds the users, yes.

> 
>> However, during do_rootfs, a couple of
>> "user/group XXX does not exist, using root"
>> messages appear for the packages depending on others
>> creating these users/groups.
> 
> Do the using packages contain RDEPENDS on the package that adds the user/group
> to the system?

My bad. One of my custom packages did not and the
warnings were printed by that single package.

On the other hand, clamav-freshclam (both in meta-security
and my layer where I forked an older version of the recipe)
do not have an RDEPENDS on clamav. Instead, it's the other
way around.

There the problem is that clamav-freshclam is shipping
/var/lib/clamav that should be owned by clamav:clamav.
meta-security works this around badly by using chown in its
pkg_postinst which is NOT marked as "ontarget" so if clamav
is included in an image, then that chown doesn't take effect
and e.g. freshclamd (running under the clamav user) cannot
populate /var/lib/clamav with the current virus database.

> 
>> log.do_rootfs shows that the package installation ordering
>> does not follow RDEPENDS. Instead, it's practically an
>> alphabetical order when running dnf.
>>
>> This doesn't just involve my custom packages, but also clamav
>> plus another one in which I ship a small limited set of
>> virus signatures, also chown'd to clamav and with RDEPENDS
>> on clamav.
>>
>> What is the correct solution to this?
> 
> Typically the combination of the pre-install scriptlet, along with RDEPENDS will
> ensure that the user has been added before the install completes.
> 
> --Mark
> 
>> Thanks in advance,
>> Zoltán Böszörményi
>>
>>
>>
>>
>>
>>
>>
>> 
>>

