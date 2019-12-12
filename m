Return-Path: <mac@mcrowe.com>
Received: from avasout01.plus.net (avasout01.plus.net [84.93.230.227])
	by mail.openembedded.org (Postfix) with ESMTP id A92ED7F87C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Dec 2019 16:06:02 +0000 (UTC)
Received: from deneb ([80.229.24.9]) by smtp with ESMTP
	id fQyTi4kfjSXPqfQyViQnVJ; Thu, 12 Dec 2019 16:06:03 +0000
X-Clacks-Overhead: "GNU Terry Pratchett"
X-CM-Score: 0.00
X-CNFS-Analysis: v=2.3 cv=U/js8tju c=1 sm=1 tr=0
	a=E/9URZZQ5L3bK/voZ0g0HQ==:117 a=E/9URZZQ5L3bK/voZ0g0HQ==:17
	a=kj9zAlcOel0A:10 a=pxVhFHJ0LMsA:10 a=hKLYZ_COHi_2g06DLVcA:9
	a=CjuIK1q_8ugA:10
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mcrowe.com; 
	s=20191005;
	h=Content-Type:MIME-Version:Message-ID:Subject:To:From:Date:
	Sender:Reply-To:CC:Content-Transfer-Encoding:Content-ID:Content-Description:
	In-Reply-To:References; bh=+3avBP2PRIRt5ZzFGOVa+25NC4/t+ms4d2SM134jmuM=;
	b=I7
	3wZdx4SIB2X5UnI4/mZ7ExIBs5CNvTUeYKRRm/Hy35T/Xds79qz+7SsgDJDx0jTkjl5q9HCe3m/lN
	pgcgKfJE/8kkk5vWJ2hnkm6INEgvZrPUUHJwwvl+E2TgBRaCy3hPis3rgVdecCeUiFefNR6/rv3aU
	AngLISDEd0gsp4gf7hC4M6/p21bGlqMOIuklWmm1KxZml8ZXObl1mXlLmzdmFT1SGWKrhCAcJhExo
	zYcs5OQIWJNtjz8OyNHbJvjpp+/l7WR8QQogXy5ZBcbxLBpRcjXAaxy0sJwoVQZvvNZQyuiPqQvf8
	+j1NhqYqxV2NBFDXUYdRlJWnS6U/AUgQ==;
Received: from mac by deneb with local (Exim 4.92)
	(envelope-from <mac@mcrowe.com>) id 1ifQyT-00052o-RY
	for Openembedded-core@lists.openembedded.org;
	Thu, 12 Dec 2019 16:05:57 +0000
Date: Thu, 12 Dec 2019 16:05:57 +0000
From: Mike Crowe <mac@mcrowe.com>
To: "Openembedded-core@lists.openembedded.org"
	<Openembedded-core@lists.openembedded.org>
Message-ID: <20191212160557.GA9981@mcrowe.com>
MIME-Version: 1.0
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Envelope: MS4wfPpq8lG6w4qwOKEjcrdREmYFNUC1ZIJosVIRsZPFezti2UZk/4Ya7gwpJwA1rR7n8l7ChESU2+lq26lPdn9b6M5oMXbNC4qWz6znIgo09E/d6VnLDKsu
	FoPcs0jH6Kj+jdOWEt4kutraqLB73NyOakXkSoEMJdwMzfDxxbwY2RmS
Subject: Use of multilib.conf taints hashes of -native recipes
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
X-List-Received-Date: Thu, 12 Dec 2019 16:06:04 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

We compile for a variety of machines, some of which require multilib.conf
and some that do not. I was surprised to discover when switching between
machines that the do_populate_sysroot_setscene tasks run for many -native
recipe. :(

It looks like this is because RECIPE_SYSROOT changes:

 Variable RECIPE_SYSROOT value changed from '${WORKDIR}/recipe-sysroot' to '${WORKDIR}/${MLPREFIX}recipe-sysroot'

This problem goes away if I add the following line to native.bbclass:

 RECIPE_SYSROOT = "${WORKDIR}/recipe-sysroot"

but this feels like I'm solving the problem in the wrong place. Would it be
better to modify multilib.conf to say something like:

 RECIPE_SYSROOT_class-target = "${WORKDIR}/${MLPREFIX}recipe-sysroot"

instead? (Although I'm rather worried that this will stop it actually
working.)

Thanks.

Mike.

