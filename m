Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id D649E6AC3C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Apr 2016 06:19:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u3F6Jo2M021411; Fri, 15 Apr 2016 07:19:50 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id bkJ5ZEG2gdF5; Fri, 15 Apr 2016 07:19:50 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u3F6JmIq021398
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 15 Apr 2016 07:19:49 +0100
Message-ID: <1460701188.9308.203.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Andre McCurdy <armccurdy@gmail.com>,
	openembedded-core@lists.openembedded.org
Date: Fri, 15 Apr 2016 07:19:48 +0100
In-Reply-To: <1459447989-25263-4-git-send-email-armccurdy@gmail.com>
References: <1459447989-25263-1-git-send-email-armccurdy@gmail.com>
	<1459447989-25263-4-git-send-email-armccurdy@gmail.com>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: Re: [PATCH 3/4] base.bbclass: include PV in 'incompatible license but whitelisted' debug
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
X-List-Received-Date: Fri, 15 Apr 2016 06:19:52 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2016-03-31 at 11:13 -0700, Andre McCurdy wrote:
> Referencing PN only is ambiguous if multiple versions of a recipe are
> present.
> 
> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
> ---
>  meta/classes/base.bbclass | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
> index 67b3370..d91e059 100644
> --- a/meta/classes/base.bbclass
> +++ b/meta/classes/base.bbclass
> @@ -537,7 +537,8 @@ python () {
>                      raise bb.parse.SkipPackage("incompatible with
> license %s" % license)
>              elif pn in whitelist:
>                  if pn in incompatwl:
> -                    bb.note("INCLUDING " + pn + " as buildable
> despite INCOMPATIBLE_LICENSE because it has been whitelisted")
> +                    p = d.getVar('P', True)
> +                    bb.note("INCLUDING " + p + " as buildable
> despite INCOMPATIBLE_LICENSE because it has been whitelisted")
>  
>      needsrcrev = False
>      srcuri = d.getVar('SRC_URI', True)

FWIW, looking into this has been on my todo list. I've now merged a
patch and events generated from recipes during parsing are now
automatically prefixed with the recipe filename (we might not know
PN/PV at that point).

Hopefully that means we can simplify some of these messages rather than
meaning we have to ensure every one contains PN/PV.

Cheers,

Richard

