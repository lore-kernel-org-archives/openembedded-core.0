Received: from mail-wi0-f174.google.com ([209.85.212.174])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1U9jwL-0001t7-Qq
	for openembedded-core@lists.openembedded.org;
	Sun, 24 Feb 2013 23:21:01 +0100
Received: by mail-wi0-f174.google.com with SMTP id hi8so2728809wib.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 24 Feb 2013 14:04:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:date:from:to:cc:message-id:in-reply-to:references
	:subject:x-mailer:mime-version:content-type
	:content-transfer-encoding:content-disposition:x-gm-message-state;
	bh=K3f8tfZIGF/Nuqy6/BZi/h4MhJaKvbwT/rNGavjO4JI=;
	b=G6JG7m09Z5fFvUAPI37EP2jVZ5n8wzWQzqVXlKhhfLIo+iU4k8I8uVh7TkQW95vlQT
	pqTDe01+3F3tFW7ABvGMEeXsc2i1rvoPtDdFIvM3T9DvmbkGY/35l3mqEtNYmyx7hmpZ
	h2lPaRwVfnV9UcEKHDRzQEE8plM0wwOAIaRkVJk2MwMbbnGOA2h6G1/yZUM4JFsZJPc1
	d2+k4sjy+rjxszg7ACNEN5nT/EdvBN/8a+QcwuidBXZOxKQzvWVewLa3JmMCeLN7TCcJ
	vFyPxGi1k1y4IXpTyLXmVP+xLFrpyxSe19I19fB5WBEmUN5CG7t3AdYGoYXQtvPHRsZR
	Vv4g==
X-Received: by 10.194.238.226 with SMTP id vn2mr15065318wjc.23.1361743484552; 
	Sun, 24 Feb 2013 14:04:44 -0800 (PST)
Received: from [192.168.1.11] (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id ej8sm11456958wib.9.2013.02.24.14.04.42
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Sun, 24 Feb 2013 14:04:43 -0800 (PST)
Date: Sun, 24 Feb 2013 22:04:42 +0000
From: Ross Burton <ross.burton@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Message-ID: <399178DB9667444C94B177EA9AC61726@intel.com>
In-Reply-To: <CAP9ODKphcmassr66cE_=M5R20gEYVwbVLwyoZu5NnKi6W0T5Kg@mail.gmail.com>
References: <lyk3q9sam4.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<CAJTo0LYo_FLTkZ_OiFf6Tt_oYO6NoUAUB74s__2UcKv7ccdxaA@mail.gmail.com>
	<E79C80CE9122499B9C7D2D855CDF6319@intel.com>
	<CAP9ODKphcmassr66cE_=M5R20gEYVwbVLwyoZu5NnKi6W0T5Kg@mail.gmail.com>
X-Mailer: sparrow 1.6.4 (build 1178)
MIME-Version: 1.0
X-Gm-Message-State: ALoCoQk268feZlv8Mixn/wtrkMzP0qeQRQxsqch1cJJlsb+6UcJaGM/BJNLRGQGjkyxoLHrUsmF3
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: RFE: make the init manager an image feature (again)
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
X-List-Received-Date: Sun, 24 Feb 2013 22:21:04 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Sunday, 24 =46ebruary 2013 at 14:06, Otavio Salvador wrote:
> > DISTRO=5F=46EATURES contains the init script *style* that you want: s=
ysvinit or systemd. These are not mutually exclusive so specifying both w=
ill get you both directly in packages that support both. I'm still not co=
nvinced we need to split these out into separate packages, the size impac=
t is practically negligible and the dependencies are effectively redundan=
t as you'll have trouble booting without an init system. Instead the post=
insts should wrap the initscript fragments in checks.
> =20
> =20
> The size impact it not negligible; specially for initramfs images but
> what concerns me even more is the upgrade path from previous users of
> meta-oe systemd.


I obviously didn't make myself clear - the size impact is negligible when=
 you're talking about just the init script - the dependencies on systemd/=
updatercd could be recommends at most, as the postinst scripts could chec=
k what init system they have before calling any tools.  Either way a resc=
ue image that boots using busybox init shouldn't have systemd, clearly.
> I'd like to have an upgrade path.

Well, strictly speaking oe-core itself doesn't have an upgrade path to co=
nsider=E2=80=A6 Why can't any distros that shipped with meta-systemd (or =
just in meta-systemd) have an include that injects the RPROVIDES/RREPLACE=
S/RCON=46LICTS for the packages that they enabled=3F

Ross


