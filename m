Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f169.google.com (mail-wi0-f169.google.com
	[209.85.212.169])
	by mail.openembedded.org (Postfix) with ESMTP id 7DDFD73D6A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 May 2015 10:00:42 +0000 (UTC)
Received: by wicmc15 with SMTP id mc15so118409047wic.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 May 2015 03:00:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	bh=wq86ADVAiDvMXufSivPWNILEPhUOwKFfsegv9CnIRfI=;
	b=TfCi040RD1BAJi+Wjld6BF+iBj0RxT0/XI5jbB8b63pP/Rmp/hBd+Xqs9W0g5AtWjn
	7bJ0UVMqauFXinpEXzVCaKw+V3hqSMjRBAYcIgDq+3NU7S1d/QQv19MI9iLVM9tZvuFm
	26XWkkvmvyOyRC9VBQNdwqnrlKFF/h/mb69GEK7eiQ6Pp/QgnB6Wjnl9iu9TKEnlmQpb
	6uYUU2oxYUQqPDfFoO6xQAu7+TJazIGkbY9uSQLAie8deoQ7shSoJBbACloK6b74EQEp
	w4PpMvh/GR8dUowhBxQj8EthKKEwYsIuzDQudUm0ahmXoWEYpjOMuVURrUjX5tOFIjX+
	6Gnw==
X-Received: by 10.180.19.100 with SMTP id d4mr57388647wie.95.1432807242087;
	Thu, 28 May 2015 03:00:42 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by mx.google.com with ESMTPSA id k2sm3210142wix.4.2015.05.28.03.00.40
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 28 May 2015 03:00:40 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 28 May 2015 12:01:03 +0200
To: Steffen Sledz <sledz@dresearch-fe.de>
Message-ID: <20150528100103.GD2383@jama>
References: <5566E259.3000001@dresearch-fe.de>
MIME-Version: 1.0
In-Reply-To: <5566E259.3000001@dresearch-fe.de>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [meta-qt5][fido] commit 699e1570e6 breaks build
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
X-List-Received-Date: Thu, 28 May 2015 10:00:43 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 28, 2015 at 11:39:37AM +0200, Steffen Sledz wrote:
> Commit 699e1570e66cb28e4bfd0eb15d41f3af2bed5b62 (autotools: Fix find race=
s on source directory) in fido branch of openembedded-core breaks build (do=
_configure) of qtbase-native from meta-qt5 fido branch. :(
>=20
> sledz@fensuse:~/work/HIPOS.fido/build-open> BB_NUMBER_THREADS=3D"10" PARA=
LLEL_MAKE=3D"-j 10" MACHINE=3Dqemuarm bitbake qtbase-native

I'm seeing the same in master branches, as temporary work around I've
added:
CLEANBROKEN =3D "1"
but I haven't pushed it to meta-qt5 yet, because I was seeing this issue
only with 5.5_beta1 and was hoping to fix it properly.

> ...
> Build Configuration:
> BB_VERSION        =3D "1.26.0"
> BUILD_SYS         =3D "x86_64-linux"
> NATIVELSBSTRING   =3D "openSUSE-project-13.2"
> TARGET_SYS        =3D "arm-angstrom-linux-gnueabi"
> MACHINE           =3D "qemuarm"
> DISTRO            =3D "angstrom"
> DISTRO_VERSION    =3D "v2015.06"
> TUNE_FEATURES     =3D "arm armv5 thumb dsp"
> TARGET_FPU        =3D "soft"
> meta-hipos        =3D "fido:dcdb2fdd39104c787b97bd67459017baf67ced38"
> meta-fsl-arm      =3D "fido:0cfe91f3291d5c333f7fe657df397ddb520b6d31"
> meta-fsl-arm-extra =3D "fido:bc1269b1be74f319f492090ffd3d836e25d8a559"
> meta-fsl-demos    =3D "fido:1ae8a2d8e9899f0182fa5227acc2b7b6c78039ff"
> meta-java         =3D "master:d2b75b615e4612f9fa05950c1d76d4a719e573d4"
> meta-qt5          =3D "fido:3ccdc239b02aca03dc1e9316b7c5c870b3b59368"
> meta-angstrom     =3D "angstrom-v2015.06-yocto1.8:4b2350b1fdcffd31717c4ce=
256403fe2b391bb8d"
> meta-oe
> meta-systemd
> meta-multimedia
> meta-networking
> meta-webserver
> meta-python
> meta-ruby
> meta-efl
> meta-gnome
> meta-xfce         =3D "fido:5b0305d9efa4b5692cd942586fb7aa92dba42d59"
> meta              =3D "(HEADdetachedat699e157):699e1570e66cb28e4bfd0eb15d=
41f3af2bed5b62"
> ...
> NOTE: recipe qtbase-native-5.4.1-r0: task do_configure: Started
> ERROR: Function failed: do_configure (log file is located at /home/sledz/=
work/HIPOS.fido/build-open/tmp-glibc/work/x86_64-linux/qtbase-native/5.4.1-=
r0/temp/log.do_configure.14085)
> ERROR: Logfile of failure stored in: /home/sledz/work/HIPOS.fido/build-op=
en/tmp-glibc/work/x86_64-linux/qtbase-native/5.4.1-r0/temp/log.do_configure=
=2E14085
> ...

