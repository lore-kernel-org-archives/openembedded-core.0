Return-Path: <lukas.bulwahn@oss.bmw-carit.de>
Received: from linuxmail.bmw-carit.de (mail.bmw-carit.de [62.245.222.98])
	by mail.openembedded.org (Postfix) with ESMTP id 5C3186DEC8
	for <openembedded-core@lists.openembedded.org>;
	Sun,  8 Dec 2013 21:36:30 +0000 (UTC)
Received: from [192.168.101.5] (afplatform.bmw-carit.intra [192.168.101.5])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: lukas.bulwahn)
	by linuxmail.bmw-carit.de (Postfix) with ESMTPSA id 7E9F740058;
	Sun,  8 Dec 2013 21:05:43 +0100 (CET)
Message-ID: <52A4E64C.4060000@oss.bmw-carit.de>
Date: Sun, 08 Dec 2013 22:36:12 +0100
From: Lukas Bulwahn <lukas.bulwahn@oss.bmw-carit.de>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: Khem Raj <raj.khem@gmail.com>, 
 openembedded-core@lists.openembedded.org
References: <1386380546-13936-1-git-send-email-raj.khem@gmail.com>
In-Reply-To: <1386380546-13936-1-git-send-email-raj.khem@gmail.com>
Subject: Re: [PATCH] boost: Convert ??= weaker assingment to weak ?= assignment
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
X-List-Received-Date: Sun, 08 Dec 2013 21:36:32 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi Khem,

On 12/07/2013 02:42 AM, Khem Raj wrote:
> ??= does not react at all with
> BOOST_LIBS += "${@base_contains('PACKAGECONFIG', 'python', 'python', '', d)}"
>
> even though we have
>
> PACKAGECONFIG ??= "" it does not honor it and always add python to
> BOOST_LIBS but the dependency is not added so it fails to build
> complaining for missing python headers which is a understood outcome
I tried bitbaking boost and all the recipes in the meta-ros layer (which 
uses boost heavily) with
1.) only the boost setup in OE-core and no boost.bbappend, and then also
2.) with a boost.bbappend with PACKAGECONFIG = "python" (as currently 
set in meta-ros).

However, I could not reproduce the problem you are reporting.
With the current state, everything works on my own machine.

I did the builds on fresh directories, and with the current HEADs:
BB_VERSION        = "1.21.0"
BUILD_SYS         = "x86_64-linux"
NATIVELSBSTRING   = "Fedora-18"
TARGET_SYS        = "x86_64-oe-linux"
MACHINE           = "qemux86-64"
DISTRO            = "nodistro"
DISTRO_VERSION    = "nodistro.0"
TUNE_FEATURES     = "m64"
TARGET_FPU        = ""
meta              = "master:4a562fd2614bb6ccce1222d47b9268d6980cf315"
meta-oe           = "master:9b3e284c58bce673801ca3649b53bc53797ce2e9"

and my bitbake repository is at 73ddf1a3d1c516ad3bc785e0413483e616ce07a8.

What's your configuration and how does it differs from mine?

Lukas

