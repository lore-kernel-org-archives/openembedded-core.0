Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 2210665D3B
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Dec 2014 15:46:41 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id sB3Fka7P011758
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL);
	Wed, 3 Dec 2014 07:46:36 -0800 (PST)
Received: from Marks-MacBook-Pro.local (172.25.36.227) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.174.1; Wed, 3 Dec 2014 07:46:35 -0800
Message-ID: <547F305A.5060305@windriver.com>
Date: Wed, 3 Dec 2014 09:46:34 -0600
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10;
	rv:24.0) Gecko/20100101 Thunderbird/24.6.0
MIME-Version: 1.0
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
References: <A612847CFE53224C91B23E3A5B48BAC7ACF18D3E7B@xmail3.se.axis.com>
	<547E08A9.2090500@windriver.com>
	<A612847CFE53224C91B23E3A5B48BAC7ACF18D42B6@xmail3.se.axis.com>
In-Reply-To: <A612847CFE53224C91B23E3A5B48BAC7ACF18D42B6@xmail3.se.axis.com>
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
X-List-Received-Date: Wed, 03 Dec 2014 15:46:49 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 12/3/14, 9:36 AM, Peter Kjellerstedt wrote:
>>> Can anyone please explain why OE-core installs systemd to / rather
>>> than /usr? Because I have traced the recipe all the way back to its
>>> introduction in OE classic, and I cannot find any rationale for
>>> this odd decision. And it is extra weird given the systemd authors'
>>> agenda that everything should be in /usr (and /etc)...
>>
>> It's only strange compared to Fedora.  We're not Fedora.. and I've
>> got systems that need to boot from a small '/' before mounting '/usr'.
>
> Speaking of Fedora, would an official image feature, e.g., "unified-fs",
> be acceptable for OE-Core that sets up the file system with /bin, /sbin
> and /lib* as links to their /usr counterparts? That would alleviate our
> problems with the differences in how systemd is installed.

The system permits developers to set the paths for the various pieces.  To get a 
Fedora like unified filesystem, you could do something like:

* provide your own fs-perms.txt:

/usr/bin	link	${base_bindir}
/usr/sbin	link	${base_sbindir}
/usr/lib	link	${base_libdir}

Then in your local.conf:

bindir = "${base_bindir}"
sbindir = "${base_sbindir}"
libdir = "${base_libdir}"


This will result in /usr/bin, sbin and lib being linked to /bin, /sbin, /lib -- 
and all of the package produced for your configuration will only reference '/'.

This isn't that unusual of a configuration from what I've been told.

--Mark

>> (In prior discussions we've made the decision to not fix every library
>> or application, but there is a warning you can enable that will show
>> you what libraries and applications live in '/' but have obvious
>> linkage to '/usr'.)
>>
>>>> (Another alternative is pkg-config, but I don't think that really
>>>> applies in this situation.)
>>>
>>> Nope.
>>>
>>>> Cheers,
>>>> Paul
>>>>
>>>> --
>>>>
>>>> Paul Eggleton
>>>> Intel Open Source Technology Centre
>>>
>>> //Peter
>
> //Peter
>


