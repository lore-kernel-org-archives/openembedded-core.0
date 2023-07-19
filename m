Return-Path: <hayama@lineo.co.jp>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E31AEB64DC
	for <webhook@archiver.kernel.org>; Wed, 19 Jul 2023 01:48:43 +0000 (UTC)
Received: from mail.lineo.co.jp (mail.lineo.co.jp [203.141.200.203])
 by mx.groups.io with SMTP id smtpd.web11.4698.1689731322164610021
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Jul 2023 18:48:42 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: lineo.co.jp, ip: 203.141.200.203, mailfrom: hayama@lineo.co.jp)
Received: from [172.31.7.30] (vpn1.lineo.co.jp [203.141.200.204])
	by mail.lineo.co.jp (Postfix) with ESMTPSA id 8D81580F7D402;
	Wed, 19 Jul 2023 10:48:39 +0900 (JST)
Message-ID: <80e8328b-6820-28aa-c2fe-6a73ddad3d01@lineo.co.jp>
Date: Wed, 19 Jul 2023 10:48:40 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [OE-core] systemd service@ bug
Content-Language: en-US
To: Dvorkin Dmitry <dvorkin@tibbo.com>,
 openembedded-core@lists.openembedded.org
References: <3d682b83-f0e8-7add-3dcd-3e850e30f7c6@tibbo.com>
From: Yuta Hayama <hayama@lineo.co.jp>
In-Reply-To: <3d682b83-f0e8-7add-3dcd-3e850e30f7c6@tibbo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Jul 2023 01:48:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184564

Hi,

This issue has been fixed in master.
https://git.openembedded.org/openembedded-core/commit/?id=d18b939fb08b37380ce95934da38e6522392621c

But, yes. This patch has not yet been backported to the any stable branch.


I don't know about the maintenance process for the stable branch, but I
expect that patch will probably be queued and backported to dunfell in
a month or so.

Please let me know if anyone knows anything about this. Should we simply
wait? Or do I have to submit a backport request?


Regards,

Yuta Hayama

On 2023/07/14 22:42, Dvorkin Dmitry wrote:
> Hello!
> 
> (sorry, previously posted as the reply to wrong message)
> 
> starting from 2aa82324d43467e7c8bfbbb59570ee3306264b75 commit (dunfell and probably other branches)
> 
> https://git.openembedded.org/openembedded-core/commit/?h=dunfell&id=2aa82324d43467e7c8bfbbb59570ee3306264b75
> 
> the
> 
> SYSTEMD_SERVICE:${PN} = "php-fpm@9000.service"
> 
> syntax in the recipe brings OE to error at do_rootfs step:
> 
> https://pastebin.com/WbDCPy4V
> 
> 
> + for service in php-fpm@9000.service
> + systemctl --root=/workdir/build.tppg2/tmp/work/tppg2-tps-linux-gnueabi/img-oac
> -anpr/1.0-r0/rootfs enable php-fpm@9000.service
> Traceback (most recent call last):
> File "/workdir/build.tppg2/tmp/work/tppg2-tps-linux-gnueabi/img-oac-anpr/1.0-r
> 0/recipe-sysroot-native/usr/bin/systemctl", line 331, in <module>
> main()
> File "/workdir/build.tppg2/tmp/work/tppg2-tps-linux-gnueabi/img-oac-anpr/1.0-r
> 0/recipe-sysroot-native/usr/bin/systemctl", line 319, in main
> SystemdUnit(root, service).enable()
> File "/workdir/build.tppg2/tmp/work/tppg2-tps-linux-gnueabi/img-oac-anpr/1.0-r
> 0/recipe-sysroot-native/usr/bin/systemctl", line 232, in enable
> self._process_deps(config, service, path, 'WantedBy', 'wants', instance)
> File "/workdir/build.tppg2/tmp/work/tppg2-tps-linux-gnueabi/img-oac-anpr/1.0-r
> 0/recipe-sysroot-native/usr/bin/systemctl", line 192, in _process_deps
> dependent = re.sub("([^%](%%)*)%i", "\\1{}".format(instance), dependent)
> File "/workdir/build.tppg2/tmp/work/tppg2-tps-linux-gnueabi/img-oac-anpr/1.0-r
> 0/recipe-sysroot-native/usr/lib/python3.8/re.py", line 210, in sub
> return _compile(pattern, flags).sub(repl, string, count)
> File "/workdir/build.tppg2/tmp/work/tppg2-tps-linux-gnueabi/img-oac-anpr/1.0-r
> 0/recipe-sysroot-native/usr/lib/python3.8/re.py", line 327, in _subx
> template = _compile_repl(template, pattern)
> File "/workdir/build.tppg2/tmp/work/tppg2-tps-linux-gnueabi/img-oac-anpr/1.0-r
> 0/recipe-sysroot-native/usr/lib/python3.8/re.py", line 318, in _compile_repl
> return sre_parse.parse_template(repl, pattern)
> File "/workdir/build.tppg2/tmp/work/tppg2-tps-linux-gnueabi/img-oac-anpr/1.0-r
> 0/recipe-sysroot-native/usr/lib/python3.8/sre_parse.py", line 1036, in parse_tem
> plate
> addgroup(int(this[1:]), len(this) - 1)
> File "/workdir/build.tppg2/tmp/work/tppg2-tps-linux-gnueabi/img-oac-anpr/1.0-r
> 0/recipe-sysroot-native/usr/lib/python3.8/sre_parse.py", line 980, in addgroup
> raise s.error("invalid group reference %d" % index, pos)
> re.error: invalid group reference 19 at position 1
> %post(oac-php-1.0-r0.noarch): waitpid(3549888) rc 3549888 status 100
> warning: %post(oac-php-1.0-r0.noarch) scriptlet failed, exit status 1
> Error in POSTIN scriptlet in rpm package oac-php
> Installing : curl-7.69.1-r0.cortexa9hf_neon 849/863
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#184264): https://lists.openembedded.org/g/openembedded-core/message/184264
> Mute This Topic: https://lists.openembedded.org/mt/100140897/7729851
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [hayama@lineo.co.jp]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

