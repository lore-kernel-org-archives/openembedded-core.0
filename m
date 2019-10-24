Return-Path: <jean-marie.lemetayer@savoirfairelinux.com>
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com
	[208.88.110.44])
	by mail.openembedded.org (Postfix) with ESMTP id 3A0877F9CB
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Oct 2019 15:13:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 60BA89C0336;
	Thu, 24 Oct 2019 11:13:37 -0400 (EDT)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
	by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavisd-new,
	port 10032)
	with ESMTP id iKTcfmgID5ZN; Thu, 24 Oct 2019 11:13:36 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 95B479C041E;
	Thu, 24 Oct 2019 11:13:36 -0400 (EDT)
X-Virus-Scanned: amavisd-new at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
	by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavisd-new,
	port 10026)
	with ESMTP id Cmn_kFg_00T5; Thu, 24 Oct 2019 11:13:36 -0400 (EDT)
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com
	[192.168.48.237])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 555A29C0336;
	Thu, 24 Oct 2019 11:13:36 -0400 (EDT)
Date: Thu, 24 Oct 2019 11:13:36 -0400 (EDT)
From: Jean-Marie LEMETAYER <jean-marie.lemetayer@savoirfairelinux.com>
To: Stefan Herbrechtsmeier <stefan@herbrechtsmeier.net>
Message-ID: <850133363.532592.1571930016322.JavaMail.zimbra@savoirfairelinux.com>
In-Reply-To: <22cbc060-0f73-4354-1edb-ca90dbed4d73@herbrechtsmeier.net>
References: <20191022090353.21151-1-jean-marie.lemetayer@savoirfairelinux.com>
	<8e660284b1ece9e66eb47747213e8faafdd99655.camel@linuxfoundation.org>
	<5290bb1a-4cc8-4ed9-8f33-3c8994f06f22@herbrechtsmeier.net>
	<CANNYZj99FATCkw+6V088NkTWm3DEUAcoZaP+XBUR0xZnGeeQdw@mail.gmail.com>
	<22cbc060-0f73-4354-1edb-ca90dbed4d73@herbrechtsmeier.net>
MIME-Version: 1.0
X-Mailer: Zimbra 8.8.11_GA_3737 (ZimbraWebClient - GC77 (Linux)/8.8.11_GA_3737)
Thread-Topic: NPM refactoring
Thread-Index: 0Ewbt2GN/cq4LXqyO31hdi1WUYY6vg==
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
X-List-Received-Date: Thu, 24 Oct 2019 15:13:36 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Hi Stefan,

On Oct 24, 2019, at 2:40 PM, Stefan Herbrechtsmeier stefan@herbrechtsmeier.net wrote:
> Fist we should use 'npm ci' instead of 'npm install'.

Thanks for the tips, I did not know about the 'npm ci' command. Sadly it fails to handle '--global' installation. The 'npm pack && npm install' trick is much more efficient as explain in this commit:
  https://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=d38e1e2c2ea4646b34ea6282d3d7620df5b0374b

> How would you handle prebuild binaries? Would you disable prebuild binaries?

I have no case of using prebuild binaries. Can you give me an example of a package using prebuild?

> How would you handle native packages (ex. angular-cli)?

Like this (this a part of the next patchset to support angular):

  $ cat meta-oe/recipes-devtools/angular-cli/angular-cli_8.3.12.bb 
  SUMMARY = "CLI tool for Angular"
  HOMEPAGE = "https://github.com/angular/angular-cli"
  LICENSE = "MIT"
  LIC_FILES_CHKSUM = "file://LICENSE;md5=dc2a37e472c366af2a7b8bd0f2ba5af4"
  SRC_URI = "npm://registry.npmjs.org;name=@angular/cli;version=${PV}"
  S = "${WORKDIR}/npm"
  inherit npm
  NPM_SHRINKWRAP = "${THISDIR}/${BPN}/npm-shrinkwrap.json"
  BBCLASSEXTEND = "native"

> How would you patch dependencies?

I am not sure that it is managed in the actual implementation. I believe that the interest is limited.

> How would you remove unneeded files (ex. documentation, examples, source
> code)?

I don't. Only the build files are removed (when using addons). It is not possible to know which files should be kept or deleted.

>> License management should be also handled by npm, and if it isn't, then
>> we need to work with the upstream to address it.
> 
> To my knowledge npm don't check license files. It only reads the license
> in the package.json.

You are right, that's also a reason why the license management needs a rework.

Regards,
Jean-Marie

