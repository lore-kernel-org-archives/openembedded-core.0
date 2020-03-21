Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com [209.85.215.196])
 by mx.groups.io with SMTP id smtpd.web12.18452.1584827475373779115
 for <openembedded-core@lists.openembedded.org>;
 Sat, 21 Mar 2020 14:51:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Hihv0G1h;
 spf=pass (domain: gmail.com, ip: 209.85.215.196, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f196.google.com with SMTP id b1so5007795pgm.8
        for <openembedded-core@lists.openembedded.org>; Sat, 21 Mar 2020 14:51:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=vANCRplcWlvHYEs9wZrSM7EdGk2Sycijyx+8u4Kcxyw=;
        b=Hihv0G1hydVYn+aXe/bgriCe5OtBSSeG3nEe7jvZox3Nk/z0HUhpsG2GvkI09Df6St
         NpKVqB0g/uD9ex+FwADbqtbTZ7KMdzZHzIWKEsIbgEnm2xuDHHp8QAsbLMtCEeXosf+n
         cG8eO3I1wTTIeg/uTTyJSKUfcz1StzgFg1e+w/jGqNBcNsmocj04RaZ/wYts91Kog3iw
         +aNclSskteIQJD8P/vKj7Tylb+74LXZr1cFGf3yzwN/+WjL8BQloXUskFUY+/AOBIvZI
         Xaq7MjYGIilRwXbQ0oanpApipimp9VRvG3RdbDRnR10fbXC9YJVKepPZLbm9fbIl6o2Z
         eZ/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=vANCRplcWlvHYEs9wZrSM7EdGk2Sycijyx+8u4Kcxyw=;
        b=Z9lHPc8vo1A+F3cDKZZPNeS0wi+lENUR09gJvDtmHrSzMg42Ud4Exsk74TxZnW4b2y
         Gl+obFBhGjIGFwgy+u1r+NGN5474F++vshc8pxOQqVsUODG9GKCivr/9hTLWQspQtju2
         KN2w+eR/Rvz9Masz6/Evm5uhuUqocF1nxp0Z1uKpohJCV5avBXexGSnURuHVOis/R1OJ
         zFRAVa8Jyi5BOg8buE2efoZ4tID/r/OlzJjgwHk5FsEKsMZFzuxF0+NccALi1SNKJYDC
         Rqcy99nPSlj4d0VJYelgwdK+JJ6JUGZ2YZZNvpsW3bDrGJxm3iljHKt2HaxxqCFoBbQ3
         38BA==
X-Gm-Message-State: ANhLgQ0V2KIq3p+cUTrkCdR7iHu3bVsSG7tSptJiPUD+HPsI/AzfIqjM
	/fcp17dOeBFRwWoEUKM7UcyF1FKf+g4=
X-Google-Smtp-Source: ADFU+vvK88pOUeDr9r4FpIt4+U0MchrclZ5BXd7Gni+CwEJy0wP6KJFHiG1wPDLFa6uTNlLKFICY+Q==
X-Received: by 2002:a62:b40b:: with SMTP id h11mr2555752pfn.116.1584827474163;
        Sat, 21 Mar 2020 14:51:14 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:4e0:24a5:af12:d349:bb13? ([2601:646:9200:4e0:24a5:af12:d349:bb13])
        by smtp.gmail.com with ESMTPSA id n7sm8340950pgm.28.2020.03.21.14.51.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 Mar 2020 14:51:13 -0700 (PDT)
Subject: Re: [OE-core] [PATCH] nfs-utils: fix do_package error when enable PACKAGECONFIG[nfsv4]
To: Randy MacLeod <randy.macleod@windriver.com>,
 Yi Zhao <yi.zhao@windriver.com>, openembedded-core@lists.openembedded.org
References: <20200311033819.15438-1-yi.zhao@windriver.com>
 <b3401922-d841-9e13-6929-a3eb6149bf44@windriver.com>
From: "Khem Raj" <raj.khem@gmail.com>
Message-ID: <8df65dd4-03eb-df07-214b-bf802ebae6a5@gmail.com>
Date: Sat, 21 Mar 2020 14:51:12 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <b3401922-d841-9e13-6929-a3eb6149bf44@windriver.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit



On 3/20/20 8:31 PM, Randy MacLeod wrote:
> On 2020-03-10 11:38 p.m., Yi Zhao wrote:
>> Fixes:
>> ERROR: nfs-utils-2.4.3-r0 do_package: QA Issue: nfs-utils:
>> Files/directories were installed but not shipped in any package:
>> /usr/lib/libnfsidmap/nsswitch.so
>> /usr/lib/libnfsidmap/static.so
>> Please set FILES such that these items are packaged. Alternatively if
>> they are unneeded, avoid installing them or delete them within 
>> do_install.
>> nfs-utils: 2 installed and not shipped files. [installed-vs-shipped]
>>
>> Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
>> ---
>>   meta/recipes-connectivity/nfs-utils/nfs-utils_2.4.3.bb | 10 ++++++----
>>   1 file changed, 6 insertions(+), 4 deletions(-)
>>
>> diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.4.3.bb 
>> b/meta/recipes-connectivity/nfs-utils/nfs-utils_2.4.3.bb
>> index 42a4ba3dbd..9bdb6f4ae4 100644
>> --- a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.4.3.bb
>> +++ b/meta/recipes-connectivity/nfs-utils/nfs-utils_2.4.3.bb
>> @@ -67,9 +67,9 @@ PACKAGECONFIG_remove_libc-musl = "tcp-wrappers"
>>   PACKAGECONFIG[tcp-wrappers] = 
>> "--with-tcp-wrappers,--without-tcp-wrappers,tcp-wrappers"
>>   PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,"
>>   # libdevmapper is available in meta-oe
> 
>> -PACKAGECONFIG[nfsv41] = "--enable-nfsv41,--disable-nfsv41,libdevmapper"
>> -# keyutils is available in meta-security
>> -PACKAGECONFIG[nfsv4] = "--enable-nfsv4,--disable-nfsv4,keyutils"
> 
>> +PACKAGECONFIG[nfsv41] = 
>> "--enable-nfsv41,--disable-nfsv41,libdevmapper,libdevmapper"
> 
> Did you really mean to have libdevmapper twice?
> If so, why not make it a mandatory DEPENDS?
> 

One of them is rdep and other is builddep, so it should be fine
they only trigger when this knob is enabled.

>> +# keyutils is available in meta-oe
>> +PACKAGECONFIG[nfsv4] = 
>> "--enable-nfsv4,--disable-nfsv4,keyutils,python3-core"
> 
> Why? This change wasn't explained in the long log.
> 
> The rest seems fine, v2 please.
> 
> ../Randy
> 
>>   PACKAGES =+ "${PN}-client ${PN}-mount ${PN}-stats"
>> @@ -94,7 +94,9 @@ FILES_${PN}-mount = "${base_sbindir}/*mount.nfs*"
>>   FILES_${PN}-stats = "${sbindir}/mountstats ${sbindir}/nfsiostat"
>>   RDEPENDS_${PN}-stats = "python3-core"
>> -FILES_${PN} += "${systemd_unitdir}"
>> +FILES_${PN}-staticdev += "${libdir}/libnfsidmap/*.a"
>> +
>> +FILES_${PN} += "${systemd_unitdir} ${libdir}/libnfsidmap/"
>>   do_configure_prepend() {
>>           sed -i -e 's,sbindir = /sbin,sbindir = ${base_sbindir},g' \
>>
> 
> 
