Return-Path: <raj.khem@gmail.com>
Received: from mail-wm0-f51.google.com (mail-wm0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id E68C971B13
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Apr 2017 18:53:34 +0000 (UTC)
Received: by mail-wm0-f51.google.com with SMTP id y18so14545860wmh.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Apr 2017 11:53:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=yMAfVodnWRK4ljl2SBLo936Zk5fBTqht+r23c7pdT8w=;
	b=rmQs0ywFIQgLvgflHH2YbPzNLVQjWmTQYPvS9dD0LgxNBpFknsjsGBFocGsVKS6rSN
	FGK3sq7zYHRk4Hop1ggHhh2VAio/Z5XnQQX8l4hdLJ41fInY2Ea677HP2Kz6F6sxWcqP
	Al3ur6PMya4ogHCH5oKKQeliJr2hR3jFLPNX6PxTEHM/9neWHmgl26snyTNfM0mYsJw2
	mDo1HSQ8ar8gW2DOpeXILA6Bpr3WjyqAcaw7y7T5WZ/U6IrKabXockg0+hU/PD8zIMZQ
	nkhtktvlSWfw4Z3s2EKwIp+QqiOotKxfLivWr2P32QGXuQ1AZrw9aHScn0AYovSmpgl0
	jPhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=yMAfVodnWRK4ljl2SBLo936Zk5fBTqht+r23c7pdT8w=;
	b=PIIrQxTiXya/hTEMVdQB9NC11PHJXoEMWopOHfUNPpqulDp1PmJv5fMqfHbhOtRz6G
	x9zTY0aYRDPqw4Qn5+1YKOlD/BrsF5X4F3dJSjcuiGBzKYYT3QiEfwKOD5IaP2CgIrbV
	TttVTPxrgfqUfO+SiLZeCN2rhAb4O+qN4xEhyqhsPkhLs157/Rs+HV7w38TWpZreOAyD
	0nXCxLcnPdUxwsgXhN/CfZNULuXWItSjkEkUZH7hf3EMgtnpIce/XJacgDJJC+erGFvE
	YNO0lfTZk+j1276CmnBt4C2VMqt42Couqnilcaa1r6XmioSW05hioWFSrohi0A2D00Ny
	BL1g==
X-Gm-Message-State: AN3rC/5csyPytGv2+IIgqxBFNhcBKlFSU2SgbL90cBGAklLRwsaPszb8
	S+jMy6LbaSraV4V9c2zcADl4OS2fTQ==
X-Received: by 10.28.87.70 with SMTP id l67mr13711220wmb.37.1492541615407;
	Tue, 18 Apr 2017 11:53:35 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.180.141 with HTTP; Tue, 18 Apr 2017 11:53:04 -0700 (PDT)
In-Reply-To: <1492527724-26361-1-git-send-email-bkylerussell@gmail.com>
References: <1492527724-26361-1-git-send-email-bkylerussell@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 18 Apr 2017 11:53:04 -0700
Message-ID: <CAMKF1soMAfgVG78+dywZ5nAnmAfi0-6hnUjC+MohWHm7JsBuUw@mail.gmail.com>
To: Kyle Russell <bkylerussell@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] cmake.bbclass: Set CMAKE_CROSSCOMPILING correctly
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
X-List-Received-Date: Tue, 18 Apr 2017 18:53:35 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Apr 18, 2017 at 8:02 AM, Kyle Russell <bkylerussell@gmail.com> wrote:
> If CMAKE_SYSTEM_NAME is defined, CMake assumes we're cross-compiling,
> which is not necessarily the case.
> ---
>  meta/classes/cmake.bbclass | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/meta/classes/cmake.bbclass b/meta/classes/cmake.bbclass
> index 9e74599..2dbaa8c 100644
> --- a/meta/classes/cmake.bbclass
> +++ b/meta/classes/cmake.bbclass
> @@ -42,9 +42,13 @@ def map_target_arch_to_uname_arch(target_arch):
>      return target_arch
>
>  cmake_do_generate_toolchain_file() {
> +       if [ "${BUILD_SYS}" == "${HOST_SYS}" ]; then

dont use == here that will make it bash specific.

> +           CMAKE_CROSSCOMPILING="set( CMAKE_CROSSCOMPILING FALSE )"
> +       fi
>         cat > ${WORKDIR}/toolchain.cmake <<EOF
>  # CMake system name must be something like "Linux".
>  # This is important for cross-compiling.
> +${CMAKE_CROSSCOMPILING}
>  set( CMAKE_SYSTEM_NAME `echo ${TARGET_OS} | sed -e 's/^./\u&/' -e 's/^\(Linux\).*/\1/'` )
>  set( CMAKE_SYSTEM_PROCESSOR ${@map_target_arch_to_uname_arch(d.getVar('TARGET_ARCH'))} )
>  set( CMAKE_C_COMPILER ${OECMAKE_C_COMPILER} )
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

