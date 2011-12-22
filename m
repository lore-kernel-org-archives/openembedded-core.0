Received: from ecbiz66.inmotionhosting.com ([69.174.114.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <juraj.hercek@jhksoftware.com>) id 1RdjGQ-00059a-TZ
	for openembedded-core@lists.openembedded.org;
	Thu, 22 Dec 2011 15:04:57 +0100
Received: from mail.hck.sk ([87.197.106.197]:62494 helo=[192.168.66.35])
	by ecbiz66.inmotionhosting.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.69) (envelope-from <juraj.hercek@jhksoftware.com>)
	id 1Rdj9Q-0005XO-8H for openembedded-core@lists.openembedded.org;
	Thu, 22 Dec 2011 08:57:40 -0500
Message-ID: <4EF33750.3030305@jhksoftware.com>
Date: Thu, 22 Dec 2011 14:57:36 +0100
From: Juraj Hercek <juraj.hercek@jhksoftware.com>
User-Agent: Mozilla-Thunderbird 2.0.0.24 (X11/20100328)
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <4EF1F39E.60903@jhksoftware.com> <jct88c$ajb$1@dough.gmane.org>
In-Reply-To: <jct88c$ajb$1@dough.gmane.org>
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - ecbiz66.inmotionhosting.com
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - jhksoftware.com
Subject: Re: meta-toolchain-qte and wrong paths to QT tools
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
X-List-Received-Date: Thu, 22 Dec 2011 14:04:57 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 12/21/2011 07:22 PM, Dmitry Eremin-Solenikov wrote:
> On 12/21/2011 06:56 PM, Juraj Hercek wrote:
>> Hello list,
>>
>> I've two questions:
>>
>> 1) When I build meta-toolchain-qte (c2de8d4 metadata revision) and
>> install the resulting sdk, I see two directories in /usr/local/:
>> oecore-i686-arm and oecore-i686-i686. What is a rationale behind having
>> these two directories instead of one i.e.: oecore-i686-arm?
> 
> Because oecore-i686-i686 holds files that are created on i686 to be used 
> on i686. They will be common for arm meta-toolchain-qte, mips 
> meta-toolchain-qte, powerpc meta-toolchain-qte, etc.

This makes perfect sense. Thank you.

>> 2) The oecore-i686-arm/environment-setup-armv5te-oe-linux-gnueabi script
>> sets paths to the QT tools which should be installed in oecore-i686-arm
>> directory, but they are not. These tools are installed under
>> oecore-i686-i686 directory. Changing the path in
>> environment-setup-armv5te-oe-linux-gnueabi after toolchain installation
>> is easy, but I do not consider it to be a correct fix (assuming that
>> oecore-i686-{arm,i686} directories represents proper toolchain
>> structure). What is a proper fix for this issue?
> 
> I have the attached patch in my patch queue. Hope this helps.

---8<---
-    (cd ${SDK_OUTPUT}/${QT_TOOLS_PREFIX}/..; ln -s 
${SDKTARGETSYSROOT}/usr/share/qtopia/mkspecs mkspecs;)
+    (cd ${SDK_NATIVE_OUTPUT}/${QT_TOOLS_PREFIX}/..; ln -s 
${SDKTARGETSYSROOT}/usr/share/qtopia/mkspecs mkspecs;)
  }
--->8---

I've applied patch but as Eric pointed out earlier, SDK_NATIVE_OUTPUT 
(from the snip above) is not defined anywhere (I've searched the string 
throughout whole oe-core).

Anyways, this snip of code deals with mkspecs, and I am not sure if 
mkspecs should be installed in "i686-arm". My gut feeling would expect 
mkspecs to be in "i686-i686" along with the other QT tools which are 
already in "i686-i686" part.


