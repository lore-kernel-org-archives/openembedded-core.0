Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 875E360B9B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jan 2014 15:15:22 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s0AFFGqQ028829; Fri, 10 Jan 2014 15:15:16 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id Woc4UHv8K_L8; Fri, 10 Jan 2014 15:15:16 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s0AFFDwB028825
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT);
	Fri, 10 Jan 2014 15:15:14 GMT
Message-ID: <1389366908.19102.223.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: David =?ISO-8859-1?Q?Nystr=F6m?= <david.c.nystrom@gmail.com>
Date: Fri, 10 Jan 2014 15:15:08 +0000
In-Reply-To: <1389365286-4830-1-git-send-email-david.nystrom@enea.com>
References: <1389365286-4830-1-git-send-email-david.nystrom@enea.com>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] Revert "cross-canadian: Handle powerpc linux verses linux-gnuspe"
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
X-List-Received-Date: Fri, 10 Jan 2014 15:15:25 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Fri, 2014-01-10 at 15:48 +0100, David Nyström wrote:
> The reverted commit seems to introduce some problems for the toolchain tarball
> for powerpc.
> I see this both in master and on dora.
> 
> 1. Looks like the relocation scripts fails for environments:
> 
> ~/tests/poky [master]
> $ cat /opt/oel/2014-01-01/environment-setup-ppce500v2-oel-linux | grep "#"
> export SDKTARGETSYSROOT=##SDKTARGETSYSROOT##
> 
> ~/tests/poky [master]
> $ cat /opt/oel/2014-01-01/environment-setup-ppce500v2-oel-linux-gnuspe | grep "#"
> 
> 2. nativeSDK gnuspe compiler does not allow -mabi=spe
> ABIEXTENSION is zeroed both for linux-gnuspe and linux
> 
> 3. Compiler can't create executables.
> I think this is due to libgcc_s.so from the SDK target sysroot is in mabi=spe.
> 
> 4. -mspe is included in CC var for both linux and gnuspe.
> cat /opt/oel/2014-01-01/environment-setup-ppce500v2-oel-linux | grep mabi
> export CC="powerpc-oel-linux-gcc  -m32 -mcpu=8548 -mabi=spe -mspe ....
> export CXX="powerpc-oel-linux-g++  -m32 -mcpu=8548 -mabi=spe -mspe ....
> export CPP="powerpc-oel-linux-gcc -E  -m32 -mcpu=8548 -mabi=spe -mspe ....
> 
> With the commit reverted, I can successfully build target code with the canadian compiler 
> from the SDK tarball. Only the gnuspe environment file is generated.

Ok, so how do you propose we fix the issues the patch was added to
address?

Cheers,

Richard


