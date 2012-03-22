Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1SAo4x-0005T5-GH
	for openembedded-core@lists.openembedded.org;
	Thu, 22 Mar 2012 20:53:47 +0100
Received: by ghbz2 with SMTP id z2so2161742ghb.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Mar 2012 12:44:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=sBCXhPd8hFCGUzB99Oqt8Ye2ElWZNVfBy3TBrv1UCfA=;
	b=f++QrhyMI5Ctnr2IMV/3DN0JMhqJl64ngV6J6TpeuGuT931waRp8m6m/NG8UcNlm4i
	I4Lm04FqftmTRNY6/oKh7ZpZuTsxPucBAozZc6YQLAee3tK4gaveyMTxktXEfJJN8mGJ
	aY9codRtkm6g40NKsnXtP32vuJDYxIw425UKdXmtbkG9bxCQGhVeZBbOv1lbSEnDPsQb
	vjXBClPKAp1fXPAADqe8IRSzOlvKvfCGaghmg8WHF5sydauByk2vA4UxFQFZEVfUPL+O
	+uF6W4XIfDMVUFHQZ9h4nDq/Qh7SskQc+Y529NKAT0Fox6Jr9dRBH+rFlKMwLhfnrQbw
	cpKA==
MIME-Version: 1.0
Received: by 10.68.218.168 with SMTP id ph8mr22836677pbc.51.1332445491303;
	Thu, 22 Mar 2012 12:44:51 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.68.13.4 with HTTP; Thu, 22 Mar 2012 12:44:51 -0700 (PDT)
In-Reply-To: <587666661eacb8bad434b7f634dcd3213a7c5b96.1332436375.git.paul.eggleton@linux.intel.com>
References: <cover.1332436375.git.paul.eggleton@linux.intel.com>
	<587666661eacb8bad434b7f634dcd3213a7c5b96.1332436375.git.paul.eggleton@linux.intel.com>
Date: Thu, 22 Mar 2012 16:44:51 -0300
X-Google-Sender-Auth: 7zn1YrdXk0_GYQ5EZ4lCYbajrO0
Message-ID: <CAP9ODKoGmxKAyeW_MztNi2HQ=SbcS7Qav5ayytaqCMBYfoXe=A@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] scripts/combo-layer: limit component repo dirty check
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
X-List-Received-Date: Thu, 22 Mar 2012 19:53:47 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Acked-by: Otavio Salvador <otavio@ossystems.com.br>

On Thu, Mar 22, 2012 at 14:15, Paul Eggleton
<paul.eggleton@linux.intel.com> wrote:
> If one or more components are specified for update, only check if their
> repository/repositories are dirty rather than checking all of the
> configured repositories.
>
> Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
> ---
> =A0scripts/combo-layer | =A0 18 +++++++++---------
> =A01 files changed, 9 insertions(+), 9 deletions(-)
>
> diff --git a/scripts/combo-layer b/scripts/combo-layer
> index 7457ba2..3612323 100755
> --- a/scripts/combo-layer
> +++ b/scripts/combo-layer
> @@ -150,15 +150,6 @@ def action_update(conf, args):
> =A0 =A0 =A0 =A0 generate the patch list
> =A0 =A0 =A0 =A0 apply the generated patches
> =A0 =A0 """
> - =A0 =A0# make sure all repos are clean
> - =A0 =A0for name in conf.repos:
> - =A0 =A0 =A0 =A0check_repo_clean(conf.repos[name]['local_repo_dir'])
> - =A0 =A0check_repo_clean(os.getcwd())
> -
> - =A0 =A0import uuid
> - =A0 =A0patch_dir =3D "patch-%s" % uuid.uuid4()
> - =A0 =A0os.mkdir(patch_dir)
> -
> =A0 =A0 repos =3D []
> =A0 =A0 if len(args) > 1:
> =A0 =A0 =A0 =A0 for arg in args[1:]:
> @@ -174,6 +165,15 @@ def action_update(conf, args):
> =A0 =A0 if not repos:
> =A0 =A0 =A0 =A0 repos =3D conf.repos
>
> + =A0 =A0# make sure all repos are clean
> + =A0 =A0for name in repos:
> + =A0 =A0 =A0 =A0check_repo_clean(conf.repos[name]['local_repo_dir'])
> + =A0 =A0check_repo_clean(os.getcwd())
> +
> + =A0 =A0import uuid
> + =A0 =A0patch_dir =3D "patch-%s" % uuid.uuid4()
> + =A0 =A0os.mkdir(patch_dir)
> +
> =A0 =A0 for name in repos:
> =A0 =A0 =A0 =A0 repo =3D conf.repos[name]
> =A0 =A0 =A0 =A0 ldir =3D repo['local_repo_dir']
> --
> 1.7.5.4
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


