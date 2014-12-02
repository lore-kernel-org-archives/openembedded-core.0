Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id E0BB460030
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Dec 2014 18:44:50 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id sB2Iiomv024580
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 2 Dec 2014 10:44:50 -0800 (PST)
Received: from Marks-MacBook-Pro.local (172.25.36.227) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.174.1; Tue, 2 Dec 2014 10:44:50 -0800
Message-ID: <547E08A9.2090500@windriver.com>
Date: Tue, 2 Dec 2014 12:44:57 -0600
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10;
	rv:24.0) Gecko/20100101 Thunderbird/24.6.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <A612847CFE53224C91B23E3A5B48BAC7ACF18D3E7B@xmail3.se.axis.com>
In-Reply-To: <A612847CFE53224C91B23E3A5B48BAC7ACF18D3E7B@xmail3.se.axis.com>
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
X-List-Received-Date: Tue, 02 Dec 2014 18:44:59 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 12/2/14, 12:27 PM, Peter Kjellerstedt wrote:
> [ I am moving this discussion to the OE-core list as I believe
>    that is where it belongs. ]
>
>> -----Original Message-----
>> From: yocto-bounces@yoctoproject.org [mailto:yocto-
>> bounces@yoctoproject.org] On Behalf Of Paul Eggleton
>> Sent: den 2 december 2014 15:07
>> To: Fabrice Coulon
>> Cc: yocto@yoctoproject.org
>> Subject: Re: [yocto] Export bitbake variables between recipes
>>
>> Hi Fabrice,
>>
>> On Tuesday 02 December 2014 14:07:40 Fabrice Coulon wrote:
>>> Is it possible to export one bitbake variable from one recipe
>>> and make it available from inside another recipe? For example:
>>> we want to export from our systemd_%.bbappend where the
>>> systemctl command has been installed, in order to, from another
>>> recipe depending on systemd, refer to the absolute path where
>>> systemctl was installed. Any ideas or suggestions on how to do
>>> that?
>>
>> There's no mechanism to do this, no. The only way for this kind of
>> thing to work is for it to be specified at the configuration level
>> (e.g. ${bindir} points to the subdirectory /usr/bin and this variable
>> would be used both when choosing where the executable should be
>> installed and finding it later - this would typically be how this
>> kind of problem would be solved since it would be unusual to have
>> systemctl installed somewhere other than ${bindir}).
>
> Actually, since the systemd recipe in Poky is configured in an
> extremely weird way (using --with-rootprefix=${base_prefix} and
> --with-rootlib=${base_libdir}), systemctl actually ends up in
> ${base_bindir} rather than ${bindir}. And this is the whole reason
> for our troubles since everything else we had prior to switching
> to Poky expected systemd to be installed in /usr...

Because we support the split between / and /usr for embedded systems with 
multiple partitions/disks.

If you set it to /usr, then technically you are violating the FHS, as you now 
require /usr in order to boot the system.

What programs are expecting these things in a specific path?  Why aren't they 
either using the PATH, or using a similar configuration mechanism via the recipes?

> Can anyone please explain why OE-core installs systemd to / rather
> than /usr? Because I have traced the recipe all the way back to its
> introduction in OE classic, and I cannot find any rationale for
> this odd decision. And it is extra weird given the systemd authors'
> agenda that everything should be in /usr (and /etc)...

It's only strange compared to Fedora.  We're not Fedora.. and I've got systems 
that need to boot from a small '/' before mounting '/usr'.

(In prior discussions we've made the decision to not fix every library or 
application, but there is a warning you can enable that will show you what 
libraries and applications live in '/' but have obvious linkage to '/usr'.)

>> (Another alternative is pkg-config, but I don't think that really
>> applies in this situation.)
>
> Nope.
>
>> Cheers,
>> Paul
>>
>> --
>>
>> Paul Eggleton
>> Intel Open Source Technology Centre
>
> //Peter
>
>


