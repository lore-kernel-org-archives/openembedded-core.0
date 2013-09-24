Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 8D855601D6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Sep 2013 08:24:21 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r8O8d9gP002484; Tue, 24 Sep 2013 09:39:10 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 7ansFFc_2qNa; Tue, 24 Sep 2013 09:39:09 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r8O8d6Dh002471
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Tue, 24 Sep 2013 09:39:08 +0100
Message-ID: <1380011049.18603.269.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Slater, Joseph" <joe.slater@windriver.com>
Date: Tue, 24 Sep 2013 09:24:09 +0100
In-Reply-To: <007BD92917A2324FA403BCF9A464CF843C51988E@ALA-MBB.corp.ad.wrs.com>
References: <007BD92917A2324FA403BCF9A464CF843C51988E@ALA-MBB.corp.ad.wrs.com>
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] vala.bbclass: add dependency on vala
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
X-List-Received-Date: Tue, 24 Sep 2013 08:24:22 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2013-09-23 at 21:42 +0000, Slater, Joseph wrote:
> From: Joe Slater [mailto:jslater@windriver.com] 
> Sent: Monday, September 23, 2013 1:53 PM
> To: MacLeod, Randy; Polk, Jeffrey
> Cc: lpd-eng-rr
> Subject: [PATCH 1/1] vala.bbclass: add dependency on vala
> 
> This class points the inheritor to directories in
> the target sysroot, so we want to be sure things
> like .vapi files are there.
> 
> Signed-off-by: Joe Slater <jslater@windriver.com>
> ---
>  meta/classes/vala.bbclass |    6 +++---
>  1 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/meta/classes/vala.bbclass b/meta/classes/vala.bbclass
> index c7db08c..0a98dab 100644
> --- a/meta/classes/vala.bbclass
> +++ b/meta/classes/vala.bbclass
> @@ -1,9 +1,9 @@
>  # Vala has problems with multiple concurrent invocations
>  PARALLEL_MAKE = ""
>  
> -# Vala needs vala-native
> -DEPENDS += "vala-native"
> -DEPENDS_virtclass-native += "vala-native"
> +# Vala needs vala-native (and we need vala)
> +DEPENDS += "vala-native vala"
> +DEPENDS_class-native += "vala-native"

In class code this is a really bad idea. Why? Imagine a recipe which
does:

DEPENDS =+ "x"
DEPENDS_class-native = "y"

The += on the class-native above will not do what you think.

I'd recommend something like:

VALADEPENDS = "vala vala-native"
VALADEPENDS_class-native = "vala-native"
DEPENDS += "${VALADEPENDS}"

Most other classes actually use _append on DEPENDS to ensure consistent
behaviour.

Cheers,

Richard



