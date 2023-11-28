Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C266C4167B
	for <webhook@archiver.kernel.org>; Tue, 28 Nov 2023 09:26:15 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
 by mx.groups.io with SMTP id smtpd.web11.29030.1701163573428042848
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Nov 2023 01:26:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JX0jN/c8;
 spf=pass (domain: gmail.com, ip: 209.85.208.50, mailfrom: zboszor@gmail.com)
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-54bb9024378so200448a12.3
        for <openembedded-core@lists.openembedded.org>; Tue, 28 Nov 2023 01:26:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701163572; x=1701768372; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SnCO+FzGbiO0UOU+Mc2MNFllTUH70F1jau8DgKaTX4c=;
        b=JX0jN/c8hi3vNr2ylbpCHNM/QkZ39VGYYiPggD0PfE215JrAA/zbW+rs9hjcOypx56
         HXlR37bYyNF5WB1BR1N+llX6ZD31OfQcQDvMcPrIcKBFVxDEBaL1uuy33iZx741YXVEM
         ewv9jwZESPMY5M+Bbh+wmiCqYxIUm/RKpz/RSsZVyWDrWAYHSJoIRdMJkn7ELMTWaJwx
         V+aUNqD3/LytENl615P9e1XNrChyR31/Z8Xia1ruj9PiTuISymNA3+yX2W6B2+IO/Qfl
         hcHxloSdQY6c+1zpHXgerOggN9JsVrRUAC+osCglmc20aO6Wq9bA9dS1MVPBzKGiuL7d
         F5OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701163572; x=1701768372;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SnCO+FzGbiO0UOU+Mc2MNFllTUH70F1jau8DgKaTX4c=;
        b=L4ERq1Qk5lgKG6NxAheaja5WGCw9l5Mc6Aygf22JD98iPT9g4YK3LOld4lHvdixJ/t
         uxZqUfWYzm21GjfqnxiZ5kQvXjityyXv1E8kB1NgvdsxP+1e52tcZfj+hmodF0HPk/OJ
         KSLoY6w42WKFnpjCjf/ZmCl1KaIkKda6Gm1i+R880N6BzPAk2bubfHvT07Zn1ffRUrfc
         FULh0RIf7CSpfSkQdzapoe600mWmf6YCSFasCEsCBj/xwJXgwf/8gpeZoir7w1qJNUnN
         6h8mfmHMnw5QiyBthLK+WF5EnU7JKhAUfYMP/SozEJa+3Bp/UwUAX2BlInljP9xp3OBb
         UA3Q==
X-Gm-Message-State: AOJu0YwFeoztyPAGsFbAQqV+IUv0eTtUctwzXfbvOP0chQH6kjc66eFt
	5YLhKNf/WJTVJ6Ghk6NRZhw=
X-Google-Smtp-Source: AGHT+IHcLfYzAp1xNo/amRH1kCNB8Bqli9escDEFF5HHpVgqMqCKzvBhDSdmC1xxXVQEtXYCqXi7Zg==
X-Received: by 2002:a17:906:209e:b0:a0a:f9af:c159 with SMTP id 30-20020a170906209e00b00a0af9afc159mr8586363ejq.25.1701163571583;
        Tue, 28 Nov 2023 01:26:11 -0800 (PST)
Received: from [192.168.2.2] (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id bx1-20020a170906a1c100b009ddf38056f8sm6519942ejb.118.2023.11.28.01.26.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Nov 2023 01:26:11 -0800 (PST)
Message-ID: <29c6bdd6-72bf-48f6-9a8a-eb15c1225ba1@gmail.com>
Date: Tue, 28 Nov 2023 10:26:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] bitbake-server does not exit after build ends
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
References: <3cd66d19-6e0c-4b1b-a990-723cd445698f@gmail.com>
 <1be4aa623d61e40f52466e1cc3b65c4543b39b20.camel@linuxfoundation.org>
 <25c15f7d-d1e8-427f-a1ab-6edb854daaa0@gmail.com>
 <CA+chaQdMrEWZkXfyX=cGDt9uD0JodDFK68cedzGVN2fMDRh+Qg@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
In-Reply-To: <CA+chaQdMrEWZkXfyX=cGDt9uD0JodDFK68cedzGVN2fMDRh+Qg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Nov 2023 09:26:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191349

So it's not just Fedora, but Python 3.12 in general.

Googling for problem with threads + fork reveals that
it is indeed an issue even in C / POSIX: only the thread
executing fork() will become part of the new process,
but not the main process starting the thread or any
other threads from the original process.

The warning is justified, and apparently the issue
not occurring in bitbake with previous Python versions
is pure luck.

