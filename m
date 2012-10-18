Received: from ch1ehsobe005.messaging.microsoft.com ([216.32.181.185]
	helo=ch1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1TOtmu-0000gc-5L
	for openembedded-core@lists.openembedded.org;
	Thu, 18 Oct 2012 19:21:40 +0200
Received: from mail231-ch1-R.bigfish.com (10.43.68.235) by
	CH1EHSOBE010.bigfish.com (10.43.70.60) with Microsoft SMTP Server id
	14.1.225.23; Thu, 18 Oct 2012 17:08:20 +0000
Received: from mail231-ch1 (localhost [127.0.0.1])	by
	mail231-ch1-R.bigfish.com (Postfix) with ESMTP id 186BCE40066;
	Thu, 18 Oct 2012 17:08:20 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: -2
X-BigFish: VS-2(zz98dI9371I1432Izz1202h1d1ah1d2ahzz8275dhz2dh2a8h668h839h8e2h8e3hd25hf0ah107ah10d2h1288h12a5h12a9h12bdh137ah13b6h1441hbe9i1155h)
Received: from mail231-ch1 (localhost.localdomain [127.0.0.1]) by mail231-ch1
	(MessageSwitch) id 1350580084294289_10608;
	Thu, 18 Oct 2012 17:08:04 +0000 (UTC)
Received: from CH1EHSMHS014.bigfish.com (snatpool2.int.messaging.microsoft.com
	[10.43.68.239])	by mail231-ch1.bigfish.com (Postfix) with ESMTP id
	09FDEB8009F;	Thu, 18 Oct 2012 17:08:03 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CH1EHSMHS014.bigfish.com
	(10.43.70.14) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Thu, 18 Oct 2012 17:08:02 +0000
Received: from 039-SN1MPN1-002.039d.mgd.msft.net ([169.254.2.88]) by
	039-SN1MMR1-005.039d.mgd.msft.net ([::1]) with mapi id 14.02.0309.003;
	Thu, 18 Oct 2012 17:08:02 +0000
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Thread-Topic: [OE-core] Can we trust to sstate-cache?
Thread-Index: AQHNrVMhu40/NhnfzE6in9RlqjR74w==
Date: Thu, 18 Oct 2012 17:08:01 +0000
Message-ID: <70CC66F5C30A414DADDA6973E4CA391A708801@039-SN1MPN1-002.039d.mgd.msft.net>
References: <508005D9.2060507@linaro.org>
In-Reply-To: <508005D9.2060507@linaro.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [70.112.201.132]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: Can we trust to sstate-cache?
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: McClintock Matthew-B29882 <B29882@freescale.com>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 18 Oct 2012 17:21:40 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <858B2E4F4E922B4D954709EF511A4A44@mgd.freescale.com>
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 18, 2012 at 8:36 AM, Marcin Juszkiewicz
<marcin.juszkiewicz@linaro.org> wrote:
> Today I bumped gcc-linaro from 4.7-r5 to 4.7-r6. First version was plain
> 2012.10 release while second one was tarball from bzr repository with
> huge set of ICE related fixes for AArch64 architecture.
>
> To do fast clean build I removed TMPDIR and started new build of
> core-image-minimal target.
>
> But then I noticed ugly thing:
>
> 0: eglibc-2.16-r18+svnr20393 do_populate_sysroot_setscene (pid 30106)
> 1: eglibc-2.16-r18+svnr20393 do_package_setscene (pid 30107)
> 3: eglibc-initial-2.16-r18+svnr20393 do_package_setscene (pid 28921)
>
> Why eglibc was taken from sstate-cache instead of being rebuilt (like it
> was with 'db')? This makes me sad as it shows that I cannot trust
> sstate-cache so each new build will take hours instead of minutes.
>
> Or maybe I am wrong?

Did the signatures for eglibc change after making your gcc-linaro
change? You can run bitbake -S before and after and see which ones
have new stamps. Then you can start using bitbake-diffsigs to back
track (or presumably if nothing changed add a proper dependency)

-M=



