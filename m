Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1R8JAW-0007rf-Ff for openembedded-core@lists.openembedded.org;
	Mon, 26 Sep 2011 23:56:56 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p8QLvptW016141 for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Sep 2011 22:57:51 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id of+v1Ll5q4j9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Sep 2011 22:57:51 +0100 (BST)
Received: from [192.168.1.40] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p8QLvksr016137
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Sep 2011 22:57:48 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Mon, 26 Sep 2011 22:51:22 +0100
In-Reply-To: <1317068664.26109.95.camel@ted>
References: <1317068664.26109.95.camel@ted>
X-Mailer: Evolution 3.1.91- 
Message-ID: <1317073889.26109.97.camel@ted>
Mime-Version: 1.0
Subject: Re: [PATCH] insane: Promote most warnings into QA errors by default
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
X-List-Received-Date: Mon, 26 Sep 2011 21:56:56 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-09-26 at 21:24 +0100, Richard Purdie wrote:
> We agreed a while back that we'd start ERRORing on QA issues, not just
> WARNING about them. This patch changes the default QA levels to error
> on everything except ldflag and useless rpath issues.
> 
> It also stops giving out QA warnings about desktop files since it
> adds noise to the build and until someone plans to seriously tackle
> that problem, its pointless.
> 
> We can promote the ldflag and rpath warnings too, when the issues
> in OE-Core are resolved (they're mostly there now, jsut a few more
> to go).
> 
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
> diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
> index addb9ac..62935c3 100644
> --- a/meta/classes/insane.bbclass
> +++ b/meta/classes/insane.bbclass
> @@ -99,9 +99,9 @@ def package_qa_get_machine_dict():
>         }
>  
> 
> -WARN_QA ?= "dev-so rpaths debug-deps dev-deps debug-files arch la2 pkgconfig desktop la ldflags perms useless-rpaths"
> -ERROR_QA ?= ""
> -#ERROR_QA ?= "rpaths debug-deps dev-deps debug-files arch pkgconfig perms"
> +# Currently not being used by default "desktop"
> +WARN_QA ?= "ldflags useless-rpaths"
> +ERROR_QA ?= "dev-so rpaths debug-deps dev-deps debug-files arch la2 pkgconfig la perms"
>  

Further testing shows we may not be ready to move rpath to ERROR_QA
quite yet but the rest of the proposal still stands...

Cheers,

Richard



