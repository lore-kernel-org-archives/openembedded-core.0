Received: from mail-io1-f68.google.com (mail-io1-f68.google.com [209.85.166.68])
 by mx.groups.io with SMTP id smtpd.web10.12183.1585924450370852358
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Apr 2020 07:34:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ByoETYOZ;
 spf=pass (domain: gmail.com, ip: 209.85.166.68, mailfrom: jpewhacker@gmail.com)
Received: by mail-io1-f68.google.com with SMTP id o3so7746474ioh.2
        for <openembedded-core@lists.openembedded.org>; Fri, 03 Apr 2020 07:34:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:subject:to:references:message-id:date:user-agent:mime-version
         :in-reply-to:content-transfer-encoding:content-language;
        bh=91hFspp+2uPUQE09LpV7CFAbRGIvgRTBC41RnG3tHVM=;
        b=ByoETYOZ3z0lFm0BVQoebkY+vtYH/VfoS3kpgMjyBikWqWnSbnzQOC7WKxleyVHz1U
         DvCBIsITO84wzVkZKcHRhIP5TsMmSkaP1eVRqpCqoty5RCj3gXZlGFytHzglIaGFVGQS
         3lxHmh8s3mJAdXDae+3WPaZ/pLWHfruVD9B24MfsFxe2Yr0uIZix1RUHLcwpJNEymosU
         yJqojMWAaP2iQfOe5qtjycZRFoFIUHmy+QejzlW4RXYs8wQ1HmmjD01K+vhyY8FHsD4k
         UfYUTrxfEhttbV9fZ16/eh0BV9BI7i11iMAef3Exevlneqb6OpNsYFyzjTJiAcgUYrDH
         ZoaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=91hFspp+2uPUQE09LpV7CFAbRGIvgRTBC41RnG3tHVM=;
        b=tErYor6RAg6agbQICbwNE5KvM09OJrKvsVrUreSaEZBZYxwr6ErJM3wnTndCfdRK+A
         6xhaeZMAoSBa6Z8fff99ilGQ/gMBKX3tzYzOQXVgC2u3ExKXodXG8f8WSLYX1NcNTx2T
         /UgFRMB4Uq/UPwfA2GAPX7iweg7/VHF9ypZNTDKtXgXcbL+jBjlXCphUT/IyMeRELkL5
         yUU/QAgRaufUo4AwECoTgCimh0grC12gKRHQNWTN6W53ePQXJG449AeV43yVI8sGwKd4
         2RgFLgPDjG1XEOH5aTi36RzZwiFwC93dcBe54MLKDIyrhnKzTkizQNk02VIrC9KaL/nK
         xRgw==
X-Gm-Message-State: AGi0PuYQsXCy9wMqIKFXOlCGhVqu1SmPGznK9CSg4+e07A/85MnSMAUG
	9hyQ8wK3J4rtBw8aDy5rIPhhZp+p9L8=
X-Google-Smtp-Source: APiQypJ35qmcC7rWcXUxCAs+NjvcBLnMtzRAnvU2p3V07iwGtz2l66yjfFAAf/q552qCOurEbBJC4g==
X-Received: by 2002:a6b:b747:: with SMTP id h68mr8037674iof.105.1585924449484;
        Fri, 03 Apr 2020 07:34:09 -0700 (PDT)
Return-Path: <jpewhacker@gmail.com>
Received: from ?IPv6:2605:a601:ac3d:c100:5893:3fb5:2c4e:5d65? ([2605:a601:ac3d:c100:5893:3fb5:2c4e:5d65])
        by smtp.gmail.com with ESMTPSA id s25sm2777940ilb.37.2020.04.03.07.34.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Apr 2020 07:34:08 -0700 (PDT)
From: "Joshua Watt" <JPEWhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
Subject: Re: [OE-core][PATCH] classes/reproducible_build: Skip SDE for non-finalizing virtual recipes
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
References: <20200402180832.12814-1-JPEWhacker@gmail.com>
 <b69366f4b2632b18997691497c8799a93cb36b27.camel@linuxfoundation.org>
Message-ID: <0d23a1a6-6dc0-7fb2-09ce-47b255f5773c@gmail.com>
Date: Fri, 3 Apr 2020 09:34:08 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <b69366f4b2632b18997691497c8799a93cb36b27.camel@linuxfoundation.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

