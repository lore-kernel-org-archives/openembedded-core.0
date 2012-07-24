Received: from mail-vc0-f175.google.com ([209.85.220.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1StiYe-0006PI-M0
	for openembedded-core@lists.openembedded.org;
	Tue, 24 Jul 2012 19:06:04 +0200
Received: by vcbfy27 with SMTP id fy27so5782669vcb.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Jul 2012 09:54:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=GmcptftNHGEWf327g2DyUEgZriQaG/J1CsnSbQyvrE4=;
	b=irG/1UG+q6gSjozq28s2NZ1ckR74jG+sXFNF+M3riJz7wHbhivhxfdCbOTmHBpyxjQ
	b2dfKikdGK3CrLSMZHQmH/cN3BiDWxAaMAtV3iKkW0XtFhoCI0H4r5fg1fZRo5OCXI17
	YEj04+kHA3PDHjoOzxAiGawMv9D4aEadLV9zNqN+FqmKEJxD0JCUl8NcMoZ0OpzuUm1j
	01EBdq1BrpeO45FSNZ+wnoGDWl9G+Z0fPWCx8n4A70WDEt2+7geNUHDkMntaGnF42cc/
	q/zM56cQKTP3RLfy93uEmGNDkEYVBvTf2Zo8pQ+EHojcqjw3IdvfMQENu51Ltz/fOo1T
	VWsg==
MIME-Version: 1.0
Received: by 10.52.89.35 with SMTP id bl3mr14074850vdb.106.1343148875527; Tue,
	24 Jul 2012 09:54:35 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.220.220.196 with HTTP; Tue, 24 Jul 2012 09:54:35 -0700 (PDT)
In-Reply-To: <e25e076b849d26a9f823536a1b0491a929d270ae.1343142062.git.raj.khem@gmail.com>
References: <cover.1343142062.git.raj.khem@gmail.com>
	<28fddc4106d02fc5b2c97bfd6f425360740cd5f8.1343142062.git.raj.khem@gmail.com>
	<e25e076b849d26a9f823536a1b0491a929d270ae.1343142062.git.raj.khem@gmail.com>
Date: Tue, 24 Jul 2012 13:54:35 -0300
X-Google-Sender-Auth: y2YyRMTv7YsN3_Upplrrx4CgAPs
Message-ID: <CAP9ODKoui=4j+gDOz-eAC-kbcZ8G=xj5ABHtzyDHRiCeVWPoFQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/5] gcc-cross-initial: Stage self sufficient fixed limits.h
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
X-List-Received-Date: Tue, 24 Jul 2012 17:06:05 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Jul 24, 2012 at 12:04 PM, Khem Raj <raj.khem@gmail.com> wrote:
> --- a/meta/recipes-devtools/gcc/gcc-cross-initial.inc
> +++ b/meta/recipes-devtools/gcc/gcc-cross-initial.inc
> @@ -27,3 +27,13 @@ EXTRA_OECONF = "--with-newlib \
>  do_compile () {
>      oe_runmake all-gcc all-target-libgcc
>  }
> +# fixed limits.h infact includes the so called real limits.h
> +# which should come from libc but when we build libc-initial
> +# then bunch of configure tests include fixed limits.h which in turn
> +# includes real limits.h but this real limits.h is not staged yet
> +# so we overwirte the generated include-fixed/limits.h for gcc-cross-initial
> +# to get rid references to real limits.h
> +
> +do_install_append1() {
> +    cp gcc/include-fixed/limits.h ${D}${gcclibdir}/${TARGET_SYS}/${BINV}/include-fixed/limits.h
> +}

It'd be better to have the comment together with install_append1; not
the compile method.

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


