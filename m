Received: from mail-da0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1TdOrQ-00062B-4i
	for openembedded-core@lists.openembedded.org;
	Tue, 27 Nov 2012 18:22:16 +0100
Received: by mail-da0-f47.google.com with SMTP id s35so2130327dak.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Nov 2012 09:08:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=IKHmPWVrZDH4nxdofZSFwPM1MxlYzCp/s8+qBF7HtXo=;
	b=VRpsocRckPuyus+zA3xFaJLLfadDFdo31a342BZwp/MSHI+RSl26ERIv/L4aIeet1x
	Xu5CJGLbwauZecyKvEUB0JT16DnD5oqL5r7MBOpDunWYRLwMAuRIAFuU+1YNRTGUAwia
	0JEUg+5gRJUeea3T8ZJ57XUhU/HoSyjlm/JyAzaOvpIPW8wgc2gjAYsXNEvzyjoX9an7
	qAmCaI4UfST8WyWz1k1mCdoDxfIJ1NCHa1SAZwaNKLzWJSwt1q8z2xvTMUEIaPZom1kv
	FLpB4ir4Jt/h/f7JmA6lU1HbBdLUUowIZ/xHmSoW86mibOvYproRS0C1cb6SL/mhk918
	SfdA==
MIME-Version: 1.0
Received: by 10.68.189.8 with SMTP id ge8mr50678016pbc.24.1354036082059; Tue,
	27 Nov 2012 09:08:02 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.68.16.225 with HTTP; Tue, 27 Nov 2012 09:08:01 -0800 (PST)
In-Reply-To: <20121127154129.GC3692@jama.jama.net>
References: <20121127154129.GC3692@jama.jama.net>
Date: Tue, 27 Nov 2012 15:08:01 -0200
X-Google-Sender-Auth: DaYL6RsLsaYSPuZdFiRJPZHBITg
Message-ID: <CAP9ODKo518EakBYyeBW7iz=b4jSSbChcs_5EpuK5KniiMaUPtw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: RDEPENDS of packages created by PACKAGES_DYNAMIC not built before image rootfs
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
X-List-Received-Date: Tue, 27 Nov 2012 17:22:16 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Nov 27, 2012 at 1:41 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
> pulseaudio has
> RDEPENDS_pulseaudio-module-console-kit =+ "consolekit"
>
> and pulseaudio-module-console-kit is dynamic package
> PACKAGES_DYNAMIC += "^pulseaudio-lib.* ^pulseaudio-module.* ^libpulse-lib.* ^libpulse-module.* "
>
> If you have image where consolekit is pulled to image only by
> pulseaudio-module-console-kit (e.g. through pulseaudio-server).
> Then consolekit is not built before image do_rootfs is executed and do_rootfs fails.
>
> Easy way to reproduce this is to build e.g. core-image-minimal with
> pulseaudio-module-console-kit or pulseaudio-server added to IMAGE_INSTALL.
> Will fail with:
>   * satisfy_dependencies_for: Cannot satisfy the following dependencies for pulseaudio-server:
>   *    consolekit *
>   * opkg_install_cmd: Cannot install package pulseaudio-server.
>
>
> Not sure what's proper fix, bitbake probably just checks that right provider for
> pulseaudio-module-console-kit is pulseaudio because of PACKAGES_DYNAMIC, but does not check
> RDEPENDS_pulseaudio-module-console-kit after that.
>
> We can add consolekit to build time deps like it was before, but that's just
> work around and not correct fix.
>
> Also filled as
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=3498

Yes; I have this issue in an internal recipe as well. I workarounded
it adding them in the depends.

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