On 4/2/20 3:42 PM, Richard Purdie wrote:
> On Thu, 2020-04-02 at 13:08 -0500, Joshua Watt wrote:
>> Don't capture the source date epoch for recipes that are not being
>> finalized. This prevents a virtual recipe (e.g. multilib) from
>> attempting to read the source date epoch file from the non-virtual
>> recipes workdir.
>>
>> [YOCTO #13851]
>>
>> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
>> ---
>>   meta/classes/reproducible_build.bbclass | 14 ++++++++++++++
>>   1 file changed, 14 insertions(+)
> What puzzles me with this is that we're telling bitbake to ignore the
> variable for hashing purposes, yet it still goes ahead and executes it.
>
> If we decide that is a bug, we can come up with the patch that follows
> below, which I think should also fix this issue and perhaps some
> others?
>
> data/siggen: Don't expand ignored variables
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>   bitbake/lib/bb/data.py       | 4 ++--
>   bitbake/lib/bb/siggen.py     | 2 +-
>   bitbake/lib/bb/tests/data.py | 2 +-
>   3 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/bitbake/lib/bb/data.py b/bitbake/lib/bb/data.py
> index 6dc02172cb..b0683c5180 100644
> --- a/bitbake/lib/bb/data.py
> +++ b/bitbake/lib/bb/data.py
> @@ -365,7 +365,7 @@ def build_dependencies(key, keys, shelldeps, varflagsexcl, d):
>       #bb.note("Variable %s references %s and calls %s" % (key, str(deps), str(execs)))
>       #d.setVarFlag(key, "vardeps", deps)
>   
> -def generate_dependencies(d):
> +def generate_dependencies(d, whitelist):
>   
>       keys = set(key for key in d if not key.startswith("__"))
>       shelldeps = set(key for key in d.getVar("__exportlist", False) if d.getVarFlag(key, "export", False) and not d.getVarFlag(key, "unexport", False))
> @@ -380,7 +380,7 @@ def generate_dependencies(d):
>           newdeps = deps[task]
>           seen = set()
>           while newdeps:
> -            nextdeps = newdeps
> +            nextdeps = newdeps - whitelist
>               seen |= nextdeps
>               newdeps = set()
>               for dep in nextdeps:
> diff --git a/bitbake/lib/bb/siggen.py b/bitbake/lib/bb/siggen.py
> index 8bfc45235d..4c8d81c5da 100644
> --- a/bitbake/lib/bb/siggen.py
> +++ b/bitbake/lib/bb/siggen.py
> @@ -146,7 +146,7 @@ class SignatureGeneratorBasic(SignatureGenerator):
>       def _build_data(self, fn, d):
>   
>           ignore_mismatch = ((d.getVar("BB_HASH_IGNORE_MISMATCH") or '') == '1')
> -        tasklist, gendeps, lookupcache = bb.data.generate_dependencies(d)
> +        tasklist, gendeps, lookupcache = bb.data.generate_dependencies(d, self.basewhitelist)
>   
>           taskdeps, basehash = bb.data.generate_dependency_hash(tasklist, gendeps, lookupcache, self.basewhitelist, fn)
>   
> diff --git a/bitbake/lib/bb/tests/data.py b/bitbake/lib/bb/tests/data.py
> index 2b137706dd..5f195047de 100644
> --- a/bitbake/lib/bb/tests/data.py
> +++ b/bitbake/lib/bb/tests/data.py
> @@ -476,7 +476,7 @@ class Contains(unittest.TestCase):
>   class TaskHash(unittest.TestCase):
>       def test_taskhashes(self):
>           def gettask_bashhash(taskname, d):
> -            tasklist, gendeps, lookupcache = bb.data.generate_dependencies(d)
> +            tasklist, gendeps, lookupcache = bb.data.generate_dependencies(d, set())
>               taskdeps, basehash = bb.data.generate_dependency_hash(tasklist, gendeps, lookupcache, set(), "somefile")
>               bb.warn(str(lookupcache))
>               return basehash["somefile:" + taskname]
>
LGTM

Review-by: Joshua Watt <JPEWhacker@gmail.com>
