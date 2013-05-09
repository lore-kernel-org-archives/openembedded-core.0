Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1UaYC2-00038L-4y for openembedded-core@lists.openembedded.org;
	Thu, 09 May 2013 23:16:21 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r49L0NUC032098; Thu, 9 May 2013 22:00:24 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id v4y6YNC3rhPo; Thu,  9 May 2013 22:00:23 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r49L0GWp032078
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Thu, 9 May 2013 22:00:17 +0100
Message-ID: <1368133060.27116.111.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 09 May 2013 21:57:40 +0100
In-Reply-To: <20130509104804.GD3188@jama>
References: <20130509104804.GD3188@jama>
X-Mailer: Evolution 3.6.2-0ubuntu0.1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: autotools_preconfigure not removing separate B
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 09 May 2013 21:16:37 -0000
X-List-Received-Date: Thu, 09 May 2013 21:16:37 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2013-05-09 at 12:48 +0200, Martin Jansa wrote:
> Do we really need -e "${CONFIGURESTAMPFILE}" check in autotools_preconfigure?
> 
> In some cases when do_configure is failing (but after creating e.g. .qmake.cache)
> it would be better to start with clean B on 2nd attempt to configure it, but
> CONFIGURESTAMPFILE wasn't created yet.
> 
> Does someone remember why we need to test CONFIGURESTAMPFILE existence first 
> (was it only to prevent cat ${CONFIGURESTAMPFILE} to fail?)

I suspect so. I think the logical here also assumed we were going to try
and do something like a "make distclean" originally too so it was rather
specific about the conditions.

With the better support for separate ${B} looking like the right
direction to go (roughly well supported by recipes), we might be able to
justify unconditionally wiping ${B} at the start of do_configure.

> autotools_preconfigure() {
>         if [ -n "${CONFIGURESTAMPFILE}" -a -e "${CONFIGURESTAMPFILE}" ]; then
>                 if [ "`cat ${CONFIGURESTAMPFILE}`" != "${BB_TASKHASH}" -a "${S}" != "${B}" ]; then
>                         echo "Previously configured separate build directory detected, cleaning ${B}"

i.e. this just becomes:

         if [ "${S}" != "${B}" ]; then
                echo "Separate build directory detected, cleaning ${B}"

We still need a plan to deal with that horrible monster include file.
Its fine for proof of concept but we need to move somewhere from here.

Cheers,

Richard



