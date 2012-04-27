Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1SNpG0-0004PO-5w
	for openembedded-core@lists.openembedded.org;
	Fri, 27 Apr 2012 19:47:00 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q3RHbIiG005363
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 27 Apr 2012 10:37:18 -0700 (PDT)
Received: from msp-dhcp12.wrs.com (172.25.34.12) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Fri, 27 Apr 2012 10:37:18 -0700
Message-ID: <4F9AD94D.70903@windriver.com>
Date: Fri, 27 Apr 2012 12:37:17 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6;
	rv:12.0) Gecko/20120420 Thunderbird/12.0
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <1335470063.20130.32.camel@ted> <4F99B139.5040103@windriver.com>
	<1335546598.20130.113.camel@ted>
In-Reply-To: <1335546598.20130.113.camel@ted>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: package_rpm.bbclass: Replace shell provides/requires script with python version
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
X-List-Received-Date: Fri, 27 Apr 2012 17:47:00 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 4/27/12 12:09 PM, Richard Purdie wrote:
> On Thu, 2012-04-26 at 15:34 -0500, Mark Hatle wrote:
>> On 4/26/12 2:54 PM, Richard Purdie wrote:
>>> The existing shell script is a fork bomb and forks off hundreds of
>>> grep/cur/wc calls as it reads from its input stream and iterates over
>>> the file data table for each line of input. This patch replaces the
>>> shell code with python code which doesn't exec anything and hence runs
>>> much faster without the exec() overhead. This speeds up rpm packaging
>>> considerably, as can be measured simply by timing it, or watching the
>>> processor utilisation.
>>
>> Just an FYI, the intent was to replace this code completely with a patch to RPM
>> when it got upgraded.  Then RPM could read in the dependencies directly and not
>> have to worry about hacky script solutions.
>>
>> Needless to say we're not yet at that point, so this is fine..  but hopefully
>> we're getting closer.
>
> I agree with the objective. I've had the patch lying around for a while
> and in use in my builds so it was already written and doesn't seem to
> regress anything. It seems to make sense to include it for now until the
> rpm upgrade happens and we fix things properly.
>
> The patch also has a partner in crime:
>
> http://git.yoctoproject.org/cgit.cgi/poky-contrib/commit/?h=rpurdie/t2&id=c0cbf016f59b06f461961df4d6cdfcd0928c96ee
>
> but I suspect you'd dislike that one even if functionally it doesn't
> change much at the moment.

Ya..  this other one sets a bad precedent, even though the functional behavior 
is the same currently.  (There is one odd thing, the lack of the #file stuff in 
the first chunk, I'm surprised anything works since the dependency stuff is 
never translated back to on-disk filename format.)

My longer term intention is to either write out the per-file data directly into 
the spec file so RPM can process it "per-file", or write the data to a data file 
that works along side the .spec file, but again it's only loaded once, instead 
of many times as it currently is.

(The still TODO work of course is do something reasonable in ipkg and deb 
packages that add these missing per-file dependencies.  I suspect we'll be 
limited in many ways because, AFAIK, deb and ipkg can't do dependencies on path 
names.)

--Mark

> Cheers,
>
> Richard
>



