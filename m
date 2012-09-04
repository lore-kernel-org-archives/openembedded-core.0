Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1T8vzS-0005Rn-V7
	for openembedded-core@lists.openembedded.org;
	Tue, 04 Sep 2012 18:28:39 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q84GGGET014211
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 4 Sep 2012 09:16:16 -0700 (PDT)
Received: from msp-dhcp18.wrs.com (172.25.34.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.309.2;
	Tue, 4 Sep 2012 09:16:15 -0700
Message-ID: <5046294F.8020202@windriver.com>
Date: Tue, 4 Sep 2012 11:16:15 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:14.0) Gecko/20120713 Thunderbird/14.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <d45bc352092507d11c740fb85c37d1102fa7203d.1346250187.git.ross.burton@intel.com>
	<FF931F2C-6ABE-4F72-8FEE-90CFCE69121C@dominion.thruhere.net>
	<CAJTo0LZa4odP83UOT=1U+nan-wcOEKuRMXW3iHRv9wzD8pspDA@mail.gmail.com>
	<4976204.OdG2Ohk3KU@helios>
	<CAJTo0LbGH3HV1yQOMyoYDVR_z=34qy3riZnASGYdFtkK_XkOmw@mail.gmail.com>
	<1346267538.4396.38.camel@x121e.pbcl.net>
	<CAJTo0La-tMW+LVLqRGBTSE36x0BYXBJkiwh2B5_8_-SjaAzR5Q@mail.gmail.com>
	<CAMKF1srQO53m2zv91LLs8WFjEt=UKNA=w4OqxdVfJpyWPHG8jg@mail.gmail.com>
	<CAJTo0LZGcZHwM5cZgjFrQ9tuhw6RLN_g732wBitVgHKo8UigNQ@mail.gmail.com>
	<1346278937.4396.57.camel@x121e.pbcl.net>
	<1346423384.2673.102.camel@phil-desktop>
	<1346428885.16485.29.camel@ted>
In-Reply-To: <1346428885.16485.29.camel@ted>
Subject: Re: [PATCH 2/2] tzdata: install /etc/localtime alongside /etc/timezone
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 04 Sep 2012 16:28:39 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 8/31/12 11:01 AM, Richard Purdie wrote:
> On Fri, 2012-08-31 at 15:29 +0100, Phil Blundell wrote:
>> On Wed, 2012-08-29 at 23:22 +0100, Phil Blundell wrote:
>>> As far as I know, only Intel have ever expressed any real interest in
>>> having this feature work.  My recollection is that there are some
>>> supposed "carrier grade" systems where this is, for whatever reason, a
>>> requirement.
>>
>> None of the carrier-grade people (or indeed any others) seem to have
>> spoken up in favour of a separate /usr in the past 3 days or so, which
>> does rather suggest that nobody actually cares about it.
>>
>> Maybe the TSC would like to reconsider whether this is in fact a
>> worthwhile thing to go on trying to support in oe-core or whether it
>> should just assume that / and ${prefix} will be the same filesystem.
>
> I think the people in question are at a conference at the moment and
> dealing with a few issues so they fact they haven't spoken up doesn't
> surprise me.

As Richard mentioned, a lot of folks were at a conference last week and with the 
holiday (in the US) over the weekend were not around to reply before.

> I'm fine with merging the symlink change. As others have mentioned, if
> it is an issue, a script to turn the links into copies can be written
> relatively easily.

Frankly, I'm an advocate of the split, and I'm in favor of the symlink change. 
A dangling link is fine for a non-criticial component like a timezone file.  If 
the system attempts to get the time, it will simply fall back to GMT, which to 
me is acceptable on embedded systems.

> I don't think dropping support for / and ${prefix} makes sense as long
> as it doesn't excessively hurt us. It is up to users to step up and help
> maintain the use cases they care about and so far, they have done this.
> So I think the position the TSC took is the correct one. Certainly we
> can revisit it but its not going to stop this patch going in for
> example.

Again, I agree with this.

At Wind River we've been following up and sending patches.  The issue is that we 
(OE) need to keep reviewing them and determining if they continue to make sense 
or not.  If we get into a situation where we've moved everything from /usr to /, 
it's pretty clear it no longer makes sense!  However, we're still far from the 
point.

initramdisk (from the comments to the links Khem sent out) is certainly a 
primary issue, but not the one I've been focused on in the past...

A number of devices that I've worked with do something -similar- to the ramdisk 
for early booting.  Boot order becomes:

firmware/bootloader -> kernel -> [small] rootfs mount (RO) -> run init

init -> module loading -> setup -> 'late' udev config -> mount filesystems 
(/usr) -> 'early' udev config

(late udev is running the daemon and watching for hotplug events, early udev is 
what triggers device creation behaviors.  The orders are switched both for 
performance, and because other then plugable devices -- the device tree is more 
or less static from one boot to the next, so our root has it pre-seeded...)

Many of the devices also have a validation and restoration system on root as 
well, that is performed by the setup step.  If the validation fails, then 
corrective actions can be taken to "fix" the system.  The / is always a RO 
system.. the device may contain more then one '/' to allow for upgrades, but the 
active one is always RO to avoid various potential problems.

The more software that gets put onto the system, the harder it will be to do 
field upgrades w/o a reboot.  (Since we don't want to allow / to change.)

Keeping the root small makes for a quicker boot, smaller set of partitions, and 
easier restoration on failure in my experience.

---

Again, if creating split systems no longer makes sense, I'm not against dumping 
the code..  I am going to be monitoring our customers, as much as I'm able, over 
the next 6 months -> year and seeing if anyone is doing this type of split 
anymore.. if they're not.. then we (OE) may, justifiably, abandon this behavior.

--Mark

> Cheers,
>
> Richard
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>



