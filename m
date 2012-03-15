Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1S8DZU-0007pz-Ix
	for openembedded-core@lists.openembedded.org;
	Thu, 15 Mar 2012 17:30:36 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q2FGLnSO019592
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Mar 2012 09:21:49 -0700 (PDT)
Received: from Macintosh-5.local (172.25.36.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Thu, 15 Mar 2012 09:21:48 -0700
Message-ID: <4F62171B.4060203@windriver.com>
Date: Thu, 15 Mar 2012 11:21:47 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6;
	rv:10.0.2) Gecko/20120216 Thunderbird/10.0.2
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <CAGDS+n=KnzzUvUfv_T5X9yHPtOzQ7cgORh-ZbOJZDbFis9F69Q@mail.gmail.com>
	<1331818796.18586.85.camel@ted>
In-Reply-To: <1331818796.18586.85.camel@ted>
Subject: Re: boost breaks on rebuild
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
X-List-Received-Date: Thu, 15 Mar 2012 16:30:37 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 3/15/12 8:39 AM, Richard Purdie wrote:
> On Wed, 2012-03-14 at 15:28 -0700, Steve Sakoman wrote:
>> NOTE: package boost-1.49.0-r2.0: task do_compile: Failed
>>
>> I don't have a fix for this but wanted to document the failure.
>>
>> As with all the other failures of this type, a -c cleansstate and
>> rebuild is the workaround.
>>
>> It feels to me like there are quite a few recipes that don't handle
>> rebuilds -- I seem to run into a few after every pull.

I've observed the same thing.  There seem to be a lot of packages that once 
they've been configured, compiled and installed, won't rebuild without being 
cleaned in someway.

One suggestion, maybe a new flag for a recipe that says that recipe rebuilds 
need to start from a clean patched tree?  Then if the do_configure -> do_install 
steps have been run, it knows it needs to clean and fetch/unpack/patch before it 
tries to rebuild the component...  (Maybe sstate-cache can help speed this up in 
some way...)

Then over time we can find the items with the flags and attempt to fix them in 
other ways...

--Mark

> Agreed, there is a problem here. I've filed the bug:
>
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=2123
>
> since I think we systematically need to work through these and eradicate
> them.
>
> An alternative to fix some of the compile cases would be to run a "make
> clean" before the make. I suspect this would annoy people and its a
> shame to do that because of a few broken recipes though...
>
> Cheers,
>
> Richard
>
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



