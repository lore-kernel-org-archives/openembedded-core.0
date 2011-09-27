Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@gmail.com>) id 1R8YAx-0006PQ-P8
	for openembedded-core@lists.openembedded.org;
	Tue, 27 Sep 2011 15:58:24 +0200
Received: by wyh5 with SMTP id 5so7650069wyh.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Sep 2011 06:52:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=dWcOkoYk1oFwl4aC2YCT5//gwLv4CSD3wupLRULYGGc=;
	b=PfY1CmqqmCocoKeXJQMqdhzseBOCVeWFclJ+KAKzK5xGt9puGJIHiWgf1dLex35nyW
	7TdI7wZuk0+zMObmh3C++4+R8Pj3Q4xApax51VgN9J/A8jI5oPXEAk06ZmyDc57tZ2/j
	AlnzujGtyclIFB5QVUVYxDqivKnQwgmLJkvH0=
MIME-Version: 1.0
Received: by 10.227.150.207 with SMTP id z15mr4385584wbv.66.1317131578500;
	Tue, 27 Sep 2011 06:52:58 -0700 (PDT)
Received: by 10.180.87.197 with HTTP; Tue, 27 Sep 2011 06:52:58 -0700 (PDT)
In-Reply-To: <1316297897-698-2-git-send-email-dbaryshkov@gmail.com>
References: <1316297897-698-1-git-send-email-dbaryshkov@gmail.com>
	<1316297897-698-2-git-send-email-dbaryshkov@gmail.com>
Date: Tue, 27 Sep 2011 09:52:58 -0400
Message-ID: <CADkTA4NxfSaEinraLQMsLT4ZWQKOPAZ76uNujFXg0zSrRvVnFA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Subject: Re: [PATCH 2/5] kernel.bbclass: respect MACHINE_KERNEL_PR
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
X-List-Received-Date: Tue, 27 Sep 2011 13:58:24 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 17, 2011 at 6:18 PM, Dmitry Eremin-Solenikov
<dbaryshkov@gmail.com> wrote:
> MACHINE_KERNEL_PR was introduced long ago in org.oe.dev. It's present in
> meta-oe kernel.bbclass. Several machines depend on this functionality.

I don' t have a big problem with this, since the change is obviously
harmless if it
doesn't need to be used. But similar to my comment on patch 3/5, is there a=
ny
history/technical reasons we can capture here ?

I did a quick search to dig up a bit on this myself, but a summary
would definitely
help, since I see that this has a long and sometimes twisting history. Is i=
t as
simple as ?

 "A machine.conf or local.conf can increase MACHINE_KERNEL_PR to force
 rebuilds for kernel and external modules"

Cheers,

Bruce


>
> Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
> ---
> =A0meta/classes/kernel.bbclass | =A0 =A05 +++++
> =A01 files changed, 5 insertions(+), 0 deletions(-)
>
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index c577011..b44e3b5 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -20,6 +20,11 @@ python __anonymous () {
> =A0 =A0 image =3D bb.data.getVar('INITRAMFS_IMAGE', d, True)
> =A0 =A0 if image:
> =A0 =A0 =A0 =A0 bb.data.setVar('INITRAMFS_TASK', '${INITRAMFS_IMAGE}:do_r=
ootfs', d)
> +
> + =A0 =A0machine_kernel_pr =3D bb.data.getVar('MACHINE_KERNEL_PR', d, Tru=
e)
> +
> + =A0 =A0if machine_kernel_pr:
> + =A0 =A0 =A0 =A0bb.data.setVar('PR', machine_kernel_pr, d)
> =A0}
>
> =A0inherit kernel-arch deploy
> --
> 1.7.2.5
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>



--=20
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"


