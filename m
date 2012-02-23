Received: from mail.dream-property.net ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1S0c4D-0006kj-A0
	for openembedded-core@lists.openembedded.org;
	Thu, 23 Feb 2012 18:02:53 +0100
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id DE9BF315942A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Feb 2012 17:54:32 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id v-3rRDoytmqg
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Feb 2012 17:54:22 +0100 (CET)
Received: from [172.22.22.61] (drms-590ed8a0.pool.mediaWays.net
	[89.14.216.160])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id 2891B3159419
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Feb 2012 17:54:22 +0100 (CET)
Message-ID: <4F466F3D.8060504@opendreambox.org>
Date: Thu, 23 Feb 2012 17:54:21 +0100
From: Andreas Oberritter <obi@opendreambox.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.2) Gecko/20120216 Thunderbird/10.0.2
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <4F4645CC.4050403@opendreambox.org>
	<20120223140409.GT3769@jama.jama.net>
In-Reply-To: <20120223140409.GT3769@jama.jama.net>
Subject: Re: bug in recipe version priorities across layers?
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
X-List-Received-Date: Thu, 23 Feb 2012 17:02:53 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 23.02.2012 15:04, Martin Jansa wrote:
> Afaik latest version from layer with highest priority wins. Which
> doesn't always mean latest version globally.
> 
> DEFAULT_PREFERENCE doesn't help e.g. to demote development version in some
> layer with higher priority.
> 
> But PREFERRED_VERSION does work.

Thanks, Martin! I didn't expect that, but it's an explanation. Is this 
documented somewhere? I think OE-classic behaved differently.

I noticed that "bitbake-layers show-overlayed" nicely prints the 
available versions in order of preference. For some packages, I don't 
understand the ordering though, e.g.:

python-setuptools:
  meta-oe              0.6c11-ml3
  meta                 0.6c11-ml3
python-setuptools-native:
  meta                 0.6c11-ml3
  meta-oe              0.6c11-ml3

(I modified bitbake-layers to include PR in its output)

The diff between both layers looks like this:

--- openembedded-core/meta/recipes-devtools/python/python-setuptools_0.6c11.bb	2012-01-18 15:05:39.876945863 +0100
+++ meta-openembedded/meta-oe/recipes-devtools/python/python-setuptools_0.6c11.bb	2012-01-18 15:10:23.816943155 +0100
@@ -29,3 +29,5 @@
 SRC_URI[sha256sum] = "630fea9b726320b73ee3ca6ff61732cb32675b0389be658080fe46383b87a1d3"
 
 BBCLASSEXTEND = "native"
+
+NATIVE_INSTALL_WORKS = "1"
---

The only occurence of python-setuptools(-native) is:
meta/classes/setuptools.bbclass:DEPENDS += "python-setuptools-native"

Another strange one, this time with unequal versions:

mpfr:
  meta-oe              3.0.0-r4
  meta                 3.1.0-r0
mpfr-native:
  meta                 3.1.0-r0
  meta-oe              3.0.0-r4

Would lowering the priority of meta-openembedded affect its ability to
bbappend OE-core's recipes? Is it possible to lower its priority, or to
raise the priority of OE core, without modifying conf/layer.conf in
either layer?

Regards,
Andreas

>> - The older wpa-supplicant is provided for a different machine.
>> - Both bitbake and openembedded-core are from today's master branches.
>>
>> The problem: The machine I'm building for also picks up version 0.5.10, 
>> unless I eiher copy 0.7.3 from openembedded-core to my layer or delete 
>> version 0.5.10 from my layer. Deleting wpa-supplicant_0.7.3.bbappend 
>> doesn't change the behaviour.



