Received: from 75-148-42-21-colorado.hfc.comcastbusiness.net ([75.148.42.21]
	helo=judge.camp.se-eng.com) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ray.danks@se-eng.com>) id 1Te4lT-00014R-IA
	for openembedded-core@lists.openembedded.org;
	Thu, 29 Nov 2012 15:06:55 +0100
Received: from localhost (localhost [127.0.0.1])
	by judge.camp.se-eng.com (Postfix) with ESMTP id 5C954138077;
	Thu, 29 Nov 2012 06:45:00 -0700 (MST)
X-Virus-Scanned: amavisd-new at camp.se-eng.com
Received: from judge.camp.se-eng.com ([127.0.0.1])
	by localhost (judge.camp.se-eng.com [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id 1phw81hVYHla; Thu, 29 Nov 2012 06:44:53 -0700 (MST)
Received: from [192.168.1.104] (host-209-169-196-2.beyondbb.com
	[209.169.196.2])
	by judge.camp.se-eng.com (Postfix) with ESMTPSA id 15A52138070;
	Thu, 29 Nov 2012 06:44:53 -0700 (MST)
Message-ID: <50B766CC.4030904@se-eng.com>
Date: Thu, 29 Nov 2012 06:44:44 -0700
From: Raymond Danks <ray.danks@se-eng.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:16.0) Gecko/20121028 Thunderbird/16.0.2
MIME-Version: 1.0
To: =?ISO-8859-1?Q?David_Nystr=F6m?= <david.nystrom@enea.com>
References: <50B63784.5050502@enea.com> <1354119751.15992.2.camel@ted>
	<CADkTA4P8=aLSXNTAENp+WW7xX+ttYAPhPufRE=+yn9KXOY8Sag@mail.gmail.com>
	<50B71FD4.3090304@enea.com>
In-Reply-To: <50B71FD4.3090304@enea.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: meta-cloud layer
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
X-List-Received-Date: Thu, 29 Nov 2012 14:06:56 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable

Thanks for looping me in here David. The initial goal for the meta-xen=20
layer was in fact to encompass Xen Cloud Platform.  As such, the intent=20
was to contain both hypervisor and user-space applications.  Indeed, the=20
xen distribution itself includes xm/libxl; hypervisor abstraction would=20
be somewhat tedious in my opinion.

The layer just received commits for expanding the libvirt build to=20
support qemu.  The commonalities and shared packaged between xen, qemu,=20
and kvm implementations are such that I would also agree that meta-xen=20
should be expanded/renamed to encompass all virtualization types; I also=20
support the move to meta-virtualization.

As far as a meta-cloud layer is concerned, I'm not sure I am=20
knowledgeable enough in this area to weigh in.  I'm currently=20
researching a filesystem implementation for OpenStack and have stumbled=20
across Ceph/RBD and Gluster modules that look promising. On top of this,=20
XCP is documented to include support for VastSky and can be integrated=20
with DRBD.  And, the storage and hypervisor are only two pieces of the=20
puzzle for a cloud implementation!

I think I would encourage you to also include OpenStack in a=20
meta-virtualization layer until it has matured to the point where=20
abstraction is more warranted.  Since you've already created a presence=20
at github, would it be possible to rename your layer to=20
meta-virtualization and absorb the entire meta-xen layer?  I can push=20
any changes for Xen/XCP here, it sounds like it is a central place for=20
libvirt and could also contain Bruce's kernel modifications.

Alternatively, I can create a meta-virtualization project.  In any case,=20
those on the To and CC list should receive access to this layer as a=20
starting point.

Just my two cents.  :)

Ray

On 11/29/2012 01:41 AM, David Nystr=F6m wrote:
> Adding Ray Danks to CC.
>
> Ray, how do you want to go forward with the meta-xen layer ?
>
> From my perspective, having the actual hypervisor technology abstracted
> from the userspace virtualization stuff is preferable. So a user could=20
> pick-and-place hypervisor layer/s depending on needs. (And good for=20
> use-case benchmarks as well).
>
> libvirt package and others are smart enough to autodetect underlying=20
> hypervisor tech capabilities, and should work out-of-the-box from that=20
> aspect.
>
> As to where all this will finally end up, anything goes as far as I'm=20
> concerned. I'll continue working in meta-cloud for now, until=20
> consensus is reached on the final whereabouts for the virtualization=20
> specific recipes.
>
> If anyone want to join me on github, send me an email.
>
> Best Regards,
> David
>
>
> On 11/28/2012 06:25 PM, Bruce Ashfield wrote:
>> On Wed, Nov 28, 2012 at 11:22 AM, Richard Purdie <
>> richard.purdie@linuxfoundation.org> wrote:
>>
>>> On Wed, 2012-11-28 at 17:10 +0100, David Nystr=F6m wrote:
>>>> Hello everyone,
>>>>
>>>> I'm working on getting a minimal Yocto/oe-core based OpenStack setup
>>>> running with the meta-cloud layer, with bits and pieces "borrowed"=20
>>>> from
>>>> the meta-xen layer.
>>>
>>> Great news!
>>>
>>> It might be worth growing meta-xen into a meta-virtualisation layer
>>> since kvm, openstack and xen all seem to be sharing a lot of pieces.
>>> This depends on the maintainers but it would seem to be logical rathe=
r
>>> than many small interdependent layers.
>>>
>>
>> FWIW. I'd like to see this as well, and can contribute/help where=20
>> possible.
>> I
>> was considering a meta-ovs (Open Virtualization Solutions), but if=20
>> there are
>> already plans afoot for a meta-virtualization, then anything I did=20
>> could be
>> pushed down keeping any other layers small.
>>
>> In particular I'm keen to drive some common kernel configuration, and=20
>> work
>> on consolidating kernel features in trees versus having a whole set=20
>> of out
>> of
>> tree modules with better tie in's to userspace enabling features
>> dynamically.
>>
>> So I'll keep an eye out for things as well and help where possible.
>>
>> Cheers,
>>
>> Bruce
>>
>>
>>>
>>>> Still in its infancy, and lots of stuff is still missing and/or not
>>>> working properly.
>>>>
>>>> Have a look if your interested, not much to see yet though.
>>>>
>>>> https://github.com/nysan/meta-cloud.git
>>>>
>>>> Any thoughts on floating layer ML:s, i.e. an ML for so called
>>>> "out-of-tree" layers ?  Or is the common thought that all new recipe=
s
>>>> should eventually go into oe-core ?
>>>
>>> The Yocto Project has been using the Yocto list for that and
>>> OpenEmbedded has openembedded-devel. Its not expected for everything =
to
>>> end up in OE-Core, quite the opposite.
>>>
>>> Cheers,
>>>
>>> Richard
>>>
>>>
>>>
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>>>
>>
>>
>>



