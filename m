Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1SwIoD-0003CL-Oa
	for openembedded-core@lists.openembedded.org;
	Tue, 31 Jul 2012 22:12:50 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q6VK1AvD022845
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Jul 2012 13:01:10 -0700 (PDT)
Received: from Marks-MacBook-Pro.local (172.25.34.39) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.309.2; Tue, 31 Jul 2012 13:01:11 -0700
Message-ID: <50183986.1030203@windriver.com>
Date: Tue, 31 Jul 2012 15:01:10 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:14.0) Gecko/20120713 Thunderbird/14.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <CALRxmdDhE8GQPYde27786kKU35p4dRrTmaGbmauVDxTrMQ6N6Q@mail.gmail.com>
	<CAEsOVNeJxw0VbwPX+90riJeVzTQYLdR7dCp==TiCj+eCe=eExw@mail.gmail.com>
In-Reply-To: <CAEsOVNeJxw0VbwPX+90riJeVzTQYLdR7dCp==TiCj+eCe=eExw@mail.gmail.com>
Subject: Re: static busybox?
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 31 Jul 2012 20:12:50 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 7/31/12 2:36 PM, McClintock Matthew-B29882 wrote:
> On Tue, Jul 31, 2012 at 1:14 PM, Stuart Yoder <b08248@gmail.com> wrote:
>> We are doing some work with LXC (containers) and one of the templates
>> is for busybox.  For LXC, the busybox package needs to be built statically and
>> there is a config option for this.
>>
>> A couple possible approaches:
>>
>>     -create a new 'busybox_static' recipe that the lxc package
>>      depends on that turns on the needed build options.   Pretty
>>      straightforward, but now there are 2 variants of the busybox
>>      package.
>
> This would seem to work OK with RDEPENDS += "busybox-static" and just
> adding the extra static bits for for the static version. It seems OK
> except we would/could start to get lots of recipes like this.
>
>>     -somehow propagate some configuration options through to
>>      the standard busybox recipe so it turns on the config
>>      option to build things statically.   Not sure how to
>>      do this, and seems like it could get pretty messy.
>
> Are there any mechanism that currently exist for this? We could turn
> on a DISTRO_FEATURE if we knew we were going use lxc, but that's more
> involved than just adding the lxc recipe and getting the right stuff
> in the root file system.

Kernel config fragment mechanism is there and IMHO works well for something like 
this, assuming configuration is using standard

FOO = value

# FOO is not set

kernel semantics....

> Does anyone else have any thoughts on the best approach here?

In this case, I don't think it's a distro feature, it's really a package 
configuration option -- the assumption is the rest of the system isn't 
statically linked.  (Our case was that we wanted a static busybox for an initrd...)

> -M
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>



