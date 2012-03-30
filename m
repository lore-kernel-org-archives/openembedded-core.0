Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1SDkHR-0008L7-2M
	for openembedded-core@lists.openembedded.org;
	Sat, 31 Mar 2012 00:26:49 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q2UMHhdD008251
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Mar 2012 15:17:43 -0700 (PDT)
Received: from msp-dhcp12.wrs.com (172.25.34.12) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Fri, 30 Mar 2012 15:17:43 -0700
Message-ID: <4F763106.6080302@windriver.com>
Date: Fri, 30 Mar 2012 17:17:42 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6;
	rv:10.0.2) Gecko/20120216 Thunderbird/10.0.2
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <CABcZANnPwgsCz=f8_UhM3TZsBotBZ26FYp5Fbxjq_kYqqBs3cQ@mail.gmail.com>
	<4F762DE1.5070006@windriver.com>
	<CABcZANmEdxCg+rh8utC4Qw+6K1oC=KKZvPY9M0CDvDCatSt4zg@mail.gmail.com>
In-Reply-To: <CABcZANmEdxCg+rh8utC4Qw+6K1oC=KKZvPY9M0CDvDCatSt4zg@mail.gmail.com>
Subject: Re: [RFC] One shared state reuse solution
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
X-List-Received-Date: Fri, 30 Mar 2012 22:26:49 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 3/30/12 5:09 PM, Chris Larson wrote:
> On Fri, Mar 30, 2012 at 3:04 PM, Mark Hatle<mark.hatle@windriver.com>  wrote:
>>
>> We've worked on a similar problem in the past.  In specific cases we've
>> added a checksum of the host's glibc to the mix.  The problem we were
>> solving was in glibc uprevs during the RHEL 4 world.. new APIs would arrive
>> and things would break -- or workaround would break.
>>
>> Have you considered adding that to the mix in an attempt to help determine
>> compatible host distributions?
>
> It's been discussed in the past, but the problem is, as far as I know,
> glibc isn't the only build host dependency we have. It's the most
> visible, since glibc versioned symbols are the first place one
> generally sees this sort of failure, but I think the safe bet is to
> operate based upon the distro name/version, to avoid any potential
> other compatibility issues with other host libraries that get linked
> against. It'd be nice to ensure that glibc is the only dependency, at
> which point that sort of approach would be more reliable, but I don't
> think we're there yet (please correct me if I'm wrong here).

It would be nice if the host libc was the only dependency.  ;)

Have you run any type of scan on the host dependencies to see where we actually 
sit?  I know a while back I ran a scan and was surprised at how few host 
dependencies there was in a fairly standard oe-core build.

--Mark

>> I do like the idea of directory based sstate cache.  It can more easily
>> identify what the components belong to.  (I wouldn't mind some type of
>> hierarchy for the target stuff as well, but so far I'm not sure exactly it
>> would look like or trigger off of.)
>>
>> However, shy of directory based.. adjusting the generated checksum in some
>> way should be enough -- the downside is how do you detect compatible hosts
>> or not..  You may have to generate multiple checksums and look for best
>> matches, which I suspect is also new code.
>
> What we had before this was just injection of the lsb_release
> identifier/release into the native/cross signatures via vardeps, but
> as you say, dealing with compatible hosts is non-trivial. I'm
> certainly open to that sort of approach, but as you say, I think
> there's other value to this approach, and seems a bit less confusing
> :) Thanks for the comments, it's certainly a non-trivial problem to
> solve.



