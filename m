Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id BDD357869E
	for <openembedded-core@lists.openembedded.org>;
	Sat, 13 Jan 2018 17:14:56 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w0DHErWB030330
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Sat, 13 Jan 2018 17:14:54 GMT
Message-ID: <1515863693.29722.161.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Paulo Neves <ptsneves@gmail.com>, openembedded-core@lists.openembedded.org
Date: Sat, 13 Jan 2018 17:14:53 +0000
In-Reply-To: <1515779154-17898-1-git-send-email-ptsneves@gmail.com>
References: <1515779154-17898-1-git-send-email-ptsneves@gmail.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Cc: Paulo Neves <paulo.de_sousa_neves@nokia.com>
Subject: Re: [PATCH] Fix COMPATIBLE_MACHINE for -native recipe variants.
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
X-List-Received-Date: Sat, 13 Jan 2018 17:14:57 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2018-01-12 at 18:45 +0100, Paulo Neves wrote:
> From: Paulo Neves <paulo.de_sousa_neves@nokia.com>
> 
> Hello I am having a problem where I want a recipe, along
> with its -native version to only be available when allowed
> by compatible machine.
> 
> In the non native case, COMPATIBLE_MACHINE is correctly
> honored. But in the -native version the COMPATIBLE_MACHINE
> is not honored because in the native.bbclass there is:
> 
> MACHINEOVERRIDES = ""
> 
> This change was introduced in
> d09e6d883042e5d094cd08d829327c4bbbfae135.
> While the explanation provided by the commit is accurate for
> specific case mentioned it also breaks the
> COMPATIBLE_MACHINE mechanism which relies on the
> MACHINEOVERRIDES variable.
> 
> Further evidence that this was not intended is that the
> exception text is false:
> 
> ERROR: Nothing PROVIDES 'x-filter-native'
> x-filter-native was skipped: incompatible with machine m1
> (not in COMPATIBLE_MACHINE)
> 
> And the x-filter-native'.bb recipe header contains:
> 
> COMPATIBLE_MACHINE = "^m1$"
> 
> So the exception uses ${MACHINE} to report that a
> ${MACHINEOVERRIDE} was not matched with the
> COMPATIBLE_MACHINE, which is a false statement.

This will cause other problems and there is actually a reason this is
breaking. Native recipes should be completely target independent and
not depend on MACHINE at all.

Why can't you always have the native version available? It will only
get built if something actually depends on it...

FWIW I think your change will add a MACHINE dependency to the code and
then trigger sstate tests to fail (which check native recipes don't
depend on machine).

Cheers,

Richard

