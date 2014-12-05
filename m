Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id D60BB65D3B
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Dec 2014 03:46:55 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id sB53kqKZ008549
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 4 Dec 2014 19:46:52 -0800 (PST)
Received: from Marks-MacBook-Pro.local (172.25.36.227) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.174.1; Thu, 4 Dec 2014 19:46:51 -0800
Message-ID: <54812AAA.4010103@windriver.com>
Date: Thu, 4 Dec 2014 21:46:50 -0600
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10;
	rv:24.0) Gecko/20100101 Thunderbird/24.6.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <A612847CFE53224C91B23E3A5B48BAC7ACF18D3E7B@xmail3.se.axis.com>	<547E08A9.2090500@windriver.com>	<A612847CFE53224C91B23E3A5B48BAC7ACF18D42B6@xmail3.se.axis.com>	<547F305A.5060305@windriver.com>	<A612847CFE53224C91B23E3A5B48BAC7ACF18D45D8@xmail3.se.axis.com>
	<54811FDE.7050605@windriver.com>
In-Reply-To: <54811FDE.7050605@windriver.com>
Subject: Re: Why is systemd installed to / (was: [yocto] Export bitbake variables between recipes)
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
X-List-Received-Date: Fri, 05 Dec 2014 03:46:57 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 12/4/14, 9:00 PM, ChenQi wrote:
> On 12/04/2014 09:34 PM, Peter Kjellerstedt wrote:
>>> -----Original Message-----
>>> From: openembedded-core-bounces@lists.openembedded.org
>>> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
>>> Mark Hatle
>>> Sent: den 3 december 2014 16:47
>>> To: Peter Kjellerstedt; openembedded-core@lists.openembedded.org
>>> Subject: Re: [OE-core] Why is systemd installed to / (was: [yocto]
>>> Export bitbake variables between recipes)
>>>
>>> On 12/3/14, 9:36 AM, Peter Kjellerstedt wrote:
>>>>>> Can anyone please explain why OE-core installs systemd to /
>>>>>> rather than /usr? Because I have traced the recipe all the
>>>>>> way back to its introduction in OE classic, and I cannot
>>>>>> find any rationale for this odd decision. And it is extra
>>>>>> weird given the systemd authors' agenda that everything
>>>>>> should be in /usr (and /etc)...
>>>>> It's only strange compared to Fedora.  We're not Fedora.. and
>>>>> I've got systems that need to boot from a small '/' before
>>>>> mounting '/usr'.
>>>> Speaking of Fedora, would an official image feature, e.g.,
>>>> "unified-fs", be acceptable for OE-Core that sets up the file
>>>> system with /bin, /sbin and /lib* as links to their /usr
>>>> counterparts? That would alleviate our problems with the
>>>> differences in how systemd is installed.
>>> The system permits developers to set the paths for the various pieces.
>>> To get a Fedora like unified filesystem, you could do something like:
>>>
>>> * provide your own fs-perms.txt:
>> I had not noticed fs-perms.txt before. And it seems easy enough
>> to extend via the FILESYSTEMS_PERMS_TABLES variable. :)
>>
>>> /usr/bin	link	${base_bindir}
>>> /usr/sbin	link	${base_sbindir}
>>> /usr/lib	link	${base_libdir}
>>>
>>> Then in your local.conf:
>>>
>>> bindir = "${base_bindir}"
>>> sbindir = "${base_sbindir}"
>>> libdir = "${base_libdir}"
>> I think you mean the opposite, i.e., that /bin should be a
>> link to ${bindir} and ${base_bindir} should be set to ${bindir},
>> but I get your point.
>>
>>> This will result in /usr/bin, sbin and lib being linked to /bin,
>>> /sbin, /lib -- and all of the package produced for your
>>> configuration will only reference '/'.
>>>
>>> This isn't that unusual of a configuration from what I've been told.
>> Which is why I think it warrants an official distro feature (an
>> image feature, as I originally suggested, will of course not do
>> if it is done the way you suggest since the packages' contents
>> are modified). That way people would not have to invent the wheel
>> over and over again (and somehow find out that there is such a
>> thing as fs-perms.txt which up until now had eluded me).
>>
>>> --Mark
>> //Peter
>>
>
> Hi Peter,
>
> It's easy to link /usr/bin to /bin, /usr/sbin to /sbin and make things
> work in OE.
> But if we want the opposite to work, we might need several additional
> patches to OE.

Exactly.. and going back to the FHS, the FHS says that '/' is required to boot, 
/usr is not.  So /usr should be linked to / for those items.

There is a fairly standard OE configuration some people do where they don't 
define a /usr at all.  They just set the prefix (normally /usr) to '/'.

That SHOULD be working still, at least it used to be a well tested configuration...

> Several days ago, I tried to do /usr merge in OE (like what Fedora and
> Arch does). It turned out that we need to patch several packages to make
> things work.
>
> (I haven't sent out the patches because it's just some initial
> investigation and I'm not sure if people want this feature or not.)
>
> If you want this feature in OE, please open a bug/enhancement in
> bugzilla https://bugzilla.yoctoproject.org/ to see if the community
> wants it or not.
>
> Regards,
> Chen Qi
>
>


