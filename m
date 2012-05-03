Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jason.wessel@windriver.com>) id 1SPtsx-0007vp-HP
	for openembedded-core@lists.openembedded.org;
	Thu, 03 May 2012 13:07:47 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q43Avvg3017939
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 3 May 2012 03:57:58 -0700 (PDT)
Received: from [172.25.32.41] (172.25.32.41) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Thu, 3 May 2012 03:57:57 -0700
Message-ID: <4FA264B4.4080404@windriver.com>
Date: Thu, 3 May 2012 05:57:56 -0500
From: Jason Wessel <jason.wessel@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:11.0) Gecko/20120329 Thunderbird/11.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1335968616-2436-1-git-send-email-jason.wessel@windriver.com>
	<CAMKF1soELbeTS=ZnH3bhUbJkcaUz_sdkhRcykntqc=2jNBcUrg@mail.gmail.com>
	<9295EE6F-5FFA-4FB4-B266-D8F45AAB2351@dominion.thruhere.net>
	<1336034822.30113.47.camel@ted>
	<D8900CA0-6986-4242-8AF1-7A65CC86FDDA@dominion.thruhere.net>
In-Reply-To: <D8900CA0-6986-4242-8AF1-7A65CC86FDDA@dominion.thruhere.net>
X-Enigmail-Version: 1.4.1
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [PATCH] qemu-native: depend on unfs-server-native
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
X-List-Received-Date: Thu, 03 May 2012 11:07:48 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 05/03/2012 05:39 AM, Koen Kooi wrote:
> 
> Op 3 mei 2012, om 10:47 heeft Richard Purdie het volgende geschreven:
> 
>>
>> The point of these is to trigger them to build whenever a qemu image is
>> built. This makes a lot of sense in some use cases, it also does not
>> make sense in some other cases and it is not possible for the system to
>> mind read and tell the difference.
> 
> What about having the runqemu* scripts call bitbake to build the -native helpers when they are missing? 
> 

Clearly this works from the usability angle of keeping a minimal number of steps, but there are two side effects because it is implemented as a "if helper binary exists ; then bitbake ...".  

1) Everything you need to get started was not really there after completing the build
2) If the qemu helpers are updated they will not get rebuilt when you run your typical rebuild
    *** NOTE I realize that this probably does not happen too often, but it is a possibility

I would certainly not want bitbake to run each time you invoke runqemu to check if it is updated because that unnecessarily delays the start of the simulator.  It would seem to me the best approach is to use Richard's idea so as to allow folks to not build the helpers if someone really doesn't want them, as well as have runqemu auto build the helpers if they are not there so as to keep the use cases simple.

Respectfully,
Jason.


