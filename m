Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED7DFCAC5A5
	for <webhook@archiver.kernel.org>; Wed, 24 Sep 2025 20:09:00 +0000 (UTC)
Received: from mail-io1-f50.google.com (mail-io1-f50.google.com [209.85.166.50])
 by mx.groups.io with SMTP id smtpd.web10.24058.1758744538447738332
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Sep 2025 13:08:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=iF9vCl+6;
 spf=pass (domain: gmail.com, ip: 209.85.166.50, mailfrom: raj.khem@gmail.com)
Received: by mail-io1-f50.google.com with SMTP id ca18e2360f4ac-8cf4f90b6f0so17190439f.0
        for <openembedded-core@lists.openembedded.org>; Wed, 24 Sep 2025 13:08:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758744537; x=1759349337; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NStPYntbghYVeUamdIoR0T4eFxqTxuQUf8ZBQXDgoJY=;
        b=iF9vCl+6LhdGPvdmlxKhF+dIg5B86DFu0ug4LvYb/6YggFBMLH9ZaqdwTS3EeVkbtH
         uXpp60/ojTgynGZl56OA10sfW1beDD7EFB4LAzvYciJcMu3V0HKkTiBd7S2FTEL2rI/C
         CzAMO6VapGEVOls8xBFoX3jH68u6x7y9BrV3bqcygTXtjFNaB+qV0hD/VdOd7z4IKuIy
         v08k1pqcBGz8fPbXCowJxtAGxOHURvsWAtniC7iKMItUibIQJA4hgD7NRQQ+36hHHj/G
         w5ifTcGs7zRNMpqNvYvro3OQUeRq6ow8CmdcssOUqfWarIcTC+CgX3/nStMwW/xrX8Uq
         Ljug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758744537; x=1759349337;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NStPYntbghYVeUamdIoR0T4eFxqTxuQUf8ZBQXDgoJY=;
        b=CFTORzQiVmphFGMXUgkSE7sJ186gL2I1C0jbgbiCwhJpKehkv7PMdo8FZ7jhsFfrHL
         rxAfvefRaEZI5SKQp/ckoSVESNEwhyuiWVAxF21ZHdU3vLatFFeZHGaXbnoYOO3HLBBc
         f4Af4rm8IEPQjsgDcBDZ1Gpu4Tt6F1HWdOrtK2KAZQXoSFKn0GCnl7MRkRsVc0cEMYNh
         cv3RBfjDuLNlNKWFrkoGThExrWP6oqYRqcf1k6B3MTxT2t2h+8HcQr5XweMoHvKDiE/B
         g5geGyU0NrPx94E4J5PkM3nulF+lla54OskvcI39J67vh8AaI7QpSdJxKwZ8E+HN4E7p
         j0cA==
X-Forwarded-Encrypted: i=1; AJvYcCVRe6eulyvgZqvF5e9sdu/CcEWr8odrH8UPVC5/BVShPdolcyEwYQWbNQ7KaHVTQmYuMHsuBWP8/JRQRwZkSsWBlw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwOeA+YL4vQNrWs6+hFOOmjt4TJKsEB8NaQJafgh6mFFK9mtOD0
	NxDic1DmmEWQMULEB3ZDZ1xcovmtwxXieGcmod5y+ioOcVILy2uZlmJo
