Return-Path: <stefan@herbrechtsmeier.net>
Received: from dd41138.kasserver.com (dd41138.kasserver.com [85.13.157.12])
	by mail.openembedded.org (Postfix) with ESMTP id 1D08B7CD42
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Oct 2019 17:03:53 +0000 (UTC)
Received: from [192.168.178.37] (unknown [94.134.94.146])
	by dd41138.kasserver.com (Postfix) with ESMTPSA id 71AEB11A002C;
	Thu, 24 Oct 2019 19:03:53 +0200 (CEST)
To: Jean-Marie LEMETAYER <jean-marie.lemetayer@savoirfairelinux.com>
References: <20191022090353.21151-1-jean-marie.lemetayer@savoirfairelinux.com>
	<8e660284b1ece9e66eb47747213e8faafdd99655.camel@linuxfoundation.org>
	<5290bb1a-4cc8-4ed9-8f33-3c8994f06f22@herbrechtsmeier.net>
	<CANNYZj99FATCkw+6V088NkTWm3DEUAcoZaP+XBUR0xZnGeeQdw@mail.gmail.com>
	<22cbc060-0f73-4354-1edb-ca90dbed4d73@herbrechtsmeier.net>
	<850133363.532592.1571930016322.JavaMail.zimbra@savoirfairelinux.com>
From: Stefan Herbrechtsmeier <stefan@herbrechtsmeier.net>
Message-ID: <d0305038-65f7-6809-da7f-2c4f7b421602@herbrechtsmeier.net>
Date: Thu, 24 Oct 2019 19:03:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <850133363.532592.1571930016322.JavaMail.zimbra@savoirfairelinux.com>
Cc: paul eggleton <paul.eggleton@linux.intel.com>,
	Savoir-faire Linux Rennes <rennes@savoirfairelinux.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [RFC][PATCH 0/6] NPM refactoring
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
X-List-Received-Date: Thu, 24 Oct 2019 17:03:54 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi Jean-Marie,

Am 24.10.19 um 17:13 schrieb Jean-Marie LEMETAYER:
> Hi Stefan,
> 
> On Oct 24, 2019, at 2:40 PM, Stefan Herbrechtsmeier stefan@herbrechtsmeier.net wrote:
>> Fist we should use 'npm ci' instead of 'npm install'.
> 
> Thanks for the tips, I did not know about the 'npm ci' command. Sadly it fails to handle '--global' installation. The 'npm pack && npm install' trick is much more efficient as explain in this commit:
>    https://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=d38e1e2c2ea4646b34ea6282d3d7620df5b0374b

Okay.

> 
>> How would you handle prebuild binaries? Would you disable prebuild binaries?
> 
> I have no case of using prebuild binaries. Can you give me an example of a package using prebuild?

The pouchdb package have some dependencies with prebuild binaries.

> 
>> How would you handle native packages (ex. angular-cli)?
> 
> Like this (this a part of the next patchset to support angular):
> 
>    $ cat meta-oe/recipes-devtools/angular-cli/angular-cli_8.3.12.bb
>    SUMMARY = "CLI tool for Angular"
>    HOMEPAGE = "https://github.com/angular/angular-cli"
>    LICENSE = "MIT"
>    LIC_FILES_CHKSUM = "file://LICENSE;md5=dc2a37e472c366af2a7b8bd0f2ba5af4"
>    SRC_URI = "npm://registry.npmjs.org;name=@angular/cli;version=${PV}"
>    S = "${WORKDIR}/npm"
>    inherit npm
>    NPM_SHRINKWRAP = "${THISDIR}/${BPN}/npm-shrinkwrap.json"
>    BBCLASSEXTEND = "native"

You don't set the SRC_URI checksum? How you ensure that the server 
didn't change the package?

How you use this package and how you handle other dependencies? How you 
build an angular application?

>> How would you patch dependencies?
> 
> I am not sure that it is managed in the actual implementation. I believe that the interest is limited.

This is needed if you use packages with c code.

Regards
   Stefan


