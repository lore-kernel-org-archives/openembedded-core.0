Return-Path: <mattias.hansson@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8DD537E6AC
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Aug 2019 08:40:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id E556418563
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Aug 2019 10:40:42 +0200 (CEST)
X-Axis-User: NO
X-Axis-NonUser: YES
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id yiKREzJNJMWO
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Aug 2019 10:40:30 +0200 (CEST)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bastet.se.axis.com (Postfix) with ESMTPS id B6C6E1856D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Aug 2019 10:40:30 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A179F1E075
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Aug 2019 10:40:30 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 95A9F1E072
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Aug 2019 10:40:30 +0200 (CEST)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder03.se.axis.com (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Aug 2019 10:40:30 +0200 (CEST)
Received: from XBOX04.axis.com (xbox04.axis.com [10.0.5.18])
	by thoth.se.axis.com (Postfix) with ESMTP id 8917226E3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Aug 2019 10:40:30 +0200 (CEST)
Received: from axis.com (10.0.5.60) by XBOX04.axis.com (10.0.5.18) with
	Microsoft SMTP Server (TLS) id 15.0.1395.4;
	Fri, 30 Aug 2019 10:40:30 +0200
Date: Fri, 30 Aug 2019 10:40:29 +0200
From: Mattias Hansson <mattias.hansson@axis.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Message-ID: <20190830084029.i3mfvnzs7m4ltba7@axis.com>
References: <20190816091329.10359-1-mattihn@axis.com>
MIME-Version: 1.0
In-Reply-To: <20190816091329.10359-1-mattihn@axis.com>
User-Agent: NeoMutt/20180716
X-Originating-IP: [10.0.5.60]
X-ClientProxiedBy: XBOX04.axis.com (10.0.5.18) To XBOX04.axis.com (10.0.5.18)
X-TM-AS-GCONF: 00
Subject: Re: [PATCH] base.bbclass: add dependency on pseudo from do_prepare_recipe_sysroot
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
X-List-Received-Date: Fri, 30 Aug 2019 08:40:42 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Fri, Aug 16, 2019 at 11:13:29AM +0200, Mattias Hansson wrote:
> do_prepare_recipe_sysroot may perform groupadd, which requires pseudo.
> However, do_prepare_recipe_sysroot does not depend on pseudo explicitly,
> which sometimes causes a build error when building a recipe that adds
> groups.
> 
> This issue only occurs when executing do_prepare_recipe_sysroot for a
> recipe that adds groups before finishing a task that depends on pseudo
> for a recipe that doesn't add groups.
> 
> Signed-off-by: Mattias Hansson <mattihn@axis.com>
> ---
>  meta/classes/base.bbclass | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
> index 0c8a4b2862..0576b110c9 100644
> --- a/meta/classes/base.bbclass
> +++ b/meta/classes/base.bbclass
> @@ -480,6 +480,7 @@ python () {
>      # If we're building a target package we need to use fakeroot (pseudo)
>      # in order to capture permissions, owners, groups and special files
>      if not bb.data.inherits_class('native', d) and not bb.data.inherits_class('cross', d):
> +        d.setVarFlag('do_prepare_recipe_sysroot', 'fakeroot', '1')
>          d.setVarFlag('do_unpack', 'umask', '022')
>          d.setVarFlag('do_configure', 'umask', '022')
>          d.setVarFlag('do_compile', 'umask', '022')
> -- 
> 2.11.0
> 

Ping. Just a friendly reminder for someone to take a look at this.

/Mattias

