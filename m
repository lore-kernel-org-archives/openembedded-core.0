Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1U8uKl-0005gT-GP
	for openembedded-core@lists.openembedded.org;
	Fri, 22 Feb 2013 16:14:48 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 22 Feb 2013 06:58:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,717,1355126400"; d="scan'208";a="294663351"
Received: from lpalcu-linux (HELO [10.237.105.165]) ([10.237.105.165])
	by fmsmga002.fm.intel.com with ESMTP; 22 Feb 2013 06:58:31 -0800
Message-ID: <51278797.5090109@intel.com>
Date: Fri, 22 Feb 2013 16:58:31 +0200
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <1361361450-30087-1-git-send-email-laurentiu.palcu@intel.com>
	<1361540959.9309.36.camel@ted>
In-Reply-To: <1361540959.9309.36.camel@ted>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] gconf.bbclass: make postinstall fail silently when running offline
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
X-List-Received-Date: Fri, 22 Feb 2013 15:14:53 -0000
X-List-Received-Date: Fri, 22 Feb 2013 15:14:53 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 02/22/2013 03:49 PM, Richard Purdie wrote:
> Just to be clear, I think we need to patch gconf to fix this, there is
> no good reason it shouldn't be handling the + character (unless you've
> found one I don't know about).

I didn't write GConf. I don't know the reason why they chose to declare
the following list of characters invalid:
"\t\r\n\"$&<>,+=#!()'|{}[]?~`;%\\".

I did look in the commit message and found no other explanations except
this:
"gconf/gconf-backend.c: (gconf_address_valid), (gconf_get_backend):
check the backend address doesn't contain any special characters."

Here is the entire commit:
http://git.gnome.org/browse/gconf/commit/?id=3d720f4a0c00af31c1d53fc4aa45d6d6580c433e

OK, let's say I remove '+' from that list. I agree, it doesn't look like
it would have bad consequences but what happens if, in the future, the
path contains another "invalid" character? Where do we draw the line?

> Hiding stderr is a recipe for problems in
> future and we want these postinstalls to run at build time.

There was a patchset on the ML these days that enabled postinstall
output redirection to a certain file. Why not have this activated all
the time for the native dpkg/opkg/rpm and, on request, for the target
binaries? We could inspect the logs in case some postinstalls failed to
run on host but we don't end the build since, maybe, some people would
still be fine with running those postinstalls on target.

Wouldn't this be better?

Thanks,
Laurentiu


