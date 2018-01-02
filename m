Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 3FFDA71B50
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Jan 2018 22:45:39 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w02Mjckq004293
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Tue, 2 Jan 2018 22:45:40 GMT
Message-ID: <1514933138.5525.101.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Joe Slater <jslater@windriver.com>,
	openembedded-core@lists.openembedded.org
Date: Tue, 02 Jan 2018 22:45:38 +0000
In-Reply-To: <20180102200049.44793-1-jslater@windriver.com>
References: <20180102200049.44793-1-jslater@windriver.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH 1/1] allarch: do not set baselib
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
X-List-Received-Date: Tue, 02 Jan 2018 22:45:40 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2018-01-02 at 12:00 -0800, Joe Slater wrote:
> postinstall scripts may run target binaries and need to know
> where shared libraries are.
> 
> Signed-off-by: Joe Slater <jslater@windriver.com>
> ---
>  meta/classes/allarch.bbclass | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/meta/classes/allarch.bbclass b/meta/classes/allarch.bbclass
> index 51ba509..3749328 100644
> --- a/meta/classes/allarch.bbclass
> +++ b/meta/classes/allarch.bbclass
> @@ -11,9 +11,8 @@ python () {
>          # No need for virtual/libc or a cross compiler
>          d.setVar("INHIBIT_DEFAULT_DEPS","1")
>  
> -        # Set these to a common set of values, we shouldn't be using them other that for WORKDIR directory
> -        # naming anyway
> -        d.setVar("baselib", "lib")
> +        # Set these to a common set of values, we shouldn't be using them other than for WORKDIR directory
> +        # naming anyway.  Do not set baselib because postinstall may need to know where shared libraries are.
>          d.setVar("TARGET_ARCH", "allarch")
>          d.setVar("TARGET_OS", "linux")
>          d.setVar("TARGET_CC_ARCH", "none")

Sorry, but I don't think this can work :/.

Do the sstate sig selftests pass with this change?

I appreciate this will make some things "work" but it will mean that
allarch packages rebuild for each architecture or multilib and that
isn't right either.

So we need a better solution here. Why do we need libdir paths to run
binaries anyway? Is this a libexec issue? Perhaps the things in
question shouldn't be allarch?

Cheers,

Richard

