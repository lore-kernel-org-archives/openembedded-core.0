Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1TJRVv-0000KI-7R
	for openembedded-core@lists.openembedded.org;
	Wed, 03 Oct 2012 18:09:35 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q93FuY7S022228
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 3 Oct 2012 08:56:34 -0700 (PDT)
Received: from msp-dhcp7.wrs.com (172.25.34.7) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.309.2;
	Wed, 3 Oct 2012 08:56:33 -0700
Message-ID: <506C6034.6060707@windriver.com>
Date: Wed, 3 Oct 2012 10:56:36 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:15.0) Gecko/20120907 Thunderbird/15.0.1
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1349278932.32611.140.camel@phil-desktop>
In-Reply-To: <1349278932.32611.140.camel@phil-desktop>
Subject: Re: [PATCH] insane: detect and warn about relocations in .text
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
X-List-Received-Date: Wed, 03 Oct 2012 16:09:35 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

As an FYI -- if you have text relocations, then the prelinker will skip that 
binary, resulting in lower startup performance.  So as a general QA check, it's 
well worth having.

--Mark

On 10/3/12 10:42 AM, Phil Blundell wrote:
> On Wed, 2012-10-03 at 11:24 +0100, Phil Blundell wrote:
>> Signed-off-by: Phil Blundell <pb@pbcl.net>
>> ---
>> This requires qa.elf.run_objdump() so needs to be applied after the
>> patch which adds that function.
>
> By the way, the background motivation for this was that the current
> oe-core version of gcc seems to be somewhat broken in this respect on
> MIPS; it seems to have reverted to generating an .eh_frame with a
> relocation in it which results in DT_TEXTREL on the binary.
>
> With -fasynchronous-unwind-tables it seems to get even worse.  I don't
> quite recall exactly what the failure was there but it was bad enough to
> make it unusable.
>
> I think both of these problems are regressions from the gcc-4.6 that we
> were using previously.  I'm not quite sure at what point it went wrong
> though.
>
> p.
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>



