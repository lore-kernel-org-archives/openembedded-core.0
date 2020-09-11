Received: from dd41138.kasserver.com (dd41138.kasserver.com [85.13.157.12])
 by mx.groups.io with SMTP id smtpd.web10.9185.1599833834812729811
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Sep 2020 07:17:15 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: herbrechtsmeier.net, ip: 85.13.157.12, mailfrom: stefan@herbrechtsmeier.net)
Received: from [192.168.178.42] (unknown [94.134.94.122])
	by dd41138.kasserver.com (Postfix) with ESMTPSA id 9612D11A072B;
	Fri, 11 Sep 2020 16:17:11 +0200 (CEST)
Subject: Re: [OE-core] Application depending on gRPC not linking properly
To: Goran Broeckaert <broeckaert.goran@gmail.com>,
 openembedded-core@lists.openembedded.org
References: <CANq43+EQnPYiWxqFBK6Zb6j99ot_ZUNVkE69EHYfcLv2DefvHA@mail.gmail.com>
From: "Stefan Herbrechtsmeier" <stefan@herbrechtsmeier.net>
Message-ID: <dcbff17f-e051-0c85-7bfc-da4099049230@herbrechtsmeier.net>
Date: Fri, 11 Sep 2020 16:17:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CANq43+EQnPYiWxqFBK6Zb6j99ot_ZUNVkE69EHYfcLv2DefvHA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi,

Am 09.09.20 um 14:56 schrieb Goran Broeckaert:
> I have a simple application which depends on grpc. I'm using Yocto Zeus 
> for my project and I've written the following recipe:

[snip]

> The linker tries to link with the -native version of gRPC instead of the 
> target one. Can be seen in the following line from the output:
> 
> recipe-sysroot-native/usr/lib/libgrpc++.so.1.24.1: error adding symbols: 
> file in wrong format

The grpc cmake config requires the binaries and Yocto doesn't install 
cross compile binaries into the sysroot. Therefore the grcp recipe has a 
bad hack and install the cmake files from the native package:

SYSROOT_DIRS_BLACKLIST_append_class-target = "${baselib}/cmake/grpc"

I have try to fix the root cause in grpc but the pull request was closed 
by the developers because 'Yocto is not a platform we [grpc] officially 
support':

https://github.com/grpc/grpc/pull/22498

Regards
   Stefan
