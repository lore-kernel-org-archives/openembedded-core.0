Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 1BE477404E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Sep 2015 16:53:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t8GGr4SP001391; Wed, 16 Sep 2015 17:53:04 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 1Z-oVi5R2tgT; Wed, 16 Sep 2015 17:53:04 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t8GGqn7e001367
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 16 Sep 2015 17:53:01 +0100
Message-ID: <1442422369.26666.147.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Randy MacLeod <randy.macleod@windriver.com>
Date: Wed, 16 Sep 2015 17:52:49 +0100
In-Reply-To: <55F8D5CD.70606@windriver.com>
References: <2236FBA76BA1254E88B949DDB74E612B41976CB1@IRSMSX102.ger.corp.intel.com>
	<55EF9D64.8000601@windriver.com>
	<2236FBA76BA1254E88B949DDB74E612B41979490@IRSMSX102.ger.corp.intel.com>
	<55F70A07.20409@windriver.com> <55F8D5CD.70606@windriver.com>
X-Mailer: Evolution 3.12.11-0ubuntu3 
Mime-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: How to put a correct dependency with regards to gcc?
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
X-List-Received-Date: Wed, 16 Sep 2015 16:53:10 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2015-09-15 at 22:37 -0400, Randy MacLeod wrote:
> I haven't been able to come up with a scheme that works yet.
> With the patch below, I get:
> 
> I'll need someone to explain the intent of the gcc-* pkgs
> design or more time to dig though the files and history.
> 
> Robert tells me that my idea that I need a bitbake rule to:
>   " call the parent implementation or
>     if there isn't one, return success."
> has been discussed before and it is not easy to do.
> 
> For me, this is "a nice to have" feature that could wait
> for oe-core-2.1.

The idea is quite simple. Rather than having a copy of the gcc source
for each recipe variant (-cross-initial, -cross, -crosssdk-initial,
-crosssdk, -cross-canadian etc.) we have a single copy of the source.

We tried an older shared stamp scheme which was fragile and prone to
weird failures.  Instead we created the gcc-source recipe which is
responsible for the fetch/unpack/patch/preconfigure and then each recipe
can work off the shared source (and has a dependency on gcc-source).

For Elena's use case, I therefore think it might be better to analyse
the shared source once and not in the case of each recipe (e.g. if
SRC_URI is empty).

Cheers,

Richard




