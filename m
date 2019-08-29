Return-Path: <jonathan.rajotte-julien@efficios.com>
X-Greylist: delayed 571 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 29 Aug 2019 15:37:44 UTC
Received: from mail.efficios.com (mail.efficios.com [167.114.142.138])
	by mail.openembedded.org (Postfix) with ESMTP id 2FAEF7F353
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Aug 2019 15:37:44 +0000 (UTC)
Received: from localhost (ip6-localhost [IPv6:::1])
	by mail.efficios.com (Postfix) with ESMTP id DEFD43154E6;
	Thu, 29 Aug 2019 11:28:14 -0400 (EDT)
Received: from mail.efficios.com ([IPv6:::1])
	by localhost (mail02.efficios.com [IPv6:::1]) (amavisd-new, port 10032)
	with ESMTP id yu_vDCL5CSqu; Thu, 29 Aug 2019 11:28:14 -0400 (EDT)
Received: from localhost (ip6-localhost [IPv6:::1])
	by mail.efficios.com (Postfix) with ESMTP id 88BE63154E3;
	Thu, 29 Aug 2019 11:28:14 -0400 (EDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.efficios.com 88BE63154E3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
	s=default; t=1567092494;
	bh=WMyISCq2z4R9Ng/3bUuOrTS0bBSoo/1zjX63EEAVgYI=;
	h=Date:From:To:Message-ID:MIME-Version;
	b=SX6LBXkHNTSVpOSoBUcQf1Ug3TuLida5+6Wx37k3k2ItGkg5Amu8bziRuz3vSuR5h
	vUB6AnOkojNKnkpe5q8WvJA75AGDk8tqsg3QbzavJrhVjbf+AsSdrMEeY6CIhRBlCi
	9ro6bDf6yck8ZlIt0HXqUp9F3O9GN4zggzTsjh6aQU1cszO71q4qJX7wHcF3occDml
	5KwbYAJGJn19dJg9LU07MqRqccHVF/ukOUkFOysQc0yZeg/fio86xLR3P7sCLQnKE/
	NU1D/gUFnqFjwIjz722RBr0zCvco8E+lcdyoQ36ITe4Yg5EfPQ6av0D5RexuB06Vaa
	d14EZF3fo0OLQ==
X-Virus-Scanned: amavisd-new at efficios.com
Received: from mail.efficios.com ([IPv6:::1])
	by localhost (mail02.efficios.com [IPv6:::1]) (amavisd-new, port 10026)
	with ESMTP id GsgBw4_PNTiQ; Thu, 29 Aug 2019 11:28:14 -0400 (EDT)
Received: from joraj-alpa (192-222-181-218.qc.cable.ebox.net [192.222.181.218])
	by mail.efficios.com (Postfix) with ESMTPSA id 64FD23154DE;
	Thu, 29 Aug 2019 11:28:14 -0400 (EDT)
Date: Thu, 29 Aug 2019 11:28:08 -0400
From: Jonathan Rajotte-Julien <jonathan.rajotte-julien@efficios.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Message-ID: <20190829152736.GA4696@joraj-alpa>
References: <cover.1565796002.git.bruce.ashfield@gmail.com>
	<28547fae8ada44e4f2383f02bd1d8e0f3ce96b52.camel@linuxfoundation.org>
	<CADkTA4MHrS0y7Movz5JSmrFc9dSKCEdOxOwV=dCteNnktibNCg@mail.gmail.com>
	<CADkTA4ONrm_Xtr9Mcdj359m5xqFqzKTzN8bB=VnRn2PKRxP+Wg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CADkTA4ONrm_Xtr9Mcdj359m5xqFqzKTzN8bB=VnRn2PKRxP+Wg@mail.gmail.com>
User-Agent: Mutt/1.9.5 (2018-04-13)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/5] kernel-yocto: misc build / config changes
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
X-List-Received-Date: Thu, 29 Aug 2019 15:37:44 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

> 
> FWIW: lttng-ust builds fine for me with the 5.2 kernel + 5.2 headers,
> it is one of the things I build and test as part of
> core-image-kernel-dev.

Even on ppc?

It seems related to the y2038 safe socket merge
(a98dc6aee784a5daf84a4781dcf02feab9ad5999) from the kernel but from the
code I cannot find a reason why SO_SNDTIMEO would be missing. The powerpc
socket header relies on the generic one for proper backward definition of
SO_SNDTIMEO:

 #define SO_SNDTIMEO (sizeof(time_t) == sizeof(__kernel_long_t) ? SO_SNDTIMEO_OLD : SO_SNDTIMEO_NEW)

Not sure what is going on here.


> I just rebuilt it here this morning and didn't see any errors.

> 
> > >
> > > qemuarm is erroring due to /dev/fb0 disappearing, which is probably kernel?
> > >
> > > https://autobuilder.yoctoproject.org/typhoon/#/builders/53/builds/975
> > > https://autobuilder.yoctoproject.org/typhoon/#/builders/38/builds/976
> > > https://autobuilder.yoctoproject.org/typhoon/#/builders/47/builds/986
> > >
> > > and we also have an unintended side effect multilib build failure:
> > >
> > > https://autobuilder.yoctoproject.org/typhoon/#/builders/44/builds/995
> > >
> > > which might be due to changed dependencies, I need to check into that one further.
> > >
> > > Cheers,
> > >
> > > Richard
> > >
> > >
> >
> >
> > --
> > - Thou shalt not follow the NULL pointer, for chaos and madness await
> > thee at its end
> > - "Use the force Harry" - Gandalf, Star Trek II
> 
> 
> 
> -- 
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II

-- 
Jonathan Rajotte-Julien
EfficiOS

