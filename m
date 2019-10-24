Return-Path: <jean-marie.lemetayer@savoirfairelinux.com>
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com
	[208.88.110.44])
	by mail.openembedded.org (Postfix) with ESMTP id DAAE97F9B8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Oct 2019 15:13:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 4717A9C0336;
	Thu, 24 Oct 2019 11:13:19 -0400 (EDT)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
	by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavisd-new,
	port 10032)
	with ESMTP id YslgqGVd1a-L; Thu, 24 Oct 2019 11:13:18 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 84A099C041A;
	Thu, 24 Oct 2019 11:13:18 -0400 (EDT)
X-Virus-Scanned: amavisd-new at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
	by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavisd-new,
	port 10026)
	with ESMTP id CYyGzjeFCXM2; Thu, 24 Oct 2019 11:13:18 -0400 (EDT)
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com
	[192.168.48.237])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 46AED9C0336;
	Thu, 24 Oct 2019 11:13:18 -0400 (EDT)
Date: Thu, 24 Oct 2019 11:13:18 -0400 (EDT)
From: Jean-Marie LEMETAYER <jean-marie.lemetayer@savoirfairelinux.com>
To: Stefan Herbrechtsmeier <stefan@herbrechtsmeier.net>
Message-ID: <1593978265.532574.1571929998230.JavaMail.zimbra@savoirfairelinux.com>
In-Reply-To: <bde8a8cd-fdf5-aa20-55e7-db9586f3f5a3@herbrechtsmeier.net>
References: <20191022090353.21151-1-jean-marie.lemetayer@savoirfairelinux.com>
	<20191022090353.21151-2-jean-marie.lemetayer@savoirfairelinux.com>
	<bde8a8cd-fdf5-aa20-55e7-db9586f3f5a3@herbrechtsmeier.net>
MIME-Version: 1.0
X-Mailer: Zimbra 8.8.11_GA_3737 (ZimbraWebClient - GC77 (Linux)/8.8.11_GA_3737)
Thread-Topic: npm.bbclass: refactor the npm class
Thread-Index: dMkOImsKJh+l5amURKj9QCbmAhH4ew==
Cc: paul eggleton <paul.eggleton@linux.intel.com>,
	Savoir-faire Linux Rennes <rennes@savoirfairelinux.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [RFC][PATCH 1/6] npm.bbclass: refactor the npm class
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
X-List-Received-Date: Thu, 24 Oct 2019 15:13:19 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Hi Stefan,

On Oct 24, 2019, at 1:22 PM, Stefan Herbrechtsmeier stefan@herbrechtsmeier.net wrote:
> Am 22.10.19 um 11:03 schrieb Jean-Marie LEMETAYER:
>> Many issues were related to npm dependencies badly handled: package
>> names, installation directories, ... In fact npm is using an install
>> algorithm [1] which is hard to reproduce / anticipate.
> 
> Why do you think it is hard to reproduce?

The previous npm support tried to manage dependencies manually. But it could easily fail. My goal with this refactoring is to actually be able to _use_ npm recipes.

I remember that you are working on a npm refactoring too, but using one recipe per package and handling dependencies using RDEPENDS. To me this will generate a lot of work to create the recipes. For instance a basic angular application gathers more than thousands of dependencies and thus would lead to thousands of recipes. The work needed to create and maintain all those recipes is huge.

>> Moreover some
>> npm packages use scopes [2] which adds more complexity.
> 
> The addition complexity is limited.

You are right but this case was not handled in the previous npm support and is now supported.

>> The simplest solution is to let npm do its job. Assuming the fetcher
>> only get the sources of the package, the class will now run
>> 'npm install' to create a build directory. The build directory is then
>> copied wisely to the destination.
> 
> You use an full-blown package manager which total different design goals
> and no understanding for embedded / restricted systems.

This patchset save more memory space on the target than the actual implementation as all the build artifacts are removed. So I believe that it is suitable for embedded restricted systems.

>> +    # Finally install and build the tarball package in ${B}.
>> +    local NPM_INSTALL_ARGS="${NPM_INSTALL_ARGS} --loglevel silly"
>> +    local NPM_INSTALL_ARGS="${NPM_INSTALL_ARGS} --prefix=${B}"
>> +    local NPM_INSTALL_ARGS="${NPM_INSTALL_ARGS} --global"
>> +
>> +    if [ "${NPM_INSTALL_DEV}" != 1 ]
>> +    then
>> +        local NPM_INSTALL_ARGS="${NPM_INSTALL_ARGS} --production"
>> +    fi
>> +
>> +    local NPM_INSTALL_GYP_ARGS="${NPM_INSTALL_GYP_ARGS} --arch=${NPM_ARCH}"
>> +    local NPM_INSTALL_GYP_ARGS="${NPM_INSTALL_GYP_ARGS}
>> --target_arch=${NPM_ARCH}"
>> +    local NPM_INSTALL_GYP_ARGS="${NPM_INSTALL_GYP_ARGS} --release"
>> +
>> +    cd ${WORKDIR} && npm install \
> 
> Why you don't use "npm ci"?

Thanks for the tips, I did not know about the 'npm ci' command. Sadly it fails to handle '--global' installation. The 'npm pack && npm install' trick is much more efficient as explain in this commit:
  https://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=d38e1e2c2ea4646b34ea6282d3d7620df5b0374b

Regards,
Jean-Marie

