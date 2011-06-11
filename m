Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1QVJRj-0001IP-UE
	for openembedded-core@lists.openembedded.org;
	Sat, 11 Jun 2011 10:21:32 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p5B8I8KZ001629
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Sat, 11 Jun 2011 01:18:08 -0700 (PDT)
Received: from [128.224.163.140] (128.224.163.140) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Sat, 11 Jun 2011 01:18:08 -0700
Message-ID: <4DF324BE.2090407@windriver.com>
Date: Sat, 11 Jun 2011 16:18:06 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.17) Gecko/20110516 Lightning/1.0b2 Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <4DF31F79.4070602@windriver.com>
	<1307779402.3307.12.camel@lenovo.internal.reciva.com>
In-Reply-To: <1307779402.3307.12.camel@lenovo.internal.reciva.com>
Cc: "Purdie, Richard" <richard.purdie@intel.com>, "Wold,
	Saul" <saul.wold@intel.com>
Subject: Re: About share eglibc work directories
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
X-List-Received-Date: Sat, 11 Jun 2011 08:21:32 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit


On 06/11/2011 04:03 PM, Phil Blundell wrote:
> On Sat, 2011-06-11 at 15:55 +0800, Robert Yang wrote:
>> The source code of eglibc and eglibc-nativesdk are not compatible because of
>> the patch ld-search-order.patch, this makes it a little complex to share their
>> source directories, what can I think is that always apply
>> ld-search-order.patch, then in do_configure_prepend:
>
> I must admit I never quite understood why ld-search-order.patch is
> really required; it seems like rather a gruesome hack.  Why can't the
> SDK paths just be put in RPATH records for the nativesdk binaries?
>

Here is the comment in ld-search-order.patch, hope this can answer you question:

Upstream-Status: Inappropriate [embedded specific]

The default lib search path order is:

   1) LD_LIBRARY_PATH
   2) RPATH from the binary
   3) ld.so.cache
   4) default search paths embedded in the linker

For nativesdk binaries which are being used alongside binaries on a host system, we
need the search paths to firstly search the shipped nativesdk libs but then also
cover the host system. For example we want the host system's libGL and this may be
in a non-standard location like /usr/lib/mesa. The only place the location is know
about is in the ld.so.cache of the host system.

Since nativesdk has a simple structure and doesn't need to use a cache itself, we
repurpose the cache for use as a last resort in finding host system binaries. This
means we need to switch the order of 3 and 4 above to make this work effectively.

RP 14/10/2010

// Robert


> p.
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


