Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1TQJS0-0007QP-77
	for openembedded-core@lists.openembedded.org;
	Mon, 22 Oct 2012 16:57:56 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q9MEiU2Q013154
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Oct 2012 07:44:30 -0700 (PDT)
Received: from Marks-MacBook-Pro.local (172.25.36.231) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.309.2; Mon, 22 Oct 2012 07:44:29 -0700
Message-ID: <50855BD3.3020509@windriver.com>
Date: Mon, 22 Oct 2012 09:44:35 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:16.0) Gecko/20121010 Thunderbird/16.0.1
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <50854312.5040502@dresearch-fe.de> <1350913259.2520.90.camel@ted>
	<1350913794.3259.299.camel@phil-desktop>
In-Reply-To: <1350913794.3259.299.camel@phil-desktop>
Subject: Re: Profiling binaries?
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
X-List-Received-Date: Mon, 22 Oct 2012 14:57:56 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 10/22/12 8:49 AM, Phil Blundell wrote:
> On Mon, 2012-10-22 at 14:40 +0100, Richard Purdie wrote:
>> On Mon, 2012-10-22 at 14:58 +0200, Steffen Sledz wrote:
>>> Just a short question: Does oe[-core] provide a generic method to
>>> create packages containing binaries/libraries with profiling support?
>>
>> Have a look at the section "Optimization flags" in bitbake.conf. You
>> should be able to add the -pg flag to
>> FULL_OPTIMIZATION/DEBUG_OPTIMIZATION and get what you're looking for.
>
> I think you need a bit of special handling around eglibc as well.  But
> otherwise yes, I've done basically this in the past and it seems to work
> fine.

For our environment we do:

# Add profiling optimization type
PROFILING_OPTIMIZATION = "${FULL_OPTIMIZATION} -fno-omit-frame-pointer 
-fvisibility=default"
SELECTED_OPTIMIZATION[vardeps] += "PROFILING_OPTIMIZATION"

# Uncomment to enable profiling
#SELECTED_OPTIMIZATION = "${PROFILING_OPTIMIZATION}"


You can certainly add -pg to the optimization arguments as well.  As others have 
said, you'll need to have the profiling libgcc/libc components if you use -pg.

But this is a simple way to make your own customized optimization.  If you want 
to only enable it for one package you can do something like:

SELECTED_OPTIMIZATION_pn-<recipe> = "${PROFILING_OPTIMIZATION}"

--Mark

> p.
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>



