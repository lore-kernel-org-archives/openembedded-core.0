Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 4B26E7274A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Dec 2014 10:47:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	sBNAkexv010440; Tue, 23 Dec 2014 10:46:40 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id dxRgAzcfGa0d; Tue, 23 Dec 2014 10:46:40 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	sBNAkQTM010424
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 23 Dec 2014 10:46:38 GMT
Message-ID: <1419331623.1777.12.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Hongxu Jia <hongxu.jia@windriver.com>
Date: Tue, 23 Dec 2014 10:47:03 +0000
In-Reply-To: <cf0fb5e156cda7ef2fc1a6149432ae441efff2f7.1418293391.git.hongxu.jia@windriver.com>
References: <cover.1418293391.git.hongxu.jia@windriver.com>
	<cf0fb5e156cda7ef2fc1a6149432ae441efff2f7.1418293391.git.hongxu.jia@windriver.com>
X-Mailer: Evolution 3.12.7-0ubuntu1 
Mime-Version: 1.0
Cc: paul.eggleton@linux.intel.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/4] insane.bbclass: add QA check: package-missing
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
X-List-Received-Date: Tue, 23 Dec 2014 10:47:25 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2014-12-11 at 18:27 +0800, Hongxu Jia wrote:
> During packaging, check if there are any dependencies (RDEPENDS)
> on packages that have ended up empty and not produced; and if so
> produce an warn/error as soon as possible, instead of allowing
> the build to proceed up to do_rootfs and then the package manager
> reporting the package as missing.
> 
> At the moment, we use bb.persist_data as a global database to
> collect all available packages rdepends and rprovides. So in the
> do_package_qa task, while package not produced, we could compute
> rdepends chain, and report warn/error immediately.

I liked this until I saw you were using bb.persist_data. That isn't
under sstate control and will not result in deterministic builds.

Have you looked at the data saved by do_packageinfo into the pkgdata
structures? Can we not use the information on RDEPENDS and RPROVIDES
there instead?

Cheers,

Richard


