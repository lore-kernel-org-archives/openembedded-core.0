Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id D7D8878C1C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jul 2018 16:14:12 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w6QGE58T019297
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Thu, 26 Jul 2018 17:14:08 +0100
Message-ID: <c8b63914e60f12cb57f569199f82390cbd069931.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>, Jonathan Haigh
	<Jonathan.Haigh@arm.com>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Date: Thu, 26 Jul 2018 17:14:05 +0100
In-Reply-To: <d7450c2b26f644358476ea6ec27717b6@XBOX02.axis.com>
References: <DB5PR08MB0888CF3B2340E729DD3B946193520@DB5PR08MB0888.eurprd08.prod.outlook.com>
	<DB5PR08MB0888B7FFDFD5AA67F818105E93520@DB5PR08MB0888.eurprd08.prod.outlook.com>
	<d7450c2b26f644358476ea6ec27717b6@XBOX02.axis.com>
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.4 at dan
X-Virus-Status: Clean
Cc: Jeremy Johnson <Jeremy.Johnson@arm.com>
Subject: Re: INCOMPATIBLE_LICENSE mechanism
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
X-List-Received-Date: Thu, 26 Jul 2018 16:14:13 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2018-07-26 at 13:16 +0000, Peter Kjellerstedt wrote:
> This is related to a similar problem we are seeing with the use of
> “or” for licenses. We use the archiver.bbclass to export all open
> source code we use. However, for recipes that specify multiple
> licenses using “or”, we would like to specify the one under which we
> are using the code. E.g., if the LICENSE is “GPL-2.0 | Proprietary”,
> we would like to treat the code as “Proprietary”, but when it comes
> to the archiver.bbclass, even if we have told it to ignore packages
> with Proprietary licenses, it will include the package due to the
> alternative GPL-2.0 license.
>  
> The idea we have is to allow to specify a USED_LICENSE (e.g., in a
> bbappend or a separate configuration file), which should take the
> actually used license. This should be verified to be one of the
> allowed licenses specified in LICENSE (in case LICENSE changes and no
> longer allows the chosen license), and after that, LICENSE should be
> treated as if this was the value it had been given. This does,
> however,  not take into account the use of the same package in
> multiple images with different licensing requirements (we only build
> one image so that is not a problem for us).

Just thinking out loud you could have something like a 

gplv3-license-incompatible.inc:

LICENSE_pn-<some-recipe> = "MIT"
LICENSE_pn-<some--other-recipe> = "GPLv2"
INCOMPATIBLE_LICENSE = "GPLv3"

i.e. just force the license of a set of recipes to values known to work
 with GPLv3 exclusion?

Cheers,

Richard

