Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com [209.85.215.193])
 by mx.groups.io with SMTP id smtpd.web10.10497.1599696946845158925
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Sep 2020 17:15:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=WfC1MRsm;
 spf=pass (domain: gmail.com, ip: 209.85.215.193, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f193.google.com with SMTP id 67so3246641pgd.12
        for <openembedded-core@lists.openembedded.org>; Wed, 09 Sep 2020 17:15:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:organization:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=iCo4BTzstuI+Rcfe0wzXWhi2KU0N7Re2Vb6I3ziGmEo=;
        b=WfC1MRsm4GJwoB3pbdkGnPNI0j7MQYQ45Kn4n1PInA5ec3yWNhpuLmowwofL1WcfDB
         WMBGidf/ef7d5K1Oa5XVEluxvt6v4tIqctfM7mA0jkIYXhVr7y0R/py/MMNXuuEdqR2y
         XKclsip+56k7Q9GGe6JmZPiY5n9ZNdh9wiVfBXGFkkilESx5g6MGDqncthJgDtT5fgka
         FDud5IJRTdZ3iplEgbU+AXiEHm7JNpKZ1eMt+5e8JyZip0+oCX8DAWp308zcqFbQCLqQ
         0Rs8Ye3+X2+09uepN3CCg+zmZO2GilEhMH3wtA2UxyNWTghk58Wv2enY7xXRmgWfuy8c
         e++A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=iCo4BTzstuI+Rcfe0wzXWhi2KU0N7Re2Vb6I3ziGmEo=;
        b=Op+dyHBj8uAB9vB4havpYI9GWdXbeINt1apC4ARBKNsh+QfNiH+5ScDb5XZ2hm2yWe
         T6d5O/7ch259sxrYZNESPwefdbjXA4NJUPQqVlPQGc5mM5DmTBqMKVVhj77+U26PyIcm
         3zUXtuYX7t1cow3q+dyWzYCsDylRrJe77M3j7dDLCLSeS0aQQiEiXTJ82Yn7cJT0JBoD
         euRYlZFU2TayQENw897dM36acCQTp0d6uhN4GqNOJzuDQmb55bsgYQKQmuSctaUc55ja
         rS9p3LoTGskp+dTxUFuLtMNAOdmjht1oLaaIckgjVl3uAwMEFC6GJYqRa29BcaoNmZ6c
         SVzg==
X-Gm-Message-State: AOAM532tZZMqsO70qEKiJDIxanhhMOMQe0rmJw2Yc4LprOwZQY9ynh9N
	JPViHKXOf3AnBHoCM2rgL/g5OcRGcTW1wg==
X-Google-Smtp-Source: ABdhPJwWZXCe4NTPOPB0WwNwv0x4T0yq31/I+Qj4WiDOeTcc3kbV0wWhEer57BPR95v+ck80OWp4fQ==
X-Received: by 2002:a65:6808:: with SMTP id l8mr2450106pgt.207.1599696946077;
        Wed, 09 Sep 2020 17:15:46 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:4e0::ff6e? ([2601:646:9200:4e0::ff6e])
        by smtp.gmail.com with ESMTPSA id k5sm469332pjl.3.2020.09.09.17.15.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2020 17:15:45 -0700 (PDT)
Subject: Re: [OE-core] Application depending on gRPC not linking properly
To: Goran Broeckaert <broeckaert.goran@gmail.com>,
 openembedded-core@lists.openembedded.org
References: <CANq43+EQnPYiWxqFBK6Zb6j99ot_ZUNVkE69EHYfcLv2DefvHA@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <b50e6ff8-5fb9-e654-f895-7e6a494f564b@gmail.com>
Date: Wed, 9 Sep 2020 17:15:44 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <CANq43+EQnPYiWxqFBK6Zb6j99ot_ZUNVkE69EHYfcLv2DefvHA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit



On 9/9/20 5:56 AM, Goran Broeckaert wrote:
> Hello,
> 
> I have a simple application which depends on grpc. I'm using Yocto Zeus
> for my project and I've written the following recipe:
> 
> DESCRIPTION = "Test Application"
> LICENSE = "CLOSED"
> LIC_FILES_CHKSUM = ""
> 
> SRC_URI = "\
> git://git/dev/test-application.git;protocol=ssh;branch=yocto;name=testapp \
> "
> 
> inherit cmake qmake5_paths
> 
> DEPENDS = "\
> qtbase \
> qtbase-native \
> grpc \
> grpc-native \
> "
> 
> PV = "1.0+git${SRVPV}"
> 
> SRCREV_testapp = "c1dd51dd6c812a99f6af3e5b1c367a3155e5e96f"
> 
> S = "${WORKDIR}/git"
> 
> EXTRA_OECMAKE = "\
> -DCMAKE_PREFIX_PATH=${WORKDIR}/recipe-sysroot/usr/ \
> -DOE_QMAKE_PATH_EXTERNAL_HOST_BINS=${OE_QMAKE_PATH_EXTERNAL_HOST_BINS} \
> -DCMAKE_CROSSCOMPILING=ON \
> "
> 
> The linker tries to link with the -native version of gRPC instead of the
> target one. Can be seen in the following line from the output:
> 
> recipe-sysroot-native/usr/lib/libgrpc++.so.1.24.1: error adding symbols:
> file in wrong format
> 
> When checking the recipe-sysroot, the grpc libraries are properly
> installed. There has been an issue opened on the grpc github, but it got
> closed without specifying a
> solution: https://github.com/grpc/grpc/issues/17708


Can you take a look at
https://github.com/grpc/grpc/blob/master/test/distrib/cpp/run_distrib_test_raspberry_pi.sh
and see if some of those options are useful either compiling gRPC or
your app ?

also check this patch
https://git.openembedded.org/meta-openembedded/commit/?id=38f6ef9b1432cbafd416ec162b0a30366311095b

especially how it looks for libcares, might give some ideas how to solve
this issue perhaps.

> 
> Thanks for the help,
> 
> Kind regards,
> Goran Broeckaert
> 
> 
> 
