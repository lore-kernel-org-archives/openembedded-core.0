Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1UNjbd-00052P-IN for openembedded-core@lists.openembedded.org;
	Thu, 04 Apr 2013 14:49:29 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r34CglVv008852; Thu, 4 Apr 2013 13:42:48 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id O6yUmbeknPHY; Thu,  4 Apr 2013 13:42:47 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r34Cggig008834
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Thu, 4 Apr 2013 13:42:44 +0100
Message-ID: <1365078717.6526.101.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Martin Jansa <martin.jansa@gmail.com>, "Eggleton, Paul"
	<paul.eggleton@intel.com>
Date: Thu, 04 Apr 2013 13:31:57 +0100
In-Reply-To: <1365006940-3863-1-git-send-email-Martin.Jansa@gmail.com>
References: <1365006940-3863-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: Evolution 3.6.2-0ubuntu0.1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] rm_work: keep do_fetch, do_write_srcrev stamps
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
X-List-Received-Date: Thu, 04 Apr 2013 12:49:30 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2013-04-03 at 18:35 +0200, Martin Jansa wrote:
> * otherwise do_fetch/do_write_srcrev/do_rmwork is reexecuted for each recipe included in image
>   on every build
> 
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta/classes/rm_work.bbclass | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/meta/classes/rm_work.bbclass b/meta/classes/rm_work.bbclass
> index 1642af7..2d0eb1b 100644
> --- a/meta/classes/rm_work.bbclass
> +++ b/meta/classes/rm_work.bbclass
> @@ -60,6 +60,14 @@ do_rm_work () {
>                  i=dummy
>                  break
>                  ;;
> +            *do_fetch*)
> +                i=dummy
> +                break
> +                ;;
> +            *do_write_srcrev*)
> +                i=dummy
> +                break
> +                ;;
>              *do_build*)
>                  i=dummy
>                  break

We cannot do this, it is not in keeping with the rest of the system and
will break things and set a dangerous precedent.

If something subsequently tries to do some operation assuming do_fetch
already ran, it would run again assuming the do_fetch data is there and
it may not be. Right now the way things are setup with do_fetch will
happen to work out ok in most cases with the above but its the wrong
message to send out. For the do_write_srcrev case, it also means that in
some cases the revision will be written out, in other cases it will not
be and I don't think the inconsistency between the two is correct.

The other ways I can see to solve this are:

a) put do_write_srcrev under sstate
b) change do_write_srcrev to a postfunc of do_fetch
c) change the "addtask write_srcrev after do_fetch before do_build" to
be before do_install.

The trouble with c) is that it will cause the sstate checksums to change
when enabling buildhistory (which happens anyway but is rather annoying
and we should be trying to fix that, not make it worse). b) is therefore
looking the more attractive option at this point.

Cheers,

Richard









