Return-Path: <anders.heimer@runbox.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F25BCD98E4
	for <webhook@archiver.kernel.org>; Tue, 16 Jun 2026 13:36:18 +0000 (UTC)
Received: from mailtransmit04.runbox.com (mailtransmit04.runbox.com [185.226.149.37])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.154375.1781616967218638078
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Jun 2026 06:36:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@runbox.com header.s=selector1 header.b=CllnJ8lN;
 spf=pass (domain: runbox.com, ip: 185.226.149.37, mailfrom: anders.heimer@runbox.com)
Received: from mailtransmit03.runbox ([10.9.9.163] helo=aibo.runbox.com)
	by mailtransmit04.runbox.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <anders.heimer@runbox.com>)
	id 1wZTxU-00Gejw-5s; Tue, 16 Jun 2026 15:36:04 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=runbox.com;
	 s=selector1; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:To:Subject:MIME-Version:Date:Message-ID;
	bh=PKMOxHu50gNoT8SdMdM74v456Ln99RUqKv2a08jW0TE=; b=CllnJ8lNYz4i59lVZf75n6sRbD
	vS2bf6Yn9UcagOuISV0qvkAUX8xto0HZ3AG1Dsn8n98sUeaSYIEIbG0kYe8/F18+EhrhGGLMATDAc
	EkbtGKtiLjj0kV/X+08XeZef/EMh7326WCzLEP99770fW31LAQXrbgp/F0mYOsecCX7059q2OfUBy
	Ap9p8/LzTTujxrg+5Z6jgxcCfhF7AZmObjgJJRux4nNzEqUjt73WiV5BjlfCOiwYupV7Hc63on0xr
	NT2kqjwUZkG/Yysm7zN5yOUNf4OYyDksfySWHDP8Nll50StXzugCXf9moZZePLwkKDrmxFVEPxHb+
	8UnvHTKw==;
Received: from [10.9.9.73] (helo=submission02.runbox)
	by mailtransmit03.runbox with esmtp (Exim 4.86_2)
	(envelope-from <anders.heimer@runbox.com>)
	id 1wZTxJ-0006d1-59; Tue, 16 Jun 2026 15:35:53 +0200
Received: by submission02.runbox with esmtpsa  [Authenticated ID (926809)]  (TLS1.2:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.95)
	id 1wZTx3-00GYJT-65;
	Tue, 16 Jun 2026 15:35:37 +0200
Message-ID: <77f24693-adcf-44b8-bf5e-af4a8f1bdee7@runbox.com>
Date: Tue, 16 Jun 2026 15:35:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 1/2] package: replace copydebugsources shell
 pipelines with Popen
To: Paul Barker <paul@pbarker.dev>, Anders Heimer <anders.heimer@est.tech>,
 openembedded-core@lists.openembedded.org
References: <20260616082516.1553768-1-anders.heimer@est.tech>
 <20260616082516.1553768-2-anders.heimer@est.tech>
 <d85afa2fdb8aa0d09a8d9e0ec106c201b1630e9e.camel@pbarker.dev>
Content-Language: en-US
From: Anders Heimer <anders.heimer@runbox.com>
In-Reply-To: <d85afa2fdb8aa0d09a8d9e0ec106c201b1630e9e.camel@pbarker.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Jun 2026 13:36:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238900

Hi Paul,

On 6/16/26 14:12, Paul Barker wrote:
> On Tue, 2026-06-16 at 10:25 +0200, Anders Heimer wrote:
>> -        for pmap in prefixmap:
>> +        env = os.environ.copy()
>> +        env["LC_ALL"] = "C"
>> +
>> +        for pmap, prefix in prefixmap.items():
>> +            dstroot = dvar + prefix
>>               # Ignore files from the recipe sysroots (target and native)
>> -            cmd =  "LC_ALL=C ; sort -z -u '%s' | egrep -v -z '((<internal>|<built-in>)$|/.*recipe-sysroot.*/)' | " % sourcefile
>> +            sort_p = subprocess.Popen(["sort", "-z", "-u", "--", sourcefile], stdout=subprocess.PIPE, stderr=subprocess.DEVNULL, env=env)
>> +            egrep_p = subprocess.Popen(["egrep", "-v", "-z", "-e", r"((<internal>|<built-in>)$|/.*recipe-sysroot.*/)"], stdin=sort_p.stdout, stdout=subprocess.PIPE, stderr=subprocess.DEVNULL, env=env)
>> +            sort_p.stdout.close()
>> +
>>               # We need to ignore files that are not actually ours
>>               # we do this by only paying attention to items from this package
>> -            cmd += "fgrep -zw '%s' | " % prefixmap[pmap]
>> +            fgrep_p = subprocess.Popen(["fgrep", "-zw", "-e", prefix], stdin=egrep_p.stdout, stdout=subprocess.PIPE, stderr=subprocess.DEVNULL, env=env)
>> +            egrep_p.stdout.close()
>> +
>>               # Remove prefix in the source paths
>> -            cmd += "sed 's#%s/##g' | " % (prefixmap[pmap])
>> -            cmd += "(cd '%s' ; cpio -pd0mlLu --no-preserve-owner '%s%s' 2>/dev/null)" % (pmap, dvar, prefixmap[pmap])
>> +            sed_p = subprocess.Popen(["sed", "s#%s/##g" % prefix], stdin=fgrep_p.stdout, stdout=subprocess.PIPE, stderr=subprocess.DEVNULL, env=env)
>> +            fgrep_p.stdout.close()
>> +
>> +            cpio_p = subprocess.Popen(["cpio", "-pd0mlLu", "--no-preserve-owner", dstroot], stdin=sed_p.stdout, cwd=pmap, stderr=subprocess.DEVNULL, env=env)
>> +            sed_p.stdout.close()
>> +
>> +            for proc in (cpio_p, sed_p, fgrep_p, egrep_p, sort_p):
>> +                proc.wait()
> Hi Anders, thanks for the patches!
>
> If we're reworking this code, I think we should replace the complex
> sed/grep/sort pipeline with Python code. We can read into a Python list
> and sort/filter using the Python standard library, then pass the results
> to cpio.

Thank you,  I am very happy to implement this approach instead. I 
strongly agree with all your comments.

/Anders


