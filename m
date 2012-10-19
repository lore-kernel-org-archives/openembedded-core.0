Received: from mail.dream-property.net ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1TP9RE-0001PC-Dm
	for openembedded-core@lists.openembedded.org;
	Fri, 19 Oct 2012 12:04:20 +0200
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id DC71835244B2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Oct 2012 11:43:12 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id llELs9dKFrOn
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Oct 2012 11:43:02 +0200 (CEST)
Received: from [172.22.22.61] (unknown [212.255.238.1])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id 113ED315EFB8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Oct 2012 11:43:02 +0200 (CEST)
Message-ID: <508120A5.1050404@opendreambox.org>
Date: Fri, 19 Oct 2012 11:43:01 +0200
From: Andreas Oberritter <obi@opendreambox.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:16.0) Gecko/20121011 Thunderbird/16.0.1
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1350554279-8975-1-git-send-email-yashpal.dutta@freescale.com>
	<508063AF.9030400@linux.intel.com>
	<70CC66F5C30A414DADDA6973E4CA391A70949E@039-SN1MPN1-002.039d.mgd.msft.net>
	<508068BA.8070301@linux.intel.com>
	<70CC66F5C30A414DADDA6973E4CA391A709A30@039-SN1MPN1-002.039d.mgd.msft.net>
In-Reply-To: <70CC66F5C30A414DADDA6973E4CA391A709A30@039-SN1MPN1-002.039d.mgd.msft.net>
Subject: Re: [PATCH] cryptodev kernel module recipe
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
X-List-Received-Date: Fri, 19 Oct 2012 10:04:20 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 19.10.2012 03:47, McClintock Matthew-B29882 wrote:
> On Thu, Oct 18, 2012 at 3:38 PM, Darren Hart <dvhart@linux.intel.com> wrote:
>>>>> +EXTRA_OEMAKE='KERNEL_DIR="${STAGING_KERNEL_DIR}" PREFIX="${D}"'
>>>>
>>>> modules.bbclass already sets KERNEL_PATH and KERNEL_SRC, perhaps you
>>>> could use one of those?
>>>
>>> cryptodev Makefile does not use these it uses KERNEL_DIR in it's
>>> Makefile for whatever reason. Getting an upstream project to change is
>>> more difficult.
>>
>> I think this is the second reference to KERNEL_DIR in an external module,
>> perhaps module.bbclass should add that to it's list of predefined names for
>> the STAGING_KERNEL_DIR.
> 
> Fine with me, but not sure how its worth it quite yet...

I don't think we should add more privately defined variables to
module.bbclass.

I'd rather use something like the following as the default, which should
work for all recipes where ${S} points to the directory containing the
top-level Kbuild file and is independent of those variables:

do_compile() {
        unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS
        oe_runmake -C "${STAGING_KERNEL_DIR}" SUBDIRS="${S}" modules
}
do_install() {
        unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS
        oe_runmake -C "${STAGING_KERNEL_DIR}" SUBDIRS="${S}"
DEPMOD="echo" INSTALL_MOD_PATH="${D}" modules_install
}

That's not an option for cryptodev, though, because unlike most recipes
inheriting module.bbclass, cryptodev not only installs modules, but also
header files.

Regards,
Andreas


