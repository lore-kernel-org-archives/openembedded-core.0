Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1SAo58-0005VE-5J
	for openembedded-core@lists.openembedded.org;
	Thu, 22 Mar 2012 20:53:58 +0100
Received: by pbcum15 with SMTP id um15so1687996pbc.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Mar 2012 12:45:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=U0G55ZDMEIl4pw7tKQc34SIDl6oHnx5mLsGDP3KIe/U=;
	b=aVhVMb+p9SPDjSfe8UVJcPGL1CFqfwHtWKbqBe2T5cjKCwiYxlD8wsS0uROfG/RXV+
	bToNkW6WJe2UU9zwQZmCsXys7o+Sy7kQcXFOicMvFmPtk+HnhyV0gMrRXTFAnDBqnGHj
	Ne2YqivZ6lJNaTfVFKdrpsUMNm/o31AMJyHdRX9Is/0tiupXwCThQaqeVvjqwmMjDA3R
	dsOBUTGvxflFBegsUBG+PCsdDEkhkZvPRnNfwEAhv9Iho70lXfnBp3olIFbQklQNH5CX
	6A/hmGRpbBxuLpiYCUD+aXavrSDDoit5SN4lqJuCeSnAHvJouvlwrdvckZnhR4X5Tvq4
	WjSQ==
MIME-Version: 1.0
Received: by 10.68.225.104 with SMTP id rj8mr22767085pbc.135.1332445501631;
	Thu, 22 Mar 2012 12:45:01 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.68.13.4 with HTTP; Thu, 22 Mar 2012 12:45:01 -0700 (PDT)
In-Reply-To: <f876f5ca2d2e19fd35d90706f9e7087ed31ba5e0.1332436375.git.paul.eggleton@linux.intel.com>
References: <cover.1332436375.git.paul.eggleton@linux.intel.com>
	<f876f5ca2d2e19fd35d90706f9e7087ed31ba5e0.1332436375.git.paul.eggleton@linux.intel.com>
Date: Thu, 22 Mar 2012 16:45:01 -0300
X-Google-Sender-Auth: A1DLrbtDcLZOCIqUMdjw0yeJ-QY
Message-ID: <CAP9ODKrPkmv3gmdvkcAae6aNmXouFr1igcUvpaYD0_eb4DPBhw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] scripts/combo-layer: handle diffs in commit messages
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
X-List-Received-Date: Thu, 22 Mar 2012 19:53:58 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Acked-by: Otavio Salvador <otavio@ossystems.com.br>


On Thu, Mar 22, 2012 at 14:15, Paul Eggleton
<paul.eggleton@linux.intel.com> wrote:
> A few recent commits in the OE-Core repository contain diffs in their
> commit messages, which totally confuses git-am when applying them to the
> combo repository during update. Add some code to detect and indent any
> diff text in the commit message so that this does not happen (and show a
> warning).
>
> Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
> ---
> =A0scripts/combo-layer | =A0 38 ++++++++++++++++++++++++++++++++++++++
> =A01 files changed, 38 insertions(+), 0 deletions(-)
>
> diff --git a/scripts/combo-layer b/scripts/combo-layer
> index 3612323..73d61cc 100755
> --- a/scripts/combo-layer
> +++ b/scripts/combo-layer
> @@ -144,6 +144,43 @@ def check_repo_clean(repodir):
> =A0 =A0 =A0 =A0 logger.error("git repo %s is dirty, please fix it first",=
 repodir)
> =A0 =A0 =A0 =A0 sys.exit(1)
>
> +def check_patch(patchfile):
> + =A0 =A0f =3D open(patchfile)
> + =A0 =A0ln =3D f.readline()
> + =A0 =A0of =3D None
> + =A0 =A0in_patch =3D False
> + =A0 =A0beyond_msg =3D False
> + =A0 =A0pre_buf =3D ''
> + =A0 =A0while ln:
> + =A0 =A0 =A0 =A0if not beyond_msg:
> + =A0 =A0 =A0 =A0 =A0 =A0if ln =3D=3D '---\n':
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if not of:
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0break
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0in_patch =3D False
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0beyond_msg =3D True
> + =A0 =A0 =A0 =A0 =A0 =A0elif ln.startswith('--- '):
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0# We have a diff in the commit message
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0in_patch =3D True
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if not of:
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0print('WARNING: %s contains a di=
ff in its commit message, indenting to avoid failure during apply' % patchf=
ile)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0of =3D open(patchfile + '.tmp', =
'w')
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0of.write(pre_buf)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0pre_buf =3D ''
> + =A0 =A0 =A0 =A0 =A0 =A0elif in_patch and not ln[0] in '+-@ \n\r':
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0in_patch =3D False
> + =A0 =A0 =A0 =A0if of:
> + =A0 =A0 =A0 =A0 =A0 =A0if in_patch:
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0of.write(' ' + ln)
> + =A0 =A0 =A0 =A0 =A0 =A0else:
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0of.write(ln)
> + =A0 =A0 =A0 =A0else:
> + =A0 =A0 =A0 =A0 =A0 =A0pre_buf +=3D ln
> + =A0 =A0 =A0 =A0ln =3D f.readline()
> + =A0 =A0f.close()
> + =A0 =A0if of:
> + =A0 =A0 =A0 =A0of.close()
> + =A0 =A0 =A0 =A0os.rename(patchfile + '.tmp', patchfile)
> +
> =A0def action_update(conf, args):
> =A0 =A0 """
> =A0 =A0 =A0 =A0 update the component repos
> @@ -227,6 +264,7 @@ def action_update(conf, args):
> =A0 =A0 =A0 =A0 count=3Dlen(revlist)-1
> =A0 =A0 =A0 =A0 for patch in patchlist:
> =A0 =A0 =A0 =A0 =A0 =A0 f.write("%s %s\n" % (patch, revlist[count]))
> + =A0 =A0 =A0 =A0 =A0 =A0check_patch(os.path.join(patch_dir, patch))
> =A0 =A0 =A0 =A0 =A0 =A0 count=3Dcount-1
> =A0 =A0 =A0 =A0 f.close()
>
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


