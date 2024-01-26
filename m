Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5830FC47422
	for <webhook@archiver.kernel.org>; Fri, 26 Jan 2024 11:14:51 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web11.13362.1706267683973291335
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Jan 2024 03:14:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Ow8RmIa9;
 spf=pass (domain: gmail.com, ip: 209.85.210.172, mailfrom: zboszor@gmail.com)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-6daf694b439so229720b3a.1
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Jan 2024 03:14:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706267683; x=1706872483; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1UTs1gyImEBfxR2tOoBH7Bkh/4di5GRki5z2Yx50j8s=;
        b=Ow8RmIa9UKmhJ0aqb/4xSupL5WwPlVR7q7dwEkpLWxcTMlTPTPMA9LJjdSn2/8r3Sb
         WZPLVPtP07WO42Qtw1wIDDp+YjgLlS7N0JuyV5F3yJPfco+J7fSqcrAs6EYNcSfsyj9E
         PZTbL8qR+TbWpc+T6SxNa8lCxddMtRcSaCrWeOLugIdA7auZdHz1gK+PY96apx3wyVF5
         Xx8HpuzyVckG/yxtAjJo2k/E4W43cY7/N4cw2hoBqfQchkOyca6OW7NzNz75rAW9qPl8
         8h3/liC96ujUJ9BZltVU+OmiHla0mDJQKmJHeXyG9Z5uyISpBYflsxdOfbwEdDCyhNNI
         aRHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706267683; x=1706872483;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1UTs1gyImEBfxR2tOoBH7Bkh/4di5GRki5z2Yx50j8s=;
        b=l+yBuXAZ5CN7+287T9ZSi+oEvwIBZCVjaXEwjFg9w32f6qHgUwPGB0GMAy6xtLWI6h
         uLh1DjEdf0Boc/P4GhQWbJzwloQe3Iad/loM6n5D7qxgVlWxp8N6Fu3v/B60sHLDkpsc
         usGpKyvnkCx1vMGt9OytLd3IYvYWo+z98afqHn2SGDKKW9Qtm8b9ScmaMnm1rZ//Erw4
         cKhlzyZrG7oaWwutHZLv4meDkxHW8NAfVTrI3sK/4/c8s1F0kzPbF4gXywEuG3EoI1K/
         DC7ID80yCb9tUYp6JBDFoVYSCkMh4of1yy0MNL9/Gd9TrHJV4i6oq8DrAkVdNjDVb1S6
         LYGw==
X-Gm-Message-State: AOJu0YxPihTgkWOWB7+f2ThciHCo2E0Xex+N1nC4PY0WgeOUE6fPQCK9
	VJdyYOFGq0w+gkywb/raFvrsDjBLYVSB5PoYBW0i3SPgfVNGdcAErpmx4IvC
X-Google-Smtp-Source: AGHT+IH08HPKeE5jacL9rTlvTgXECqfpaGqT1DtSbvx3c/e1JE6rzj/SIPoEJ4QcPinKHpvmzthHww==
X-Received: by 2002:a05:6a20:d38e:b0:19c:89b3:e35 with SMTP id iq14-20020a056a20d38e00b0019c89b30e35mr415869pzb.73.1706267682997;
        Fri, 26 Jan 2024 03:14:42 -0800 (PST)
Received: from [192.168.2.143] (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id bi9-20020a170902bf0900b001d7907eb711sm775417plb.182.2024.01.26.03.14.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Jan 2024 03:14:42 -0800 (PST)
Message-ID: <fdb4acea-aa26-402c-929e-5a2a789884f5@gmail.com>
Date: Fri, 26 Jan 2024 12:14:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] bb.utils.vercmp_string_op() vs Python 3.12
Content-Language: en-US
To: Martin Jansa <martin.jansa@gmail.com>
Cc: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
References: <4ed80c78-5940-454d-b4a7-a820f04f0f08@gmail.com>
 <CA+chaQfrEKrfFDEKt3__x1pg2SPApqU60e8RWOYHPOvmUDGcpg@mail.gmail.com>
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
In-Reply-To: <CA+chaQfrEKrfFDEKt3__x1pg2SPApqU60e8RWOYHPOvmUDGcpg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Jan 2024 11:14:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194352

2024. 01. 26. 11:53 keltezéssel, Martin Jansa írta:
> > I copied vercmp_string_op() and all others called by it from bitbake/lib/bb/utils.py 
> into a new python script.
>
> It's not an issue in vercmp_string_op itself,

I already know this.
Apparently you haven't read my mail fully for the conclusion.

> but the version value it gets from waf --version isn't just the version itself but also 
> SyntaxWarning from waf.

That is not a problem in itself as the preceding call only collects the stdout:

result = subprocess.check_output([python, wafbin, '--version'], cwd=subsrcdir, 
stderr=subprocess.STDOUT)

SyntaxWarning goes (or should go) to stderr.

When this part is moved into a minimal test case, there is no error at all.

The error only happens inside bitbake and there was no such problem
with Python 3.11.x or earlier.

