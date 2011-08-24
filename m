Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1QwCm6-0007Rf-Hn
	for openembedded-core@lists.openembedded.org;
	Wed, 24 Aug 2011 14:41:42 +0200
Received: by bkbzu17 with SMTP id zu17so912123bkb.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Aug 2011 05:36:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=ncWZFrfvzJ20l0vyqMXpUtS9dQDJsXGVhDXV6m+RrPM=;
	b=wBRS8tdeu41h6gI8XrgNnSG59ntv9ayQbAD2nGxFxc8rZMQKQnldP0TXVPypznTRyd
	itn1oht5uQ5ATLyq16gzXBJd/4Q9vzapQ7Vo6GnS+cawXuAqIVhBWCkkfpZ/3Qd+I21X
	pWPmcNUkAKU4Mvtmklwoi5wKqfF3/vZEdDY4o=
MIME-Version: 1.0
Received: by 10.204.151.70 with SMTP id b6mr2179820bkw.71.1314189416326; Wed,
	24 Aug 2011 05:36:56 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.204.15.66 with HTTP; Wed, 24 Aug 2011 05:36:56 -0700 (PDT)
In-Reply-To: <d353e993939f7c5d678633841c0460f27a3e8042.1314138692.git.paul.eggleton@linux.intel.com>
References: <cover.1314138692.git.paul.eggleton@linux.intel.com>
	<d353e993939f7c5d678633841c0460f27a3e8042.1314138692.git.paul.eggleton@linux.intel.com>
Date: Wed, 24 Aug 2011 09:36:56 -0300
X-Google-Sender-Auth: mdFGmz1iYjGRyTcPeCEwjdI1BDo
Message-ID: <CAP9ODKoeTVe89Q7XsSfB0bBDteWt3JD8T7irn+Jc7gFcut6OmQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] scripts/combo-layer: fix overzealous regex in default hook script
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
X-List-Received-Date: Wed, 24 Aug 2011 12:41:42 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Acked-by: Otavio Salvador <otavio@ossystems.com.br>

On Tue, Aug 23, 2011 at 19:32, Paul Eggleton
<paul.eggleton@linux.intel.com> wrote:
> combo-layer's hook scripts are intended to modify patches as they pass
> through; the default one adds a prefix with the component name and
> a line with the component repo revision before the Signed-off-by;
> however the script was also unintentionally modifying the contents of
> patches *within* the patches passing through it, which resulted in
> unexpected failures when the combo-layer script attempted to use
> "git am" to apply them.
>
> Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
> ---
> =A0scripts/combo-layer-hook-default.sh | =A0 =A04 ++--
> =A01 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/scripts/combo-layer-hook-default.sh b/scripts/combo-layer-ho=
ok-default.sh
> index f03c4fa..e535d5f 100755
> --- a/scripts/combo-layer-hook-default.sh
> +++ b/scripts/combo-layer-hook-default.sh
> @@ -9,5 +9,5 @@ patchfile=3D$1
> =A0rev=3D$2
> =A0reponame=3D$3
>
> -sed -i -e "s#Subject: \[PATCH\] \(.*\)#Subject: \[PATCH\] $reponame: \1#=
" $patchfile
> -sed -i -e "0,/Signed-off-by:/s#\(Signed-off-by:.*\)#\($reponame rev: $re=
v\)\n\n\1#" $patchfile
> +sed -i -e "s#^Subject: \[PATCH\] \(.*\)#Subject: \[PATCH\] $reponame: \1=
#" $patchfile
> +sed -i -e "0,/^Signed-off-by:/s#\(Signed-off-by:.*\)#\($reponame rev: $r=
ev\)\n\n\1#" $patchfile
> --
> 1.7.4.1
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>



--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


