Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RO5YI-0005UZ-Jr for openembedded-core@lists.openembedded.org;
	Wed, 09 Nov 2011 11:38:42 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pA9AWOHo014263
	for <openembedded-core@lists.openembedded.org>;
	Wed, 9 Nov 2011 10:32:24 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 13639-07 for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Nov 2011 10:32:20 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pA9AWGCh014257
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 9 Nov 2011 10:32:17 GMT
Message-ID: <1320834738.10843.159.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 09 Nov 2011 10:32:18 +0000
In-Reply-To: <20111108143701.GC3641@jama.jama.net>
References: <20111108143701.GC3641@jama.jama.net>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: BB_SIGNATURE_HANDLER = "basichash" unusable strict?
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
X-List-Received-Date: Wed, 09 Nov 2011 10:38:42 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-11-08 at 15:37 +0100, Martin Jansa wrote:
> Today I've started build from scratch and dediced to give basichash a try (as it is supposed to become default IIRC):
> 
> So after cleaning tmpdir, sstate cache, pseudo I've started clean build..
> 
> 1) bitbake -k gcc-cross | tee -a log.${MACHINE}; 
> 2) bitbake -k virtual/kernel | tee -a log.${MACHINE}; 
> 3) bitbake -k core-image-core | tee -a log.${MACHINE}; 
> 4) bitbake -k shr-lite-image  | tee -a log.${MACHINE}; 
> 
> But then I've noticed that after successfull build of gcc-cross in step 1 it started another gcc-* build in step 2..
[...]
> Ah.. yes I did 2 small patches to libxml2 and openssl between step 1 and step2:
> http://patchwork.openembedded.org/patch/14521/
> http://patchwork.openembedded.org/patch/14519/
> 
> But do we want to rebuild everything after every change small like this?

The biggest problem we have here is deciding when to rebuild and when
not to. Can you define when this should/shouldn't happen?

> Or is it configuration issue or just bug in sstate implementation?

I think its behaving as currently configured. Whether that configuration
is right/wrong and what it should be is the question. If we can define
the configuration, we can then work out how to implement it which is a
separate issue.

> Btw libxml2 isn't first difference.. I can dig more..
[...]
> I have few extra patches in my branch so for this particular test case you also need ie
> http://patchwork.openembedded.org/patch/13699/
> 
> But it shouldn't be hard to find similar issue for any other dependency tree (ie with git-native instead of subversion-native).

The situation is currently configurable through:

BB_HASHTASK_WHITELIST ?= "(.*-cross$|.*-native$|.*-cross-initial$|.*-cross-intermediate$|^virtual:native:.*|^virtual:nativesdk:.*)"

however I have to admit looking at the bitbake code handling this its
not that simple.

The code only triggers for recipes which are not matched by the
whitelist. For those not matching, it iterates through their
dependencies and removes anything that matches the expression.

So effectively it only modified target recipes, removes dependencies
matching the above expressions.

This isn't an easy problem and this is reminding me I wanted to revisit
this code. I think we actually need some kind of double expression to
match a regexp against like:

<depender>___<depend>

So we could then do:

REGEXP_NONNATIVE = "(.*-cross|.*-native|.*-cross-initial|.*-cross-intermediate|virtual:native:.*|virtual:nativesdk:.*)"

BB_HASHTASK_WHITELIST ?= "^.(?!${REGEXP_NONNATIVE})___${REGEXP_NONNATIVE}$"

which would function as above but move more of the control into the code.

I was then trying to come up with a further example to extend this but
its not scaling. So lets throw away the idea of using regexps and use
python. Coding off the top of my head, we could have something like:

def filter_dep(depender, depend):
    # Return True if we should keep the dependency, False to drop it
    def isNative(x):
        return x.startswith("virtual:native:") or x.endswith("-native")
    def isCross(x):
        return x.endswith("-cross") or x.endswith("-cross-initial") or x.endswith("-cross-intermediate")
    def isNativeSDK(x):
        return x.startswith("virtual:nativesdk:")

    if isNative(depender) or isCross(depender) or isNativeSDK(depender):
        return True

    # Only target packages beyond here

    if isNative(depend) or isCross(depend) or isNativeSDK(depend):
        return False

    return True

which would then be easy to extend to for example ensure the python
dependency on python-native is kept.

The siggen code was designed to be a plugin so changing it to the above
form isn't the problem. The real problem is deciding what the policy it
implements should be.

So to go back to the original question, out of those changes you made,
which ones would you expect to change the hash and which ones would you
not expect to see changes for?

Cheers,

Richard




