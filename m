Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@gmail.com>) id 1QpBpC-0005Gw-Fn
	for openembedded-core@lists.openembedded.org;
	Fri, 05 Aug 2011 06:15:54 +0200
Received: by yxi19 with SMTP id 19so1531581yxi.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Aug 2011 21:11:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=povbj9UoIP0CcUyeI0SPbodyrSLdGGPoEnOptxn/1v8=;
	b=UQc/A8mbcwaf6VZIHRUU+ThYebPqWlTPlTJ40RqidrPuCzRILTinhHT69/2X67ZqUF
	LpQqhIrdAKnhQGVvbny9lgusGZcYh2mXFRQBFW+MnBtodVqz1tomN69SxOI8pkqlCxgl
	Uj3Q6dI0D6qGEZFfLUwLArLul3Z6/rAEBSuL4=
MIME-Version: 1.0
Received: by 10.101.63.5 with SMTP id q5mr1422877ank.140.1312517487917; Thu,
	04 Aug 2011 21:11:27 -0700 (PDT)
Received: by 10.101.86.1 with HTTP; Thu, 4 Aug 2011 21:11:27 -0700 (PDT)
In-Reply-To: <80e4be5ce59752125ef341926ab869acc496dc86.1312469789.git.nitin.a.kamble@intel.com>
References: <cover.1312469789.git.nitin.a.kamble@intel.com>
	<e5fc6a2b0a315f9ade50a7f357b98068c38d49e3.1312469789.git.nitin.a.kamble@intel.com>
	<80e4be5ce59752125ef341926ab869acc496dc86.1312469789.git.nitin.a.kamble@intel.com>
Date: Fri, 5 Aug 2011 00:11:27 -0400
Message-ID: <CADkTA4N2idH46wn9iksYjc88M33Ntfv9Ut=4pYRuh-6i+C1r+A@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 02/10] linux-yocto: process the existing branch for configuration
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
X-List-Received-Date: Fri, 05 Aug 2011 04:15:54 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 4, 2011 at 11:01 AM,  <nitin.a.kamble@intel.com> wrote:
> From: Bruce Ashfield <bruce.ashfield@windriver.com>
>
> When building an external tree or bootstrapping a BSP the
> external branch may not have been checked out. The tools now ensure
> that the tree is ready for configuration, so we no longer need to
> force the checkout of the external branch.

This broke one use case, which may be fine, but I'll include this in my
pull request once all testing is complete.

Bruce

>
> Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
> ---
> =A0meta/classes/kernel-yocto.bbclass | =A0 =A09 +--------
> =A01 files changed, 1 insertions(+), 8 deletions(-)
>
> diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yoct=
o.bbclass
> index a374df1..8df5f31 100644
> --- a/meta/classes/kernel-yocto.bbclass
> +++ b/meta/classes/kernel-yocto.bbclass
> @@ -87,14 +87,7 @@ do_kernel_configme() {
> =A0 =A0 =A0 =A0echo "[INFO] doing kernel configme"
>
> =A0 =A0 =A0 =A0kbranch=3D${KBRANCH}
> - =A0 =A0 =A0 if [ -n "${YOCTO_KERNEL_EXTERNAL_BRANCH}" ]; then
> - =A0 =A0 =A0 =A0 =A0 # switch from a generic to a specific branch
> - =A0 =A0 =A0 =A0 =A0 kbranch=3D${YOCTO_KERNEL_EXTERNAL_BRANCH}
> - =A0 =A0 =A0 =A0 =A0 cd ${S}
> - =A0 =A0 =A0 =A0 =A0 git checkout ${kbranch}
> - =A0 =A0 =A0 else
> - =A0 =A0 =A0 =A0 =A0cd ${S}
> - =A0 =A0 =A0 fi
> + =A0 =A0 =A0 cd ${S}
>
> =A0 =A0 =A0 =A0configme --reconfig --output ${B} ${kbranch} ${MACHINE}
> =A0 =A0 =A0 =A0if [ $? -ne 0 ]; then
> --
> 1.7.6
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


