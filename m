Return-Path: <angstrom-dev@emagii.com>
Received: from smtprelay-b21.telenor.se (smtprelay-b21.telenor.se
	[195.54.99.212])
	by mail.openembedded.org (Postfix) with ESMTP id D6D656CE9E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Oct 2013 15:59:07 +0000 (UTC)
Received: from ipb2.telenor.se (ipb2.telenor.se [195.54.127.165])
	by smtprelay-b21.telenor.se (Postfix) with ESMTP id 6526EE981A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Oct 2013 17:59:08 +0200 (CEST)
X-SENDER-IP: [83.227.59.84]
X-LISTENER: [smtp.bredband.net]
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: AtseAGFaYVJT4ztUPGdsb2JhbAANTYM/iDWvHYhXAwEBAQE4gxkTASw9FhgDAgECATEaDQgBAbVwhVYBjVOUBgOYCYpCims
X-IronPort-AV: E=Sophos;i="4.93,523,1378850400"; d="scan'208";a="635861884"
Received: from c-543be353.011-39-73746f12.cust.bredbandsbolaget.se (HELO
	[10.175.196.199]) ([83.227.59.84])
	by ipb2.telenor.se with ESMTP; 18 Oct 2013 17:59:08 +0200
Message-ID: <52615ACB.1010203@emagii.com>
Date: Fri, 18 Oct 2013 17:59:07 +0200
From: Ulf Samuelsson <angstrom-dev@emagii.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: Discussion of the angstrom distribution development
	<angstrom-distro-devel@linuxtogo.org>, 
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Issues with PREFERRED_VERSION/PREFERRED_PROVIDER for the kernel
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 18 Oct 2013 15:59:09 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

1. If you define something in the <MACHINE>.conf and in <DISTRO>.conf
     then <DISTRO>.conf has higher priority.
     This is really non-intuitive.

2. If you define a PREFERRED_VERSION which does not have a corresponding 
".bb" file
     you do not get a warning, and the latest PREFERRED_PROVIDER is used.

3. If you define a PREFERRED_PROVIDER which does not have a 
corresponding ".bb" file
     you *do* get a warning, with a list of possible providers, and 
bitbake will bake the
     first in the list.
     It will also bake the *latest* version, even if that provider has a 
PREFERRED_VERSION.

4. If I define PREFERRED_PROVIDER_virtual/kernel = "linux-x"  in 
<machine>.conf,
     bitbake will bake "linux-x" using the latest version

5. If I define PREFERRED_VERSION_virtual/kernel = "3.7.0", this is ignored.

6. If I define PREFERRED_VERSION_linux-x = "3.7.0", this is accepted and 
linux-x_3.7.0.bb is used.

-------------------------------------------
Questions:
     You need to parse <machine>.conf before you parse the DISTRO since
     some things in the distro is machine dependent.

     I.E:  PREFERRED_VERSION_binutils_avr32 = "2.17"

(1) Would it be possible to reparse <machine>.conf
     after DISTRO has been parsed, resetting some stuff, overridden by 
the DISTRO?

(2)  Why no warning, if the PREFERRED_VERSION cannot be found.
     It would be good to have which versions are available.

     For the Beaglebone, you have a linux-mainline_3.7.bb, but if you set

     PREFERRED_VERSION_linux-mainline = "3.7"

     you still get "3.8.13" built, because "linux-mainline_3.7.bb" 
contains PV = "3.7.0"

     A warning would have been helpful!

(3) Why is PREFERRED_VERSION_virtual/kernel accepted without error 
message, but ignored?

(4) If bitbake cannot find a recommended PROVIDER, and selects something 
else,
      why not use the PREFERRED_VERSION if it exists?

BR
Ulf Samuelsson


