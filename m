Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1RMMeQ-0005ri-6B
	for openembedded-core@lists.openembedded.org;
	Fri, 04 Nov 2011 17:29:54 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id pA4GNhxk011868
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 4 Nov 2011 09:23:43 -0700 (PDT)
Received: from Macintosh-5.local (172.25.36.228) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Fri, 4 Nov 2011 09:23:42 -0700
Message-ID: <4EB4118E.50005@windriver.com>
Date: Fri, 4 Nov 2011 11:23:42 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6;
	rv:7.0.1) Gecko/20110929 Thunderbird/7.0.1
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1320407079-24810-1-git-send-email-koen@dominion.thruhere.net>
	<1320421523.20107.118.camel@ted>
	<9EE60FF1-8F0B-4F49-B807-3CC198A4F24A@dominion.thruhere.net>
In-Reply-To: <9EE60FF1-8F0B-4F49-B807-3CC198A4F24A@dominion.thruhere.net>
Subject: Re: [Patch v3] rootfs_ipk bbclass: special-case base-passwd preinst to run first
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
X-List-Received-Date: Fri, 04 Nov 2011 16:29:54 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

One way to possibly address this is to create a distribution image creation
policy.  (That is how most of the distributions I'm aware of do it..
desktop/server and embedded.)

The policy is generally:

install passwd/group files
install filesystem hierarchy (it's second because it needs uid/gids)
install "everything else"

Something needs to set down the base set of components so the filesystem is sane
before we do the actual package installs and pre/post install scripts for each.

We could make this generic by defining "critical" or "base" or whatever name you
want packages and setting a specific order for these packages.  (The list needs
to kept small, there generally are one or two items that need to be done very
early.)

--Mark


On 11/4/11 11:09 AM, Koen Kooi wrote:
> 
> Op 4 nov. 2011, om 16:45 heeft Richard Purdie het volgende geschreven:
> 
>> On Fri, 2011-11-04 at 12:44 +0100, Koen Kooi wrote:
>>> Preinst are run alphabetically which breaks when e.g. avahi-daemon needs /etc/passwd present.
>>>
>>> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
>>> ---
>>> meta/classes/rootfs_ipk.bbclass |    6 ++++++
>>> 1 files changed, 6 insertions(+), 0 deletions(-)
>>
>> I've merged this to master. I'm not particularly happy about it but
>> right now I can't see a good way to fix this short/medium term.
> 
> RP and discussed this and we're both not happy with it, but no viable other options short/medium term. The idea is to see if we can have opkg run all the preinsts since opkg does dependency resolving nowadays.
> 
> regards,
> 
> Koen
> 
> 
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



