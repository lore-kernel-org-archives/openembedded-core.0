Received: from mail-lb0-f175.google.com ([209.85.217.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SAlIz-0003ie-Dg
	for openembedded-core@lists.openembedded.org;
	Thu, 22 Mar 2012 17:56:05 +0100
Received: by lbbgi4 with SMTP id gi4so1790215lbb.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Mar 2012 09:47:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=KG/94tXtdeVljh5sBSKkdJcTbb03BKTH7wkbVgU6LtI=;
	b=c2U4vxEXg4Z8FiJGjz/p6DYhXgaJKZuNbp0aE+vPq6AapvSUqc2EYzel5IpD0+20P+
	TJi4ZeIySsAOodmXEQQ/XUBBry7wIzixTmnbs0gydSIlykV3g+2IA558nTCF3Cgi0tUm
	Xl7IrCvCCbfdWbTNGGT6jLTIyrhNGEJEAFXeLMqRkCsOscG5l19cFf0FsBVieaSXtVpc
	CVvTFL3TudQecNBvSwye8qAaH3T0N7l2ivlmTQqbALbT3WgUx5nOOnOLg4ErAF9tZRjF
	+wU93A5NU651FGYd7GpUHSO9MORNH2OXksuJuLDWEr68HAYmNLfY9lmtwmTHNqLE7WNf
	S+yw==
Received: by 10.152.127.136 with SMTP id ng8mr6361101lab.16.1332434830345;
	Thu, 22 Mar 2012 09:47:10 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.152.2.71 with HTTP; Thu, 22 Mar 2012 09:46:39 -0700 (PDT)
In-Reply-To: <CALbNGRSm2KV_RsV+rR4hFNcEg7Oi5Z57N1nGXS73Z17G6gqS1g@mail.gmail.com>
References: <CALbNGRSm2KV_RsV+rR4hFNcEg7Oi5Z57N1nGXS73Z17G6gqS1g@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 22 Mar 2012 09:46:39 -0700
Message-ID: <CAMKF1srqhR_ETsSGoF4Z9_TQcad5Eb8_dke5RdJxyKoV_dwHMg@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Debugging with gdb
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
X-List-Received-Date: Thu, 22 Mar 2012 16:56:06 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 19, 2012 at 4:18 PM, Andreas M=C3=BCller
<schnitzeltony@googlemail.com> wrote:
> Hi,
>
> midori crashes with segmentation fault since a while (0.4.3 & 0.4.4).
> To understand why I would like to start a gdb remote debug session. In
> the past I prepared the image in the following way to get as much
> libraries as possible compiled with -O0 since I do not know which
> component might be responsible:
>
> 1. clean all tmp dirs
> 2. build all recipes where -O0 is not wanted
> (u-boot/kernel/gdb/gdb-cross) or not possible (eglibc/lttng-ust)
> 3. added in local.conf: 'SELECTED_OPTIMIZATION =3D "${DEBUG_OPTIMIZATION}=
 -O0'
> 4. build image
>
> This sequence does not work anymore since the change in local.conf
> causes most (all?) recipes to rebuild which crashes at least at
> eglibc.
>
> I am running a bit out of ideas to get this done. The only solution I
> see is a minimum optimization passed in the recipe together with 3.
> and build from scratch.
>
> Comments / better ideas?

in OE-Core world you can add following to local.conf and then you can
debug it on target.

EXTRA_IMAGE_FEATURES +=3D "dbg-pkgs tools-sdk"

and that should have pretty much what you want. You dont have to lower
the optlevel since that might let the crash go away. Try to debug the
same code thats failing.

>
> Andreas
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


