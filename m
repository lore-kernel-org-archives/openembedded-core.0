Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QjXv8-0004Qx-KV for openembedded-core@lists.openembedded.org;
	Wed, 20 Jul 2011 16:38:42 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p6KEYa0s023560
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jul 2011 15:34:36 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 22788-07 for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jul 2011 15:34:32 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p6KEYTOR023554
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jul 2011 15:34:29 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <93848d65e679794e5aa41e548ee275378518d071.1311151283.git.lei.mei@intel.com>
References: <cover.1311151283.git.lei.mei@intel.com>
	<93848d65e679794e5aa41e548ee275378518d071.1311151283.git.lei.mei@intel.com>
Date: Wed, 20 Jul 2011 15:34:25 +0100
Message-ID: <1311172466.2344.43.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 2/2] perl-dynloader.patch: Fix libdir issue for multilib
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 20 Jul 2011 14:38:42 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-07-20 at 16:48 +0800, Mei Lei wrote:
> The perl-dynloader.patch can't support /usr/lib64, change the regular expression to support multilib.
> 
> Signed-off-by: Mei Lei <lei.mei@intel.com>
> ---
>  .../perl/perl-5.12.3/perl-dynloader.patch          |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/meta/recipes-devtools/perl/perl-5.12.3/perl-dynloader.patch b/meta/recipes-devtools/perl/perl-5.12.3/perl-dynloader.patch
> index d5ea00f..a45af91 100644
> --- a/meta/recipes-devtools/perl/perl-5.12.3/perl-dynloader.patch
> +++ b/meta/recipes-devtools/perl/perl-5.12.3/perl-dynloader.patch
> @@ -19,7 +19,7 @@ Update by Nitin A Kamble <nitin.a.kamble@intel.com> 2011/04/21
>  +    {
>  +        my $hostlib = $ENV{PERLHOSTLIB};
>  +        print STDERR "*** Module name IN: $modlibname\n";
> -+        ($p1, $p2, $p3, $p4, $p5) = $modlibname =~ m/(^(.*lib\/)?)((perl\/[0-9\.]*\/)?)(.*)$/;
> ++        ($p1, $p2, $p3, $p4, $p5) = $modlibname =~ m/(^(.*lib[0-9]*\/)?)((perl\/[0-9\.]*\/)?)(.*)$/;
>  +        print STDERR "*** p1: $p1  p3: $p3  p5: $p5\n";
>  +        if ( $p1 ne "" ) {
>  +            $modlibname = $hostlib.$p5;

We might need to relax this a little further since we might want things
like libx32 to work in future?

Cheers,

Richard




