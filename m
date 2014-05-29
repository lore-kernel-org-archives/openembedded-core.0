Return-Path: <paul.eggleton@intel.com>
Received: from mga03.intel.com (unknown [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 50E2E6FC83
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 May 2014 09:48:58 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 29 May 2014 02:48:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.98,933,1392192000"; d="scan'208";a="438475597"
Received: from acdivito-mobl2.gar.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.123.240])
	by azsmga001.ch.intel.com with ESMTP; 29 May 2014 02:48:55 -0700
From: Paul Eggleton <paul.eggleton@intel.com>
To: =?ISO-8859-1?Q?Jo=E3o?= Henrique Ferreira de Freitas <joaohf@gmail.com>
Date: Thu, 29 May 2014 10:48:52 +0100
Message-ID: <2040568.SAJy5ZGrOb@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.12.5 (Linux/3.14.4-200.fc20.x86_64; KDE/4.12.5; x86_64; ; )
In-Reply-To: <1401332031-23133-2-git-send-email-joaohf@gmail.com>
References: <1401332031-23133-1-git-send-email-joaohf@gmail.com>
	<1401332031-23133-2-git-send-email-joaohf@gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] combo-layer: fix revlist taking into account file_filter
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
X-List-Received-Date: Thu, 29 May 2014 09:49:00 -0000
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On Wednesday 28 May 2014 23:53:51 Jo=E3o Henrique Ferreira de Freitas wrote:
> If file_filter is set, git format-patch takes account but git rev-list
> does not. So revlist is going to get with wrong revisions. And last_revis=
ion
> will be updated with wrong revision. The next time that user run
> combo-layer it complain about applying patches.
> =

> So ensure that 'git rev-list' are using file_filter as 'git format-patch'.
> =

> Signed-off-by: Jo=E3o Henrique Ferreira de Freitas <joaohf@gmail.com>
> ---
>  scripts/combo-layer | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> =

> diff --git a/scripts/combo-layer b/scripts/combo-layer
> index 9da1d3a..19d64e6 100755
> --- a/scripts/combo-layer
> +++ b/scripts/combo-layer
> @@ -395,7 +395,7 @@ def action_update(conf, args):
>          logger.debug("generated patch set:\n%s" % output)
>          patchlist =3D output.splitlines()
> =

> -        rev_cmd =3D 'git rev-list --no-merges ' + rev_cmd_range
> +        rev_cmd =3D "git rev-list --no-merges %s -- %s" % (rev_cmd_range,
> file_filter) revlist =3D runcmd(rev_cmd, ldir).splitlines()
> =

>          # Step 3: Call repo specific hook to adjust patch

You're right, I'm not sure how we didn't pick up on this earlier. Thanks!

Acked-by: Paul Eggleton <paul.eggleton@linux.intel.com>

Cheers,
Paul
---------------------------------------------------------------------
Intel Corporation (UK) Limited
Registered No. 1134945 (England)
Registered Office: Pipers Way, Swindon SN3 1RJ
VAT No: 860 2173 47

This e-mail and any attachments may contain confidential material for
the sole use of the intended recipient(s). Any review or distribution
by others is strictly prohibited. If you are not the intended
recipient, please contact the sender and delete all copies.


