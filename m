Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E6F9C4167B
	for <webhook@archiver.kernel.org>; Mon, 27 Nov 2023 11:29:08 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web10.92836.1701084547072620049
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Nov 2023 03:29:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=iJkvQVc9;
 spf=pass (domain: gmail.com, ip: 209.85.218.42, mailfrom: zboszor@gmail.com)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-9fa45e75ed9so563819166b.1
        for <openembedded-core@lists.openembedded.org>; Mon, 27 Nov 2023 03:29:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701084545; x=1701689345; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tCl8CjcXg8YhC26RHThBarcOlg0uHuswNsKoiqU/pyg=;
        b=iJkvQVc9VEVTBONM8OGPOPnb3o2F/4NkHaFI5/I++wCg4QIfxRdWgQWiHi7JZL3enS
         q8fXhFsyAu427BSjUT8pFH1mxXD5FHevHJdd+efxE4TuRJc4AeMJ7XpiIOApVgeV2sk2
         2U1PlPYLuLvfjo9jj3Y4il7BciUpfcwbMyb4U3HEDdS09ReiCjBqZHSUCR7N3n2tLHsp
         4UfU/EFRWyLrdkmqUmS5eqEi/V9SPyXllttAnAI47UOTMXmY88i0tF5aoJIS2KqvEcGQ
         DUfI0NKRvZ5ciODbGvMiRSjkWR636rZvND95MQLrpsVftIttpthgqNjcoLU9MI9skqwH
         GRVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701084545; x=1701689345;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tCl8CjcXg8YhC26RHThBarcOlg0uHuswNsKoiqU/pyg=;
        b=qvqCIIeqmb6FDJKhfJODoevt7toCNh3M5CeJCmCwdarmbt29QSiF6DGNuL1f88izbe
         ItiX6v6hktORjkoaZ2k+xA5jmLHiAMeL8vbmJZgSwMB1e1l4mgzaVae52V8S2kqAH3gy
         i5vVu/7jejXOy0AwfAAcppPOuz2xAM6PV8C1zb/YJ5DEGkx6WALCVY3h1fzJHkakjNTR
         R2KtN+fbI/kCJWo9EOwHyQJK0Msjruupqkt8L+IZiJkwnKw51bNIaLYp8pswb8JUtQ3X
         tkhG90ZAYm9CEbRvgkEZTuaK2VMU2su8o/cjaoyYYnG2hrgGuY/Xkz4nBMTSaaZWUCGw
         2d0w==
X-Gm-Message-State: AOJu0Yxe6GXWf/ZH+l664d9P3s5WHRqXjjjLJLTm7cMEec0bDF8M2phM
	a/buF2bqacKPvxj6Lr//oFU=
X-Google-Smtp-Source: AGHT+IHAQd9SeRjKQJlIS0tNGSkHVjWtktcVVK1btdohMQqWr/c/9AJhfP860dy3tlFu1fBnFh2rdA==
X-Received: by 2002:a17:906:225b:b0:a0e:2616:d91b with SMTP id 27-20020a170906225b00b00a0e2616d91bmr3327955ejr.17.1701084545284;
        Mon, 27 Nov 2023 03:29:05 -0800 (PST)
Received: from [192.168.2.2] (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id k7-20020a17090627c700b009e50ea0a05asm5627275ejc.99.2023.11.27.03.29.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Nov 2023 03:29:05 -0800 (PST)
Message-ID: <25c15f7d-d1e8-427f-a1ab-6edb854daaa0@gmail.com>
Date: Mon, 27 Nov 2023 12:29:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] bitbake-server does not exit after build ends
Content-Language: en-US
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
References: <3cd66d19-6e0c-4b1b-a990-723cd445698f@gmail.com>
 <1be4aa623d61e40f52466e1cc3b65c4543b39b20.camel@linuxfoundation.org>
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
In-Reply-To: <1be4aa623d61e40f52466e1cc3b65c4543b39b20.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Nov 2023 11:29:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191294

2023. 11. 27. 11:52 keltezéssel, Richard Purdie írta:
> Is there anything interesting in the bitbake-cookerdaemon.log file?

Actually, yes.

This is obviously the most suspicious:

/usr/lib64/python3.12/multiprocessing/popen_fork.py:66: DeprecationWarning: This process 
(pid=1605202) is multi-threaded, use of fork() may lead to deadlocks in the child.
   self.pid = os.fork()
/home/zozo/test-yocto-4.3/bitbake/bin/bitbake-worker:210: DeprecationWarning: This process 
(pid=1605590) is multi-threaded, use of fork() may lead to deadlocks in the child.
   pid = os.fork()
/home/zozo/test-yocto-4.3/bitbake/bin/bitbake-worker:210: DeprecationWarning: This process 
(pid=1607833) is multi-threaded, use of fork() may lead to deadlocks in the child.
   pid = os.fork()

There are a few other deprecation warnings, too,
which are not relevant to this particular problem
but may be interesting for the future, nevertheless:

/home/zozo/test-yocto-4.3/bitbake/lib/bb/codeparser.py:260: DeprecationWarning: ast.Str is 
deprecated and will be removed in Python 3.14; use ast.Constant instead
   if name in self.containsfuncs and isinstance(node.args[1], ast.Str):
/home/zozo/test-yocto-4.3/bitbake/lib/bb/codeparser.py:263: DeprecationWarning: Attribute 
s is deprecated and will be removed in Python 3.14; use value instead
   self.contains[varname].add(node.args[1].s)

ruby.bbclass has a lot of these at different line numbers:

/home/zozo/test-yocto-4.3/conf/../layers/meta-cloud-services/classes/ruby.bbclass:28: 
SyntaxWarning: invalid escape sequence '\.'
   r = re.compile("ruby ([0-9]+\.[0-9]+\.[0-9]+)*")

These lines occur at the end (probably normal):

1605202 10:39:58.854287 Parse cache valid
1605202 10:40:13.098694 Registering idle function <function 
BBCooker.buildTargets.<locals>.buildTargetsIdle at 0x7fa3e22e79c0>
1605202 10:40:13.098736 Removing idle function <bound method Command.runAsyncCommand of 
<bb.command.Command object at 0x7fa41259d580>>
1605202 12:17:02.357378 Running command ['stateShutdown']
1605202 12:17:02.357622 Sending reply (None, None)
1605202 12:17:02.357819 Command Completed (socket: True)

And the remaining child processes:

$ ps auxw | grep bitb | grep -v grep
zozo     1605202  2.3  3.5 1333384 1151808 ?     Sl   10:39   2:29 /usr/bin/python3 
/home/zozo/test-yocto-4.3/bitbake/bin/bitbake-server decafbad 3 5 
/home/zozo/test-yocto-4.3/bitbake-cookerdaemon.log /home/zozo/test-yocto-4.3/bitbake.lock 
/home/zozo/test-yocto-4.3/bitbake.sock 0 0 None 0
zozo     1605208  0.0  1.4 559372 466260 ?       S    10:39   0:00 /usr/bin/python3 
/home/zozo/test-yocto-4.3/bitbake/bin/bitbake-server decafbad 3 5 
/home/zozo/test-yocto-4.3/bitbake-cookerdaemon.log /home/zozo/test-yocto-4.3/bitbake.lock 
/home/zozo/test-yocto-4.3/bitbake.sock 0 0 None 0


