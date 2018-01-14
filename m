Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 1950878735
	for <openembedded-core@lists.openembedded.org>;
	Sun, 14 Jan 2018 11:27:22 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w0EBRMfG030883
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Sun, 14 Jan 2018 11:27:23 GMT
Message-ID: <1515929241.29722.212.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: =?ISO-8859-1?Q?B=F6sz=F6rm=E9nyi_Zolt=E1n?= <zboszor@pr.hu>,
	openembedded-core@lists.openembedded.org
Date: Sun, 14 Jan 2018 11:27:21 +0000
In-Reply-To: <20180112134659.5793-1-zboszor@pr.hu>
References: <20180112134659.5793-1-zboszor@pr.hu>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH v2] package: Record PE and PR values for shlib dependencies
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
X-List-Received-Date: Sun, 14 Jan 2018 11:27:23 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Fri, 2018-01-12 at 14:46 +0100, Böszörményi Zoltán wrote:
> When downgrading a package or using a substitute with lower version,
> the way to do it is adding or increasing PE and there may be other
> reasons to set PE.
> 
> But it doesn't directly help dependant packages because the shlib
> records only contain PV.
> 
> Let's add the PE value into the shlib records for packages where
> it's set.
> 
> The in-memory variables storing the versions now use the PE:PV
> notation but the on-disk files must use something else because
> the : character is already used as field delimiter in the
> package.list
> files storing the shlib records. Use # instead in the files,
> so the file format doesn't change. Conversion occurs on reading
> and writing the package.list files.

Can you explain a bit more about why/how this causes a problem?

PE is needed to maintain consistency of package feeds but the shlibs
code is primarily used for build time dependency analysis to figure out
which packages need to depend upon what and ensure runtime dependencies
are met. I'm not sure that should care about PE.

For PR, again its primarily for package feeds so that updates are
detected and I'm not sure why the shlibs code should need to care about
it.

Perhaps if you explain more about the issues you're having which this
fixes I'll better understand the problem/need.

Cheers,

Richard


