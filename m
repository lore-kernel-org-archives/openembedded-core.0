Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id AC2277146A
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Sep 2014 08:27:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s848REBR018418; Thu, 4 Sep 2014 09:27:14 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id gYgWRUPIZ5Op; Thu,  4 Sep 2014 09:27:14 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s848RBe6018415
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Thu, 4 Sep 2014 09:27:13 +0100
Message-ID: <1409819233.12482.25.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Robert Yang <liezhi.yang@windriver.com>
Date: Thu, 04 Sep 2014 09:27:13 +0100
In-Reply-To: <030c29236dc8bc0b8df2f9a2973c0997a91023b5.1409813992.git.liezhi.yang@windriver.com>
References: <cover.1409813992.git.liezhi.yang@windriver.com>
	<030c29236dc8bc0b8df2f9a2973c0997a91023b5.1409813992.git.liezhi.yang@windriver.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] sstate.bbclass: update the timestamps after install
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
X-List-Received-Date: Thu, 04 Sep 2014 08:27:20 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2014-09-04 at 00:05 -0700, Robert Yang wrote:
> Update the sstate file's timestamps after it is installed, it will be
> very useful for removing the old sstate file, especially, it's not easy
> to remove when use the shared SSTATE_DIR, we can easily remove them with
> this change, for example:
> 
> $ find state-cache -type f -ctime +10 -exec rm -f {} \;
> 
> Will remove the sstate file which isn't used by recent 10 days.
> 
> We can use the -atime, but it is not always available, for example,
> when mounted with "-o noatime".
> 
> The touch is a very light weight action, and the
> scripts/sstate-cache-management.sh also requires this.
> 
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>  meta/classes/sstate.bbclass |    1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
> index ead829e..885912d 100644
> --- a/meta/classes/sstate.bbclass
> +++ b/meta/classes/sstate.bbclass
> @@ -618,6 +618,7 @@ sstate_unpack_package () {
>  	mkdir -p ${SSTATE_INSTDIR}
>  	cd ${SSTATE_INSTDIR}
>  	tar -xmvzf ${SSTATE_PKG}
> +	touch --no-dereference ${SSTATE_PKG}
>  }
>  
>  BB_HASHCHECK_FUNCTION = "sstate_checkhashes"

At the very least we need to consider read only files here...

Cheers,

Richard