X-Gm-Gg: ASbGncuGOKRbt7vuCGxQCcGGokQgFQ51JiPnt9MqzRd+7L7k7RSAWSGbKKS+UW5iHiN
	44lHzh1B9D0ZYl8qPanlCNQK4nGUhyhkf6muaIij+t+JIMTOCuPxGu2ljNTi0nka6vRvhTVhS9C
	fvCnm8aZQZ+qYKYIEE9kGHXEXf+E+Wm1OcuUKg3gRsz49/o+ulol/g1K3rx4XCNmvChJp0shfVk
	FtzAcS00+VMC1gn8ydB5F67H5kFS8QL1sJg7eLgxIXbgmaRBsLInQV7GDBf1aEZFBqAK7L26Pe3
	X2poNHMpIA9A+lEZ66kUbPxtILSiecWS7RzziCchEC/CgOhhx8lvJnpSlyKb5CsLfiWg5tV6bxw
	OjwItYt78PNLV8cir3mQ/FzLQTB6bSF16lZwtCb1iJ4/A0XXt8QPrc65Sjo7R28xO70JFPpH8gw
	vBnhPPTVNgMvU8/ERkiOQrZj49Qr//KTE9I/69flQptgd9rF1XmlSDneiPD4rwvZ3LikZPz4CUf
	Og4oet3oHa63OfGHpzH2gunDSfG9m4=
X-Google-Smtp-Source: AGHT+IFjynuKCoKGO30ujdqgWojbLwiNUJnayuWK5v24c2F5N7SxjDCPd2LSWV0GE7heOqd+J8oafw==
X-Received: by 2002:a05:6602:1b14:b0:8b9:3c36:4303 with SMTP id ca18e2360f4ac-901567eebd2mr155915639f.7.1758744537441;
        Wed, 24 Sep 2025 13:08:57 -0700 (PDT)
Received: from ?IPV6:2601:646:8201:fd20:289b:c5dd:de6c:a09f? ([2601:646:8201:fd20:289b:c5dd:de6c:a09f])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-56a65463b89sm55540173.24.2025.09.24.13.08.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Sep 2025 13:08:57 -0700 (PDT)
Message-ID: <fa1ae7ce-fb58-4171-86f4-c43b9341de25@gmail.com>
Date: Wed, 24 Sep 2025 13:08:56 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 1/5] lame: don't use -march=native when building
 with clang
To: ross.burton@arm.com, openembedded-core@lists.openembedded.org
References: <20250924120745.2883969-1-ross.burton@arm.com>
Content-Language: en-US
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <20250924120745.2883969-1-ross.burton@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Sep 2025 20:09:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223987



On 9/24/25 5:07 AM, Ross Burton via lists.openembedded.org wrote:
> Because of a logic error, lame's configure always passes -march=native
> when building with clang.

It perhaps is useful when build == host i.e. native builds only.

