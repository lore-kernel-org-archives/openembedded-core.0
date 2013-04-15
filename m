Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1URlvc-0003iZ-Pf
	for openembedded-core@lists.openembedded.org;
	Mon, 15 Apr 2013 18:07:14 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r3FFnHAB013677
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 15 Apr 2013 08:49:17 -0700 (PDT)
Received: from msp-dhcp4.wrs.com (172.25.34.4) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.342.3;
	Mon, 15 Apr 2013 08:49:17 -0700
Message-ID: <516C2180.7070001@windriver.com>
Date: Mon, 15 Apr 2013 10:49:20 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:17.0) Gecko/20130328 Thunderbird/17.0.5
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <1366024028-24911-1-git-send-email-richard.purdie@linuxfoundation.org>
	<1366024028-24911-8-git-send-email-richard.purdie@linuxfoundation.org>
	<516C19C6.9080807@windriver.com> <1366040453.8670.66.camel@ted>
In-Reply-To: <1366040453.8670.66.camel@ted>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 7/7] allarch: Drop various problematic allarch usages
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
X-List-Received-Date: Mon, 15 Apr 2013 16:07:26 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 4/15/13 10:40 AM, Richard Purdie wrote:
> On Mon, 2013-04-15 at 10:16 -0500, Mark Hatle wrote:
>> On 4/15/13 6:07 AM, Richard Purdie wrote:
>>> In each of these cases allarch is used where the package in question has a
>>> dependency on things which are not allach and change when MACHINE is changed.
>>>
>>> This leads to a rebuild of the package each time MACHINE is switched and
>>> the sstate checksum changes. The dependencies in question are not suited
>>> be being marked as ABISAFE.
>>
>> In each of these cases, does the contents of the package change when the MACHINE
>> (or something in that machine) are modified?  If so, I agree they are definitely
>> not allarch.
>
> The contents does not, the sstate checksum however does due to the
> dependencies. The dependencies are thinks like gtk+ and dbus.
>
>> However, if the dependency really doesn't matter, then why isn't ABISAFE correct
>> in each case?
>
> I'm using ABISAFE in this context as shorthand for
> SIGGEN_EXCLUDERECIPES_ABISAFE and those are defined as things which
> don't need to rebuild if the dependency changes.

So this can't be set on a package specific basis?  If that is the case, it may 
make sense to look into a recipe specific way of declaring a 'lack' of 
dependency on rebuilding others in the future.

> gtk+ and dbus both provide libraries and we do want software to rebuild
> if they change. In the allarch case we could whitelist the dependency
> however in the general case we shouldn't.

Ya I agree, I thought it could be done easily on a per-package basis.

> Even with that problem addressed somehow, it leaves an issue with ipk
> multilibs where the distcc-config allarch recipe would always depend
> upon "distcc" and hence distcc would get pulled into the image,
> regardless of any other multilib settings (which in turn pulls in gtk+
> for example). A "lib64-xxx-image" would therefore end up with near
> enough two copies of half the system due to this. This is something we
> really need to fix in the opkg implementation of multilibs but I have no
> idea how.

This is more then just a problem in opkg, it may be more evident there.. but it 
is something we should look into as well.

> Combine the two issues together, neither of which can be addressed at
> this point of the release cycle and I put the above patch forwards until
> we can better resolve this.
>
> Cheers,
>
> Richard
>
>



