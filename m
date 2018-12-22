Return-Path: <takondra@cisco.com>
X-Greylist: delayed 568 seconds by postgrey-1.34 at layers.openembedded.org;
	Sat, 22 Dec 2018 02:39:37 UTC
Received: from rcdn-iport-6.cisco.com (rcdn-iport-6.cisco.com [173.37.86.77])
	by mail.openembedded.org (Postfix) with ESMTP id 4112360684
	for <openembedded-core@lists.openembedded.org>;
	Sat, 22 Dec 2018 02:39:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=cisco.com; i=@cisco.com; l=1706; q=dns/txt; s=iport;
	t=1545446378; x=1546655978;
	h=mime-version:content-transfer-encoding:from:to:
	references:in-reply-to:message-id:subject:date;
	bh=3AtpR1HqUMWXeSlbp6y4Py3mMZoHOcX10p/b0s8+2b4=;
	b=E7qk+FeP++74Rr8A24MuIv6oOs3AJRPFwwzGAaCDpW19OaNUNcVxodko
	RSklAyWjHQMMQaEvF+8G2w1NJn6H4citeRlMvv6n+xhhVnDA+5EElR2rc
	R0epxJK6hUjZbhVVSwq86wfqLQruF2kotb0CNmbYn+/E4O/5VZxNOA0o1 k=;
X-IronPort-AV: E=Sophos;i="5.56,383,1539648000"; d="scan'208";a="498340875"
Received: from alln-core-12.cisco.com ([173.36.13.134])
	by rcdn-iport-6.cisco.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	22 Dec 2018 02:30:10 +0000
Received: from localhost ([10.156.154.30])
	by alln-core-12.cisco.com (8.15.2/8.15.2) with ESMTP id wBM2UAm2020794; 
	Sat, 22 Dec 2018 02:30:10 GMT
MIME-Version: 1.0
From: Taras Kondratiuk <takondra@cisco.com>
User-Agent: alot/0.6
To: Alexander Kanavin <alex.kanavin@gmail.com>,
	Ruslan Bilovol <rbilovol@cisco.com>,
	openembedded-core@lists.openembedded.org, xe-linux-external@cisco.com
References: <1545432031-27272-1-git-send-email-rbilovol@cisco.com>
In-Reply-To: <1545432031-27272-1-git-send-email-rbilovol@cisco.com>
Message-ID: <154544581053.5508.9075140213629949773@takondra-t460s>
Date: Fri, 21 Dec 2018 18:30:10 -0800
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-SMTP-Client: 10.156.154.30, [10.156.154.30]
X-Outbound-Node: alln-core-12.cisco.com
Subject: Re: [PATCH] gdbm: depend on readline
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
X-List-Received-Date: Sat, 22 Dec 2018 02:39:37 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Quoting Ruslan Bilovol (2018-12-21 14:40:31)
> This package depends on readline recipe.
> In traditional OE build readline is a dependency
> of python3 and few other packages, thus at the time
> of gdbm build it is available.
> =

> However, if some custom set of recipes is build,
> there is a race between gdbm and python3 build
> and availability of readline isn't deterministic,
> causing next build error:
> | ../../gdbm-1.18/src/input-rl.c:18:31: fatal error: readline/readline.h:=
 No such file or directory
> |  #include <readline/readline.h>
> |                                ^
> | compilation terminated.
> =

> Thus add readline dependency explicitly.
> =

> Cudos to Kostiantyn Iarmak <kiarmak@cisco.com> who
> found this issue.
> =

> Signed-off-by: Ruslan Bilovol <rbilovol@cisco.com>
> ---
>  meta/recipes-support/gdbm/gdbm_1.18.1.bb | 2 ++
>  1 file changed, 2 insertions(+)
> =

> diff --git a/meta/recipes-support/gdbm/gdbm_1.18.1.bb b/meta/recipes-supp=
ort/gdbm/gdbm_1.18.1.bb
> index 16ecc50..215ae47 100644
> --- a/meta/recipes-support/gdbm/gdbm_1.18.1.bb
> +++ b/meta/recipes-support/gdbm/gdbm_1.18.1.bb
> @@ -15,6 +15,8 @@ SRC_URI[sha256sum] =3D "86e613527e5dba544e73208f42b78b7=
c022d4fa5a6d5498bf18c8d6f74
>  =

>  inherit autotools gettext texinfo lib_package ptest
>  =

> +DEPENDS +=3D "readline"
> +
>  # Needed for dbm python module
>  EXTRA_OECONF =3D "-enable-libgdbm-compat"

configure.ac should autodetect presence of readline library:
http://git.savannah.gnu.org/cgit/gdbm.git/tree/configure.ac?h=3Dv1.18.1#n123

If input-rl.c gets compiled, then configure.ac detected readline
somewhere and set GDBM_COND_READLINE.