> 
> This is a terrible idea in general as it's not often your build machine
> and target hardware aligns, and leads to some amusing errors:
> 
>    unknown target CPU 'neoverse-n1'
>    note: valid target CPU values are: i386, i486, ...
> 
> Move the HAVE_CLANG block up into the FULL_OPTIMIZATION case, alongside
> HAVE_GCC.  This option is never enabled (as it's basically "use native")
> so resolves the build failure.
> 
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>   meta/recipes-multimedia/lame/lame/clang.patch | 99 +++++++++++++++++++
>   meta/recipes-multimedia/lame/lame_3.100.bb    |  1 +
>   2 files changed, 100 insertions(+)
>   create mode 100644 meta/recipes-multimedia/lame/lame/clang.patch
> 
> diff --git a/meta/recipes-multimedia/lame/lame/clang.patch b/meta/recipes-multimedia/lame/lame/clang.patch
> new file mode 100644
> index 00000000000..116000c577b
> --- /dev/null
> +++ b/meta/recipes-multimedia/lame/lame/clang.patch
> @@ -0,0 +1,99 @@
> +Don't use -march=native when building with clang
> +
> +Because of a logic error, lame's configure always passes -march=native
> +when building with clang.
> +
> +This is a terrible idea in general as it's not often your build machine
> +and target hardware aligns, and leads to some amusing errors:
> +
> +	unknown target CPU 'neoverse-n1'
> +	note: valid target CPU values are: i386, i486, ...
> +
> +Move the HAVE_CLANG block up into the FULL_OPTIMIZATION case, alongside
> +HAVE_GCC.  This option is never enabled (as it's basically "use native")
> +so resolves the build failure.
> +
> +Upstream-Status: Pending
> +Signed-off-by: Ross Burton <ross.burton@arm.com>
> +
> +diff --git i/configure.in w/configure.in
> +index 5e43179..d51b017 100644
> +--- i/configure.in
> ++++ w/configure.in
> +@@ -960,45 +960,43 @@ if test "x$HAVE_GCC" = "xyes" -o "x$HAVE_CLANG" = "xyes"; then
> + 				;;
> + 			esac
> + 		fi
> ++
> ++		if test "x${HAVE_CLANG}" = "xyes"; then
> ++			case "${CLANG_VERSION}" in
> ++			3.[89]*|[45].*)
> ++				OPTIMIZATION="-Ofast"
> ++				;;
> ++			*)
> ++				OPTIMIZATION="-O3"
> ++				;;
> ++			esac
> ++
> ++			# generic CPU specific options
> ++			case ${host_cpu} in
> ++			*486)
> ++				OPTIMIZATION="${OPTIMIZATION} -march=i486"
> ++				;;
> ++			*586)
> ++				OPTIMIZATION="${OPTIMIZATION} -march=i586 \
> ++					-mtune=native"
> ++				;;
> ++			*686)
> ++				OPTIMIZATION="${OPTIMIZATION} -march=i686 \
> ++					-mtune=native"
> ++				;;
> ++			*86)
> ++				OPTIMIZATION="${OPTIMIZATION} -march=native \
> ++					-mtune=native"
> ++				;;
> ++			esac
> ++
> ++		fi
> + 		;;
> + 	*)
> + 		AC_MSG_ERROR(bad value �${CONFIG_EXPOPT}� for expopt option)
> + 		;;
> + 	esac
> +
> +-
> +-	if test "x${HAVE_CLANG}" = "xyes"; then
> +-		case "${CLANG_VERSION}" in
> +-		3.[89]*|[45].*)
> +-			OPTIMIZATION="-Ofast"
> +-			;;
> +-		*)
> +-			OPTIMIZATION="-O3"
> +-			;;
> +-		esac
> +-
> +-		# generic CPU specific options
> +-		case ${host_cpu} in
> +-		*486)
> +-			OPTIMIZATION="${OPTIMIZATION} -march=i486"
> +-			;;
> +-		*586)
> +-			OPTIMIZATION="${OPTIMIZATION} -march=i586 \
> +-				-mtune=native"
> +-			;;
> +-		*686)
> +-			OPTIMIZATION="${OPTIMIZATION} -march=i686 \
> +-				-mtune=native"
> +-			;;
> +-		*86)
> +-			OPTIMIZATION="${OPTIMIZATION} -march=native \
> +-				-mtune=native"
> +-			;;
> +-		esac
> +-
> +-	fi
> +-
> +-
> + 	if test "${expopt_msg_result_printed}" = "no" ; then
> + 		AC_MSG_RESULT(${CONFIG_EXPOPT})
> + 	fi
> diff --git a/meta/recipes-multimedia/lame/lame_3.100.bb b/meta/recipes-multimedia/lame/lame_3.100.bb
> index efaf3b9817a..42689df3511 100644
> --- a/meta/recipes-multimedia/lame/lame_3.100.bb
> +++ b/meta/recipes-multimedia/lame/lame_3.100.bb
> @@ -12,6 +12,7 @@ DEPENDS = "ncurses gettext-native"
>   
>   SRC_URI = "${SOURCEFORGE_MIRROR}/lame/lame-${PV}.tar.gz \
>              file://no-gtk1.patch \
> +           file://clang.patch \
>              "
>   
>   SRC_URI[sha256sum] = "ddfe36cab873794038ae2c1210557ad34857a4b6bdc515785d1da9e175b1da1e"
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#223962): https://lists.openembedded.org/g/openembedded-core/message/223962
> Mute This Topic: https://lists.openembedded.org/mt/115410427/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


