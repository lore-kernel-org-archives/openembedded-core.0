Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 4D59371A32
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Feb 2017 04:46:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v1G4kEBe005319; Thu, 16 Feb 2017 04:46:14 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id iTogweWHw9eL; Thu, 16 Feb 2017 04:46:14 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v1G4k3Ks005306
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 16 Feb 2017 04:46:09 GMT
Message-ID: <1487220363.4999.7.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Geoffrey Levillain <geoffrey.levillain@smile.fr>,
	openembedded-core@lists.openembedded.org
Date: Wed, 15 Feb 2017 20:46:03 -0800
In-Reply-To: <20170215173323.10466-4-geoffrey.levillain@smile.fr>
References: <20170215173323.10466-1-geoffrey.levillain@smile.fr>
	<20170215173323.10466-4-geoffrey.levillain@smile.fr>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.1 
Mime-Version: 1.0
Subject: Re: [PATCH v2 3/3] rm_work.bbclass: Do not remove fetching and install_overlay stamps
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
X-List-Received-Date: Thu, 16 Feb 2017 04:46:14 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2017-02-15 at 18:33 +0100, Geoffrey Levillain wrote:
> In order to keep do_install_overlay to reexecute it's needed to keep
> stamps of fetching tasks.
> 
> Without that do_install_overlay would reexecute and do_image as well
> but
> do_image will crash since there is no rootfs.
> 
> Signed-off-by: Geoffrey Levillain <geoffrey.levillain@smile.fr>
> ---
>  meta/classes/rm_work.bbclass | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/meta/classes/rm_work.bbclass
> b/meta/classes/rm_work.bbclass
> index 054c93716e..c0e7c2a0a6 100644
> --- a/meta/classes/rm_work.bbclass
> +++ b/meta/classes/rm_work.bbclass
> @@ -71,6 +71,10 @@ do_rm_work () {
>                  i=dummy
>                  break
>                  ;;
> +            *do_fetch*|*do_unpack*|*do_patch*|*install_overlay*)
> +                i=dummy
> +                break
> +                ;;

This patch whitelists not just the install_overlay stamps but the
fetch, patch and unpack stamps for *everything* in all recipes? That
clearly isn't correct...

Cheers,

Richard