Ergo, the problem must be a Python 3.12 issue.
The actual version here is python3-3.12.1-2.fc39.x86_64 for me.

> So you need to update waf in jack not to trigger SyntaxWarning when waf --version is called.
>
> On Fri, Jan 26, 2024 at 10:17 AM Zoltan Boszormenyi <zboszor@gmail.com> wrote:
>
>     Hi,
>
>     Just a FYI.
>
>     After the bitbake-server getting stuck after bitbake exited
>     with Python 3.12 issue was fixed, here's another one.
>
>     This time it's semi-reliably triggered by the jack recipe
>     in meta-openembedded:
>
>     ERROR: jack-1.19.22-r0 do_configure: Error executing a python function in
>     exec_func_python() autogenerated:
>
>     The stack trace of python calls that resulted in this exception/failure was:
>     File: 'exec_func_python() autogenerated', lineno: 2, function: <module>
>           0001:
>       *** 0002:waf_preconfigure(d)
>           0003:
>     File:
>     '/home/zozo/test-yocto-4.3-gh/conf/../layers/openembedded-core/meta/classes-recipe/waf.bbclass',
>
>     lineno: 58, function: waf_preconfigure
>           0054:    wafbin = os.path.join(subsrcdir, 'waf')
>           0055:    try:
>           0056:        result = subprocess.check_output([python, wafbin, '--version'],
>     cwd=subsrcdir, stderr=subprocess.STDOUT)
>           0057:        version = result.decode('utf-8').split()[1]
>       *** 0058:        if bb.utils.vercmp_string_op(version, "1.8.7", ">="):
>           0059:            d.setVar("WAF_EXTRA_CONF", "--bindir=${bindir}
>     --libdir=${libdir}")
>           0060:    except subprocess.CalledProcessError as e:
>           0061:        bb.warn("Unable to execute waf --version, exit code %d. Assuming waf
>     version without bindir/libdir support." % e.returncode)
>           0062:    except FileNotFoundError:
>     File: '/home/zozo/test-yocto-4.3-gh/bitbake/lib/bb/utils.py', lineno: 150, function:
>     vercmp_string_op
>           0146:    Compare two versions and check if the specified comparison operator
>     matches
>     the result of the comparison.
>           0147:    This function is fairly liberal about what operators it will accept
>     since
>     there are a variety of styles
>           0148:    depending on the context.
>           0149:    """
>       *** 0150:    res = vercmp_string(a, b)
>           0151:    if op in ('=', '=='):
>           0152:        return res == 0
>           0153:    elif op == '<=':
>           0154:        return res <= 0
>     File: '/home/zozo/test-yocto-4.3-gh/bitbake/lib/bb/utils.py', lineno: 140, function:
>     vercmp_string
>           0136:    return r
>           0137:
>           0138:def vercmp_string(a, b):
>           0139:    """ Split version strings and compare them """
>       *** 0140:    ta = split_version(a)
>           0141:    tb = split_version(b)
>           0142:    return vercmp(ta, tb)
>           0143:
>           0144:def vercmp_string_op(a, b, op):
>     File: '/home/zozo/test-yocto-4.3-gh/bitbake/lib/bb/utils.py', lineno: 91, function:
>     split_version
>           0087:    """Split a version string into its constituent parts (PE, PV, PR)"""
>           0088:    s = s.strip(" <>=")
>           0089:    e = 0
>           0090:    if s.count(':'):
>       *** 0091:        e = int(s.split(":")[0])
>           0092:        s = s.split(":")[1]
>           0093:    r = ""
>           0094:    if s.count('-'):
>           0095:        r = s.rsplit("-", 1)[1]
>     Exception: ValueError: invalid literal for int() with base 10: 'SyntaxWarning'
>
>     ERROR: Logfile of failure stored in:
>     /home/zozo/test-yocto-4.3-gh/tmp-sicom-glibc/work/corei7-64-oe-linux/jack/1.19.22/temp/log.do_configure.1709417
>
>     "Semi-reliably", i.e. about 50-50 or 60-40 percent failure vs success rate.
>     Usually the second run succeeds after a failure.
>
>     I copied vercmp_string_op() and all others called by it
>     from bitbake/lib/bb/utils.py into a new python script as a
>     minimum test case. Running this script inside a locally
>     cloned jack git repository has 100% success rate.
>
>     It looks like an internal Python "flake" issue.
>
>     Best regards,
>     Zoltán Böszörményi
>
>
>     -=-=-=-=-=-=-=-=-=-=-=-
>     Links: You receive all messages sent to this group.
>     View/Reply Online (#194348):
>     https://lists.openembedded.org/g/openembedded-core/message/194348
>     Mute This Topic: https://lists.openembedded.org/mt/103973063/3617156
>     Group Owner: openembedded-core+owner@lists.openembedded.org
>     <mailto:openembedded-core%2Bowner@lists.openembedded.org>
>     Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub
>     [martin.jansa@gmail.com]
>     -=-=-=-=-=-=-=-=-=-=-=-
>