2023. 11. 27. 14:14 keltezéssel, Martin Jansa írta:
> I can confirm the same on gentoo with python-3.12.
>
> On Mon, Nov 27, 2023 at 12:29 PM Zoltan Boszormenyi <zboszor@gmail.com> wrote:
>
>     2023. 11. 27. 11:52 keltezéssel, Richard Purdie írta:
>     > Is there anything interesting in the bitbake-cookerdaemon.log file?
>
>     Actually, yes.
>
>     This is obviously the most suspicious:
>
>     /usr/lib64/python3.12/multiprocessing/popen_fork.py:66: DeprecationWarning: This
>     process
>     (pid=1605202) is multi-threaded, use of fork() may lead to deadlocks in the child.
>        self.pid = os.fork()
>     /home/zozo/test-yocto-4.3/bitbake/bin/bitbake-worker:210: DeprecationWarning: This
>     process
>     (pid=1605590) is multi-threaded, use of fork() may lead to deadlocks in the child.
>        pid = os.fork()
>     /home/zozo/test-yocto-4.3/bitbake/bin/bitbake-worker:210: DeprecationWarning: This
>     process
>     (pid=1607833) is multi-threaded, use of fork() may lead to deadlocks in the child.
>        pid = os.fork()
>
>     There are a few other deprecation warnings, too,
>     which are not relevant to this particular problem
>     but may be interesting for the future, nevertheless:
>
>     /home/zozo/test-yocto-4.3/bitbake/lib/bb/codeparser.py:260: DeprecationWarning:
>     ast.Str is
>     deprecated and will be removed in Python 3.14; use ast.Constant instead
>        if name in self.containsfuncs and isinstance(node.args[1], ast.Str):
>     /home/zozo/test-yocto-4.3/bitbake/lib/bb/codeparser.py:263: DeprecationWarning:
>     Attribute
>     s is deprecated and will be removed in Python 3.14; use value instead
>        self.contains[varname].add(node.args[1].s)
>
>     ruby.bbclass has a lot of these at different line numbers:
>
>     /home/zozo/test-yocto-4.3/conf/../layers/meta-cloud-services/classes/ruby.bbclass:28:
>     SyntaxWarning: invalid escape sequence '\.'
>        r = re.compile("ruby ([0-9]+\.[0-9]+\.[0-9]+)*")
>
>     These lines occur at the end (probably normal):
>
>     1605202 10:39:58.854287 Parse cache valid
>     1605202 10:40:13.098694 Registering idle function <function
>     BBCooker.buildTargets.<locals>.buildTargetsIdle at 0x7fa3e22e79c0>
>     1605202 10:40:13.098736 Removing idle function <bound method Command.runAsyncCommand of
>     <bb.command.Command object at 0x7fa41259d580>>
>     1605202 12:17:02.357378 Running command ['stateShutdown']
>     1605202 12:17:02.357622 Sending reply (None, None)
>     1605202 12:17:02.357819 Command Completed (socket: True)
>
>     And the remaining child processes:
>
>     $ ps auxw | grep bitb | grep -v grep
>     zozo     1605202  2.3  3.5 1333384 1151808 ?     Sl   10:39 2:29 /usr/bin/python3
>     /home/zozo/test-yocto-4.3/bitbake/bin/bitbake-server decafbad 3 5
>     /home/zozo/test-yocto-4.3/bitbake-cookerdaemon.log
>     /home/zozo/test-yocto-4.3/bitbake.lock
>     /home/zozo/test-yocto-4.3/bitbake.sock 0 0 None 0
>     zozo     1605208  0.0  1.4 559372 466260 ?       S    10:39 0:00 /usr/bin/python3
>     /home/zozo/test-yocto-4.3/bitbake/bin/bitbake-server decafbad 3 5
>     /home/zozo/test-yocto-4.3/bitbake-cookerdaemon.log
>     /home/zozo/test-yocto-4.3/bitbake.lock
>     /home/zozo/test-yocto-4.3/bitbake.sock 0 0 None 0
>
>
>     -=-=-=-=-=-=-=-=-=-=-=-
>     Links: You receive all messages sent to this group.
>     View/Reply Online (#191294):
>     https://lists.openembedded.org/g/openembedded-core/message/191294
>     Mute This Topic: https://lists.openembedded.org/mt/102826186/3617156
>     Group Owner: openembedded-core+owner@lists.openembedded.org
>     <mailto:openembedded-core%2Bowner@lists.openembedded.org>
>     Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub
>     [martin.jansa@gmail.com]
>     -=-=-=-=-=-=-=-=-=-=-=-
>


